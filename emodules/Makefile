CC = riscv64-unknown-elf-gcc 
OBJCOPY = riscv64-unknown-elf-objcopy

CFLAGS = -nostdlib

link_script = emodule_base.lds
src = dummy_module.S

all: emodule_base

emodule_base: emodule_base.bin
	$(OBJCOPY) -O binary --set-section-flags .bss=alloc,load,contents $< $@

emodule_base.bin: $(src)
	$(CC) $(src) -T $(link_script) -o $@ $(CFLAGS)


clean:
	-@rm emodule_base emodule_base.bin