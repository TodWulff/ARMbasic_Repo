'========================================================================================
'
' Test MRT TIMER interrupt for LPC8xx
' MRT TIMER will interrupt every 1/4 second
' An interrupt counter will count to 4 and print a dot once per second
' Also demostrates an LED blink timer
'
'		copyright Coridium Corp, 2013,   may be used with Coridium Hardware or licensees
'========================================================================================

#if defined LPC812 || defined LPC814
#else
  #error this version of the TIMER example is only for the LPC812    
#endif		   

#include "LPC8xx.bas"                        

dim e3 as integer
dim s3 as integer
dim int_cnt as integer
dim blink_time as integer
dim led_on as integer


' 24 bit counter, max value 16,777,215 or .3495253125 seconds at 48MHz
' so 1/4 second is 12,000,000
INTERRUPT SUB MRTIRQ
	if ( MRT_Channel0_STAT and 1 )'MRT_STAT_IRQ_FLAG
		MRT_Channel0_STAT = 1' clear interrupt flag
		int_cnt = int_cnt + 1
		' count 4 interrupts for a one second total
		if int_cnt >= 4
			e3 = e3 + 1
			int_cnt = 0
		endif
	end if

ENDSUB


SUB ON_TIMER ( usec, dothis )
	' Enable clock to MRT and reset the MRT peripheral
	SYSCON_SYSAHBCLKCTRL = SYSCON_SYSAHBCLKCTRL or (0x1<<10)
	SYSCON_PRESETCTRL &= &HFFFFFF7F '~(0x1<<7)
	SYSCON_PRESETCTRL = SYSCON_PRESETCTRL or (0x1<<7)

	MRT_Channel0_INTVAL = usec
	MRT_Channel0_INTVAL = MRT_Channel0_INTVAL or (1<<31)
	MRT_Channel0_CTRL = 1' Interrupt enable
	
	MRT_ISR = dothis + 1
	
	VICIntEnable = 1 << 10 ' Enable Interrupt
ENDSUB


main:
	print "MRT TIMER Interrupt Test"
	print "TIMER will interrupt every 1/4 second and print a dot every second"
	
	ON_TIMER(12000000, ADDRESSOF MRTIRQ)

	s3 = 0
	e3 = 0
	int_cnt = 0
	
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
