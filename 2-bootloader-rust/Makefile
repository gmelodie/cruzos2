TARGET = x86-16-real.json
ASM = rt0.o
RUST_OBJ = libbootloader.a
OUT = bootloader.bin

all: $(OUT)
	qemu-system-i386 -drive format=raw,file=$(OUT) -display gtk

$(ASM): rt0.s
	as --32 $< -o $@

$(RUST_OBJ):
	cargo build --profile=stage-1 -Zbuild-std=core --target ./x86-16-real.json -Zbuild-std-features=compiler-builtins-mem

$(OUT): $(ASM) $(RUST_OBJ)
	ld -m elf_i386 -T linker.ld -o $@ $(ASM) target/x86-16-real/stage-1/$(RUST_OBJ)

clean:
	rm -f $(OUT) $(ASM) $(RUST_OBJ)
	cargo clean

