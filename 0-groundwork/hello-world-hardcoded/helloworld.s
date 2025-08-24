.global _start

_start:
    # clear screen
    mov $0x00, %ah # text mode (clears screen)
    mov $0x03, %al
    int $0x10

    mov $0xe, %ah # display string
    mov $'H', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $'e', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $'l', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $'l', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $'o', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $' ', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $'W', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $'o', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $'r', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $'l', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $'d', %al
    int $0x10 # call bios display

    mov $0xe, %ah # display string
    mov $'!', %al
    int $0x10 # call bios display

    .org 510
    .byte 0x55, 0xaa
