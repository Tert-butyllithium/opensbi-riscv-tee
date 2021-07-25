#pragma once

// /* Based on 64 bits Sv39 Page */
#define SATP_MODE_SHIFT      60

#define EMEM_SIZE	0x800000
#define EDRV_MEM_SHIFT	21
#define EDRV_MEM_SIZE	(1UL << EDRV_MEM_SHIFT) 	// 0x20_0000
#define EDRV_MEM_MASK	(~(-1UL << EDRV_MEM_SHIFT))
#define EDRV_STACK_SIZE	0x8000
#define EUSR_MEM_SIZE	(EMEM_SIZE - EDRV_MEM_SIZE)
#define EUSR_STACK_SIZE	0x4000
#define EUSR_HEAP_STACK_RATIO 10
#define INVERSE_MAP_ENTRY_NUM 1024

#include "mm/page_table.h"
#ifndef __ASSEMBLER__
extern uintptr_t pt_root;
extern uintptr_t prog_brk;
#endif
