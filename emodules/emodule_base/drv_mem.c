#ifndef __ASSEMBLER__
#include "drv_mem.h"
#endif
#include "drv_base.h"
#include "drv_elf.h"
#include "drv_list.h"
#include "mm/drv_page_pool.h"
#include "mm/page_table.h"
#include "drv_util.h"
/* Each Eapp has their own program break */
uintptr_t prog_brk;
uintptr_t drv_start_va;
uintptr_t va_top;

#define __pa(x) get_pa(x + ENC_VA_PA_OFFSET)


static inline void page_map_register()
{
    SBI_CALL5(SBI_EXT_EBI, get_page_table_root_pointer_addr(), 
                &inv_map, &ENC_VA_PA_OFFSET, EBI_MAP_REGISTER);
}

void loop_test()
{
    print_color("---------------------- start");
    uintptr_t cycle1, cycle2;
    for (int i = 0; i < 10; i++) {
        int j;
        cycle1 = read_csr(cycle);
        for (j = 0; j < 1000000; j++) {
            asm volatile("addi t4, t4, 1");
        }
        cycle2 = read_csr(cycle);
        printd("[loop test] cycle diff = %ld\n", cycle2 - cycle1);
    }
    print_color("---------------------- end");
}

/* Initialize memory for driver, including stack, heap, page table */
void init_mem(uintptr_t _, uintptr_t id, uintptr_t mem_start, uintptr_t usr_size, drv_addr_t drv_list[MAX_DRV], uintptr_t argc, uintptr_t argv)
{
    ENC_PA_START = mem_start; // used only once (in the following line)
    ENC_VA_PA_OFFSET = EDRV_VA_START - ENC_PA_START; // should be updated when base is migrated
    va_top = EDRV_VA_START; // will increase by EMEM_SIZE after spa_init inside init_mem

    printd("[S mode init_mem] id = %d\n", id);
    printd("[S mode init_mem] mem_start = 0x%lx\n", mem_start);
    printd("[S mode init_mem] VA_PA_OFFSET = 0x%lx\n", ENC_VA_PA_OFFSET);
    printd("[S mode init_mem] va_top at 0x%lx\n", va_top);
    enclave_id = id;

    uintptr_t stvec = read_csr(stvec);
    printd("[S mode init_mem] stvec set to 0x%lx\n", stvec);


    /* Give all spare memory to stack allocator, one for drivers, one for user
   * payload */
    extern char _start, _end;
    uintptr_t base_start = (uintptr_t)&_start;
    uintptr_t base_end = (uintptr_t)&_end;
    uintptr_t base_size = base_end - base_start;

    printd("[S mode init_mem] Enclave base_start: 0x%llx\n", &_start);
    printd("[S mode init_mem] base_end: 0x%llx\n", &_end);
    printd("[S mode init_mem] base_size: 0x%x\n", base_size);

    // extern char _drv_console_start;
    // printd("Driver console PA: 0x%08x\n", drv_console_start);

    int cnt = 0;
    printd("[S mode init_mem] drv_list[0].drv_start = 0x%x\n", drv_list[0].drv_start);
    while (drv_list[cnt].drv_start) {
        drv_list[cnt].drv_start += ENC_VA_PA_OFFSET;
        drv_list[cnt].drv_end += ENC_VA_PA_OFFSET;
        printd("[S mode init_mem] drv_list[%d].drv_start: 0x%x, drv_end: 0x%x\n", cnt, drv_list[cnt].drv_start, drv_list[cnt].drv_end);
        cnt++;
    }

    drv_addr_list = (drv_addr_t*)((uintptr_t)drv_list);
    drv_addr_list = (void*)(ENC_VA_PA_OFFSET + (void*) drv_addr_list);
    printd("\033[1;33m[S mode init_mem] drv_addr_list=%p at %p, drv_list=%p\n\033[0m",drv_addr_list, &drv_addr_list, drv_list);

    /* currently we assume that the page table is followed by trie*/
    uintptr_t page_table_start = PAGE_UP((uintptr_t)drv_list + 64 * sizeof(drv_addr_t));
    uintptr_t page_table_size = PAGE_UP(PAGE_DIR_POOL * EPAGE_SIZE);
    uintptr_t page_table_end = page_table_start + page_table_size;
    set_page_table_root(page_table_start);

    uintptr_t trie_start = page_table_end;
    uintptr_t trie_size = PAGE_UP(PAGE_DIR_POOL * 4 * 512 + 4); // 4 for trie.cnt
    uintptr_t trie_end = trie_start + trie_size;
    
    uintptr_t base_avail_start = trie_end;
    uintptr_t base_avail_end = mem_start + EDRV_MEM_SIZE + EUSR_MEM_SIZE;
    uintptr_t base_avail_size = PAGE_DOWN(base_avail_end - base_avail_start);
    printd("[S mode init_mem] base_avail_start = 0x%x, base_avail_end = 0x%x\n", base_avail_start, base_avail_end);
    printd("[S mode init_mem] base_avail_size = %x\n", base_avail_size);

    spa_init(base_avail_start, base_avail_size, DRV);
    printd("[S mode init_mem] hello1\n");
    printd("[S mode init_mem] %x\n", base_avail_start);

    // printd("initializing driver spa: 0x%x, size: 0x%x\n", base_avail_start,
    // base_avail_size); printd("driver spa initialize done\n");

    /* More delicate allocation require ELF */
    uintptr_t usr_avail_start = PAGE_UP(mem_start + usr_size);
    uintptr_t usr_avail_size = EUSR_MEM_SIZE - usr_size;
    spa_init(usr_avail_start, PAGE_DOWN(usr_avail_size), USR);
    printd("[S mode init_mem] initializing user spa: 0x%x, size: 0x%x\n", usr_avail_start,
        usr_avail_size);
    printd("[S mode init_mem] user spa initialize done\n");

    all_zero();
    printd("\033[1;33m[S mode init_mem] root: 0x%x\n\033[0m", get_page_table_root());
    /* Load ELF running inside enclave */
    uintptr_t usr_pc = elf_load(0, mem_start, USR, &prog_brk);
    
    printd("[S mode init_mem] drv_list = 0x%lx\n", drv_list);
    if (drv_list) {
    // if (drv_list != 0 && drv_list[cnt].drv_start != 0) {
        uintptr_t drv_pa_start = PAGE_DOWN(drv_list[0].drv_start - ENC_VA_PA_OFFSET);
        uintptr_t drv_pa_end = PAGE_UP(((uintptr_t)drv_list) + 64 * sizeof(drv_addr_t));
        size_t n_drv_pages = (drv_pa_end - drv_pa_start) >> 12;
        printd("[S mode init_mem] drv_pa_end = 0x%x drv_pa_start = 0x%x\n", drv_pa_end, drv_pa_start);
        printd("[S mode init_mem] n_drv_pages = %d\n", n_drv_pages);
        map_page(NULL, PAGE_DOWN(drv_list[0].drv_start), drv_pa_start, n_drv_pages, PTE_V | PTE_R | PTE_X | PTE_W | PTE_C);
        printd("\033[1;33m[S mode init_mem] drv: 0x%x - 0x%x -> 0x%x\n\033[0m", drv_pa_start,
        drv_pa_end, __pa(drv_pa_start));
    }
    /* base driver remaining mem */
    /* thus easier manupilating satp */
    map_page(NULL, ENC_VA_PA_OFFSET + usr_avail_start, usr_avail_start,
        PAGE_DOWN(usr_avail_size) >> EPAGE_SHIFT, PTE_V | PTE_W | PTE_R | PTE_C);
    printd("[S mode init_mem] usr.remain: 0x%x - 0x%x -> 0x%x\n", usr_avail_start,
        usr_avail_start + PAGE_DOWN(usr_avail_size), __pa(usr_avail_start));

    /* user stack R/W */
    size_t n_user_stack_pages = (PAGE_UP(EUSR_STACK_SIZE) >> EPAGE_SHIFT) + 1;
    printd("[S mode init_mem] user stack needs %d pages\n", n_user_stack_pages);
    uintptr_t usr_stack_start = EUSR_STACK_START;
    uintptr_t usr_stack_end = EUSR_STACK_END;
    printd("[S mode init_mem] user stack: 0x%lx - 0x%lx\n", usr_stack_start, usr_stack_end);
    alloc_page(NULL, usr_stack_start, n_user_stack_pages,
        PTE_V | PTE_W | PTE_R | PTE_U | PTE_C, USR);
    uintptr_t usr_sp = usr_stack_end;

    /* Try map pages */
    /* base driver .text section */
    extern char _text_start, _text_end;
    uintptr_t text_start = (uintptr_t)&_text_start;
    uintptr_t text_end = (uintptr_t)&_text_end;
    uintptr_t text_size = text_end - text_start;
    size_t n_base_text_pages = (PAGE_UP(text_size)) >> EPAGE_SHIFT;
    map_page(NULL, ENC_VA_PA_OFFSET + text_start, text_start,
        n_base_text_pages, PTE_V | PTE_X | PTE_R | PTE_C);
    printd("[S mode init_mem] .text: 0x%x - 0x%x -> 0x%x\n", text_start, text_end, __pa(text_start));

    /* page_table */
    map_page(NULL, ENC_VA_PA_OFFSET + page_table_start, page_table_start,
        (page_table_size + trie_size) >> EPAGE_SHIFT, PTE_V | PTE_W | PTE_R | PTE_C);
    printd("[S mode init_mem] page_table and trie: 0x%x - 0x%x -> 0x%x\n",
                page_table_start, trie_end, __pa(page_table_start));

    /* base driver .rodata section */
    extern char _rodata_start, _rodata_end;
    uintptr_t rodata_start = (uintptr_t)&_rodata_start;
    uintptr_t rodata_end = (uintptr_t)&_rodata_end;
    uintptr_t rodata_size = rodata_end - rodata_start;
    size_t n_base_rodata_pages = (PAGE_UP(rodata_size)) >> EPAGE_SHIFT;
    map_page(NULL, ENC_VA_PA_OFFSET + rodata_start, rodata_start,
        n_base_rodata_pages, PTE_V | PTE_R | PTE_C);
    printd("[S mode init_mem] .rodata: 0x%x - 0x%x -> 0x%x\n", rodata_start, rodata_end, __pa(rodata_start));

    /* base driver .bss section */
    extern char _bss_start, _bss_end;
    uintptr_t bss_start = (uintptr_t)&_bss_start;
    uintptr_t bss_end = (uintptr_t)&_bss_end;
    uintptr_t bss_size = bss_end - bss_start;
    size_t n_base_bss_pages = (PAGE_UP(bss_size)) >> EPAGE_SHIFT;
    map_page(NULL, ENC_VA_PA_OFFSET + bss_start, bss_start,
        n_base_bss_pages, PTE_V | PTE_W | PTE_R | PTE_C);
    printd("[S mode init_mem] .bss: 0x%x - 0x%x -> 0x%x\n", bss_start, bss_end, __pa(bss_start));

    /* base driver .init.data section */
    extern char _init_data_start, _init_data_end;
    uintptr_t init_data_start = (uintptr_t)&_init_data_start;
    uintptr_t init_data_end = (uintptr_t)&_init_data_end;
    uintptr_t init_data_size = init_data_end - init_data_start;
    size_t n_base_init_data_pages = (PAGE_UP(init_data_size)) >> EPAGE_SHIFT;
    map_page(NULL, ENC_VA_PA_OFFSET + init_data_start, init_data_start,
        n_base_init_data_pages, PTE_V | PTE_W | PTE_R | PTE_C);
    printd("[S mode init_mem] .init.data: 0x%x - 0x%x -> 0x%x\n", init_data_start, init_data_end, __pa(init_data_start));

     /* base driver .data section */
    extern char _data_start, _data_end;
    uintptr_t data_start = (uintptr_t)&_data_start;
    uintptr_t data_end = (uintptr_t)&_data_end;
    uintptr_t data_size = data_end - data_start;
    size_t n_base_data_pages = (PAGE_UP(data_size)) >> EPAGE_SHIFT;
    map_page(NULL, ENC_VA_PA_OFFSET + data_start, data_start,
        n_base_data_pages, PTE_V | PTE_W | PTE_R | PTE_C);
    printd("[S mode init_mem] .data: 0x%x - 0x%x -> 0x%x\n", data_start, data_end, __pa(data_start));

    volatile uintptr_t a7;
    asm volatile ("mv %0, a7"::"r"(a7));
    printd("[S mode init_mem] a7 = 0x%lx\n", a7);

    /* base driver remaining mem */
    /* thus easier manupilating satp */
    map_page(NULL, ENC_VA_PA_OFFSET + base_avail_start,
        base_avail_start, PAGE_DOWN(base_avail_size) >> EPAGE_SHIFT,
        PTE_V | PTE_W | PTE_R | PTE_C);
    printd("[S mode init_mem] drv.remain: 0x%x - 0x%x -> 0x%x\n", base_avail_start,
    base_avail_start+PAGE_DOWN(base_avail_size), __pa(base_avail_start));

    /* base stack R/W */
    size_t n_base_stack_pages = (PAGE_UP(EDRV_STACK_SIZE)) >> EPAGE_SHIFT;
    printd("[S mode init_mem] drv stack uses %d pages\n", n_base_stack_pages);
    uintptr_t drv_sp = EDRV_STACK_TOP - EDRV_STACK_SIZE;
    alloc_page(NULL, drv_sp, n_base_stack_pages, PTE_V | PTE_W | PTE_R | PTE_C,
        DRV);
    drv_sp += EDRV_STACK_SIZE;

    printd("[S mode init_mem] sp: 0x%lx\n"
            "page table root: 0x%lx\n",
            drv_sp, get_page_table_root());
    printd("[S mode init_mem] usr sp: 0x%llx\n", usr_sp);
    uintptr_t satp = get_page_table_root() >> EPAGE_SHIFT;
    satp |= (uintptr_t)SATP_MODE_SV39 << SATP_MODE_SHIFT;

    /* allow S mode access U mode memory */
	uintptr_t sstatus = read_csr(sstatus);
	sstatus |= SSTATUS_SUM;
	write_csr(sstatus, sstatus);

    loop_test();

    page_map_register(); // tell m mode where page table and inverse mapping are
    va_top += EMEM_SIZE;
    flush_dcache_range(ENC_PA_START, ENC_PA_START + EMEM_SIZE);
    // asm volatile("fence rw, rw");

    asm volatile ("mv a0, %0"::"r"((uintptr_t)(satp)));
    asm volatile ("mv a1, %0"::"r"((uintptr_t)(drv_sp)));
    asm volatile ("mv a2, %0"::"r"((uintptr_t)(usr_pc)));
    asm volatile ("mv a3, %0"::"r"((uintptr_t)(usr_sp)));
}
