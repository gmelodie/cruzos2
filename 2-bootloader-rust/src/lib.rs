#![no_std]
#![no_main]

use core::arch::asm;

// this will be set by linker
extern "C" {
    static _STAGE2_START: u16;
}

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
        println("");
        println("CruzOS 2 booting...");
    }
    let stage2_start: *const u16 = unsafe { &_STAGE2_START };
    // TODO: load from disk using LBA
    loop {}
}
