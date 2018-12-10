' ========================================================================================
'
'	ABmt (Multi-Threaded ARMbasic): Scheduler
'
'
'	'  Revision History
'
'v 0.02		24Nov18	Initial Release
'	•	ample comments/diatribe and code will eventually be descriptive of implementation
'v 0.01		21Nov18	Initial Release
'	•	ample comments/diatribe and code will eventually be descriptive of implementation
'
' TODO/FIXME: 
' 	-	incorporate task context switching  <-- highest priority, I perceive
'	-	at startup, poll to see if this start is due to a WDT reset
'		 -	if so, decide whether to continue running, switch to a fail-safe state, and/or display an
'			error message. At the very least,  count such events, so that a persistently errant
'			application won`t be restarted indefinitely. A reasonable approach might be to shut the 
'			system down if x watchdog resets occur in given period.
'	-	Consider some runtime sanity checking prior to feeding the dog.  Stack depth, number of buffers
'		allocated, or the status of some peripheral or component may be checked before deciding 
'		to feed the dog. Doing so will increase the family of errors that the watchdog will detect.	
'	-	Consider an approach is to clear a set of flags (i.e. int bits) before each loop is started.
'		for example - use x flags to check that certain points within the main loop have been visited
'		Each flag is set at a certain point in the loop. At the bottom of the loop the dog is fed, but
'		first the flags are checked to see that all of the important points in the loop have been visited.
'	-	Consider creating a default task prototype that can be used to code up new tasks easily
'	-	Consider an idle 'helper' task to set a wakeup timer and then sleep/low power/...
'	-	Continue to mull on priority inheritence - might be useful for interatively ran 'helper' tasks that are activated by other tasks
'	-	Consider creating a task structure with stuffs in RAM as an array for each instantiated task
'		- ID, Priority, State
'			- TaskID is a 12-bit construct (1-4095)  (too big?)
'			- TaskPriority is an 8 bit construct 0 to 255 - 0 is lowest (IDLE) and 255 is the highest (scheduler task)
'			- TaskState is a 4 bit construct - Ready|Running|Waiting|Blocked|Suspended|Dormant|Killed
'				https://www.tron.org/wp-content/themes/dp-magjam/pdf/t-kernel_2.0/html_en/task_states_and_scheduling_rules.html
'		- name, etc.
'		- consider adding structure elements to deliniate task type (functionality) indicator (peripheral use, int use, ISR, 
'			atomicity vs. multiple instances, root vs. helper/callable, INT masking, peripheral blocking (mutex/sema use), etc.)
'		- consider adding structure elements to deliniate task int callback - might not have any ROI.?.
'			- no INT callback
'			- 'pre' INT callback - grab current VIC Addy, store it, replace it with the task pointer, then call the 
'				orig ISR after the task ISR runs - the ISR exit should restore to pre-ISR code execution.
'			- 'post' INT callback - grab current pop state from the stack, store it, replace it with the task pointer,
'				then when the orig ISR pops, execution should go to the 'post' task ISR code, execute and then replace
'				the stored context and then pop it, to return to pre-ISR code execution
'	-	revisit my required use of filepp as it is not portable for other users
'		- see if BPP can do math somehow
'		- see if BPP can be forced to expand macros w/o word-boundaries
'		- right now, main: is automagically altered in a .tas source during preprocessing to become a sequenced sub
'			name, by way of the TaskWrapper and FilePP
'			- 'main:' is changed via [#define main:	sub ABmt_Task_ABmt_TaskID]
'			- and then, the ABmt_TaskID portion is then macro-expanded to the TaskID literal value
'			- 'end' is changed via [#define end		endsub]
'			- BPP can't replace main:, only main - the colon effs with BPP
'			- BPP can't do non-word boundary mancro expansions - i.e. foo macro bar  vs. foo_macro_bar - BPP expands 
'				the former, but cant do so on the latter, I perceive (based on testing)
'			- Automation of these items is the primary reason for using FilePP vs. BPP
'			- Being lazy (tool chain automation/work-flow improvers) might not be justification enough to keep folks from using this,
'				or forcing them to changing their setup.  This may have major implications for non windows types...
'	-	Use preprocessor directives to expand this to handle both the 824 and 54102 (54102 only, currently), and other devices eventually...
'	-	lots of other stuff... :)
'
' ========================================================================================
#define ABmt_SchedulerVersion	"0.02"

#define ABmt_SchedulerCompile

#pragma filepp SetWordBoundaries 1

 
'~~ the order of these #incs and #defs are important... 

	#include "ABmt_Config\ABmt_AppConfig.cfg"
	#include "ABmt_Config\ABmt_SchedulerConfig.cfg"
	#include "ABmt_Config\ABmt_TasksConfig.cfg"

	// ABE #Include Prototype
	' #define ABE_Generic				' Generic #defs to ease programming
	' #define ABE_Bitwise				' Bitwise Operations
	' #define ABE_FloatHelpers			' Floating Point Helping routines - to include NAN testing and such
	' #define ABE_RNG					' Random Number Generator - xbit integer, floating point 0-1, bounded (min/max), etc.
	' #define ABE_SortHelpers			' helper code to facilitate sorting
	' #define ABE_ASCStuffs				' Silly code with several instances of ASC therein
	' #define ABE_DDR					' Data Direction Port save-restore - deprecated until built up for multiple targets, esp w/ > 32 GPIO pins...
	' #define ABE_Suspend				' Subs/Functions for halting program execution
	#define enabledebug 1				' This is needed for the ABE_Debug stuffs - 0 disables debug() wrapped code & enables production() wrapped code - vice versa
	#define ABE_Debug					' to enable programmatic debug support - need to expand for proper debugger use and multiple devices - #define enabledebug 1 to use
	' #define ABE_TargetRegHelpers		' helper code to facilitate register exploration and manipulation - need to add masks and nibble/word/etc. support
	' #define ABE_StringStuffs			' helper code to facilitate enhanced string functionality
	#define ABE_Conversion			' A robust lib of helpers for converting across different formats (i2b, i2h, a2i, etc.)
	#define ABE_UserInput				' Subs/Functions for facilitating user input into the BT console

	#ifdef __CORIDIUM__	' danger will robinson, BT's BPP doesn't support non-boundary (intra-token) macro expansion
		#error ABmt is written to be used with the FilePP Preprocessor, to facilitate more robust compile-time functionality than what BT`s BPP can offer
	#else	' with FilePP, intra-token macro expansion works, but path resolution behavior is different than BT's BPP
		#include "..\__lib\AB_Extensions.lib"
	#endif

	#include "ABmt_Lib\ABmt_WDT.lib"
	#include "ABmt_Lib\ABmt_Ticker.lib"
	#include "ABmt_Lib\ABmt_ContextSwitch.lib"		'~


'=============================================
#define _ABmt_TaskID 0
#define _ABmt_TaskName ABmt_Scheduler

ABmt_Task_0:		'~~ // This is so that the scheduler's entry point is known

	goto main		'~

ABmt_TaskRestart:	'~~ // This is task restart token
	goto main1		'~z
	
sub ABmt_ResetTimer()	
	timer = 0
	endsub

ABmt_TaskInit_Globals:	'~~
	dim ABmt_TaskCount as integer
	dim ABmt_TaskEntryAddress(_ABmt_MaxTasks) as integer
return	'~

sub ABmt_TaskInit
	dim task_idx as integer
	print chr(0xC);	' clears the BT TCLTerm Console
	print "ABmt: Multi-Threaded ARMbasic Scheduler v";ABmt_SchedulerVersion;" on ";_tgtnm
	print _tgtspecs
	print "================================================================================"
	print
	gosub ABmt_TaskInit_Globals
	ABmt_TaskCount = _ABmt_TaskCount
	print "Loaded "; ABmt_TaskCount;" Tasks.!."
	
	task_idx = 0
	ABmt_TaskEntryAddress(task_idx) = addressof ABmt_Task_0
	print "ABmt_SchedulerReset, Task ";task_idx," Indexed @ 0x";i2h(ABmt_TaskEntryAddress(0))," T: ";timer
	print "ABmt_TaskRestart Indexed @ 0x";i2h((addressof ABmt_TaskRestart))," T: ";timer
	' print "Task ";task_idx," Indexed @ 0x";i2h(ABmt_TaskEntryAddress(task_idx))," T: ";timer
	print "Index'g User Tasks: "; ABmt_TaskCount," starting @ T: ";timer
	' print "Index'g User Tasks: "; taskcounts," starting @ T: ";timer
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
				ABmt_TaskEntryAddress(task_idx) = addressof ABT_1_MainLoop
			case 2
				ABmt_TaskEntryAddress(task_idx) = addressof ABT_2_MainLoop
			case 3
				ABmt_TaskEntryAddress(task_idx) = addressof ABT_3_MainLoop
			case 4
				ABmt_TaskEntryAddress(task_idx) = addressof ABT_4_MainLoop
			case 5
				ABmt_TaskEntryAddress(task_idx) = addressof ABT_5_MainLoop
			case 6
				ABmt_TaskEntryAddress(task_idx) = addressof ABT_6_MainLoop
		endselect
		print "Task ";task_idx," Indexed @ 0x";i2h(ABmt_TaskEntryAddress(task_idx))," T: ";timer
		task_idx += 1
	loop
	
	print "User Tasks Indexed: "; ABmt_TaskCount," T: ";timer
	
	ABmt_WDT_Init(_ABmt_WDT_TOPeriod_Seconds)
	ABmt_WDT_Start
	print "Configured WDT for timeout in "; _ABmt_WDT_TOPeriod_Seconds;" Seconds and fed/started it."," T: ";timer

	ABmt_Ticker_INT_Config(_ABmt_TaskSwitch_FreqHz)
	ABmt_Ticker_INT_Enable
	print "Configured Task Ticker for "; _ABmt_TaskSwitch_FreqHz;" Hz and started it."," T: ";timer

endsub

main:		' ABmt_Task_0
	print _uinput("Startup:  Paused - press enter to continue> ") ' so the programmer can look at BT compile emissions...
	timer = 0		// this was causing a code hang, dunno why, did't chase it & it is now working...
'	ABmt_ResetTimer	// this was a workaround for the code hang that was being caused by the timer = 0 construct
 	dim task_idx, i as integer
	ABmt_TaskInit
	
	dim test_ptr as integer
	
main1: '~~
	' print "--------------------------"
	' i = 1
	' while i<=3
		' task_idx = 1
		' while task_idx <= ABmt_TaskCount
			' print "Task ";task_idx," @ 0x";i2h(ABmt_TaskEntryAddress(task_idx))," T: ";timer
			' call (ABmt_TaskEntryAddress(task_idx))
			' task_idx += 1
			' wait(250)
		' loop
		' i += 1
		' print "--------------------------"
	' loop
	
	' // commented this out to preserve initial run console emissions
	//print "Restarting Task Scheduler @: 0x";i2h(ABmt_TaskEntryAddress(0))," T: ";timer
	//call (ABmt_TaskEntryAddress(0))
	
	//the dbl parens is a perceived bug/feature workaround - forces the expression resolution during compilation...
	' print "Restarting Tasks @: 0x";i2h((addressof ABmt_TaskRestart))," T: ";timer
	' goto ABmt_TaskRestart
	'~
	do
		if ABmt_Ticker_INT_Flag then ABmt_Ticker_INT_Handler
		if ABmt_WDT_INT_Flag then ABmt_WDT_INT_Handler
		
		' // print MRT_TIMER(0)
		' //print "WDT: ";WD_WDTC,WD_WDTV,WWDT_IRQn
 	

 
	loop
	
end


