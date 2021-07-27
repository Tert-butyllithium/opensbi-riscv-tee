#include <sbi/sbi_ecall_ebi_mem.h>
#include <sbi/sbi_types.h>
#include <sbi/sbi_string.h>
#include <sbi/sbi_console.h>
#include <sbi/sbi_ecall_ebi_enclave.h>
#include <sbi/riscv_asm.h>

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
static void test(uintptr_t sfn);



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
		sbi_printf("[alloc_section_for_enclave] no available mem section found\n");
		return 0;
	}
	
	sbi_printf("[alloc_section_for_enclave] section 0x%lx allocated for enclave %lx, "
			"va = 0x%lx\n",
			sec->sfn, eid, va);
	set_section_zero(sec->sfn);
	sec->owner = eid;
	sec->va = va;

	section_ownership_dump();
	
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
	const int line_len = 5; // complex version
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

	test(memory_pool[0].sfn);

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

	sbi_printf("[M mode get_pte] look for pte of va 0x%lx\n", va);
	while (1) {
		tmp_entry = root[l[i]];
		if (!tmp_entry.pte_v) {
			sbi_printf("ERROR: va:0x%lx is not valid!!!\n", va);
			return 0;
		}
		if ((tmp_entry.pte_r | tmp_entry.pte_w | tmp_entry.pte_x)) {
			sbi_printf("[M mode get_pte] pte = 0x%lx, at %p\n",
					*(uintptr_t *)&tmp_entry, &root[l[i]]);
			return &root[l[i]];
		}
		tmp  = tmp_entry.ppn << 12;
		root = (pte *)tmp;
		i++;
	}
}

static void test(uintptr_t sfn)
{
	struct section *sec = sfn_to_section(sfn);
	uintptr_t va = sec->va + 0x600000;
	uintptr_t eid = sec->owner;
	uintptr_t pt_root = eid_to_context(eid)->pt_root;
	pte *entry;

	if (!pt_root)
		return;

	sbi_printf("[M mode test] start-------------------------------------\n");

	sbi_printf("eid = %d, pt_root = 0x%lx, va = 0x%lx, section 0x%lx\n",
			(int)eid, pt_root, va, sfn);

	entry = get_pte(pt_root, va);
	sbi_printf("pte: 0x%lx, at %p\n", *(uintptr_t *)entry, entry);

	sbi_printf("[M mode test] end---------------------------------------\n");
}