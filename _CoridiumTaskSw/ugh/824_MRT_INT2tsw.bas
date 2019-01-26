'~~ Defines & Includes
#include "LPC8xx.bas"							' needed for the header #defs 

#define _systemclock 			30000000 		' the 824 is a 30mhz device
	
#define MRT_IRQ_GFLAG			*0x400040F8		' mia from LPC8xx lib
#define MRT_Channel0_TIMER		*&H40004004		' fix an error in LPC8xx lib

#include "ASMinlineBASIC.bas"

#define MAX_TASK	4
#define INT_FRAME	(17-1)			' 8 registers + lr INTSUB pushes + 8 registers of INT
#define STACK_SZ	127				' probably don't need this much room -- each task needs a seperate stack

#define t1_824_Blinky_led_port	15
#define t2_824_Blinky_led_port	16
#define t3_824_Blinky_led_port	17

#define t1_824_Blinky_LEDDwell	10
#define t2_824_Blinky_LEDDwell	10
#define t3_824_Blinky_LEDDwell	10

#define t1_824_Blinky_Cycles	20
#define t2_824_Blinky_Cycles	20
#define t3_824_Blinky_Cycles	20
'~

_MRT_InitGlobals:	'~~
	dim MRT_INT_Flag as integer		' this is a MRT user flag
	dim MRT_INT_Time as integer		' set inside the ISR for reporting purposes

	dim taskSP 	(MAX_TASK-1)			' saved SP here
	dim taskTIME(MAX_TASK-1)			' in msec
	'DIM stack0 (STACK_SZ)			' now using the main stack for task0
	DIM stack1 (STACK_SZ)		
	DIM stack2 (STACK_SZ)		
	DIM stack3 (STACK_SZ)		

	dim task_num, saveMainPC, task0PC as integer

	task_num = 0		' cycles through the tasks
	saveMainPC = 0
	task0PC = 0			' will be set to task0
	
	MRT_INT_Flag = 0							' deassert the MRT user flag
	return	'~

INTERRUPT SUB _MRT_INT_ISR2
	dim r7 as integer

	MRT_INT_Time = timer			' capture time for reporting purposes

	if (task_num = -1)	
		//special case on startup -- return to task0, save the return to main from task0

		ASM_LDR_SPI(7,60)			' r7 now has PC for main
		saveMainPC = __ASM__		' save it in saveMainPC

		r7 = task0PC
		ASM_STR_SPI(7,60)			' set the return to task0:

		ASM_MOVRloRhi(7,REG_SP)		' r7 now has value of SP
		r7 = __ASM__				' calculating the next (index) clobbers R7
		taskSP(0) = r7				' save current SP in taskSP(0)

	else
		ASM_MOVRloRhi(7,REG_SP)		' r7 now has value of SP
		r7 = __ASM__				' calculating the next (index) clobbers R7
		taskSP(task_num) = r7		' save it in taskSP(tasknum)
	endif

	task_num += 1
	if task_num = MAX_TASK then task_num = 0

	r7 = taskSP(task_num)
	ASM_MOVRhiRlo(REG_SP,7)			' move SP to next task stack
	
	MRT_Channel0_INTVAL = 0x80000000 or (_systemclock/1000*taskTIME(task_num))	' immediately load the MRT IntVal
	MRT_IRQ_GFLAG = MRT_IRQ_GFLAG	' clear the MRT interrupt - writing a 1 to the set bits clears them.
	ENDSUB


sub Init_MRT (MRT_Counts as integer, MRT_ISR_Addr as integer)		' could consider using a single to get sub-Hz frequency resolution
	SYSCON_SYSAHBCLKCTRL or= (1<<10)		' set the MRT bit to enable the clock to the register interface.
	SYSCON_PRESETCTRL or= (1<<7) 			' initialize reset to the MRT
	MRT_Channel0_INTVAL = 0x80000000 or MRT_Counts	' immediately load the MRT IntVal (must happen after the clock is enabled or the registers won't latch)
	MRT_Channel0_CTRL = 0x00000001			' enable TIMERn Interrupt in repeat interrupt mode
	MRT_ISR = (MRT_ISR_Addr) or 1	' assign the isr sub addy to the NVIC vector table for MRT_irq  (the 'or 1' is for thumb code purposes)
	VICIntEnable or= (1<<10)				' enable the MRT interrupt
	endsub

'	tasks can not share subroutines/functions that have parameters or locals, as those are NOT re-entrant

sub task0			' task0 is the first called, using main stack, and handles an exit semi-gracefully
	dim x
	
	while 1					' tasks SHALL NEVER return -- equivalent of crossing the streams
		x = x + 1
		if x > &H100000 then exit	' after ~1M iterations through this loop, exit the loop - special case for task 0 (uses MSP)
	loop							' this takes ~10 seconds on a 100MHz 54102.
	
	VICIntEnClear = (1<<10)				' disable the MRT interrupt
	Print "Task 0 initiating a termination of the app."
	wait(100)
	x = (saveMainPC + 2) or 1	' x is used just to enable getting a value into R7 - save MainPC was initialized on first TMR interrupt - +1 (LSB) Thumb indicator, +2 is the offset to jump past BR self
	ASM_PUSH(LIST_R7)		' and this will be poped from MSP, as the PC, when this task exits on the next statement
							// Note:	Can't really do an addressof(endTasks), as it is not yet instatiated at this point in the compiler's processing of the source
							// 		would have to have a label up above and do some jumping around, which makes it more messy
	endsub

sub task1
	dim t1_led_dwell as integer
	dim t1_i as integer
	
	output(t1_824_Blinky_led_port)
t1_RestartTask:	
	
	t1_led_dwell = t1_824_Blinky_LEDDwell
	t1_i = t1_824_Blinky_Cycles
	
	while t1_i>0
		out(t1_824_Blinky_led_port) = t1_i and 1
		wait(t1_824_Blinky_LEDDwell) ' so it can be seen
		t1_i -= 1
		loop
	goto t1_RestartTask
	endsub

sub task2
	dim t2_led_dwell as integer
	dim t2_i as integer
	
	output(t2_824_Blinky_led_port)
t2_RestartTask:	
	
	t2_led_dwell = t2_824_Blinky_LEDDwell
	t2_i = t2_824_Blinky_Cycles
	
	while t2_i>0
		out(t2_824_Blinky_led_port) = t2_i and 1
		wait(t2_824_Blinky_LEDDwell) ' so it can be seen
		t2_i -= 1
		loop
	goto t2_RestartTask
	endsub

sub task3
	dim t3_led_dwell as integer
	dim t3_i as integer
	
	output(t3_824_Blinky_led_port)
t3_RestartTask:	
	
	t3_led_dwell = t3_824_Blinky_LEDDwell
	t3_i = t3_824_Blinky_Cycles
	
	while t3_i>0
		out(t3_824_Blinky_led_port) = t3_i and 1
		wait(t3_824_Blinky_LEDDwell) ' so it can be seen
		t3_i -= 1
		loop
	goto t3_RestartTask
	endsub

sub Init_Tasks
	
	task_num = -1			' set up flag for special case for initial task
	
	taskTIME(0) = 200		' arbitrary time in mS for each task
	taskTIME(1) = 100
	taskTIME(2) = 500
	taskTIME(3) = 250
	
	task0PC = ADDRESSOF(task0) or 1					' first entry to timer interrupt uses this to patch return stack; or 1 for thumb
			
	taskSP(1) = ADDRESSOF(stack1) + (STACK_SZ-INT_FRAME)*4 
	stack1(STACK_SZ)   = &H60000000					' seems to be initial PSR
	stack1(STACK_SZ-1) = ADDRESSOF(task1) or 1		' or 1 for thumb
	stack1(STACK_SZ-8) = &HFFFFFFF9					' INTERRUPT SUB pushes LR here
		
	taskSP(2) = ADDRESSOF(stack2) + (STACK_SZ-INT_FRAME)*4 
	stack2(STACK_SZ)   = &H60000000					' seems to be initial PSR
	stack2(STACK_SZ-1) = ADDRESSOF(task2) or 1		' or 1 for thumb
	stack2(STACK_SZ-8) = &HFFFFFFF9					' INTERRUPT SUB pushes LR here
		
	taskSP(3) = ADDRESSOF(stack3) + (STACK_SZ-INT_FRAME)*4 
	stack3(STACK_SZ)   = &H60000000					' seems to be initial PSR
	stack3(STACK_SZ-1) = ADDRESSOF(task3) or 1		' or 1 for thumb
	stack3(STACK_SZ-8) = &HFFFFFFF9					' INTERRUPT SUB pushes LR here
	endsub

main:
	dim start as integer
	call _MRT_InitGlobals						' using brucee's little trick to get globals instantiated from within a sub/func/main
	
	start = timer
	print "App Start:  ";start
	
	' the magic starts here	
	Init_Tasks
	Init_MRT (_systemclock/1000*taskTIME(0), addressof(_MRT_INT_ISR2))	' and turn on the MRT with an initial period for task0, mS

	ASM_BR(0)			' branch to self in an endless loop - effectively w8g here until first interrupt fires
						// when task0 turns off multitasking, the stack's return address will have been patched to endTasks (next statement)
						// Task0's ending statements impute a return to an address offset around this branch to self
						// This is done on the first ISR servicing
endTasks:
	// cleanup the LED outputs to turn them off.
	out(t1_824_Blinky_led_port)=1
	out(t2_824_Blinky_led_port)=1
	out(t3_824_Blinky_led_port)=1
	
	// and cease
	print "App Terminated @ ";timer,"taking: ~";(timer-start);" uS"
	
end
