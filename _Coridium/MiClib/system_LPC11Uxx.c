/******************************************************************************
 * @file     system_LPC11U3Uxx.c
 * @purpose  CMSIS Cortex-M3 Device Peripheral Access Layer Source File
 *           for the NXP LPC13xx Device Series
 * @version  V1.10
 * @date     24. November 2010
 *
 * @note
 * Copyright (C) 2009-2010 ARM Limited. All rights reserved.
 *
 * @par
 * ARM Limited (ARM) is supplying this software for use with Cortex-M 
 * processor based microcontrollers.  This file can be freely distributed 
 * within development tools that are supporting such ARM based processors. 
 *
 * @par
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 ******************************************************************************/


#include <stdint.h>
#include "uart.h"
#include "adc.h"
#include "LPC11Uxx.h"

#include "usbd.h"
#include "usbd_rom_api.h"
#include "usb.h"

extern void USB_init(void);

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
//                   <3=> Reserved
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
//
//   <h> USB PLL Control Register (USBPLLCTRL)
//                   <i> F_clkout = M * F_clkin = F_CCO / (2 * P)
//                   <i> F_clkin must be in the range of  10 MHz to  25 MHz
//                   <i> F_CCO   must be in the range of 156 MHz to 320 MHz
//     <o7.0..4>   MSEL: Feedback Divider Selection
//                     <i> M = MSEL + 1
//                   <0-31>
//     <o7.5..6>   PSEL: Post Divider Selection
//                   <0=> P = 1
//                   <1=> P = 2
//                   <2=> P = 4
//                   <3=> P = 8
//   </h>
//
//   <h> USB PLL Clock Source Select Register (USBPLLCLKSEL)
//     <o8.0..1>   SEL: USB PLL Clock Source
//                     <i> USB PLL clock source must be switched to System Oscillator for correct USB operation
//                   <0=> IRC Oscillator
//                   <1=> System Oscillator
//                   <2=> Reserved
//                   <3=> Reserved
//   </h>
//
//   <h> USB Clock Source Select Register (USBCLKSEL)
//     <o9.0..1>   SEL: USB Clock Source
//                   <0=> USB PLL out
//                   <1=> Main clock
//                   <2=> Reserved
//                   <3=> Reserved
//   </h>
//
//   <h> USB Clock Divider Register (USBCLKDIV)
//     <o10.0..7>  DIV: USB Clock Divider
//                     <i> Divides USB clock to 48 MHz.
//                     <i> 0 = is disabled
//                   <0-255>
//   </h>
// </e>
*/
#define CLOCK_SETUP           1
#define SYSOSCCTRL_Val        0x00000000              // Reset: 0x000
#define WDTOSCCTRL_Val        0x00000000              // Reset: 0x000
#define SYSPLLCTRL_Val        0x00000023              // Reset: 0x000
#define SYSPLLCLKSEL_Val      0x00000001              // Reset: 0x000
#define MAINCLKSEL_Val        0x00000003              // Reset: 0x000
#define SYSAHBCLKDIV_Val      0x00000001              // Reset: 0x001
#define USBPLLCTRL_Val        0x00000023              // Reset: 0x000
#define USBPLLCLKSEL_Val      0x00000001              // Reset: 0x000
#define USBCLKSEL_Val         0x00000000              // Reset: 0x000
#define USBCLKDIV_Val         0x00000001              // Reset: 0x001

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

#if (CHECK_RANGE((SYSPLLCLKSEL_Val), 0, 2))
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

#if (CHECK_RANGE((USBPLLCLKSEL_Val), 0, 1))
   #error "USBPLLCLKSEL: Value out of range!"
#endif

#if (CHECK_RSVD((USBPLLCTRL_Val),  ~0x000001FF))
   #error "USBPLLCTRL: Invalid values of reserved bits!"
#endif

#if (CHECK_RANGE((USBCLKSEL_Val), 0, 1))
   #error "USBCLKSEL: Value out of range!"
#endif

#if (CHECK_RANGE((USBCLKDIV_Val), 0, 255))
   #error "USBCLKDIV: Value out of range!"
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
uint32_t SystemCoreClock = __SYSTEM_CLOCK;/*!< System Clock Frequency (Core Clock)*/


/*----------------------------------------------------------------------------
  Clock functions
 *----------------------------------------------------------------------------*/
void SystemCoreClockUpdate (void)            /* Get Core Clock Frequency      */
{
  SystemCoreClock = 48000000;//MAR
  
//  unsigned int wdt_osc = 0;

//  /* Determine clock frequency according to clock register values             */
//  switch ((LPC_SYSCON->WDTOSCCTRL >> 5) & 0x0F) {
//    case 0:  wdt_osc =       0; break;
//    case 1:  wdt_osc =  500000; break;
//    case 2:  wdt_osc =  800000; break;
//    case 3:  wdt_osc = 1100000; break;
//    case 4:  wdt_osc = 1400000; break;
//    case 5:  wdt_osc = 1600000; break;
//    case 6:  wdt_osc = 1800000; break;
//    case 7:  wdt_osc = 2000000; break;
//    case 8:  wdt_osc = 2200000; break;
//    case 9:  wdt_osc = 2400000; break;
//    case 10: wdt_osc = 2600000; break;
//    case 11: wdt_osc = 2700000; break;
//    case 12: wdt_osc = 2900000; break;
//    case 13: wdt_osc = 3100000; break;
//    case 14: wdt_osc = 3200000; break;
//    case 15: wdt_osc = 3400000; break;
//  }
//  wdt_osc /= ((LPC_SYSCON->WDTOSCCTRL & 0x1F) << 1) + 2;
// 
//  switch (LPC_SYSCON->MAINCLKSEL & 0x03) {
//    case 0:                             /* Internal RC oscillator             */
//      SystemCoreClock = __IRC_OSC_CLK;
//      break;
//    case 1:                             /* Input Clock to System PLL          */
//      switch (LPC_SYSCON->SYSPLLCLKSEL & 0x03) {
//          case 0:                       /* Internal RC oscillator             */
//            SystemCoreClock = __IRC_OSC_CLK;
//            break;
//          case 1:                       /* System oscillator                  */
//            SystemCoreClock = __SYS_OSC_CLK;
//            break;
//          case 2:                       /* Reserved                           */
//          case 3:                       /* Reserved                           */
//            SystemCoreClock = 0;
//            break;
//      }
//      break;
//    case 2:                             /* WDT Oscillator                     */
//      SystemCoreClock = wdt_osc;
//      break;
//    case 3:                             /* System PLL Clock Out               */
//      switch (LPC_SYSCON->SYSPLLCLKSEL & 0x03) {
//          case 0:                       /* Internal RC oscillator             */
//            if (LPC_SYSCON->SYSPLLCTRL & 0x180) {
//              SystemCoreClock = __IRC_OSC_CLK;
//            } else {
//              SystemCoreClock = __IRC_OSC_CLK * ((LPC_SYSCON->SYSPLLCTRL & 0x01F) + 1);
//            }
//            break;
//          case 1:                       /* System oscillator                  */
//            if (LPC_SYSCON->SYSPLLCTRL & 0x180) {
//              SystemCoreClock = __SYS_OSC_CLK;
//            } else {
//              SystemCoreClock = __SYS_OSC_CLK * ((LPC_SYSCON->SYSPLLCTRL & 0x01F) + 1);
//            }
//            break;
//          case 2:                       /* Reserved                           */
//          case 3:                       /* Reserved                           */
//            SystemCoreClock = 0;
//            break;
//      }
//      break;
//  }

//  SystemCoreClock /= LPC_SYSCON->SYSAHBCLKDIV;  

}

extern void * MEMCPY(void *dst0, void *src0, int len0);

/**
 *		set IO to defaults
 *
 *         -- this will also be called by USB generate "reset" -- actually just a restart
 *
*/

#define MAX_IO	63 // ??

void defaultIOsetup(void) {
#warning -- why do we need UART0 IRQ enabled???
	NVIC->ICER[0] = ~((1 << UART0_IRQn) | (1 << USB_IRQn));	  // turn off all interrupts except UART0 and USB

	LPC_IOCON->PIO0_1        = (LPC_IOCON->PIO0_1        & 0xFFFFFFFC);
	LPC_IOCON->PIO0_2        = (LPC_IOCON->PIO0_2        & 0xFFFFFFFC);
	LPC_IOCON->PIO0_3        = (LPC_IOCON->PIO0_3        & 0xFFFFFFFC);
	LPC_IOCON->PIO0_4        = (LPC_IOCON->PIO0_4        & 0xFFFFFFFC);
	LPC_IOCON->PIO0_5        = (LPC_IOCON->PIO0_5        & 0xFFFFFFFC);
	LPC_IOCON->PIO0_6        = (LPC_IOCON->PIO0_6        & 0xFFFFFFFC);
	LPC_IOCON->PIO0_7        = (LPC_IOCON->PIO0_7        & 0xFFFFFFFC);
	LPC_IOCON->PIO0_8        = (LPC_IOCON->PIO0_8        & 0xFFFFFFFC);
	LPC_IOCON->PIO0_9        = (LPC_IOCON->PIO0_9        & 0xFFFFFFFC);
	LPC_IOCON->TDI_PIO0_11   = (LPC_IOCON->TDI_PIO0_11   & 0xFFFFFFFC) | 1;
	LPC_IOCON->TMS_PIO0_12   = (LPC_IOCON->TMS_PIO0_12   & 0xFFFFFFFC) | 1;
	LPC_IOCON->TDO_PIO0_13   = (LPC_IOCON->TDO_PIO0_13   & 0xFFFFFFFC) | 1;
	LPC_IOCON->TRST_PIO0_14  = (LPC_IOCON->TRST_PIO0_14  & 0xFFFFFFFC) | 1;
#ifdef TESTING
	LPC_IOCON->SWCLK_PIO0_10 = (LPC_IOCON->SWCLK_PIO0_10 & 0xFFFFFFFC);			// let the SW debugger pins be debugger pins
	LPC_IOCON->SWDIO_PIO0_15 = (LPC_IOCON->SWDIO_PIO0_15 & 0xFFFFFFFC);
#else
	LPC_IOCON->SWCLK_PIO0_10 = (LPC_IOCON->SWCLK_PIO0_10 & 0xFFFFFFFC) | 1;
	LPC_IOCON->SWDIO_PIO0_15 = (LPC_IOCON->SWDIO_PIO0_15 & 0xFFFFFFFC) | 1;
#endif
	LPC_IOCON->PIO0_16       = (LPC_IOCON->PIO0_16       & 0xFFFFFFFC);
	LPC_IOCON->PIO0_17       = (LPC_IOCON->PIO0_17       & 0xFFFFFFFC);
	LPC_IOCON->PIO0_18       = (LPC_IOCON->PIO0_18       & 0xFFFFFFFC);
	LPC_IOCON->PIO0_19       = (LPC_IOCON->PIO0_19       & 0xFFFFFFFC);
	LPC_IOCON->PIO0_20       = (LPC_IOCON->PIO0_20       & 0xFFFFFFFC);
	LPC_IOCON->PIO0_21       = (LPC_IOCON->PIO0_21       & 0xFFFFFFFC);
	LPC_IOCON->PIO0_22       = (LPC_IOCON->PIO0_22       & 0xFFFFFFFC);
	LPC_IOCON->PIO0_23       = (LPC_IOCON->PIO0_23       & 0xFFFFFFFC);

	LPC_IOCON->PIO1_13       = (LPC_IOCON->PIO1_13       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_14       = (LPC_IOCON->PIO1_14       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_15       = (LPC_IOCON->PIO1_15       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_16       = (LPC_IOCON->PIO1_16       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_19       = (LPC_IOCON->PIO1_19       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_20       = (LPC_IOCON->PIO1_20       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_21       = (LPC_IOCON->PIO1_21       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_22       = (LPC_IOCON->PIO1_22       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_23       = (LPC_IOCON->PIO1_23       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_24       = (LPC_IOCON->PIO1_24       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_25       = (LPC_IOCON->PIO1_25       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_26       = (LPC_IOCON->PIO1_26       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_27       = (LPC_IOCON->PIO1_27       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_28       = (LPC_IOCON->PIO1_28       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_29       = (LPC_IOCON->PIO1_29       & 0xFFFFFFFC);
	LPC_IOCON->PIO1_31       = (LPC_IOCON->PIO1_31       & 0xFFFFFFFC);
	
	LPC_GPIO->DIR[0] = 0x00000002;		// make them inputs -- except LED
	LPC_GPIO->DIR[1] = 0x00000000;		// make them inputs
	
}

/**
 *    setup a soft reset, by saving SP and LR and jump to it later
 *
 */

/**
 * Initialize the system
 *
 * @param  none
 * @return none
 *
 * @brief  Setup the microcontroller system.
 *         Initialize the System.
 */

void moveSysTickIRQ(void);
 
unsigned int saveLR;	// LR for SoftReset saved here, SP set back based on value at 0x0004

// and use it here

void __attribute__ ((aligned(4))) gotoSoftReset(void) {		
	putchar(EOTX);			// this tells BT that the user code has stopped -- startuser below will then send SOH to show it starts	
	delay_ms(100);
	defaultIOsetup();

	asm(" movs	r0,#0");
	asm(" ldr   r1,[r0, #0]");
	asm(" mov	r13,r1");
	asm(" ldr	r0,[pc, #8]");
	asm(" ldr   r1,[r0, #0]");
	asm(" push	{r1}");
	asm(" push	{r1}");
	asm(" b		SRret");
	asm(" nop");
	asm(" .word	saveLR");
	asm("SRret:	");
}
 
void SystemInit (void){
	
	/* Powerup main oscillator */
	LPC_SYSCON->PDRUNCFG &= ~(1<<5);

	/* Wait 200us for OSC to be stablized, no status indication, dummy wait. */
	volatile int i;
	for (i = 0; i < 0x200; i++) {}		// this failed on 1 board at 0x100

	/* Set system PLL input to main oscillator */
	LPC_SYSCON->SYSPLLCLKSEL  = 1;
	LPC_SYSCON->SYSPLLCLKUEN  = 0;
	LPC_SYSCON->SYSPLLCLKUEN  = 1;

	/* Power down PLL to change the PLL divider ratio */
	LPC_SYSCON->PDRUNCFG |= (1<<7);		// this hangs up on one part I have -- see delay note above

	/* Setup PLL for main oscillator rate (FCLKIN = 12MHz) * 4 = 48MHz
	   MSEL = 3 (this is pre-decremented), PSEL = 1 (for P = 2)
	   FCLKOUT = FCLKIN * (MSEL + 1) = 12MHz * 4 = 48MHz
	   FCCO = FCLKOUT * 2 * P = 48MHz * 2 * 2 = 192MHz (within FCCO range) */
	LPC_SYSCON->SYSPLLCTRL = 3 | (1 << 5);

	/* Powerup system PLL */
	LPC_SYSCON->PDRUNCFG &= ~(1<<7);

	/* Wait for PLL to lock */
	while (!(LPC_SYSCON->SYSPLLSTAT & 0x01));

	/* Set system clock divider to 1 */
	LPC_SYSCON->SYSAHBCLKDIV  = 1;

	/* FLASH access is 3 clocks by default */
	// NOTE TO MIKE in case WriteFlash is a problem

	/* Set main clock source to the system PLL. This will drive 48MHz
	   for the main clock and 48MHz for the system clock */
	LPC_SYSCON->MAINCLKSEL  = 3;
	LPC_SYSCON->MAINCLKUEN  = 0;
	LPC_SYSCON->MAINCLKUEN  = 1;

	/* Set USB PLL input to  main oscillator */
	LPC_SYSCON->USBPLLCLKSEL  = 1;
	LPC_SYSCON->USBPLLCLKUEN  = 0;
	LPC_SYSCON->USBPLLCLKUEN  = 1;

	/* Setup USB PLL same as main above */
	LPC_SYSCON->USBPLLCTRL = 3 | (1 << 5);

	/* Powerup USB PLL */
	LPC_SYSCON->PDRUNCFG &= ~(1<<8);

	/* Wait for PLL to lock */
	while (!(LPC_SYSCON->USBPLLSTAT & 0x01));

	/* Enable IOCON and I/OH SRAM (SRAM1) clocks */
	LPC_SYSCON->SYSAHBCLKCTRL |= ( (1 << 16) | (1 << 26) );
	
  #ifdef FOR_BASIC
  	MEMCPY ((void *) 0x10000000, (void *) 0x00000000, 0x200);	// copy Flash vectors+stackstart plus all the remap area into RAM
  #else
  	char *pDst, *pSrc; 
  	//this could be more efficient using unsigned int* and i+=4 but its only done once
  	pDst = (char *)0x10000000;
  	pSrc = (char *)0;
  	for (i = 0; i < (0xC0); i++)
  		*pDst++ = *pSrc++;
  #endif
  	LPC_SYSCON->SYSMEMREMAP = 1; // User RAM Mode. Interrupt vectors are re-mapped to Static RAM.

	// done below USB_init();
	
	LPC_SYSCON->UARTCLKDIV = 1;
    LPC_SYSCON->SYSAHBCLKCTRL |= (1<<12); //turn on the UART clock
	
	defaultIOsetup();
	
	//#warning just for testing
	//LPC_GPIO->DIR[0]  |= (1<<10);
	//LPC_GPIO->DIR[0]  |= (1<<15);
	//LPC_IOCON->SWCLK_PIO0_10 |= 1; // turn off SWCLK
	//LPC_IOCON->SWCLK_PIO0_10 = 1; // turn off SWCLK and pullup
	//LPC_IOCON->SWDIO_PIO0_15 = 1 | (1<<7); // turn off SWDIO, turn on digital mode
	//LPC_GPIO->CLR[0]  |= (1<<10);
	//LPC_GPIO->CLR[0]  |= (1<<15);
}

// #define NEED_SETUP_CHIP -- in .h to get this called from BASIC

void setup_chip(void) {
	
//	setSoftResetPoint();		// this sets a place for code to return to on a soft reset-- which is the lr on entry here
	asm(" ldr	r0,[pc, #8]");
	asm(" mov	r1,lr");
	asm(" str   r1,[r0, #0]");
	asm(" b		SIret");
	asm(" nop");
	asm(" .word	saveLR");
	asm("SIret:	");

	USB_init();
	moveSysTickIRQ();	
}


void IO2AD(int chan) {
	switch(chan){
	case 0:
		LPC_IOCON->TDI_PIO0_11 &= ~0x9F; /*  ADC I/O config */
		LPC_IOCON->TDI_PIO0_11 |= 0x02;  /* ADC IN0 */
		break;
	case 1:
		LPC_IOCON->TMS_PIO0_12 &= ~0x9F;	
		LPC_IOCON->TMS_PIO0_12 |= 0x02;  /* ADC IN1 */
		break;
	case 2:
		LPC_IOCON->TDO_PIO0_13 &= ~0x9F;	
		LPC_IOCON->TDO_PIO0_13 |= 0x02;  /* ADC IN2 */
		break;
	case 3:
		LPC_IOCON->TRST_PIO0_14 &= ~0x9F;	
		LPC_IOCON->TRST_PIO0_14 |= 0x02;  /* ADC IN3 */
		break;
	case 4:
		LPC_IOCON->SWDIO_PIO0_15 &= ~0x9F;	
		LPC_IOCON->SWDIO_PIO0_15 |= 0x02;  /* ADC IN4 */
		break;
	case 5:
		LPC_IOCON->PIO0_16   &= ~0x9F; /* Clear bit7, change to analog mode. */	
		LPC_IOCON->PIO0_16   |= 0x01;  /* ADC IN5 */
		break;
	case 6:
		LPC_IOCON->PIO0_22   &= ~0x9F; /* Clear bit7, change to analog mode. */	
		LPC_IOCON->PIO0_22   |= 0x01;  /* ADC IN6 */
		break;
	case 7:
		LPC_IOCON->PIO0_23   &= ~0x9F; /* Clear bit7, change to analog mode. */	
		LPC_IOCON->PIO0_23   |= 0x01;  /* ADC IN7 */
		break;
	}
}

void alt_wrdirbit(int pinnum, int dirval) {
	if(pinnum > MAX_IO) return; // NOTE reg_lindex
	if(pinnum == 0) return;
	
	if(pinnum > 31)
	{
		pinnum -= 32;
		if(dirval)LPC_GPIO->DIR[1] |= (1<<pinnum);
		else	  LPC_GPIO->DIR[1] &= ~(1<<pinnum);
	} 
	else
	{
		if(dirval)LPC_GPIO->DIR[0] |= (1<<pinnum);
		else	  LPC_GPIO->DIR[0] &= ~(1<<pinnum);
	}
}

int alt_rddirbit(int pinnum) {
	if(pinnum > MAX_IO) return pinnum; // NOTE reg_accum 
	if(pinnum == 0) return pinnum;

	if(pinnum > 31)
	{
		pinnum -= 32;
		if(LPC_GPIO->DIR[1] & (1<<pinnum)) return -1;
//		else 							reg_accum = 0;
	} 
	else
	{
		if(LPC_GPIO->DIR[0] & (1<<pinnum)) return -1;
//		else 							reg_accum = 0;
	}
	return 0;
}


int alt_inbit(int pinnum) {
	if(pinnum > MAX_IO) return pinnum; // NOTE reg_accum 
	if(pinnum == 0) return pinnum;

	if(pinnum > 31)
	{
		pinnum -= 32;
		if(LPC_GPIO->PIN[1] & (1<<pinnum)) return -1;
//		else 						    reg_accum = 0;
	} 
	else
	{
		if(LPC_GPIO->PIN[0] & (1<<pinnum)) return -1;
//		else 						    reg_accum = 0;
	}
	return 0;
}

void alt_outbit(int pinnum,int pinval) {
	if(pinnum > MAX_IO) return; // NOTE reg_lindex
	if(pinnum == 0) return;
	
	if(pinnum > 31)
	{
		pinnum -= 32;
		if(pinval)	LPC_GPIO->SET[1] = (1<<pinnum);
		else		LPC_GPIO->CLR[1] = (1<<pinnum);
	} 
	else
	{
		if(pinval)	LPC_GPIO->SET[0] = (1<<pinnum);
		else		LPC_GPIO->CLR[0] = (1<<pinnum);
	}
}


extern volatile unsigned int ms65_count;
extern int USBresetHappened;

void alt_SysTick_Handler(void) {
	ms65_count++;                        // increment counter
	if (USBresetHappened) {
		USBresetHappened = 0;
//		gotoSoftReset();
		asm(" ldr	r0,[pc, #4]");
		asm(" str   r0,[sp, #28]");		// normally at 0x18, but push {lr} at start of this routine
		asm(" b		STret");
		asm(" .word	gotoSoftReset");
		asm("STret:	");	
	}
}

void moveSysTickIRQ(void){
	*(int *) (0x3C) = (int) &alt_SysTick_Handler; // compiler figures it out --    + 1;
}


#define BREAK_WAIT	5000

int getchar(void);
void delay_ms(unsigned int);


int startUserCode(int isRUNcommand) {
	int ch;

	// check to see if code is valid
#warning -- need to check code validity
#if FOR_BASIC	
	if (((*(unsigned int *) (f_table[4]<<4)) == 0xFFFFFFFF) || ((*(unsigned int *) (f_table[4]<<4)) == 0)){
		return 0;
	}
#else
	if (((*(unsigned int *) (0x4000)) == 0xFFFFFFFF) || ((*(unsigned int *) (0x4000)) == 0)){
		return 0;
	}
#endif
	
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
		if (LPC_SYSCON->SYSRESSTAT & 0x3) {	// power on or reset occurred
			LPC_SYSCON->SYSRESSTAT = 0x3;		// clear those reset indicators 
		} else if (LPC_SYSCON->SYSRESSTAT & 0xC) {	// watchdog or brown out-- user code must have enabled it so go the the user code
		} else {
			return 0;			// must have got here by Fault ISR
		}	
	  #endif	
	}	
//return 0;
		
	// now wait to see if a BREAK happens -- ctlC or ESC received on UART	
		
	delay_ms(BREAK_WAIT);
	
	while ((ch = getchar()) != -1) {
	    if ((ch == ESC) || (ch == CTRLC)) {
		    return 0;
	    }
    }

	// if we got here its good to go	
	return 1;	
}	


