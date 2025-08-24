all:
	as --32 -o emptysector.o emptysector.s
	ld -m elf_i386 -T linker.ld -o emptysector.bin emptysector.o
	qemu-system-i386 -drive format=raw,file=emptysector.bin -display gtk
