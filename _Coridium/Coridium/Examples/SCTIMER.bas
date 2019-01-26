'========================================================================================
'
' Test SCT TIMER interrupt for LPC8xx
' SCT TIMER will interrupt every second and print a dot once per second
' Also demostrates an LED blink timer
'
'		copyright Coridium Corp, 2013,   may be used with Coridium Hardware or licensees
'========================================================================================

#if defined LPC812
#else
  #error this version of the TIMER example is only for the LPC812    
#endif		   

#include "LPC8xx.bas"                        

dim e3 as integer
dim s3 as integer
dim blink_time as integer
dim led_on as integer

' State Configurable Timer (SCT) Interrupt Service Routine (ISR) 
INTERRUPT SUB SCTIRQ
	dim status as integer
	status = SCT_EVFLAG ' read the status
	'print "status ";status
	SCT_EVFLAG = status ' clear the interrupt
	e3 = e3 + 1
ENDSUB


' Initalize SCT
' usec is the number of microseconds to interrupt, do this is the ISR
SUB ON_TIMER ( usec, dothis )
	DIM prescaler as integer
	prescaler = 30

	SCT_ISR = dothis + 1
	
	SYSCON_SYSAHBCLKCTRL = SYSCON_SYSAHBCLKCTRL or (1 << 8)' enable the SCT clock
	SYSCON_PRESETCTRL = SYSCON_PRESETCTRL or ( 1<< 8)   ' clear peripheral reset the SCT:
	SCT_CTRL_L = SCT_CTRL_L or (1<<2)' halt it: - setting bit 2 of the CTRL register
	SCT_CONFIG = 1   ' Unified counter
	SCT_REGMODE_L = 0' Match registers
	
	SCT_MATCH0_U = (usec * prescaler)
	SCT_MATCHREL0_U = (usec * prescaler)
	SCT_EVENT0_CTRL = &H0000D000 
	SCT_EVENT0_STATE = 1

	SCT_MATCH1_U = (usec * prescaler)
	SCT_MATCHREL1_U = (usec * prescaler)
	SCT_EVENT1_CTRL = &H00005001 
	SCT_EVENT1_STATE = 3
	
	SCT_STATE_L = 0
	SCT_LIMIT_L = 1 'event 0 acts as counter limits_
	SCT_EVEN = 1 ' enable interrupt on event 0
	VICIntEnable = 1 << 9 ' Enable Interrupt
	SCT_CTRL_L &= &HFFFFFFFB ' unhalt it: - clearing bit 2 of the CTRL register
ENDSUB


main:
	print "SCT TIMER Interrupt Test"
	print "TIMER will interrupt every second and print a dot"
	
	ON_TIMER(1000000, ADDRESSOF SCTIRQ) ' set up interrupt every 1 second

	s3 = 0
	e3 = 0
	
	OUTPUT(1)
	blink_time = TIMER
	led_on = 0
	
	WHILE (1)
		if s3 <> e3 then
			s3 = e3
			print ".";
		endif

		if (TIMER - blink_time) > 1000000
			if led_on and 1
				OUT(1) = 1
			else
				OUT(1) = 0
			endif
			led_on += 1
			blink_time = TIMER
		endif
	LOOP
