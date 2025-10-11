#![no_std]
#![no_main]

use core::arch::asm;
// use core::panic::PanicInfo;

#[panic_handler]
fn panic(_: &::core::panic::PanicInfo) -> ! {
    loop {}
}

unsafe fn println(line: &str) {
    asm!(
        "mov bx, {0}",
        "mov si, 0",
        "mov ah, 0x0E",
        "2:",
        "mov al, [bx + si]",
        "cmp al, 0",
        "je 2f",
        "int 0x10",
        "inc si",
        "jmp 1b",
        "3:",
        "mov al, 0x0D",
        "mov ah, 0x0E",
        "int 0x10",
        "mov al, 0x0A",
        "int 0x10",
        in(reg) line.as_ptr()
    );
}

#[no_mangle]
pub extern "C" fn kernel() -> ! {
    unsafe { println("hello from kernel") };
    // todo: add code
    loop {}
}
