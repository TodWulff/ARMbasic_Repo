
#define TIMER_IRQ	TIMER1IRQ

#ifdef LPC1756
 #include "LPC17xx.bas"
#elif defined LPC11U37
 #include "LPC11U3x.bas"
#elif defined LPC54102
 #include "LPC54102.bas"
#elif defined LPC1114
 #include "LPC11xx.bas"
#elif defined LPC824
 #include "LPC8xx.bas"
 #define TIMER_IRQ	MRTIMER_IRQ
#else
 #error this CPU not supported yet
#endif

#include "ASMinlineBASIC.bas"

#define MAX_TASK	4

' interrupt stack frame    ARM INT pushes 8, INTERRUPT SUB pushes 8 + LR
#define INT_FRAME	(17-1)			
#define RETURN_PC	((INT_FRAME-1)*4)

dim taskSP 	(MAX_TASK-1)			' saved SP here
dim taskTIME(MAX_TASK-1)			' in msec

task_num = 0		' cycles through the tasks
saveMainPC = 0
task0PC = 0			' will be set to task0

INTERRUPT SUB TIMER_IRQ
	dim r7			' this is just an arbitrary name, BASIC expression results end up in R7
	
	if (task_num = -1) then	
		' special case on startup -- return to task0, save the return to main for task0 exit
		
		ASM_LDR_SPI(7,RETURN_PC)	' r7 now has PC for main
		saveMainPC = __ASM__		' save it in saveMainPC
		
		r7 = task0PC
		ASM_STR_SPI(7,RETURN_PC)	' set the return to task0:
		
		ASM_MOVRloRhi(7,REG_SP)		' r7 now has value of SP
		r7 = __ASM__				' calculating the next (index) clobbers R7, so save it
		taskSP(0) = r7				' save current SP in taskSP(0)

	else
		ASM_MOVRloRhi(7,REG_SP)		' r7 now has value of SP
		r7 = __ASM__				' calculating the next (index) clobbers R7, so save it
		taskSP(task_num) = r7		' save it in taskSP(tasknum)
	endif
	
	task_num += 1
	if task_num = MAX_TASK then task_num = 0
	
	r7 = taskSP(task_num)
	ASM_MOVRhiRlo(REG_SP,7)			' move SP to next task stack
	
#ifdef LPC824
	MRT_Channel0_INTVAL = 0x80000000 or ((taskTIME(task_num)*30000)-1)
	MRT_Channel0_STAT = 1			' Clear interrupt	

#else

	T1_TC  = 0      				' otherwise might be past MR0
	T1_MR0 = taskTIME(task_num)-1	' set the time alotted to the task
	
	T1_IR = 1	      				' Clear interrupt	
#endif
	
ENDSUB

#ifdef LPC824
SUB ON_TIMER ( max_cnt, dothis )
    SYSCON_SYSAHBCLKCTRL or= (1<<10)      	' set the MRT bit to enable the clock to the register interface.
    SYSCON_PRESETCTRL or= (1<<7)         	' clear a reset on the MRT
    MRT_Channel0_INTVAL = 0x80000000 or (max_cnt * 30000)-1)  ' b31 forces an immediate load the MRT IntVal
    MRT_Channel0_CTRL = 0x00000003        	' enable TIMERn Interrupt in one shot mode
    MRT_ISR = dothis or 1          	' assign the isr sub addy to the NVIC vector table for MRT_irq  (the 'or 1' is for thumb code purposes)
    VICIntEnable or= (1<<10)          		' enable the MRT interrupt

ENDSUB

#else

SUB ON_TIMER ( max_cnt, dothis )		' max_cnt in msec
#if defined LPC1756 || defined LPC1751
	TIMER1_ISR   = dothis + 1              	'set function of VIC   -- need the +1 for Thumb operation
	T1_PR  = 24999                         	'1 ms prescale
	VICIntEnable or= (1<<2)  				'Enable interrupt
#elif defined LPC11U37
	TIMER1_ISR   = dothis + 1              	'set function of VIC   -- need the +1 for Thumb operation
	SYSCON_SYSAHBCLKCTRL OR= (1<<10)		' enable TIMER1
	T1_PR  = 24999                         	'1 ms prescale
	VICIntEnable OR= (1<<TIMER1_IRQn)  	 	'Enable interrupt
#elif defined LPC54102
	TIMER1_ISR   = dothis + 1              	'set function of VIC   -- need the +1 for Thumb operation
	ASYNCAPBCLKCTRLSET = SYSCON_CLOCK_TIMER1	' enable TIMER1
	T1_PR  = 12499                         	'1 ms prescale
	VICIntEnSet0 = (1<<TIMER1_IRQn) 	 	'Enable interrupt
#elif defined LPC1114
   TIMER1_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
   T1_PR  = 49999                         '1 ms prescale
   VICIntEnable or= (1<<19)  'Enable interrupt REMEMBER for LPC11xx we swapped 0/1 with 2/3
#else
	#warning -- need special setup for this CPU
#endif

	T1_MR0 = max_cnt-1 		' set up match number of ms
	T1_MCR = 3      		' Interrupt and Reset on MR0
	T1_IR  = 1      		' clear interrupt
	T1_TC  = 0      		' clear timer counter
	
	T1_TCR = 1      		' TIMER1 Enable
	
ENDSUB

#endif

#define STACK_SZ	127	' probably don't need this much room -- each task needs a seperate stack
'DIM stack0 (STACK_SZ)			' now using the main stack for task0
DIM stack1 (STACK_SZ)		
DIM stack2 (STACK_SZ)		
DIM stack3 (STACK_SZ)		

'	tasks can not share subroutines/functions that have parameters or locals, as those are NOT re-entrant

t0=0
t1=0
t2=0
t3=0

sub task0			' task0 is the first called, using main stack, and handles an exit semi-gracefully
	dim x
	
	ASM_MOV(7,5)
	print hex(__ASM__)
	while 1					
		IO(14)=0
		IO(14)=1
		t0=t0+1
		' x = x + 1
		' if x > &H100000 then exit
	loop

#ifdef LPC824
#else	
	T1_TCR = 0      		' TIMER1 disable
#endif

	x = saveMainPC + 3		' LSB Thumb indicator, and return past BR self
	ASM_PUSH(LIST_R7)		' and this will be poped as PC
end sub

sub task1
	ASM_MOV(7,5)
	print hex(__ASM__)
	while 1					' tasks SHALL NEVER return -- equivalent of crossing the streams
		IO(31)=0
		IO(31)=1
		IO(17)=0
		IO(17)=1
		t1=t1+1
	loop
end sub

sub task2
	ASM_MOV(7,5)
	print hex(__ASM__)
	while 1
		IO(30)=0		
		IO(30)=1
		IO(16)=0
		IO(16)=1
		t2=t2+1
	loop
end sub

sub task3
	ASM_MOV(7,5)
	print hex(__ASM__)
	while 1
		IO(29)=0
		IO(29)=1
		IO(15)=0
		IO(15)=1
		t3=t3+1
	loop
end sub

reg_r5 = 0

main:
	
	task_num = -1			' special case for initial task switch
	
	taskTIME(0) = 50		' arbitrary time in msec for each task
	taskTIME(1) = 10
	taskTIME(2) = 15
	taskTIME(3) = 20
	
	ASM_MOV(7,5)			' r5 used to calculate global addresses
	reg_r5 = __ASM__
	
	task0PC = ADDRESSOF(task0) + 1					' first entry to timer interrupt uses this to patch return stack
			
	taskSP(1) = ADDRESSOF(stack1) + (STACK_SZ-INT_FRAME)*4 
	stack1(STACK_SZ)   = &H61000000					'  seems to be initial PSR
	stack1(STACK_SZ-1) = ADDRESSOF(task1) + 1
	stack1(STACK_SZ-8) = &HFFFFFFF9					' INTERRUPT SUB pushes LR here
	stack1(STACK_SZ-11) = reg_r5					' used to access globals
		
	taskSP(2) = ADDRESSOF(stack2) + (STACK_SZ-INT_FRAME)*4 
	stack2(STACK_SZ)   = &H61000000					'  seems to be initial PSR
	stack2(STACK_SZ-1) = ADDRESSOF(task2) + 1
	stack2(STACK_SZ-8) = &HFFFFFFF9					' INTERRUPT SUB pushes LR here
	stack2(STACK_SZ-11) = reg_r5					' used to access globals
		
	taskSP(3) = ADDRESSOF(stack3) + (STACK_SZ-INT_FRAME)*4 
	stack3(STACK_SZ)   = &H61000000					'  seems to be initial PSR
	stack3(STACK_SZ-1) = ADDRESSOF(task3) + 1
	stack3(STACK_SZ-8) = &HFFFFFFF9					' INTERRUPT SUB pushes LR here
	stack3(STACK_SZ-11) = reg_r5					' used to access globals
	
	ON_TIMER (taskTIME(0), ADDRESSOF(TIMER_IRQ))	' start timer1 interrupts
	
	ASM_BR(0)			' wait here until task0 turns off multitasking
	
endTasks:
			
	print "we're back"
	STOP				' if you want to debug
