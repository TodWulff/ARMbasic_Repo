#include "LPC8xx.bas"				' needed for the header #defs 

#define MRT_IRQ_GFLAG 	   *0x400040F8


_MRT_InitGlobals:
	dim MRT_INT_Flag,MRT_INT_Time as integer		' this is a MRT user flag
	return
	
interrupt sub _MRT_INT_ISR			' this isr only sets a flag, clears the interrupt and exits - a handler will perform outside of an interrupt context
	MRT_INT_Flag = MRT_IRQ_GFLAG		' assert the user flag during the ISR, saving the GFLAG0-4
	MRT_IRQ_GFLAG = MRT_IRQ_GFLAG		' clear the MRT interrupt 
	MRT_INT_Time = timer
	endsub
	
sub _MRT_INT_Handler				' this is the handler to do more stuff at time of interrupt, outside the isr
	print "Interrupt ";MRT_INT_Flag;" Fired @ "; MRT_INT_Time
	'do stuff here
	MRT_INT_Flag = 0				' clear the user flag
	endsub
	
main:
	print "Started @ Timer:", timer
	
	call _MRT_InitGlobals
	MRT_INT_Flag = 0				' deassert the MRT user flag

	'set up the MRT timer here
	SYSCON_SYSAHBCLKCTRL or= (1<<10)	' set the MRT bit to enable the clock to the register interface.
	SYSCON_PRESETCTRL or= (1<<7) 		' Clear reset to the MRT.
	
	MRT_Channel0_INTVAL = 0x493E0				' immediately load the MRT IntVal
	'824	= 100hz = 0x493E0	250Hz=0x1D4C0	500Hz=0xEA60	1000Hz=0x7530
	'max is 0x7FFFFFFF  which is 71.6 Seconds

	
	
	MRT_Channel0_CTRL = 0x00000001			' enable TIMERn Interrupt in repeat interrupt mode

	' default MRT int priority is fine - so noeffwidit
	
	' set up the MRT Interrupt here
	MRT_ISR = (addressof _MRT_INT_ISR) or 1	' assign the isr sub addy to the NVIC vector table for MRT_irq  (the 'or 1' is for thumb code purposes)
	VICIntEnable or= (1<<10)				' enable the MRT interrupt

	do
		if MRT_INT_Flag then _MRT_INT_Handler
'		print MRT_TIMER(0)
	loop
	
end
