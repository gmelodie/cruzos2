TARGET := bootloader
LINKER_SCRIPT := linker.ld

all: $(TARGET).bin
	qemu-system-i386 -drive format=raw,file=$(TARGET).bin -display gtk

$(TARGET).o: $(TARGET).s
	as --32 -o $@ $^

$(TARGET).bin: $(LINKER_SCRIPT) $(TARGET).o
	ld -m elf_i386 -T $(LINKER_SCRIPT) -o $@ $^

clean:
	rm $(TARGET).o $(TARGET).bin
