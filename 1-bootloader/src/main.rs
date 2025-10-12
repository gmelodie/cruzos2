#![no_std]
#![no_main]

use core::arch::asm;
// use core::panic::PanicInfo;

#[panic_handler]
fn panic(_: &::core::panic::PanicInfo) -> ! {
    loop {}
}

fn printc(c: char) {
    //e9 port hack
    unsafe {
        asm!("out dx, al", in("dx") 0xe9 as u16, in("al") c as u8);
    }

    unsafe {
        asm!(
            "int 0x10", //tell the bios to write content of al to screen
            in("al") c as u8,
            in("ah") 0x0e as u8,
            in("bx") 0 as u16,
        );
    }
}

unsafe fn println(line: &str) {
    for c in line.chars() {
        printc(c);
    }
}

#[no_mangle]
pub extern "C" fn kernel() -> ! {
    unsafe { println("hello from kernel") };
    // todo: add code
    loop {}
}
