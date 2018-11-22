' 
' ========================================================================================
'
'	ABmt Multi-Threaded ARMbasic Scheduler
'
'
'	'  Revision History
'
'v 0.01		21Nov18	Initial Release
'	•	ample comments/diatribe and code will eventually be descriptive of implementation
'
' TODO/FIXME: 	
' 	-	have a ABmt_SchedulerConfig #include and move stuff to there to ease app use
' 	-	have a ABmt_TaskConfig #inc to ease use/user config
'		have #incs therein for the actual task code
'		have task timing stuffs therein
'		eventually have other task related stuffs therein (heap size, priorities, etc.)
'	-	need to count included tasks automagically - might need filepp's math to do so.?. 
'		for now, it is declared
'	-	lots of other stuff... :)
'
' ========================================================================================
#define ABmt_SchedulerVersion	"0.01"
#define ABmt_SchedulerCompile

#pragma filepp SetWordBoundaries 1
' #define ABmt_TasksLoaded 0
#pragma filepp SetBlankSupp 0
#pragma filepp SetWordBoundaries 0
' #define ABmt_TasksLoaded 0
#undef ABmt_NewTask
#include "ABmt_Tasks\54102Blinky.bas"
#include "ABmt_Tasks\54102Printy.bas"
#pragma filepp SetWordBoundaries 1
#undef main:
#undef end

// ABE #Include Prototype
' #define ABE_Generic				' Generic #defs to ease programming
' #define ABE_Bitwise				' Bitwise Operations
' #define ABE_FloatHelpers			' Floating Point Helping routines - to include NAN testing and such
' #define ABE_RNG					' Random Number Generator - xbit integer, floating point 0-1, bounded (min/max), etc.
' #define ABE_SortHelpers			' helper code to facilitate sorting
' #define ABE_ASCStuffs				' Silly code with several instances of ASC therein
' #define ABE_DDR					' Data Direction Port save-restore - deprecated until built up for multiple targets, esp w/ > 32 GPIO pins...
' #define ABE_Suspend				' Subs/Functions for halting program execution
' #define enabledebug 1				' This is needed for the ABE_Debug stuffs - 0 disables debug() wrapped code & enables production() wrapped code - vice versa
' #define ABE_Debug					' to enable programmatic debug support - need to expand for proper debugger use and multiple devices - #define enabledebug 1 to use
' #define ABE_TargetRegHelpers		' helper code to facilitate register exploration and manipulation - need to add masks and nibble/word/etc. support
' #define ABE_StringStuffs			' helper code to facilitate enhanced string functionality
#define ABE_Conversion			' A robust lib of helpers for converting across different formats (i2b, i2h, a2i, etc.)
#define ABE_UserInput				' Subs/Functions for facilitating user input into the BT console

#ifdef __CORIDIUM__	' danger will robinson, BT's BPP doesn't support non-boundary (intra-token) macro expansion
	#error ABmt is written to be used with the FilePP Preprocessor, to facilitate more robust compile-time functionality than what BT`s BPP can offer
#else	' with FilePP, intra-token macro expansion works, but path resolution behavior is different than BT's BPP
	#include "..\__lib\AB_Extensions.lib"
#endif

' need to count included tasks automagically
' might need filepp's math to do so.?.
' for now, it is declared
#define _ABmt_TaskCount 2

' move these to a ABmt_SchedulerConfig #include
' for now, just declare
#define _ABmt_MaxTasks	16

#define _ABmt_TaskID 0
#define _ABmt_TaskName ABmt_Scheduler

ABmt_Task_0:		'~~ // This is so that the scheduler's entry point is known
	goto main		'~

ABmt_TaskRestart:	'~~ // This is task restart token
	goto main1		'~
	
sub ABmt_ResetTimer()	
	timer = 0
	endsub

ABmt_TaskInit_Globals:	'~~
	dim ABmt_TaskCount as integer
	dim ABmt_TaskEntryAddress(_ABmt_MaxTasks) as integer
return	'~

sub ABmt_TaskInit()
	dim task_idx as integer
	print chr(0xC);	' clears the BT TCLTerm Console
	print "ABmt: Multi-Threaded ARMbasic Scheduler v";ABmt_SchedulerVersion;" on ";_tgtnm
	print _tgtspecs
	print "================================================================================"
	print
	gosub ABmt_TaskInit_Globals
'	print "Loading Tasks: "; ABmt_LoadedTasks
	ABmt_TaskCount = _ABmt_TaskCount
	task_idx = 0
	ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_0
	print "ABmt_SchedulerReset, Task ";task_idx," Indexed @ 0x";i2h(ABmt_TaskEntryAddress(0))," T: ";timer
	print "ABmt_TaskRestart Indexed @ 0x";i2h((addressof ABmt_TaskRestart))," T: ";timer
	' print "Task ";task_idx," Indexed @ 0x";i2h(ABmt_TaskEntryAddress(task_idx))," T: ";timer
	print "Index'g User Tasks: "; _ABmt_TaskCount," T: ";timer
	task_idx = 1
	while task_idx <= ABmt_TaskCount
	
	' using case is needed as getting addressof from a string variable is not supported in AB.
	' if it were, one could simply instantiate an array via looped lookups at runtime
	' there may be means to an end, but focusing elsewhere atm...
	' add #ifDef logic here to scale the case to actual tasks loaded...
	
		select task_idx
			case 0
				' already indexed above
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
		print "Task ";task_idx," Indexed @ 0x";i2h(ABmt_TaskEntryAddress(task_idx))," T: ";timer
		task_idx += 1
	loop
	
	print "User Tasks Indexed: "; ABmt_TaskCount," T: ";timer

endsub

main:		' ABmt_Task_0
	print _uinput("Paused - press enter to continue> ") ' so the programmer can look at BT compile emissions...
	timer = 0		// this was causing a code hang, dunno why, did't chase it & it is now working...
'	ABmt_ResetTimer	// this was a workaround for the code hang that was being caused by the timer = 0 construct
	dim task_idx, i as integer
	ABmt_TaskInit
main1:
	print "--------------------------"
	i = 1
	while i<=3
		task_idx = 1
		while task_idx <= ABmt_TaskCount
			print "Task ";task_idx," @ 0x";i2h(ABmt_TaskEntryAddress(task_idx))," T: ";timer
			call (ABmt_TaskEntryAddress(task_idx))
			task_idx += 1
			wait(250)
		loop
		i += 1
		print "--------------------------"
	loop
	
	// commented this out to preserve initial run console emissions
	' print "Restarting Task Scheduler @: 0x";i2h(ABmt_TaskEntryAddress(0))," T: ";timer
	' call (ABmt_TaskEntryAddress(0))
	
	' the dbl parens is a bug/feature workaround - forces the expression resolution during compilation...
	print "Restarting Tasks @: 0x";i2h((addressof ABmt_TaskRestart))," T: ";timer
	goto ABmt_TaskRestart
	
end
