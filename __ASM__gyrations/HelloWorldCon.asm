		.syntax unified
		.cpu cortex-m4
		.eabi_attribute 27, 3
		.eabi_attribute 28, 1
		.fpu fpv4-sp-d16
		.eabi_attribute 20, 1
		.eabi_attribute 21, 1
		.eabi_attribute 23, 3
		.eabi_attribute 24, 1
		.eabi_attribute 25, 1
		.eabi_attribute 26, 1
		.eabi_attribute 30, 4
		.eabi_attribute 18, 4
		.thumb
		.file	"Hello_world.c"
 		 	bl main				
		breakpoint:				
 		  	.word	0xf810f7fa    
 				b	breakpoint		
		printf:					
 				mov		r9,lr		
 		  	.word	0xfdf0f7f9    
 				bx 		r9			
		sprintf:					
 				mov		r9,lr		
 		  	.word	0xfdf6f7f9    
 				bx 		r9			
		.thumb
		@.text
		@.align	1
		@.global	getc
		.thumb
		@.thumb_func
	getc:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L2
 		push	{r3, lr}
 		movw	r3, #8617
 		str	r3, [r2, #0]
	@ 34 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push {r4,r7}
	@ 0 "" 2
	@ 35 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r4,r0	
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 37 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r0,r7	
	@ 0 "" 2
	@ 38 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r4,r7}
	@ 0 "" 2
	@ 39 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r3,pc}	
	@ 0 "" 2
		.thumb
 		movs	r0, #0
 		pop	{r3, pc}
	.L3:
		@.align	2
	.L2:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	putc
		.thumb
		@.thumb_func
	putc:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L5
 		push	{r3, lr}
 		movw	r3, #8629
 		str	r3, [r2, #0]
	@ 46 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r4,r7}
	@ 0 "" 2
	@ 47 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7, r0
	@ 0 "" 2
	@ 48 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov r4, r1
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 50 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r0,r7
	@ 0 "" 2
	@ 51 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r4,r7}
	@ 0 "" 2
	@ 52 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r3,pc}
	@ 0 "" 2
		.thumb
 		movs	r0, #0
 		pop	{r3, pc}
	.L6:
		@.align	2
	.L5:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	puts
		.thumb
		@.thumb_func
		puts:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		push	{r4, lr}
 		mov	r4, r0
 		movs	r0, #0
 		b	.L8
	.L9:
 		mov	r0, r3
 		movs	r1, #0
 		bl	putc
 		uxtb	r0, r0
	.L8:
 		ldrb	r3, [r4], #1	@ zero_extendqisi2
 		cmp	r3, #0
 		bne	.L9
 		pop	{r4, pc}
		@.align	1
		@.global	micros
		.thumb
		@.thumb_func
	micros:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L11
 		push	{r3, lr}
 		movw	r3, #7745
 		str	r3, [r2, #0]
	@ 69 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r7}
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 71 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r0,r7
	@ 0 "" 2
	@ 72 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r7}
	@ 0 "" 2
	@ 73 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r3,pc}
	@ 0 "" 2
		.thumb
 		movs	r0, #0
 		pop	{r3, pc}
	.L12:
		@.align	2
	.L11:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	waitmicro
		.thumb
		@.thumb_func
	waitmicro:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L14
 		push	{r3, lr}
 		movw	r3, #7777
 		str	r3, [r2, #0]
	@ 80 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r7}
	@ 0 "" 2
	@ 81 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7,r0
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 83 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r7}
	@ 0 "" 2
		.thumb
 		pop	{r3, pc}
	.L15:
		@.align	2
	.L14:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	wait
		.thumb
		@.thumb_func
	wait:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L17
 		push	{r3, lr}
 		movw	r3, #7783
 		str	r3, [r2, #0]
	@ 89 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r7}
	@ 0 "" 2
	@ 90 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7,r0
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 92 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r7}
	@ 0 "" 2
		.thumb
 		pop	{r3, pc}
	.L18:
		@.align	2
	.L17:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	rdDIR
		.thumb
		@.thumb_func
	rdDIR:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L20
 		push	{r3, lr}
 		movw	r3, #8569
 		str	r3, [r2, #0]
	@ 98 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r7}
	@ 0 "" 2
	@ 99 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7,r0
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 101 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r0,r7
	@ 0 "" 2
	@ 102 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r7}
	@ 0 "" 2
	@ 103 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r3,pc}
	@ 0 "" 2
		.thumb
 		movs	r0, #0
 		pop	{r3, pc}
	.L21:
 		@.align	2
	.L20:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	wrDIR
		.thumb
		@.thumb_func
	wrDIR:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L23
 		push	{r3, lr}
 		movw	r3, #8459
 		str	r3, [r2, #0]
	@ 110 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r4,r7}
	@ 0 "" 2
	@ 111 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r4,r0
	@ 0 "" 2
	@ 112 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7,r1
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 114 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r4,r7}
	@ 0 "" 2
		.thumb
 		pop	{r3, pc}
	.L24:
 		@.align	2
	.L23:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	rdGPIO
		.thumb
		@.thumb_func
	rdGPIO:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L26
 		push	{r3, lr}
 		movw	r3, #8501
 		str	r3, [r2, #0]
	@ 120 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r7}
	@ 0 "" 2
	@ 121 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7,r0
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 123 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r0,r7
	@ 0 "" 2
	@ 124 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r7}
	@ 0 "" 2
	@ 125 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r3,pc}
	@ 0 "" 2
		.thumb
 		movs	r0, #0
 		pop	{r3, pc}
	.L27:
 		@.align	2
	.L26:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	wrGPIO
		.thumb
		@.thumb_func
	wrGPIO:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L29
 		push	{r3, lr}
 		movw	r3, #8537
 		str	r3, [r2, #0]
	@ 132 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r4,r7}
	@ 0 "" 2
	@ 133 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r4,r0
	@ 0 "" 2
	@ 134 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7,r1
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 136 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r4,r7}
	@ 0 "" 2
		.thumb
 		pop	{r3, pc}
	.L30:
 		@.align	2
	.L29:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	intsw
		.thumb
		@.thumb_func
	intsw:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L32
 		push	{r3, lr}
 		movw	r3, #8353
 		str	r3, [r2, #0]
	@ 142 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r7}
	@ 0 "" 2
	@ 143 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7,r0
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 145 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r7}
	@ 0 "" 2
		.thumb
 		pop	{r3, pc}
	.L33:
		@.align	2
	.L32:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	setbaud
		.thumb
		@.thumb_func
	setbaud:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L35
 		push	{r3, lr}
 		movw	r3, #8609
 		str	r3, [r2, #0]
	@ 151 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r4,r7}
	@ 0 "" 2
	@ 152 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r4,r0
	@ 0 "" 2
	@ 153 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7,r1
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 155 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r4,r7}
	@ 0 "" 2
		.thumb
 		pop	{r3, pc}
	.L36:
 		@.align	2
	.L35:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	settimer
		.thumb
		@.thumb_func
	settimer:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L38
 		push	{r3, lr}
 		movw	r3, #7755
 		str	r3, [r2, #0]
	@ 162 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r7}
	@ 0 "" 2
	@ 163 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7,r0
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 165 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r7}
	@ 0 "" 2
		.thumb
 		pop	{r3, pc}
	.L39:
		@.align	2
	.L38:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	flash_write
		.thumb
		@.thumb_func
	flash_write:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		push	{r3, lr}
	@ 170 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push {r4,r7}
	@ 0 "" 2
	@ 171 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov  r4,r9
	@ 0 "" 2
	@ 172 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push {r4}
	@ 0 "" 2
	@ 173 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov  r4,r0
	@ 0 "" 2
	@ 174 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov  r9,r1
	@ 0 "" 2
	@ 175 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov  r7,r2
	@ 0 "" 2
		.thumb
 		ldr	r2, .L41
 		movw	r3, #8363
 		str	r3, [r2, #0]
 		blx	r3
	@ 178 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r0,r7
	@ 0 "" 2
	@ 179 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r4}
	@ 0 "" 2
	@ 180 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r9,r4
	@ 0 "" 2
	@ 181 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r4,r7}
	@ 0 "" 2
	@ 182 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r3,pc}
	@ 0 "" 2
		.thumb
 		movs	r0, #0
 		pop	{r3, pc}
	.L42:
 		@.align	2
	.L41:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		@.align	1
		@.global	adin
		.thumb
		@.thumb_func
	adin:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		ldr	r2, .L44
 		push	{r3, lr}
 		movw	r3, #8963
 		str	r3, [r2, #0]
	@ 190 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			push	{r7}
	@ 0 "" 2
	@ 191 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r7,r0
	@ 0 "" 2
		.thumb
 		blx	r3
	@ 193 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			mov	r0,r7
	@ 0 "" 2
	@ 194 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r7}
	@ 0 "" 2
	@ 195 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
 			pop	{r3,pc}
	@ 0 "" 2
		.thumb
 		movs	r0, #0
 		pop	{r3, pc}
	.L45:
 		@.align	2
	.L44:
 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
		.word	0x6c6c6548
		.word	0x6f57206f
		.word	0x2c646c72
		.word	0x776f4e20
		.word	0x6f726420
		.word	0x6e692070
		.word	0x74206f74
		.word	0x72206568
		.word	0x69746e75
		.word	0x6420656d
		.word	0x67756265
		.word	0x0d726567
		.word	0x20000d0a
		.word	0x70797420
		.word	0x68402065
		.word	0x6e2d7865
		.word	0x65626d75
		.word	0x6f742072
		.word	0x73696420
		.word	0x79616c70
		.word	0x6d656d20
		.word	0x2f79726f
		.word	0x69676572
		.word	0x72657473
		.word	0x20746120
		.word	0x2d786568
		.word	0x626d756e
		.word	0x000d7265
		.word	0x79742020
		.word	0x40206570
		.word	0x2d786568
		.word	0x626d756e
		.word	0x68207265
		.word	0x6e2d7865
		.word	0x20326d75
		.word	0x64206f74
		.word	0x6c707369
		.word	0x6d207961
		.word	0x726f6d65
		.word	0x65722f79
		.word	0x74736967
		.word	0x61207265
		.word	0x65682074
		.word	0x756e2d78
		.word	0x7265626d
		.word	0x726f6620
		.word	0x78656820
		.word	0x6d756e5f
		.word	0x20726562
		.word	0x64726f77
		.word	0x20000d73
		.word	0x70797420
		.word	0x68212065
		.word	0x6e2d7865
		.word	0x65626d75
		.word	0x65682072
		.word	0x756e2d78
		.word	0x7420326d
		.word	0x6863206f
		.word	0x65676e61
		.word	0x6d656d20
		.word	0x2079726f
		.word	0x65682040
		.word	0x756e2d78
		.word	0x7265626d
		.word	0x206f7420
		.word	0x2d786568
		.word	0x326d756e
		.word	0x2020000d
		.word	0x65707974
		.word	0x66205e20
		.word	0x6320726f
		.word	0x2065646f
		.word	0x63206f74
		.word	0x69746e6f
		.word	0x0d65756e
		.word	0x0d000d0a
		.word	0x620a0d0a
		.word	0x6b616572
		.word	0x6e696f70
		.word	0x6f642074
		.word	0x6120656e
		.word	0x7720646e
		.word	0x65722765
		.word	0x6e6f6320
		.word	0x756e6974
		.word	0x2e676e69
		.word	0x000d2e2e
		@.section	.text.startup,"ax",%progbits
		@.align	1
		@.global	main
		.thumb
		@.thumb_func
	main:
		@ args = 0, pretend = 0, frame = 0
		@ frame_needed = 0, uses_anonymous_args = 0
 		push	{r3, lr}
 		ldr	r0, .L47
 		bl	puts
 		ldr	r0, .L47+4
 		bl	puts
 		ldr	r0, .L47+8
 		bl	puts
 		ldr	r0, .L47+12
 		bl	puts
 		ldr	r0, .L47+16
 		bl	puts
 		bl	breakpoint
 		ldr	r0, .L47+20
 		bl	puts
 		movs	r0, #0
 		pop	{r3, pc}
	.L48:
 		@.align	2
	.L47:
		.word	0x000081d0
		.word	0x00008203
		.word	0x00008240
		.word	0x0000829b
		.word	0x000082e2
		.word	0x00008303



