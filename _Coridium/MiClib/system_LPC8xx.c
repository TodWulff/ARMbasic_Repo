/******************************************************************************
 * @file:    system_LPC8xx.c
 * @purpose: CMSIS Cortex-M0+ Device Peripheral Access Layer Source File
 *           for the NXP LPC8xx Device Series 
 * @version: V1.0
 * @date:    16. Aug. 2012
 *----------------------------------------------------------------------------
 *
 * Copyright (C) 2012 ARM Limited. All rights reserved.
 *
 * ARM Limited (ARM) is supplying this software for use with Cortex-M0+ 
 * processor based microcontrollers.  This file can be freely distributed 
 * within development tools that are supporting such ARM based processors. 
 *
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 ******************************************************************************/
#include <stdint.h>
#include "uart.h"
#include "LPC8xx.h"

#ifdef FOR_BASIC
  #include "basic.h"
  #include "basic_pcb.h"
#else
#endif

/*
//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
*/

/*--------------------- Clock Configuration ----------------------------------
//
// <e> Clock Configuration
//   <h> System Oscillator Control Register (SYSOSCCTRL)
//     <o1.0>      BYPASS: System Oscillator Bypass Enable
//                     <i> If enabled then PLL input (sys_osc_clk) is fed
//                     <i> directly from XTALIN and XTALOUT pins.
//     <o1.9>      FREQRANGE: System Oscillator Frequency Range
//                     <i> Determines frequency range for Low-power oscillator.
//                   <0=> 1 - 20 MHz
//                   <1=> 15 - 25 MHz
//   </h>
//
//   <h> Watchdog Oscillator Control Register (WDTOSCCTRL)
//     <o2.0..4>   DIVSEL: Select Divider for Fclkana
//                     <i> wdt_osc_clk = Fclkana/ (2 × (1 + DIVSEL))
//                   <0-31>
//     <o2.5..8>   FREQSEL: Select Watchdog Oscillator Analog Output Frequency (Fclkana)
//                   <0=> Undefined
//                   <1=> 0.5 MHz
//                   <2=> 0.8 MHz
//                   <3=> 1.1 MHz
//                   <4=> 1.4 MHz
//                   <5=> 1.6 MHz
//                   <6=> 1.8 MHz
//                   <7=> 2.0 MHz
//                   <8=> 2.2 MHz
//                   <9=> 2.4 MHz
//                   <10=> 2.6 MHz
//                   <11=> 2.7 MHz
//                   <12=> 2.9 MHz
//                   <13=> 3.1 MHz
//                   <14=> 3.2 MHz
//                   <15=> 3.4 MHz
//   </h>
//
//   <h> System PLL Control Register (SYSPLLCTRL)
//                   <i> F_clkout = M * F_clkin = F_CCO / (2 * P)
//                   <i> F_clkin must be in the range of  10 MHz to  25 MHz
//                   <i> F_CCO   must be in the range of 156 MHz to 320 MHz
//     <o3.0..4>   MSEL: Feedback Divider Selection
//                     <i> M = MSEL + 1
//                   <0-31>
//     <o3.5..6>   PSEL: Post Divider Selection
//                   <0=> P = 1
//                   <1=> P = 2
//                   <2=> P = 4
//                   <3=> P = 8
//   </h>
//
//   <h> System PLL Clock Source Select Register (SYSPLLCLKSEL)
//     <o4.0..1>   SEL: System PLL Clock Source
//                   <0=> IRC Oscillator
//                   <1=> System Oscillator
//                   <2=> Reserved
//                   <3=> CLKIN pin
//   </h>
//
//   <h> Main Clock Source Select Register (MAINCLKSEL)
//     <o5.0..1>   SEL: Clock Source for Main Clock
//                   <0=> IRC Oscillator
//                   <1=> Input Clock to System PLL
//                   <2=> WDT Oscillator
//                   <3=> System PLL Clock Out
//   </h>
//
//   <h> System AHB Clock Divider Register (SYSAHBCLKDIV)
//     <o6.0..7>   DIV: System AHB Clock Divider
//                     <i> Divides main clock to provide system clock to core, memories, and peripherals.
//                     <i> 0 = is disabled
//                   <0-255>
//   </h>
// </e>
*/
#define CLOCK_SETUP           1
#define SYSOSCCTRL_Val        0x00000000              // Reset: 0x000
#define WDTOSCCTRL_Val        0x00000000              // Reset: 0x000
#define SYSPLLCTRL_Val        0x44//00000041              // Reset: 0x000 _PPM MMMM
#define SYSPLLCLKSEL_Val      0 //0x00000001              // Reset: 0x000
#define MAINCLKSEL_Val        0x00000003              // Reset: 0x000
#define SYSAHBCLKDIV_Val      2//0x00000001              // Reset: 0x001
//51.625
/*--------------------- Memory Mapping Configuration -------------------------
//
// <e> Memory Mapping
//   <o1.0..1> System Memory Remap (Register: SYSMEMREMAP)
//                     <0=> Bootloader mapped to address 0
//                     <1=> RAM mapped to address 0
//                     <2=> Flash mapped to address 0
//                     <3=> Flash mapped to address 0
// </e>
*/
#define MEMMAP_SETUP          1				
#define SYSMEMREMAP_Val       0x00000001

/*
//-------- <<< end of configuration section >>> ------------------------------
*/

/*----------------------------------------------------------------------------
  Check the register settings
 *----------------------------------------------------------------------------*/
#define CHECK_RANGE(val, min, max)                ((val < min) || (val > max))
#define CHECK_RSVD(val, mask)                     (val & mask)

/* Clock Configuration -------------------------------------------------------*/
#if (CHECK_RSVD((SYSOSCCTRL_Val),  ~0x00000003))
   #error "SYSOSCCTRL: Invalid values of reserved bits!"
#endif

#if (CHECK_RSVD((WDTOSCCTRL_Val),  ~0x000001FF))
   #error "WDTOSCCTRL: Invalid values of reserved bits!"
#endif

#if (CHECK_RANGE((SYSPLLCLKSEL_Val), 0, 3))
   #error "SYSPLLCLKSEL: Value out of range!"
#endif

#if (CHECK_RSVD((SYSPLLCTRL_Val),  ~0x000001FF))
   #error "SYSPLLCTRL: Invalid values of reserved bits!"
#endif

#if (CHECK_RSVD((MAINCLKSEL_Val),  ~0x00000003))
   #error "MAINCLKSEL: Invalid values of reserved bits!"
#endif

#if (CHECK_RANGE((SYSAHBCLKDIV_Val), 0, 255))
   #error "SYSAHBCLKDIV: Value out of range!"
#endif


/*----------------------------------------------------------------------------
  DEFINES
 *----------------------------------------------------------------------------*/
    
/*----------------------------------------------------------------------------
  Define clocks
 *----------------------------------------------------------------------------*/
#define __XTAL            (12000000UL)    /* Oscillator frequency             */
#define __SYS_OSC_CLK     (    __XTAL)    /* Main oscillator frequency        */
#define __IRC_OSC_CLK     (12000000UL)    /* Internal RC oscillator frequency */
#define __FRO_OSC_CLK     (12000000UL)    /* Internal FRO oscillator frequency */
#define __CLKIN_CLK       (12000000UL)    /* CLKIN pin frequency              */


#define __FREQSEL   ((WDTOSCCTRL_Val >> 5) & 0x0F)
#define __DIVSEL   (((WDTOSCCTRL_Val & 0x1F) << 1) + 2)

#if (CLOCK_SETUP)                         /* Clock Setup              */
  #if  (__FREQSEL ==  0)
    #define __WDT_OSC_CLK        ( 0)                  /* undefined */
  #elif (__FREQSEL ==  1)
    #define __WDT_OSC_CLK        ( 500000 / __DIVSEL)
  #elif (__FREQSEL ==  2)
    #define __WDT_OSC_CLK        ( 800000 / __DIVSEL)
  #elif (__FREQSEL ==  3)
    #define __WDT_OSC_CLK        (1100000 / __DIVSEL)
  #elif (__FREQSEL ==  4)
    #define __WDT_OSC_CLK        (1400000 / __DIVSEL)
  #elif (__FREQSEL ==  5)
    #define __WDT_OSC_CLK        (1600000 / __DIVSEL)
  #elif (__FREQSEL ==  6)
    #define __WDT_OSC_CLK        (1800000 / __DIVSEL)
  #elif (__FREQSEL ==  7)
    #define __WDT_OSC_CLK        (2000000 / __DIVSEL)
  #elif (__FREQSEL ==  8)
    #define __WDT_OSC_CLK        (2200000 / __DIVSEL)
  #elif (__FREQSEL ==  9)
    #define __WDT_OSC_CLK        (2400000 / __DIVSEL)
  #elif (__FREQSEL == 10)
    #define __WDT_OSC_CLK        (2600000 / __DIVSEL)
  #elif (__FREQSEL == 11)
    #define __WDT_OSC_CLK        (2700000 / __DIVSEL)
  #elif (__FREQSEL == 12)
    #define __WDT_OSC_CLK        (2900000 / __DIVSEL)
  #elif (__FREQSEL == 13)
    #define __WDT_OSC_CLK        (3100000 / __DIVSEL)
  #elif (__FREQSEL == 14)
    #define __WDT_OSC_CLK        (3200000 / __DIVSEL)
  #else
    #define __WDT_OSC_CLK        (3400000 / __DIVSEL)
  #endif

  /* sys_pllclkin calculation */
  #if   ((SYSPLLCLKSEL_Val & 0x03) == 0)
    #define __SYS_PLLCLKIN           (__IRC_OSC_CLK)
  #elif ((SYSPLLCLKSEL_Val & 0x03) == 1)
    #define __SYS_PLLCLKIN           (__SYS_OSC_CLK)
  #elif ((SYSPLLCLKSEL_Val & 0x03) == 3)
    #define __SYS_PLLCLKIN           (__CLKIN_CLK)
  #else
    #define __SYS_PLLCLKIN           (0)
  #endif

  #define  __SYS_PLLCLKOUT         (__SYS_PLLCLKIN * ((SYSPLLCTRL_Val & 0x01F) + 1))

  /* main clock calculation */
  #if   ((MAINCLKSEL_Val & 0x03) == 0)
    #define __MAIN_CLOCK             (__IRC_OSC_CLK)
  #elif ((MAINCLKSEL_Val & 0x03) == 1)
    #define __MAIN_CLOCK             (__SYS_PLLCLKIN)
  #elif ((MAINCLKSEL_Val & 0x03) == 2)
    #if (__FREQSEL ==  0)
      #error "MAINCLKSEL: WDT Oscillator selected but FREQSEL is undefined!"
    #else
      #define __MAIN_CLOCK           (__WDT_OSC_CLK)
    #endif
  #elif ((MAINCLKSEL_Val & 0x03) == 3)
    #define __MAIN_CLOCK             (__SYS_PLLCLKOUT)
  #else
    #define __MAIN_CLOCK             (0)
  #endif

  #define __SYSTEM_CLOCK             (__MAIN_CLOCK / SYSAHBCLKDIV_Val)         

#else
  #define __SYSTEM_CLOCK             (__IRC_OSC_CLK)
#endif  // CLOCK_SETUP 


/*----------------------------------------------------------------------------
  Clock Variable definitions
 *----------------------------------------------------------------------------*/
//uint32_t SystemCoreClock = __SYSTEM_CLOCK;/*!< System Clock Frequency (Core Clock)*/
int SystemCoreClock = __SYSTEM_CLOCK;/*!< System Clock Frequency (Core Clock)*/



/*----------------------------------------------------------------------------
  Clock functions
 *----------------------------------------------------------------------------*/
void SystemCoreClockUpdate (void)            /* Get Core Clock Frequency      */
{
#ifdef THIS_CODE_IS_RIDICULOUS // bte 0
  uint32_t wdt_osc = 0;

  /* Determine clock frequency according to clock register values             */
  switch ((LPC_SYSCON->WDTOSCCTRL >> 5) & 0x0F) {
    case 0:  wdt_osc =       0; break;
    case 1:  wdt_osc =  500000; break;
    case 2:  wdt_osc =  800000; break;
    case 3:  wdt_osc = 1100000; break;
    case 4:  wdt_osc = 1400000; break;
    case 5:  wdt_osc = 1600000; break;
    case 6:  wdt_osc = 1800000; break;
    case 7:  wdt_osc = 2000000; break;
    case 8:  wdt_osc = 2200000; break;
    case 9:  wdt_osc = 2400000; break;
    case 10: wdt_osc = 2600000; break;
    case 11: wdt_osc = 2700000; break;
    case 12: wdt_osc = 2900000; break;
    case 13: wdt_osc = 3100000; break;
    case 14: wdt_osc = 3200000; break;
    case 15: wdt_osc = 3400000; break;
  }
  wdt_osc /= ((LPC_SYSCON->WDTOSCCTRL & 0x1F) << 1) + 2;
 
  switch (LPC_SYSCON->MAINCLKSEL & 0x03) {
    case 0:                             /* Internal RC oscillator             */
      SystemCoreClock = __IRC_OSC_CLK;
      break;
    case 1:                             /* Input Clock to System PLL          */
      switch (LPC_SYSCON->SYSPLLCLKSEL & 0x03) {
          case 0:                       /* Internal RC oscillator             */
            SystemCoreClock = __IRC_OSC_CLK;
            break;
          case 1:                       /* System oscillator                  */
            SystemCoreClock = __SYS_OSC_CLK;
            break;
          case 2:                       /* Reserved                           */
            SystemCoreClock = 0;
            break;
          case 3:                       /* CLKIN pin                          */
            SystemCoreClock = __CLKIN_CLK;
            break;
      }
      break;
    case 2:                             /* WDT Oscillator                     */
      SystemCoreClock = wdt_osc;
      break;
    case 3:                             /* System PLL Clock Out               */
      switch (LPC_SYSCON->SYSPLLCLKSEL & 0x03) {
          case 0:                       /* Internal RC oscillator             */
            SystemCoreClock = __IRC_OSC_CLK * ((LPC_SYSCON->SYSPLLCTRL & 0x01F) + 1);
            break;
          case 1:                       /* System oscillator                  */
            SystemCoreClock = __SYS_OSC_CLK * ((LPC_SYSCON->SYSPLLCTRL & 0x01F) + 1);
            break;
          case 2:                       /* Reserved                           */
            SystemCoreClock = 0;
            break;
          case 3:                       /* CLKIN pin                          */
            SystemCoreClock = __CLKIN_CLK * ((LPC_SYSCON->SYSPLLCTRL & 0x01F) + 1);
            break;
      }
      break;
  }

  SystemCoreClock /= LPC_SYSCON->SYSAHBCLKDIV;  

#else

  int ahbdiv;
#ifndef LPC802
// put back for 812, needs testing else where
  SystemCoreClock = __IRC_OSC_CLK * ((LPC_SYSCON->SYSPLLCTRL & 0x01F) + 1);
//MAR SystemCoreClock = __FRO_OSC_CLK >> 2;
//  set_fro_frequency(30000);
//  (* (void *){)(30000);
#else
  SystemCoreClock = 12000000;
#endif
  ahbdiv = LPC_SYSCON->SYSAHBCLKDIV;
  
  SystemCoreClock /= ahbdiv;  
#endif  

}

/**
 * Initialize the system
 *
 * @param  none
 * @return none
 *
 * @brief  Setup the microcontroller system.
 *         Initialize the System.
 */
void SystemInit (void) {
  //volatile uint32_t i;
  //uint32_t regVal;
  
// NOTE: these are the System clock control bits and the default values
//1 ROM Enables clock for ROM. 1
//2 RAM Enables clock for SRAM. 1
//3 FLASHREG Enables clock for flash register interface. 1
//4 FLASH Enables clock for flash. 1
//5 I2C Enables clock. 0
//6 GPIO Enables clock for GPIO port registers and GPIO pin interrupt registers. 0
//7 SWM Enables clock for switch matrix. 0
//8 SCT Enables clock for state configurable timer. 0
//9 WKT Enables clock for self wake-up timer. 0
//10 MRT Enables clock for multi-rate timer. 0
//11 SPI0 Enables clock for SPI0. 0
//12 SPI1 Enables clock for SPI1. 0
//13 CRC Enables clock for CRC. 0
//14 UART0 Enables clock for USART0. 0
//15 UART1 Enables clock for USART1. 0
//16 UART2 Enables clock for USART2. 0
//17 WWDT Enables clock for WWDT. 0
//18 IOCON Enables clock for IOCON block. 0
//19 ACMP Enables clock to analog comparator. 0
//20 
//21 I2C1
//22 I2C2
//23 I2C3
//24 ADC
//25 
//26 MTB Enables clock to micro-trace buffer control registers
//27 
//28 
//29 DNA

  /* System clock to the IOCON & the SWM need to be enabled or
  most of the I/O related peripherals won't work. */
//Also enable GPIO
  LPC_SYSCON->SYSAHBCLKCTRL |= ( (1<<7) | (1<<18) | (1<<6) );
	
#ifndef LPC802                                 /* Clock Setup              */
#if (CLOCK_SETUP)                                 /* Clock Setup              */

 #if ((SYSPLLCLKSEL_Val & 0x03) == 1)
  LPC_IOCON->PIO0_8 &= ~(0x3 << 3);
  LPC_IOCON->PIO0_9 &= ~(0x3 << 3);
  LPC_SWM->PINENABLE0 &= ~(0x3 << 4);
  LPC_SYSCON->PDRUNCFG     &= ~(0x1 << 5);        /* Power-up System Osc      */
  LPC_SYSCON->SYSOSCCTRL    = SYSOSCCTRL_Val;
  for (i = 0; i < 200; i++) __NOP();
 #endif
 
 #if ((SYSPLLCLKSEL_Val & 0x03) == 3)
  LPC_IOCON->PIO0_1 &= ~(0x3 << 3);
  LPC_SWM->PINENABLE0 &= ~(0x1 << 7);
  for (i = 0; i < 200; i++) __NOP();
 #endif

  LPC_SYSCON->SYSPLLCLKSEL  = SYSPLLCLKSEL_Val;   /* Select PLL Input         */
  LPC_SYSCON->SYSPLLCLKUEN  = 0x01;								/* Update Clock Source      */
  while (!(LPC_SYSCON->SYSPLLCLKUEN & 0x01));     /* Wait Until Updated       */
 
 #if ((MAINCLKSEL_Val & 0x03) == 3)                /* Main Clock is PLL Out    */
  LPC_SYSCON->SYSPLLCTRL    = SYSPLLCTRL_Val;
  LPC_SYSCON->PDRUNCFG     &= ~(0x1 << 7);        /* Power-up SYSPLL          */
  while (!(LPC_SYSCON->SYSPLLSTAT & 0x01));	      /* Wait Until PLL Locked    */
 #endif

 #if (((MAINCLKSEL_Val & 0x03) == 2) )
  LPC_SYSCON->WDTOSCCTRL    = WDTOSCCTRL_Val;
  LPC_SYSCON->PDRUNCFG     &= ~(0x1 << 6);        /* Power-up WDT Clock       */
  for (i = 0; i < 200; i++) __NOP();
 #endif

  LPC_SYSCON->MAINCLKSEL    = MAINCLKSEL_Val;     /* Select PLL Clock Output  */
  LPC_SYSCON->MAINCLKUEN    = 0x01;								/* Update MCLK Clock Source */
  while (!(LPC_SYSCON->MAINCLKUEN & 0x01));       /* Wait Until Updated       */

  LPC_SYSCON->SYSAHBCLKDIV  = SYSAHBCLKDIV_Val;

#endif

#if (MEMMAP_SETUP || MEMMAP_INIT)			 /* Memory Mapping Setup							 */
  #ifdef FOR_BASIC
	MEMCPY ((void *) 0x10000000, (void *) 0x00000000, 0x200);	// copy Flash vectors+stackstart plus all the remap area into RAM
  #else
	char *pDst, *pSrc; 
	int i;
	//this could be more efficient using unsigned int* and i+=4 but its only done once
	pDst = (char *)0x10000000;
	pSrc = (char *)0;
	for (i = 0; i < (0x200); i++)
		*pDst++ = *pSrc++;
  #endif
	LPC_SYSCON->SYSMEMREMAP = SYSMEMREMAP_Val;
#endif
#endif

#ifdef LPC802
	LPC_SYSCON->UARTCLKSEL[0] = 2;		// Main clock to UART from FRG0
	LPC_SYSCON->UARTFRGSEL = 0;				// Main clock to FRO
	LPC_SYSCON->UARTFRGMULT = 0;
	LPC_SYSCON->UARTFRGDIV = 0;
#else
	LPC_SYSCON->UARTCLKDIV = 2;		
#endif

	SystemCoreClockUpdate();

	// disable JTAG pin functions SWCLK_EN on PIO_3, SWDIO_EN on PIO_2
#ifdef LPC824
	LPC_SWM->PINENABLE0 |= (1<<4)|(1<<5);
#else
	LPC_SWM->PINENABLE0 |= (1<<2)|(1<<3);
#endif
}

#ifdef LPC824
void IO2AD(int chan){
	int i;
	
	switch ( chan )	// No Pull-up or Pull-down
	{
	case 2 : LPC_IOCON->PIO0_14 = 0; // AD2
	case 3 : LPC_IOCON->PIO0_23 = 0; // AD3
	case 9 : LPC_IOCON->PIO0_17 = 0; // AD9
	case 10: LPC_IOCON->PIO0_13 = 0; // AD10
	default: return;
	}

	i = chan + 13;
	LPC_SWM->PINENABLE0 &= ~(1 << i); // enable the pin function
}
#endif

#ifdef FOR_BASIC
extern short f_table[];

int startUserCode(int isRUNcommand) {
	int ch;

	// check to see if code is valid
	
	if (((*(unsigned int *) (f_table[4]<<4)) == 0xFFFFFFFF) || ((*(unsigned int *) (f_table[4]<<4)) == 0)){
		return 0;
	}
	
	if (isRUNcommand != 0) {	
	    return 1;
    } else {					// got here on RESET/Power on/Fault/BOD/WDT
	
  #ifdef INSERT_USERNAME
		if (checkNameValid() != (* (int *) 0x01f4 & 0xffff)) return 0;		// check for a valid firmware copy 
  #endif
		
	 #ifdef UART_NOBUFFER	
		return 0;				// don't restart on reset for this test mode
		
	 #else
		// if we got here and the reset indicators show false, and not RUN command then its a Fault IRQ restart, so return 0
		if (LPC_SYSCON->SYSRSTSTAT & 0x3) {	// power on or reset occurred
			LPC_SYSCON->SYSRSTSTAT = 0x3;		// clear those reset indicators 
		} else if (LPC_SYSCON->SYSRSTSTAT & 0xC) {	// watchdog or brown out-- user code must have enabled it so go the the user code
		} else {
			return 0;			// must have got here by Fault ISR
		}	
	  #endif	
	}	
		
	delay_ms(BREAK_WAIT);
	
	while ((ch = getchar()) != -1) {
	    if ((ch == ESC) || (ch == CTRLC)) {
		    return 0;
	    }
    }

	// if we got here its good to go	
	return 1;	
}	
#endif


// NOTE: for LPC824 RESET is still PIO0_5 but physical pin 5 instead of 4

// LPC824 physical pins
// 1  PIO0_23/ADC_3/ACMP_I4
// 2  PIO0_17/ADC_9           
// 3  PIO0_13/ADC_10          
// 4  PIO0_12              
// 5  RESET/PIO0_5              
// 6  PIO0_4/ADC_11/WAKEUP/TRST 
// 7  SWCLK/PIO0_3/TCK          
// 8  SWDIO/PIO0_2/TMS          
// 9  PIO0_11/I2C0_SDA          
// 10 PIO0_10/I2C0_SCL          
// 11 PIO0_15
// 12 PIO0_1/ACMP_I2/CLKIN/TDI
// 13 PIO0_9/XTALOUT
// 14 PIO0_8/XTALIN
// 15 VDD
// 16 VSS
// 17 VREFN
// 18 VREFP
// 19 PIO0_0/ACMP_I1/TDO
// 20 PIO0_14/ADC_2/ACMP_I3

// LPC812 physical pins
// 1  PIO0_17          
// 2  PIO0_13            
// 3  PIO0_12            
// 4  RESET/PIO0_5              
// 5  PIO0_4/WAKEUP/TRST              
// 6  SWCLK/PIO0_3/TCK   
// 7  SWDIO/PIO0_2/TMS          
// 8  PIO0_11/I2C0_SDA          
// 9  PIO0_10/I2C0_SCL          
// 10 PIO0_16        
// 11 PIO0_15
// 12 PIO0_1/ACMP_I2/CLKIN/TDI
// 13 PIO0_9/XTALOUT
// 14 PIO0_8/XTALIN
// 15 VDD
// 16 VSS
// 17 PIO0_07
// 18 PIO0_06/VDDCMP
// 19 PIO0_0/ACMP_I1/TDO
// 20 PIO0_14
