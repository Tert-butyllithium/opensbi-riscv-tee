CC = riscv64-unknown-linux-gnu-gcc 
OBJCOPY = riscv64-unknown-linux-gnu-objcopy

CFLAGS = -nostdlib -static -mcmodel=medany -g -I../util

link_script = drv_console.lds
headers = drv_console.h 
src = drv_console.c 

target_dir = ../../firmware

all: drv_console

drv_console: drv_console.bin
	$(OBJCOPY) -O binary --set-section-flags .bss=alloc,load,contents $< $@
	cp $@ $(target_dir)

drv_console.bin: $(src) $(headers)
	$(CC) $(CFLAGS) $(src) -T $(link_script) -o $@


clean:
	-@rm drv_console drv_console.bin $(target_dir)/drv_console
