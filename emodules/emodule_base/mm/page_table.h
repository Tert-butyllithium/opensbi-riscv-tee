#pragma once

#include "../drv_util.h"

#define EDRV_PA_START    0x40000000
#define EDRV_VA_START    0xC0000000
#define EDRV_DRV_START   0xD0000000
#define EDRV_VA_PA_OFFSET     (EDRV_VA_START - EDRV_PA_START)


#define EPAGE_SIZE 4096
#define EPAGE_SHIFT          12
#define ROUND_UP(addr, size) (((addr) + ((size)-1)) & (~((size)-1)))
#define PAGE_UP(addr) (ROUND_UP(addr, EPAGE_SIZE))
#define PAGE_DOWN(addr) ((addr) & (~((EPAGE_SIZE)-1)))

#define MASK_OFFSET 0xfff
#define MASK_L0 0x1ff000
#define MASK_L1 0x3fe00000
#define MASK_L2 0x7fc0000000

// Pool size for page table itself
#define PAGE_DIR_POOL 64 

#ifndef __ASSEMBLER__

typedef unsigned long size_t;

typedef struct pte {
    uint32_t pte_v: 1;
    uint32_t pte_r: 1;
    uint32_t pte_w: 1;
    uint32_t pte_x: 1;
    uint32_t pte_u: 1;
    uint32_t pte_g: 1;
    uint32_t pte_a: 1;
    uint32_t pte_d: 1;
    uint32_t rsw: 2;
    uintptr_t ppn: 44;
    uintptr_t __unused_value: 10;
} pte;


typedef struct trie {
	uint32_t next[PAGE_DIR_POOL][512], cnt;
} trie;
typedef pte page_directory[512];

void map_page(pte *, uintptr_t, uintptr_t, size_t, uintptr_t);
uintptr_t ioremap(pte *, uintptr_t, size_t);
uintptr_t alloc_page(pte *, uintptr_t, size_t, uintptr_t, char);
uintptr_t get_pa(uintptr_t);
void print_pte(uintptr_t va);
void test_va(uintptr_t va);
uintptr_t get_page_table_root(void);
void all_zero(void);
// pte* get_pte(pte*, uintptr_t, char);

#endif