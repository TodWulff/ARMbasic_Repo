' Test TIMER1 interrupt
' TIMER1 will interrupt every 2 seconds and print a dot



#if defined LPC1756 || defined LPC1751
 #include "LPC17xx.bas"
#elif defined LPC1114
 #include "LPC11xx.bas"
#elif defined LPC11U37
 #include "LPC11U3x.bas"
#elif defined LPC54102
 #include "LPC54102.bas" 
#elif defined LPC812 
 #error -- use SCTIMER.bas for LPC812
#elif defined LPC2103 || defined LPC2138
  #include "LPC21xx.bas" 
#else
 #error -- your CPU does not support this feature
#endif

dim e3 as integer
dim s3 as integer


INTERRUPT SUB TIMER1IRQ
  T1_IR = 1	      ' Clear interrupt
#if defined LPC2103 || defined LPC2138
  VICVectAddr = 0 ' Acknowledge Interrupt
#endif
  e3 = e3 + 1
ENDSUB

SUB ON_TIMER ( msec, dothis )
#if defined LPC1756 || defined LPC1751
   TIMER1_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
   T1_PR  = 24999                         '1 ms prescale
   VICIntEnable or= (1<<2)  'Enable interrupt
#elif defined LPC11U37
   TIMER1_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
   SYSCON_SYSAHBCLKCTRL OR= (1<<10)		  ' enable TIMER1
   T1_PR  = 24999                         '1 ms prescale
   VICIntEnable OR= (1<<TIMER1_IRQn)  	 'Enable interrupt
#elif defined LPC1114
   TIMER1_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
   T1_PR  = 49999                         '1 ms prescale
   VICIntEnable or= (1<<19)  'Enable interrupt REMEMBER for LPC11xx we swapped 0/1 with 2/3
#elif defined LPC2103 || defined LPC2138
   VICVectAddr7 = dothis ' set function of VIC 7
   VICVectCntl7 = $25    ' use it for TIMER1 Interrupt:
   VICIntEnable = $20    ' Enable TIMER1 Interrupt
#elif defined LPC54102
	TIMER1_ISR   = dothis + 1              	'set function of VIC   -- need the +1 for Thumb operation
	ASYNCAPBCLKCTRLSET = SYSCON_CLOCK_TIMER1		' enable TIMER1
	T1_PR  = 12499                         	'1 ms prescale
	VICIntEnSet0 = (1<<TIMER1_IRQn) 	 	'Enable interrupt
#else
#endif 
  T1_MR0 = msec-1 ' set up match number of ms
  T1_MCR = 3      ' Interrupt and Reset on MR0
  T1_IR  = 1      ' clear interrupt
  T1_TC  = 0      ' clear timer counter
  T1_TCR = 1      ' TIMER1 Enable
 #if defined LPC2103 || defined LPC2138
  VICVectAddr = 0 ' Acknowledge Interrupt
 #endif
ENDSUB


main:
  print "TIMER1 Interrupt Test"
  print "TIMER1 will interrupt every 2 seconds and print a dot"
  

  ON_TIMER(2000, ADDRESSOF TIMER1IRQ)

  s3 = 0
  e3 = 0
  
  
  WHILE (1)
    if s3 <> e3 then
      s3 = e3
      print ".";
    endif
  LOOP
