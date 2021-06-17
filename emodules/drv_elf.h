#pragma once
#include <elf.h>
#include <string.h>
#ifndef __ASSEMBLER__
#include "drv_mem.h"
#endif
#include "drv_util.h"
#include "enclave.h"
#define EM_RISCV 243
#define ELFCLASS64 2
#define SHT_INIT_ARRAY	  14		/* Array of constructors */
#define SHT_FINI_ARRAY	  15		/* Array of destructors */
#define SHT_NOBITS	  8		/* Program space with no data (bss) */
#define SHT_PROGBITS	  1		/* Program data */
#define SHF_WRITE	     (1 << 0)	/* Writable */
#define SHF_ALLOC	     (1 << 1)	/* Occupies memory during execution */
#ifndef __ASSEMBLER__
uintptr_t elf_load(uintptr_t pt_root, uintptr_t elf_addr, char id, uintptr_t* prog_brk);
uintptr_t elf_check(uintptr_t elf_addr);
#endif