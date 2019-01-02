// ABE #Include Prototype
' #define ABE_Generic				' Generic #defs to ease programming
' #define ABE_Bitwise				' Bitwise Operations
' #define ABE_FloatHelpers			' Floating Point Helping routines - to include NAN testing and such
' #define ABE_RNG					' Random Number Generator - xbit integer, floating point 0-1, bounded (min/max), etc.
' #define ABE_SortHelpers			' helper code to facilitate sorting
' #define ABE_ASCStuffs				' Silly code with several instances of ASC therein
' #define ABE_DDR					' Data Direction Port save-restore - deprecated until built up for multiple targets, esp w/ > 32 GPIO pins...
#define ABE_Conversion			' A robust lib of helpers for converting across different formats (i2b, i2h, a2i, etc.)
' #define ABE_UserInput				' Subs/Functions for facilitating user input into the BT console
' #define ABE_Suspend				' Subs/Functions for halting program execution
' #define enabledebug 1				' This is needed for the ABE_Debug stuffs - 0 disables debug() wrapped code & enables production() wrapped code - vice versa
' #define ABE_Debug					' to enable programmatic debug support - need to expand for proper debugger use and multiple devices - #define enabledebug 1 to use
' #define ABE_TargetRegHelpers		' helper code to facilitate register exploration and manipulation - need to add masks and nibble/word/etc. support
' #define ABE_StringStuffs			' helper code to facilitate enhanced string functionality
#include "__lib\AB_Extensions.lib"	' also loads "__lib\ARMbasicTargetVitals.lib"

' // /* ---- START ASM CODE BLOCK ---- */ // '
//									    1              	.syntax unified
isrStart_asm: 						'   2 0000 EFBEADDE 	isrStart:	.word 0xDeAdBeEf
__ASM__(0xF3EF)
 				__ASM__(0x8009)		'   3 0004 EFF30980 		mrs r0, psp
__ASM__(0xF3BF)
 				__ASM__(0x8F6F)		'   4 0008 BFF36F8F 	isb
__ASM__(0xF8DF)
 				__ASM__(0x3048)		'   5 000c DFF84830 	ldr	r3, pxCurrentTCBConst
__ASM__(0x681A)						'   6 0010 1A68     	ldr	r2, [r3]
__ASM__(0xF01E)
 				__ASM__(0x0F10)		'   7 0012 1EF0100F 	tst r14, #0x10
__ASM__(0xBF08)						'   8 0016 08BF     	it eq
__ASM__(0xED20)
 				__ASM__(0x8A10)		'   9 0018 20ED108A 	vstmdbeq r0!, {s16-s31}
__ASM__(0xE920)
 				__ASM__(0x4FF0)		'  10 001c 20E9F04F 	stmdb r0!, {r4-r11, r14}
__ASM__(0x6010)						'  11 0020 1060     	str r0, [r2]
__ASM__(0xF84D)
 				__ASM__(0x3D04)		'  12 0022 4DF8043D 	stmdb sp!, {r3}
__ASM__(0xF04F)
 				__ASM__(0x0000)		'  13 0026 4FF00000 	mov r0, #0
__ASM__(0xF380)
 				__ASM__(0x8811)		'  14 002a 80F31188 	msr basepri, r0
__ASM__(0xF7FF)
 				__ASM__(0xFFFE)		'  15 002e FFF7FEFF 	bl vTaskSwitchContext
__ASM__(0xF04F)
 				__ASM__(0x0000)		'  16 0032 4FF00000 	mov r0, #0
__ASM__(0xF380)
 				__ASM__(0x8811)		'  17 0036 80F31188 	msr basepri, r0
__ASM__(0xBC08)						'  18 003a 08BC     	ldmia sp!, {r3}
__ASM__(0x6819)						'  19 003c 1968     	ldr r1, [r3]
__ASM__(0x6808)						'  20 003e 0868     	ldr r0, [r1]
__ASM__(0xE8B0)
 				__ASM__(0x4FF0)		'  21 0040 B0E8F04F 	ldmia r0!, {r4-r11, r14}
__ASM__(0xF01E)
 				__ASM__(0x0F10)		'  22 0044 1EF0100F 	tst r14, #0x10
__ASM__(0xBF08)						'  23 0048 08BF     	it eq
__ASM__(0xECB0)
 				__ASM__(0x8A10)		'  24 004a B0EC108A 	vldmiaeq r0!, {s16-s31}
__ASM__(0xF380)
 				__ASM__(0x8809)		'  25 004e 80F30988 	msr psp, r0
__ASM__(0xF3BF)
 				__ASM__(0x8F6F)		'  26 0052 BFF36F8F 	isb
__ASM__(0x4770)						'  27 0056 7047     	bx r14
pxCurrentTCBConst_asm: 				'  28 0058 EFBEADDE 	pxCurrentTCBConst:	.word 0xDeAdBeEf
__ASM__(0x0000)
 				__ASM__(0x0000)		'  29 005c 00000000 		.word pxCurrentTCB
//									   30              	
' // /* ---- END ASM CODE BLOCK ---- */ // '

' // /* ---- START ASM #DEF BLOCK ---- */ // '
#define _isrStart 					(addressof(isrStart_asm) + 4)
#define _pxCurrentTCBConst 			(addressof(pxCurrentTCBConst_asm) + 4)
' // /* ---- END ASM #DEF BLOCK ---- */ // '

main:
	wait(100)
	print "We're in: "
	print 
	print "_isrStart: ";i2h(_isrStart)
	print "*_isrStart: ";i2h(*_isrStart)
' BAD_TestLabel:	Print "TEST"
	print 
	print "_pxCurrentTCBConst: ";i2h(_pxCurrentTCBConst)
	print "*_pxCurrentTCBConst: ";i2h(*_pxCurrentTCBConst)
	' while(1)
	' loop
end



