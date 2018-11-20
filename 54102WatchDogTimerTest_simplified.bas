#define CORE_M4
#include "LPC54102.bas"

main:
	dim userinput as integer
	
	print "Recovery:  'Stop' here if you need to recover device, else Enter to test WDT> "
	debugin userinput

	SCB_PDRUNCFGCLR or= (1<<20) ' power up the WDT Osc - b20 PDEN_WDT_OSC Watchdog oscillator. 
								' 0 = Powered; 1 = Powered down; Resets to 1;  Write a 1 to the 'clear' register to clear it.
	SCB_AHBCLKCTRL(0) or= SYSCON_CLOCK_WWDT ' enable the WDT clock to run from the WDT Osc.
	WD_WDTC = 0x00098968	'Twdclk * 625000 * 4 = Twdclk * 2500000 = 5 sec (500KHz clock)
	WD_WDMOD or= 0x00000003	' enables WDT (once fed) & reset if it starves (b0 & b1) 
	WD_WDFEED = 0xAA	' WDT init'd - feeding now to start it up...
	WD_WDFEED = 0x55
	print "WDT fed."
	
	do ' enter a 0 in the console to feed else the device should reset when WDT expires.
		print "WDT Count Down Register Value: ";WD_WDTV
		print "You've <5 seconds before reset - 0 refeeds, 1 displays WDTV> "
		debugin userinput
		if userinput = 1 ' display timer count register
			print "WDT Count Down Register Value: ";WD_WDTV
			print
		else 'feed the dog
			WD_WDFEED = 0xAA
			WD_WDFEED = 0x55
			print "WDT fed"
			print
		endif
	loop
end
