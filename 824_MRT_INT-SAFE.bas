#include "LPC8xx.bas"							' needed for the header #defs 
	
' #define MRT_IRQ_GFLAG				*0x400040F8		' mia from LPC8xx lib
' #define MRT_Channel0_TIMER		*&H40004004		' fix an error in LPC8xx lib

#define RedLED	15					' NXP 800-DIP has a red led on this IO
#define GrnLED	16					' NXP 800-DIP has a green led on this IO
#define BluLED	17					' NXP 800-DIP has a blue led on this IO

_MRT_Init:
	dim MRT_INT_Flag as integer		' this is a MRT user flag
	dim MRT_INT_Time as integer		' set inside the ISR for reporting purposes
	output(RedLED)  				' set GPIO as outputs to drive led
	output(GrnLED)  				' set GPIO as outputs to drive led
	output(BluLED)  				' set GPIO as outputs to drive led
	out(RedLED) = 1					' turn off led (active low)
	out(GrnLED) = 1					' turn off led (active low)
	out(BluLED) = 1					' turn off led (active low)
	dim i as integer				' used to toggle the three leds w/ b0-b2
	return

interrupt sub _MRT_INT_ISR			' this isr only sets a flag, clears the interrupt and exits - a handler will perform servicing outside of an interrupt context
	' set flag herein and clear the int only - keep long code sections in a handler outside of an interrupt state context
	MRT_INT_Flag = MRT_IRQ_FLAG	' assert the user flag during the ISR, saving the GFLAG0-4 in a user flag var
	MRT_IRQ_FLAG = MRT_IRQ_FLAG	' clear the MRT interrupt - writing a 1 to the set bits clears them.
	MRT_INT_Time = timer			' capture time for reporting purposes
	endsub

sub _MRT_INT_Handler				' this is the handler to do more stuff at time of interrupt, outside of the isr routine
	'do stuff here
	print "MRT Interrupt ";MRT_INT_Flag;" Fired @ "; MRT_INT_Time  ' this is stuff...
	i += 1
	out(RedLED) = (-i and 4) >> 2	' illuminate the active low led w/ b2
	out(GrnLED) = (-i and 2) >> 1	' illuminate the active low led w/ b1
	out(BluLED) = (-i and 1)		' illuminate the active low led w/ b0
	MRT_INT_Flag = 0				' and clear the user flag to acknowledge MRT Int handled
	endsub

sub Init_MRT_INT (MRT_count as integer, ISR_addy as integer)
	SYSCON_SYSAHBCLKCTRL or= (1<<10)				' set the MRT bit to enable the clock to the register interface.
	SYSCON_PRESETCTRL or= (1<<7) 					' clear a reset on the MRT
	MRT_Channel0_INTVAL = 0x80000000 or (MRT_count)	' immediately load the MRT IntVal (must happen after the clock is enabled or the registers won't latch)
	MRT_Channel0_CTRL = 0x00000001					' enable TIMERn Interrupt in repeat interrupt mode
	MRT_ISR = (ISR_addy) or 1						' assign the isr sub addy to the NVIC vector table for MRT_irq  (the 'or 1' is for thumb code purposes)
	VICIntEnable or= (1<<10)						' enable the MRT interrupt
	endsub

main:
	print "Started @ Timer:", timer
	call _MRT_Init									' using brucee's little trick to get globals instantiated from within a sub/func/main
	MRT_INT_Flag = 0								' deassert the MRT user flag
	Init_MRT_INT (7500000, addressof(_MRT_INT_ISR)) ' and turn on the MRT - 3000000 yields a .1S (30000000 for 1Hz) interrupt (30MHz clock, no prescaler)
	do												' and wait for it to fire
		if MRT_INT_Flag then _MRT_INT_Handler		' when it does fire, handle it
'		print MRT_Channel0_TIMER					' enable this line to see the mrt timer counting down on each pass thru the loop
	if ((i <> 0) and ((i mod 50) = 0))
'		VICIntEnClear = (1<<10)						' disable the MRT interrupt
		print
		print "Breaking for Debug - Use Target Explorer, or console, as needed:"
		print "@ hex1 hex2  <-- Displays hex2 words starting at (word aligned) address hex1"
		print "! hex1 hex2  <-- Writes value hex2 to (word aligned) address hex1"
		print "Press Resume (enter '^') to restart"
		stop
'		VICIntEnable or= (1<<10)					' enable the MRT interrupt
		endif
	loop
end
