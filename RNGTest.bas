' #define ABE_Generic				' Generic #defs to ease programming
' #define ABE_Bitwise				' Bitwise Operations
' #define ABE_FloatHelpers			' Floating Point Helping routines - to include NAN testing and such
#define ABE_RNG					' Random Number Generator - 16 bit integer and floating point 0-1, and min,max
' #define ABE_SortHelpers			' helper code to facilitate sorting
' #define ABE_ASCStuffs				' Silly code with several instances of ASC therein
' #define ABE_DDR					' Data Direction Port save-restore - deprecated until built up for multiple targets, esp w/ > 32 GPIO pins...
' #define ABE_Conversion			' A robust lib of helpers for converting across different formats (i2b, i2h, a2i, etc.)
' #define ABE_UserInput				' Subs/Functions for facilitating user input into the BT console
' #define ABE_Suspend				' Subs/Functions for halting program execution
' #define ABE_Debug					' to enable programmatic debug support - need to expand for proper debugger use and multiple devices - #define enabledebug 1 to use
' #define ABE_TargetRegHelpers		' helper code to facilitate register exploration and manipulation - need to add masks and nibble/word/etc. support
#include "__lib\AB_Extensions.lib"

dim i,j,k,l as integer

main:

for i = 1 to 1000
print i, RAND_BIT_WIDTH(timer, 16)
next i

print
print

for i = 1 to 1000
print i, RAND_BIT_WIDTH(timer, 31)
next i

print
print

for i = 0 to 1000
	j=0
	for k = 0 to 30
		j <<= 1
		j or= (if(rand<0.5,0,1))
	next k
	print i,j
next i

end
