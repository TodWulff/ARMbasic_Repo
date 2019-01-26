
'~~  Device #defs
#ifdef LPC1756				
 #include "LPC17xx.bas"
#elif defined LPC11U37
 #include "LPC11U3x.bas"
#elif defined LPC54102
 #include "LPC54102.bas"
#else
 #error this CPU not supported yet
#endif
'~

'~~  Task Switch Configs
#include "ASMinlineBASIC.bas"
#define MAX_TASK	4
#define INT_FRAME	(17-1)			' 8 registers + lr INTSUB pushes + 8 registers of INT
#define STACK_SZ	127				' probably don't need this much room -- each task needs a seperate stack
#define PT_PC		(INT_FRAME-1)

dim taskSP 	(MAX_TASK-1)			' saved SP here
dim taskTIME(MAX_TASK-1)			' in msec

DIM stack0 (STACK_SZ)		
DIM stack1 (STACK_SZ)		
DIM stack2 (STACK_SZ)		
DIM stack3 (STACK_SZ)		

'	tasks can not share subroutines/functions that have parameters or locals, as those are NOT re-entrant

task_num = 0		' cycles through the tasks

'~

INTERRUPT SUB TIMER1IRQ
	dim x			
	
	if (task_num = -1) 	
		' special case on startup -- don't save the main SP
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

'~~ Device Specific Timer Configs
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
	T1_PR  = 24999                         	'1 ms prescale
	VICIntEnSet0 = (1<<TIMER1_IRQn) 	 	'Enable interrupt
#else
	#warning -- need special setup f0r this CPU
#endif	'~

	T1_MR0 = max_cnt-1 		' set up match number of ms
	T1_MCR = 3      		' Interrupt and Reset on MR0
	T1_IR  = 1      		' clear interrupt
	T1_TC  = 0      		' clear timer counter
	
	T1_TCR = 1      		' TIMER1 Enable
	
ENDSUB

sub task0
	while 1					' tasks SHALL NEVER return -- equivalent of crossing the streams
		IO(6)=0
		IO(6)=1
'		print "0";
	loop
							' if we do finish early someday -- a software interrupt could be used ???
endsub

sub task1
	while 1
		IO(7)=0
		IO(7)=1
'		print "1";
	loop
endsub

sub task2
	while 1
		IO(8)=0
		IO(8)=1
'		print "2";
	loop
endsub

sub task3
	while 1
		IO(9)=0
		IO(9)=1
'		print "3";
	loop
endsub

main:
	
	task_num = -1		' special case for initial task
	
	taskTIME(0) = 50		' time in msec for each task
	taskTIME(1) = 10
	taskTIME(2) = 15
	taskTIME(3) = 20
	
	taskSP(0) = ADDRESSOF(stack0) + (STACK_SZ-INT_FRAME)*4 
	stack0(STACK_SZ)   = &H61000000					'  seems to be initial PSR
	stack0(STACK_SZ-1) = ADDRESSOF(task0) + 1
	stack0(STACK_SZ-8) = &HFFFFFFF9					' INTERRUPT SUB pushes LR here
		
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
		
	ASYNCAPBCLKCTRLSET = SYSCON_CLOCK_TIMER1		' enable TIMER1	
	
	print hex(ASYNCAPBCLKCTRL), hex(SYSCON_CLOCK_TIMER1)
	
	while 1			' never comes back here after the first timer IRQ
	loop

	end
