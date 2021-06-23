#include "drv_page_pool.h"
#ifndef __ASSEMBLER__
#include "drv_mem.h"
#endif
#include "drv_util.h"
/* SPA alway return ACCESSABLE address instead of raw physical address!!!! */

struct pg_list page_pools[NUM_POOL];

uintptr_t va_pa_offset() {
    uintptr_t satp = read_csr(satp);
    /* if paging already enabled, add offset */
    if (satp & ((uintptr_t)SATP_MODE_SV39 << SATP_MODE_SHIFT))
        return EDRV_VA_PA_OFFSET;
    return 0;
}

void __spa_put(uintptr_t addr, struct pg_list* pool) {
    uintptr_t prev;
    uintptr_t offset = va_pa_offset();
    addr = addr - offset;
    if(!LIST_EMPTY(pool)) {
        prev = pool -> tail + offset;
        NEXT_PAGE(prev) = addr;
    } else {
        pool->head = addr;
    }

    NEXT_PAGE(addr + offset) = 0;
    pool->tail = addr;
    pool->count++;
}

uintptr_t __spa_get(struct pg_list* pool) {
    uintptr_t page;
    uintptr_t offset = va_pa_offset();
    if (LIST_EMPTY(pool)) {
        return -1;
    }
    page = pool -> head + offset;
    uintptr_t next = NEXT_PAGE(page);
    pool->head = next;
    pool->count--;

    return page;
}

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
    memset((char*)page, 0, EPAGE_SIZE);
    return page;
}

uintptr_t spa_get_pa(char id) {
    return __spa_get(page_pools + id) - va_pa_offset();
}

uintptr_t spa_get_pa_zero(char id) {
    uintptr_t page = __spa_get(page_pools + id);
    memset((char*)page, 0, EPAGE_SIZE);
    return page - va_pa_offset();
}

uintptr_t spa_avail(char id) {
    return (page_pools + id) -> count;
}