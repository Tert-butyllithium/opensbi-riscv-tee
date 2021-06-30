#include "drv_mem.h"
#include "drv_handler.h"
#include "enclave.h"
.macro RESTORE_CONTEXT
    LOAD ra,  CONTEXT_ADDR_SP(RA)
    LOAD gp,  CONTEXT_ADDR_SP(GP)
    LOAD tp,  CONTEXT_ADDR_SP(TP)
    LOAD t0,  CONTEXT_ADDR_SP(T0)
    LOAD t1,  CONTEXT_ADDR_SP(T1)
    LOAD t2,  CONTEXT_ADDR_SP(T2)
    LOAD s0,  CONTEXT_ADDR_SP(S0)
    LOAD s1,  CONTEXT_ADDR_SP(S1)
    LOAD a0,  CONTEXT_ADDR_SP(A0)
    LOAD a1,  CONTEXT_ADDR_SP(A1)
    LOAD a2,  CONTEXT_ADDR_SP(A2)
    LOAD a3,  CONTEXT_ADDR_SP(A3)
    LOAD a4,  CONTEXT_ADDR_SP(A4)
    LOAD a5,  CONTEXT_ADDR_SP(A5)
    LOAD a6,  CONTEXT_ADDR_SP(A6)
    LOAD a7,  CONTEXT_ADDR_SP(A7)
    LOAD s2,  CONTEXT_ADDR_SP(S2)
    LOAD s3,  CONTEXT_ADDR_SP(S3)
    LOAD s4,  CONTEXT_ADDR_SP(S4)
    LOAD s5,  CONTEXT_ADDR_SP(S5)
    LOAD s6,  CONTEXT_ADDR_SP(S6)
    LOAD s7,  CONTEXT_ADDR_SP(S7)
    LOAD s8,  CONTEXT_ADDR_SP(S8)
    LOAD s9,  CONTEXT_ADDR_SP(S9)
    LOAD s10, CONTEXT_ADDR_SP(S10)
    LOAD s11, CONTEXT_ADDR_SP(S11)
    LOAD t3,  CONTEXT_ADDR_SP(T3)
    LOAD t4,  CONTEXT_ADDR_SP(T4)
    LOAD t5,  CONTEXT_ADDR_SP(T5)
    LOAD t6,  CONTEXT_ADDR_SP(T6)
    addi    sp, sp, GPR_CONTEXT_SIZE
.endm

.macro SAVE_CONTEXT
    addi sp, sp, -GPR_CONTEXT_SIZE
    STORE ra,  CONTEXT_ADDR_SP(RA)
    STORE gp,  CONTEXT_ADDR_SP(GP)
    STORE tp,  CONTEXT_ADDR_SP(TP)
    STORE t0,  CONTEXT_ADDR_SP(T0)
    STORE t1,  CONTEXT_ADDR_SP(T1)
    STORE t2,  CONTEXT_ADDR_SP(T2)
    STORE s0,  CONTEXT_ADDR_SP(S0)
    STORE s1,  CONTEXT_ADDR_SP(S1)
    STORE a0,  CONTEXT_ADDR_SP(A0)
    STORE a1,  CONTEXT_ADDR_SP(A1)
    STORE a2,  CONTEXT_ADDR_SP(A2)
    STORE a3,  CONTEXT_ADDR_SP(A3)
    STORE a4,  CONTEXT_ADDR_SP(A4)
    STORE a5,  CONTEXT_ADDR_SP(A5)
    STORE a6,  CONTEXT_ADDR_SP(A6)
    STORE a7,  CONTEXT_ADDR_SP(A7)
    STORE s2,  CONTEXT_ADDR_SP(S2)
    STORE s3,  CONTEXT_ADDR_SP(S3)
    STORE s4,  CONTEXT_ADDR_SP(S4)
    STORE s5,  CONTEXT_ADDR_SP(S5)
    STORE s6,  CONTEXT_ADDR_SP(S6)
    STORE s7,  CONTEXT_ADDR_SP(S7)
    STORE s8,  CONTEXT_ADDR_SP(S8)
    STORE s9,  CONTEXT_ADDR_SP(S9)
    STORE s10, CONTEXT_ADDR_SP(S10)
    STORE s11, CONTEXT_ADDR_SP(S11)
    STORE t3,  CONTEXT_ADDR_SP(T3)
    STORE t4,  CONTEXT_ADDR_SP(T4)
    STORE t5,  CONTEXT_ADDR_SP(T5)
    STORE t6,  CONTEXT_ADDR_SP(T6)
.endm

    .section ".text"
    .global trap_handler
    .align 4
trap_handler:
    csrrw   sp, sscratch, sp
    /* Is this a kernel trap? */
    bnez    sp, 0f
    csrr    sp, sscratch
0: 
    /* C Call Convention */
    SAVE_CONTEXT
    csrrw   s2, sscratch, x0
    STORE    s2, CONTEXT_ADDR_SP(SP)
    csrr    a1, scause
    mv      a0, sp
    csrr    a2, sepc
    csrr    a3, stval

    /* Is this a interrupt? */
    bgez    a1, 1f

    /* Clear highest bit */
    slli    a1, a1, 1
    srli    a1, a1, 1
    jal     handle_interrupt
    j       ret_to_usr
1:  
    jal     handle_syscall
    j       ret_to_usr

ret_to_usr:
    LOAD    s2,  CONTEXT_ADDR_SP(SP)
    csrw    sscratch, s2

    RESTORE_CONTEXT
    csrrw   sp, sscratch, sp
    sret

    .align 4
    .section ".text.init"
    .globl  _start
_start:
    /* use a tmp handler to adjust pc */
    la      s7, 2f
    li      s6, EDRV_VA_PA_OFFSET
    add     s7, s7, s6
    csrw    stvec,  s7
    /* temporary stack */
    la      sp, _temp_stack_end
    /* setup new page table */
    jal     init_mem
    mv      sp, a1
    sfence.vma
    csrw    satp, a0
2:
    sfence.vma

    /* switch to trap handler */
    la      s7, trap_handler
    csrw    stvec,  s7

    /* go to eapp */
    mv      a0, a2
    mv      a1, a3
    jal     prepare_boot
    csrrw   sp, sscratch, sp

    sret
