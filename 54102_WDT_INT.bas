' initial run last for ~6-10 seconds, wdt will starve, firing the isr & then the handler w/ a console emission 
' second and subsequent periods should be ~3-5s between interrupts/console emissions

#define CORE_M4						' needed for this dual core device, & given we're working with the NVIC on the M4
#include "LPC54102.bas"				' needed for the header #defs 

_WDT_InitGlobals:
	dim WDT_INT_Flag as integer		' this is a wwdt user flag
	return
	
interrupt sub _WDT_INT_ISR			' this isr only sets a flag, clears the interrupt and exits - a handler will perform outside of an interrupt context
	WDT_INT_Flag = 1				' assert the user flag during the ISR
	WD_WDMOD and= 0xFFFFFFFB		' clear the wwdt interrupt in the wwdt mode register ("software cleared...")
	endsub
	
sub _WDT_INT_Handler				' this is the handler to do more stuff at time of interrupt, outside the isr
	print "Interrupt Fired:", timer
	
	WDT_INT_Flag = 0				' clear the user flag
	
	WD_WDTC = 0x00098968			' ~3-5 secs wwdt timer constant
	WD_WDMOD = 0x00000001			' clears int bit(b2=0) and enables wwdt (once fed) & config to force an interrupt if it starves (b1=0=Int & b0=1=Enabled) 
	
	WD_WDFEED = 0xAA				' feed the wdt
	WD_WDFEED = 0x55

	endsub
	
main:
	print "Started @ Timer:", timer
	
	call _WDT_InitGlobals
	WDT_INT_Flag = 0				' deassert the wwdt user flag

	SCB_PDRUNCFGCLR or= (1<<20) 			' power up the wwdt osc
	SCB_AHBCLKCTRL(0) or= SYSCON_CLOCK_WWDT	' enable the wwdt clk
	WD_WDTC = 0x001312D0 					' ~6-10 secs wwdt timer constant for initial interrupt
	WD_WDMOD = 0x00000001					' clears int bit(b2=0) and enables wwdt (once fed) & config to force an interrupt if it starves (b1=0=Int & b0=1=Enabled) 

	' default wwdt int priority is fine - so noeff widit
	WWDT_IRQn = (addressof _WDT_INT_ISR) or 1	' assign the isr sub addy to the NVIC vector table for wwdt_irq  (the 'or 1' is for thumb code purposes)
	VICIntEnable0 or= 0x00000001				' enable the wwdt interrupt

	WD_WDFEED = 0xAA						' feed the wdt to start it
	WD_WDFEED = 0x55

	do
		if WDT_INT_Flag then _WDT_INT_Handler
	loop
	
end
