qemu-system-riscv64 -M virt -m 2048M -nographic -s -S\
        -kernel build/platform/qemu/virt/firmware/fw_jump.elf \
        -device loader,file=/home/prongs/src/linux/arch/riscv/boot/Image,addr=0xa2000000 \
        -drive file=/home/prongs/src/busybox/root.bin,format=raw,id=hd0 \
        -device virtio-blk-device,drive=hd0 \
        -append "root=/dev/vda rw console=ttyS0 movablecore=0x10000000"


# add-symbol-file ~/src/linux/vmlinux
# ~/workspace/tina-d1-open/lichee/brandy-2.0/opensbi/build/platform/qemu/virt/firmware/fw_jump.elf

#       add-symbol-file ~/workspace/prog/alloc
#       add-symbol-file emodules/emodule_base/emodule_base.bin