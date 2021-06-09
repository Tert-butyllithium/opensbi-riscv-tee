#include <sbi/sbi_ecall.h>
#include <sbi/sbi_ecall_interface.h>
#include <sbi/sbi_error.h>
#include <sbi/sbi_version.h>
#include <sbi/riscv_asm.h>

static int sbi_ecall_ebi_handler(struct sbi_scratch *scratch,
				 unsigned long extid, unsigned long funcid,
				 unsigned long *args, unsigned long *out_val,
				 struct sbi_trap_info *out_trap)
{
	int ret		    = 0;
    unsigned long core = scratch->hartid_to_scratch; // TODO(haonan): needs to verify this value is the core id;
    switch (funcid) {
    case SBI_EXT_EBI_CREATE:
        printm("handle syscall %d %llx %llx at core %d\n", funcid, args[0], args[1], core);
        printm("Enclave Created: %x %x %x\n", args[0], args[1], args[2]);
        // regs[A0_INDEX] = create_enclave(regs, mepc);
        //write_csr(mepc, mepc + 4); // Avoid repeatedly enter the trap handler
        return;
    case SBI_EXT_EBI_ENTER:
        printm("handle syscall %d %llx %llx at core %d\n", funcid, args[0], args[1], core);
        printm("Enclave Entering\n");
        // enter_enclave(regs, mepc);
        return;
    case SBI_EXT_EBI_EXIT:
        printm("handle syscall %d %llx %llx at core %d\n", funcid, args[0], args[1], core);
        // printm("Enclave Exit %x %x\n", args[0], mepc);
        // if (exit_enclave(regs) == SBI_EXT_EBI_ERROR) {
        //     //write_csr(mepc, mepc + 4);
        // }
        return;
    case SBI_EXT_EBI_GOTO:
        printm("handle syscall %d %llx %llx at core %d\n", funcid, args[0], args[1], core);
        printm("From %d into %d\n", args[0], args[1]);
        // pause_enclave(args[0], regs, mepc);
        // resume_enclave(args[1], regs);
        /* retval may intrrupt running */
        return;
    case SBI_EXT_EBI_FETCH:
        printm("fetch about usage of %d\n", args[1]);
        // drvfetch(args[0], args[1]);
        return;
    case SBI_EXT_EBI_RELEASE:
        printm("release about usage of %d\n", args[1]);
        // drvrelease(args[0], args[1]);
        return;

	return ret;
}

struct sbi_ecall_extension ecall_ebi = {
	.extid_start = SBI_EXT_EBI_START,
	.extid_end   = SBI_EXT_EBI_RELEASE,
	.handle	     = sbi_ecall_ebi_handler,
};
