/* 
Exception 	IRQ			Exception					Vector address
numbera		numbera		type     	Priority		or offsetb			Activation
14 			-2 			PendSV 		Configurable 	0x00000038 			Asynchronous

Address			Name		Type	Reset			Description
0xE000ED20		SHPR3		RW		0x00000000		System Handler Priority Register 3, SHPR3 Register	
	PRI_14, bits[23:16]	Priority of system handler 14, PendSV - hold a priority value, 0-255. The lower the value, the greater the priority of the corresponding interrupt.
	
0xE000ED04		ICSR		RW		0x00000000		Interrupt Control and State Register, ICSR

	PENDSVSET, bit[28]: On writes, sets the PendSV exception as pending. On reads, indicates the current state of the exception:
	0                On writes, has no effect. On reads, PendSV is not pending.
	1                On writes, make PendSV exception pending. On reads, PendSV is pending. Normally, software writes 1 to this bit to request a context switch.

	PENDSVCLR, bit[27]: Removes the pending status of the PendSV exception:
	0                No effect.
	1                Remove pending status. This bit is write only.
	
	If software does not configure any priorities, then all exceptions with a configurable priority have a priority of 0. For information about configuring exception priorities see
 */

#define CORE_M4						' needed for this dual core device, & given we're working with the NVIC on the M4
#include "LPC54102.bas"				' needed for the header #defs

#define LPC54102_Freq 96000000		' MRT scaler is 24 bits wide on the 54102 - @ 100MHz, that boils down to 5.7hz (174.633 mS per cycle)
#define LPC54102_MinMRTFreqHz 6		' actually 5.7xxhz, but kept it an int.
#define LPC54102_MaxMRTFreqHz 97656	' 1024 clocks minimum ($ff * 4 @ 100MHz)

#define Switch_FreqHz	5

#define	PendSV_IRQn			*(SRAM_BASE + 0x38)		' 14 - Cortex-M4 PendSV Interrupt   
#define SHPR3				*(0xE000ED20)			' System Handler Priority Register 3, SHPR3 Register
#define ISCR				*(0xE000ED04)			' Interrupt Control and State Register, ICSR
#define ISCR_PENDSVSET		(1<<28)					' PENDSVSET, bit[28]: On writes, sets the PendSV exception as pending. On reads, indicates the current state of the exception
#define ISCR_PENDSVCLR		(1<<27)					' PENDSVCLR, bit[27]: On write, Removes the pending status of the PendSV exception
#define PendSV_Pri_Mask		0x00FF0000				' PRI_14, bits[23:16]	Priority of system handler 14, PendSV (0=hiest - 255=lowest - keep low for critical avoidance - 0 @ reset...)


dim ToggleFlag as integer
dim S1_ptr as integer
dim S2_ptr as integer
dim MSP_Addr as integer
dim APSR_Val as integer
dim InitRun_flag as integer

dim Current_Context(9) as integer	'; sp, r0-r7
dim New_Context(9) as integer		'; sp, r0-r7

dim S0_Context(9) as integer
dim S1_Context(9) as integer
dim S2_Context(9) as integer

dim testSingle as single
dim testSArray(75) as single

dim testString(16) as string

interrupt sub Ticker_INT_ISR
	print "t";
	wait(10)
	ISCR = ISCR_PENDSVSET			' avoiding critical code by using PendSV for Context Switching
	MRT_IRQ_FLAG = MRT_IRQ_FLAG		' clears the ticker interrupt (using MRT in this case) 
	endsub
	
interrupt sub First_PendSV_INT_ISR
	' __ASM__(0xB672)	'    2 0000 72B6     	CPSID I

	MSP_Addr = (addressof MSP_Addr)	' put var addr in R7
	__ASM__(0xD000F8C7)				'    2 0000 C7F800D0 		str sp, [r7]	put stack pointer into var
'	' print "-0x";hex(MSP_Addr);"-";
	
	APSR_Val = (addressof APSR_Val)	' put var addr in R7
	__ASM__(0x8200F3EF)				'    2 0000 EFF30082 		MRS r2, apsr
	__ASM__(0x603A)					'    2 0000 3A60     		str	r2, [r7]	

	' OirgRet_Addr = (addressof OirgRet_Addr)	' put var addr in R7
	' __ASM__(0x466A)	'    2 0000 6A46     		mov r2, sp
	' __ASM__(0x0120F102)	'    3 0002 02F12001 	 	add r1, r2, #0x20
	' __ASM__(0x6039)	'    4 0006 3960     		str r1, [r7]
	' // ' print "-0x";hex(OirgRet_Addr);"-0x";hex(*OirgRet_Addr);"-";
	
	// grab a default context, to use to init the contexts for each task subs
	S0_Context(9) = APSR_Val			'APSR
	S0_Context(8) = *(MSP_Addr+0x20)	'LR  (PC)
	S0_Context(7) = *(MSP_Addr+0x1c)	'r7
	S0_Context(6) = *(MSP_Addr+0x18)	'r6
	S0_Context(5) = *(MSP_Addr+0x14)	'r5
	S0_Context(4) = *(MSP_Addr+0x10)	'r4
	S0_Context(3) = *(MSP_Addr+0x0c)	'r3(r11)
	S0_Context(2) = *(MSP_Addr+0x08)	'r2(r10)
	S0_Context(1) = *(MSP_Addr+0x04)	'r1(r09)
	S0_Context(0) = *(MSP_Addr+0x00)	'r0(r08)
	' print "S0(sp@0x";hex(MSP_Addr);") ";

'	ISCR or= ISCR_PENDSVCLR	' clear the pendsv interrupt

	' __ASM__(0xB662)	'    2 0000 62B6     	CPSIE I

	endsub
	
interrupt sub PendSV_INT_ISR
	__ASM__(0xBE10)	'    1 0000 00BE     	bkpt	
	
	' print "p";
	' wait(10)
	
	' __ASM__(0xB672)	'    2 0000 72B6     	CPSID I

	' If InitRun_flag =1
		' InitRun_flag = 0
		' goto skip_save
		' endif
	
	// get msp into MSP_Addr
	MSP_Addr = (addressof MSP_Addr)	' put var addr in R7
	__ASM__(0xD000F8C7)	'    2 0000 C7F800D0 		str sp, [r7]	put stack pointer into var
	
		//save current task context
		
	// get APSR into APSR_Val
	APSR_Val = (addressof APSR_Val)	' put var addr in R7
	__ASM__(0x8200F3EF)				'    2 0000 EFF30082 		MRS r2, apsr
	__ASM__(0x603A)					'    2 0000 3A60     		str	r2, [r7]	

	if ToggleFlag = 0 // task 1
		S1_Context(9) = APSR_Val			'APSR
		S1_Context(8) = *(MSP_Addr+0x20)	'LR  (PC)
		S1_Context(7) = *(MSP_Addr+0x1c)	'r7
		S1_Context(6) = *(MSP_Addr+0x18)	'r6
		S1_Context(5) = *(MSP_Addr+0x14)	'r5
		S1_Context(4) = *(MSP_Addr+0x10)	'r4
		S1_Context(3) = *(MSP_Addr+0x0c)	'r3(r11)
		S1_Context(2) = *(MSP_Addr+0x08)	'r2(r10)
		S1_Context(1) = *(MSP_Addr+0x04)	'r1(r09)
		S1_Context(0) = *(MSP_Addr+0x00)	'r0(r08)
		print "S1(sp@0x";hex(MSP_Addr);") ";
		wait(10)
	else
		S2_Context(9) = APSR_Val			'APSR
		S2_Context(8) = *(MSP_Addr+0x20)	'LR  (PC)
		S2_Context(7) = *(MSP_Addr+0x1c)	'r7
		S2_Context(6) = *(MSP_Addr+0x18)	'r6
		S2_Context(5) = *(MSP_Addr+0x14)	'r5
		S2_Context(4) = *(MSP_Addr+0x10)	'r4
		S2_Context(3) = *(MSP_Addr+0x0c)	'r3(r11)
		S2_Context(2) = *(MSP_Addr+0x08)	'r2(r10)
		S2_Context(1) = *(MSP_Addr+0x04)	'r1(r09)
		S2_Context(0) = *(MSP_Addr+0x00)	'r0(r08)
		print "S2(sp@0x";hex(MSP_Addr);") ";
		wait(10)
	endif
				
		// load next task context
'__ASM__(0xBE00)	'    1 0000 00BE     	bkpt	

' skip_save:

	if ToggleFlag = 0
		ToggleFlag = 1
	else
		ToggleFlag = 0
	endif
	

	if ToggleFlag = 1
		*(MSP_Addr+0x20) = S2_Context(8)	'LR  (PC)
        *(MSP_Addr+0x1c) = S2_Context(7)	'r7
        *(MSP_Addr+0x18) = S2_Context(6)	'r6
        *(MSP_Addr+0x14) = S2_Context(5)	'r5
        *(MSP_Addr+0x10) = S2_Context(4)	'r4
        *(MSP_Addr+0x0c) = S2_Context(3)	'r3(r11)
        *(MSP_Addr+0x08) = S2_Context(2)	'r2(r10)
        *(MSP_Addr+0x04) = S2_Context(1)	'r1(r09)
        *(MSP_Addr+0x00) = S2_Context(0)	'r0(r08)
		APSR_Val = S2_Context(9)			'APSR into r7
		__ASM__(0x8800F387)	'    2 0000 87F30088 		MSR	apsr, r7
		' print "R2(sp@0x";hex(MSP_Addr);") ";
		' wait(10)
	else
		*(MSP_Addr+0x20) = S1_Context(8)	'LR  (PC)
        *(MSP_Addr+0x1c) = S1_Context(7)	'r7
        *(MSP_Addr+0x18) = S1_Context(6)	'r6
        *(MSP_Addr+0x14) = S1_Context(5)	'r5
        *(MSP_Addr+0x10) = S1_Context(4)	'r4
        *(MSP_Addr+0x0c) = S1_Context(3)	'r3(r11)
        *(MSP_Addr+0x08) = S1_Context(2)	'r2(r10)
        *(MSP_Addr+0x04) = S1_Context(1)	'r1(r09)
        *(MSP_Addr+0x00) = S1_Context(0)	'r0(r08)
		APSR_Val = S1_Context(9)			'APSR into r7
		__ASM__(0x8800F387)	'    2 0000 87F30088 		MSR	apsr, r7
		' print "R1(sp@0x";hex(MSP_Addr);") ";
		' wait(10)
	endif

	
	' print "clearing ";
	' wait(10)
'	ISCR or= ISCR_PENDSVCLR	' clear the pendsv interrupt
	' print "cleared ";
	' wait(10)
	
	' __ASM__(0xB662)	'    2 0000 62B6     	CPSIE I
	
__ASM__(0xBE00)	'    1 0000 00BE     	bkpt	
	endsub
	
sub Ticker_INT_Config(ClkFreqHz as integer)
	dim MRT_TC as integer
	if ClkFreqHz < LPC54102_MinMRTFreqHz then ClkFreqHz = LPC54102_MinMRTFreqHz
	if ClkFreqHz > LPC54102_MaxMRTFreqHz then ClkFreqHz = LPC54102_MaxMRTFreqHz
	MRT_TC = LPC54102_Freq / ClkFreqHz
	print "ClkFreqHz: ";ClkFreqHz;" Hz"," T: ";timer
	SCB_AHBCLKCTRL(1) or= SYSCON_CLOCK_MRT	' set the MRT bit to enable the clock to the register interface.
	SCB_PRESETCTRL(1) and= 0xFFFFFFFE 		' Clear reset to the MRT.
	MRT_INTVAL(0) = (MRT_TC or $80000000) and 0x80FFFFFF 				'b31 = 1 for immediately load the MRT IntVal
	MRT_CTRL(0) = 0x00000001				' enable TIMERn Interrupt in repeat interrupt mode
	MRT_IRQn = (addressof Ticker_INT_ISR) or 1	' assign the isr sub addy to the NVIC vector table for MRT_irq  (the 'or 1' is for thumb code purposes)
	endsub
	
sub First_PendSV_Int_Config
	ISCR or= ISCR_PENDSVCLR	' clear any pendsv interrupt
	SHPR3 or= (PendSV_Pri_Mask and ($00<<16))		' set the pendsv int priority to 00 (highest priority), for initialization purposes
	PendSV_IRQn = (addressof First_PendSV_INT_ISR) or 1	' assign the pendsv isr sub addy to the system exception vector table
	print "First_PendSV_Int_Config CFG'd @ ",timer
	endsub
	
sub PendSV_Int_Config
	ISCR or= ISCR_PENDSVCLR	' clear any pendsv interrupt
	SHPR3 or= (PendSV_Pri_Mask and ($FF<<16))		' set the pendsv int priority to 255 (lowest priority)
	PendSV_IRQn = (addressof PendSV_INT_ISR) or 1	' assign the pendsv isr sub addy to the system exception vector table
	print "PendSV_Int_Config CFG'd @ ",timer
	endsub
	
sub Ticker_INT_Enable	
	print "Task Ticker CFG'd @ ",timer
	wait(10)	' to allow ' printing to complete
	VICIntEnable0 or= (1<<10)	' enable the MRT interrupt
	endsub

sub Sub1
__ASM__(0xBE01)	'    1 0000 00BE     	bkpt	
'	do
		print "1";
		wait(10)
'	loop
	endsub

sub Sub2
__ASM__(0xBE02)	'    1 0000 00BE     	bkpt	
'	do
		print "2";
		wait(10)
'	loop
	endsub

sub Context_Init(context_ptr as integer, entry_addr as integer)

	print "Init Context @ 0x";hex(context_ptr);" with start addr of 0x";hex(entry_addr);"."
	
	*(context_ptr+0x24) = S0_Context(9)	'PSR
	*(context_ptr+0x20) = entry_addr	'LR  (PC)
	*(context_ptr+0x1c) = S0_Context(7)	'r7
	*(context_ptr+0x18) = S0_Context(6)	'r6
	*(context_ptr+0x14) = S0_Context(5)	'r5
	*(context_ptr+0x10) = S0_Context(4)	'r4
	*(context_ptr+0x0c) = S0_Context(3)	'r3(r11)
	*(context_ptr+0x08) = S0_Context(2)	'r2(r10)
	*(context_ptr+0x04) = S0_Context(1)	'r1(r09)
	*(context_ptr+0x00) = S0_Context(0)	'r0(r08)
	
	endsub
		
main:
	ToggleFlag = 0xdeadbeef
	__ASM__(0xB480)	'    1 0000 80B4     	push {r7}  / gives a visual starting point on stack
	
	dim i as integer

	print "Starting"
	wait(10)	' to allow ' printing to complete
	
	testSingle = 1.23456789
	for i = 0 to 75
		testSArray(i) = 0.707 * i
		next i
	testString = "0123456789abcdef"
	
	I = 0xDeAdBeEf
	
	// fire pendsv int once to get default context
	S0_Context(0) = 0xdeadbeef
	First_PendSV_Int_Config
	ISCR or= ISCR_PENDSVSET			' avoiding critical code by using PendSV for Context Switching
	do
	until S0_Context(0) <> 0xdeadbeef
	
	S1_ptr = addressof Sub1
	context_init(addressof S1_Context, S1_ptr)
	S2_ptr = addressof Sub2
	context_init(addressof S2_Context, S2_ptr)

	print
	
	print "Default Context: PSR",		"0x";hex(S0_Context(9))
	print "Default Context: LR(PC)",	"0x";hex(S0_Context(8))
	print "Default Context: r7",		"0x";hex(S0_Context(7))
	print "Default Context: r6",		"0x";hex(S0_Context(6))
	print "Default Context: r5",		"0x";hex(S0_Context(5))
	print "Default Context: r4",		"0x";hex(S0_Context(4))
	print "Default Context: r3(r11)",	"0x";hex(S0_Context(3))
	print "Default Context: r2(r10)",	"0x";hex(S0_Context(2))
	print "Default Context: r1(r09)",	"0x";hex(S0_Context(1))
	print "Default Context: r0(r08)",	"0x";hex(S0_Context(0))

	print
	
	print "S1 Init Context: PSR",		"0x";hex(S1_Context(9))
	print "S1 Init Context: LR(PC)",	"0x";hex(S1_Context(8))
	print "S1 Init Context: r7",		"0x";hex(S1_Context(7))
	print "S1 Init Context: r6",		"0x";hex(S1_Context(6))
	print "S1 Init Context: r5",		"0x";hex(S1_Context(5))
	print "S1 Init Context: r4",		"0x";hex(S1_Context(4))
	print "S1 Init Context: r3(r11)",	"0x";hex(S1_Context(3))
	print "S1 Init Context: r2(r10)",	"0x";hex(S1_Context(2))
	print "S1 Init Context: r1(r09)",	"0x";hex(S1_Context(1))
	print "S1 Init Context: r0(r08)",	"0x";hex(S1_Context(0))

	print
	
	print "S2 Init Context: PSR",		"0x";hex(S2_Context(9))
	print "S2 Init Context: LR(PC)",	"0x";hex(S2_Context(8))
	print "S2 Init Context: r7",		"0x";hex(S2_Context(7))
	print "S2 Init Context: r6",		"0x";hex(S2_Context(6))
	print "S2 Init Context: r5",		"0x";hex(S2_Context(5))
	print "S2 Init Context: r4",		"0x";hex(S2_Context(4))
	print "S2 Init Context: r3(r11)",	"0x";hex(S2_Context(3))
	print "S2 Init Context: r2(r10)",	"0x";hex(S2_Context(2))
	print "S2 Init Context: r1(r09)",	"0x";hex(S2_Context(1))
	print "S2 Init Context: r0(r08)",	"0x";hex(S2_Context(0))

	print
	
	PendSV_Int_Config
	Ticker_INT_Config(Switch_FreqHz)
	InitRun_flag = 1
	ToggleFlag = 0
	Ticker_INT_Enable
	do
		print ".";
		wait(10)  
	loop
end

