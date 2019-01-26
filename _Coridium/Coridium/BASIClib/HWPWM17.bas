'========================================================================================
'
'	HWPWM Functions  -- for LPC17xx
'
'	no initialization code
'
'		copyright Coridium Corp, 2008,   may be used with Coridium Hardware or licensees
'========================================================================================
#ifndef USE_HWPWM17
#define USE_HWPWM17

#if (defined LPC2103) || (defined LPC2106) || (defined LPC2138) 
  #error -- use HWPWM.bas for LPC21xx 
#elif defined LPC1751 || defined LPC1756
	#include <HWPWM17.bas>
#elif defined LPC1114
  #error -- use HWPWM11.bas for LPC11xx 
#else
  #error undefined CPU type, please install new BASICtools from www.coridium.us/Support.php    
#endif		   


goto jumpAroundHWPWM

#include <LPC17xx.bas>                        

lastHWPWMcycle = 0			' this is used to detect whether cycle time needs to be changed

' all cycletimes are assumed to be the same
		
SUB HWPWM ( channel, cycletime, hightime )		' channel are 1-8
	DIM prescale as integer
	
	prescale = 25		' (CCLK/PBSD/1000000) as the peripherals run at 25 MHz

	' treat them all like 16 bits
	
	while (cycletime >= &H10000) 
		cycletime = cycletime >> 1
		hightime = hightime >> 1
		prescale = prescale << 1
	loop
	prescale = prescale - 1				' counts to n-1
	cycleTime = cycleTime - 1			' counts to n-1
		
	PWM1_TCR = 0   ' Disable counter and PWM
	select channel
	case 6
		PCB_PINSEL4 = PCB_PINSEL4 or &H00000400		'PC5
		PWM1_MR6 = cycletime - hightime
	case 5
		PCB_PINSEL4 = PCB_PINSEL4 or &H00000100		'PC4
		PWM1_MR5 = cycletime - hightime
	case 4
		PCB_PINSEL4 = PCB_PINSEL4 or &H00000040		'PC3
		PWM1_MR4 = cycletime - hightime
	case 3
		PCB_PINSEL4 = PCB_PINSEL4 or &H00000010		'PC2
		PWM1_MR3 = cycletime - hightime
	case 2
		PCB_PINSEL4 = PCB_PINSEL4 or &H00000004		'PC1
		PWM1_MR2 = cycletime - hightime
	case 1
		PCB_PINSEL4 = PCB_PINSEL4 or &H00000001		'PC0
		PWM1_MR1 = cycletime - hightime
	endselect

	PWM1_PR  = prescale							
	PWM1_TC  = 0
	PWM1_MCR = 2      ' reset on match MR0
	PWM1_PCR = &H7E00 ' enable PWM outputs, single edge
	PWM1_MR0 = cycletime
	PWM1_TCR = &H09   ' Enable counter and PWM
end sub
  		


jumpAroundHWPWM:

#endif
