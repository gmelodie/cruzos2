TARGET = x86-16-real.json
RUSTC = cargo +nightly rustc
OUT = bootloader

RUSTFLAGS = -C panic=abort \
             -C link-args=-Tlinker.ld \
             -C target-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2,-avx512f,-avx512dq,-avx512cd,-avx512bw,-avx512vl

all: $(OUT)
	echo $(OUT)
	qemu-system-i386 -drive format=raw,file=$(OUT) -display gtk

$(OUT):
	RUSTFLAGS="$(RUSTFLAGS)" \
	$(RUSTC) \
	  -Z build-std=core,compiler_builtins \
	  -Z build-std-features=compiler-builtins-mem \
	  --target $(TARGET) \
	  --release \
	  -- -o $(OUT)

clean:
	cargo clean
	rm -f $(OUT)

