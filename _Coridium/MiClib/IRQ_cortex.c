//////////////////////////////////////////////////////////////////////////////////////////////////
//
//	IRQ entries for cortex parts
//
//
//  Copyright 2011, Coridium Corp, free for any use with this notice
//
//

#ifdef FOR_BASIC
  #include "basic_pcb.h"
#else  
  #include "coridium_pcb.h"
#endif
#include "IRQ_cortex.h"
#include "printf.h"			// this may be removed, but it is here for error reporting
 #if (defined MK20DX128) || (defined MK20DX256) 
  #include "usb_serial.h"
 #elif (defined CC3200)
  #include "uart_if.h"
 #elif defined STM32F411
  #include "uart_stm.h"
 #elif defined LPC54618
  #include "uart_lpc546xx.h"
 #else   
  #include "uart.h"
 #endif


#ifdef GPP
  #define externC extern "C"
#else
  #define externC
#endif

void wait(int x);

extern char	ignorFault;				// set to 1 in breakpoint routine

void printFault (int reg0) {
	printf("Fault at &H%x\n",reg0-2);
//	while(1);					// this should exit user BASIC program -- someday
	delay_ms(500);
	putchar(EOTX);			// TclTerm keys on this to know when the program stops

	printf("push STOP to continue\n");

	while(1);				// this is the cleanest way -- so far, and it catches the users attention
}


#ifdef __CC_ARM
__ASM void cpsidisable(void) {
	cpsid i
}
__ASM void cpsienable(void) {
	cpsie i
}
	
__ASM void FaultISR(void) {
	
		IMPORT ignorFault
		IMPORT printFault
	
		EXPORT NmiSR	
		EXPORT FaultMPU
		EXPORT FaultBUS
		EXPORT FaultUSE
		EXPORT IntDefaultHandler
	
		align 2
		
NmiSR		
FaultMPU                   // 4  The MPU fault handler
FaultBUS                   // 5  The bus fault handler
FaultUSE                   // 6  The usage fault handler
IntDefaultHandler 		
	
		// bte -- hack to handle bus faults on dump memory
		ldr	r1, =&deaddead		// r1 used in breakpoint dump memory -- this flags bus error on that addr
		str r1, [sp, #4]		// r1 restored from here
		
		ldr	r0, [sp, #24]	// pc of exception pushed onto stack -- bump to the next instruction
#if defined CORE_M3 || defined CORE_M4 
		adds r0, #2
#else		
		add r0, #2
#endif
		str	r0, [sp, #24]
		ldr r1, =ignorFault
		ldrb r1, [r1]
		cmp r1, #1
		beq fiRet
		str r0, [sp, #0]			// r0 restored from here
		ldr r1, =printFault
		str	r1, [sp, #24]
fiRet
		ldr r0,=0xfffffff9			// have to do a return from interrupt
		mov	lr,r0
		bx	lr
		
}

#else

void cpsidisable(void) {
	__ASM (" cpsid i");
}
void cpsienable(void) {
	__ASM (" cpsie i");
}

void IntDefaultHandler(void) {
__ASM ("		ldr	r1, =0xdeaddead  ");	// r1 used in dump memory of breakpoint
__ASM ("		str r1, [sp, #4]	 ");	// r1 restored from here
__ASM ("		ldr	r0, [sp, #24]	 ");
#if defined CORE_M3 || defined CORE_M4		// not sure why I have to do this, seems like a compiler/assemler bug
__ASM ("		adds r0, #2          ");
#else
__ASM ("		add r0,  #2          ");		
#endif
__ASM ("		str	r0, [sp, #24]    ");
#ifndef SLAVE_CPU
__ASM ("		ldr r1, =ignorFault  ");
__ASM ("		ldrb r1, [r1]        ");
__ASM ("		cmp r1,  #1          ");
__ASM ("		beq fiRet            ");
#endif
__ASM ("		str r0, [sp, #0]	 ");		// r0 restored from here  -- why am I restoring this bte -2016
__ASM ("		ldr r1, =printFault  ");
__ASM ("		str	r1, [sp, #24]    ");		// return to printFault
__ASM ("fiRet:                       ");
__ASM ("		ldr r0, =0xfffffff9  ");		// have to do a return from interrupt
__ASM ("		mov lr,r0		     ");
__ASM ("		bx	lr               ");
}


#endif

void disableIRQ(void)
{
#ifdef SysTick
	SysTick->CTRL &= ~2;
#endif    
	cpsidisable();
}

void enableIRQ(void)
{
#ifdef SysTick
	SysTick->CTRL |= 2;
#endif    
	cpsienable();
} 




