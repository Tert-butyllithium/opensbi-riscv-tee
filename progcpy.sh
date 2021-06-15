export busybox_path=/media/prongs/S/src/busybox
export prog_path=/media/prongs/S/secWorkspace/prog

cd $busybox_path
sudo mount -o loop root.bin mnt
rm -rf ./mnt/prog
cp -r $prog_path ./mnt/
sudo umount mnt