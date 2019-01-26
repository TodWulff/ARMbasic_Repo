//////////////////////////////////////////////////////////////////////////////////////////////////
//
//	IRQ entries for ARM7TDMI parts
//
//  all interrupts must come here as this code is always compiled in ARM (32 bit instruction) mode
//
//	from here the code may call a thumb subroutine
//
//  Copyright 2011, Coridium Corp, free for any use with this notice
//
//

#include "IRQ_arm7.h"
#ifdef FOR_BASIC
  #include "basic_pcb.h"
#else  
  #include "coridium_pcb.h"
#endif
#include "printf.h"
#include "uart.h"




////////////////////////////////////////////////////////////////////
//
//	handle faults here
//

void shutdown(void) {
//	no longer uses BREAK_ASSERTED, startup code checks for reset cause to determine how restarts proceed
	asm ("mov r15, #0");	// reboot;	
}

externC void FIQ_ISR (void) {		// FIQ_Routine (void)  {
#ifdef USE_PRINTF	
	printf("FIQ\r\n");
#endif	
	shutdown();
}

externC void SWI_ISR (void) {		// SWI_Routine (void)  {
#ifdef USE_PRINTF	
	printf("Soft Int\r\n");
#endif	
	shutdown();
}

unsigned save_regs[6];

asm ("pt_save_regs:");   
asm ("    .word    save_regs");


externC void FaultUSE (void) {		// UNDEF_Routine
	asm ("ldr r2,pt_save_regs");
	asm ("str lr, [r2]");
#ifdef USE_PRINTF	
	printf("Undef Inst %08x\n",save_regs[0]);
#endif	
	shutdown();
}

externC void FaultMPU (void) {		// PAbt_Routine (void) {
	asm ("ldr r2,pt_save_regs");
	asm ("str lr, [r2]");
#ifdef USE_PRINTF	
	printf("Prefetch Abort %08x\n",save_regs[0]);
#endif	
	shutdown();
}

externC void FaultBUS (void) { 		// DAbt_Routine (void) {
	asm ("ldr r2,pt_save_regs");
	asm ("str lr, [r2]");
	asm ("str ip, [r2,#4]");
	asm ("str sp, [r2,#8]");
#ifdef USE_PRINTF	
	printf("Data Abort %08x %08x %08x\n",save_regs[0],save_regs[1],save_regs[2]);
#endif	
	shutdown();
}


///////////////////////////////////////////////////////////////
//
//	manage IRQ enables here
//

void __set_cpsr(unsigned val)
{
  asm volatile (" msr  cpsr, %0" : /* no outputs */ : "r" (val)  );
}

unsigned __get_cpsr(void)
{
  unsigned long retval;
  asm volatile (" mrs  %0, cpsr" : "=r" (retval) : /* no inputs */  );
  return retval;
}

#define IRQ_MASK 0x00000080
void disableIRQ(void)
{
  unsigned _cpsr;

  _cpsr = __get_cpsr();
  __set_cpsr(_cpsr | IRQ_MASK);
}

void enableIRQ(void)
{
  unsigned _cpsr;

  _cpsr = __get_cpsr();
  __set_cpsr(_cpsr & ~IRQ_MASK);
} 
