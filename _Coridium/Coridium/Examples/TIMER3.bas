' Test TIMER3 interrupt
' TIMER3 will interrupt every 2 seconds and print a dot

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


INTERRUPT SUB TIMER3IRQ
  T3_IR = 1	      ' Clear interrupt
 #if defined LPC2103 || defined LPC2138
  VICVectAddr = 0 ' Acknowledge Interrupt
 #endif
  e3 = e3 + 1
ENDSUB


SUB ON_TIMER3 ( msec, dothis )
#if defined LPC1756 || defined LPC1751
  TIMER3_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
  SCB_PCONP or= 1 << 23                  'Enable power for Timer 3
  T3_PR  = 24999                         '1 ms prescale
  VICIntEnable = VICIntEnable or (1<<4)  'Enable interrupt
#elif defined LPC11U37
  TIMER3_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
  SYSCON_SYSAHBCLKCTRL OR= (1<<8)		  ' enable TIMER3
  T3_PR  = 24999                         '1 ms prescale
  VICIntEnable OR= (1<<TIMER3_IRQn)  	 'Enable interrupt
#elif defined LPC1114
  TIMER3_ISR   = dothis + 1              'set function of VIC   -- need the +1 for Thumb operation
  VICIntEnable = VICIntEnable or (1<<17) 'Enable interrupt REMEMBER for LPC11xx we swapped 0/1 with 2/3
  SYSCON_SYSAHBCLKCTRL or= 1 << 8        'CT16B1 clock enable
  T3_PR  = 47999  ' 1 ms prescale, NOTE this is a 16 bit value
 #elif defined LPC2103 || defined LPC2138
  VICVectAddr7 = dothis ' set function of VIC 7
  VICVectCntl7 = $3b    ' use it for TIMER3 Interrupt:
  VICIntEnable = $08000000    ' Enable TIMER3 Interrupt
  T2_PR  = 14999  ' 1 ms prescale, NOTE this is a 16 bit value
 #else
 #endif 
  T3_MR0 = msec-1 ' set up match number of ms
  T3_MCR = 3      ' Interrupt and Reset on MR0
  T3_IR  = 1      ' clear interrupt
  T3_TC  = 0      ' clear timer counter
  T3_TCR = 1      ' TIMER3 Enable
ENDSUB




main:
  print "TIMER3 Interrupt Test"
  print "TIMER3 will interrupt every 2 seconds and print a dot"
  

  ON_TIMER3(2000, ADDRESSOF TIMER3IRQ)

  s3 = 0
  e3 = 0
   
  WHILE (1)
    if s3 <> e3 then
      s3 = e3
      print ".";
    endif
  LOOP
