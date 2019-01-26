' Test TIMER1 interrupt
' TIMER1 will interrupt every 2 seconds and print a dot

#if defined LPC1756 || defined LPC1751
 #include "LPC17xx.bas"
#elif defined LPC1114
 #include "LPC11xx.bas"
#elif defined LPC11U37
 #include "LPC11U3x.bas"
#else
 #error -- your CPU does not support this feature
#endif

dim e3 as integer
dim s3 as integer


INTERRUPT SUB TIMER1IRQ
  T1_IR = 1	      ' Clear interrupt
  e3 = e3 + 1
ENDSUB


SUB ON_TIMER ( msec, dothis )
  TIMER1_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
 #if defined LPC1756 || defined LPC1751
  VICIntEnable or= (1<<2)  'Enable interrupt
 #elif defined LPC1114
  SYSCON_SYSAHBCLKCTRL OR= (1<<8)		  ' enable TIMER1
  VICIntEnable OR= (1<<TIMER1_IRQn)  	 'Enable interrupt
 #elif defined LPC11U37
  VICIntEnable or= (1<<19)  'Enable interrupt REMEMBER for LPC11xx we swapped 0/1 with 2/3
 #else
 #endif 
  T1_MR0 = msec-1 ' set up match number of ms
  T1_PR  = 12000  ' prescale to msec -- this really varies from part to part
  T1_MCR = 3      ' Interrupt and Reset on MR0
  T1_IR  = 1      ' clear interrupt
  T1_TC  = 0      ' clear timer counter
  T1_TCR = 1      ' TIMER1 Enable
ENDSUB

' Some of the deep sleep modes exit the same as a reset
' we have not tried those -- setting this variable may help test that

DIM DejaVu as integer 
' DejaVu = 0 -- all BASIC variables are 0 when declared

main:
	print "SLEEP TIMER1 Interrupt Test"
	print "TIMER1 will wakeup in 5 seconds"
  
	if DejaVu = 0 then   	
		ON_TIMER(5000, ADDRESSOF TIMER1IRQ)
	else 
		print "We've been here before"
	endif
		
	DejaVu = 1
	print "going to sleep"
	wait(500)	' if we don't the messages don't ever come out until we are wake up


	SLEEP
	
	print "we woke up"
