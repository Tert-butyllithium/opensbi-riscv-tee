/*
 * SPDX-License-Identifier: BSD-2-Clause
 *
 * Copyright (c) 2019 Western Digital Corporation or its affiliates.
 *
 * Authors:
 *   Anup Patel <anup.patel@wdc.com>
 */

#ifndef __SBI_ECALL_INTERFACE_H__
#define __SBI_ECALL_INTERFACE_H__

/* clang-format off */

/* SBI Extension IDs */
#define	SBI_EXT_0_1_SET_TIMER			0x0
#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
#define SBI_EXT_0_1_CONSOLE_GETCHAR		0x2
#define SBI_EXT_0_1_CLEAR_IPI			0x3
#define SBI_EXT_0_1_SEND_IPI			0x4
#define SBI_EXT_0_1_REMOTE_FENCE_I		0x5
#define SBI_EXT_0_1_REMOTE_SFENCE_VMA		0x6
#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID	0x7
#define SBI_EXT_0_1_SHUTDOWN			0x8
#define SBI_EXT_BASE				0x10
#define SBI_EXT_TIME				0x54494D45
#define SBI_EXT_IPI				0x735049
#define SBI_EXT_RFENCE				0x52464E43
#define SBI_EXT_SRST                            0x53525354
#define SBI_EXT_EBI				0x19260817
#define SBI_EXT_DEBUG           		0xdeadbeef

/* SBI function IDs for BASE extension*/
#define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
#define SBI_EXT_BASE_GET_IMP_ID			0x1
#define	SBI_EXT_BASE_GET_IMP_VERSION		0x2
#define	SBI_EXT_BASE_PROBE_EXT			0x3
#define	SBI_EXT_BASE_GET_MVENDORID		0x4
#define	SBI_EXT_BASE_GET_MARCHID		0x5
#define	SBI_EXT_BASE_GET_MIMPID			0x6

/* SBI function IDs for TIME extension*/
#define SBI_EXT_TIME_SET_TIMER			0x0

/* SBI function IDs for IPI extension*/
#define SBI_EXT_IPI_SEND_IPI			0x0


/* SBI function IDs for SRST extension */
#define SBI_EXT_SRST_RESET                      0x0

#define SBI_SRST_RESET_TYPE_SHUTDOWN            0x0
#define SBI_SRST_RESET_TYPE_COLD_REBOOT 0x1
#define SBI_SRST_RESET_TYPE_WARM_REBOOT 0x2
#define SBI_SRST_RESET_TYPE_LAST        SBI_SRST_RESET_TYPE_WARM_REBOOT

#define SBI_SRST_RESET_REASON_NONE      0x0
#define SBI_SRST_RESET_REASON_SYSFAIL   0x1


/* SBI function IDs for RFENCE extension*/
#define	SBI_EXT_RFENCE_REMOTE_FENCE_I		0x0
#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA	0x1
#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID	0x2
#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA	0x3
#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID	0x4
#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA	0x5
#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID	0x6

#define SBI_SPEC_VERSION_MAJOR_OFFSET	24
#define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
#define SBI_SPEC_VERSION_MINOR_MASK	0xffffff
#define SBI_EXT_VENDOR_START		0x09000000
#define SBI_EXT_VENDOR_END		0x09FFFFFF

/* SBI function IDs for EBI extension*/
#define SBI_EXT_EBI_START   398
#define SBI_EXT_EBI_CREATE  399
#define SBI_EXT_EBI_ENTER   400
#define SBI_EXT_EBI_EXIT    401
// #define SBI_EXT_EBI_GOTO    402
// #define SBI_EXT_EBI_FETCH   403
// #define SBI_EXT_EBI_RELEASE 404
#define SBI_EXT_EBI_MEM_ALLOC 405

#define SBI_EXT_EBI_PUTS    410
#define SBI_EXT_EBI_GETS    411

#define SBI_EXT_EBI_PERI_INFORM 420

/* clang-format on */

#endif
