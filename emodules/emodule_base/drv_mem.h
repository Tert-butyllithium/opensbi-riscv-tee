#pragma once
#include "mm/page_table.h"

// /* Based on 64 bits Sv39 Page */
#define SATP_MODE_SHIFT      60

#define EMEM_SIZE        0x800000
#define EDRV_MEM_SIZE    0x200000
#define EDRV_STACK_SIZE  0x8000
#define EUSR_MEM_SIZE    (EMEM_SIZE - EDRV_MEM_SIZE)
#define EUSR_STACK_SIZE  0x4000
#define EUSR_HEAP_STACK_RATIO 10

#ifndef __ASSEMBLER__
extern uintptr_t pt_root;
extern uintptr_t prog_brk;
#endif
