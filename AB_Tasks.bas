#define enabledebug 0

' #define ABE_Generic				' Generic #defs to ease programming
' #define ABE_Bitwise				' Bitwise Operations
' #define ABE_FloatHelpers			' Floating Point Helping routines - to include NAN testing and such
' #define ABE_RNG					' Random Number Generator - 16 bit integer and floating point 0-1, and min,max
' #define ABE_SortHelpers			' helper code to facilitate sorting
' #define ABE_ASCStuffs				' Silly code with several instances of ASC therein
' #define ABE_DDR					' Data Direction Port save-restore - deprecated until built up for multiple targets, esp w/ > 32 GPIO pins...
' #define ABE_Conversion			' A robust lib of helpers for converting across different formats (i2b, i2h, a2i, etc.)
' #define ABE_UserInput				' Subs/Functions for facilitating user input into the BT console
' #define ABE_Suspend				' Subs/Functions for halting program execution
 #define ABE_Debug					' to enable programmatic debug support - need to expand for proper debugger use and multiple devices - #define enabledebug 1 to use
' #define ABE_TargetRegHelpers		' helper code to facilitate register exploration and manipulation - need to add masks and nibble/word/etc. support
#include "__lib\AB_Extensions.lib"


#define _task_tick_shift_us 	7		'us task_tick resolution (>>7 = 128us task tick resolution)
#define _task_count		4

'task states
#define _task_notstarted 0
#define _task_idle	1
#define _task_active 2
#define _task_paused 3

' #define task_state_verbose(1)	"Not Started"
' #define task_state_verbose(2)	"Idle"
' #define task_state_verbose(3)	"Active"
' #define task_state_verbose(4)	"Paused"

dim i,j,x,y,z,a,b,c,start,task_tick_start,task_ticker as integer
dim task_tick(_task_count),last_task_tick(_task_count),next_task_tick(_task_count), task_state(_task_count) as integer

' # of task_ticks before initial task starts
const task_stall = {
  0,					' root task(0)
  5,
  10,
  15,
  20
  }

' # of task_ticks between task starts
const task_time = {
	1,					' root task(0)
	25,
	50,
	75,
	100
	}
	
'CONST task_state_verbose AS BYTE = { value [, valuelist] }

sub task_timer_init
	for i = 0 to _task_count
		last_task_tick(i)=0
		if i = 0
			next_task_tick(i) = 1
		else
			next_task_tick(i)= task_stall(i)
		endif
	task_state(i) = _task_notstarted
debug(Print)
debug(Print "Task ";i;" TskPeriod: ","",task_time(i))
debug(Print "Task ";i;" StallTime: ","",task_stall(i))
debug(Print "Task ";i;" LastStart: ","",last_task_tick(i))
debug(Print "Task ";i;" Init  Run: ","",next_task_tick(i))
debug(Print "Task ";i;" TaskState: ","",task_state(i);" - ";)
debug(SELECT task_state(i))
debug(CASE 0)
debug(        PRINT "Not Started")
debug(CASE 1)
debug(        PRINT "Idle")
debug(CASE 2)
debug(        PRINT "Active")
debug(CASE 3)
debug(        PRINT "Paused")
debug(CASE ELSE)
debug(        PRINT "Danger Will Robinson...")
debug(ENDSELECT)
	next i
debug(Print)
	endsub





function task1() as integer
	task_state(1) = _task_active
	print 1,
	task_state(1) = _task_idle
	return (timer-start)>>_task_tick_shift_us
	endfunction
	
function task2() as integer
	task_state(2) = _task_active
	print 2,
	task_state(2) = _task_idle
	return (timer-start)>>_task_tick_shift_us
	endfunction
	
function task3() as integer
	task_state(3) = _task_active
	print 3,
	task_state(3) = _task_idle
	return (timer-start)>>_task_tick_shift_us
	endfunction
	
function task4() as integer
	task_state(4) = _task_active
	print 4,
	task_state(4) = _task_idle
	return (timer-start)>>_task_tick_shift_us
	endfunction


function runtask(task_num as integer) as integer
	dim i as integer
debug(Print "Running Task ";task_num)
	select task_num
	case 1
		i=task1()
	case 2
		i=task2()
	case 3
		i=task3()
	case 4
		i=task4()
	endselect
	Print i
	return i
	endfunction


function task0(task_ticker) as integer
	dim i as integer
debug(	print "Task Tick: ";task_ticker)
	for i = 1 to _task_count
	
		SELECT task_state(i)
		CASE 0
debug(				PRINT "Task ";i;" is Not Started",)
				if next_task_tick(i) > task_ticker
debug(				PRINT "... Starting at Tick ";next_task_tick(i))
				else
debug(				PRINT "... Starting Now ";task_ticker)
					next_task_tick(i)=task_ticker + task_time(i)
					last_task_tick(i)=runtask(i)
				endif
		CASE 1
debug(				PRINT "Task ";i;" is Idle",)
				if next_task_tick(i) > task_ticker
debug(				PRINT "... Starting at Tick ";next_task_tick(i))
				else
debug(				PRINT "... Starting Now ";task_ticker)
					next_task_tick(i)=task_ticker + task_time(i)
					last_task_tick(i)=runtask(i)
				endif
					
		CASE 2
debug(				PRINT "Task ";i;" is Active",)
				if next_task_tick(i) > task_ticker
debug(				PRINT "... Started at Tick ";last_task_tick(i))
				else
					next_task_tick(i) =  task_ticker + 1
debug(				PRINT "... Stalling until Tick ";next_task_tick(i))
				endif
		CASE 3
debug(				PRINT "Task ";i;" is Paused",)
				if next_task_tick(i) > task_ticker
debug(				PRINT "... Started at Tick ";last_task_tick(i))
				else
					next_task_tick(i) =  task_ticker + 1
debug(				PRINT "... Stalling until Tick ";next_task_tick(i))
				endif
		CASE ELSE
debug(				PRINT "Danger Will Robinson...")
		ENDSELECT

	next i

	return timer>>_task_tick_shift_us
	endfunction




main:
	timer = 0
	start = 0
	task_ticker = 0
	task_timer_init
	task_tick_start = timer>>_task_tick_shift_us
	
debug(Print "tgtid: ","",_tgtid)
debug(Print "tgtnm: ","",_tgtnm)
debug(Print "tgtspc: ","",_tgtspecs)
debug(Print "tgtmem: ","",_tgtmem)
debug(Print)
debug(Print "Start uS: ","",start)
debug(Print "Task Count: ","",_task_count)
debug(Print "TmrBitSft: ","",_task_tick_shift_us)
debug(Print "Task Tick: ","",task_tick_start)
debug(Print)
	
production(Print "Start tgtid: ","",_tgtid)
production(Print "Start tgtnm: ","",_tgtnm)
production(Print "Start tgtspc: ","",_tgtspecs)
production(Print "Start tgtmem: ","",_tgtmem)
production(Print)
production(Print "Start uS: ","",start)
production(Print "Task Count: ","",_task_count)
production(Print "TmrBitSft: ","",_task_tick_shift_us)
production(Print "Task Tick: ","",task_tick_start)
production(Print)

	timer = 0
	
	do
		task0(timer>>_task_tick_shift_us)
debug(Print)
	loop

	
	
	end
	
