#pragma once
#define DRV_INIT_MEM 500

#ifndef __ASSEMBLER__

#include "enclave.h"
#include <errno.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#define SSIE_SHIFT 1
#define STIE_SHIFT 5
#define SEIE_SHIFT 9
#define SIE_SEIE (1 << SEIE_SHIFT)
#define SIE_SSIE (1 << SSIE_SHIFT)
#define SIE_STIE (1 << STIE_SHIFT)

extern uintptr_t enclave_id;
#endif