#define VICVECTADDR15	*$FFFFF13C
	DIM TEMP AS INTEGER
	dim x as integer
	TEMP = $FFFFF13C		' R7 = ADDRESSOF VICVECTADDR15
	__ASM__ ($E3E00000)			'	MVN r0, 0x0			SET R0 TO $FFFFFFFF
	__ASM__ ($E3A010FF)         '   MOV R1, 0xFF		GET $EC INTO R1
	__ASM__ ($E3A02013)         '   MOV R2, 0x13
	__ASM__ ($E0411002)         '   SUB R1, R1, R2
	__ASM__ ($E3A02010)         '   MOV R2, 0x10		R2 = 16
	__ASM__ ($E0010192)         '   MUL R1, R2, R1		R1 << 4 = $EC0
	__ASM__ ($E3A02003)         '   MOV R2, 0x3			
	__ASM__ ($E0811002)         '   ADD R1, R1, R2		R1 = $EC3
	__ASM__ ($E0400001)         '   SUB R0, R0, R1		R0 = $FFFFF13C = VICVECTADDR15 (TEMP REG)
	__ASM__ ($E3A02000)         '   MOV R2, 0x0
	__ASM__ ($E0473002)         '   SUB R3, R7, R2		GET STACK POINTER TO R3
	__ASM__ ($E5803000)         '   STR R3, [R0] 		AND STORE IT TO VICVECTADDR15
	X = VICVECTADDR15
	PRINT "$";HEX(X)