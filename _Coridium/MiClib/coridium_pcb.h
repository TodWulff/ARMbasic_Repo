#ifndef _CORIDIUM_PCB_H
#define _CORIDIUM_PCB_H

////////////////////////////////////////////////////////////////////////////
//
//	Copyright Coridium Corp, 2011, free to use anywhere with this notice
//
//	this file should be included in all sources as it defines the CPU
//  and can also be used to enable/disable other parts of the code, for instance printf
//
//
// use this file to choose which CPU type

#define USE_PRINTF


///////////////////////////////////////////////////////////////////////////
//
// these #define are done in the command line for gcc from MakeItC
//

#if defined LPC1751 || defined LPC1756 || defined LPC1768

#include "LPC175x6x.h"

#include "core_cm3.h"
#include "IRQ_cortex.h"
#include "system_LPC175x6x.h"

#if (defined MBED) || (defined MIGUEL)
//  #define FILE_SYSTEM
  #define SDCARD_SSP1
//  #define USE_12MHZ_XTAL
#endif

#elif defined CC3200

//#define SysTick // CCS isn't getting this from its own defines
#include "CC3200.h"
#include "core_cm4.h"
#include "IRQ_cortex.h"
#include "system_CC3200.h"

#elif defined STM32F411
#include "STM32F411.h"

#include "core_cm4.h"
#include "IRQ_cortex.h"
#include "system_stm32f411.h"

#elif defined LPC407x
#include "LPC407x_8x.h"

#include "core_cm4.h"
#include "IRQ_cortex.h"
#include "system_LPC407x_8x.h"

#elif defined LPC178x

#include "LPC177x_8x.h"

#include "core_cm3.h"
#include "IRQ_cortex.h"
#include "system_LPC177x_8x.h"

#elif defined LPC12xx

#include "LPC12xx.h"

#include "core_cm0.h"
#include "IRQ_cortex.h"
#include "system_LPC12xx.h"

#elif defined LPC802 || defined LPC812 || defined LPC824
#include "LPC8xx.h"

#include "core_cm0plus.h"
#include "IRQ_cortex.h"
#include "system_LPC8xx.h"

#elif defined LPC1114

#include "LPC11xx.h"

#include "core_cm0.h"
#include "IRQ_cortex.h"
#include "system_LPC11xx.h"

#elif defined LPC11U35 || defined LPC11U37
  #define ALT_SERIAL_DEBUG

  #include "LPC11Uxx.h"
  #include "IRQ_cortex.h"
  #include "system_LPC11Uxx.h"

#elif (defined LPC11U67) || (defined LPC11U68)
  #define ALT_SERIAL_DEBUG

  #include "LPC11U6x.h"
  #include "IRQ_cortex.h"
  #include "system_LPC11U6x.h"

#elif defined LPC15xx

#include "LPC15xx.h"

#include "core_cm3.h"
#include "IRQ_cortex.h"
#include "system_LPC15xx.h"

#elif defined LPC2103 || defined LPC2138

#include "LPC21xx.h"

#include "IRQ_arm7.h"
#include "system_LPC21xx.h"

#elif defined OTEST 

#include "OTEST.h"

#include "IRQ_cortex.h"
#include "system_LPC43xx.h"		// mostly empty startup

#elif defined LPC4330 || defined LPC4337

 #ifdef CORE_M0a
 #include "LPC43xx_M0.h"
 #elif defined CORE_M0s
 #include "LPC43xx_M0s.h"
 #else
   #ifndef CORE_M4
	#define CORE_M4
   #endif
 #endif
 #include "LPC43xx.h"

 #include "IRQ_cortex.h"
 #include "system_LPC43xx.h"

#elif defined MK20DX128

#define CORE_M4
#include "system_MK20DX128.h"
#include "core_cm4.h"
#include "IRQ_cortex.h"

#elif defined MK20DX256

#define CORE_M4
#include "system_MK20DX128.h" // same include file for both
#include "core_cm4.h"
#include "IRQ_cortex.h"

#elif defined LPC54102m0

 #include "LPC5410x.h"

 #include "system_LPC5410x.h" // same include file for both
 #include "core_cm0.h"
 #include "IRQ_cortex.h"

#elif defined LPC54102
 #include "LPC5410x.h"

 #include "system_LPC5410x.h" // same include file for both
 #include "core_cm4.h"
 #include "IRQ_cortex.h"
#else

 #error  Unsupported CPU
 
#endif


#if defined __CORTEX_M || defined CORTEX_M0 || defined CORTEX_M3 || defined CORTEX_M4	

 #include "systick.h"
 
#endif

//////////////////////////////////////////////////////////////
//
//   pseudo function calls here
//

#define CHECK_PARAM(x)				// disable this for now

#if defined ARMweb || defined SUPERweb || (defined CC3200)
  extern int g_echo_stuff;
  void tcpPutch(char ch);
  #define echo_char(x)	{tcpPutch(x); if(!g_echo_stuff) return x; }	// only echo to UART when debugging
#else
  #define echo_char(x)
#endif  



//////////////////////////////////////////////////////////////////////
//
// ARMmite, PRO and ARMexpress boards map the NXP defined P0.0 thru P0.31 to
// pins along the edge of the PCB that were convenient for the layout
//
// the trend of future boards is to just name them as NXP does, but to
// keep with earlier programs that take advantage of that remapping this set
// of definitions handles that -- note that it does require some overhead
//

#if (defined ARMmite) || (defined mitePRO) || (defined ARMexpLITE) || (defined ARMexpress)
 extern const char pinlist[];
 extern const int  pinmap[];	// this is available to improve performance
 
 #define remap(pin)  pinlist[pin]
#else
 #define remap(pin)  pin
#endif

int DIR(int pin) 	;		// read the pin direction - 1 = output
int IN(int pin) 	;		// read the pin			  - 1 = high

void INPUT(int pin)	;		// and now an input
void OUTPUT(int pin);		// and now an output
void HIGH(int pin) 	;		// set the pin high
void LOW(int pin) 	;		// clear the pin to low

void settimer(int time);
int adin(int channel);
void intsw(int enable);

#ifdef SysTick
 #define TIMER 			(micros())
#else
 #define TIMER			((int) LPC_TIM0->TC)
#endif


////////////////////////////////////////////////////////////////////////////////////
//
//   hacks for Yagarto 4.6.0  -- the list is growing...

#if (__GNUC__ == 4) && (__GNUC_MINOR__ == 6) // && (__GNUC_PATCHLEVEL__ == 0)
 #define main	main_embedded		// otherwise the linker sticks it in a strange place
#endif

// the following defined in coridium_pcb.c -- seems to make linker _sbrk and _unwind errors go away
//   char __aeabi_unwind_cpp_pr0[0];
//   

#endif
