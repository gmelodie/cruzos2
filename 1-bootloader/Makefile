RT0 := rt0
BOOTLOADER := bl
KERNEL := bootloader

# all: $(BOOTLOADER).bin $(KERNEL).bin
# 	cat $(BOOTLOADER).bin $(KERNEL).bin > boot.img
# 	qemu-system-i386 -drive format=raw,file=boot.img -display gtk
all: $(BOOTLOADER).bin
	cat $(BOOTLOADER).bin > boot.img
	qemu-system-i386 -drive format=raw,file=boot.img -display gtk

$(BOOTLOADER).o: $(BOOTLOADER).s
	as --32 -o $@ $^

$(RT0).o: $(RT0).s
	as --32 -o $@ $^

$(KERNEL).bin:
	RUSTFLAGS="-C panic=abort -C link-args=-Tkernel.ld" \
	cargo +nightly build \
	  -Z build-std=core,compiler_builtins \
	  -Z build-std-features=compiler-builtins-mem \
	  --target x86-16-real.json \
	  --release
	objcopy -O binary target/x86-16-real/release/bootloader $@

$(KERNEL).o:
	RUSTFLAGS="-C panic=abort -C link-args=-Tkernel.ld" \
	cargo +nightly rustc \
	  -Z build-std=core,compiler_builtins \
	  -Z build-std-features=compiler-builtins-mem \
	  --target x86-16-real.json \
	  --release \
	  -- \
	  --emit=obj -o $@

$(BOOTLOADER).bin: $(BOOTLOADER).ld $(BOOTLOADER).o $(RT0).o $(KERNEL).o
	ld -m elf_i386 -T $(BOOTLOADER).ld -o $@

clean:
	rm $(BOOTLOADER).o $(BOOTLOADER).bin
	rm $(RT0).o
	rm $(KERNEL).o
