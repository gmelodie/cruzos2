BOOTLOADER := bl

all: $(BOOTLOADER).bin
	qemu-system-i386 -drive format=raw,file=boot.img -display gtk

$(BOOTLOADER).o: $(BOOTLOADER).s
	as --32 -o $@ $^

$(BOOTLOADER).bin: $(BOOTLOADER).ld $(BOOTLOADER).o
	ld -m elf_i386 -T $(BOOTLOADER).ld -o $@ $(BOOTLOADER).o

clean:
	rm $(BOOTLOADER).o $(BOOTLOADER).bin
