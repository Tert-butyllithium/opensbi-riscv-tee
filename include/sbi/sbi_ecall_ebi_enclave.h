#pragma once
// See LICENSE for license details.
// #define REGBYTES	8
#define INTEGER_CONTEXT_SIZE (32 * REGBYTES)

#define likely(x) __builtin_expect((x), 1)
#define unlikely(x) __builtin_expect((x), 0)

// #define ROUNDUP(a, b) ((((a)-1)/(b)+1)*(b))
// #define ROUNDDOWN(a, b) ((a)/(b)*(b))

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define CLAMP(a, lo, hi) MIN(MAX(a, lo), hi)

#define EXTRACT_FIELD(val, which) (((val) & (which)) / ((which) & ~((which)-1)))
#define INSERT_FIELD(val, which, fieldval) (((val) & ~(which)) | ((fieldval) * ((which) & ~((which)-1))))

#define STR(x) XSTR(x)
#define XSTR(x) #x

#if __riscv_xlen == 64
# define SLL32    sllw
# define STORE    sd
# define LOAD     ld
# define LWU      lwu
# define LOG_REGBYTES 3
#else
# define SLL32    sll
# define STORE    sw
# define LOAD     lw
# define LWU      lw
# define LOG_REGBYTES 2
#endif
#define REGBYTES (1 << LOG_REGBYTES)

#define RA_INDEX    1
#define SP_INDEX    2
#define GP_INDEX    3
#define TP_INDEX    4
#define T0_INDEX    5
#define T1_INDEX    6
#define T2_INDEX    7
#define S0_INDEX    8
#define S1_INDEX    9
#define A0_INDEX    10
#define A1_INDEX    11
#define A2_INDEX    12
#define A3_INDEX    13
#define A4_INDEX    14
#define A5_INDEX    15
#define A6_INDEX    16
#define A7_INDEX    17
#define S2_INDEX    18
#define S3_INDEX    19
#define S4_INDEX    20
#define S5_INDEX    21
#define S6_INDEX    22
#define S7_INDEX    23
#define S8_INDEX    24
#define S9_INDEX    25
#define S10_INDEX   26
#define S11_INDEX   27
#define T3_INDEX    28
#define T4_INDEX    29
#define T5_INDEX    30
#define T6_INDEX    31
#define MAX_INDEX   32

#define EBI_START   398
#define EBI_CREATE  399
#define EBI_ENTER   400
#define EBI_EXIT    401
#define EBI_GOTO    402
#define EBI_FETCH   403
#define EBI_RELEASE 404

#define EBI_PUTS    410
#define EBI_GETS    411

#define EBI_OK      0
#define EBI_ERROR   -1

#define GPR_CONTEXT_SIZE (MAX_INDEX * (REGBYTES))

#define CONTEXT_ADDR(reg, base)     (##reg##_INDEX * REGBYTES)(base)
#define CONTEXT_ADDR_SP(reg)        CONTEXT_ADDR(reg, sp)


#define PAGE_FREE  0x0
#define PAGE_USED  0x1

#define ENC_FREE  0x0   // Unloaded Enclave
#define ENC_LOAD  0x1   // Loaded not ran
#define ENC_IDLE  0x2   // Paused Enclave
#define ENC_RUN   0x3   // Running Enclave

#define PTE_ATTR_MASK   0xFFFFFC00

#define MASK(n)     ((1 << (n)) - 1)

#define EPTE_SHIFT           10

/* Based on 64 bits Sv39 Page */
#define SATP_MODE_SHIFT      60
#define EPAGE_SHIFT          12
#define EPAGE_SIZE           (1 << EPAGE_SHIFT)
#define EMEGA_PAGE_SHIFT     21
#define EMEGA_PAGE_SIZE      (1 << EMEGA_PAGE_SHIFT)

#define EPT_LEVEL            3
#define EPT_LEVEL_BITS       9

#define EPPN_SHIFT(level) \
		(EPAGE_SHIFT + (level) * EPT_LEVEL_BITS)

#define EPPN(addr, level) \
        (((addr) >> EPPN_SHIFT(level)) & ((1 << EPT_LEVEL_BITS) - 1))

#define EMEM_SIZE        0x800000
#define EDRV_MEM_SIZE    0x200000
#define EDRV_STACK_SIZE  0x8000
#define EUSR_MEM_SIZE    (EMEM_SIZE - EDRV_MEM_SIZE)
#define EUSR_STACK_SIZE  0x8000
#define EUSR_HEAP_STACK_RATIO 10
#define ROUND_UP(addr, size)	(((addr) + ((size) - 1)) & (~((size) - 1)))
#define PAGE_UP(addr)	        (ROUND_UP(addr, EPAGE_SIZE))
#define PAGE_DOWN(addr)	        ((addr) & (~((EPAGE_SIZE) - 1)))

#define NUM_OF_PAGE(size)	\
        (((PAGE_UP(size)) >> EPAGE_SHIFT) & ((1 << (64 - EPAGE_SHIFT)) - 1))

#define EDRV_PA_START    0x80000000
#define EDRV_VA_START    0xC0000000
#define EDRV_DRV_START   0xD0000000
#define EDRV_VA_PA_OFFSET     (EDRV_VA_START - EDRV_PA_START)

#define EUSR_VA_START    0x0

#include <stdint.h>
#include <stddef.h>
#include <sbi/riscv_atomic.h>

typedef struct {
    uintptr_t id;

    uintptr_t ns_satp;
    uintptr_t ns_mepc;
    uintptr_t ns_mstatus;
    uintptr_t ns_medeleg;

    uintptr_t ns_sstatus;
    uintptr_t ns_stvec;
    uintptr_t ns_sscratch;
    uintptr_t ns_sie;

    uintptr_t pa;
    uintptr_t mem_size;
    uintptr_t enclave_binary_size;
    uintptr_t drv_list;
    uintptr_t user_param;
    uintptr_t umode_context[MAX_INDEX];
    char status;
} enclave_context;
void pmp_switch(enclave_context *context);
extern uintptr_t create_enclave(uintptr_t* regs, uintptr_t mepc);
extern uintptr_t enter_enclave(uintptr_t* regs, uintptr_t mepc);
extern uintptr_t exit_enclave(uintptr_t* regs);
extern uintptr_t pause_enclave(uintptr_t id, uintptr_t *regs, uintptr_t mepc);
extern uintptr_t resume_enclave(uintptr_t id, uintptr_t *regs);
extern void init_enclaves(void);

#define QEMU_PHY_MEM_START 0x80000000UL
#define QEMU_PHY_MEM_END 0x88000000UL

typedef struct  {
    uintptr_t pa;
    char status;
} enclave_page_t;

extern char _enclave_start, _enclave_end;
extern char _base_start, _base_end;


typedef uintptr_t pte;

void enclave_mem_init(void);
uintptr_t enclave_mem_alloc(enclave_context* context, size_t enclave_size);
uintptr_t enclave_mem_free(enclave_context* context);


typedef uintptr_t (*cmd_handler)(uintptr_t cmd, uintptr_t arg0, uintptr_t arg1, uintptr_t arg2);
typedef struct {
    uintptr_t reg_addr;
    uintptr_t reg_size;
}drv_ctrl_t; 
typedef struct 
{
    uintptr_t drv_start;
    uintptr_t drv_end;
    int using_by;
}drv_addr_t;


#define MAX_DRV  64
#define QUERY_INFO -1

extern drv_addr_t bbl_addr_list[64];
uintptr_t drvcpy(uintptr_t *start_addr, uintptr_t bitmask);
char drvfetch(int drv_id, int enclave_id);
void drvrelease(int drv_id, int enclave_id);

// Currently, interrupts are always disabled in M-mode.
#define disable_irqsave() (0)
#define enable_irqrestore(flags) ((void) (flags)

#ifdef __riscv_atomic
# define atomic_add(ptr, inc) __sync_fetch_and_add(ptr, inc)
# define atomic_or(ptr, inc) __sync_fetch_and_or(ptr, inc)
# define atomic_swap(ptr, swp) __sync_lock_test_and_set(ptr, swp)
# define atomic_cas(ptr, cmp, swp) __sync_val_compare_and_swap(ptr, cmp, swp)
#else
# define atomic_binop(ptr, inc, op) ({ \
  long flags = disable_irqsave(); \
  typeof(*(ptr)) res = atomic_read(ptr); \
  atomic_set(ptr, op); \
  enable_irqrestore(flags); \
  res; })
# define atomic_add(ptr, inc) atomic_binop(ptr, inc, res + (inc))
# define atomic_or(ptr, inc) atomic_binop(ptr, inc, res | (inc))
# define atomic_swap(ptr, inc) atomic_binop(ptr, inc, (inc))
# define atomic_cas(ptr, cmp, swp) ({ \
  long flags = disable_irqsave(); \
  typeof(*(ptr)) res = *(volatile typeof(*(ptr)) *)(ptr); \
  if (res == (cmp)) *(volatile typeof(ptr))(ptr) = (swp); \
  enable_irqrestore(flags); \
  res; })
#endif