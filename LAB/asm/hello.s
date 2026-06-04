.globl _start 
.globl main

_start:
main:
    la sp, user_stack
    la a0, msg0
    call print_string

    la a0, msg1
    call print_string

    j stop


print_string:
    sd ra, -8(sp)
    addi t0, a0, 0
    li t2, 0x10000000

l0:
    lb t1, 0(t0)
    sb t1, 0(t2)
    addi t0, t0, 1 
    bne t1, zero, l0

    ld ra, -8(sp)
    ret


.pushsection .data;
    .align 3
	msg0:
		.string "\033[0;33;45mHello World!\033[0m"

    msg1:
        .string "\n             -- \033[0;36;40mFrom PFA LAB\033[0m\n"
    
    .align 3
    .zero 16384 # 16 KB
    user_stack:
    .zero 1024
.popsection

.include "./asm/basic.s"