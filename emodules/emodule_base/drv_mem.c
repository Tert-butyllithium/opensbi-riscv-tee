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
uintptr_t pt_root;
uintptr_t drv_start_va;

// pte* get_pte(pte* root, uintptr_t va, char alloc)
// {
//     uintptr_t satp = read_csr(satp), free_page, offset = va_pa_offset();
//     pte* pt = (pte*)((uintptr_t)root + offset);
//     int i;
//     for (i = 2; i > 0; i--) {
//         size_t idx = EPPN(va, i);
//         if (!(pt[idx] & PTE_V)) {
//             if (alloc) {
//                 free_page = spa_get_zero(DRV);
//                 pt[idx] = PA2PTE(free_page - offset) | PTE_V;
//                 pt = (pte*)(free_page);
//             } else
//                 return 0;
//         } else {
//             pt = (pte*)((uintptr_t)PTE2PA(pt[idx]) + offset);
//         }
//     }
//     return (pte*)&pt[EPPN(va, 0)];
// }
// void map_page(pte* root, uintptr_t va, uintptr_t pa, size_t n_pages,
//     uintptr_t attr)
// {
//     pte* pt;
//     size_t i;
//     for (i  = 0; i < n_pages; i++) {
//         pt = get_pte(root, va, 1);
//         *pt = PA2PTE(pa) | attr | PTE_V | PTE_D | PTE_A | PTE_W | PTE_X | PTE_R;
//         va += EPAGE_SIZE;
//         pa += EPAGE_SIZE;
//     }
// }
// uintptr_t ioremap(pte* root, uintptr_t pa, size_t size)
// {
//     size_t n_pages = PAGE_UP(size) >> EPAGE_SHIFT;
//     map_page(root, drv_start_va + EDRV_DRV_START, pa, n_pages, PTE_V | PTE_W | PTE_R | PTE_D | PTE_X);
//     uintptr_t cur_addr = drv_start_va + EDRV_DRV_START;
//     drv_start_va += n_pages << EPAGE_SHIFT;
//     return cur_addr;
// }

// uintptr_t alloc_page(pte* root, uintptr_t va, size_t n_pages, uintptr_t attr,
//     char id)
// {
//     pte* pt;
//     uintptr_t pa;
//     size_t i;
//     for (i = 0; i < n_pages; i++) {
//         pt = get_pte(root, va, 1);
//         if ((*pt) & PTE_V) {
//             /* Already mapped */
//             /* TODO: check if attr are the same */
//             goto next_page;
//         }
//         pa = spa_get_pa_zero(id);
//         *pt = PA2PTE(pa) | attr | PTE_V | PTE_D | PTE_A | PTE_W | PTE_X;
// next_page:;
//         va += EPAGE_SIZE;
//     }
//     return pa;
// }

// #define __pa(x) PTE2PA((uintptr_t) *get_pte((pte*)pt_root,((uintptr_t) x + EDRV_VA_PA_OFFSET),0))


#define __pa(x) get_pa(x + EDRV_VA_PA_OFFSET)

#define SBI_CALL(___which, ___arg0, ___arg1, ___arg2) ({			\
	register uintptr_t a0 asm ("a0") = (uintptr_t)(___arg0);	\
	register uintptr_t a1 asm ("a1") = (uintptr_t)(___arg1);	\
	register uintptr_t a2 asm ("a2") = (uintptr_t)(___arg2);	\
	register uintptr_t a7 asm ("a7") = (uintptr_t)(___which);	\
	asm volatile ("ecall"					\
		      : "+r" (a0)				\
		      : "r" (a1), "r" (a2), "r" (a7)		\
		      : "memory");				\
})

/* Initialize memory for driver, including stack, heap, page table */
void init_mem(uintptr_t id, uintptr_t mem_start, uintptr_t usr_size, drv_addr_t drv_list[MAX_DRV], uintptr_t argc, uintptr_t argv)
{
    printd("[init_mem] %s %x\n", argv, argc);
    printd("[init_mem] id = %d\n", id);
    printd("[init_mem] mem_start = 0x%lx\n", mem_start);
    enclave_id = id;
    // printd("mem start: 0x%x\n enclave id: 0x%x\n usr size: 0x%x\n", mem_start,
    // id, usr_size);
    /* Give all spare memory to stack allocator, one for drivers, one for user
   * payload */
    extern char _start, _end;
    uintptr_t base_start = (uintptr_t)&_start;
    uintptr_t base_end = (uintptr_t)&_end;
    uintptr_t base_size = base_end - base_start;

    printd("Enclave base_start: 0x%llx\n", &_start);
    printd("base_end: 0x%llx\n", &_end);
    printd("base_size: 0x%x\n", base_size);

    // extern char _drv_console_start;
    // printd("Driver console PA: 0x%08x\n", drv_console_start);

    int cnt = 0;
    printd("drv_list[0].drv_start = 0x%x\n", drv_list[0].drv_start);
    while (drv_list[cnt].drv_start) {
        drv_list[cnt].drv_start += EDRV_VA_PA_OFFSET;
        drv_list[cnt].drv_end += EDRV_VA_PA_OFFSET;
        printd("[init_mem] drv_list[%d].drv_start: 0x%x, drv_end: 0x%x\n", cnt, drv_list[cnt].drv_start, drv_list[cnt].drv_end);
        cnt++;
    }

    drv_addr_list = (drv_addr_t*)((uintptr_t)drv_list);
    drv_addr_list = (void*)(EDRV_VA_PA_OFFSET + (void*) drv_addr_list);
    
    printd("\033[1;33mdrv_addr_list=%p at %p, drv_list=%p\n\033[0m",drv_addr_list, &drv_addr_list, drv_list);
    uintptr_t base_avail_start = PAGE_UP((uintptr_t)drv_list + 64 * sizeof(drv_addr_t));
    uintptr_t base_avail_end = mem_start + EDRV_MEM_SIZE + EUSR_MEM_SIZE;
    uintptr_t base_avail_size = PAGE_DOWN(base_avail_end - base_avail_start);
    printd("[init_mem] base_avail_start = 0x%x, base_avail_end = 0x%x\n", base_avail_start, base_avail_end);
    printd("[init_mem] base_avail_size = %x\n", base_avail_size);
    printd("[init_mem] mem_start = 0x%x\n", mem_start);

    spa_init(base_avail_start, base_avail_size, DRV);
    printd("hello1\n");
    printd("%x\n", base_avail_start);

    // printd("initializing driver spa: 0x%x, size: 0x%x\n", base_avail_start,
    // base_avail_size); printd("driver spa initialize done\n");

    /* More delicate allocation require ELF */
    uintptr_t usr_avail_start = PAGE_UP(mem_start + usr_size);
    uintptr_t usr_avail_size = EUSR_MEM_SIZE - usr_size;
    spa_init(usr_avail_start, PAGE_DOWN(usr_avail_size), USR);
    printd("initializing user spa: 0x%x, size: 0x%x\n", usr_avail_start,
        usr_avail_size);
    printd("user spa initialize done\n");

    all_zero();
    // pt_root = spa_get_zero(DRV);
    pt_root = get_page_table_root();
    printd("\033[1;33m[init_mem] root: 0x%x\n\033[0m", pt_root);
    /* Load ELF running inside enclave */
    uintptr_t usr_pc = elf_load(pt_root, mem_start, USR, &prog_brk);
    
    printd("[init_mem] drv_list = 0x%lx\n", drv_list);
    if (drv_list) {
    // if (drv_list != 0 && drv_list[cnt].drv_start != 0) {
        uintptr_t drv_pa_start = PAGE_DOWN(drv_list[0].drv_start - EDRV_VA_PA_OFFSET);
        uintptr_t drv_pa_end = PAGE_UP(((uintptr_t)drv_list) + 64 * sizeof(drv_addr_t));
        size_t n_drv_pages = (drv_pa_end - drv_pa_start) >> 12;
        printd("[init_mem] drv_pa_end = 0x%x drv_pa_start = 0x%x\n", drv_pa_end, drv_pa_start);
        printd("[init_mem] n_drv_pages = %d\n", n_drv_pages);
        map_page((pte*)pt_root, PAGE_DOWN(drv_list[0].drv_start), drv_pa_start, n_drv_pages, PTE_V | PTE_R | PTE_X | PTE_W);
        printd("\033[1;33mdrv: 0x%x - 0x%x -> 0x%x\n\033[0m", drv_pa_start,
        drv_pa_end, __pa(drv_pa_start));
    }
    /* base driver remaining mem */
    /* thus easier manupilating satp */
    map_page((pte*)pt_root, EDRV_VA_PA_OFFSET + usr_avail_start, usr_avail_start,
        PAGE_DOWN(usr_avail_size) >> EPAGE_SHIFT, PTE_V | PTE_W | PTE_R |PTE_U);
    printd("usr.remain: 0x%x - 0x%x -> 0x%x\n", usr_avail_start,
        usr_avail_start + PAGE_DOWN(usr_avail_size), __pa(usr_avail_start));

    /* user stack R/W */
    size_t n_user_stack_pages = (PAGE_UP(EUSR_STACK_SIZE) >> EPAGE_SHIFT) + 1;
    printd("[init_mem] user stack needs %d pages\n", n_user_stack_pages);
    uintptr_t usr_sp = prog_brk + EUSR_STACK_SIZE * EUSR_HEAP_STACK_RATIO;
    printd("user stack: 0x%x - 0x%x\n", usr_sp, usr_sp + EUSR_STACK_SIZE);
    alloc_page((pte*)pt_root, usr_sp, n_user_stack_pages,
        PTE_V | PTE_W | PTE_R | PTE_U, USR);
    usr_sp += EUSR_STACK_SIZE;

    /* Try map pages */
    /* base driver .text section */
    extern char _text_start, _text_end;
    uintptr_t text_start = (uintptr_t)&_text_start;
    uintptr_t text_end = (uintptr_t)&_text_end;
    uintptr_t text_size = text_end - text_start;
    size_t n_base_text_pages = (PAGE_UP(text_size)) >> EPAGE_SHIFT;
    map_page((pte*)pt_root, EDRV_VA_PA_OFFSET + text_start, text_start,
        n_base_text_pages, PTE_V | PTE_X | PTE_R);
    printd(".text: 0x%x - 0x%x -> 0x%x\n", text_start, text_end, __pa(text_start));

    /* page_table */
    extern char _page_table_start,  _page_table_end;
    uintptr_t page_table_start = (uintptr_t)&_page_table_start;
    uintptr_t page_table_end = (uintptr_t)&_page_table_end;
    uintptr_t init_data_size = page_table_end - page_table_start;
    size_t n_base_init_data_pages = (PAGE_UP(init_data_size)) >> EPAGE_SHIFT;
    map_page((pte*)pt_root, EDRV_VA_PA_OFFSET + page_table_start, page_table_start,
        n_base_init_data_pages, PTE_V | PTE_W | PTE_R);
    printd("page_table: 0x%x - 0x%x -> 0x%x\n", page_table_start, page_table_end, __pa(page_table_start));

    /* base driver .init.data section */
    // extern char _init_data_start, _init_data_end;
    // uintptr_t init_data_start = (uintptr_t)&_init_data_start;
    // uintptr_t init_data_end = (uintptr_t)&_init_data_end;
    // uintptr_t init_data_size = init_data_end - init_data_start;
    // size_t n_base_init_data_pages = (PAGE_UP(init_data_size)) >> EPAGE_SHIFT;
    // map_page((pte*)pt_root, EDRV_VA_PA_OFFSET + init_data_start, init_data_start,
    //     n_base_init_data_pages, PTE_V | PTE_W | PTE_R);
    // printd(".init.data: 0x%x - 0x%x -> 0x%x\n", init_data_start, init_data_end, __pa(init_data_start));

    // /* base driver .data section */
    // extern char _data_start, _data_end;
    // uintptr_t data_start = (uintptr_t)&_data_start;
    // uintptr_t data_end = (uintptr_t)&_data_end;
    // uintptr_t data_size = data_end - data_start;
    // size_t n_base_data_pages = (PAGE_UP(data_size)) >> EPAGE_SHIFT;
    // map_page((pte*)pt_root, EDRV_VA_PA_OFFSET + data_start, data_start,
    //     n_base_data_pages, PTE_V | PTE_W | PTE_R);
    // printd(".data: 0x%x - 0x%x -> 0x%x\n", data_start, data_end,__pa(data_start));

    /* base driver .rodata section */
    extern char _rodata_start, _rodata_end;
    uintptr_t rodata_start = (uintptr_t)&_rodata_start;
    uintptr_t rodata_end = (uintptr_t)&_rodata_end;
    uintptr_t rodata_size = rodata_end - rodata_start;
    size_t n_base_rodata_pages = (PAGE_UP(rodata_size)) >> EPAGE_SHIFT;
    map_page((pte*)pt_root, EDRV_VA_PA_OFFSET + rodata_start, rodata_start,
        n_base_rodata_pages, PTE_V | PTE_R);
    printd(".rodata: 0x%x - 0x%x -> 0x%x\n", rodata_start, rodata_end, __pa(rodata_start));

    /* base driver .bss section */
    extern char _bss_start, _bss_end;
    uintptr_t bss_start = (uintptr_t)&_bss_start;
    uintptr_t bss_end = (uintptr_t)&_bss_end;
    uintptr_t bss_size = bss_end - bss_start;
    size_t n_base_bss_pages = (PAGE_UP(bss_size)) >> EPAGE_SHIFT;
    map_page((pte*)pt_root, EDRV_VA_PA_OFFSET + bss_start, bss_start,
        n_base_bss_pages, PTE_V | PTE_W | PTE_R);
    printd(".bss: 0x%x - 0x%x -> 0x%x\n", bss_start, bss_end, __pa(bss_start));

    volatile uintptr_t a7;
    asm volatile ("mv %0, a7"::"r"(a7));
    printd("a7 = 0x%lx\n", a7);

    /* base driver remaining mem */
    /* thus easier manupilating satp */
    map_page((pte*)pt_root, EDRV_VA_PA_OFFSET + base_avail_start,
        base_avail_start, PAGE_DOWN(base_avail_size) >> EPAGE_SHIFT,
        PTE_V | PTE_W | PTE_R);
    printd("drv.remain: 0x%x - 0x%x -> 0x%x\n", base_avail_start,
    base_avail_start+PAGE_DOWN(base_avail_size), __pa(base_avail_start));

    /* base stack R/W */
    size_t n_base_stack_pages = (PAGE_UP(EDRV_STACK_SIZE)) >> EPAGE_SHIFT;
    printd("drv stack uses %d pages\n", n_base_stack_pages);
    uintptr_t drv_sp = EDRV_VA_START + EDRV_MEM_SIZE - EDRV_STACK_SIZE;
    alloc_page((pte*)pt_root, drv_sp, n_base_stack_pages, PTE_V | PTE_W | PTE_R,
        DRV);
    drv_sp += EDRV_STACK_SIZE;

    printd("sp: 0x%lx\npt_root: 0x%lx\n", drv_sp, pt_root);
    printd("usr sp: 0x%llx\n", usr_sp);
    uintptr_t satp = pt_root >> EPAGE_SHIFT;
    satp |= (uintptr_t)SATP_MODE_SV39 << SATP_MODE_SHIFT;

    // printd("[init_mem] drv_list_addr: 0x%p at 0x%p\n",drv_addr_list, &drv_addr_list);
    // enclave_id = 114514;
    // printd("\033[0;32m[init_mem] enclave_id @ 0x%lx at 0x%p\n\033[0m", enclave_id, &enclave_id);
    printd("\033[1;33mdrv_addr_list=%p at %p, drv_list=%p\n\033[0m",drv_addr_list, &drv_addr_list, drv_list);

    /* allow S mode access U mode memory */
	uintptr_t sstatus = read_csr(sstatus);
	sstatus |= SSTATUS_SUM;
	write_csr(sstatus, sstatus);


    // //WARNING: should remove
    // ioremap(NULL,0x02500000,4096);

    SBI_CALL5(0xdeadbeaf,drv_addr_list,0,0,0);

    asm volatile ("mv a0, %0"::"r"((uintptr_t)(satp)));
    asm volatile ("mv a1, %0"::"r"((uintptr_t)(drv_sp)));
    asm volatile ("mv a2, %0"::"r"((uintptr_t)(usr_pc)));
    asm volatile ("mv a3, %0"::"r"((uintptr_t)(usr_sp)));
}
