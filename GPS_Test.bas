#define GPS_Test
'#define ENABLE_GPS_DEBUG 1
' #define enabledebug 1
#define scopedebug 1

#define ABE_Generic				' Generic #defs to ease programming
#define ABE_Bitwise				' Bitwise Operations
'#define ABE_FloatHelpers			' Floating Point Helping routines - to include NAN testing and such
'#define ABE_RNG					' Random Number Generator - 16 bit integer and floating point 0-1, and min,max
'#define ABE_SortHelpers			' Sorting
'#define ABE_ASCStuffs				' Silly code with several instances of ASC therein
'#define ABE_DDR					' Data Direction Port save-restore - deprecated until built up for multiple targets, esp w/ > 32 GPIO pins...
#define ABE_Conversion			' A robust lib of helpers for converting across different formats (i2b, i2h, a2i, etc.)
'#define ABE_UserInput				' Subs/Functions for facilitating user input into the BT console
'#define ABE_Suspend				' Subs/Functions for halting program execution
#define ABE_Debug					' to enable programmatic debug support - need to expand for proper debugger use and multiple devices
'#define ABE_TargetRegHelpers		' helper code to facilitate register exploration and manipulation - need to add masks and nibble/word/etc. support
#include "__lib\AB_Extensions.lib"

' #include <RTC.bas>   

#define GPS_SER_RX_PT_BAUD				38400 ' SET THIS TO THE BUAD RATE THAT THE GPS RX IS PROGRAMMED TO XMIT AT
#include "GPS\GPS_ser.lib"
'#include "spk\spk_support.lib"

' -----------------------------------------------------------------------------------------------------------------------------
MAIN:

' Print "stopping - press resume to run"
' stop


GPS_DEBUG(PRINT "STARTING")
	
	DIM UNUSEDVAR AS INTEGER
	DIM MAINLOOPCNT AS INTEGER
	DIM MAINLOOPRATE AS INTEGER

	MAINLOOPCNT = 0
	
	HOUR=0
	MINUTE=0
	SECOND=0

	' bleep
	' bloop
	' bleep
	' bloop
	' bleep
	' bloop
	' bleep
	' bloop
	' bleep
	
	
	GPS_RXInitSerial
GPS_DEBUG(PRINT "GPS INIT'D")

' unusedvar = GPS_RXAutoBaud
' Print "GPS AutoBaud Done: ";unusedvar;" baud"
	' output(GPS_LOOP_ACTIVITY_LED_PORT)

		' PRINT "PRESS ENTER TO BEGIN ENDLESS LOOP OF QUERY GPS, PARSE THE SENTENCES, AND PRINT THE RESULTS:"
		' DEBUGIN UNUSEDVAR

debug(Print "Starting Loop at: ";timer;" uS")
	
	DO
		''''blip
		MAINLOOPCNT = MAINLOOPCNT +1
		MAINLOOPRATE = MAINLOOPCNT/(SECOND(-1)+(MINUTE(-1)*60)+(HOUR(-1)*3600))
	OUT(GPS_LOOP_ACTIVITY_LED_PORT) = (MAINLOOPCNT AND 1)

		IF GPS_QUERY_RCVR THEN
			IF GPS_PARSE_MESSAGES THEN
			'''GPS_PRODUCTION(CLS)
				GPS_PRODUCTION(PRINT)
				GPS_PRODUCTION(PRINT)
				GPS_PRODUCTION(PRINT)
				PRINT_GPS_DATA
				PRINT "LOOP RATE: ";MAINLOOPRATE," @ "; GPS_SER_RX_PT_BAUD;" bps (baud)"
				GPS_DEBUG(ELSE)
				GPS_DEBUG(PRINT "NEGATIVE PARSE")
			ENDIF
		GPS_DEBUG(ELSE)
		GPS_DEBUG(PRINT "NEGATIVE QUERY")
		ENDIF
	LOOP

END
'-----------------------------------------------------------------------------------------------------------------------------


