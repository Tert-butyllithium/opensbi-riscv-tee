CC = ../../../tools/toolchain/riscv64-glibc-gcc-thead_20200702/bin/riscv64-unknown-linux-gnu-gcc 
OBJCOPY = ../../../tools/toolchain/riscv64-glibc-gcc-thead_20200702/bin/riscv64-unknown-linux-gnu-objcopy

CFLAGS = -nostdlib -static -mcmodel=medany -g -I../util

link_script = drv_rtc.lds
headers = drv_rtc.h 
src = drv_rtc.c ../emodule_base/drv_util.c 

target_dir = ../../firmware

all: drv_rtc

drv_rtc: drv_rtc.bin
	$(OBJCOPY) -O binary --set-section-flags .bss=alloc,load,contents $< $@
	cp $@ $(target_dir)

drv_rtc.bin: $(src) $(headers)
	$(CC) $(CFLAGS) $(src) -T $(link_script) -o $@


clean:
	-@rm drv_rtc drv_rtc.bin $(target_dir)/drv_rtc