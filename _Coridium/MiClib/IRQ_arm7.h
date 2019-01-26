#ifndef GCC_ASM_STEP
#ifndef __ARM7TDMI_ISR_H
#define __ARM7TDMI_ISR_H


void disableIRQ(void);
void enableIRQ(void);

#ifdef GPP
  #define externC extern "C"
#else
  #define externC
#endif

// not sure the attribute is needed

externC void UART0_IRQHandler(void) __attribute__ ((interrupt));
externC void UART1_IRQHandler(void) __attribute__ ((interrupt));

externC void FIQ_ISR (void)   __attribute__ ((interrupt("FIQ")));
externC void SWI_ISR (void)   __attribute__ ((interrupt("SWI")));
externC void FaultUSE (void) __attribute__ ((interrupt("UNDEF")));
externC void FaultMPU (void) __attribute__ ((interrupt("ABORT")));
externC void FaultBUS (void) __attribute__ ((interrupt("ABORT")));


//void Reset_Handler (void);

//////////////////////////////////////////////////////////////////
//
// VIC bit definitions

#define VIC_ENABLE      (1 << 5)

#define VIC_UART0        6
#define VIC_UART1        7


#endif
#endif	// GCC_ASM_STEP
