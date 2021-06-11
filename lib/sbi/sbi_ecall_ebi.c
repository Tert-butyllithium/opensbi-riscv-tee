#include <sbi/sbi_ecall.h>
#include <sbi/sbi_ecall_interface.h>
#include <sbi/sbi_error.h>
#include <sbi/sbi_version.h>
#include <sbi/riscv_asm.h>
#include <sbi/sbi_console.h>

extern int _base_start, _base_end;

static int sbi_ecall_ebi_handler(struct sbi_scratch *scratch,
				 unsigned long extid, unsigned long funcid,
				 unsigned long *args, unsigned long *out_val,
				 struct sbi_trap_info *out_trap)
{
	int ret		    = 233;
    unsigned long core = csr_read(mhartid); // TODO(haonan): needs to verify this value is the core id;
    switch (extid) {
    case SBI_EXT_EBI_CREATE:
        sbi_printf("[sbi_ecall_ebi_handler] SBI_EXT_EBI_CREATE\n");
        sbi_printf("[sbi_ecall_ebi_handler] extid = %lu, funcid = 0x%lx, args[0] = 0x%lx, args[1] = 0x%lx, core = %lu\n", 
            extid, funcid, args[0], args[1], core);
        sbi_printf("[sbi_ecall_ebi_handler] _base_start @ %p, _base_end @ %p\n", &_base_start, &_base_end);
        // sbi_printf("handle syscall %d %lx %lx at core %ld\n", (int)extid, args[0], args[1], core);
        // sbi_printf("Enclave Created: %lx %lx %lx\n", args[0], args[1], args[2]);
        // sbi_printf("base_start @ %p\n", &_base_start);
        // regs[A0_INDEX] = create_enclave(regs, mepc);
        //write_csr(mepc, mepc + 4); // Avoid repeatedly enter the trap handler
        return ret;
    }

	return ret;
}

struct sbi_ecall_extension ecall_ebi = {
	.extid_start = SBI_EXT_EBI_START,
	.extid_end   = SBI_EXT_EBI_RELEASE,
	.handle	     = sbi_ecall_ebi_handler,
};
