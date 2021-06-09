#include <sbi/sbi_ecall.h>
#include <sbi/sbi_ecall_interface.h>
#include <sbi/sbi_error.h>
#include <sbi/sbi_version.h>
#include <sbi/riscv_asm.h>
#include <sbi/sbi_console.h>


static int sbi_ecall_ebi_handler(struct sbi_scratch *scratch,
				 unsigned long extid, unsigned long funcid,
				 unsigned long *args, unsigned long *out_val,
				 struct sbi_trap_info *out_trap)
{
	int ret		    = 233;
    unsigned long core = csr_read(mhartid); // TODO(haonan): needs to verify this value is the core id;
    switch (extid) {
    case SBI_EXT_EBI_CREATE:
        sbi_printf("handle syscall %d %lx %lx at core %ld\n", (int)extid, args[0], args[1], core);
        sbi_printf("Enclave Created: %lx %lx %lx\n", args[0], args[1], args[2]);
        // regs[A0_INDEX] = create_enclave(regs, mepc);
        //write_csr(mepc, mepc + 4); // Avoid repeatedly enter the trap handler
        return ret;
    // case SBI_EXT_EBI_ENTER:
    //     sbi_printf("handle syscall %d %lx %lx at core %d\n", (int)extid, args[0], args[1], core);
    //     sbi_printf("Enclave Entering\n");
    //     // enter_enclave(regs, mepc);
    //     return ret;
    // case SBI_EXT_EBI_EXIT:
    //     sbi_printf("handle syscall %d %lx %lx at core %ld\n", (int)extid, args[0], args[1], core);
    //     // sbi_printf("Enclave Exit %x %x\n", args[0], mepc);
    //     // if (exit_enclave(regs) == SBI_EXT_EBI_ERROR) {
    //     //     //write_csr(mepc, mepc + 4);
    //     // }
    //     return ret;
    // case SBI_EXT_EBI_GOTO:
    //     sbi_printf("handle syscall %d %lx %lx at core %ld\n", (int)extid, args[0], args[1], core);
    //     sbi_printf("From %ld into %ld\n", args[0], args[1]);
    //     // pause_enclave(args[0], regs, mepc);
    //     // resume_enclave(args[1], regs);
    //     /* retval may intrrupt running */
    //     return ret;
    // case SBI_EXT_EBI_FETCH:
    //     sbi_printf("fetch about usage of %ld\n", args[1]);
    //     // drvfetch(args[0], args[1]);
    //     return ret;
    // case SBI_EXT_EBI_RELEASE:
    //     sbi_printf("release about usage of %ld\n", args[1]);
    //     // drvrelease(args[0], args[1]);
    //     return ret;
    }

	return ret;
}

struct sbi_ecall_extension ecall_ebi = {
	.extid_start = SBI_EXT_EBI_START,
	.extid_end   = SBI_EXT_EBI_RELEASE,
	.handle	     = sbi_ecall_ebi_handler,
};
