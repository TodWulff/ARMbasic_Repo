'~~ Definitions, Defines, and Initializations
#include "LPC54102.bas"
#include "ASMinlineBASIC.bas"

#define MAX_TASK	4
#define INT_FRAME	(17-1)			' 8 registers + lr INTSUB pushes + 8 registers of INT

dim taskSP 	(MAX_TASK-1)			' saved SP here
dim taskTIME(MAX_TASK-1)			' in msec

task_num = 0						' cycles through the tasks
saveMainPC = 0						' for popping out of thread 0
task0PC = 0							' will be set to task0

dim start as integer
dim stopped as integer

#define STACK_SZ	127	' probably don't need this much room -- each task needs a seperate stack
'DIM stack0 (STACK_SZ)			' now using the main stack for task0
DIM stack1 (STACK_SZ)		
DIM stack2 (STACK_SZ)		
DIM stack3 (STACK_SZ)		

#define blu_led_port	31		' Blu LED
#define grn_led_port	30		' Grn LED
#define red_led_port	29		' Red LED

#define uS_app_runtime		10000000
'~

INTERRUPT SUB TIMER1IRQ
	dim r7			

	' enable these to shut the ports off at task-switch time, if desired.
	out(blu_led_port)=1
	out(grn_led_port)=1
	out(red_led_port)=1

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

	T1_TC  = 0      				' otherwise might be past MR0
	T1_MR0 = taskTIME(task_num)-1	' set the time alotted to the task

	T1_IR = 1	      				' Clear interrupt	
	ENDSUB

SUB Init_Timer_MS (TMR_period, ISR_Address )	' TMR_period in msec
	ASYNCAPBCLKCTRLSET = SYSCON_CLOCK_TIMER1	' enable TIMER1
	TIMER1_ISR   = ISR_Address + 1              ' set VIC ISR address   -- need the +1 for Thumb operation
	T1_PR  = 12499								' 1 ms prescale
	VICIntEnSet0 = (1<<TIMER1_IRQn)				' Enable interrupt for the Timer Peripheral
	T1_MR0 = TMR_period-1 						' set up match number of ms
	PRINT "TMR_TIME (cfg'd with a mS prescaler): 0x";HEX(TMR_period)
	T1_MCR = 3      							' Interrupt and Reset on MR0
	T1_IR  = 1      							' clear interrupt
	T1_TC  = 0      							' clear timer counter
	T1_TCR = 1      							' TIMER1 Enable - start the timer...
	ENDSUB

'	tasks can not share subroutines/functions that have parameters or locals, as those are NOT re-entrant

sub task0			' task0 is the first called, using main stack, and handles an exit semi-gracefully
	dim popOutAddr
	
	while 1					' tasks SHALL NEVER return -- equivalent of crossing the streams
		if timer - start > uS_app_runtime then exit ' cease after the #def'd time
	loop
	
	T1_TCR = 0      		' TIMER1 disable
	Print "Task 0 initiating a termination of the app."
	popOutAddr = saveMainPC + 2 + 1	' x is used just to enable getting a value into R7 - save MainPC was initialized on first TMR interrupt - +1 (LSB) Thumb indicator, +2 is the offset to jump past BR self
	ASM_PUSH(LIST_R7)		' and this will be poped from MSP, as the PC, when this task exits on the next statement
							' Note:	Can't really do an addressof(endTasks), as it is not yet instatiated at this point in the compiler's processing of the source
							' 		would have to have a label up above and do some jumping around, which makes it more messy
	endsub

sub task1
	output(blu_led_port)
	out(blu_led_port)	= 1			' turn the LED off
	while 1
		out (blu_led_port) = 0	' turn the led on
		out (blu_led_port) = 1	' and turn it off
	loop
	endsub

sub task2
	output(grn_led_port)
	out(grn_led_port)	= 1			' turn the LED off
	while 1
		out (grn_led_port) = 0	' turn the led on
		out (grn_led_port) = 1	' and turn it off
	loop
	endsub

sub task3
	output(red_led_port)
	out(red_led_port)	= 1			' turn the LED off
	while 1
		out (red_led_port) = 0	' turn the led on
		out (red_led_port) = 1	' and turn it off
	loop
	endsub

sub Init_Tasks
	task_num = -1		' special case for initial task
	
	taskTIME(0) = 100		' arbitrary time in msec for each task
	taskTIME(1) = 100
	taskTIME(2) = 100
	taskTIME(3) = 100
	
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
	print "App Started @ ";start
	
	' the magic starts here	
	Init_Tasks
	start = timer
	Init_Timer_MS (taskTIME(0), ADDRESSOF(TIMER1IRQ))	' first param is initial timer period, 2nd is the address of the servicing isr
	
	ASM_BR(0)			' branch to self in an endless loop - effectively w8g here until task0 turns off multitasking
						' Task0's ending statements impute a return to an address offset around this branch to self
						' This is done on the first ISR servicing
						
endTasks:				' this is the popOutAddr
	' cleanup the LED outputs to turn them off.
	out(blu_led_port)=1
	out(grn_led_port)=1
	out(red_led_port)=1
	
	' and cease
	stopped = timer
	print "App Terminated @ ";stopped,"taking: ";(stopped-start);" uS"

	end
	
	'OBSERVATION:  while app does cease, the target is not being restored to proper 'interactivity'
	'the target is unresponsive to console commands.
