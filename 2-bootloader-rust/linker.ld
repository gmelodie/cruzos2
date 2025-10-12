OUTPUT_FORMAT("binary")
ENTRY(_start)

SECTIONS
{
    . = 0x7C00;

    .text : {
        *(.text._start)      /* Entry point _start (assembly) */
        *(.text*)            /* All other text sections from Rust */
    }

    .rodata : {
        *(.rodata*)
    }

    .data : {
        *(.data*)
    }

    .bss : {
        *(.bss*)
        *(COMMON)
    }

    /* Add boot section signature */
    . = 0x7c00 + 510;
    .signature :
	{
        BYTE(0x55)
        BYTE(0xAA)
    }


}

