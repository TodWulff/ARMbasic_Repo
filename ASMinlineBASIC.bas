
'crude inline ASM for BASIC

#ifndef ASM_INLINE

#define ASM_INLINE

'	first cut	- bte	Jan 5 2019			-- feel free to expand it  -- or CORRECT it

#define REG_SP	13
#define REG_LR	14
#define REG_PC	15

' 	note to Bruce  the destination register is on the left !! -- too many years in Motorola land

#define ASM_ADDRRR(Rdest,R1,R2)		__ASM__(&H1800 + Rdest + (R1<<6) + (R2<<3))
#define ASM_SUBRRR(Rdest,R1,R2)		__ASM__(&H1A00 + Rdest + (R1<<6) + (R2<<3))		' Rdesr = R1 - R2

#define ASM_ADDRRI(Rdest,R1,Imm)	__ASM__(&H1C00 + Rdest + (R1<<3) + ((Imm)<<6))
#define ASM_SUBRRI(Rdest,R1,Imm)	__ASM__(&H1E00 + Rdest + (R1<<3) + ((Imm)<<6))	' Rdesr = R1 - Imm


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
	
'	there are more combinations, but these seem most useful

#define ASM_MOVRloRhi(Rdest,RhiSrc)	__ASM__(&H4640 + ((RhiSrc and 7)<<3) + Rdest)
#define ASM_MOVRhiRlo(RhiDst,Rsrc)	__ASM__(&H4680 + (Rsrc<<3) + (RhiDst and 7))

' 	these are limited to r0-r7

#define ASM_STR(Rsrc,Rbase,Roff) 	__ASM__(&H5000 + Rsrc + (Rbase<<3) + (Roff<<6))
#define ASM_LDR(Rdest,Rbase,Roff) 	__ASM__(&H5800 + Rdest + (Rbase<<3) + (Roff<<6))

#define ASM_STRB(Rsrc,Rbase,Roff) 	__ASM__(&H5400 + Rsrc + (Rbase<<3) + (Roff<<6))
#define ASM_LDRB(Rdest,Rbase,Roff) 	__ASM__(&H5C00 + Rdest + (Rbase<<3) + (Roff<<6))

#define ASM_STRoff(Rsrc,Rbase,off) 	__ASM__(&H6000 + Rsrc + (Rbase<<3) + (((off) and &H7C00)<<4))
#define ASM_LDRoff(Rdst,Rbase,off)	__ASM__(&H6800 + Rdst + (Rbase<<3) + (((off) and &H7C00)<<4))

#define ASM_STRBoff(Rsrc,Rbase,off)	__ASM__(&H7000 + Rsrc + (Rbase<<3) + ((off)<<6))
#define ASM_LDRBoff(Rdst,Rbase,off) __ASM__(&H7800 + Rdst + (Rbase<<3) + ((off)<<6))

' 	SP relative

#define ASM_STR_SPI(Rdest,off)		__ASM__(&H9000 + (Rdest<<8) + (off >> 2))
#define ASM_LDR_SPI(Rdest,off)		__ASM__(&H9800 + (Rdest<<8) + (off >> 2))


' 	SP and PC calculate address

#define ASM_LDR_PC(Rdest,off)		__ASM__(&HA000 + (Rdest<<8) + ((off-4) >> 2))
#define ASM_LDR_SP(Rdest,off)		__ASM__(&HA800 + (Rdest<<8) + (off >> 2))

#define LIST_R0	1
#define LIST_R1	2
#define LIST_R2	4
#define LIST_R3	8
#define LIST_R4	16
#define LIST_R5	32
#define LIST_R6	64
#define LIST_R7 128

'	PUSH POP

#define LIST_LR	256			'push	
#define LIST_PC	256			'pop

#define ASM_PUSH(RegList) 			__ASM__(&HB400 + RegList)
#define ASM_POP(RegList) 			__ASM__(&HBC00 + RegList)
	
' 	multiple load/store

#define ASM_STMIA(Rbase,RegList) 	__ASM__(&HC000 + (Rbase<<8) + RegList)
#define ASM_LDMIA(Rbase,RegList) 	__ASM__(&HC800 + (Rbase<<8) + RegList)


'	remember the PC 4 byte offset included  -- probably only need a few of the following

#define ASM_BEQ(HWoff)				__ASM__(&HD000 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BNE(HWoff)				__ASM__(&HD100 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BCS(HWoff)				__ASM__(&HD200 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BCC(HWoff)				__ASM__(&HD300 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BMI(HWoff)				__ASM__(&HD400 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BPL(HWoff)				__ASM__(&HD500 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BVS(HWoff)				__ASM__(&HD600 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BVC(HWoff)				__ASM__(&HD700 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BHI(HWoff)				__ASM__(&HD800 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BLS(HWoff)				__ASM__(&HD900 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BGE(HWoff)				__ASM__(&HDA00 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BLT(HWoff)				__ASM__(&HDB00 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BGT(HWoff)				__ASM__(&HDC00 + (((HWoff-4)>>1) AND &HFF))
#define ASM_BLE(HWoff)				__ASM__(&HDD00 + (((HWoff-4)>>1) AND &HFF))

#define ASM_BR(HWoff)				__ASM__(&HE000 + (((HWoff-4)>>1) AND &H7FF))

#endif


