#ifndef __ASSEMBLER__
#include "drv_mem.h"
#endif
#include "drv_base.h"
#include "drv_elf.h"
#include "drv_list.h"
#include "mm/drv_page_pool.h"
#include "mm/page_table.h"
#include "drv_util.h"
#include "md2.h"
/* Each Eapp has their own program break */
uintptr_t prog_brk;
uintptr_t drv_start_va;
uintptr_t va_top;

#define __pa(x) get_pa(x + ENC_VA_PA_OFFSET)
#define MD2_LEN 16

static inline void page_map_register()
{
	SBI_CALL5(SBI_EXT_EBI, get_page_table_root_pointer_addr(), &inv_map,
		  &ENC_VA_PA_OFFSET, EBI_MAP_REGISTER);
}

/* Initialize memory for driver, including stack, heap, page table */
void init_mem(uintptr_t _, uintptr_t id, uintptr_t mem_start,
	      uintptr_t usr_size, drv_addr_t drv_list[MAX_DRV], uintptr_t argc,
	      uintptr_t argv)
{
	ENC_PA_START = mem_start; // used only once (in the following line)
	ENC_VA_PA_OFFSET =
		EDRV_VA_START -
		ENC_PA_START; // should be updated when base is migrated
	va_top =
		EDRV_VA_START; // will increase by EMEM_SIZE after spa_init inside init_mem

	uint8_t md2hash[MD2_LEN];
	md2((void *)mem_start, usr_size, md2hash);

	enclave_id = id;

	/* Give all spare memory to stack allocator, one for drivers, one for user
   * payload */

	int cnt = 0;
	while (drv_list[cnt].drv_start) {
		drv_list[cnt].drv_start += ENC_VA_PA_OFFSET;
		drv_list[cnt].drv_end += ENC_VA_PA_OFFSET;
		cnt++;
	}

	drv_addr_list = (drv_addr_t *)((uintptr_t)drv_list);
	drv_addr_list = (void *)(ENC_VA_PA_OFFSET + (void *)drv_addr_list);

	/* currently we assume that the page table is followed by trie*/
	uintptr_t page_table_start =
		PAGE_UP((uintptr_t)drv_list + 64 * sizeof(drv_addr_t));
	uintptr_t page_table_size = PAGE_UP(PAGE_DIR_POOL * EPAGE_SIZE);
	uintptr_t page_table_end  = page_table_start + page_table_size;
	set_page_table_root(page_table_start);

	uintptr_t trie_start = page_table_end;
	uintptr_t trie_size =
		PAGE_UP(PAGE_DIR_POOL * 4 * 512 + 4); // 4 for trie.cnt
	uintptr_t trie_end = trie_start + trie_size;

	uintptr_t base_avail_start = trie_end;
	uintptr_t base_avail_end   = mem_start + EDRV_MEM_SIZE + EUSR_MEM_SIZE;
	uintptr_t base_avail_size =
		PAGE_DOWN(base_avail_end - base_avail_start);

	spa_init(base_avail_start, base_avail_size, DRV);

	/* More delicate allocation require ELF */
	uintptr_t usr_avail_start = PAGE_UP(mem_start + usr_size);
	uintptr_t usr_avail_size  = EUSR_MEM_SIZE - usr_size;
	spa_init(usr_avail_start, PAGE_DOWN(usr_avail_size), USR);

	/* Load ELF running inside enclave */
	uintptr_t usr_pc = elf_load(0, mem_start, USR, &prog_brk);

	if (drv_list) {
		// if (drv_list != 0 && drv_list[cnt].drv_start != 0) {
		uintptr_t drv_pa_start =
			PAGE_DOWN(drv_list[0].drv_start - ENC_VA_PA_OFFSET);
		uintptr_t drv_pa_end = PAGE_UP(((uintptr_t)drv_list) +
					       64 * sizeof(drv_addr_t));
		size_t n_drv_pages   = (drv_pa_end - drv_pa_start) >> 12;
		map_page(NULL, PAGE_DOWN(drv_list[0].drv_start), drv_pa_start,
			 n_drv_pages, PTE_V | PTE_R | PTE_X | PTE_W | PTE_C);
	}
	/* base driver remaining mem */
	/* thus easier manupilating satp */
	map_page(NULL, ENC_VA_PA_OFFSET + usr_avail_start, usr_avail_start,
		 PAGE_DOWN(usr_avail_size) >> EPAGE_SHIFT,
		 PTE_V | PTE_W | PTE_R | PTE_C);

	/* user stack R/W */
	size_t n_user_stack_pages =
		(PAGE_UP(EUSR_STACK_SIZE) >> EPAGE_SHIFT) + 1;
	uintptr_t usr_stack_start = EUSR_STACK_START;
	uintptr_t usr_stack_end	  = EUSR_STACK_END;
	alloc_page(NULL, usr_stack_start, n_user_stack_pages,
		   PTE_V | PTE_W | PTE_R | PTE_U | PTE_C, USR);
	uintptr_t usr_sp = usr_stack_end;

	/* Try map pages */
	/* base driver .text section */
	extern char _text_start, _text_end;
	uintptr_t text_start	 = (uintptr_t)&_text_start;
	uintptr_t text_end	 = (uintptr_t)&_text_end;
	uintptr_t text_size	 = text_end - text_start;
	size_t n_base_text_pages = (PAGE_UP(text_size)) >> EPAGE_SHIFT;
	map_page(NULL, ENC_VA_PA_OFFSET + text_start, text_start,
		 n_base_text_pages, PTE_V | PTE_X | PTE_R | PTE_C);

	/* page_table */
	map_page(NULL, ENC_VA_PA_OFFSET + page_table_start, page_table_start,
		 (page_table_size + trie_size) >> EPAGE_SHIFT,
		 PTE_V | PTE_W | PTE_R | PTE_C);

	/* base driver .rodata section */
	extern char _rodata_start, _rodata_end;
	uintptr_t rodata_start	   = (uintptr_t)&_rodata_start;
	uintptr_t rodata_end	   = (uintptr_t)&_rodata_end;
	uintptr_t rodata_size	   = rodata_end - rodata_start;
	size_t n_base_rodata_pages = (PAGE_UP(rodata_size)) >> EPAGE_SHIFT;
	map_page(NULL, ENC_VA_PA_OFFSET + rodata_start, rodata_start,
		 n_base_rodata_pages, PTE_V | PTE_R | PTE_C);

	/* base driver .bss section */
	extern char _bss_start, _bss_end;
	uintptr_t bss_start	= (uintptr_t)&_bss_start;
	uintptr_t bss_end	= (uintptr_t)&_bss_end;
	uintptr_t bss_size	= bss_end - bss_start;
	size_t n_base_bss_pages = (PAGE_UP(bss_size)) >> EPAGE_SHIFT;
	map_page(NULL, ENC_VA_PA_OFFSET + bss_start, bss_start,
		 n_base_bss_pages, PTE_V | PTE_W | PTE_R | PTE_C);

	/* base driver .init.data section */
	extern char _init_data_start, _init_data_end;
	uintptr_t init_data_start = (uintptr_t)&_init_data_start;
	uintptr_t init_data_end	  = (uintptr_t)&_init_data_end;
	uintptr_t init_data_size  = init_data_end - init_data_start;
	size_t n_base_init_data_pages =
		(PAGE_UP(init_data_size)) >> EPAGE_SHIFT;
	map_page(NULL, ENC_VA_PA_OFFSET + init_data_start, init_data_start,
		 n_base_init_data_pages, PTE_V | PTE_W | PTE_R | PTE_C);

	/* base driver .data section */
	extern char _data_start, _data_end;
	uintptr_t data_start	 = (uintptr_t)&_data_start;
	uintptr_t data_end	 = (uintptr_t)&_data_end;
	uintptr_t data_size	 = data_end - data_start;
	size_t n_base_data_pages = (PAGE_UP(data_size)) >> EPAGE_SHIFT;
	map_page(NULL, ENC_VA_PA_OFFSET + data_start, data_start,
		 n_base_data_pages, PTE_V | PTE_W | PTE_R | PTE_C);

	/* base driver remaining mem */
	/* thus easier manupilating satp */
	map_page(NULL, ENC_VA_PA_OFFSET + base_avail_start, base_avail_start,
		 PAGE_DOWN(base_avail_size) >> EPAGE_SHIFT,
		 PTE_V | PTE_W | PTE_R | PTE_C);

	/* base stack R/W */
	size_t n_base_stack_pages = (PAGE_UP(EDRV_STACK_SIZE)) >> EPAGE_SHIFT;
	uintptr_t drv_sp	  = EDRV_STACK_TOP - EDRV_STACK_SIZE;
	alloc_page(NULL, drv_sp, n_base_stack_pages,
		   PTE_V | PTE_W | PTE_R | PTE_C, DRV);
	drv_sp += EDRV_STACK_SIZE;

	uintptr_t satp = get_page_table_root() >> EPAGE_SHIFT;
	satp |= (uintptr_t)SATP_MODE_SV39 << SATP_MODE_SHIFT;

	/* allow S mode access U mode memory */
	uintptr_t sstatus = read_csr(sstatus);
	sstatus |= SSTATUS_SUM;
	write_csr(sstatus, sstatus);

	page_map_register(); // tell m mode where page table and inverse mapping are
	va_top += EMEM_SIZE;
	flush_dcache_range(ENC_PA_START, ENC_PA_START + EMEM_SIZE);
	// asm volatile("fence rw, rw");

	asm volatile("mv a0, %0" ::"r"((uintptr_t)(satp)));
	asm volatile("mv a1, %0" ::"r"((uintptr_t)(drv_sp)));
	asm volatile("mv a2, %0" ::"r"((uintptr_t)(usr_pc)));
	asm volatile("mv a3, %0" ::"r"((uintptr_t)(usr_sp)));
}
