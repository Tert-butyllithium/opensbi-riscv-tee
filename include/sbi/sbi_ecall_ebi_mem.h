#pragma once

#include <stdint.h>
#include <sbi/sbi_ecall_ebi_enclave.h>

#define SECTION_SHIFT	  23			// should be less than or equal to 26
#define SECTION_SIZE	  (1UL << SECTION_SHIFT)

#define SECTION_UP(addr) (ROUND_UP(addr, SECTION_SIZE))
#define SECTION_DOWN(addr) ((addr) & (~((SECTION_SIZE)-1)))

// virtual page number masks
#define MASK_OFFSET 0xfff
#define MASK_L0 0x1ff000
#define MASK_L1 0x3fe00000
#define MASK_L2 0x7fc0000000

// make sure these addresses are section aligned
#define	MEMORY_POOL_START 0x48000000
#define MEMORY_POOL_END	  0x70000000
#define MEMORY_POOL_SECTION_NUM	  ((MEMORY_POOL_END - MEMORY_POOL_START) \
				>> SECTION_SHIFT)

#define INVERSE_MAP_ENTRY_NUM 1024
#define PAGE_DIR_POOL 128

struct section {
	uintptr_t sfn;	// section frame number
	int owner;	// enclave id of the owner. -1 if unused.
	uintptr_t va;   // linearly mapped addr of the section
}; 

typedef struct inverse_map {
    uintptr_t pa;
    uintptr_t va;
    uint32_t count;
} inverse_map;

extern struct section memory_pool[MEMORY_POOL_SECTION_NUM];

uintptr_t alloc_section_for_enclave(enclave_context *context, uintptr_t va);
void init_memory_pool();
void free_section_for_enclave(int eid);
void section_ownership_dump();
int section_migration(uintptr_t src_sfn, uintptr_t dst_sfn);