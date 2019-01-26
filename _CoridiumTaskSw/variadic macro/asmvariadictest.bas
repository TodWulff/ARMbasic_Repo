#define	_r0	 +(1<<0)
#define	_r1	 +(1<<1)
#define	_r2	 +(1<<2)
#define	_r3	 +(1<<3)
#define	_r4	 +(1<<4)
#define	_r5	 +(1<<5)
#define	_r6	 +(1<<6)
#define	_r7	 +(1<<7)
#define	_r8	 +(1<<8)		' upper registers can not be used in most instructions in Thumb mode
#define	_r9	 +(1<<9)
#define	_r10 +(1<<10)
#define	_r11 +(1<<11)
#define	_r12 +(1<<12)
#define	_fp	 +(1<<12)		' C uses this, in BASIC r5 is nearly equivalent -- maybe switch someday
#define	_sp	 +(1<<13)
#define	_lr	 +(1<<14)
#define	_pc	 +(1<<15)

#define ASM_TodFunc(Rbase, args...) __ASM__(&H0711 + (Rbase<<8) args)		' July 11th, baby!

' testing - note the space delimited list of register:

ASM_TodFunc(Rbase, _r0)
ASM_TodFunc(Rbase, _r0 _r1)
ASM_TodFunc(Rbase, _r0 _r1 _r2)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9 _r10)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9 _r10 _r11)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9 _r10 _r11 _r12)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9 _r10 _r11 _fp)			' same result expected
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9 _r10 _r11 _r12 _sp)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9 _r10 _r11 _fp _sp)			' same result expected
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9 _r10 _r11 _r12 _sp _lr)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9 _r10 _r11 _fp _sp _lr)			' same result expected
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9 _r10 _r11 _r12 _sp _lr _pc)
ASM_TodFunc(Rbase, _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 _r8 _r9 _r10 _r11 _fp _sp _lr _pc)			' same result expected

' mixing it up
ASM_TodFunc(Rbase, _r0)
ASM_TodFunc(Rbase, _r1 _r0)
ASM_TodFunc(Rbase, _r2 _r1 _r0)
ASM_TodFunc(Rbase, _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _r10 _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _r11 _r10 _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _r12 _r11 _r10 _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _fp _r11 _r10 _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _sp _r12 _r11 _r10 _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _sp _fp _r11 _r10 _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _lr _sp _r12 _r11 _r10 _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _lr _sp _fp _r11 _r10 _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _pc _lr _sp _r12 _r11 _r10 _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)
ASM_TodFunc(Rbase, _pc _lr _sp _fp _r11 _r10 _r9 _r8 _r7 _r6 _r5 _r4 _r3 _r2 _r1 _r0)


print "============================================================================================================"
' one could instead drop the + from the definition and have the user put a plus in between _reg names

#define	_r0	 (1<<0)
#define	_r1	 (1<<1)
#define	_r2	 (1<<2)
#define	_r3	 (1<<3)
#define	_r4	 (1<<4)
#define	_r5	 (1<<5)
#define	_r6	 (1<<6)
#define	_r7	 (1<<7)
#define	_r8	 (1<<8)		' upper registers can not be used in most instructions in Thumb mode
#define	_r9	 (1<<9)
#define	_r10 (1<<10)
#define	_r11 (1<<11)
#define	_r12 (1<<12)
#define	_fp	 (1<<12)		' C uses this, in BASIC r5 is nearly equivalent -- maybe switch someday
#define	_sp	 (1<<13)
#define	_lr	 (1<<14)
#define	_pc	 (1<<15)

#define ASM_TodFunc(Rbase, args...) __ASM__(&H0711 + (Rbase<<8) + args)		' July 11th, baby!

' testing - note the + delimited list of register:

ASM_TodFunc(Rbase, _r0)
ASM_TodFunc(Rbase, _r0 + _r1)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9 + _r10)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9 + _r10 + _r11)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9 + _r10 + _r11 + _r12)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9 + _r10 + _r11 + _fp)			' same result expected
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9 + _r10 + _r11 + _r12 + _sp)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9 + _r10 + _r11 + _fp + _sp)			' same result expected
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9 + _r10 + _r11 + _r12 + _sp + _lr)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9 + _r10 + _r11 + _fp + _sp + _lr)			' same result expected
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9 + _r10 + _r11 + _r12 + _sp + _lr + _pc)
ASM_TodFunc(Rbase, _r0 + _r1 + _r2 + _r3 + _r4 + _r5 + _r6 + _r7 + _r8 + _r9 + _r10 + _r11 + _fp + _sp + _lr + _pc)			' same result expected

' mixing it up
ASM_TodFunc(Rbase, _r0)
ASM_TodFunc(Rbase, _r1 + _r0)
ASM_TodFunc(Rbase, _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _r10 + _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _r11 + _r10 + _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _r12 + _r11 + _r10 + _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _fp + _r11 + _r10 + _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _sp + _r12 + _r11 + _r10 + _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _sp + _fp + _r11 + _r10 + _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _lr + _sp + _r12 + _r11 + _r10 + _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _lr + _sp + _fp + _r11 + _r10 + _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _pc + _lr + _sp + _r12 + _r11 + _r10 + _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
ASM_TodFunc(Rbase, _pc + _lr + _sp + _fp + _r11 + _r10 + _r9 + _r8 + _r7 + _r6 + _r5 + _r4 + _r3 + _r2 + _r1 + _r0)
