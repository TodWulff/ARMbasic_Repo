#define ABmt_SchedulerCompile

' #define ABmt_TasksLoaded 0
#pragma filepp SetBlankSupp 0
#pragma filepp SetWordBoundaries 0

#define ABmt_TasksLoaded 1
#include "ABmt_Tasks\54102Blinky.bas"
#define ABmt_TasksLoaded add(ABmt_TasksLoaded,1)
#include "ABmt_Tasks\54102Printy.bas"

#pragma filepp SetWordBoundaries 1

#undef main:	
#undef end		

' need to count included tasks automagically
' might need filepp's math to do so.?.
' for now, it is declared
#define _ABmt_TaskCount 2

' move these to a ABmt_Config #include
' for now, just declare
#define _ABmt_MaxTasks	16


#define _ABmt_TaskID 0
#define _ABmt_TaskName ABmt_Scheduler

// This stays at the very top, as the first compiled token, so that the scheduler's entry point is always known
ABmt_Task_0:
	goto main

ABmt_TaskInit_Globals:
	dim ABmt_TaskCount as integer
	dim ABmt_TaskEntryAddress(_ABmt_MaxTasks) as integer
return

sub ABmt_TaskInit()
'	print "Loaded Tasks: "; ABmt_LoadedTasks
	print "Loaded Tasks: "; ABmt_TasksLoaded

	gosub ABmt_TaskInit_Globals
	ABmt_TaskCount = _ABmt_TaskCount
	ABmt_TaskEntryAddress(0) = addressof ABmt_Task_0
	dim task_idx as integer
	task_idx = 1
	while task_idx <= ABmt_TaskCount
		select task_idx
			case 1
				ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_1
			case 2
				ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_2
			' case 3
				' ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_3
			' case 4
				' ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_4
			' case 5
				' ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_5
			' case 1
				' ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_1
			' case 1
				' ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_1
			' case 1
				' ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_1
			' case 1
				' ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_1
			' case 1
				' ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_1
			endselect
		task_idx += 1
	loop

endsub

main:		' ABmt_Task_0
	dim task_idx, i as integer
	ABmt_TaskInit
	
	i = 0
	while i<=5
		task_idx = 1
		while task_idx <= ABmt_TaskCount
			print task_idx, ABmt_TaskEntryAddress(task_idx)
			call (ABmt_TaskEntryAddress(task_idx))
			task_idx += 1
			wait(250)
		loop
		i += 1
		print
	loop
	print "Restarting @: ";ABmt_TaskEntryAddress(0)
	call (ABmt_TaskEntryAddress(0))
	
end
