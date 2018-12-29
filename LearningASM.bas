

' // /* ---- START ASM CODE BLOCK ---- */ // '
//    1              	;AREA Prog1, CODE, READONLY
__ASM__(0x2011)	'    2 0000 1120     	ENTRY	MOV r0, #0x11 ; load initial value
__ASM__(0x0041)	'    3 0002 4100     		LSL r1, r0, #1 ; shift 1 bit left
__ASM__(0x004A)	'    4 0004 4A00     		LSL r2, r1, #1 ; shift 1 bit left
__ASM__(0xE7FE)	'    5 0006 FEE7     	stop 	B stop ; stop program
//    6              	END
//    7              	
' // /* ---- END ASM CODE BLOCK ---- */ // '