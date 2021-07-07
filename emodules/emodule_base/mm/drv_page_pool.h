#pragma once
#ifndef __ASSEMBLER__
#include <stdio.h>
#include <stdint.h>
#include "../enclave.h"

#define NEXT_PAGE(page) *((uintptr_t *)page)
#define LIST_EMPTY(list) ((list)->count == 0 || (list)->head == 0)
#define LIST_INIT(list)            \
	{                          \
		(list)->count = 0; \
		(list)->head  = 0; \
		(list)->tail  = 0; \
	}
#define NUM_POOL 2
#define DRV 1
#define USR 0

struct pg_list {
	uintptr_t head;
	uintptr_t tail;
	unsigned int count;
};

void spa_init(uintptr_t base, size_t size, char id);
// uintptr_t spa_get(char id);
// uintptr_t spa_get_zero(char id);
uintptr_t spa_get_pa(char id);
uintptr_t spa_get_pa_zero(char id);
// void spa_put(uintptr_t page, char id);
// unsigned int spa_available(char id);
uintptr_t va_pa_offset();
#endif