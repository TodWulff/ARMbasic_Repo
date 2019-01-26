'========================================================================================
'
'	BASIC example, setup Timer1 to count signals on capture inputs
'
'		copyright Coridium Corp, 2012,   may be used anywhere with this notice
'========================================================================================
dim i as integer

#if defined LPC1751 || defined LPC1756
	#include <LPC17xx.bas>
	
	print "BASIC example, setup Timer1 to capture signals on P0.15 as the source"

	PCB_PINSEL3 or= (3<<6)  'select P1.19 as Capture 1.1 (Timer 1)
	#define Source_PIN	15

	T1_CTCR = 5        'increment on rising edge of CAP1.1

#elif defined LPC1114
	#include <LPC11xx.bas>
	
	print "BASIC example, setup Timer1 to capture signals on P0.8 as the source"

	IOCON_R_PIO1_0 = 0x83  'select P1.0 as Capture 1.0 (Timer 1)
	#define Source_PIN	8
	
	T1_CTCR = 1        'increment on rising edge of CAP1.0
	
#elif defined LPC11U37
	#include <LPC11U3x.bas>
	
	print "BASIC example, setup Timer1 to capture signals on  P0.8 as the source"

	IOCON_PIO1_18 = 0x81  'select P1.18 as Capture 1.0 (Timer 1)
	#define Source_PIN	1
	
	SYSCON_SYSAHBCLKCTRL OR= (1<<8)		' enable TIMER1
	
	T1_CTCR = 1        'increment on rising edge of CAP1.0
	
#elif defined LPC2138 
	#include <LPC21xx.bas>
	
	print "BASIC example, setup Timer1 to capture signals P0.15 as the source"

	PCB_PINSEL1 or= 4  'select P0.17 as Capture 1.2 (Timer 1)
	#define Source_PIN	15
	#define T1_CTCR  *&HE0008070 'Count Control Register T1CTCR - 0xE000 8070

	T1_CTCR = 9        'increment on rising edge of CAP1.2
	
#elif defined LPC2103 

	#include <LPC21xx.bas>
	
	print "BASIC example, setup Timer1 to capture signals on IO(0)P0.9 as the source"

	PCB_PINSEL0 = (PCB_PINSEL0 and (not 0x300000)) or 0x200000  'select P0.10 as Capture 1.0 (Timer 1)
	#define Source_PIN	0

	T1_CTCR = 1        'increment on rising edge of CAP1.0
	
#elif defined LPC2106	
  #error this code has not been ported to the LPC2106
#else
  #error undefined CPU type, please install new BASICtools from www.coridium.us/Support.php    
#endif		   

T1_TCR = 1         'enable timer/counter
T1_PR = 0          'prescale reset value 0
T1_PC = 0          'prescale counter 0
T1_TC = 0          'clear the counter


i = 0
while(1)
	IO(Source_PIN)=0
	wait(50)
	IO(Source_PIN)=1
	wait(50)
	i += 1
	if (i & 0xf) = 10 then
		print "Current Count "; T1_TC
	endif
	if i=150 then exit
loop
