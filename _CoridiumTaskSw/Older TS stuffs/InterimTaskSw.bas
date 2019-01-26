#include "LPC17xx.bas"

#define REG_SP    13
#define REG_LR    14
#define REG_PC    15

' note to Bruce  the destination register is on the left !! -- too many years in Motorola land

#define ASM_ADDRRR(Rdest,R1,R2)        __ASM__(&H1800 + Rdest + (R1<<6) 
+ (R2<<3))
#define ASM_SUBRRR(Rdest,R1,R2)        __ASM__(&H1A00 + Rdest + (R1<<6) 
+ (R2<<3))        ' Rdesr = R1 - R2

#define ASM_ADDRRI(Rdest,R1,Imm)    __ASM__(&H1C00 + Rdest + (R1<<3) +
((Imm)<<6))
#define ASM_SUBRRI(Rdest,R1,Imm)    __ASM__(&H1E00 + Rdest + (R1<<3) +
((Imm)<<6))    ' Rdesr = R1 - Imm


#define ASM_MOVI(Rdest,Imm)            __ASM__(&H2000 + (Rdest<<8) +
((Imm) and &HFF))
#define ASM_CMPI(Rdest,Imm)            __ASM__(&H2800 + (Rdest<<8) +
((Imm) and &HFF))
#define ASM_ADDI(Rdest,Imm)            __ASM__(&H3000 + (Rdest<<8) +
((Imm) and &HFF))
#define ASM_SUBI(Rdest,Imm)            __ASM__(&H3800 + (Rdest<<8) +
((Imm) and &HFF))

'    there are more combinations, but these seem most useful

#define ASM_MOVRloRhi(Rdest,RhiSrc)    __ASM__(&H4640 + ((RhiSrc and
7)<<3) + Rdest)
#define ASM_MOVRhiRlo(RhiDst,Rsrc)    __ASM__(&H4680 + (Rsrc<<3) + (RhiDst and 7))

' these are limited to r0-r7

#define ASM_STR(Rsrc,Rbase,Roff)     __ASM__(&H5000 + Rsrc + (Rbase<<3) 
+ (Roff<<6))
#define ASM_LDR(Rdest,Rbase,Roff)     __ASM__(&H5800 + Rdest +
(Rbase<<3) + (Roff<<6))

#define ASM_STRB(Rsrc,Rbase,Roff)     __ASM__(&H5400 + Rsrc + (Rbase<<3) 
+ (Roff<<6))
#define ASM_LDRB(Rdest,Rbase,Roff)     __ASM__(&H5C00 + Rdest +
(Rbase<<3) + (Roff<<6))

#define ASM_STRoff(Rsrc,Rbase,off)     __ASM__(&H6000 + Rsrc +
(Rbase<<3) + (((off) and &H7C00)<<4))
#define ASM_LDRoff(Rdst,Rbase,off)    __ASM__(&H6800 + Rdst + (Rbase<<3) 
+ (((off) and &H7C00)<<4))

#define ASM_STRBoff(Rsrc,Rbase,off)    __ASM__(&H7000 + Rsrc +
(Rbase<<3) + ((off)<<6))
#define ASM_LDRBoff(Rdst,Rbase,off) __ASM__(&H7800 + Rdst + (Rbase<<3) +
((off)<<6))


'    remember the PC offset to the branch - 4 bytes  -- probably only need a few of the following

#define ASM_BEQ(S_HWoff)            __ASM__(&HD000 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BNE(S_HWoff)            __ASM__(&HD100 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BCS(S_HWoff)            __ASM__(&HD200 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BCC(S_HWoff)            __ASM__(&HD300 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BMI(S_HWoff)            __ASM__(&HD400 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BPL(S_HWoff)            __ASM__(&HD500 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BVS(S_HWoff)            __ASM__(&HD600 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BVC(S_HWoff)            __ASM__(&HD700 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BHI(S_HWoff)            __ASM__(&HD800 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BLS(S_HWoff)            __ASM__(&HD900 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BGE(S_HWoff)            __ASM__(&HDA00 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BLT(S_HWoff)            __ASM__(&HDB00 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BGT(S_HWoff)            __ASM__(&HDC00 + (((S_HWoff-4)>>1) AND &HFF)) #define ASM_BLE(S_HWoff)            __ASM__(&HDD00 + (((S_HWoff-4)>>1) AND &HFF))

#define ASM_BR(S_HWoff)                __ASM__(&HE000 +
(((S_HWoff-4)>>1) AND &H7FF))





#define MAX_TASK    4
#define SAVE_CNT    (18-1)            ' 8 registers + lr INTSUB pushes + 
8 registers of INT + SP

#define PT_SP        SAVE_CNT
#define PT_PC        (SAVE_CNT-2)


dim context_buf ((MAX_TASK-1)*SAVE_CNT)
task_num = 0        ' cycles through the tasks

INTERRUPT SUB TIMER1IRQ
     dim x

     T1_IR = 1          ' Clear interrupt

     x = ADDRESSOF(context_buf) + task_num * SAVE_CNT        ' this is 
in r7 now

     ASM_MOVRloRhi(0,REG_SP)        ' r0 now has value of SP
     ASM_MOVI(1,SAVE_CNT<<2)

     ASM_STRoff(0,7,SAVE_CNT<<2)    ' save the SP
     ASM_SUBI(1,4)

     ASM_LDR(2,0,1)                ' copy stack to context_buf
     ASM_STR(2,7,1)
     ASM_SUBI(1,4)
     ASM_BLT(-6)

     task_num += 1
     if task_num = MAX_TASK then task_num = 0

     x = ADDRESSOF(context_buf) + task_num * SAVE_CNT        ' this is 
in r7 now

     ASM_MOVRloRhi(0,REG_SP)
     ASM_MOVI(1,SAVE_CNT<<2)

     ASM_SUBI(1,4)

     ASM_LDR(2,7,1)                ' copy context_buf to stack
     ASM_STR(2,0,1)
     ASM_SUBI(1,4)
     ASM_BLT(-6)

     ASM_LDRoff(0,7,SAVE_CNT<<2)    ' move the SP to new stack
     ASM_MOVRhiRlo(REG_SP,0)

ENDSUB

SUB ON_TIMER ( max_cnt, dothis )
     TIMER1_ISR   = dothis + 1              'set function of VIC -- need 
the +1 for Thumb operation
     T1_PR  = 24999                         '1 ms prescale
     VICIntEnable or= (1<<2)  'Enable interrupt

     T1_MR0 = max_cnt-1 ' set up match number of ms
     T1_MCR = 3      ' Interrupt and Reset on MR0
     T1_IR  = 1      ' clear interrupt
     T1_TC  = 0      ' clear timer counter
     T1_TCR = 1      ' TIMER1 Enable

ENDSUB


#define STACK_SZ    127    ' probably don't need this much room
DIM stack1 (STACK_SZ)
DIM stack2 (STACK_SZ)
DIM stack3 (STACK_SZ)
DIM stack4 (STACK_SZ)


sub task1
     while 1                    ' tasks SHALL NEVER return -- equivalent 
of crossing the streams
         IO(6)=0
         IO(6)=1
     loop
                             ' if we do finish early someday -- a 
software interrupt could be used
end sub

sub task2
     while 1
         IO(7)=0
         IO(7)=1
     loop
end sub

sub task3
     while 1
         IO(8)=0
         IO(8)=1
     loop
end sub

sub task4
     while 1
         IO(9)=0
         IO(9)=1
     loop
end sub


main:
     print 1234

    task_num  = 0


     context_buf(0*SAVE_CNT + PT_SP) = ADDRESSOF(stack1) + STACK_SZ*4
     context_buf(0*SAVE_CNT + PT_PC) = ADDRESSOF(task1) + 1
     context_buf(1*SAVE_CNT + PT_SP) = ADDRESSOF(stack2) + STACK_SZ*4
     context_buf(1*SAVE_CNT + PT_PC) = ADDRESSOF(task2) + 1
     context_buf(2*SAVE_CNT + PT_SP) = ADDRESSOF(stack3) + STACK_SZ*4
     context_buf(2*SAVE_CNT + PT_PC) = ADDRESSOF(task3) + 1
     context_buf(3*SAVE_CNT + PT_SP) = ADDRESSOF(stack4) + STACK_SZ*4
     context_buf(3*SAVE_CNT + PT_PC) = ADDRESSOF(task4) + 1

     ON_TIMER (5000, ADDRESSOF(TIMER1IRQ))

     while 1
     loop

