'~~ Definitions, Defines, and Initializations
#include "LPC8xx.bas"							' needed for the header #defs 
#include "ASMinlineBASIC.bas"

#define _systemclock 			30000000 		' the 824 is a 30mhz device
	
#define MRT_IRQ_GFLAG			*0x400040F8		' mia from LPC8xx lib
#define MRT_Channel0_TIMER		*&H40004004		' fix an error in LPC8xx lib


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

#define t1_824_Blinky_led_port	15
#define t2_824_Blinky_led_port	16
#define t3_824_Blinky_led_port	17

#define t1_824_Blinky_LEDDwell	1
#define t2_824_Blinky_LEDDwell	1
#define t3_824_Blinky_LEDDwell	1

#define t1_824_Blinky_Cycles	20
#define t2_824_Blinky_Cycles	20
#define t3_824_Blinky_Cycles	20
'~

interrupt sub _MRT_INT_ISR			' this isr only sets a flag, clears the interrupt and exits - a handler will perform servicing outside of an interrupt context
	' MRT_INT_Flag = MRT_IRQ_GFLAG	' assert the user flag during the ISR, saving the GFLAG0-4 in a user flag var
	print "MRT Interrupt ";MRT_IRQ_GFLAG;" Fired @ "; timer  ' this is stuff...
	MRT_IRQ_GFLAG = MRT_IRQ_GFLAG	' clear the MRT interrupt - writing a 1 to the set bits clears them.
	' MRT_INT_Time = timer			' capture time for reporting purposes
	endsub


INTERRUPT SUB TIMER1IRQ
	dim r7			

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
	
	' PRINT "ISR_TIME: 0x";HEX(0x80000000 or (_systemclock/(1000/taskTIME(task_num))))
	MRT_Channel0_INTVAL = 0x80000000 or (_systemclock/(1000/taskTIME(task_num)))	' immediately load the MRT IntVal (must happen after the clock is enabled or the registers won't latch)
	MRT_IRQ_GFLAG = MRT_IRQ_GFLAG	' clear the MRT interrupt - writing a 1 to the set bits clears them.
	ENDSUB

SUB Init_Timer_MS (MRT_Freq, ISR_Address )	' TMR_period in msec
	SYSCON_SYSAHBCLKCTRL or= (1<<10)		' set the MRT bit to enable the clock to the register interface.
	SYSCON_PRESETCTRL or= (1<<7) 			' initialize reset to the MRT

	PRINT "MRT_TIME: 0x";HEX(0x80000000 or (_systemclock/MRT_Freq))
	MRT_Channel0_INTVAL = 0x80000000 or (_systemclock/MRT_Freq)	' immediately load the MRT IntVal (must happen after the clock is enabled or the registers won't latch)
	MRT_Channel0_CTRL = 0x00000001			' enable TIMERn Interrupt in repeat interrupt mode
	MRT_ISR = (addressof ISR_Address) or 1	' assign the isr sub addy to the NVIC vector table for MRT_irq  (the 'or 1' is for thumb code purposes)
	VICIntEnable or= (1<<10)				' enable the MRT interrupt
	ENDSUB

'	tasks can not share subroutines/functions that have parameters or locals, as those are NOT re-entrant

sub task0			' task0 is the first called, using main stack, and handles an exit semi-gracefully
	dim x
	
	while 1					' tasks SHALL NEVER return -- equivalent of crossing the streams
		' IO(6)=0
		' IO(6)=1
		x = x + 1
		if x > &H00690000 then exit	' after ~7M iterations through this loop, exit the loop
	loop							' this takes ~10 seconds on a 100MHz 54102.
	
	' VICIntEnClear or= (1<<10)				' sisable the MRT interrupt
	Print "Task 0 initiating a termination of the app."
	x = saveMainPC + 2 + 1	' x is used just to enable getting a value into R7 - save MainPC was initialized on first TMR interrupt - +1 (LSB) Thumb indicator, +2 is the offset to jump past BR self
	ASM_PUSH(LIST_R7)		' and this will be poped from MSP, as the PC, when this task exits on the next statement
							' Note:	Can't really do an addressof(endTasks), as it is not yet instatiated at this point in the compiler's processing of the source
							' 		would have to have a label up above and do some jumping around, which makes it more messy
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
		waitmicro(t1_824_Blinky_LEDDwell) ' so it can be seen
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
		waitmicro(t2_824_Blinky_LEDDwell) ' so it can be seen
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
		waitmicro(t3_824_Blinky_LEDDwell) ' so it can be seen
		t3_i -= 1
		loop
	goto t3_RestartTask
	endsub

sub Init_Tasks
	task_num = -1		' special case for initial task
	
	taskTIME(0) = 200		' arbitrary time in msec for each task
	taskTIME(1) = 200
	taskTIME(2) = 200
	taskTIME(3) = 200
	
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
	dim start as integer
	
	' enable SWD
	dim _824PinEnableReg0Bits as integer
	#define _824PinEnableReg0Addr 0x4000C1C0
	#define _824PinEnableReg0Mask 0x01ffffff
	_824PinEnableReg0Bits = *_824PinEnableReg0Addr
	*_824PinEnableReg0Addr = _824PinEnableReg0Mask and (_824PinEnableReg0Bits and 0xffffffcf) 'b5:b4 = 0...
	' *0x4000C1C0 = 0x01fffECf	'hmm doesn't work when put here - need to figure it out - put inside of main for now...

	print "Paused.  SWD enabled.  Connect debugger and then press enter to continue."
	debugin start
	
	start = timer
	print "App Started @ ";start
	
	' the magic starts here	
	Init_Tasks
	' Init_Timer_MS (1000/taskTIME(0), ADDRESSOF(TIMER1IRQ))	' first param is freq, 2nd is the address of the servicing isr
	Init_Timer_MS (1000/taskTIME(0), ADDRESSOF(_MRT_INT_ISR))	' first param is freq, 2nd is the address of the servicing isr
	
	ASM_BR(0)			' branch to self in an endless loop - effectively w8g here until task0 turns off multitasking
						' Task0's ending statements impute a return to an address offset around this branch to self
						' This is done on the first ISR servicing
endTasks:
	' cleanup the LED outputs to turn them off.
	out(t1_824_Blinky_led_port)=1
	out(t2_824_Blinky_led_port)=1
	out(t3_824_Blinky_led_port)=1
	
	' and cease
	print "App Terminated @ ";timer,"taking: ~";(timer-start)/1000000;" seconds"

	end
