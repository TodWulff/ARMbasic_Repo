
'crude inline ASM for BASIC

#ifndef ASM_INLINE

#define ASM_INLINE

'	first cut	- bte	Jan 5 2019			-- feel free to expand it  -- or CORRECT it
'               - bte	Jan 12 2019			-- getting carried away -- adding register defs

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

#define ASM_ADDRRR(Rdest,R1,R2)		__ASM__(&H1800 + Rdest + (R1<<6) + (R2<<3))
#define ASM_SUBRRR(Rdest,R1,R2)		__ASM__(&H1A00 + Rdest + (R1<<6) + (R2<<3))		' Rdest = R1 - R2

#define ASM_ADDRRI(Rdest,R1,Imm)	__ASM__(&H1C00 + Rdest + (R1<<3) + ((Imm)<<6))
#define ASM_SUBRRI(Rdest,R1,Imm)	__ASM__(&H1E00 + Rdest + (R1<<3) + ((Imm)<<6))	' Rdest = R1 - Imm


#define ASM_MOVI(Rdest,Imm)			__ASM__(&H2000 + (Rdest<<8) + ((Imm) and &HFF))
#define ASM_CMPI(Rdest,Imm)			__ASM__(&H2800 + (Rdest<<8) + ((Imm) and &HFF))
#define ASM_ADDI(Rdest,Imm)			__ASM__(&H3000 + (Rdest<<8) + ((Imm) and &HFF))
#define ASM_SUBI(Rdest,Imm)			__ASM__(&H3800 + (Rdest<<8) + ((Imm) and &HFF))

'	register ALU ops -- r0-7

#define ASM_AND(Rdest,Rsrc)			__ASM__(&H4000 + (Rsrc<<3) + Rdest)
#define ASM_EOR(Rdest,Rsrc)			__ASM__(&H4040 + (Rsrc<<3) + Rdest)
#define ASM_LSL(Rdest,Rsrc)			__ASM__(&H4080 + (Rsrc<<3) + Rdest)
#define ASM_LSR(Rdest,Rsrc)			__ASM__(&H40C0 + (Rsrc<<3) + Rdest)
#define ASM_ASR(Rdest,Rsrc)			__ASM__(&H4100 + (Rsrc<<3) + Rdest)
#define ASM_ADC(Rdest,Rsrc)			__ASM__(&H4140 + (Rsrc<<3) + Rdest)
#define ASM_SBC(Rdest,Rsrc)			__ASM__(&H4180 + (Rsrc<<3) + Rdest)
#define ASM_ROR(Rdest,Rsrc)			__ASM__(&H41C0 + (Rsrc<<3) + Rdest)
#define ASM_TST(Rdest,Rsrc)			__ASM__(&H4200 + (Rsrc<<3) + Rdest)
#define ASM_NEG(Rdest,Rsrc)			__ASM__(&H4240 + (Rsrc<<3) + Rdest)
#define ASM_CMP(Rdest,Rsrc)			__ASM__(&H4280 + (Rsrc<<3) + Rdest)
#define ASM_CMN(Rdest,Rsrc)			__ASM__(&H42C0 + (Rsrc<<3) + Rdest)
#define ASM_ORR(Rdest,Rsrc)			__ASM__(&H4300 + (Rsrc<<3) + Rdest)
#define ASM_MUL(Rdest,Rsrc)			__ASM__(&H4340 + (Rsrc<<3) + Rdest)
#define ASM_BIC(Rdest,Rsrc)			__ASM__(&H4380 + (Rsrc<<3) + Rdest)
#define ASM_MVN(Rdest,Rsrc)			__ASM__(&H43C0 + (Rsrc<<3) + Rdest)
	
'	move between registers

#define ASM_MOV(Rdest,Rsrc)			__ASM__(&H4600 + ((Rdest and 8)<<4) + (Rsrc<<3) + (Rdest and 7))

' 	these are limited to r0-r7

#define ASM_STR(Rsrc,Rbase,Roff) 	__ASM__(&H5000 + Rsrc + (Rbase<<3) + (Roff<<6))
#define ASM_LDR(Rdest,Rbase,Roff) 	__ASM__(&H5800 + Rdest + (Rbase<<3) + (Roff<<6))

#define ASM_STRB(Rsrc,Rbase,Roff) 	__ASM__(&H5400 + Rsrc + (Rbase<<3) + (Roff<<6))
#define ASM_LDRB(Rdest,Rbase,Roff) 	__ASM__(&H5C00 + Rdest + (Rbase<<3) + (Roff<<6))

#define ASM_STRoff(Rsrc,Rbase,off) 	__ASM__(&H6000 + Rsrc + (Rbase<<3) + ((off<<4) and &H7C00))
#define ASM_LDRoff(Rdst,Rbase,off)	__ASM__(&H6800 + Rdst + (Rbase<<3) + ((off<<4) and &H7C00))

#define ASM_STRBoff(Rsrc,Rbase,off)	__ASM__(&H7000 + Rsrc + (Rbase<<3) + ((off)<<6))
#define ASM_LDRBoff(Rdst,Rbase,off) __ASM__(&H7800 + Rdst + (Rbase<<3) + ((off)<<6))

' 	SP relative

#define ASM_STR_SPI(Rdest,off)		__ASM__(&H9000 + (Rdest<<8) + (off >> 2))
#define ASM_LDR_SPI(Rdest,off)		__ASM__(&H9800 + (Rdest<<8) + (off >> 2))


' 	SP and PC calculate plus word offset, store in Rdest

#define ASM_ADD_PC(Rdest,off)		__ASM__(&HA000 + (Rdest<<8) + ((off-4) >> 2))
#define ASM_ADD_SP(Rdest,off)		__ASM__(&HA800 + (Rdest<<8) + (off >> 2))

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

#define ASM_PUSH(RegList...) 			__ASM__(&HB400 RegList)
#define ASM_POP(RegList...) 			__ASM__(&HBC00 RegList)
	
' 	multiple load/store  -- same call sequence as ASM_PUSH / POP

#define ASM_STMIA(Rbase,RegList...) 	__ASM__(&HC000 + (Rbase<<8) RegList)
#define ASM_LDMIA(Rbase,RegList...) 	__ASM__(&HC800 + (Rbase<<8) RegList)


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

'	use BASIC goto for long jumps as the compiler figures out the offsets

#endif


