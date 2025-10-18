TARGET = x86-16-real.json
RUSTC = cargo +nightly rustc
ASM = rt0.o
RUST_OBJ = bootloader.o
OUT = bootloader.bin

all: $(OUT)
	qemu-system-i386 -drive format=raw,file=$(OUT) -display gtk

$(ASM): rt0.s
	as --32 $< -o $@

$(RUST_OBJ):
	RUSTFLAGS="-C panic=abort" \
	$(RUSTC) \
	  -Z build-std=core,compiler_builtins \
	  -Z build-std-features=compiler-builtins-mem \
	  --target $(TARGET) \
	  --release \
	  --lib \
	  -- \
	  -o $@ \
	  --emit=obj

$(OUT): $(ASM) $(RUST_OBJ)
	ld -m elf_i386 -T linker.ld -o $(OUT) $(ASM) $(RUST_OBJ)

clean:
	rm -f $(OUT) $(ASM) $(RUST_OBJ)
	cargo clean

