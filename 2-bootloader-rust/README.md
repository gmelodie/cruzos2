1. use rust-toolchain.toml to specify nightly channel
2. use .cargo/config.toml to specify -Z configs and target (x86-16-real.json)
3. use `staticlib` in Cargo.toml to produce `/target/x86-16-real/stage-1/libbootloader.a` and link that instead of a `.o` object file
