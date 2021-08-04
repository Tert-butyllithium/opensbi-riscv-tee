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
__unused static pte* get_pte(uintptr_t pt_root, uintptr_t va)
{
	uintptr_t l[] = { (va & MASK_L2) >> 30, (va & MASK_L1) >> 21,
			  (va & MASK_L0) >> 12 };
	pte *root = (pte *)pt_root;
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
	uintptr_t satp = csr_read(CSR_SATP);
	uintptr_t mxstatus = csr_read(CSR_MXSTATUS);

	sbi_printf("satp = 0x%lx\n", satp);
	sbi_printf("mxstatus = 0x%lx\n", mxstatus);

	uintptr_t mask = ~(-1UL << 27);
	uintptr_t pte_ppn_mask = ~(-1UL << 44);
	uintptr_t pt_root = (satp & mask) << 12;

	uintptr_t root_pte = *(uintptr_t *)(pt_root);
	uintptr_t first_page_table_addr = ((root_pte >> 10) & pte_ppn_mask) << 12;

	uintptr_t first_page_table_pte = *(uintptr_t *)first_page_table_addr;
	uintptr_t second_page_table_addr = ((first_page_table_pte >> 10) & pte_ppn_mask) << 12;

	sbi_printf("1st level pt @ 0x%lx\n", first_page_table_addr);
	sbi_printf("2nd level pt @ 0x%lx\n", second_page_table_addr);

	mem_dump(second_page_table_addr, 1024);
	sbi_printf("[debug_handler] ############## DEBUG END ###########\n");
	return 0;
}

struct sbi_ecall_extension ecall_debug = {
	.extid_start = SBI_EXT_DEBUG,
	.extid_end   = SBI_EXT_DEBUG,
	.handle	     = sbi_ecall_debug_handler,
};
