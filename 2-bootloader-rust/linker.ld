OUTPUT_FORMAT(binary) /*   this is the important bit        */
                        /*   transform ELF into flat binary   */

SECTIONS
{
    . = 0x7c00;
    .bootloader :
	{
	  rt0.o(.text)
	  rt0.o(.rodata)
	  rt0.o(.data)
	  rt0.o(.bss)
	}

    /* Add boot section signature */
    . = 0x7c00 + 510;
    .signature :
	{
        BYTE(0x55)
        BYTE(0xAA)
    }

	_END_STACK = 0x7c00;

}
/* STARTUP(rt0.o)			 /1* Prepend with the start file. *1/ */

