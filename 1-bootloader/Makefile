RT0 := rt0
BOOTLOADER := bl
KERNEL := kernel

all: $(BOOTLOADER).bin $(KERNEL).bin
	cat $(BOOTLOADER).bin $(KERNEL).bin > boot.img
	qemu-system-i386 -drive format=raw,file=boot.img -display gtk

$(BOOTLOADER).o: $(BOOTLOADER).s
	as --32 -o $@ $^

$(RT0).o: $(RT0).s
	as --32 -o $@ $^

$(KERNEL).bin: $(KERNEL).rs
	rustc $(KERNEL).rs -C panic=abort --target x86_64-unknown-none -o $@

$(KERNEL).o: $(KERNEL).rs
	rustc $(KERNEL).rs -C panic=abort -C link-args="-T kernel.ld" --target x86_64-unknown-none --emit obj -o $@

$(BOOTLOADER).bin: $(BOOTLOADER).ld $(BOOTLOADER).o $(RT0).o $(KERNEL).o
	ld -m elf_i386 -T $(BOOTLOADER).ld -o $@

clean:
	rm $(BOOTLOADER).o $(BOOTLOADER).bin
	rm $(RT0).o
	rm $(KERNEL).o
