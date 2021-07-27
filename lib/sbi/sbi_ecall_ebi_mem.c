#include <sbi/sbi_ecall_ebi_mem.h>
#include <sbi/sbi_types.h>
#include <sbi/sbi_string.h>
#include <sbi/sbi_console.h>
#include <sbi/sbi_ecall_ebi_enclave.h>
#include <sbi/riscv_asm.h>
#include <sbi/sbi_ecall_ebi_dma.h>

#define for_each_section_in_pool(pool, section, i) \
	for (i = 0, section = &pool[i]; \
		i < MEMORY_POOL_SECTION_NUM; \
		i++, section = &pool[i])

#define sfn_to_section(sfn) \
	&memory_pool[(sfn - (MEMORY_POOL_START >> SECTION_SHIFT))]

#define __unused __attribute__((unused)) // to be removed


struct section memory_pool[MEMORY_POOL_SECTION_NUM];


static struct section *find_avail_section(void);
static void pmp_allow(struct section *sec);
static void free_section(uintptr_t sfn);
static void set_section_zero(uintptr_t sfn);
static pte* get_pte(uintptr_t pt_root, uintptr_t va);
static void update_tree_pte(uintptr_t pt_root, uintptr_t delta_pa);
static inline void update_leaf_pte(uintptr_t pt_root, uintptr_t va, uintptr_t pa);
static void section_copy(uintptr_t src_sfn, uintptr_t dst_sfn);
static inverse_map* look_up_inverse_map(inverse_map* inv_map, uintptr_t pa);
__unused static void dump_inverse_map();
static void inline mem_dump(uintptr_t addr, uintptr_t len);
static inline void flush_tlb();
void flush_dcache_range(unsigned long start, unsigned long end);
void invalidate_dcache_range(unsigned long start, unsigned long end);


static inline void flush_tlb()
{
	asm volatile("sfence.vma");
}

#define L1_CACHE_BYTES 64
void flush_dcache_range(unsigned long start, unsigned long end)
{
	register unsigned long i asm("a0") = start & ~(L1_CACHE_BYTES - 1);
	for (; i < end; i += L1_CACHE_BYTES)
		asm volatile(".long 0x0295000b");	/*dcache.cpa a0*/
	asm volatile(".long 0x01b0000b");		/*sync.is*/
}

void invalidate_dcache_range(unsigned long start, unsigned long end)
{
	register unsigned long i asm("a0") = start & ~(L1_CACHE_BYTES - 1);

	for (; i < end; i += L1_CACHE_BYTES)
		asm volatile ("dcache.ipa a0");

	asm volatile (".long 0x01b0000b");
}


// eid: enclave id
// return: start physical address of the allocated section if success,
//	   zero otherwise
// this function should be followed by pmp_update
uintptr_t alloc_section_for_enclave(enclave_context *context, uintptr_t va)
{
	struct section *sec;
	uintptr_t eid = context->id;

	section_ownership_dump();

	sec = find_avail_section();
	if (!sec) {
		sbi_printf("[M mode alloc_section_for_enclave] no available mem section found\n");
		return 0;
	}
	
	sbi_printf("[M mode alloc_section_for_enclave] section 0x%lx allocated for enclave %lx, "
			"va = 0x%lx\n",
			sec->sfn, eid, va);
	set_section_zero(sec->sfn);
	sec->owner = eid;
	sec->va = va;

	section_ownership_dump();


	// -------------------------- migration test -----------------------------
	// uintptr_t base_sfn = SECTION_DOWN(context->pt_root_addr) >> SECTION_SHIFT;
	// sbi_printf("[M mode alloc_section_for_enclave] base_sfn = 0x%lx\n", base_sfn);
	// if (base_sfn)
	// 	section_migration(base_sfn, base_sfn + 3);

	// -----------------------------------------------------------------------

	
	for (int i = PMP_REGION_MAX - 1; i >= 0; i--) {
		if (context->pmp_reg[i].used)
			continue;
		context->pmp_reg[i].pmp_start = (sec->sfn << SECTION_SHIFT);
		context->pmp_reg[i].pmp_size = SECTION_SIZE;
		context->pmp_reg[i].used = 1;
		break;
	}

	return (sec->sfn) << SECTION_SHIFT;
}

__unused void init_memory_pool()
{
	int i;
	struct section *sec;

	for_each_section_in_pool(memory_pool, sec, i) {
		sec->sfn = (MEMORY_POOL_START + i * SECTION_SIZE)
				>> SECTION_SHIFT;
		sec->owner = -1;
	}

	sbi_printf("[init_memory_pool] memory pool init successed!"
		"start = 0x%x, end = 0x%x, num = %u\n",
		MEMORY_POOL_START, MEMORY_POOL_END, MEMORY_POOL_SECTION_NUM);

	return;
}

static struct section *find_avail_section()
{
	int i;
	struct section *sec;

	for_each_section_in_pool(memory_pool, sec, i) {
		if (sec->owner < 0)
			return sec;
	}

	return NULL;
}

__unused static void pmp_allow(struct section *sec)
{
	pmp_allow_region(sec->sfn << SECTION_SHIFT, SECTION_SIZE);
	return;
}

static void pmp_withdraw(struct section *sec)
{
	return;
}

static void free_section(uintptr_t sfn)
{
	struct section *sec = sfn_to_section(sfn);
	
	if (sec->owner < 0)
		return;

	sbi_printf("[free_section] freeing section 0x%lx\n", sfn);

	// clear memory
	set_section_zero(sfn);

	// configure pmp. previous owner may no longer access it.
	pmp_withdraw(sec);

	sec->owner = -1;
	sec->va = 0;

	return;
}

void free_section_for_enclave(int eid)
{
	int i;
	struct section *sec;

	section_ownership_dump();

	for_each_section_in_pool(memory_pool, sec, i) {
		if (sec->owner == eid)
			free_section(sec->sfn);
	}

	section_ownership_dump();
}

void section_ownership_dump()
{
	int i, j;
	struct section *sec;
	const int line_len = 4; // complex version
	// const int line_len = 32; // brief version

	// complex version
	sbi_printf("[M mode section_ownership_dump start]-------------------------\n");
	for (j = 0; j < MEMORY_POOL_SECTION_NUM; j += line_len) {
		for (i = 0, sec = &memory_pool[i+j];
				i < line_len;
				i++, sec = &memory_pool[i+j])
			sbi_printf("0x%lx: 0x%lx\t", sec->sfn, sec->va);
		sbi_printf("\n");
	}

	// brief version (do not delete)

	// for (j = 0; j < MEMORY_POOL_SECTION_NUM; j += line_len) {

	// 	for (i = 0, sec = &memory_pool[i+j];
	// 			i < line_len && i + j < MEMORY_POOL_SECTION_NUM;
	// 			i++, sec = &memory_pool[i+j]) {
	// 		if (sec->owner < 0)
	// 			sbi_printf("x");
	// 		else
	// 			sbi_printf("%d", sec->owner);
	// 	}
	// 	sbi_printf("\n");
		
	// }

	sbi_printf("[M mode section_ownership_dump end]---------------------------\n");
}

static void set_section_zero(uintptr_t sfn)
{
	char *s = (char *)(sfn << SECTION_SHIFT);
	sbi_printf("[set_section_zero] section start: %p\n", s);
	sbi_memset(s, 0, SECTION_SIZE);
	sbi_printf("[set_section_zero] setting zero done\n");
}

/**
 * @brief Get the pte pointer
 * 
 * @param pt_root 
 * @param va 
 * @return pte* 
 */
static pte* get_pte(uintptr_t pt_root, uintptr_t va)
{
	uintptr_t l[] = { (va & MASK_L2) >> 30, (va & MASK_L1) >> 21,
			  (va & MASK_L0) >> 12 };
	pte *root = (pte *)pt_root;
	pte tmp_entry;
	uintptr_t tmp;
	int i = 0;

	// sbi_printf("[M mode get_pte] look for pte of va 0x%lx, root at 0x%p\n",
			// va, root);
	while (1) {
		tmp_entry = root[l[i]];
		if (!tmp_entry.pte_v) {
			return NULL; // page that is not mapped
		}
		if ((tmp_entry.pte_r | tmp_entry.pte_w | tmp_entry.pte_x)) {
			// sbi_printf("[M mode get_pte] pte = 0x%lx, at %p\n",
					// *(uintptr_t *)&tmp_entry, &root[l[i]]);
			return &root[l[i]];
		}
		tmp  = tmp_entry.ppn << 12;
		root = (pte *)tmp;
		i++;
	}
}

static void inline mem_dump(uintptr_t addr, uintptr_t len)
{
	sbi_printf("[M mode mem_dump] start ----------------------");
	unsigned char *ptr = (unsigned char *)addr;
	for (int i = 0; i < len; i++) {
		if (i % 8 == 0)
			sbi_printf("\n0x%p:\t", ptr);
		sbi_printf("0x%x\t", *ptr++);
	}
	sbi_printf("\n[M mode mem_dump] end ------------------------\n");
}

static void section_copy(uintptr_t src_sfn, uintptr_t dst_sfn)
{
	// should use DMA on D1
	uintptr_t dst_pa = dst_sfn << SECTION_SHIFT;
	uintptr_t src_pa = src_sfn << SECTION_SHIFT;
	sbi_printf("[M mode section copy] copying from 0x%lx to 0x%lx\n",
			src_pa, dst_pa);

	// sbi_memcpy((void *)dst_pa, (void *)src_pa, SECTION_SIZE);
	dma_copy(src_pa, dst_pa, SECTION_SIZE);
	// mem_dump(src_pa, 256);
	// mem_dump(dst_pa, 256);
}

// update non-leaf pte recursively
static void update_tree_pte(uintptr_t root, uintptr_t delta_pa)
{
	pte *entry = (pte *)root;
	uintptr_t next_level;
	int i;

	for (i = 0; i < 512; i++, entry++) {
		// leaf pte
		if (entry->pte_r || entry->pte_w || entry->pte_x) {
			return;
		}

		// empty pte
		if (!entry->pte_v) {
			continue;
		}

		entry->ppn += delta_pa >> EPAGE_SHIFT;

		next_level = (uintptr_t)entry->ppn << EPAGE_SHIFT;
		update_tree_pte(next_level, delta_pa);
	}
}

static inline void update_leaf_pte(uintptr_t pt_root, uintptr_t va, uintptr_t pa)
{
	pte *entry = get_pte(pt_root, va);
	// -----------
	if (va <= 0x10000000)
		sbi_printf("[M mode update_leaf_pte] va = 0x%lx, pa = 0x%lx\n",
				va, pa);
	// -----------
	if (entry)
		entry->ppn = pa >> EPAGE_SHIFT;
}

// returns the inverse map entry if found
static inverse_map* look_up_inverse_map(inverse_map* inv_map, uintptr_t pa)
{
	// region search
	// for (int i = 0; inv_map[i].pa && i < INVERSE_MAP_ENTRY_NUM; i++) {
	// 	if (inv_map[i].pa <= pa
	// 	&& pa < inv_map[i].pa + inv_map[i].count * EPAGE_SIZE)
	// 		return &inv_map[i];
	// }

	// entry search (assume properly invoked)
	for (int i = 0; inv_map[i].pa && i < INVERSE_MAP_ENTRY_NUM; i++) {
		if (inv_map[i].pa == pa)
			return &inv_map[i];
	}

	return NULL;
}

// return: 0 if failed, dst_sfn if successed
int section_migration(uintptr_t src_sfn, uintptr_t dst_sfn)
{
	struct section *src_sec = sfn_to_section(src_sfn),
		*dst_sec = sfn_to_section(dst_sfn);
	uintptr_t src_pa = src_sfn << SECTION_SHIFT;
	uintptr_t dst_pa = dst_sfn << SECTION_SHIFT;
	uintptr_t delta_addr = dst_pa - src_pa;
	uintptr_t eid = src_sec->owner;
	uintptr_t linear_start_va = src_sec->va;
	enclave_context *context = eid_to_context(eid);
	uintptr_t pt_root_addr;
	uintptr_t inv_map_addr;
	uintptr_t offset_addr;
	uintptr_t pt_root;
	char is_base_module = 0;
	uintptr_t va;
	inverse_map *inv_map_entry;
	uintptr_t satp;

	// debug start -------
	sbi_printf("[M mode section_migration] src_pa = 0x%lx, dst_pa = 0x%lx, "
			"delta_addr = 0x%lx\n",
			src_pa, dst_pa, delta_addr);
	sbi_printf("[M mode section_migration] eid = 0x%lx\n", eid);
	sbi_printf("[M mode section_migration] linear_start_va = 0x%lx\n",
			linear_start_va);
	// debug end   -------

	if (eid < 0 || context == NULL) {
		sbi_printf("[M mode section_migration] ERROR!\n");
		return 0;
	}

	pt_root_addr 	= context->pt_root_addr;
	inv_map_addr 	= context->inverse_map_addr;
	offset_addr 	= context->offset_addr;

	// 1. judge whether the section contains a base module
	if (src_sfn == SECTION_DOWN(pt_root_addr) >> SECTION_SHIFT) {
		is_base_module = 1;
		sbi_printf("[M mode section_migration] is base module\n");
	}

	// 2. For base module, calculate the new pa of pt_root,
	//    inv_map, and va_pa_offset.
	//    Update the enclave context accordingly
	if (is_base_module) {
		context->pt_root_addr 	  += delta_addr;
		context->inverse_map_addr += delta_addr;
		context->offset_addr	  += delta_addr;
		context->pa 		  += delta_addr;
		context->drv_list 	  += delta_addr;
	
		pt_root_addr 	= context->pt_root_addr;
		inv_map_addr 	= context->inverse_map_addr;
		offset_addr 	= context->offset_addr;
	}

	// 3. Section content copy, set section va, owner
	section_copy(src_sfn, dst_sfn);
	dst_sec->owner = eid;
	dst_sec->va = linear_start_va;

	// 3.5 update pt_root value, EDRV_VA_PA_OFFSET value
	*(uintptr_t *)pt_root_addr += delta_addr; // value of pt_root update
	pt_root = *(uintptr_t *)pt_root_addr;
	satp = pt_root >> EPAGE_SHIFT;
	satp |= (uintptr_t)SATP_MODE_SV39 << SATP_MODE_SHIFT;
	csr_write(CSR_SATP, satp);

	sbi_printf("[M mode section_migration] offset_addr = 0x%lx, old value: 0x%lx ",
			offset_addr, *(uintptr_t *)offset_addr);
	*(uintptr_t *)offset_addr -= delta_addr;
	sbi_printf("new value: 0x%lx\n", *(uintptr_t *)offset_addr);

	// debug -----
	sbi_printf("[M mode section_migration] new pt_root = 0x%lx @ 0x%lx\n",
			pt_root, pt_root_addr);
	// debug -----

	// 4. Update page table
	//	a. update tree pte
	//	b. update leaf pte
	//		For each pa in the section:
	//		(1). updates its linear map pte
	//		(2). check the inverse map, update the pte if pa is
	//		     in the table and update the inverse map
	update_tree_pte(pt_root, delta_addr);

	for (uintptr_t offset = 0; offset < SECTION_SIZE; offset += EPAGE_SIZE) {
		va = linear_start_va + offset;
		update_leaf_pte(pt_root, va, dst_pa + offset);
	}

	for (uintptr_t offset = 0; offset < SECTION_SIZE; offset += EPAGE_SIZE) {
		inv_map_entry = look_up_inverse_map((inverse_map *)inv_map_addr,
							src_pa + offset);
		if (inv_map_entry) {
			for (int i = 0; i < inv_map_entry->count; i++) {
				va = inv_map_entry->va + i * EPAGE_SIZE;
				update_leaf_pte(pt_root, va,
					inv_map_entry->pa + delta_addr + i * PAGE_SIZE);
			}
			inv_map_entry->pa += delta_addr;
		}
	}


	// 5. free the src section
	free_section(src_sfn);

	// debug start ----------
	pte* tmp_pte1 = get_pte(pt_root, 0x1110eUL);
	sbi_printf("[M mode section_migration] tmp_pte1: 0x%lx\n",
			*(uintptr_t *)tmp_pte1);
	// debug end  ----------

	// 6. flush tlb, cache
	flush_tlb();
	flush_dcache_range(dst_pa, dst_pa + SECTION_SIZE);
	invalidate_dcache_range(src_pa, src_pa + SECTION_SIZE);
	

	return dst_sfn;
}

__unused static void dump_inverse_map(inverse_map *inv_map)
{
	sbi_printf("[M mode dump_inverse_map] start-------------------\n");
	for (int i = 0; i < INVERSE_MAP_ENTRY_NUM && inv_map[i].pa; i++) {
		sbi_printf("%d: pa = %lx, va = %lx, count = %d\n",
			i, inv_map[i].pa, inv_map[i].va, inv_map[i].count);

	}
	sbi_printf("[M mode dump_inverse_map] end---------------------\n");
}