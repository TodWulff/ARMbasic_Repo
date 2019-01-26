'~~ Definitions, Defines, and Initializations
#include "LPC54102.bas"
#include "ASMinlineBASIC.bas"

#define _systemclock 			96000000 		' the 54102 is a 96mhz device

#define MAX_TASK	4
#define INT_FRAME	(17-1)			' 8 registers + lr INTSUB pushes + 8 registers of INT

dim taskSP 	(MAX_TASK-1)			' saved SP here
dim taskTIME(MAX_TASK-1)			' in msec

task_num = 0		' cycles through the tasks
saveMainPC = 0
task0PC = 0			' will be set to task0

#define STACK_SZ	127	' probably don't need this much room -- each task needs a seperate stack
'DIM stack0 (STACK_SZ)			' now using the main stack for task0
DIM stack1 (STACK_SZ)		
DIM stack2 (STACK_SZ)		
DIM stack3 (STACK_SZ)		

dim start as integer

#define t1_Blinky_led_port	31
#define t2_Blinky_led_port	30
#define t3_Blinky_led_port	29
           
#define t1_Blinky_LEDDwell	1
#define t2_Blinky_LEDDwell	1
#define t3_Blinky_LEDDwell	1
           
#define t1_Blinky_Cycles	20
#define t2_Blinky_Cycles	20
#define t3_Blinky_Cycles	20
'~

INTERRUPT SUB MRT_ISR_sub
	dim r7			

	if (task_num = -1)	
		' special case on startup -- return to task0, save the return to main from task0

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

	MRT_INTVAL(0) = 0x80000000 or (taskTIME(task_num)*(_systemclock/1000))	' immediately load the MRT IntVal (must happen after the clock is enabled or the registers won't latch)
	MRT_IRQ_FLAG = MRT_IRQ_FLAG		' clear the MRT interrupt 
	ENDSUB

SUB Init_Timer_MS (Task_period_MS, ISR_Address)
	SCB_AHBCLKCTRL(1) or= SYSCON_CLOCK_MRT	' set the MRT bit to enable the clock to the register interface.
	SCB_PRESETCTRL(1) and= 0xFFFFFFFE 		' Clear reset to the MRT.
	PRINT "MRT_TIME: 0x";HEX(0x80000000 or (Task_period_MS*(_systemclock/1000)))
	MRT_INTVAL(0) = 0x80000000 or (Task_period_MS*(_systemclock/1000))	' immediately load the MRT IntVal
	MRT_CTRL(0) = 0x00000001			' enable TIMERn Interrupt in repeat interrupt mode
	MRT_ISR = ISR_Address or 1	' assign the isr sub addy to the NVIC vector table for MRT_irq  (the 'or 1' is for thumb code purposes)
	VICIntEnSet0 or= (1<<MRT_IRQn)				' enable the MRT interrupt
	ENDSUB

'	tasks can not share subroutines/functions that have parameters or locals, as those are NOT re-entrant

sub task0			' task0 is the first called, using main stack, and handles an exit_ semi-gracefully
	dim popOutAddr
	
	while 1					' tasks SHALL NEVER return_ -- equivalent of crossing the streams
		if ((timer - start) > (10*_systemclock)) then exit	' after 10s, exit the loop
	loop							' this takes ~10 seconds on a 100MHz 54102.
	
	T1_TCR = 0      		' TIMER1 disable
	Print "Task 0 initiating a termination of the app."
	popOutAddr = saveMainPC + 2 + 1	' x is used just to enable getting a value into R7 - save MainPC was initialized on first TMR interrupt - +1 (LSB) Thumb indicator, +2 is the offset to jump past BR self
	ASM_PUSH(LIST_R7)		' and this will be poped from MSP, as the PC, when this task exits on the next statement
							' Note:	Can't really do an addressof(endTasks), as it is not yet instatiated at this point in the compiler's processing of the source
							' 		would have to have a label up above and do some jumping around, which makes it more messy
	endsub

sub task1
	dim t1_led_dwell as integer
	dim t1_i as integer
	
	output(t1_Blinky_led_port)
t1_RestartTask:	
	
	t1_led_dwell = t1_Blinky_LEDDwell
	t1_i = t1_Blinky_Cycles
	
	while t1_i>0
		out(t1_Blinky_led_port) = t1_i and 1
		waitmicro(t1_Blinky_LEDDwell) ' so it can be seen
		t1_i -= 1
		loop
	goto t1_RestartTask
	endsub

sub task2
	dim t2_led_dwell as integer
	dim t2_i as integer
	
	output(t2_Blinky_led_port)
t2_RestartTask:	
	
	t2_led_dwell = t2_Blinky_LEDDwell
	t2_i = t2_Blinky_Cycles
	
	while t2_i>0
		out(t2_Blinky_led_port) = t2_i and 1
		waitmicro(t2_Blinky_LEDDwell) ' so it can be seen
		t2_i -= 1
		loop
	goto t2_RestartTask
	endsub

sub task3
	dim t3_led_dwell as integer
	dim t3_i as integer
	
	output(t3_Blinky_led_port)
t3_RestartTask:	
	
	t3_led_dwell = t3_Blinky_LEDDwell
	t3_i = t3_Blinky_Cycles
	
	while t3_i>0
		out(t3_Blinky_led_port) = t3_i and 1
		waitmicro(t3_Blinky_LEDDwell) ' so it can be seen
		t3_i -= 1
		loop
	goto t3_RestartTask
	endsub

sub Init_Tasks
	task_num = -1		' special case for initial task
	
	taskTIME(0) = 150		' arbitrary time in msec for each task - for the 54102, 175ms satuates the MRT period (24bit @ 96MHz)
	taskTIME(1) = 150
	taskTIME(2) = 150
	taskTIME(3) = 150
	
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
	endsub

main:
	wait(100) 						'for the M0 to do it's thing
	start = timer
	print "App Started @ ";start
	
	' the magic starts here	
	Init_Tasks
	Init_Timer_MS (taskTIME(0), ADDRESSOF(MRT_ISR_sub))	' first param is initial timer period, 2nd is the address of the servicing isr
	
	ASM_BR(0)			' branch to_ self in an endless loop - effectively w8g here until task0 turns off multitasking
						' Task0's ending statements impute a return to an address offset around this branch to self
						' This is done on the first ISR servicing
endTasks:
	MRT_CTRL(0) = 0x00000000			' disable MRT
	' cleanup the LED outputs to turn them off.
	out(t1_Blinky_led_port)=1
	out(t2_Blinky_led_port)=1
	out(t3_Blinky_led_port)=1
	
	' and cease
	print "App Terminated @ ";timer,"taking: ";(timer-start);" uS"
	quit
 
	end
