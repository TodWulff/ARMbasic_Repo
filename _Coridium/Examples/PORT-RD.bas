'========================================================================================
'
'	BASIC example, setup IOs as inputs (default for most, but ADs switched to inputs)
'
'					then read each port in parallel
'
'		copyright Coridium Corp, 2012,   may be used anywhere with this notice
'========================================================================================

	print "BASIC example, read most input pins by port in parallel"

#if defined LPC1751 || defined LPC1756
	#include <LPC17xx.bas>
	
	#define PORT0	FIO0PIN		' use a common name
	#define PORT1	FIO1PIN
	#define PORT2	FIO2PIN
	' skip the 2 bit port 4
	
	#define	NumberOfPorts	3	
	
	sub makeADinputs
		DIM i
		
		i = IO(25)		' converts AD to digital IO function
		i = IO(26)
		i = IO(62)
		i = IO(63)
	endsub
	
#elif defined LPC11U37
 #include "LPC11U3x.bas"
 
 	#define PORT0	GPIO_PIN(0)		' use a common name
	#define PORT1	GPIO_PIN(1)

 
 	sub makeADinputs
			' nothing to do here, they already are iIOs
	end sub
	
#elif defined LPC1114
	#include <LPC11xx.bas>
	
	#define PORT0	GPIO0_DATA		' use a common name
	#define PORT1	GPIO1_DATA
	
	#define	NumberOfPorts	2
	
	sub makeADinputs
		DIM i
	
		i = IO(11)		' converts AD to digital IO function
		i = IO(32)
		i = IO(33)
		i = IO(34)
		i = IO(35)
		i = IO(36)
		' the following code required for version 8.14 of the firmware -- enable the digital input
		IOCON_R_PIO0_11 	OR= &H80
		IOCON_R_PIO1_0 		OR= &H80
		IOCON_R_PIO1_1 		OR= &H80
		IOCON_R_PIO1_2 		OR= &H80
		IOCON_SWDIO_PIO1_3 	OR= &H80
		IOCON_PIO1_4 		OR= &H80
	
	endsub
	
#elif defined LPC2138 
	#include <LPC21xx.bas>
	
	#define PORT0	GPIO_IOPIN		' use a common name
	#define PORT1	GPIO1_IOPIN

	#define DIR0	GPIO_IODIR		' use a common name
	#define DIR1	GPIO1_IODIR		

	#define	NumberOfPorts	2	
	
	sub makeADinputs
		DIM i
		
#error -- this code has not been ported to the LPC2138 as of yet

		i = IO(25)		' converts AD to digital IO function
		i = IO(26)		
		i = IO(27)		
		i = IO(28)		
		i = IO(29)		
		i = IO(30)		
	endsub

#elif defined LPC2103 

	#include <LPC21xx.bas>

	#define PORT0	GPIO_IOPIN		' use a common name
	#define DIR0	GPIO_IODIR		' use a common name
		
	#define	NumberOfPorts	1	
			
	sub makeADinputs
		DIM i
		
		i = IO(10)		' converts AD to digital IO function
		i = IO(11)
		i = IO(12)
		i = IO(22)
		i = IO(23)
		i = IO(24)
		i = IO(25)
		i = IO(26)
	endsub
	

#elif defined LPC812 

	#include <LPC8xx.bas>

	#define PORT0	GPIO_PIN0		' use a common name
	#define DIR0	GPIO_DIR0		' use a common name
	
	#define	NumberOfPorts	1	
			
	sub makeADios
					' nothing to do here, as there are no ADs in this part
	endsub
			
		
#elif defined LPC2106	
  #error this code has not been ported to the LPC2106
#else
  #error undefined CPU type, please install new BASICtools from www.coridium.us/Support.php    
#endif		   



main:

	makeADinputs

	print "PORT0 =", hex(PORT0)

#if NumberOfPorts > 1
	print "PORT1 =", hex(PORT1)
#endif

#if NumberOfPorts > 2
	print "PORT2 =", hex(PORT2)
#endif
