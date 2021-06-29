#pragma once
#ifndef __ASSEMBLER__
#include <stdint.h>
#include "enclave.h"
void handle_interrupt(uintptr_t *regs, uintptr_t scause, uintptr_t sepc,
		      uintptr_t stval);
void handle_syscall(uintptr_t *regs, uintptr_t scause, uintptr_t sepc,
		    uintptr_t stval);

void unimplemented_exception(uintptr_t *regs, uintptr_t scause, uintptr_t sepc,
			     uintptr_t stval);
#endif