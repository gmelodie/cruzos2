.code16
.global _start

_start:
    # clear screen
    mov $0x00, %ah
    mov $0x03, %al
    int $0x10

    mov $some_string, %ax
    call print_string

    mov $another_string, %ax
    call print_string

.hang:
    hlt
    jmp .hang

print_string:
    mov %ax, %bx
    mov $0x0, %si
    mov $0x0e, %ah
.loop:
    mov (%bx, %si), %al
    cmp $0, %al
    je .end
    int $0x10
    add $0x1, %si
    jmp .loop
.end:
    mov $0x0D, %al
    mov $0x0E, %ah
    int $0x10        # carriage return

    mov $0x0A, %al
    int $0x10        # line feed
    ret

some_string:
    .string "Hello World!"
another_string:
    .string "Second thing!"

.org 510
.byte 0x55, 0xaa

