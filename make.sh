make clean -C emodules
make -C emodules

make clean
make PLATFORM=qemu/virt FW_PAYLOAD_PATH=/home/prongs/src/u-boot/u-boot.bin CROSS_COMPILE=riscv64-unknown-linux-gnu-