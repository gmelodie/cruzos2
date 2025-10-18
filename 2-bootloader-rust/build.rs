use std::process::Command;

fn main() {
    // Assemble the 16-bit stub
    let status = Command::new("as")
        .args(&["--32", "rt0.s", "-o", "rt0.o"])
        .status()
        .unwrap();
    assert!(status.success());

    // Tell Cargo to link it
    println!("cargo:rustc-link-arg=rt0.o");
}
