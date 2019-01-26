
'crude inline ASM for BASIC

#ifndef ASM_INLINE

#define ASM_INLINE

'	first cut	- bte	Jan 5 2019			-- feel free to expand it  -- or CORRECT it
'               - bte	Jan 12 2019			-- getting carried away -- adding register defs
'				- mar	Jan 13 2019			-- fixes to ADD_SP, PC
'				- tw	Jan 13 2019			-- fancier push/pop
'				- bte	Jan 14 2019			-- add shifts
'				- mar	Jan 14 2019			-- correct some STR offsets and PC relative LD
'				- mar	Jan 15 2019			-- more fixes and comments
'				- bte	Jan 15 2019			-- fix MRS, rename ASL with immediate shift

#define	r0		0
#define	r1		1
#define	r2		2
#define	r3		3
#define	r4		4
#define	r5		5
#define	r6		6
#define	r7		7
#define	r8		8		' upper registers can not be used in most instructions in Thumb mode
#define	r9		9
#define	r10		10
#define	r11		11
#define	r12		12
#define	fp		12		' C uses this, in BASIC r5 is nearly equivalent -- maybe switch someday
#define	sp		13
#define	lr		14
#define	pc		15

#define	R0		0
#define	R1		1
#define	R2		2
#define	R3		3
#define	R4		4
#define	R5		5
#define	R6		6
#define	R7		7
#define	R8		8		' upper registers can not be used in most instructions in Thumb mode
#define	R9		9
#define	R10		10
#define	R11		11
#define	R12		12
#define	FP		12		' C uses this, in BASIC r5 is nearly equivalent -- maybe switch someday
#define	SP		13
#define	LR		14
#define	PC		15


' 	note to Bruce  the destination register is on the left !! -- too many years in Motorola land

#define ASM_LSLI(Rdst,Rsrc,shift)	__ASM__(&H0000 + (shift<<6) + (Rsrc<<3) + Rdst)	' LSL Rd, Rs, #shift
#define ASM_LSRI(Rdst,Rsrc,shift)	__ASM__(&H0800 + (shift<<6) + (Rsrc<<3) + Rdst)
#define ASM_ASRI(Rdst,Rsrc,shift)	__ASM__(&H1000 + (shift<<6) + (Rsrc<<3) + Rdst)

#define ASM_ADDRRR(Rdst,R1,R2)		__ASM__(&H1800 + Rdst + (R1<<6) + (R2<<3))
#define ASM_SUBRRR(Rdst,R1,R2)		__ASM__(&H1A00 + Rdst + (R1<<6) + (R2<<3))		' Rdst = R1 - R2

#define ASM_ADDRRI(Rdst,R1,Imm)		__ASM__(&H1C00 + Rdst + (R1<<3) + ((Imm)<<6))
#define ASM_SUBRRI(Rdst,R1,Imm)		__ASM__(&H1E00 + Rdst + (R1<<3) + ((Imm)<<6))	' Rdst = R1 - Imm


#define ASM_MOVI(Rdst,Imm)			__ASM__(&H2000 + (Rdst<<8) + ((Imm) and &HFF))
#define ASM_CMPI(Rdst,Imm)			__ASM__(&H2800 + (Rdst<<8) + ((Imm) and &HFF))
#define ASM_ADDI(Rdst,Imm)			__ASM__(&H3000 + (Rdst<<8) + ((Imm) and &HFF))
#define ASM_SUBI(Rdst,Imm)			__ASM__(&H3800 + (Rdst<<8) + ((Imm) and &HFF))

'	register ALU ops -- r0-7

#define ASM_AND(Rdst,Rsrc)			__ASM__(&H4000 + (Rsrc<<3) + Rdst)
#define ASM_EOR(Rdst,Rsrc)			__ASM__(&H4040 + (Rsrc<<3) + Rdst)
#define ASM_LSL(Rdst,Rsrc)			__ASM__(&H4080 + (Rsrc<<3) + Rdst)
#define ASM_LSR(Rdst,Rsrc)			__ASM__(&H40C0 + (Rsrc<<3) + Rdst)
#define ASM_ASR(Rdst,Rsrc)			__ASM__(&H4100 + (Rsrc<<3) + Rdst)
#define ASM_ADC(Rdst,Rsrc)			__ASM__(&H4140 + (Rsrc<<3) + Rdst)
#define ASM_SBC(Rdst,Rsrc)			__ASM__(&H4180 + (Rsrc<<3) + Rdst)
#define ASM_ROR(Rdst,Rsrc)			__ASM__(&H41C0 + (Rsrc<<3) + Rdst)
#define ASM_TST(Rdst,Rsrc)			__ASM__(&H4200 + (Rsrc<<3) + Rdst)
#define ASM_NEG(Rdst,Rsrc)			__ASM__(&H4240 + (Rsrc<<3) + Rdst)
#define ASM_CMP(Rdst,Rsrc)			__ASM__(&H4280 + (Rsrc<<3) + Rdst)
#define ASM_CMN(Rdst,Rsrc)			__ASM__(&H42C0 + (Rsrc<<3) + Rdst)
#define ASM_ORR(Rdst,Rsrc)			__ASM__(&H4300 + (Rsrc<<3) + Rdst)
#define ASM_MUL(Rdst,Rsrc)			__ASM__(&H4340 + (Rsrc<<3) + Rdst)
#define ASM_BIC(Rdst,Rsrc)			__ASM__(&H4380 + (Rsrc<<3) + Rdst)
#define ASM_MVN(Rdst,Rsrc)			__ASM__(&H43C0 + (Rsrc<<3) + Rdst)
	
'	move between registers

#define ASM_MOV(Rdst,Rsrc)			__ASM__(&H4600 + ((Rdst and 8)<<4) + (Rsrc<<3) + (Rdst and 7))

' 	Rdst, Rbase and Roff are limited to r0-r7

#define ASM_STR(Rsrc,Rbase,Roff) 	__ASM__(&H5000 + Rsrc + (Rbase<<3) + (Roff<<6)) ' str r0, [r0, r0] ' 5000
#define ASM_LDR(Rdst,Rbase,Roff) 	__ASM__(&H5800 + Rdst + (Rbase<<3) + (Roff<<6)) ' ldr r0, [r0, r0] ' 5800

#define ASM_STRH(Rsrc,Rbase,Roff) 	__ASM__(&H5200 + Rsrc + (Rbase<<3) + (Roff<<6)) ' strh r0, [r0, r0] ' 5200
#define ASM_LDRH(Rdst,Rbase,Roff) 	__ASM__(&H5A00 + Rdst + (Rbase<<3) + (Roff<<6)) ' ldrh r0, [r0, r0] ' 5a00

#define ASM_STRB(Rsrc,Rbase,Roff) 	__ASM__(&H5400 + Rsrc + (Rbase<<3) + (Roff<<6)) ' strb r0, [r0, r0] ' 5400
#define ASM_LDRB(Rdst,Rbase,Roff) 	__ASM__(&H5C00 + Rdst + (Rbase<<3) + (Roff<<6)) ' ldrb r0, [r0, r0] ' 5c00

'   off limited to less than 128, 4 byte word aligned
#define ASM_STRoff(Rsrc,Rbase,off)	__ASM__(&H6000 + Rsrc + (Rbase<<3) + ((off>>2) <<6)) ' str r0, [r0, #0] ' 6000
#define ASM_LDRoff(Rdst,Rbase,off)	__ASM__(&H6800 + Rdst + (Rbase<<3) + ((off>>2) <<6)) ' ldr r0, [r0, #0] ' 6800

'   off limited to less than 32
#define ASM_STRBoff(Rsrc,Rbase,off)	__ASM__(&H7000 + Rsrc + (Rbase<<3) + (off<<6)) ' strb r0, [r0, #0] ' 7000
#define ASM_LDRBoff(Rdst,Rbase,off) __ASM__(&H7800 + Rdst + (Rbase<<3) + (off<<6)) ' ldrb r0, [r0, #0] ' 7800

' 	PC relative

'   off limited to less than 1024, 4 byte word aligned
#define ASM_LDR_PCI(Rdst,off)		__ASM__(&H4800 + (Rdst<<8) + (off>>2)) ' ldr r0, [pc, #0] ' 4800

' 	SP relative

'   off limited to less than 1024, 4 byte word aligned
#define ASM_STR_SPI(Rdst,off)		__ASM__(&H9000 + (Rdst<<8) + (off>>2)) ' str r0, [sp, #0] ' 9000
#define ASM_LDR_SPI(Rdst,off)		__ASM__(&H9800 + (Rdst<<8) + (off>>2)) ' ldr r0, [sp, #0] ' 9800

' 	SP and PC calculate plus word offset, store in Rdst

'   off limited to less than 1024, 4 byte word aligned
#define ASM_ADD_PC(Rdst,off)		__ASM__(&HA000 + (Rdst<<8) + (off>>2)) ' add r0, pc, #0 ' a000
#define ASM_ADD_SP(Rdst,off)		__ASM__(&HA800 + (Rdst<<8) + (off>>2)) ' add r0, sp, #0 ' a800


'	PUSH POP call with list  for example ASM_PUSH(_r0 _r1 _r6)

#define	_r0	 +(1<<0)
#define	_r1	 +(1<<1)
#define	_r2	 +(1<<2)
#define	_r3	 +(1<<3)
#define	_r4	 +(1<<4)
#define	_r5	 +(1<<5)
#define	_r6	 +(1<<6)
#define	_r7	 +(1<<7)
#define	_lr	 +(1<<8)	' push only
#define	_pc	 +(1<<8)	' pop only

#define	_R0	 +(1<<0)
#define	_R1	 +(1<<1)
#define	_R2	 +(1<<2)
#define	_R3	 +(1<<3)
#define	_R4	 +(1<<4)
#define	_R5	 +(1<<5)
#define	_R6	 +(1<<6)
#define	_R7	 +(1<<7)
#define	_LR	 +(1<<8)	' push only
#define	_PC	 +(1<<8)	' pop only

#define ASM_PUSH(RegList...) 		__ASM__(&HB400 RegList)
#define ASM_POP(RegList...) 		__ASM__(&HBC00 RegList)
	
' 	multiple load/store  -- same call sequence as ASM_PUSH / POP

#define ASM_STMIA(Rbase,RegList...) __ASM__(&HC000 + (Rbase<<8) RegList)
#define ASM_LDMIA(Rbase,RegList...) __ASM__(&HC800 + (Rbase<<8) RegList)


'	remember the PC 4 byte offset included  -- probably only need a few of the following

#define ASM_BEQ(PCoff)				__ASM__(&HD000 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BNE(PCoff)				__ASM__(&HD100 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BCS(PCoff)				__ASM__(&HD200 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BCC(PCoff)				__ASM__(&HD300 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BMI(PCoff)				__ASM__(&HD400 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BPL(PCoff)				__ASM__(&HD500 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BVS(PCoff)				__ASM__(&HD600 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BVC(PCoff)				__ASM__(&HD700 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BHI(PCoff)				__ASM__(&HD800 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BLS(PCoff)				__ASM__(&HD900 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BGE(PCoff)				__ASM__(&HDA00 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BLT(PCoff)				__ASM__(&HDB00 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BGT(PCoff)				__ASM__(&HDC00 + (((PCoff-4)>>1) AND &HFF))
#define ASM_BLE(PCoff)				__ASM__(&HDD00 + (((PCoff-4)>>1) AND &HFF))

#define ASM_BR(PCoff)				__ASM__(&HE000 + (((PCoff-4)>>1) AND &H7FF))

#define ASM_SVC(imm)				__ASM__(&HDF00 + imm)

'	use BASIC goto for long jumps as the compiler figures out the offsets

' 	32 bit Thumb-2

#define ASM_MRS(Rdst)				__ASM__(&HF3EF8000 + (Rdst << 8))	' read PSR

#endif


