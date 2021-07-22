#include "drv_page_pool.h"
#ifndef __ASSEMBLER__
#include "../drv_mem.h"
#endif
#include "page_table.h"
#include "../drv_util.h"
/* SPA alway return ACCESSABLE address instead of raw physical address!!!! */

struct pg_list page_pools[NUM_POOL];

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

uintptr_t __spa_get(struct pg_list* pool) {
    printd("[S mode __spa_get] pool = %p\n", pool);
    uintptr_t page;
    if (LIST_EMPTY(pool)) {
        return -1;
    }
    page = pool -> head - va_pa_offset_no_mmu();
    printd("[S mode __spa_get] page = 0x%lx\n", page);
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
}
void spa_put(uintptr_t addr, char id) {
    __spa_put(addr, page_pools + id);
}
uintptr_t spa_get(char id) {
    return __spa_get(page_pools + id);
}
uintptr_t spa_get_zero(char id) {
    uintptr_t page = __spa_get(page_pools + id);
    if (page == -1 && id == DRV)
        printd("OUT OF PAGE DRV\n");
    else if (page == -1 && id == USR)
        printd("OUT OF PAGE USR\n");
    my_memset((char*)page, 0, EPAGE_SIZE);
    return page;
}

uintptr_t spa_get_pa(char id) {
    return __spa_get(page_pools + id);
}

uintptr_t spa_get_pa_zero(char id) {
    uintptr_t page = __spa_get(page_pools + id);
    printd("[S mode spa_get_pa_zero] page = 0x%lx\n", page);
    my_memset((char*)page, 0, EPAGE_SIZE);
    return page - va_pa_offset();
}

uintptr_t spa_avail(char id) {
    return (page_pools + id) -> count;
}