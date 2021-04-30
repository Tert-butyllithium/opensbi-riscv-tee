/*
 * SPDX-License-Identifier: BSD-2-Clause
 *
 * Copyright (c) 2020 Western Digital Corporation or its affiliates.
 *
 * Authors:
 *   Anup Patel <anup.patel@wdc.com>
 *   Atish Patra <atish.patra@wdc.com>
 */

#include <sbi/sbi_ecall.h>
#include <sbi/sbi_ecall_interface.h>
#include <sbi/sbi_error.h>
#include <sbi/sbi_hart.h>
#include <sbi/sbi_ipi.h>
#include <sbi/sbi_timer.h>
#include <sbi/sbi_tlb.h>
#include <sbi/riscv_asm.h>
#include <sbi/sbi_console.h>
#include <sbi/sbi_system.h>

static int sbi_ecall_time_handler(struct sbi_scratch *scratch,
				  unsigned long extid, unsigned long funcid,
				  unsigned long *args, unsigned long *out_val,
				  struct sbi_trap_info *out_trap)
{
	int ret = 0;

	if (funcid == SBI_EXT_TIME_SET_TIMER) {
#if __riscv_xlen == 32
		sbi_timer_event_start(scratch,
				      (((u64)args[1] << 32) | (u64)args[0]));
#else
		sbi_timer_event_start(scratch, (u64)args[0]);
#endif
	} else
		ret = SBI_ENOTSUPP;

	return ret;
}

struct sbi_ecall_extension ecall_time = {
	.extid_start = SBI_EXT_TIME,
	.extid_end = SBI_EXT_TIME,
	.handle = sbi_ecall_time_handler,
};

static int sbi_ecall_rfence_handler(struct sbi_scratch *scratch,
				    unsigned long extid, unsigned long funcid,
				    unsigned long *args, unsigned long *out_val,
				    struct sbi_trap_info *out_trap)
{
	int ret = 0;
	struct sbi_tlb_info tlb_info;
	u32 source_hart = sbi_current_hartid();

	if (funcid >= SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA &&
	    funcid <= SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID)
		if (!misa_extension('H'))
			return SBI_ENOTSUPP;

	switch (funcid) {
	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
		tlb_info.start  = 0;
		tlb_info.size  = 0;
		tlb_info.type  = SBI_ITLB_FLUSH;
		tlb_info.shart_mask = 1UL << source_hart;
		ret = sbi_tlb_request(scratch, args[0], args[1], &tlb_info);
		break;
	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
		tlb_info.start = (unsigned long)args[2];
		tlb_info.size  = (unsigned long)args[3];
		tlb_info.type  = SBI_TLB_FLUSH_GVMA;
		tlb_info.shart_mask = 1UL << source_hart;
		ret = sbi_tlb_request(scratch, args[0], args[1], &tlb_info);
		break;
	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
		tlb_info.start = (unsigned long)args[2];
		tlb_info.size  = (unsigned long)args[3];
		tlb_info.asid  = (unsigned long)args[4];
		tlb_info.type  = SBI_TLB_FLUSH_GVMA_VMID;
		tlb_info.shart_mask = 1UL << source_hart;
		ret = sbi_tlb_request(scratch, args[0], args[1], &tlb_info);
		break;
	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
		tlb_info.start = (unsigned long)args[2];
		tlb_info.size  = (unsigned long)args[3];
		tlb_info.type  = SBI_TLB_FLUSH_VVMA;
		tlb_info.shart_mask = 1UL << source_hart;
		ret = sbi_tlb_request(scratch, args[0], args[1], &tlb_info);
		break;
	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
		tlb_info.start = (unsigned long)args[2];
		tlb_info.size  = (unsigned long)args[3];
		tlb_info.asid  = (unsigned long)args[4];
		tlb_info.type  = SBI_TLB_FLUSH_VVMA_ASID;
		tlb_info.shart_mask = 1UL << source_hart;
		ret = sbi_tlb_request(scratch, args[0], args[1], &tlb_info);
		break;
	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
		tlb_info.start = (unsigned long)args[2];
		tlb_info.size  = (unsigned long)args[3];
		tlb_info.type  = SBI_TLB_FLUSH_VMA;
		tlb_info.shart_mask = 1UL << source_hart;
		ret = sbi_tlb_request(scratch, args[0], args[1], &tlb_info);
		break;
	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
		tlb_info.start = (unsigned long)args[2];
		tlb_info.size  = (unsigned long)args[3];
		tlb_info.asid  = (unsigned long)args[4];
		tlb_info.type  = SBI_TLB_FLUSH_VMA_ASID;
		tlb_info.shart_mask = 1UL << source_hart;
		ret = sbi_tlb_request(scratch, args[0], args[1], &tlb_info);
		break;

	default:
		ret = SBI_ENOTSUPP;
	};

	return ret;
}

struct sbi_ecall_extension ecall_rfence = {
	.extid_start = SBI_EXT_RFENCE,
	.extid_end = SBI_EXT_RFENCE,
	.handle = sbi_ecall_rfence_handler,
};

static int sbi_ecall_ipi_handler(struct sbi_scratch *scratch,
				 unsigned long extid, unsigned long funcid,
				 unsigned long *args, unsigned long *out_val,
				 struct sbi_trap_info *out_trap)
{
	int ret = 0;

	if (funcid == SBI_EXT_IPI_SEND_IPI)
		ret = sbi_ipi_send_smode(scratch, args[0], args[1]);
	else
		ret = SBI_ENOTSUPP;

	return ret;
}

struct sbi_ecall_extension ecall_ipi = {
	.extid_start = SBI_EXT_IPI,
	.extid_end = SBI_EXT_IPI,
	.handle = sbi_ecall_ipi_handler,
};

static int sbi_ecall_srst_handler(struct sbi_scratch *scratch,
				 unsigned long extid, unsigned long funcid,
				 unsigned long *args, unsigned long *out_val,
				 struct sbi_trap_info *out_trap)
{

	if (args[0] == SBI_EXT_SRST_RESET) {
		switch (args[1]) {
			case SBI_SRST_RESET_TYPE_SHUTDOWN:
				sbi_system_shutdown(scratch, 0);
				break;
			case SBI_SRST_RESET_TYPE_COLD_REBOOT:
			case SBI_SRST_RESET_TYPE_WARM_REBOOT:
				break;
			default:
				return SBI_ENOTSUPP;
		}

		switch (args[2]) {
			case SBI_SRST_RESET_REASON_NONE:
			case SBI_SRST_RESET_REASON_SYSFAIL:
				break;
			default:
				return SBI_ENOTSUPP;
		}
	}
	sbi_system_reboot(scratch, args[2]);

	return 0;
}

struct sbi_ecall_extension ecall_srst = {
	.extid_start = SBI_EXT_SRST,
	.extid_end = SBI_EXT_SRST,
	.handle = sbi_ecall_srst_handler,
};
