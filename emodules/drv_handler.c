#ifndef __ASSEMBLER__
#include "drv_handler.h"
#endif
#include "drv_util.h"
#include "drv_syscall.h"
#include "drv_base.h"

void handle_interrupt(uintptr_t* regs, uintptr_t scause, uintptr_t sepc, uintptr_t stval) {
    printd("handler_interrupt 0x%08x 0x%08x  0x%08x!\n", scause, sepc, stval);

    uintptr_t sip;
    switch (scause)
    {
    case IRQ_S_TIMER:
        clear_csr(sip, SIP_STIP);
        break;
    case IRQ_S_SOFT:
        clear_csr(sip, SIP_SSIP);
        break;
    // case IRQ_S_EXT:
    //     clear_csr(sip, 1 << IRQ_S_EXT);
    //     break;
    default:
        break;
    }
}

void handle_exception(uintptr_t* regs, uintptr_t scause, uintptr_t sepc, uintptr_t stval) {
    printd("handle exception %d 0x%llx  0x%llx!\n", scause, sepc, stval);
    // SBI_CALL(EBI_EXIT, 0, 0, 0);
    SBI_CALL5(SBI_EXT_EBI, 0, 0, 0, EBI_EXIT);
}

void handle_syscall(uintptr_t* regs, uintptr_t scause, uintptr_t sepc, uintptr_t stval) {
    uintptr_t sstatus = read_csr(sstatus);
    sstatus |= SSTATUS_SUM;
    write_csr(sstatus, sstatus);

    if(scause != CAUSE_USER_ECALL) {
        handle_exception(regs, scause, sepc, stval);
    }

    uintptr_t which = regs[A7_INDEX], arg_0 = regs[A0_INDEX], arg_1 = regs[A1_INDEX], retval = 0;

    switch (which)
    {
    case SYS_fstat:
        retval = ebi_fstat(arg_0,arg_1);
        break;
    case SYS_write:
        retval = ebi_write(arg_0, arg_1);
        break;
    case SYS_close:
        retval = ebi_close(arg_0);
        break;
    case SYS_brk:
        retval = ebi_brk(arg_0);
        break;
    case SYS_gettimeofday:
        retval = ebi_gettimeofday((struct timeval *)arg_0, (struct timezone *)arg_1);
        break;
    case SYS_exit:
        // SBI_CALL(EBI_EXIT, enclave_id, arg_0, 0);
        SBI_CALL5(SBI_EXT_EBI, enclave_id, 0, 0, EBI_EXIT);
        break;
    case EBI_GOTO:
    //TODO SBI_CALL -> SBI_CALL5
        SBI_CALL(EBI_GOTO, enclave_id, arg_0, 0);
        break;
    default:
        printd("syscall %d unimplemented!\n", which);
        SBI_CALL5(SBI_EXT_EBI, enclave_id, 0, 0, EBI_EXIT);
        break;
    }
    write_csr(sepc, sepc + 4);
    sstatus = sstatus & ~(SSTATUS_SPP | SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SUM);
    write_csr(sstatus, sstatus);
    regs[A0_INDEX] = retval;
}
void unimplemented_exception(uintptr_t* regs, uintptr_t scause, uintptr_t sepc, uintptr_t stval){
    printd("unimplemented_exception");
}