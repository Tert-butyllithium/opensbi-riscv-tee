#include <sbi/sbi_ecall.h>
#include <sbi/sbi_ecall_interface.h>
#include <sbi/sbi_ecall_ebi_enclave.h>
#include <sbi/sbi_error.h>
#include <sbi/sbi_trap.h>
#include <sbi/sbi_version.h>
#include <sbi/riscv_asm.h>
#include <sbi/sbi_console.h>
#include <sbi/sbi_ecall_ebi_dma.h>

extern char _base_start, _base_end;
extern char _enclave_start, _enclave_end;

static void inline mem_dump(uintptr_t addr, uintptr_t len)
{
	sbi_printf("[m mode mem_dump] start ----------------------");
	unsigned char *ptr = (unsigned char *)addr;
	for (int i = 0; i < len; i++) {
		if (i % 8 == 0)
			sbi_printf("\n0x%p:\t", ptr);
		sbi_printf("0x%x\t", *ptr++);
	}
	sbi_printf("\n[m mode mem_dump] end ------------------------\n");
}

static int sbi_ecall_debug_handler(struct sbi_scratch *scratch,
				 unsigned long extid, unsigned long funcid,
				 unsigned long *args, unsigned long *out_val,
				 struct sbi_trap_info *out_trap)
{
	sbi_printf("[debug_handler] ############## DEBUG START ###########\n");
    	// sbi_printf("[debug_handler] arg0: 0x%lx\n", (args[0]));
	// sbi_printf("[debug_handler] arg1: 0x%lx\n", (args[1]));
	// sbi_printf("[debug_handler] arg2: 0x%lx\n", (args[2]));
	// sbi_printf("[debug_handler] *arg0: 0x%lx\n", *(uintptr_t*)(args[0]));
	// sbi_printf("[debug_handler] *arg1: 0x%lx\n", *(uintptr_t*)(args[1]));
	// sbi_printf("[debug_handler] *arg2: 0x%lx\n", *(uintptr_t*)(args[2]));
	mem_dump(0x48000000, 16);
	mem_dump(0x50000000, 16);
	dma_copy(0x48000000, 0x50000000, 4096);
	mem_dump(0x50000000, 16);


	sbi_printf("[debug_handler] ############## DEBUG END ###########\n");
    return 0;
}

struct sbi_ecall_extension ecall_debug = {
	.extid_start = SBI_EXT_DEBUG,
	.extid_end   = SBI_EXT_DEBUG,
	.handle	     = sbi_ecall_debug_handler,
};
