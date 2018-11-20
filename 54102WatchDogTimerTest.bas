#define CORE_M4
#include "LPC54102.bas"

// ABE #Include Prototype
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
#include "__lib\AB_Extensions.lib"	' also loads "__lib\ARMbasicTargetVitals.lib"

sub _WDT_Feed()
	WD_WDFEED = 0xAA
	WD_WDFEED = 0x55
	print "WDT fed."
	print	
	endsub

sub _WDT_Init()

	// The Watchdog clock (WDCLK) source is the fixed 500 kHz clock (+/- 40%) provided by the low-power watchdog oscillator.
	
	print "SCB_PDRUNCFG - 0x";i2h(SCB_PDRUNCFG)," (looking @ b20 - set?)"
	print i2b8(SCB_PDRUNCFG)
	print	
	
	SCB_PDRUNCFGCLR or= (1<<20) ' power up the WDT Osc - b20 PDEN_WDT_OSC Watchdog oscillator. 0 = Powered; 1 = Powered down. resets to 1
	
	print "SCB_PDRUNCFG - 0x";i2h(SCB_PDRUNCFG)," (looking @ b20 - now cleared?)"
	print i2b8(SCB_PDRUNCFG)
	print "================================================================================"
	
	print "SCB_AHBCLKCTRL0 - 0x";i2h(SCB_AHBCLKCTRL(0))," (looking @ b22 - cleared?)"
	print i2b8(SCB_AHBCLKCTRL(0))
	print	
	
	SCB_AHBCLKCTRL(0) or= SYSCON_CLOCK_WWDT
	
	print "SCB_AHBCLKCTRL0 - 0x";i2h(SCB_AHBCLKCTRL(0))," (looking @ b22 - now set?)"
	print i2b8(SCB_AHBCLKCTRL(0))
	print "================================================================================"
	
	// from the 54102 UM - Section 17:
	// The Watchdog should be used in the following manner:
	// • Set the Watchdog timer constant reload value in the TC register.

	print "WD_WDTC - 0x";i2h(WD_WDTC)," (defaulted to 0xFF?)"
	print i2b8(WD_WDTC)
	print	
	
	WD_WDTC = 0x00098968	'Twdclk * 625000 * 4 = Twdclk * 2500000 = 5 sec (I think... :)
	
	print "WD_WDTC - 0x";i2h(WD_WDTC)," (some larger timer countdown value?)"
	print i2b8(WD_WDTC)
	print "================================================================================"


	// • Set the Watchdog timer operating mode in the MOD register.
	WD_WDMOD or= 0x00000003	' enables WDT (once fed) and config to force a reset if it starves (b0 & b1) 
	// • Set a value for the watchdog window time in the WINDOW register if windowed operation is desired.
	' n/a
	// • Set a value for the watchdog warning interrupt in the WARNINT register if a warning interrupt is desired.
	' n/a
	
	print
	print "WDT init'd - going to feed now..."
	print

	// • Enable the Watchdog by writing 0xAA followed by 0x55 to the FEED register.
	_WDT_Feed
	// • The Watchdog must be fed again before the Watchdog counter reaches zero in order to prevent a watchdog event.
	// • If a window value is programmed, the feed must also occur after the watchdog counter passes that value.
	endsub

main:

	print chr(0xC);	' clears the BT TCLTerm Console
	print "ARMbasic Watch Dog Timer Test Tool on ";_tgtnm
	print _tgtspecs
	print "################################################################################"

	print
	print _uinput("'Stop' here if issues, else press Enter to continue> ")
	
	_WDT_Init

	do

		print "WDMOD - 0x";i2h(WD_WDMOD)
		print i2b8(WD_WDMOD)
		print
		print "WDTC - 0x";i2h(WD_WDTC)
'		print i2b8(WD_WDTC)
		print
		print "WDTV       - 0x";i2h(WD_WDTV)
'		print i2b8(WD_WDTV)
		waitmicro(400)
		print "WDTV+400uS - 0x";i2h(WD_WDTV)," ~20 counts less.?."
'		print i2b8(WD_WDTV)
		print
		print _uinput("You've <5 seconds to press enter to (re-)feed the watch dog, else it'll starve (resetting the device...)> ")
		print
		_WDT_Feed
		print
	loop

end
