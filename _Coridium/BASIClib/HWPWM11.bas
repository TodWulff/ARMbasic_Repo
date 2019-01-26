'========================================================================================
'
'	HWPWM Functions  -- for LPC11xx
'
'	no initialization code
'
'		copyright Coridium Corp, 2012,   may be used with Coridium Hardware or licensees
'========================================================================================
#ifndef USE_HWPWM11
#define USE_HWPWM11

#include "CORIDIUM_PCB.bas"

#if defined LPC1114
#elif defined LPC11U37
#else
  #error this version of HWPWM11.bas is only for the LPC1114 or LPC11U37   
#endif		   

goto jumpAroundHWPWM

#define EMC0	4
#define EMC1	6
#define EMC2	8

lastHWPWMcycle = 0			' this is used to detect whether cycle Te needs to be changed

' all cycleTimes are assumed to be the same
		
SUB HWPWM ( channel, cycleTime, highTime )		' channel are 1-4
	DIM prescale as integer
	
	prescale = 48		' as the peripherals run at 48 MHz

	' treat them all like 16 bits
	
	while (cycleTime >= &H10000) 
		cycleTime = cycleTime >> 1
		highTime = highTime >> 1
		prescale = prescale << 1
	loop
	prescale = prescale - 1				' counts to n-1
	cycleTime = cycleTime - 1			' counts to n-1
		
	' enable counters CT16B0 and CT16B1
	SYSCON_SYSAHBCLKCTRL = SYSCON_SYSAHBCLKCTRL or (1<<7) or (1<<8)

	if channel = 4
	  T3_TCR =	0
#if defined LPC11U37
	  IOCON_PIO0_21 = IOCON_PIO0_21 or &H00000001				'P0.21
#else
	  IOCON_PIO1_9 = IOCON_PIO1_9 or &H00000001				    'P1.9
#endif
	  T3_MR0 = cycleTime - highTime + 1
	  T3_EMR = T3_EMR or ((1<<EMC0) or 1)
	  T3_PWMC = T3_PWMC or &H09
	  T3_PR =	prescale
	  T3_TC =	0
	  T3_MCR = 1<<10 'Reset on MR3
	  T3_MR3 = cycleTime
	  T3_TCR =	1' Enable counter and PWM
	
	else
	  T2_TCR =	0
	  select channel
	  case 3
#if defined LPC11U37
	  	IOCON_PIO1_15 = IOCON_PIO1_15 or &H00000002	            'P1.15
#else
	  	IOCON_SWCLK_PIO0_10 = IOCON_SWCLK_PIO0_10 or &H00000003	'P0.10
#endif
	  	T2_MR2 = cycleTime - highTime + 1
	  	T2_EMR = T2_EMR or ((1<<EMC2) or 4)
	  	T2_PWMC = T2_PWMC or &H0C
	  case 2
	  	IOCON_PIO0_9 = IOCON_PIO0_9 or &H00000002				'P0.9
	  	T2_MR1 = cycleTime - highTime + 1
	  	T2_EMR = T2_EMR or ((1<<EMC1) or 2)
	  	T2_PWMC = T2_PWMC or &H0A
	  case 1
	  	IOCON_PIO0_8 = IOCON_PIO0_8 or &H00000002				'P0.8
	  	T2_MR0 = cycleTime - highTime + 1
	  	T2_EMR = T2_EMR or ((1<<EMC0) or 1)
	  	T2_PWMC = T2_PWMC or &H09
	  endselect

	  T2_PR =	prescale
	  T2_TC =	0
	  T2_MCR = 1<<10 'Reset on MR3
	  T2_MR3 = cycleTime
	  T2_TCR =	1' Enable counter and PWM
	
	endif
end sub
  		


jumpAroundHWPWM:

#endif

'Available HWPM Pins for LPC11U37

'IOCON_PIO0_8        Func2 T0_MAT0
'IOCON_PIO0_9        Func2 T0_MAT1
'IOCON_SWCLK_PIO0_10 Func3 T0_MAT2
'IOCON_PIO1_14       Func2 T0_MAT1
'IOCON_PIO1_15       Func2 T0_MAT2
								  
'IOCON_PIO0_21       Func1 T1_MAT0
'IOCON_PIO0_22       Func2 T1_MAT1
'IOCON_PIO1_23       Func1 T1_MAT1
								  
'IOCON_PIO0_18       Func2 T2_MAT0
'IOCON_PIO0_19       Func2 T2_MAT1
'IOCON_PIO0_1        Func2 T2_MAT2
'IOCON_TDI_PIO0_11   Func3 T2_MAT3
'IOCON_PIO1_24       Func1 T2_MAT0	 
'IOCON_PIO1_25       Func1 T2_MAT1	 
'IOCON_PIO1_26       Func1 T2_MAT2	 
'IOCON_PIO1_27       Func1 T2_MAT3	 

'IOCON_TDO_PIO0_13   Func3 T3_MAT0
'IOCON_TRST_PIO0_14  Func3 T3_MAT1
'IOCON_SWDIO_PIO0_15 Func3 T3_MAT2
'IOCON_PIO0_16       Func2 T3_MAT3
'IOCON_PIO1_0        Func1 T3_MAT1
'IOCON_PIO1_1        Func1 T3_MAT1
'IOCON_PIO1_2        Func1 T3_MAT2
'IOCON_PIO1_3        Func1 T3_MAT3

'Available HWPM Pins for LPC1114

'IOCON_PIO0_8        Func2 T2_MAT0
'IOCON_PIO0_9        Func2 T2_MAT1
'IOCON_SWCLK_PIO0_10 Func3 T2_MAT2

'IOCON_PIO1_9        Func1 T3_MAT0
'IOCON_PIO1_10       Func2 T3_MAT1

'IOCON_PIO1_6        Func2 T0_MAT0
'IOCON_PIO1_7        Func2 T0_MAT1
'IOCON_PIO0_1        Func2 T0_MAT2
'IOCON_PIO0_11       Func3 T0_MAT3

'IOCON_PIO1_1        Func3 T1_MAT0
'IOCON_PIO1_2        Func3 T1_MAT1
'IOCON_PIO1_3        Func3 T1_MAT2
'IOCON_PIO1_4        Func2 T1_MAT3
