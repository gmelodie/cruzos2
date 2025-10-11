#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_: &::core::panic::PanicInfo) -> ! {
    loop {}
}
// fn main() {
//     loop {}
// }
