// #include "drv_page_pool.h"
// #include "page_table.h"
// #ifndef __ASSEMBLER__
// #include "../drv_mem.h"
// #endif
// struct  page_pool {
//     uint32_t _stack[4096];
//     int st;
// };
// struct page_pool page_pools[NUM_POOL];


// uintptr_t va_pa_offset() {
//     uintptr_t satp = read_csr(satp);
//     /* if paging already enabled, add offset */
//     if (satp & ((uintptr_t)SATP_MODE_SV39 << SATP_MODE_SHIFT))
//         return EDRV_VA_PA_OFFSET;
//     return 0;
// }

// static inline uint32_t page_pop(struct page_pool *pool) {
//     return pool->_stack[pool->st--];
// }


// static inline void page_push(struct page_pool *pool, uint32_t page) {
//     pool->_stack[++pool->st] = page;
// }

// void spa_init(uintptr_t base, size_t size, char id) {
//     struct page_pool *pool = &page_pools[id];
//     uint32_t i;
//     size >>=12;
//     pool->st = -1;

//     for ( i = 0; i < size; i++) {
//         // printd("[spa_init] %x\n",((base >> 12) + i)<<12);
//         page_push(pool, (base >> 12) + i);
//     }
    
// }
// uintptr_t spa_get_pa(char id) {
//     return page_pop(&page_pools[id]) << 12;
// }

// uintptr_t spa_get_pa_zero(char id) {
//     uintptr_t page = spa_get_pa(id);
//     my_memset((char*)(page + va_pa_offset()), 0, EPAGE_SIZE);
//     return page;
// }