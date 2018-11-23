#define CORE_M4
#include "LPC54102.bas"

'~~ // ABE #Include Prototype	
#define ABE_Generic					' Generic #defs to ease programming
' #define ABE_Bitwise				' Bitwise Operations
' #define ABE_FloatHelpers			' Floating Point Helping routines - to include NAN testing and such
' #define ABE_RNG					' Random Number Generator - xbit integer, floating point 0-1, bounded (min/max), etc.
' #define ABE_SortHelpers			' helper code to facilitate sorting
' #define ABE_ASCStuffs				' Silly code with several instances of ASC therein
' #define ABE_DDR					' Data Direction Port save-restore - deprecated until built up for multiple targets, esp w/ > 32 GPIO pins...
#define ABE_Conversion				' A robust lib of helpers for converting across different formats (i2b, i2h, a2i, etc.)
#define ABE_UserInput				' Subs/Functions for facilitating user input into the BT console
' #define ABE_Suspend				' Subs/Functions for halting program execution
' #define enabledebug 1             ' This is needed for the ABE_Debug stuffs - 0 disables debug() wrapped code & enables production() wrapped code - vice versa
' #define ABE_Debug					' to enable programmatic debug support - need to expand for proper debugger use and multiple devices - #define enabledebug 1 to use
' #define ABE_TargetRegHelpers		' helper code to facilitate register exploration and manipulation - need to add masks and nibble/word/etc. support
' #define ABE_StringStuffs			' helper code to facilitate enhanced string functionality
#include "__lib\AB_Extensions.lib"	'~ also loads "__lib\ARMbasicTargetVitals.lib"

#define _WDT_InitTimeout 0x00098968
#define _WDT_PostIntTimeout 0x001312D0

sub _WDT_Feed()
	WD_WDFEED = 0xAA
	WD_WDFEED = 0x55
	print "WDT fed."
	print	
	endsub

_WDT_InitGlobals:
	dim WDT_INT_Flag as integer
	return
	
interrupt sub _WDT_INT_ISR
		WDT_INT_Flag = 1
	endsub

sub _WDT_Init()
	gosub _WDT_InitGlobals
	// The Watchdog clock (WDCLK) source is the fixed 500 kHz clock (+/- 40%) provided by the low-power watchdog oscillator.
	
	print "SCB_PDRUNCFG - 0x";i2h(SCB_PDRUNCFG)," (looking @ b20 - set?)"
	print i2b8(SCB_PDRUNCFG)
	print	
	
	SCB_PDRUNCFGCLR or= (1<<20) ' power up the WDT Osc - b20 PDEN_WDT_OSC Watchdog oscillator. 0 = Powered; 1 = Powered down. resets to 1
	
	print "SCB_PDRUNCFG - 0x";i2h(SCB_PDRUNCFG)," (looking @ b20 - now cleared?)"
	print i2b8(SCB_PDRUNCFG)
	print "====================="
	
	print "SCB_AHBCLKCTRL(0) - 0x";i2h(SCB_AHBCLKCTRL(0))," (looking @ b22 - cleared?)"
	print i2b8(SCB_AHBCLKCTRL(0))
	print	
	
	SCB_AHBCLKCTRL(0) or= SYSCON_CLOCK_WWDT
	
	print "SCB_AHBCLKCTRL(0) - 0x";i2h(SCB_AHBCLKCTRL(0))," (looking @ b22 - now set?)"
	print i2b8(SCB_AHBCLKCTRL(0))
	print "====================="
	
	print "WD_WDTC - 0x";i2h(WD_WDTC)," (defaulted to 0xFF?)"
'	print i2b8(WD_WDTC)
	print	
	
	WD_WDTC = _WDT_InitTimeout	'Twdclk * 625000 * 4 = Twdclk * 2500000 = 5 sec (I think... :)
	
	print "WD_WDTC - 0x";i2h(WD_WDTC)," (now set to 0x00098968)"
'	print i2b8(WD_WDTC)
	print "====================="


	// • Set the Watchdog timer operating mode in the MOD register.
	print "WD_WDMOD - 0x";i2h(WD_WDMOD)," (?)"
'	print i2b8(WD_WDMOD)
	print	
	WD_WDMOD or= 0x00000001	' clears interrupt (b2=0) and enables WDT (once fed) via config to force an interrupt reset if it starves (b1=0=Int & b0=1=Enabled) 
	print "WD_WDMOD - 0x";i2h(WD_WDMOD)," (now set to 0x00000001)"
'	print i2b8(WD_WDMOD)
	print "====================="


	// • Set a value for the watchdog window time in the WINDOW register if windowed operation is desired.
	' n/a
	// • Set a value for the watchdog warning interrupt in the WARNINT register if a warning interrupt is desired.
	' n/a
	
' ok WDT is setup for interrupts,
' now setup the interrupt

//set int vector address
	print "WWDT_IRQn - 0x";i2h(WWDT_IRQn)," (note)"
	print i2b8(WWDT_IRQn)
	print 
	WWDT_IRQn = addressof _WDT_INT_ISR	' required  core_m4 to be #def)
	print "WWDT_IRQn - 0x";i2h(WWDT_IRQn)," (ISR Addy?)"
	print i2b8(WWDT_IRQn)
	print "====================="

' set priority
' default priority is 0 and that is find for this purpose
//VICVectCntl0
	print "VICVectCntl0 - 0x";i2h(VICVectCntl0)," (IPR0 - b7.b5(b4.b0) = IP_WDT)"
	print i2b8(VICVectCntl0)
	print "====================="

' and enable the WDT INT via the VIC
	print "VICIntEnable0 - 0x";i2h(VICIntEnable0)," (note b0)"
	print i2b8(VICIntEnable0)
	print 
	VICIntEnable0 or= 0x00000001
	print "VICIntEnable0 - 0x";i2h(VICIntEnable0)," (b0 set?)"
	print i2b8(VICIntEnable0)
	print "====================="

	print "WDT & INT init'd"
	print _uinput("'Stop' here if issues, else press Enter to continue> ")
	// • Enable the Watchdog by writing 0xAA followed by 0x55 to the FEED register.
	print
	print "going to feed now..."
	_WDT_Feed
	// • The Watchdog must be fed again before the Watchdog counter reaches zero in order to prevent a watchdog event.
	// • If a window value is programmed, the feed must also occur after the watchdog counter passes that value.

	endsub

sub _WDT_INT_Happened
	WDT_INT_Flag = 0
	print "====================="
	print "*** WDT INTERRUPT ***"
	print "====================="
	print
	print "WDMOD - 0x";i2h(WD_WDMOD)," - b03 set?"
	print i2b8(WD_WDMOD)
	print
	WD_WDMOD and= 0xFFFFFFFB		' clear the interrupt flag
	print "WDMOD - 0x";i2h(WD_WDMOD)," - b03 now clear?"
	print i2b8(WD_WDMOD)
	print
	print "====================="
	print "WD_WDTC - 0x";i2h(WD_WDTC)," (currently 0x98968?)"
'	print i2b8(WD_WDTC)
	print
	WD_WDTC = _WDT_PostIntTimeout	'10 Sec
	print "WD_WDTC - 0x";i2h(WD_WDTC)," (now 0x001312D0?)"
'	print i2b8(WD_WDTC)
	_WDT_Feed
	print "====================="
	print "*** END INTERRUPT ***"
	print "====================="
	
	endsub
	
main:
	dim temp as integer
	dim tempstr(250) as string
	print chr(0xC);	' clears the BT TCLTerm Console
	print "ARMbasic Watch Dog Timer Test Tool on ";_tgtnm
	print _tgtspecs
	print "################################################################################"

	print
	print _uinput("'Stop' here if issues, else press Enter to continue> ")
	
	_WDT_Init

	temp = WD_WDTC/125000
	tempstr = "You've " & temp & " seconds to press enter to (re-)feed the watch dog, else it'll starve (resetting the device...)> "
	print _uinput(tempstr)
	print

	do
		if WDT_INT_Flag then _WDT_INT_Happened
	loop

end
