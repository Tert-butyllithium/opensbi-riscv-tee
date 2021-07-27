#pragma once

// /* Based on 64 bits Sv39 Page */
#define SATP_MODE_SHIFT      60

#define EMEM_SIZE	0x800000
#define EDRV_MEM_SHIFT	21
#define EDRV_MEM_SIZE	(1UL << EDRV_MEM_SHIFT) 	// 0x20_0000
#define EDRV_MEM_MASK	(~(-1UL << EDRV_MEM_SHIFT))
#define EDRV_STACK_TOP 0xB0000000 //0xb000_0000
#define EDRV_STACK_SIZE	0x8000
#define EUSR_MEM_SIZE	(EMEM_SIZE - EDRV_MEM_SIZE)
#define EUSR_STACK_SIZE	0x10000
// #define EUSR_HEAP_STACK_RATIO 100
#define INVERSE_MAP_ENTRY_NUM 1024
#define EUSR_STACK_END 0x3fffff0000UL // 0x3f_ffff_0000
#define EUSR_STACK_START (EUSR_STACK_END - EUSR_STACK_SIZE)
#define EUSR_HEAP_START 0x10000000UL // 0x1000_0000

#include "mm/page_table.h"
#ifndef __ASSEMBLER__
extern uintptr_t pt_root;
extern uintptr_t prog_brk;
extern uintptr_t va_top;
#endif
