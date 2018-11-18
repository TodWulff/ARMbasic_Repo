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
' #define enabledebug 1
' #define ABE_Debug					' to enable programmatic debug support - need to expand for proper debugger use and multiple devices - #define enabledebug 1 to use
' #define ABE_TargetRegHelpers		' helper code to facilitate register exploration and manipulation - need to add masks and nibble/word/etc. support
#define ABE_StringStuffs			' helper code to facilitate enhanced string functionality
#include "__lib\AB_Extensions.lib"


defglobals:	' these are the global variables
	dim task_state_verbose_ptr (4) as integer
	return

sub init()	' init the array of strings - hokey shites here, but it works as a poc
	gosub defglobals

	dim task_state_verbose1(16) as string
	dim task_state_verbose2(16) as string
	dim task_state_verbose3(16) as string
	dim task_state_verbose4(16) as string

	task_state_verbose1	= "Not Started"
	task_state_verbose2	= "Idle"
	task_state_verbose3	= "Active"
	task_state_verbose4	= "Paused"
	
	task_state_verbose_ptr(1) = addressof task_state_verbose1
	task_state_verbose_ptr(2) = addressof task_state_verbose2
	task_state_verbose_ptr(3) = addressof task_state_verbose3
	task_state_verbose_ptr(4) = addressof task_state_verbose4
	endsub
		 
main:

	dim i as integer

	init()
	
	for i = 1 to 4
	print i,StringViaPointer(task_state_verbose_ptr(i))
	next i

end
