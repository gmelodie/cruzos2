OUTPUT_FORMAT(binary) /*   this is the important bit        */
                        /*   transform ELF into flat binary   */

ENTRY(_start2)
SECTIONS
{
    . = 0x10000;
    .text : {
        *(.text)
    }
    .data : {
        *(.data)
        *(.rodata)
    }

}
