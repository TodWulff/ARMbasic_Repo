' Test Repetitive interrupt timer
' RIT will interrupt every 2 seconds and print a dot

#if defined LPC1751 || defined LPC1756
	#include "LPC17xx.bas"
#else
  	#error -- no hardware support with this CPU
#endif


dim rit_timer_counter as integer
dim last_rit_timer_counter as integer


INTERRUPT SUB RITIMER_IRQ
  RI_CTRL = RI_CTRL or 1		'	/* clear interrupt flag */
  rit_timer_counter += 1
ENDSUB


SUB enable_rit_timer
  RI_CTRL = &Hb
ENDSUB

SUB disable_rit_timer
  RI_CTRL = 3
ENDSUB


SUB ON_RITIMER ( msec, dothis )

  SCB_PCONP = SCB_PCONP OR (1 << 16)		' RITimer not turned on by default, so turn it on
  disable_rit_timer
  rit_timer_counter = 0
  RI_COMPVAL = msec * 24000		' counts up on PCLK which is 96/4 MHz

  RIT_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
  VICIntEnable = VICIntEnable or (1<<29)  'Enable interrupt
  
  enable_rit_timer
ENDSUB



main:
  print "RITIMER Interrupt Test"
  print "RITIMER will interrupt every 2 seconds and print a dot"
  

  last_rit_timer_counter = 0
  rit_timer_counter = 0
  
  ON_RITIMER(2000, ADDRESSOF RITIMER_IRQ)
  
  WHILE (1)
    if last_rit_timer_counter <> rit_timer_counter then
      last_rit_timer_counter = rit_timer_counter
      print ".";
    endif
  LOOP
