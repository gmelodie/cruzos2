OUTPUT_FORMAT(elf32-i386) /* output to elf so that objcopy can effectively reduce size of binary */

SECTIONS
{
    _STACK_SIZE = 0x1000;         /* 4 KiB stack */
    _END_STACK = 0x7c00 - _STACK_SIZE;

    . = 0x7c00;
    .bootloader :
	{
	  *(.text*)
	  *(.rodata*)
	  *(.data*)
	  *(.bss*)
	}

     . = 0x7c00 + 0x1be; /* replace with + 0x1b8 if using disk id and reserved */
     /* since I wont use those two, grabbing the free 6 bytes thank you very much */

    /* MBR Data */

    /* ommiting disk id and reserved can give us 2 extra bytes for code */
    /* /1* unique disk id *1/ */
    /* .diskid : */
    /* { */
    /*     BYTE(0xfb) */
    /*     BYTE(0x00) */
    /*     BYTE(0xb1) */
    /*     BYTE(0xe5) */
    /* } */

    /* /1* reserveD *1/ */
    /* .reserved : */
    /* { */
    /*     BYTE(0x00) */
    /*     BYTE(0x00) */
    /* } */

    /* first partition table (used for storing bootloader) */
    .mbr :
    {
        BYTE(0x80) /* drive attribute */

        BYTE(0x20)
        BYTE(0x21)
        BYTE(0x00) /* chs address of partition start */

        BYTE(0x00) /* partition type */

        BYTE(0x41)
        BYTE(0x01)
        BYTE(0x00) /* chs address of last partition */

        BYTE(0x00)
        BYTE(0x08)
        BYTE(0x00)
        BYTE(0x00) /* lba of partition start */

        BYTE(0x00)
        BYTE(0x08)
        BYTE(0x00)
        BYTE(0x00) /* number of sectors */
    }

    . = 0x7c00 + 0x1fe;

    .magic_number :
    {
        SHORT(0xaa55)
    }

    _STAGE2_START = .;

}

/* we dont need the startup here because we're passing it as the first file with the ld command */
/* STARTUP(rt0.o) /1* this replaces .global _start in rt0.s *1/ */


