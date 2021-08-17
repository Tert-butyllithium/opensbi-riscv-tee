#include <sbi/sbi_ecall.h>
#include <sbi/sbi_ecall_interface.h>
#include <sbi/sbi_ecall_ebi_enclave.h>
#include <sbi/sbi_error.h>
#include <sbi/sbi_trap.h>
#include <sbi/sbi_version.h>
#include <sbi/riscv_asm.h>
#include <sbi/sbi_console.h>
#include <sbi/sbi_ecall_ebi_dma.h>
#include <sbi/sbi_ecall_ebi_mem.h>
#include "../../platform/thead/c910/platform.h"

extern char _base_start, _base_end;
extern char _enclave_start, _enclave_end;

static void inline mem_dump(uintptr_t addr, uintptr_t len)
{
	sbi_printf("[M mode mem_dump] start ----------------------");
	unsigned int *ptr = (unsigned int *)addr;
	for (int i = 0; i < len / 4; i++) {
		if (i % 4 == 0)
			sbi_printf("\n0x%p:\t", ptr);
		sbi_printf("%x\t", *ptr++);
	}
	sbi_printf("\n[M mode mem_dump] end ------------------------\n");
}
#define __unused __attribute__((unused)) // to be removed
__unused static pte *get_pte(uintptr_t pt_root, uintptr_t va)
{
	uintptr_t l[] = { (va & MASK_L2) >> 30, (va & MASK_L1) >> 21,
			  (va & MASK_L0) >> 12 };
	pte *root     = (pte *)pt_root;
	pte tmp_entry;
	uintptr_t tmp;
	int i = 0;

	sbi_printf("[M mode get_pte] look for pte of va 0x%lx, root at 0x%p\n",
		   va, root);
	while (1) {
		tmp_entry = root[l[i]];
		if (!tmp_entry.pte_v) {
			return NULL; // page that is not mapped
		}
		if ((tmp_entry.pte_r | tmp_entry.pte_w | tmp_entry.pte_x)) {
			sbi_printf("[M mode get_pte] pte = 0x%lx, at %p\n",
				   *(uintptr_t *)&tmp_entry, &root[l[i]]);
			return &root[l[i]];
		}
		tmp  = tmp_entry.ppn << 12;
		root = (pte *)tmp;
		i++;
	}
}

static int sbi_ecall_debug_handler(struct sbi_scratch *scratch,
				   unsigned long extid, unsigned long funcid,
				   unsigned long *args, unsigned long *out_val,
				   struct sbi_trap_info *out_trap)
{
	sbi_printf("[debug_handler] ############## DEBUG START ###########\n");
	if (funcid == 0x11223344) {
		section_ownership_dump();
		return 0;
	}

	if (funcid == 0x22334455) {
		uintptr_t src_sfn = args[0] >> SECTION_SHIFT;
		uintptr_t offset  = args[1];
		uintptr_t number  = args[2];

		uintptr_t cycle1, cycle2;

		sbi_printf("migration: 0x%lx to 0x%lx, %ld sections\n",
			   src_sfn << SECTION_SHIFT,
			   (src_sfn + offset) << SECTION_SHIFT, number);

		cycle1 = csr_read(CSR_CYCLE);
		for (int i = 0; i < number; i++)
			section_migration(src_sfn + i, src_sfn + i + offset);
		cycle2 = csr_read(CSR_CYCLE);
		sbi_printf("\033[0;36m0x%lx cycles\033[0m\n", cycle2 - cycle1);
	}

	sbi_printf("[debug_handler] ############## DEBUG END ###########\n");
	return 0;
}

struct sbi_ecall_extension ecall_debug = {
	.extid_start = SBI_EXT_DEBUG,
	.extid_end   = SBI_EXT_DEBUG,
	.handle	     = sbi_ecall_debug_handler,
};
