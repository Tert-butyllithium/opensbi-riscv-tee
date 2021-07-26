#pragma once

#ifndef __ASSEMBLER__
#include "enclave.h"
#endif

#define SBI_CALL(___extid, ___arg0, ___arg1, ___arg2) ({			\
	register uintptr_t a0 asm ("a0") = (uintptr_t)(___arg0);	\
	register uintptr_t a1 asm ("a1") = (uintptr_t)(___arg1);	\
	register uintptr_t a2 asm ("a2") = (uintptr_t)(___arg2);	\
	register uintptr_t a7 asm ("a7") = (uintptr_t)(___extid);	\
	asm volatile ("ecall"					\
		      : "+r" (a0)				\
		      : "r" (a1), "r" (a2), "r" (a7)		\
		      : "memory");				\
})

#define SBI_CALL5(___extid, ___arg0, ___arg1, ___arg2, ___funid) ({			\
	register uintptr_t a0 asm ("a0") = (uintptr_t)(___arg0);	\
	register uintptr_t a1 asm ("a1") = (uintptr_t)(___arg1);	\
	register uintptr_t a2 asm ("a2") = (uintptr_t)(___arg2);	\
	register uintptr_t a6 asm ("a6") = (uintptr_t)(___funid);	\
	register uintptr_t a7 asm ("a7") = (uintptr_t)(___extid);	\
	asm volatile ("ecall"					\
		      : "+r" (a0)				\
		      : "r" (a1), "r" (a2), "r" (a6), "r" (a7)		\
		      : "memory");				\
})


#ifndef __ASSEMBLER__
#include <stdint.h>
void printd(const char* s, ...);
void putstring(const char* s);
void print(const char* s, ...);
void putstring_console(const char *s);
void *my_memset(void *s, int c, unsigned int n);
// void show_reg(uintptr_t *regs);
void show_reg();
void print_color(const char* s);
void flush_dcache_range(unsigned long start, unsigned long end);
void invalidate_dcache_range(unsigned long start, unsigned long end);
#endif
