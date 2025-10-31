TARGET = x86-16-real.json
ASM = rt0.o
RUST_OBJ = ./target/x86-16-real/stage-1/libbootloader.a
BIN = bootloader.bin
ELF = bootloader.elf

all: $(BIN)
	qemu-system-i386 -drive format=raw,file=$(BIN) -display gtk

$(ASM): rt0.s
	as --32 $< -o $@

$(RUST_OBJ):
	cargo build --profile=stage-1 -Zbuild-std=core --target ./x86-16-real.json -Zbuild-std-features=compiler-builtins-mem

$(BIN): $(ASM) $(RUST_OBJ)
	ld -m elf_i386 -T linker.ld -o $(ELF) $(ASM) $(RUST_OBJ)
	objcopy -O binary --strip-all $(ELF) $@ # reduce bin size to fit in 512 bytes

clean:
	rm -f $(BIN) $(ELF) $(ASM) $(RUST_OBJ)

