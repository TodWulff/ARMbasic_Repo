' Test TIMER2 interrupt
' TIMER2 will interrupt every 2 seconds and print a dot

#if defined LPC1756 || defined LPC1751
 #include "LPC17xx.bas"
#elif defined LPC1114
 #include "LPC11xx.bas"
#elif defined LPC11U37
 #include "LPC11U3x.bas"
#elif defined LPC812 
 #error -- use SCTIMER.bas for LPC812
#elif defined LPC2103 || defined LPC2138
  #include "LPC21xx.bas" 
#else
 #error -- your CPU does not support this feature
#endif

dim e3 as integer
dim s3 as integer


INTERRUPT SUB TIMER2IRQ
  T2_IR = 1	      ' Clear interrupt
 #if defined LPC2103 || defined LPC2138
  VICVectAddr = 0 ' Acknowledge Interrupt
 #endif
  e3 = e3 + 1
ENDSUB


SUB ON_TIMER2 ( msec, dothis )
 #if defined LPC1756 || defined LPC1751
  TIMER2_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
  SCB_PCONP or= 1 << 22                  'Enable power for Timer 2
  T2_PR  = 24999                         '1 ms prescale
  VICIntEnable = VICIntEnable or (1<<3)  'Enable interrupt
#elif defined LPC11U37
  TIMER2_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
  SYSCON_SYSAHBCLKCTRL OR= (1<<7)		  ' enable TIMER2 
  T2_PR  = 24999                         '1 ms prescale
  VICIntEnable OR= (1<<TIMER2_IRQn)  	 'Enable interrupt   
 #elif defined LPC1114
  TIMER2_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
  VICIntEnable = VICIntEnable or (1<<16) 'Enable interrupt REMEMBER for LPC11xx we swapped 0/1 with 2/3
  SYSCON_SYSAHBCLKCTRL or= 1 << 7        'CT16B0 clock enable
  T2_PR  = 47999  ' 1 ms prescale, NOTE this is a 16 bit value
 #elif defined LPC2103 || defined LPC2138
  VICVectAddr7 = dothis ' set function of VIC 7
  VICVectCntl7 = $3a    ' use it for TIMER2 Interrupt:
  VICIntEnable = $04000000    ' Enable TIMER2 Interrupt
  T2_PR  = 14999  ' 1 ms prescale, NOTE this is a 16 bit value
 #else
 #endif 
  T2_MR0 = msec-1 ' set up match number of ms
  T2_MCR = 3      ' Interrupt and Reset on MR0
  T2_IR  = 1      ' clear interrupt
  T2_TC  = 0      ' clear timer counter
  T2_TCR = 1      ' TIMER2 Enable
 #if defined LPC2103 || defined LPC2138
  VICVectAddr = 0 ' Acknowledge Interrupt
 #endif
ENDSUB




main:
  print "TIMER2 Interrupt Test"
  print "TIMER2 will interrupt every 2 seconds and print a dot"
  

  ON_TIMER2(2000, ADDRESSOF TIMER2IRQ)

  s3 = 0
  e3 = 0
   
  WHILE (1)
    if s3 <> e3 then
      s3 = e3
      print ".";
    endif
  LOOP
