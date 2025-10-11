OUTPUT_FORMAT(binary)
ENTRY(_start)

SECTIONS
{
    . = 0x00100000; /* load address of 64-bit kernel */
    .kernel :
	{
	  kernel.o(.text)
	  kernel.o(.rodata)
	  kernel.o(.data)
	  kernel.o(.bss)
	}

}

