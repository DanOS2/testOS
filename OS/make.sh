echo "****************************************"
echo "*************** Build OS ***************"
echo "****************************************"
yasm -f bin -o os.bin os/os.asm
dd if=os.bin of=/dev/fd
echo "*********** compile to img ***********"
dd if=/dev/zero of=disk.img bs=1024 count=1440
dd if=os.bin of=disk.img conv=notrunc
rm os.bin
