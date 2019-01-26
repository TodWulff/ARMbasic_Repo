
#ifdef LPC1756
 #include "LPC17xx.bas"
#elif defined LPC11U37
 #include "LPC11U3x.bas"
#elif defined LPC54102
 #include "LPC54102.bas"
#else
 #error this CPU not supported yet
#endif

#include "ASMinlineBASIC.bas"

#define MAX_TASK	4
#define INT_FRAME	(17-1)			' 8 registers + lr INTSUB pushes + 8 registers of INT

#define PT_PC		(INT_FRAME-1)

dim taskSP 	(MAX_TASK-1)			' saved SP here
dim taskTIME(MAX_TASK-1)			' in msec

task_num = 0		' cycles through the tasks
saveMainPC = 0
task0PC = 0			' will be set to task0

INTERRUPT SUB TIMER1IRQ
	dim x			
	
	if (task_num = -1) then	
		' special case on startup -- return to task0, save the return to main from task0
		
		x = ADDRESSOF(saveMainPC)
		ASM_LDR_SPI(0,60)			' r0 now has PC for main
		ASM_STRoff(0,7,0)			' save it in saveMainPC
		
		x = task0PC
		ASM_STR_SPI(7,60)			' set the return to task0:
		
		x = ADDRESSOF(taskSP)
		ASM_MOVRloRhi(0,REG_SP)		' r0 now has value of SP
		ASM_STRoff(0,7,0)			' save current SP in taskSP(0)

	else
		x = ADDRESSOF(taskSP) + (task_num<<2)
		ASM_MOVRloRhi(0,REG_SP)		' r0 now has value of SP
		ASM_STRoff(0,7,0)			' save it in taskSP(tasknum)
	endif
	
	task_num += 1
	if task_num = MAX_TASK then task_num = 0
	
	x = ADDRESSOF(taskSP) + (task_num<<2)
	ASM_LDRoff(0,7,0)				' get it from taskSP(tasknum)
	ASM_MOVRhiRlo(REG_SP,0)			' move SP to next task stack

	T1_TC  = 0      				' otherwise might be past MR0
	T1_MR0 = taskTIME(task_num)-1	' set the time alotted to the task
	
	T1_IR = 1	      ' Clear interrupt	
	
ENDSUB

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
	ASYNCAPBCLKCTRLSET = SYSCON_CLOCK_TIMER1		' enable TIMER1
	T1_PR  = 12499                         	'1 ms prescale
	VICIntEnSet0 = (1<<TIMER1_IRQn) 	 	'Enable interrupt
#else
	#warning -- need special setup for this CPU
#endif

	T1_MR0 = max_cnt-1 		' set up match number of ms
	T1_MCR = 3      		' Interrupt and Reset on MR0
	T1_IR  = 1      		' clear interrupt
	T1_TC  = 0      		' clear timer counter
	
	T1_TCR = 1      		' TIMER1 Enable
	
ENDSUB


#define STACK_SZ	127	' probably don't need this much room -- each task needs a seperate stack
'DIM stack0 (STACK_SZ)			' now using the main stack for task0
DIM stack1 (STACK_SZ)		
DIM stack2 (STACK_SZ)		
DIM stack3 (STACK_SZ)		

'	tasks can not share subroutines/functions that have parameters or locals, as those are NOT re-entrant


sub task0			' task0 is the first called, using main stack, and handles an exit semi-gracefully
	dim x
	
	while 1					' tasks SHALL NEVER return -- equivalent of crossing the streams
		IO(6)=0
		IO(6)=1
		x = x + 1
		if x > &H100000 then exit
	loop
	
	T1_TCR = 0      		' TIMER1 disable
	x = saveMainPC + 3		' LSB Thumb indicator, and return past BR self
	ASM_PUSH(LIST_R7)		' and this will be poped as PC
end sub

sub task1
	while 1
		IO(7)=0
		IO(7)=1
	loop
end sub

sub task2
	while 1
		IO(8)=0		
		IO(8)=1
	loop
end sub

sub task3
	while 1
		IO(9)=0
		IO(9)=1
	loop
end sub


main:
	
	task_num = -1		' special case for initial task
	
	taskTIME(0) = 50		' arbitrary time in msec for each task
	taskTIME(1) = 10
	taskTIME(2) = 15
	taskTIME(3) = 20
	
	task0PC = ADDRESSOF(task0) + 1					' first entry to timer interrupt uses this to patch return stack
			
	taskSP(1) = ADDRESSOF(stack1) + (STACK_SZ-INT_FRAME)*4 
	stack1(STACK_SZ)   = &H61000000					'  seems to be initial PSR
	stack1(STACK_SZ-1) = ADDRESSOF(task1) + 1
	stack1(STACK_SZ-8) = &HFFFFFFF9					' INTERRUPT SUB pushes LR here
		
	taskSP(2) = ADDRESSOF(stack2) + (STACK_SZ-INT_FRAME)*4 
	stack2(STACK_SZ)   = &H61000000					'  seems to be initial PSR
	stack2(STACK_SZ-1) = ADDRESSOF(task2) + 1
	stack2(STACK_SZ-8) = &HFFFFFFF9					' INTERRUPT SUB pushes LR here
		
	taskSP(3) = ADDRESSOF(stack3) + (STACK_SZ-INT_FRAME)*4 
	stack3(STACK_SZ)   = &H61000000					'  seems to be initial PSR
	stack3(STACK_SZ-1) = ADDRESSOF(task3) + 1
	stack3(STACK_SZ-8) = &HFFFFFFF9					' INTERRUPT SUB pushes LR here

	ASYNCAPBCLKCTRLSET = SYSCON_CLOCK_TIMER1		' enable TIMER1	
	
	ON_TIMER (taskTIME(0), ADDRESSOF(TIMER1IRQ))
	
	ASM_BR(0)			' wait here until task0 turns off multitasking
	
endTasks:
			
	print "we're back"

