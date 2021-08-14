#pragma once

#include "../drv_util.h"
#include "../drv_mem.h"

// #define ENC_PA_START    0x40000000
#define EDRV_VA_START    0xC0000000
#define EDRV_DRV_START   0xD0000000


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
// NOTE: when modifying, modify sbi_ecall_ebi_mem.h at the same time!!!!!!!
#define PAGE_DIR_POOL 256

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

typedef struct inverse_map {
    uintptr_t pa;
    uintptr_t va;
    uint32_t count;
} inverse_map;

typedef struct trie {
	uint32_t next[PAGE_DIR_POOL][512], cnt;
} trie;
typedef pte page_directory[512];

extern uintptr_t ENC_PA_START;
extern uintptr_t ENC_VA_PA_OFFSET;
extern inverse_map inv_map[INVERSE_MAP_ENTRY_NUM];

void map_page(pte *root, uintptr_t va, uintptr_t pa, size_t n_pages, uintptr_t attr);
uintptr_t ioremap(pte *, uintptr_t, size_t);
uintptr_t alloc_page(pte *, uintptr_t, uintptr_t, uintptr_t, char);
uintptr_t get_pa(uintptr_t);
void print_pte(uintptr_t va);
void test_va(uintptr_t va);
void set_page_table_root(uintptr_t pt_root);
uintptr_t get_page_table_root(void);
uintptr_t get_page_table_root_pointer_addr();
uintptr_t get_trie_root(); 
void all_zero(void);
inverse_map* insert_inverse_map(uintptr_t pa, uintptr_t va, uint32_t count);
void inverse_map_add_count(uintptr_t pa);
void dump_inverse_map();

#endif