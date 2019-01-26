' Test GPIO Boot pin interrupt for LPC812
' GPIO will interrupt when Boot pin is toggled from BASICtools
' GPIO channel 0 on rise edge and GPIO channel 1 on both edges
' INTERRUPTpin was chosen for the above statement to be true, so this program can be exercised without wires

#if defined LPC812
#else
  #error this version of GPIO Interrupt is only for the LPC812    
#endif		   

dim e0, e1 as integer
dim s0, s1 as integer

#include "LPC8xx.bas"



' GPIO0 interrupt routine
INTERRUPT SUB DO_GPIO0_ISR
	PIN_INT_IST = 1 'Clear the interrupt
	e0 += 1
ENDSUB

' Set up GPIO channel 0 interrupt
' sense: edge or level, 0 is edge, 1 is level 
' event/polarity: 0 is active low/falling, 1 is high/rising, 2 high/both edges.
'  bit position, sense, event(polarity)
SUB ON_GPIO0 (  dothis, pinNum, sense, event )
	INPUT(pinNum)               'make pin an input
	PININT0_ISR = dothis or 1  'Set the ISR
	SYSCON_PINTSEL0 = pinNum 

	if sense = 0
		PIN_INT_ISEL and= &HFE	' Edge trigger
		if event = 0
			PIN_INT_IENF or= 1	' falling edge
		elseif event = 1
			PIN_INT_IENR or= 1	' rising edge
		else
			PIN_INT_IENF or= 1	' both edges
			PIN_INT_IENR or= 1
		endif
	else
		PIN_INT_ISEL or= 1	' Level trigger.
		PIN_INT_IENR or= 1	' Level enable
		if event = 0
			PIN_INT_IENF and= &HFE	' active-low
		else
			PIN_INT_IENF or= 1	' active-high
		endif
	endif
	
	PIN_INT_IST = 1    'Clear the interrupt
	VICIntEnable = 1 << 24 ' Enable Interrupt
ENDSUB
	


' GPIO1 interrupt routine
INTERRUPT SUB DO_GPIO1_ISR
	PIN_INT_IST = 1<<1 'Clear the interrupt
	e1 += 1
ENDSUB

' Set up GPIO channel 1 interrupt
' sense: edge or level, 0 is edge, 1 is level 
' event/polarity: 0 is active low/falling, 1 is high/rising, 2 high/both edges.
'  bit position, sense, event(polarity)
SUB ON_GPIO1 (  dothis, pinNum, sense, event )
	INPUT(pinNum)               'make pin an input
	PININT1_ISR = dothis or 1  'Set the ISR
	SYSCON_PINTSEL1 = pinNum 
	if sense = 0
		PIN_INT_ISEL and= &HFD	' Edge trigger
		if event = 0
			PIN_INT_IENF or= 1<<1	' falling edge
		elseif event = 1
			PIN_INT_IENR or= 1<<1	' rising edge
		else
			PIN_INT_IENF or= 1<<1	' both edges
			PIN_INT_IENR or= 1<<1
		endif
	else
		PIN_INT_ISEL or= 1<<1	' Level trigger.
		PIN_INT_IENR or= 1<<1	' Level enable
		if event = 0
			PIN_INT_IENF and= &HFD	' active-low
		else
			PIN_INT_IENF or= 1<<1	' active-high
		endif
	endif
	
	PIN_INT_IST = 1<<1    'Clear the interrupt
	VICIntEnable = 1 << 25 ' Enable Interrupt
ENDSUB
	

main:
	print "GPIO Boot Pin Interrupt Test"
	print "From BASICtools select Options->test->toggle boot"

	' setup interrupt for GPIO channel 0, pin 1, edge trigger, rising edge
	ON_GPIO0(ADDRESSOF DO_GPIO0_ISR, 1, 0, 1)
	
	' setup interrupt for GPIO channel 1, pin 1, edge trigger, both edges
	ON_GPIO1(ADDRESSOF DO_GPIO1_ISR, 1, 0, 2)
	
	WHILE (1)
		if s0 <> e0 then
			s0 = e0
			print "GPIO 0 Boot Pin Interrupt "; s0
		endif
		
		if s1 <> e1 then
			s1 = e1
			print "GPIO 1 Boot Pin Interrupt "; s1
		endif
	LOOP
