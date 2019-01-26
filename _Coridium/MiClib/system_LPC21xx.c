/**************************************************************************//**
 * @file     system_LPC21xx.c
 * @brief    CMSIS Cortex-M3 Device Peripheral Access Layer Source File
 *           for the NXP LPC21xx Device Series
 * @version  V1.08
 * @date     12. Sept 2011
 *
 * @note
 * Copyright (C) 2009 ARM Limited. All rights reserved.
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
 * Modified from sources for LPC17xx by Coridium Corp
 * 
 ******************************************************************************/


#include <stdint.h>
#include "uart.h"
#include "LPC21xx.h"
#include "IRQ_arm7.h"



/*
//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
*/

/*--------------------- Clock Configuration ----------------------------------
//
// <e> Clock Configuration
//
//   <e3> PLL0 Configuration (Main PLL)
//     <h> PLL0 Configuration Register (PLL0CFG)
//                     <i> F_cco0 = (2 * M * F_in) / N
//                     <i> F_in must be in the range of 32 kHz to 50 MHz
//                     <i> F_cco0 must be in the range of 275 MHz to 550 MHz
//       <o4.0..14>  MSEL: PLL Multiplier Selection
//                     <6-32768><#-1>
//                     <i> M Value
//       <o4.16..23> NSEL: PLL Divider Selection
//                     <1-256><#-1>
//                     <i> N Value
//     </h>
//   </e>
//
//   <h> CPU Clock Configuration Register (CCLKCFG)
//     <o7.0..7>  CCLKSEL: Divide Value for CPU Clock from PLL0
//                     <1-256><#-1>
//   </h>
//
//   <h> Peripheral Clock Selection Register 0 (PCLKSEL0)
//     <o9.0..1>    PCLK: Peripheral Clock Selection for 
//                     <0=> Pclk = Cclk / 4
//                     <1=> Pclk = Cclk
//                     <2=> Pclk = Cclk / 2
//                     <3=> Pclk = Hclk / 8
//   </h>
//
//   <h> Power Control for Peripherals Register (PCONP)
//     <o11.1>      PCTIM0: Timer/Counter 0 power/clock enable
//     <o11.2>      PCTIM1: Timer/Counter 1 power/clock enable
//     <o11.3>      PCUART0: UART 0 power/clock enable
//     <o11.4>      PCUART1: UART 1 power/clock enable
//     <o11.6>      PCPWM1: PWM 1 power/clock enable
//     <o11.7>      PCI2C0: I2C interface 0 power/clock enable
//     <o11.8>      PCSPI: SPI interface power/clock enable
//     <o11.9>      PCRTC: RTC power/clock enable
//     <o11.10>     PCSSP1: SSP interface 1 power/clock enable
//     <o11.12>     PCAD: A/D converter power/clock enable
//     <o11.13>     PCCAN1: CAN controller 1 power/clock enable
//     <o11.14>     PCCAN2: CAN controller 2 power/clock enable
//     <o11.15>     PCGPIO: GPIOs power/clock enable
//     <o11.16>     PCRIT: Repetitive interrupt timer power/clock enable
//     <o11.17>     PCMC: Motor control PWM power/clock enable
//     <o11.18>     PCQEI: Quadrature encoder interface power/clock enable
//     <o11.19>     PCI2C1: I2C interface 1 power/clock enable
//     <o11.21>     PCSSP0: SSP interface 0 power/clock enable
//     <o11.22>     PCTIM2: Timer 2 power/clock enable
//     <o11.23>     PCTIM3: Timer 3 power/clock enable
//     <o11.24>     PCUART2: UART 2 power/clock enable
//     <o11.25>     PCUART3: UART 3 power/clock enable
//     <o11.26>     PCI2C2: I2C interface 2 power/clock enable
//     <o11.27>     PCI2S: I2S interface power/clock enable
//     <o11.29>     PCGPDMA: GP DMA function power/clock enable
//     <o11.30>     PCENET: Ethernet block power/clock enable
//     <o11.31>     PCUSB: USB interface power/clock enable
//   </h>
//
//   <h> Clock Output Configuration Register (CLKOUTCFG)
//     <o12.0..3>   CLKOUTSEL: Selects clock source for CLKOUT
//                     <0=> CPU clock
//                     <1=> Main oscillator
//                     <2=> Internal RC oscillator
//                     <3=> USB clock
//                     <4=> RTC oscillator
//     <o12.4..7>   CLKOUTDIV: Selects clock divider for CLKOUT
//                     <1-16><#-1>
//     <o12.8>      CLKOUT_EN: CLKOUT enable control
//   </h>
//
// </e>
*/
#define CLOCK_SETUP           1
#define SCS_Val               0x00000000		// 0x20 turn on main oscillator
#define CLKSRCSEL_Val         0x00000000		// 0=iRC  1=XTAL  2=RTC
#define PLL0_SETUP            1
#define PLL0CFG_Val           ((1<<5) + (2))	// F_cco0 = 2 * source * (M+1) / (P+1)   // P<<5 + M,  240 MHz, must be 156 to 320
#define PCLKSEL0_Val          0x00000000
#define PCONP_Val             0x03C0825E		// turn off i2c, spi, ssp, let ADinit turn on A/D  // default is 0x042887DE
#define CLKOUTCFG_Val         0x00000000        // default PCLK = divide by 4


/*--------------------- Flash Accelerator Configuration ----------------------
//
// <e> Flash Accelerator Configuration
//   <o1.12..15> FLASHTIM: Flash Access Time
//               <0=> 1 CPU clock (for CPU clock up to 20 MHz)
//               <1=> 2 CPU clocks (for CPU clock up to 40 MHz)
//               <2=> 3 CPU clocks (for CPU clock up to 60 MHz)
//               <3=> 4 CPU clocks (for CPU clock up to 80 MHz)
//               <4=> 5 CPU clocks (for CPU clock up to 100 MHz)
//               <5=> 6 CPU clocks (for any CPU clock)
// </e>
*/
#define FLASH_SETUP           1
#define FLASHCFG_Val          0x00004000

/*
//-------- <<< end of configuration section >>> ------------------------------
*/

/*----------------------------------------------------------------------------
  Check the register settings
 *----------------------------------------------------------------------------*/
#define CHECK_RANGE(val, min, max)                ((val < min) || (val > max))
#define CHECK_RSVD(val, mask)                     (val & mask)

/* Clock Configuration -------------------------------------------------------*/
#if (CHECK_RSVD((SCS_Val),       ~0x00000030))
   #error "SCS: Invalid values of reserved bits!"
#endif

#if (CHECK_RSVD((PLL0CFG_Val),   ~0x0000007F))
   #error "PLL0CFG: Invalid values of reserved bits!"
#endif

#if (CHECK_RSVD((PCONP_Val),      0x10100821))
   #error "PCONP: Invalid values of reserved bits!"
#endif

#if (CHECK_RSVD((CLKOUTCFG_Val), ~0x00000003))
   #error "CLKOUTCFG: Invalid values of reserved bits!"
#endif

/* Flash Accelerator Configuration -------------------------------------------*/
#if (CHECK_RSVD((FLASHCFG_Val), ~0x0000F000))
   #error "FLASHCFG: Invalid values of reserved bits!"
#endif


/*----------------------------------------------------------------------------
  DEFINES
 *----------------------------------------------------------------------------*/
    
/*----------------------------------------------------------------------------
  Define clocks
 *----------------------------------------------------------------------------*/
#define OSC_CLK     (      XTAL)        /* Main oscillator frequency          */
#define RTC_CLK     (   32000UL)        /* RTC oscillator frequency           */

/* F_cco0 = (2 * P * M * F_in)  */
#define __M               (((PLL0CFG_Val      ) & 0x1F) + 1)
#define __P               (((PLL0CFG_Val >> 5)  & 0x03) + 1)
#define __FCCO(XTAL)      ((__M * XTAL) * (1 << __P)) 

#if (CHECK_RANGE((__FCCO(XTAL)), 156000000, 320000000))
   #error "Fcco: Invalid value out of range!"  XTAL __M   __P
#endif

/* Determine core clock frequency according to settings */
#if (PLL0_SETUP)
    #define __CORE_CLK (OSC_CLK * __M)
#else
    #define __CORE_CLK (OSC_CLK)
#endif


/*----------------------------------------------------------------------------
  Clock Variable definitions
 *----------------------------------------------------------------------------*/
uint32_t SystemCoreClock = XTAL;  /*!< System Clock Frequency (Core Clock)*/



#ifdef mitePRO
 const char pinlist[] = {9,8,27,19,28,21,5,29, 30,16,7,13,4,6,20,15, 22,23,24,10,11,12,25,26, 0,1,2,3,14,17,18,31};
 const int  pinmap[] = {1<<9, 1<<8, 1<<27, 1<<19, 1<<28, 1<<21, 1<<5, 1<<29,
 					   1<<30, 1<<16, 1<<7, 1<<13, 1<<4, 1<<6, 1<<20, 1<<15,
 					   1<<22, 1<<23, 1<<24, 1<<10, 1<<11, 1<<12, 1<<25, 1<<26,
 					   1<<0, 1<<1, 1<<2, 1<<3, 1<<14,1<<17, 1<<18, 1<<31};
 
#elif defined ARMmite
 const char pinlist[] = {9,8,30,21,20,29,4,5, 6,7,13,19,18,17,16,15, 22,23,24,10,11,12,25,26, 0,1,2,3,14,27,28,31};	 
 const int pinmap[]  = {1<<9, 1<<8, 1<<30, 1<<21, 1<<20, 1<<29, 1<<4, 1<<5, 
 						1<<6, 1<<7, 1<<13, 1<<19, 1<<18, 1<<17, 1<<16, 1<<15, 
 						1<<22, 1<<23, 1<<24, 1<<10, 1<<11, 1<<12, 1<<25, 1<<26, 
 						1<<0, 1<<1, 1<<2, 1<<3, 1<<14, 1<<27, 1<<28, 1<<31};	 
 
#elif defined ARMexpress
 const char pinlist[] = {27,28,29,30,31,2,3,22, 24,12,23,25,26,13,15,16};
 const int pinmap[]  = {1<<27, 1<<28, 1<<29, 1<<30, 1<<31, 1<<2, 1<<3, 1<<22, 
 						1<<24, 1<<12, 1<<23, 1<<25, 1<<26, 1<<13, 1<<15, 1<<16};
 
#elif defined ARMexpLITE
 const char pinlist[] = {27,28,29,30,4,9,8,22, 24,12,23,25,26,13,15};
 const int pinmap[]  = {1<<27, 1<<28, 1<<29, 1<<30, 1<<4, 1<<9, 1<<8, 1<<22, 
 						1<<24, 1<<12, 1<<23, 1<<25, 1<<26, 1<<13, 1<<15};
 
#else
#endif



/*----------------------------------------------------------------------------
  Clock functions
 *----------------------------------------------------------------------------*/
void SystemCoreClockUpdate (void)            /* Get Core Clock Frequency      */
{
	SystemCoreClock = OSC_CLK * ((SCB_PLLCFG & 0x1f) + 1);
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
void SystemInit (void)
{
////////////////////////////////////////////////////////////////////////	
//	
// set the peripheral bus speed
// 
	SCB_APBDIV = CLKOUTCFG_Val;

/////////////////////////////////////////////////////////////////////////
	
#if (defined mitePRO) || (defined ARMexpLITE) || (defined ARMexpress)
	LPC_RTC->CCR = 0x01;                // enable the RTC counters and use the pre-scaler
#else	
	LPC_RTC->CCR = 0x11;                // enable the RTC counters and the 32 KHz oscillator
#endif	
		

	// set PLL multiplier & divisor.
	// values computed from config.h
	SCB_PLLCFG = PLL0CFG_Val;

	// enable PLL
	SCB_PLLCON = PLLCON_PLLE;
	SCB_PLLFEED = 0xAA;                       // Make it happen.  These two updates
	SCB_PLLFEED = 0x55;                       // MUST occur in sequence.

	// wait for PLL lock
	while (!(SCB_PLLSTAT & PLLSTAT_LOCK)) ;

	// enable & connect PLL
	SCB_PLLCON = PLLCON_PLLE | PLLCON_PLLC;
	SCB_PLLFEED = 0xAA;                       // Make it happen.  These two updates
	SCB_PLLFEED = 0x55;                       // MUST occur in sequence.

////////////////////////////////////////////////////////////////////////	
//	
// setup & enable the MAM
//
	MAM_TIM = MAMTIM_CYCLES;
	MAM_CR = MAMCR_FULL;
	
/////////////////////////////////////////////////////////////////////////
//
// set up AHB high speed IOs
//
		
#if defined LPC2103
	SCB_SCS  = 1;						// set to 1 to enable highspeed IOs
#elif defined SCB_SCS
	SCB_SCS  = 3;						// set to 3 to enable highspeed IOs -- both ports
#else	
	// do nothing
#endif


/////////////////////////////////////////////////////////////////////////
//
//	clear any pending IRQs and disable all for now, but enable them in psr
//

	SCB_MEMMAP = MEMMAP_FLASH;            // map interrupt vectors space into FLASH
	
	VICIntEnClear = 0xFFFFFFFF;           // clear all interrupt enables
	VICIntSelect = 0x00000000;            // clear all FIQ selections
	
	VICVectAddr = 0; 	// Acknowledge any pending Interrupts
	
	VICDefVectAddr = (unsigned int)SWI_ISR;	//undefined interrupts go here for now

	enableIRQ();
	
  #ifdef LPC2138
	PCB_PINSEL2 = 0;			// drive trace,debug port as IOs
  #endif
  	
	SystemCoreClockUpdate();
}

#if defined LPC2103

const int adPinMap[8] = {		// mapping for PINSEL0/1 depending on bit
0x00003000,
0x0000C000,
0x00030000,
0x00300000,
0x00C00000,
0x03000000,
0x000C0000,
0x00300000
};

#elif defined LPC2138 

#else

#error -- undefined CPU for AD pin mapping in system21xx.c

#endif

 #if defined LPC2103
 
  void IO2AD(int chan) {
	if ((chan >=3) && (chan <= 5))PCB_PINSEL0 |= adPinMap[chan];
	else 						  PCB_PINSEL1 |= adPinMap[chan];
  }

 #elif defined LPC2138
 
  void IO2AD(int chan) {
	switch (chan) {
		case 0:
				PCB_PINSEL1 |= 0x00400000;
				break;
		case 1:
				PCB_PINSEL1 |= 0x01000000;
				break;
		case 2:				
				PCB_PINSEL1 |= 0x04000000;
				break;
		case 3:				
				PCB_PINSEL1 |= 0x10000000;
				break;
		case 4:				
				PCB_PINSEL1 |= 0x00040000;
				break;
		case 5:				
				PCB_PINSEL1 |= 0x00100000;
				break;
		case 6:				
				PCB_PINSEL0 |= 0x00000300;
				break;
		case 7:				
				PCB_PINSEL0 |= 0x00000c00;
				break;
	}
  }
  
 #else
 

 #endif

