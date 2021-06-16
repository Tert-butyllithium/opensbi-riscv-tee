OUTPUT_ARCH( "riscv" )

ENTRY(_start)

SECTIONS
{
	_start = .;

	.text : {
		*(.text)
	}

	. = ALIGN(0x1000);
	.data : {
		*(.data)
	}
}