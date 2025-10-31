#![no_std]
#![no_main]

use core::arch::asm;

#[panic_handler]
fn panic(_: &::core::panic::PanicInfo) -> ! {
    loop {}
}

unsafe fn print_char(c: u8) {
    asm!(
        "mov ah, 0x0E",
        "int 0x10",
        in("al") c,
    );
}

// Print a string using BIOS teletype (int 0x10, AH=0x0E)
unsafe fn println(line: &str) {
    for b in line.bytes() {
        print_char(b);
    }

    // Newline
    asm!(
        "mov ah, 0x0E",
        "mov al, 0x0D",
        "int 0x10",
        "mov al, 0x0A",
        "int 0x10",
    );
}

#[no_mangle]
pub extern "C" fn bootloader() -> ! {
    unsafe {
        println("Hello from Rust 16-bit bootloader!");
        println("Hello2 from Rust 16-bit bootloader!");
    }
    loop {}
}
