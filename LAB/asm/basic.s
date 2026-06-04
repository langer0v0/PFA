
#############################################################################
## Do not modify
#############################################################################
display_hex_digit:
    li t0, 0x10000000
    la t1, context_address
    addi t1, t1, 256
    lb t6, (t1)
    add t2, a0, zero
    li t3, 0
    li t4, 64
    li t6, '0'
    sb t6, (t0)
    li t6, 'x'
    sb t6, (t0)

    loop0:
        li t6, 60
        sub t6, t6, t3
        srl t5, t2, t6
        andi t5, t5, 0xf
        add t5, t5, t1
        lb t6, (t5)
        sb t6, (t0)
        addi t3, t3, 4
        bne t3, t4, loop0
    
    ret


display_bin_digit:
    li t0, 0x10000000
    li t1, 0
    add t2, a0, zero
    li t3, 64
    li t4, '0'
    sb t4, (t0)
    li t4, 'b'
    sb t4, (t0)

    loop1:
        li t4, '0'
        addi t3, t3, -1
        srl t5, t2, t3
        andi t5, t5, 1
        add t4, t4, t5
        sb t4, (t0)
        bne t3, zero, loop1
    
    ret


show_registers_and_stop:
    csrw mscratch, x2
    la x2, context_address

    sd x0 , (0  * 8)(x2) 
    sd x1 , (1  * 8)(x2) 

    csrr x1, mscratch
	sd x1 , (2  * 8)(x2) 

	sd x3 , (3  * 8)(x2) 
	sd x4 , (4  * 8)(x2) 
	sd x5 , (5  * 8)(x2) 
	sd x6 , (6  * 8)(x2) 
	sd x7 , (7  * 8)(x2) 
	sd x8 , (8  * 8)(x2) 
	sd x9 , (9  * 8)(x2) 
    sd x10, (10 * 8)(x2)
    sd x11, (11 * 8)(x2)
    sd x12, (12 * 8)(x2)
    sd x13, (13 * 8)(x2)
    sd x14, (14 * 8)(x2)
    sd x15, (15 * 8)(x2)
    sd x16, (16 * 8)(x2)
    sd x17, (17 * 8)(x2)
    sd x18, (18 * 8)(x2)
    sd x19, (19 * 8)(x2)
    sd x20, (20 * 8)(x2)
    sd x21, (21 * 8)(x2)
    sd x22, (22 * 8)(x2)
    sd x23, (23 * 8)(x2)
    sd x24, (24 * 8)(x2)
    sd x25, (25 * 8)(x2)
    sd x26, (26 * 8)(x2)
    sd x27, (27 * 8)(x2)
    sd x28, (28 * 8)(x2)
    sd x29, (29 * 8)(x2)
    sd x30, (30 * 8)(x2)
    sd x31, (31 * 8)(x2)

    li s5, 0
    li x3, 32 * 8
    li x4, 0x10000000

    li x5, '='
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    li x5, '\n'
    sb x5, 0(x4)


    li x5, '|'
    sb x5, 0(x4)
    sb x5, 0(x4)
    li x5, ' '
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    li x5, 'R'
    sb x5, 0(x4)
    li x5, 'E'
    sb x5, 0(x4)
    li x5, 'G'
    sb x5, 0(x4)
    li x5, ' '
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    li x5, '|'
    sb x5, 0(x4)
    sb x5, 0(x4)
    li x5, '\n'
    sb x5, 0(x4)


    li x5, '='
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    li x5, '\n'
    sb x5, 0(x4)

    display_value:
        li x4, 0x10000000
        add x5, x2, s5
        li x5, 'x'
        sb x5, 0(x4)
        srl x7, s5, 3
        li x8, 10
        div x9, x7, x8
        rem x10, x7, x8
        la x11, context_address
        addi x11, x11, 256
        add x9, x9, x11
        lb x5, 0(x9)
        sb x5, 0(x4)
        add x9, x10, x11
        lb x5, 0(x9)
        sb x5, 0(x4)
        li x5, ':'
        sb x5, 0(x4)
        li x5, ' '
        sb x5, 0(x4)

        add x6, x2, s5
        ld a0, (x6)
        
        call display_hex_digit

        li x5, ' '
        sb x5, 0(x4)
        li x5, '|'
        sb x5, 0(x4)
        sb x5, 0(x4)
        li x5, ' '
        sb x5, 0(x4)

        call display_bin_digit

        li x5, '\n'
        sb x5, 0(x4)
        addi s5, s5, 8
        blt s5, x3, display_value

    li x4, 0x10000000
    li x5, '='
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    sb x5, 0(x4)
    li x5, '\n'
    sb x5, 0(x4)

stop:
	.word 0


.pushsection .data;
    .align 3
	context_address:
		.dword 0 # x0
		.dword 0 # x1
		.dword 0 # x2
		.dword 0 # x3
		.dword 0 # x4
		.dword 0 # x5
		.dword 0 # x6
		.dword 0 # x7
        .dword 0 # x8
		.dword 0 # x9
		.dword 0 # x10
		.dword 0 # x11
		.dword 0 # x12
		.dword 0 # x13
		.dword 0 # x14
		.dword 0 # x15
        .dword 0 # x16
		.dword 0 # x17
		.dword 0 # x18
		.dword 0 # x19
		.dword 0 # x20
		.dword 0 # x21
		.dword 0 # x22
		.dword 0 # x23
        .dword 0 # x24
		.dword 0 # x25
		.dword 0 # x26
		.dword 0 # x27
		.dword 0 # x28
		.dword 0 # x29
		.dword 0 # x30
		.dword 0 # x31
    # context_address + 256
        .byte '0'
        .byte '1'
		.byte '2'
		.byte '3'
		.byte '4'
		.byte '5'
		.byte '6'
		.byte '7'
		.byte '8'
		.byte '9'
		.byte 'a'
		.byte 'b'
		.byte 'c'
		.byte 'd'
		.byte 'e'
		.byte 'f'
#############################################################################


    # context_address + 256 + 16
    .align 3
    heap:
        .zero 4096 * 16

    .align 3
    stack:
        .zero 4096
        
.popsection
