' Test GPIO Boot pin interrupt
' GPIO will interrupt when Boot pin is toggled from BASICtools
' INTERRUPTpin was chosen for the above statement to be true, so this program can be exercised without wires

dim e3 as integer
dim s3 as integer

DIM INTERRUPTbitMASK	' these are used in the ISR to clear the interrupt
DIM INTERRUPTport
	
#if defined LPC1756 || defined LPC1751
	#define INTERRUPTpin	(64+10)		' P2.10
#elif defined LPC11U37
 #include "LPC11U3x.bas"
#elif defined LPC1114
	#define INTERRUPTpin	(1)			' P0.1
#else
#endif


#if defined LPC1756 || defined LPC1751
#include "LPC17xx.bas"

INTERRUPT SUB DO_GPIO_ISR		' one ISR shared on 2 ports
	if INTERRUPTport		' must be 2
		GPIO2_INT_CLR = INTERRUPTbitMASK 'Clear the interrupt
	else
		GPIO0_INT_CLR = INTERRUPTbitMASK 'Clear the interrupt
	endif
	
	e3 = e3 + 1
ENDSUB


SUB ON_GPIO (  dothis, pin )
	INPUT(pin)               'makes pin an input
	EINT3_ISR = dothis or 1  'Set the ISR, EINT3 channel is shared with GPIO interrupts
	if pin<32 then
		INTERRUPTport = 0
		INTERRUPTbitMASK = 1<<pin
		GPIO0_INT_CLR  = INTERRUPTbitMASK  'Clear the interrupt
		GPIO0_INT_EN_F = INTERRUPTbitMASK 'Enable GPIO interrupt P2.10/Boot falling edge
	else					' assume its for for 2 -- no range checking
		INTERRUPTport = 2
		INTERRUPTbitMASK = 1<<(pin-64)
		GPIO2_INT_CLR  = INTERRUPTbitMASK  'Clear the interrupt
		GPIO2_INT_EN_F = INTERRUPTbitMASK  'Enable GPIO interrupt 
 	endif
	VICIntEnable or= (1<<21) 'Enable interrupt EINT3
ENDSUB

#elif defined LPC11U37
 #include "LPC11U3x.bas"

 #error --- not ported here yet
#elif defined LPC1114

#include "LPC11xx.bas"
DIM GPIOmaskISRbit		' will be set and saved here by ON_GPIO

INTERRUPT SUB DO_GPIO_ISR
	GPIO0_IC = GPIOmaskISRbit 'Clear the interrupt
	e3 = e3 + 1
ENDSUB

INTERRUPT SUB DO_GPIO1_ISR
	GPIO1_IC = GPIOmaskISRbit 'Clear the interrupt
	e3 = e3 + 1
ENDSUB

SUB ON_GPIO (  dothis, pin )
	INPUT(pin)               'make pin an input
	GPIO0_ISR = dothis or 1  'Set the ISR
	GPIOmaskISRbit = 1<<pin
	GPIO0_IC = GPIOmaskISRbit    'Clear the interrupt
	GPIO0_IS = 0             'Interrupt on pin PIO1_0 is configured as edge sensitive
	GPIO0_IBE = 0            'Not both edges, Interrupt on pin is controlled through register GPIO0_IEV
	GPIO0_IEV = 0            'Falling edges
	GPIO0_IE = GPIOmaskISRbit    'Enable Interrupt on pin
	VICIntEnable or= 1 << 31 ' enable interrupt GPIO0
ENDSUB
	
SUB ON_GPIO1 (  dothis, pin )	' untested function here for reference
	pin -= 32
	GPIO1_ISR = dothis or 1  'Set the ISR
	GPIOmaskISRbit = 1<<pin
	GPIO1_IC = GPIOmaskISRbit    'Clear the interrupt
	GPIO1_IS = 0             'Interrupt on pin PIO1_0 is configured as edge sensitive
	GPIO1_IBE = 0            'Not both edges, Interrupt on pin is controlled through register GPIO1_IEV
	GPIO1_IEV = 0            'Falling edges
	GPIO1_IE = GPIOmaskISRbit    'Enable Interrupt on pin
	VICIntEnable or= 1 << 30 ' enable interrupt GPIO1
ENDSUB



#else
#ERROR -- your CPU does not support this feature
#endif

main:
	print "GPIO Boot Pin Interrupt Test"
	print "From BASICtools select Options->test->toggle boot"

	ON_GPIO(ADDRESSOF DO_GPIO_ISR, INTERRUPTpin)
	WHILE (1)
		if s3 <> e3 then
			s3 = e3
			print "GPIO Boot Pin Interrupt"
		endif
	LOOP
