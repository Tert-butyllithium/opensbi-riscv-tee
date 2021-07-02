#pragma once
#include "mm/page_table.h"
// #define PTE_ATTR_MASK   0xFFFFFC00

// #ifndef __ASSEMBLER__
// #include "enclave.h"
// #endif

// #define MASK(n)     ((1 << (n)) - 1)

// #define EPTE_SHIFT           10

// /* Based on 64 bits Sv39 Page */
#define SATP_MODE_SHIFT      60
// #define EPAGE_SHIFT          12
// #define EPAGE_SIZE           (1 << EPAGE_SHIFT)
// #define EMEGA_PAGE_SHIFT     21
// #define EMEGA_PAGE_SIZE      (1 << EMEGA_PAGE_SHIFT)

// #define EPT_LEVEL            3
// #define EPT_LEVEL_BITS       9

// #define EPPN_SHIFT(level) \
// 		(EPAGE_SHIFT + (level) * EPT_LEVEL_BITS)

// #define EPPN(addr, level) \
//         (((addr) >> EPPN_SHIFT(level)) & ((1 << EPT_LEVEL_BITS) - 1))

#define EMEM_SIZE        0x800000
#define EDRV_MEM_SIZE    0x200000
#define EDRV_STACK_SIZE  0x8000
#define EUSR_MEM_SIZE    (EMEM_SIZE - EDRV_MEM_SIZE)
#define EUSR_STACK_SIZE  0x8000
#define EUSR_HEAP_STACK_RATIO 10
// #define ROUND_UP(addr, size)	(((addr) + ((size) - 1)) & (~((size) - 1)))
// #define PAGE_UP(addr)	        (ROUND_UP(addr, EPAGE_SIZE))
// #define PAGE_DOWN(addr)	        ((addr) & (~((EPAGE_SIZE) - 1)))

// #define NUM_OF_PAGE(size)	\
//         (((PAGE_UP(size)) >> EPAGE_SHIFT) & ((1 << (64 - EPAGE_SHIFT)) - 1))

// #define EDRV_PA_START    0x40000000
// #define EDRV_VA_START    0xC0000000
// #define EDRV_DRV_START   0xD0000000
// #define EDRV_VA_PA_OFFSET     (EDRV_VA_START - EDRV_PA_START)

// #define EUSR_VA_START    0x0
// #ifndef __ASSEMBLER__
// #include <stdint.h>
// #include <string.h>

// typedef uintptr_t pte;
// #define PA2PTE(pa) ((((uintptr_t)pa) >> EPAGE_SHIFT) << EPTE_SHIFT)
// #define PTE2PA(pte) (((pte) >> EPTE_SHIFT) << EPAGE_SHIFT)

#ifndef __ASSEMBLER__
extern uintptr_t pt_root;
extern uintptr_t prog_brk;
#endif

// pte *get_pte(pte *root, uintptr_t va, char alloc);
// void init_mem(uintptr_t mem_start, uintptr_t mem_size, uintptr_t usr_size, drv_addr_t drv_list[MAX_DRV], uintptr_t argc, uintptr_t argv);
// void map_page(pte* root , uintptr_t va, uintptr_t pa, size_t n_pages, uintptr_t attr);
// uintptr_t ioremap(pte *root, uintptr_t pa, size_t size);
// uintptr_t alloc_page(pte* root, uintptr_t va, size_t n_pages, uintptr_t attr, char id);
// void usr_alloc_page(pte* root, uintptr_t va, size_t n_pages, uintptr_t attr);
// void drv_alloc_page(pte* root, uintptr_t va, size_t n_pages, uintptr_t attr);
// #define EM_RISCV 243
// #define ELFCLASS64 2

// #endif