#include <sbi/sbi_ecall.h>
#include <sbi/sbi_ecall_interface.h>
#include <sbi/sbi_ecall_ebi_enclave.h>
#include <sbi/sbi_error.h>
#include <sbi/sbi_trap.h>
#include <sbi/sbi_version.h>
#include <sbi/riscv_asm.h>
#include <sbi/sbi_console.h>
#include <sbi/sbi_ecall_ebi_mem.h>

extern char _base_start, _base_end;
extern char _enclave_start, _enclave_end;

static int hartid_to_eid(int hartid)
{
    return enclave_on_core[hartid];
}

static int sbi_ecall_ebi_handler(struct sbi_scratch *scratch,
				 unsigned long extid, unsigned long funcid,
				 unsigned long *args, unsigned long *out_val,
				 struct sbi_trap_info *out_trap)
{
	int ret		    = 0;
    unsigned long core = csr_read(mhartid);
    ulong mepc = csr_read(CSR_MEPC);
    int eid = hartid_to_eid(core);
    enclave_context *context = &enclaves[eid];

    struct sbi_trap_regs *regs = (struct sbi_trap_regs *)args[5];

    switch (funcid) {
    case SBI_EXT_EBI_CREATE:
        ret = create_enclave(args, mepc);
        return ret;

    case SBI_EXT_EBI_ENTER:
        enter_enclave(args, mepc);
        return ret;

    case SBI_EXT_EBI_EXIT:
        exit_enclave(regs);
        peri_clear(eid);
	    return ret;
    
    case SBI_EXT_EBI_SUSPEND:
        // suspend_enclave(eid, regs, mepc);
        peri_clear(eid);
        return ret;
    
    case SBI_EXT_EBI_RESUME:
        // resume_enclave(eid, regs);
        return ret;
    
    case SBI_EXT_EBI_PERI_INFORM:
        inform_peri(regs);
        return ret;

    case SBI_EXT_EBI_MEM_ALLOC:
        ;
        uintptr_t va = regs->a0;
        uintptr_t pa = alloc_section_for_enclave(context, va); // pa should be passed to enclave by regs
        if (pa) {
            regs->a1 = pa;
            regs->a2 = SECTION_SIZE;
        }
        else {
            sbi_printf("[M mode SBI_EXT_EBI_MEM_ALLOC] allocation failed\n");
            exit_enclave(regs);
        }
        return ret;

    case SBI_EXT_EBI_MAP_REGISTER:
        if (!(regs->a0 && regs->a1 && regs->a2)) {
            sbi_printf("[M mode sbi_ecall_ebi_handler] invalid ecall, check input\n");
            return ret;
        }

        context->pt_root_addr = regs->a0;
        context->inverse_map_addr = regs->a1;
        context->offset_addr = regs->a2;
        return ret;
    }



    return ret;
}

struct sbi_ecall_extension ecall_ebi = {
	.extid_start = SBI_EXT_EBI,
	.extid_end   = SBI_EXT_EBI,
	.handle	     = sbi_ecall_ebi_handler,
};
