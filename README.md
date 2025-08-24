# cruzos2
CruzOS v2 - an OS written in Rust

I'll structure the first part of this as an assembly course, but I'm just going to be researching each topic on my own.

# Part 0 - Groundwork
1. Produce a 512 byte boot sector
2. Boot my boot sector in QEMU

# Part 1 - BIOS & Real Mode
1. Use BIOS interrupts to print and read disk sectors
2. Write text to VGA text buffer

# Part 2 - Protected Mode
1. Write GDT (Global Descriptor Table)
2. Switch CPU from 16-bit real mode to 32-bit protected mode
3. Write text to VGA without BIOS interrupts

# Part 3 - Rust!
1. Write a minimal assembly stub that
    1. sets up stack & segments;
    2. loads your Rust “kernel” into memory;
    3. jumps into a Rust fn _start().
2. Compile Rust for a freestanding target (#![no_std], #![no_main]).
3. Link Rust object code with your assembly stub.

# Part 4 - 2-stage bootloader
1. Move to 2-stage bootloader using C/Rust
2. Disk loading for bigger kernels
3. Set up a basic memory map (query BIOS for available RAM)

# Part 5 - Minimal Rust OS
1. Implement an IDT (Interrupt Descriptor Table)
2. Catch CPU exceptions (divide by zero handler)
3. Add timer interrupt (PIT)
4. Add a keyboard interrupt (IRQ1)

# Part 6 - Filesystem
1. Add FAT12/FAT16 parsing
    1. Locate file by name
    2. Translate cluster to sector and load it
2. Write a bin program to disk and get bootloader to load and run it

# Part 7 - Running binaries
1. Parse ELF
    1. Read headers
    2. Place sections `.text`, `.data`, etc in correct memory
    3. Jump to entry point

# Part 8 - syscalls
1. Define a set of syscalls that your system will perform and expose them
2. Write a small Rust lib to call each syscall
3. Make a couple programs using the Rust lib
