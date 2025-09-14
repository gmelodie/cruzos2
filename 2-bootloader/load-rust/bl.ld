OUTPUT_FORMAT(binary) /*   this is the important bit        */
                        /*   transform ELF into flat binary   */

ENTRY(_start)
SECTIONS
{
    . = 0x7c00;
    .bootloader :
	{
	  rt0.o(.text) bl.o(.text)
	  rt0.o(.rodata) bl.o(.rodata)
	  rt0.o(.data) bl.o(.data)
	  rt0.o(.bss) bl.o(.bss)
	}

    .text : {
        *(.text)
    }
    .data : {
        *(.data)
        *(.rodata)
    }
    /* Add boot section signature */
    . = 0x7c00 + 510;
    .signature :
	{
        BYTE(0x55)
        BYTE(0xAA)
    }
    _KERNEL_ADDR = .;	/* Byte count as far as here. */

	.kernel :
	{
	  kernel.o (.text .data .bss .rodata)
	}

	_KERNEL_SIZE = . - _KERNEL_ADDR; /* This is the kernel size. */

	_END_STACK = 0x7c00;

}
STARTUP(rt0.o)			 /* Prepend with the start file. */

