all:
	as --32 -o helloworld.o helloworld.s
	ld -m elf_i386 -T linker.ld -o helloworld.bin helloworld.o
	qemu-system-i386 -drive format=raw,file=helloworld.bin -display gtk
