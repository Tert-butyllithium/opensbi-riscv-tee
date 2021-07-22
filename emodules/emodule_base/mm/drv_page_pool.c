#include "drv_page_pool.h"
#ifndef __ASSEMBLER__
#include "../drv_mem.h"
#endif
#include "page_table.h"
#include "../drv_util.h"
/* SPA alway return ACCESSABLE address instead of raw physical address!!!! */

struct pg_list page_pools[NUM_POOL];
static uintptr_t alloc_mem_from_m(struct pg_list* pool);

uintptr_t va_pa_offset() {
    uintptr_t satp = read_csr(satp);
    /* if paging already enabled, add offset */
    if (satp & ((uintptr_t)SATP_MODE_SV39 << SATP_MODE_SHIFT))
        return EDRV_VA_PA_OFFSET;
    return 0;
}

uintptr_t va_pa_offset_no_mmu() {
    return EDRV_VA_PA_OFFSET - va_pa_offset();
}

// addr: pa
void __spa_put(uintptr_t pa, struct pg_list* pool) {
    uintptr_t prev;
    uintptr_t offset = va_pa_offset();
    uintptr_t va = pa + EDRV_VA_PA_OFFSET;
    uintptr_t access_addr = pa + offset;

    // printd("[S mode __spa_put] pa = 0x%lx, va = 0x%lx, \n"
    //         "offset = 0x%lx, access_addr = 0x%lx\n",
    //         pa, va, offset, access_addr);

    if(!LIST_EMPTY(pool)) {
        prev = pool -> tail - va_pa_offset_no_mmu();
        NEXT_PAGE(prev) = va;
    } else {
        pool->head = va;
    }

    NEXT_PAGE(access_addr) = 0;
    pool->tail = va;
    pool->count++;
}

// returns virtual addr of the page, -1 on failure
uintptr_t __spa_get(struct pg_list* pool) {
    uintptr_t page, ret;
    if (LIST_EMPTY(pool)) {
        printd("[S mode __spa_get] pool tail = 0x%lx\n", pool->tail);
        ret = alloc_mem_from_m(pool);
        if (!ret) {
            printd("[S mode __spa_get] alloc ERROR\n");
            return -1;
        }
    }
    page = pool -> head - va_pa_offset_no_mmu();
    uintptr_t next = NEXT_PAGE(page);
    pool->head = next;
    pool->count--;

    return page;
}

// should be invoked before mmu gets turned on
void spa_init(uintptr_t base, size_t size, char id) {
    uintptr_t cur;
    struct pg_list* pool = page_pools+id;
    LIST_INIT(pool);
    for(cur = base; cur < base + size; cur += EPAGE_SIZE) {
        __spa_put(cur, pool);
    }
    printd("[S mode spa_init] pool init size: 0x%x\n", pool->count);
}
void spa_put(uintptr_t addr, char id) {
    __spa_put(addr, page_pools + id);
}
// uintptr_t spa_get(char id) {
    // uintptr_t page = __spa_get(page_pools + id);
    // return page;
// }
// uintptr_t spa_get_zero(char id) {
//     uintptr_t page = __spa_get(page_pools + id);
//     my_memset((char*)page, 0, EPAGE_SIZE);
//     return page;
// }

uintptr_t spa_get_pa(char id) {
    uintptr_t page = __spa_get(page_pools + id);
    if (page == -1)
        return -1;
    return page - va_pa_offset();
}

uintptr_t spa_get_pa_zero(char id) {
    uintptr_t page = __spa_get(page_pools + id);
    if (page == -1)
        return -1;
    my_memset((char*)page, 0, EPAGE_SIZE);
    return page - va_pa_offset();
}

uintptr_t spa_avail(char id) {
    return (page_pools + id) -> count;
}

// alloc memory from memory manager
// return the start physical address on success; 0 on failure
static uintptr_t alloc_mem_from_m(struct pg_list* pool)
{
    uintptr_t addr, size;
    unsigned int pool_size;
    SBI_CALL5(SBI_EXT_EBI, 0, 0, 0, EBI_MEM_ALLOC);
    asm volatile ("mv %0, a1":"=r"(addr));
    asm volatile ("mv %0, a2":"=r"(size));
    printd("[S mode alloc_mem_from_m] mem alloc result: allocated section pa: 0x%lx, size: 0x%lx\n",
                addr, size);

    if (!addr) {
        printd("[S mode alloc_mem_from_m] alloc ERROR\n");
        return 0;
    }


    // linearly map the allocated memory by va_pa_offset
    map_page(NULL, addr + EDRV_VA_PA_OFFSET, addr,
                size >> EPAGE_SHIFT, PTE_V | PTE_W | PTE_R);

    // put the allocated memory into mem pool
    for (uintptr_t page = addr; page < addr + size; page += EPAGE_SIZE) {
        __spa_put(page, pool);
    }

    if (LIST_EMPTY(pool))
        printd("[S mode alloc_mem_from_m] something went wrong\n");

    pool_size = pool->count;
    printd("[S mode alloc_mem_from_m] pool size is now: 0x%x\n", pool_size);

    return addr;
}