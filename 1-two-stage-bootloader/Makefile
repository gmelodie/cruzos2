STAGE1 := stage1
STAGE2 := stage2

all: $(STAGE1).bin $(STAGE2).bin
	cat $(STAGE1).bin $(STAGE2).bin > boot.img
	qemu-system-i386 -drive format=raw,file=boot.img -display gtk

$(STAGE1).o: $(STAGE1).s
	as --32 -o $@ $^

$(STAGE1).bin: $(STAGE1).ld $(STAGE1).o
	ld -m elf_i386 -T $(STAGE1).ld -o $@ $(STAGE1).o

$(STAGE2).o: $(STAGE2).s
	as --32 -o $@ $^

$(STAGE2).bin: $(STAGE2).ld $(STAGE2).o
	ld -m elf_i386 -T $(STAGE2).ld -o $@ $(STAGE2).o

clean:
	rm $(STAGE1).o $(STAGE1).bin
	rm $(STAGE2).o $(STAGE2).bin
