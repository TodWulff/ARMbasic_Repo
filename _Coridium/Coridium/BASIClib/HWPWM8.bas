'========================================================================================
'
'	HWPWM Functions  -- for LPC8xx
'	An example MAIN implementation, sets up pins 1, 2, 3 and 16 as PWM outputs
'
'	initialization code
'
'		copyright Coridium Corp, 2013,   may be used with Coridium Hardware or licensees
'========================================================================================
#ifndef USE_HWPWM8
#define USE_HWPWM8

#if (defined LPC812) || (defined LPC814)
#else
  #error this version of HWPWM8.bas is only for the LPC800 family    
#endif		   

goto jumpAroundHWPWM

#include "LPC8xx.bas"                        

' IT IS NOT ALLOWED TO USE RESET PIN 4
' It is strongly recommended you not use pin 0 RXD0 or pin 5 TXD0

SUB HWPWM (pin, channel, cycleTime, highTime ) 
	
	DIM prescaler as integer
	prescaler = 24000

	'disable pull-up
	select (pin)  'TODO check all these are correct
		'NOT pin 19 RXD
		case 1 
			IOCON_PIO0_1 = &H90 
		case 2 
			IOCON_PIO0_2 = &H90 
		case 3 
			IOCON_PIO0_3 = &H90 
		'NOT pin 5 TXD
		'DEFINITELY NOT pin 4 RESET
		case 6 
			IOCON_PIO0_6 = &H90 
		case 7 
			IOCON_PIO0_7 = &H90 
		case 8 
			IOCON_PIO0_8 = &H90 
		case 9 
			IOCON_PIO0_9 = &H90 
		case 10 
			IOCON_PIO0_10 = &H90 
		case 11 
			IOCON_PIO0_11 = &H90 
		case 12 
			IOCON_PIO0_12 = &H90 
		case 13 
			IOCON_PIO0_13 = &H90 
		case 14 
			IOCON_PIO0_14 = &H90 
		case 15 
			IOCON_PIO0_15 = &H90 
		case 16 
			IOCON_PIO0_16 = &H90 
		case 17 
			IOCON_PIO0_17 = &H90 

		case else
			print "ERROR PWM: Invalid Pin ";pin
			goto HWPWM_Exit
			
	end select
	
	if( (channel >= 0) and (channel <= 3)) 
		SYSCON_SYSAHBCLKCTRL = SYSCON_SYSAHBCLKCTRL or (1 << 8)' enable the SCT clock
		SYSCON_PRESETCTRL = SYSCON_PRESETCTRL or ( 1<< 8)   ' clear peripheral reset the SCT:

		SCT_CTRL_L = SCT_CTRL_L or (1<<2)' halt it: - setting bit 2 of the CTRL register

		SCT_CONFIG = 1   ' Unified counter
		SCT_REGMODE_L = 0' Match registers
	
		SCT_MATCH0_U = (cycleTime * prescaler)   ' cycle time
		SCT_MATCHREL0_U = (cycleTime * prescaler)
		SCT_EVENT0_CTRL = &H0000D000 
		SCT_EVENT0_STATE = 1

		SCT_STATE_L = 0
		SCT_LIMIT_L = 1 'event 0 acts as counter limits_

		select (channel)
		
		case 0
		SWM_PINASSIGN6 AND= &H00FFFFFF ' Select pin for CTOUT_0
		SWM_PINASSIGN6 = SWM_PINASSIGN6 or (pin << 24)
		SCT_MATCH1_U = (highTime * prescaler)   ' high time
		SCT_MATCHREL1_U = (highTime * prescaler)
		SCT_EVENT1_CTRL = &H00005001 
		SCT_EVENT1_STATE = 3
		SCT_OUT0_SET = &H01 'CTOUT_0 SET on EVENT0
		SCT_OUT0_CLR = &H02 'CTOUT_0 CLR on EVENT1
		
		
		case 1
		SWM_PINASSIGN7 AND= &HFFFFFF00 ' Select pin for CTOUT_1
		SWM_PINASSIGN7 = SWM_PINASSIGN7 or pin
		SCT_MATCH2_U = (highTime * prescaler)   ' high time
		SCT_MATCHREL2_U = (highTime * prescaler)
		SCT_EVENT2_CTRL = &H00005002 
		SCT_EVENT2_STATE = 3
		SCT_OUT1_SET = &H01 'CTOUT_1 SET on EVENT0
		SCT_OUT1_CLR = &H04 'CTOUT_1 CLR on EVENT2
		
		
		case 2
		SWM_PINASSIGN7 AND= &HFFFF00FF ' Select pin for CTOUT_2
		SWM_PINASSIGN7 = SWM_PINASSIGN7 or (pin << 8)
		SCT_MATCH3_U = (highTime * prescaler)   ' high time
		SCT_MATCHREL3_U = (highTime * prescaler)
		SCT_EVENT3_CTRL = &H00005003 
		SCT_EVENT3_STATE = 3
		SCT_OUT2_SET = &H01 'CTOUT_2 SET on EVENT0
		SCT_OUT2_CLR = &H08 'CTOUT_2 CLR on EVENT3
		
		
		case 3
		SWM_PINASSIGN7 AND= &HFF00FFFF ' Select pin for CTOUT_3
		SWM_PINASSIGN7 = SWM_PINASSIGN7 or (pin << 16)
		SCT_MATCH4_U = (highTime * prescaler)   ' high time
		SCT_MATCHREL4_U = (highTime * prescaler)
		SCT_EVENT4_CTRL = &H00005004 
		SCT_EVENT4_STATE = 3
		SCT_OUT3_SET = &H01 'CTOUT_3 SET on EVENT0
		SCT_OUT3_CLR = &H10 'CTOUT_3 CLR on EVENT4
		
		end select

		SCT_OUTPUT = SCT_OUTPUT or (1 << channel)    'Enable CTOUT_x
		SCT_CTRL_L AND= &HFFFFFFFB ' unhalt it: - clearing bit 2 of the CTRL register
	
	else
		print "ERROR PWM: Invalid Channel ";channel
	end if

HWPWM_Exit:

end sub


jumpAroundHWPWM:

main:

	PRINT "PWM Example"

	'HWPWM (int pin, int channel, int cycleTime, int highTime)
	HWPWM (1, 0, 1000, 500)'LED
	HWPWM (2, 1, 1000, 50) 'TMS
	HWPWM (3, 2, 1000, 950)'TCK
	HWPWM (16, 3, 1000, 250)

	while(1)
	loop
#endif
