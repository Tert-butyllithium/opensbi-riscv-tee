
// #include <linux/module.h>	/* Needed by all modules */
// #include <linux/kernel.h>	/* Needed for KERN_INFO */
// #include <linux/io.h>
#include "include/common.h"
#include "net/net.h"
#include "net/arp.h"
#include "include/timer.h"
#include "../util/drv_ctrl.h"

#define IOMAP_INIT 0
#define DO_ARP_TEST 1

extern u64 PHY_CLK_REG_REMAPPED;
extern u64 CCMU_BASE_REMAPPED;
extern u64 IOBASE_REMAPPED;
extern u64 SUNXI_TIMER_BASE_MAPPED;

uintptr_t DRV_CONSOLE_ADDR;
void (* printd_ptr)(const char* s, ...);

// struct in_addr net_ping_ip;
extern struct in_addr net_ping_ip;
static void do_ping(char* ip)
{
	// if (argc < 2)
	// 	return CMD_RET_USAGE;
	net_ping_ip = string_to_ip(ip);
	// if (net_ping_ip.s_addr == 0)
	// 	return CMD_RET_USAGE;

	if (net_loop(PING) < 0) {
		printf("ping failed; host %s is not alive\n", ip);
		// return CMD_RET_FAILURE;
		return;
	}

	printf("host %s is alive\n", ip);

	// return CMD_RET_SUCCESS;
}

static void do_ioremap(void){
	// PHY_CLK_REG_REMAPPED =  (u64) (ioremap(0x03000000, 4096) + 0x30);
	// CCMU_BASE_REMAPPED = (u64) (ioremap(CCMU_BASE,4096));
	// IOBASE_REMAPPED = (u64) (ioremap(IOBASE, 4096));
	// SUNXI_TIMER_BASE_MAPPED = (u64) (ioremap(SUNXI_TIMER_BASE, 4096));
}

static void do_iounmap(void){
	// iounmap((void*)PHY_CLK_REG_REMAPPED);
	// iounmap((void*)CCMU_BASE_REMAPPED);
	// iounmap((void*)IOBASE_REMAPPED);
	// iounmap((void*)SUNXI_TIMER_BASE_MAPPED);
}



extern int on_ethaddr(const char *name, const char *value, enum env_op op,
	int flags);


static int net_drv_init(void)
{
	__maybe_unused char tmp[50];
	printf("Hello world 1.\n");

	printf("SUNXI_TIMER_BASE_MAPPED: %p\n",&SUNXI_TIMER_BASE_MAPPED);
	do_ioremap();
	eth_initialize();

	// env_set("ipaddr", "192.168.100.233");
	net_ip = string_to_ip("192.168.100.22");
	// env_set("netmask", "255.255.255.0");
	net_netmask = string_to_ip("255.255.255.0");


	printf("\033[0;33m......eth_initialize finished......\n\033[0m");

	
	do_ping("192.168.100.3");
	// arp_init();
	// net_arp_wait_packet_ip = string_to_ip("192.168.100.3");
	// arp_request();
	/* 
	 * A non 0 return means net_drv_init failed; module can't be loaded. 
	 */
	return 0;
}

static void net_drv_exit(void)
{
	do_iounmap();
	printf("Goodbye world 1.\n");
}


drv_ctrl_t ctrls[] = { {
    .reg_addr = 0x03000000,
    .reg_size = 4096,
  },
  {
	.reg_addr = CCMU_BASE,
    .reg_size = 4096,
  },
  {
	.reg_addr = IOBASE,
    .reg_size = 4096,
  },
  {
	.reg_addr = SUNXI_TIMER_BASE,
    .reg_size = 4096,
  }
};

int iomap_init(int no, uintptr_t base){
	switch (no)
	{
	case 0:
		PHY_CLK_REG_REMAPPED = base;
		break;
	case 1:
		CCMU_BASE_REMAPPED = base;
		break;
	case 2:
		IOBASE_REMAPPED = base;
		break;
	case 3:
		SUNXI_TIMER_BASE_MAPPED = base;
		printf("SUNXI_TIMER_BASE_MAPPED: %lx @ %p (=base: %lx)\n", SUNXI_TIMER_BASE_MAPPED, &SUNXI_TIMER_BASE_MAPPED, base);
		break;
	default:
		break;
	}
}



uintptr_t net_cmd_handler(uintptr_t cmd, uintptr_t arg0, uintptr_t arg1, uintptr_t arg2) __attribute__((section(".text.init")));
uintptr_t net_cmd_handler(uintptr_t cmd, uintptr_t arg0, uintptr_t arg1,
			  uintptr_t arg2)
{
	// SBI_ECALL(0xdeadbeaf,arg0,cmd,0x2333);
	switch (cmd) {
	case QUERY_INFO:
		switch (arg0) {
		case QUERY_INFO:
			return sizeof(ctrls) / sizeof(drv_ctrl_t);
		case 0:
		case 1:
		case 2:
		case 3:
			return (uintptr_t)&ctrls[arg0];
		case 100:
			DRV_CONSOLE_ADDR = arg1;
			break;
		case 200:
			printd_ptr = (void*) arg1;
			break;
		default:
			break;
		}
	case IOMAP_INIT:
		return iomap_init(arg0, arg1);
	case DO_ARP_TEST:
		net_drv_init();
		return 0;
	}
	return 0;
}
