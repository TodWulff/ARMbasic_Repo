#define CORE_M4
#include "LPC54102.bas"

// ABE #Include Prototype
' #define ABE_Generic				' Generic #defs to ease programming
' #define ABE_Bitwise				' Bitwise Operations
' #define ABE_FloatHelpers			' Floating Point Helping routines - to include NAN testing and such
' #define ABE_RNG					' Random Number Generator - xbit integer, floating point 0-1, bounded (min/max), etc.
' #define ABE_SortHelpers			' helper code to facilitate sorting
' #define ABE_ASCStuffs				' Silly code with several instances of ASC therein
' #define ABE_DDR					' Data Direction Port save-restore - deprecated until built up for multiple targets, esp w/ > 32 GPIO pins...
' #define ABE_Conversion			' A robust lib of helpers for converting across different formats (i2b, i2h, a2i, etc.)
' #define ABE_UserInput				' Subs/Functions for facilitating user input into the BT console
' #define ABE_Suspend				' Subs/Functions for halting program execution
#define enabledebug 1				' This is needed for the ABE_Debug stuffs - 0 disables debug() wrapped code & enables production() wrapped code - vice versa
#define ABE_Debug					' to enable programmatic debug support - need to expand for proper debugger use and multiple devices - #define enabledebug 1 to use
' #define ABE_TargetRegHelpers		' helper code to facilitate register exploration and manipulation - need to add masks and nibble/word/etc. support
' #define ABE_StringStuffs			' helper code to facilitate enhanced string functionality
#include "__lib\AB_Extensions.lib"	' also loads "__lib\ARMbasicTargetVitals.lib"

'#define GPIO_BASE_ADDR		&H1C000000
'#define break		' __ASM__($BE00)					' BKPT 

MAIN:

#define dbugout				32

output(dbugout)

' // this results in a 2.296MHz, 435nS period square wave - https://i.imgur.com/qxZ6xJD.png
'	do
'	out(dbugout)=0
'	out(dbugout)=1
'	loop

' // this results in a 6.889MHz, 145nS period square wave - https://i.imgur.com/Rb855LJ.png
'	do
'	GPIO1NOT = 0x00000001
'	loop

' // Tried ASM just to see just how fast the hardware can go...
' // this results in a ~16MHz, ~62.5nS period square wave - https://i.imgur.com/LY2qv49.png

	dim i as integer
'	#define GPIO1NOT        *(GPIO_BASE_ADDR + &H2304)	// this define is mia from the coridium chip library
	#define GPIO1NOT        (GPIO_BASE_ADDR + &H2304)	// this define is mia from the coridium chip library
	
	i = GPIO1NOT			//  puts GPIO1NOT in R7  (equiv to __ASM__(0x4F02)	'	LDR	R7, =0X1C002304)
	__ASM__(0x683A)			//	LDR	R2, [R7]  reads in the GPIO1NOT register value for knotting purposes
	__ASM__(0x0201F042)		//	ORR	R2, #0X00000001	@ SET B0 // makes R2 a 1 (as GPIO1NOT reads as all 0s)
	do
	__ASM__(0x603A)			//	STR	R2, [R7] // Trigger a GPIO1 NOT'g
	loop
	// __ASM__(0x1C002304)		'	.end

end

