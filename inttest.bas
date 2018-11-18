'                                                   Cortex   M3 example -- PROplus SuperPRO

' Test EINT0 on C10 (P2.10)
' For ARMmite connect C10 to P18
' The program will poll for a "0" or "1" on RXD0
' Receiving a "0" will clear output P18, a "1" will set the output
' triggering an EINT0 interrupt

#include "LPC17xx.bas"

dim e0 as integer
dim s0 as integer
dim rx as integer

INTERRUPT SUB EINT0IRQ
  SCB_EXTINT  = 1 ' Clear interrupt
  e0 = e0 + 1
ENDSUB

SUB ON_EINT0(rise_edge, dothis)
  PCB_PINSEL4 = &H00100000        ' EINT0 on P2.10
  SCB_EXTMODE = SCB_EXTMODE or 1 ' Enable edge mode
  SCB_EXTINT  = 1                 ' Clear interrupt
  if rise_edge
    SCB_EXTPOLAR = SCB_EXTPOLAR or 1         ' trigger on rise edge
  else
    SCB_EXTPOLAR = SCB_EXTPOLAR & &HFFFFFFFE ' trigger on fall edge (default)
  endif
  EINT0_ISR    = dothis or 1              'set vector in the VIC
  VICIntEnable = VICIntEnable or (1<<18) '&H00040000 'Enable interrupt
ENDSUB


main:
  print "EINT0 Interrupt Test"
  print "Enter 0 to clear EINT0 input, 1 to set input"

  ON_EINT0(0, ADDRESSOF EINT0IRQ) 'set up for rising edge
  
  e0 = 0
  s0 = 0
  rx = 0
  OUTPUT(18)
  OUT(18) = 0

  WHILE (1)
    rx = RXD0
    if rx > 0 then
      TXD0 = rx
      if rx = "0" then OUT(18) = 0
      if rx = "1" then OUT(18) = 1
    endif
   
    if s0 <> e0 then
      s0 = e0
      print "Received EINT0 "
    endif

  LOOP