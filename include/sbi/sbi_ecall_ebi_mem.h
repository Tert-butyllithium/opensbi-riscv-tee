#pragma once

#include <stdint.h>

#define SECTION_SHIFT	  23
#define SECTION_SIZE	  (1UL << SECTION_SHIFT)

#define SECTION_UP(addr) (ROUND_UP(addr, SECTION_SIZE))
#define SECTION_DOWN(addr) ((addr) & (~((SECTION_SIZE)-1)))

// make sure these addresses are section aligned
#define	MEMORY_POOL_START 0x48000000
#define MEMORY_POOL_END	  0x70000000
#define MEMORY_POOL_SECTION_NUM	  ((MEMORY_POOL_END - MEMORY_POOL_START) \
				>> SECTION_SHIFT)

struct section {
	uintptr_t sfn;	// section frame number
	int owner;	// enclave id of the owner. -1 if unused.
}; 

extern struct section memory_pool[MEMORY_POOL_SECTION_NUM];

uintptr_t alloc_section_for_enclave(int eid);
void init_memory_pool();
void free_section_for_enclave(int eid);
void section_ownership_dump();