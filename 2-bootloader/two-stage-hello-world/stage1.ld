OUTPUT_FORMAT(binary) /*   this is the important bit        */
                        /*   transform ELF into flat binary   */

ENTRY(_start)
SECTIONS
{
    . = 0x7c00;
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
}
