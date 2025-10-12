#![no_std]
#![no_main]

use core::arch::asm;

#[panic_handler]
fn panic(_: &::core::panic::PanicInfo) -> ! {
    loop {}
}

// Print a string using BIOS teletype (int 0x10, AH=0x0E)
unsafe fn println(line: &str) {
    let ptr = line.as_ptr();
    let mut i = 0u16;
    loop {
        let c = *ptr.add(i as usize);
        if c == 0 {
            break;
        }
        asm!(
            "mov ah, 0x0E",
            "mov al, {0}",
            "int 0x10",
            in(reg_byte) c,
        );
        i += 1;
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
    }
    loop {}
}
