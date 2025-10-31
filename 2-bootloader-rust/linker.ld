OUTPUT_FORMAT(elf32-i386) /* output to elf so that objcopy can effectively reduce size of binary */

SECTIONS
{
	_END_STACK = 0x7c00;

    . = 0x7c00;
    .bootloader :
	{
	  *(.text*)
	  *(.rodata*)
	  *(.data*)
	  *(.bss*)
	}

    /* Add boot section signature */
    . = 0x7c00 + 510;
    .signature :
	{
        BYTE(0x55)
        BYTE(0xAA)
    }

}
/* STARTUP(rt0.o)			 /1* Prepend with the start file. *1/ */

