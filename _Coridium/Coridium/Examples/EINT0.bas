' Test EINT0 on (P2.10)
' For SuperPRO/PROplus 
' For ARMmite or PRO-with-Coridium-USB dongle
'
' BASICtools / Options / test / toggle BOOT    will toggle EINT0
' 
' triggering an EINT0 interrupt


#if defined LPC1756 || defined LPC1751
  #include "LPC17xx.bas"
#elif defined LPC11U37
 #include "LPC11U3x.bas"
#elif defined LPC2103 || defined LPC2138
  #include "LPC21xx.bas"
#else
  #error -- code not ported to this CPU
#endif


dim e0 as integer
dim s0 as integer
dim rx as integer


INTERRUPT SUB EINT0IRQ
  SCB_EXTINT  = 1 ' Clear interrupt
#if defined LPC2103 || defined LPC2138
  VICVectAddr = 0 ' Acknowledge Interrupt
#endif
  e0 = e0 + 1
ENDSUB

#if defined LPC1756 || defined LPC1751

SUB ON_EINT0(rise_edge, dothis)
  PCB_PINSEL4 = (PCB_PINSEL4 and &Hffcfffff) or &H00100000        ' EINT0 on P2.10
  SCB_EXTMODE = SCB_EXTMODE or 1 ' Enable edge mode
  SCB_EXTINT  = 1                 ' Clear interrupt

  if rise_edge
    SCB_EXTPOLAR = SCB_EXTPOLAR or 1         ' trigger on rise edge
  else
    SCB_EXTPOLAR = SCB_EXTPOLAR & &HFFFFFFFE ' trigger on fall edge (default)
  endif

  EINT0_ISR    = dothis or 1              'set function of VIC
  VICIntEnable = VICIntEnable or (1<<18)  '&H00040000 'Enable interrupt Vector 18
ENDSUB

#elif defined LPC2103 || defined LPC2138

SUB ON_EINT0(rise_edge, dothis)
  ' Setup MUST be done before enabling the interrupt
  PCB_PINSEL1  = PCB_PINSEL1 or psfEINT0 ' select pin function
  SCB_EXTINT   = 1                        ' clear interrupt
  SCB_EXTMODE  = SCB_EXTMODE or 1        ' enable edge mode

  if rise_edge
    SCB_EXTPOLAR = SCB_EXTPOLAR or 1         ' trigger on rise edge
  else
    SCB_EXTPOLAR = SCB_EXTPOLAR & &HFFFFFFFE ' trigger on fall edge (default)
  endif

  VICVectAddr4 = dothis  ' set function of VIC 4
  VICVectCntl4 = &H2e    ' use it for EINT0 Interrupt:
  VICIntEnable = &H4000  ' enable EINT0 Interrupt:

  VICVectAddr = 0 ' Acknowledge all Interrupts
ENDSUB

#endif


main:
	VIC_VTOR = VIC_VTOR or &H20000000

  print "EINT0 Interrupt Test"
  print "BASICtools / Options / test / toggle BOOT    will toggle EINT0"

  ON_EINT0(1, ADDRESSOF EINT0IRQ) 'set up for rising edge
  
  e0 = 0
  s0 = 0
  rx = 0

  WHILE (1)
   
    if s0 <> e0 then
      s0 = e0
      print "Received EINT0 "
    endif

  LOOP
