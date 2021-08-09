CC = ../../../tools/toolchain/riscv64-glibc-gcc-thead_20200702/bin/riscv64-unknown-linux-gnu-gcc 
OBJCOPY = ../../../tools/toolchain/riscv64-glibc-gcc-thead_20200702/bin/riscv64-unknown-linux-gnu-objcopy

CFLAGS = -nostdlib -static -mcmodel=medany -Werror -g -Wall

link_script = drv_base.lds
headers = drv_base.h drv_elf.h drv_handler.h drv_list.h drv_mem.h drv_syscall.h drv_util.h mm/*.h
src = drv_base.c drv_elf.c drv_handler.c drv_list.c drv_mem.c drv_syscall.c drv_util.c drv_entry.S mm/*.c 

target_dir = ../../firmware

all: emodule_base

emodule_base: emodule_base.bin
	$(OBJCOPY) -O binary --set-section-flags .bss=alloc,load,contents $< $@
	cp $@ $(target_dir)

emodule_base.bin: $(src) $(headers)
	$(CC) $(CFLAGS) $(src) -T $(link_script) -o $@


clean:
	-@rm emodule_base emodule_base.bin $(target_dir)/emodule_base