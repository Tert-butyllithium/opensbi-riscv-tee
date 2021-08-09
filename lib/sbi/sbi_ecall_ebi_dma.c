/*
 * (C) Copyright 2007-2013
* SPDX-License-Identifier:	GPL-2.0+
 * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
 * Jerry Wang <wangflord@allwinnertech.com>
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */

#include <sbi/sbi_ecall_ebi_dma.h>
#include <sbi/sbi_console.h>
#include <sbi/sbi_string.h>
#include <stddef.h>

#define SUNXI_DMA_MAX 16

static int dma_int_cnt;
static int dma_init = -1;
static sunxi_dma_source dma_channel_source[SUNXI_DMA_MAX];
__attribute__((section(".data")))
sunxi_dma_desc g_sunxi_dma_desc[SUNXI_DMA_MAX];
typedef unsigned int uint;
typedef unsigned long ulong;

static void flush_dcache_range(unsigned long start, unsigned long end);
static void invalidate_dcache_range(unsigned long start, unsigned long end);
__attribute__((unused)) static inline void flush_dcache();
static void dma_callback(void *arg);
static uint readl(uint *addr);
static void writel(uint val, uint *addr);
static int sunxi_get_lw32_addr(void *addr);
static void inline mem_dump(uint addr);

/**
 * @brief copy memory using DMA (DRAM to DRAM), CPU hangs during copying
 * 
 * @param src_addr: source physical address (32-bit)
 * @param dst_addr: destination physical address (32-bit)
 * @param count: number of bytes
 * @return int: 1 for success, 0 for fail
 */
int dma_copy(ulong src_addr, ulong dst_addr, ulong len)
{
	// struct sunxi_dma_source_t *dma_source;
	sunxi_dma_set dma_set;
	int status = 0;
	ulong hdma;
	// uint channel_count;
	uint src_addr_32 = (uint)src_addr, dst_addr_32 = (uint)dst_addr;
	uint len_32 = (uint)len;

	// settings
	dma_set.loop_mode	= 0;
	dma_set.wait_cyc	= 8;
	dma_set.data_block_size = 1 * 32 / 8;

	dma_set.channel_cfg.src_drq_type  = DMAC_CFG_TYPE_DRAM;
	dma_set.channel_cfg.src_addr_mode = DMAC_CFG_DEST_ADDR_TYPE_LINEAR_MODE;
	dma_set.channel_cfg.src_burst_length = DMAC_CFG_SRC_1_BURST;
	dma_set.channel_cfg.src_data_width   = DMAC_CFG_SRC_DATA_WIDTH_32BIT;
	dma_set.channel_cfg.reserved0	     = 0;

	dma_set.channel_cfg.dst_drq_type  = DMAC_CFG_TYPE_DRAM;
	dma_set.channel_cfg.dst_addr_mode = DMAC_CFG_DEST_ADDR_TYPE_LINEAR_MODE;
	dma_set.channel_cfg.dst_burst_length = DMAC_CFG_SRC_1_BURST;
	dma_set.channel_cfg.dst_data_width   = DMAC_CFG_SRC_DATA_WIDTH_32BIT;
	dma_set.channel_cfg.reserved1	     = 0;

	// init
	sunxi_dma_init();

	// request dma resource
	hdma = sunxi_dma_request_from_last(0);
	if (!hdma)
		return 0;
	// dma_source    = (struct sunxi_dma_source_t *)hdma;
	// channel_count = dma_source->channel_count;

	// interrupt setting
	sunxi_dma_install_int(hdma, dma_callback, NULL);
	sunxi_dma_enable_int(hdma);
	// set commit_para, config, link of the descriptor
	sunxi_dma_setting(hdma, &dma_set);
	// set source addr, dest addr, length; and launch dma operation
	flush_dcache_range(dst_addr, dst_addr + len);
	sunxi_dma_start(hdma, src_addr_32, dst_addr_32, len_32);

	// waiting for dma completion
	for (int i = 0;; i++) {
		status = sunxi_dma_querystatus(hdma);
		if (!status)
			break;
	}

	// invalidate cache
	// flush cache will write cache contents into memory,
	// causing data inconsistance
	invalidate_dcache_range(dst_addr, dst_addr + len);

	// free dma source
	sunxi_dma_release(hdma);
	sunxi_dma_free_int(hdma);
	sunxi_dma_disable_int(hdma);
	sunxi_dma_exit();

	return 1;
}

__attribute__((unused)) void dma_test()
{
	struct sunxi_dma_source_t *dma_source;
	ulong hdma;
	sunxi_dma_set dma_set;
	uint channel_count;
	uint src_addr = 0x48800000;
	uint dst_addr = 0x50000000;
	uint len      = 16;
	uint status   = 0;

	ulong ext_addr; // for test only

	// test data
	ext_addr = (ulong)src_addr;
	sbi_memset((void *)ext_addr, 0xab, 4096);
	ext_addr = (ulong)dst_addr;
	sbi_memset((void *)ext_addr, 0, 4096);
	mem_dump(dst_addr);

	// settings
	dma_set.loop_mode	= 0;
	dma_set.wait_cyc	= 8;
	dma_set.data_block_size = 1 * 32 / 8;

	dma_set.channel_cfg.src_drq_type  = DMAC_CFG_TYPE_DRAM;
	dma_set.channel_cfg.src_addr_mode = DMAC_CFG_DEST_ADDR_TYPE_LINEAR_MODE;
	dma_set.channel_cfg.src_burst_length = DMAC_CFG_SRC_1_BURST;
	dma_set.channel_cfg.src_data_width   = DMAC_CFG_SRC_DATA_WIDTH_32BIT;
	dma_set.channel_cfg.reserved0	     = 0;

	dma_set.channel_cfg.dst_drq_type  = DMAC_CFG_TYPE_DRAM;
	dma_set.channel_cfg.dst_addr_mode = DMAC_CFG_DEST_ADDR_TYPE_LINEAR_MODE;
	dma_set.channel_cfg.dst_burst_length = DMAC_CFG_SRC_1_BURST;
	dma_set.channel_cfg.dst_data_width   = DMAC_CFG_SRC_DATA_WIDTH_32BIT;
	dma_set.channel_cfg.reserved1	     = 0;

	// flush data cache
	flush_dcache_range(0x50000000UL, 0x60000000UL);

	// init
	sbi_printf("[m mode dma_test]\n");
	sunxi_dma_init();

	hdma = sunxi_dma_request_from_last(0);
	sbi_printf("[m mode dma_test] requested channel: 0x%lx\n", hdma);
	if (!hdma)
		return;

	// get dma source
	dma_source    = (struct sunxi_dma_source_t *)hdma;
	channel_count = dma_source->channel_count;
	sbi_printf("[m mode dma_test] requested channel count: %u\n",
		   channel_count);

	// interrupt setting
	sunxi_dma_install_int(hdma, dma_callback, NULL);
	sunxi_dma_enable_int(hdma);
	// set commit_para, config, link of the descriptor
	sunxi_dma_setting(hdma, &dma_set);
	// launch (set source_addr, dest_addr, byte_count)
	sunxi_dma_start(hdma, src_addr, dst_addr, len);

	for (int i = 0;; i++) {
		status = sunxi_dma_querystatus(hdma);
		if (i % 100 == 0)
			sbi_printf("[m mode dma_test] status: %u\n", status);
		if (!status)
			break;
	}

	sbi_printf("[m mode dma_test] dma done\n");

	// flush data cache
	invalidate_dcache_range(0x50000000UL, 0x60000000UL);

	// free dma source
	sunxi_dma_release(hdma);
	sunxi_dma_free_int(hdma);
	sunxi_dma_disable_int(hdma);
	sunxi_dma_exit();

	// check
	mem_dump(dst_addr);

	return;
}

static void dma_callback(void *arg)
{
	return;
}

static void inline mem_dump(uint addr)
{
	sbi_printf("[m mode mem_dump] dumping 0x%x\n", addr);
	ulong ext_addr	   = (ulong)addr;
	unsigned char *ptr = (unsigned char *)ext_addr;
	for (int i = 0; i < 64; i++) {
		sbi_printf("0x%x\n", *ptr++);
	}
}

__attribute__((unused)) static inline void flush_dcache()
{
	asm volatile("dcache.call");
}

static void flush_dcache_range(unsigned long start, unsigned long end)
{
	register unsigned long i asm("a0") = start & ~(L1_CACHE_BYTES - 1);
	for (; i < end; i += L1_CACHE_BYTES)
		asm volatile(".long 0x0295000b"); /*dcache.cpa a0*/
	asm volatile(".long 0x01b0000b");	  /*sync.is*/
}

static void invalidate_dcache_range(unsigned long start, unsigned long end)
{
	register unsigned long i asm("a0") = start & ~(L1_CACHE_BYTES - 1);

	for (; i < end; i += L1_CACHE_BYTES)
		asm volatile("dcache.ipa a0");

	asm volatile(".long 0x01b0000b");
}

static uint readl(uint *addr)
{
	return *addr;
}

static void writel(uint val, uint *addr)
{
	*addr = val;
}

static int sunxi_get_lw32_addr(void *addr)
{
	ulong u64_addr = (ulong)addr;
	int lower_32   = (int)u64_addr;
	return lower_32;
}

void sunxi_dma_reg_func(void *p)
{
	int i;
	uint pending;
	sunxi_dma_reg *dma_reg = (sunxi_dma_reg *)SUNXI_DMA_BASE;

	for (i = 0; i < 8 && i < SUNXI_DMA_MAX; i++) {
		pending = (DMA_PKG_END_INT << (i * 4)); // mask of pending-bit
		if (readl(&dma_reg->irq_pending0) & pending) {
			writel(pending,
			       &dma_reg->irq_pending0); // mark as pending
			if (dma_channel_source[i].dma_func.m_func != NULL)
				dma_channel_source[i].dma_func.m_func(
					dma_channel_source[i].dma_func.m_data);
		}
	}
	for (i = 8; i < SUNXI_DMA_MAX; i++) {
		pending = (DMA_PKG_END_INT << ((i - 8) * 4));
		if (readl(&dma_reg->irq_pending1) & pending) {
			writel(pending, &dma_reg->irq_pending1);
			if (dma_channel_source[i].dma_func.m_func != NULL)
				dma_channel_source[i].dma_func.m_func(
					dma_channel_source[i].dma_func.m_data);
		}
	}
}

void sunxi_dma_init(void)
{
	int i;
	sunxi_dma_reg *const dma_reg = (sunxi_dma_reg *)SUNXI_DMA_BASE;
	// struct sunxi_ccm_reg *const ccm =
	// 	(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;

	if (dma_init > 0)
		return;

		// #if defined(CONFIG_SUNXI_VERSION1)
		// 	setbits_le32(&ccm->ahb_gate0, 1 << AHB_GATE_OFFSET_DMA);
		// 	setbits_le32(&ccm->ahb_reset0_cfg, 1 << AHB_GATE_OFFSET_DMA);
		// #else
		// 	/* dma : mbus clock gating */
		// 	setbits_le32(&ccm->mbus_gate, 1 << 0);

		// 	/* dma reset */
		// 	setbits_le32(&ccm->dma_gate_reset, 1 << DMA_RST_OFS);

		// 	/* dma gating */
		// 	setbits_le32(&ccm->dma_gate_reset, 1 << DMA_GATING_OFS);
		// #endif

#if defined(CFG_SUNXI_DMA_DEFAULT_NS)
	writel(dma_reg->security & (~CFG_SUNXI_DMA_CHANNEL_MASK),
	       &dma_reg->security);
#endif

	writel(0, &dma_reg->irq_en0);
	writel(0, &dma_reg->irq_en0);

	writel(0xffffffff, &dma_reg->irq_pending0);
	writel(0xffffffff, &dma_reg->irq_pending1);

	/*auto MCLK gating  disable*/
	clrsetbits_le32(&dma_reg->auto_gate, 0x7 << 0, 0x7 << 0);

	sbi_memset((void *)dma_channel_source, 0,
		   SUNXI_DMA_MAX * sizeof(struct sunxi_dma_source_t));

	// dma_channel_source is stored as a global variable. initialized here.
	// g_sunxi_dma_desc is also stored as a global variable. used as dma descriptor.
	for (i = 0; i < SUNXI_DMA_MAX; i++) {
		dma_channel_source[i].used = 0;
		dma_channel_source[i].channel =
			&(dma_reg->channel[i]); // point to pa of the regs
		dma_channel_source[i].desc =
			&g_sunxi_dma_desc[i]; // point to the global variable
	}

	dma_int_cnt = 0;
	dma_init    = 1;

	return;
}

void sunxi_dma_exit(void)
{
	int i;
	ulong hdma;
	sunxi_dma_reg *dma_reg = (sunxi_dma_reg *)SUNXI_DMA_BASE;
	// struct sunxi_ccm_reg *const ccm =
	// 	(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;

	/* free dma channel if other module not free it */
	for (i = 0; i < SUNXI_DMA_MAX; i++) {
		if (dma_channel_source[i].used == 1) {
			hdma = (ulong)&dma_channel_source[i];
			sunxi_dma_disable_int(hdma);
			sunxi_dma_free_int(hdma);
			writel(0, &dma_channel_source[i]
					   .channel
					   ->enable); // write 0 to registers
			dma_channel_source[i].used = 0;
		}
	}
	/* irq disable */
	writel(0, &dma_reg->irq_en0);
	writel(0, &dma_reg->irq_en0);

	writel(0xffffffff, &dma_reg->irq_pending0);
	writel(0xffffffff, &dma_reg->irq_pending1);

#if defined(CFG_SUNXI_DMA_DEFAULT_NS)
	writel(dma_reg->security | CFG_SUNXI_DMA_CHANNEL_MASK,
	       &dma_reg->security);
#endif

	// #if defined(CONFIG_SUNXI_VERSION1)
	// 	clrbits_le32(&ccm->ahb_gate0, 1 << AHB_GATE_OFFSET_DMA);
	// #else
	// 	/* close dma clock when dma exit */
	// 	clrbits_le32(&ccm->dma_gate_reset, 1 << DMA_GATING_OFS);

	// 	clrbits_le32(&ccm->dma_gate_reset, 1 << DMA_RST_OFS);
	// #endif

	dma_init--;
}

ulong sunxi_dma_request_from_last(uint dmatype)
{
	int i;

	for (i = SUNXI_DMA_MAX - 1; i >= 0; i--) {
		if (dma_channel_source[i].used == 0) {
			dma_channel_source[i].used	    = 1;
			dma_channel_source[i].channel_count = i;
			return (ulong)&dma_channel_source[i];
		}
	}

	return 0;
}

ulong sunxi_dma_request(uint dmatype)
{
	int i;

	for (i = 0; i < SUNXI_DMA_MAX; i++) {
		if (dma_channel_source[i].used == 0) {
			dma_channel_source[i].used	    = 1;
			dma_channel_source[i].channel_count = i;
			return (ulong)&dma_channel_source[i];
		}
	}

	return 0;
}

// hdma points to one of the dma_channel_source's
int sunxi_dma_release(ulong hdma)
{
	struct sunxi_dma_source_t *dma_source =
		(struct sunxi_dma_source_t *)hdma;

	if (!dma_source->used)
		return -1;

	sunxi_dma_disable_int(hdma);
	sunxi_dma_free_int(hdma);

	dma_source->used = 0;

	return 0;
}

// writing commit_para, config, link of the descriptor
int sunxi_dma_setting(ulong hdma, sunxi_dma_set *cfg)
{

	uint commit_para;
	sunxi_dma_set *dma_set	     = cfg;
	sunxi_dma_source *dma_source = (sunxi_dma_source *)hdma;
	sunxi_dma_desc *desc	     = dma_source->desc;
	void *channel_addr =
		(&(dma_set->channel_cfg)); // channel_addr points to channel_cfg

	if (!dma_source->used)
		return -1;

	// if (dma_set->loop_mode)
	// 	desc->link = sunxi_get_lw32_addr((&dma_source->desc));
	// else
	desc->link = SUNXI_DMA_LINK_NULL;

	commit_para = (dma_set->wait_cyc & 0xff);
	commit_para |= (dma_set->data_block_size & 0xff) << 8;

	writel(commit_para, &desc->commit_para);
	writel(readl(channel_addr), &desc->config);

	return 0;
}

// writing source_addr, dest_addr, byte_count of the descriptor
// should be used after sunxi_dma_setting
int sunxi_dma_start(ulong hdma, phys_addr_t saddr, phys_addr_t daddr,
		    uint bytes)
{
	sunxi_dma_source *dma_source   = (sunxi_dma_source *)hdma;
	sunxi_dma_channel_reg *channel = dma_source->channel;
	sunxi_dma_desc *desc	       = dma_source->desc;
	uint val		       = 0;

	if (!dma_source->used)
		return -1;

	/*config desc */

	writel(saddr, &desc->source_addr);
	writel(daddr, &desc->dest_addr);
	writel(bytes, &desc->byte_count);

	// flush data cache before dma starts
	// flush_dcache_range((unsigned long)desc, (unsigned long)desc + sizeof(sunxi_dma_desc));
	flush_dcache();

	/* start dma */
	val = sunxi_get_lw32_addr(desc); // val points to the descriptor
	writel(val, &channel->desc_addr);
	writel(1, &channel->enable);

	return 0;
}

int sunxi_dma_stop(ulong hdma)
{
	sunxi_dma_source *dma_source   = (sunxi_dma_source *)hdma;
	sunxi_dma_channel_reg *channel = dma_source->channel;

	if (!dma_source->used)
		return -1;
	writel(0, &channel->enable);

	return 0;
}

int sunxi_dma_querystatus(ulong hdma)
{
	uint channel_count;
	sunxi_dma_source *dma_source = (sunxi_dma_source *)hdma;
	sunxi_dma_reg *dma_reg	     = (sunxi_dma_reg *)SUNXI_DMA_BASE;

	if (!dma_source->used)
		return -1;

	channel_count = dma_source->channel_count;

	return (readl(&dma_reg->status) >> channel_count) & 0x01;
}

int sunxi_dma_install_int(ulong hdma, interrupt_handler_t dma_int_func, void *p)
{
	sunxi_dma_source *dma_channel = (sunxi_dma_source *)hdma;
	sunxi_dma_reg *dma_reg	      = (sunxi_dma_reg *)SUNXI_DMA_BASE;
	uint channel_count;

	if (!dma_channel->used)
		return -1;

	channel_count = dma_channel->channel_count;

	if (channel_count < 8)
		writel((7 << channel_count * 4), &dma_reg->irq_pending0);
	else
		writel((7 << (channel_count - 8) * 4), &dma_reg->irq_pending1);

	if (!dma_channel->dma_func.m_func) {
		dma_channel->dma_func.m_func = dma_int_func;
		dma_channel->dma_func.m_data = p;
	} else {
		sbi_printf(
			"dma 0x%lx int is used already, you have to free it first\n",
			hdma);
	}

	return 0;
}

int sunxi_dma_enable_int(ulong hdma)
{
	sunxi_dma_source *dma_channel = (sunxi_dma_source *)hdma;
	sunxi_dma_reg *dma_status     = (sunxi_dma_reg *)SUNXI_DMA_BASE;
	uint channel_count;

	if (!dma_channel->used)
		return -1;

	channel_count = dma_channel->channel_count;
	if (channel_count < 8) {
		if (readl(&dma_status->irq_en0) &
		    (DMA_PKG_END_INT << channel_count * 4)) {
			sbi_printf("dma 0x%lx int is avaible already\n", hdma);
			return 0;
		}
		setbits_le32(&dma_status->irq_en0,
			     (DMA_PKG_END_INT << channel_count * 4));
	} else {
		if (readl(&dma_status->irq_en1) &
		    (DMA_PKG_END_INT << (channel_count - 8) * 4)) {
			sbi_printf("dma 0x%lx int is avaible already\n", hdma);
			return 0;
		}
		setbits_le32(&dma_status->irq_en1,
			     (DMA_PKG_END_INT << (channel_count - 8) * 4));
	}

	dma_int_cnt++;

	return 0;
}

int sunxi_dma_disable_int(ulong hdma)
{
	sunxi_dma_source *dma_channel = (sunxi_dma_source *)hdma;
	sunxi_dma_reg *dma_reg	      = (sunxi_dma_reg *)SUNXI_DMA_BASE;
	uint channel_count;

	if (!dma_channel->used)
		return -1;

	channel_count = dma_channel->channel_count;
	if (channel_count < 8) {
		if (!(readl(&dma_reg->irq_en0) &
		      (DMA_PKG_END_INT << channel_count * 4))) {
			sbi_printf("dma 0x%lx int is not used yet\n", hdma);
			return 0;
		}
		clrbits_le32(&dma_reg->irq_en0,
			     (DMA_PKG_END_INT << channel_count * 4));
	} else {
		if (!(readl(&dma_reg->irq_en1) &
		      (DMA_PKG_END_INT << (channel_count - 8) * 4))) {
			sbi_printf("dma 0x%lx int is not used yet\n", hdma);
			return 0;
		}
		clrbits_le32(&dma_reg->irq_en1,
			     (DMA_PKG_END_INT << (channel_count - 8) * 4));
	}

	/* disable golbal int */
	if (dma_int_cnt > 0)
		dma_int_cnt--;

	return 0;
}

int sunxi_dma_free_int(ulong hdma)
{
	sunxi_dma_source *dma_channel = (sunxi_dma_source *)hdma;
	sunxi_dma_reg *dma_status     = (sunxi_dma_reg *)SUNXI_DMA_BASE;
	uint channel_count;

	if (!dma_channel->used)
		return -1;

	channel_count = dma_channel->channel_count;
	if (channel_count < 8)
		writel((7 << channel_count), &dma_status->irq_pending0);
	else
		writel((7 << (channel_count - 8)), &dma_status->irq_pending1);

	if (dma_channel->dma_func.m_func) {
		dma_channel->dma_func.m_func = NULL;
		dma_channel->dma_func.m_data = NULL;
	} else {
		sbi_printf(
			"dma 0x%lx int is free, you do not need to free it again\n",
			hdma);
		return -1;
	}

	return 0;
}
