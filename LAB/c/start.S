#############################################################################
## Do not modify
#############################################################################
.globl _start
_start:
	la sp, _eusrstack
	call main

    beq a0, zero, stop
	j show_registers_and_stop


.include "././asm/basic.s"