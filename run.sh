qemu-system-riscv64 -M virt -m 256M -nographic \
        -kernel build/platform/qemu/virt/firmware/fw_jump.elf \
        -device loader,file=/home/prongs/src/linux/arch/riscv/boot/Image,addr=0x80200000 \
        -drive file=/home/prongs/src/busybox/root.bin,format=raw,id=hd0 \
        -device virtio-blk-device,drive=hd0 \
        -append "root=/dev/vda rw console=ttyS0"
