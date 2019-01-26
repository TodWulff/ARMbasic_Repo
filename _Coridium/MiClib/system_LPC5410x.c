/******************************************************************************
 * @file     system_LPC15xx.c
 * @purpose  CMSIS Cortex-M3 Device Peripheral Access Layer Source File
 *           for the NXP LPC15xx Device Series
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
#include "LPC5410x.h"

#ifndef LPC54102m0 // M0 does not use the library
  #include "cpuctrl_5410x.h"
  #include "power_lib_5410x.h"
  void Chip_Clock_SetupSystemPLL(unsigned int multiply_by, unsigned int input_freq){}
  unsigned int Chip_Clock_GetSystemPLLInClockRate(void){return 0;}
  unsigned int Chip_Clock_GetMainClockRate(void){return 0;}
  unsigned int Chip_SYSCON_PLLDelay(void){return 0;}
  void Chip_SYSCON_PowerUp(unsigned int powerupmask){}
  void Chip_Clock_EnablePeriphClock(unsigned int clk){}
  void Chip_Clock_DisablePeriphClock(unsigned int clk){}
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
//                     <i> wdt_osc_clk = Fclkana/ (2 ? (1 + DIVSEL))
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
#define SYSPLLCTRL_Val        0x00000045              // Reset: 0x000
#define SYSPLLCLKSEL_Val      0x00000001              // Reset: 0x000
#define MAINCLKSELA_Val       0x00000001              // Reset: 0x000
#define MAINCLKSELB_Val       0x00000002              // Reset: 0x000
#define SYSAHBCLKDIV_Val      0x00000001              // Reset: 0x001
#define USBPLLCTRL_Val        0x00000043              // Reset: 0x000
#define USBPLLCLKSEL_Val      0x00000001              // Reset: 0x000
#define USBCLKSEL_Val         0x00000002              // Reset: 0x000
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

#if (CHECK_RSVD((MAINCLKSELA_Val),  ~0x00000003))
   #error "MAINCLKSEL: Invalid values of reserved bits!"
#endif

#if (CHECK_RSVD((MAINCLKSELB_Val),  ~0x00000003))
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

#if (CHECK_RANGE((USBCLKSEL_Val), 0, 3))
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
#define __RING_OSC_CLK    (4000000UL)     /* Ring OSC frequency */
#define __ULP_32K_OSC_CLK (32000UL)       /* ULP 32K OSC frequency */

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

  #define  __SYS_PLLCLKOUT         (__SYS_PLLCLKIN * ((SYSPLLCTRL_Val & 0x03F) + 1))

  /* main clock calculation */
  #if   (((MAINCLKSELA_Val & 0x03) == 0) && ((MAINCLKSELB_Val & 0x03) == 0))
    #define __MAIN_CLOCK             (__IRC_OSC_CLK)
  #elif (((MAINCLKSELA_Val & 0x03) == 1) && ((MAINCLKSELB_Val & 0x03) == 0))
    #define __MAIN_CLOCK             (__SYS_OSC_CLK)
  #elif (((MAINCLKSELA_Val & 0x03) == 2) && ((MAINCLKSELB_Val & 0x03) == 0))
    #define __MAIN_CLOCK             (__WDT_OSC_CLK)
  #elif (((MAINCLKSELA_Val & 0x03) == 3) && ((MAINCLKSELB_Val & 0x03) == 0))
      #define __MAIN_CLOCK           (__RING_OSC_CLK)
	#elif ((MAINCLKSELB_Val & 0x03) == 1)
    #define __MAIN_CLOCK             (__SYS_PLLCLKIN)
  #elif ((MAINCLKSELB_Val & 0x03) == 2)
    #define __MAIN_CLOCK             (__SYS_PLLCLKOUT)
	#elif ((MAINCLKSELB_Val & 0x03) == 3)
    #define __MAIN_CLOCK             (__ULP_32K_OSC_CLK)
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

#ifndef LPC54102m0
void fpu_init(void);

#define	POWER_LOW_POWER_MODE	0
#define	POWER_BALANCED_MODE		1	// pretty useless these cause config errors now
#define	POWER_HIGH_PERFORMANCE	2	// pretty useless these cause config errors now

int getBROMVersion(void)
{
//__ASM("getBROMVersion: ");
/*2C98 B500     */ __ASM(" PUSH {lr}                    ");
/*2C9A B08B     */ __ASM(" SUB  sp,sp,#0x2C             ");
/*2C9C A80A     */ __ASM(" ADD  r0,sp,#0x28             ");
/*2C9E 2337     */ __ASM(" MOVS r3,#0x37                ");
/*2CA0 F8403D14 */ __ASM(" STR  r3,[r0,#-0x14]!         ");
/*2CA4 A901     */ __ASM(" ADD  r1,sp,#0x04             ");
/*2CA6 4B03     */ __ASM(" LDR  r3,[pc,#12]  ; @0x2CB4  ");
/*2CA8 4798     */ __ASM(" BLX  r3                      ");
/*2CAA 9802     */ __ASM(" LDR  r0,[sp,#0x08]           ");
/*2CAC B00B     */ __ASM(" ADD  sp,sp,#0x2C             ");
/*2CAE F85DFB04 */ __ASM(" LDR  pc,[sp],#0x04           ");
/*2CB2 BF00     */ __ASM(" NOP                          ");
/*2CB4 */ __ASM(".word 0X03000205");					   
return 0;//dummy
}


void __attribute__ ((aligned(4))) mike_POWER_SetVoltage(int mode, int freq)
{
//__ASM("getBROMVersion: ");
/*2E0C B5F8     */ __ASM(" PUSH {r3-r7,lr}              ");
/*2E0E 4606     */ __ASM(" MOV  r6,r0                   ");
/*2E10 460D     */ __ASM(" MOV  r5,r1                   ");
/*2E12 F7FFFF41 */ __ASM(" BL.W getBROMVersion          ");
/*2E16 F5B05F88 */ __ASM(" CMP  r0,#0x1100              ");
/*2E1A D166     */ __ASM(" BNE  L_2EEA                  ");

/*2E1C F04F4380 */ __ASM(" MOV  r3,#0x40000000          ");
/*2E20 4A72     */ __ASM(" LDR  r2,[pc,#456]  ; @0x2FEC ");
/*2E22 F8C32218 */ __ASM(" STR  r2,[r3,#0x218]          ");
/*2E26 4B72     */ __ASM(" LDR  r3,[pc,#456]  ; @0x2FF0 ");
/*2E28 429D     */ __ASM(" CMP  r5,r3                   ");
/*2E2A D81B     */ __ASM(" BHI  L_2E64                  ");
/*2E2C 4C71     */ __ASM(" LDR  r4,[pc,#452]  ; @0x2FF4 ");
/*2E2E 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2E30 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2E32 2000     */ __ASM(" MOVS r0,#0x00                ");
/*2E34 4602     */ __ASM(" MOV  r2,r0                   ");
/*2E36 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2E38 2105     */ __ASM(" MOVS r1,#0x05                ");
/*2E3A 4798     */ __ASM(" BLX  r3                      ");
/*2E3C 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2E3E 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2E40 2001     */ __ASM(" MOVS r0,#0x010               ");
/*2E42 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2E44 210B     */ __ASM(" MOVS r1,#0x0B                ");
/*2E46 2200     */ __ASM(" MOVS r2,#0x00                ");
/*2E48 4798     */ __ASM(" BLX  r3                      ");
/*2E4A 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2E4C 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2E4E 2002     */ __ASM(" MOVS r0,#0x02                ");
/*2E50 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2E52 210B     */ __ASM(" MOVS r1,#0x0B                ");
/*2E54 2200     */ __ASM(" MOVS r2,#0x00                ");
/*2E56 4798     */ __ASM(" BLX  r3                      ");
/*2E58 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2E5A 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2E5C 2003     */ __ASM(" MOVS r0,#0x03                ");
/*2E5E 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2E60 2105     */ __ASM(" MOVS r1,#0x05                ");
/*2E62 E03E     */ __ASM(" B    L_2EE2                  ");
__ASM("L_2E64: ");
/*2E64 4B64     */ __ASM(" LDR  r3,[pc,#400]  ; @0x2FF8 ");
/*2E66 429D     */ __ASM(" CMP  r5,r3                   ");
/*2E68 D81B     */ __ASM(" BHI  L_2EA2                  ");
/*2E6A 4C62     */ __ASM(" LDR  r4,[pc,#392]  ; @0x2FF4 ");
/*2E6C 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2E6E 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2E70 2000     */ __ASM(" MOVS r0,#0x00                ");
/*2E72 4602     */ __ASM(" MOV  r2,r0                   ");
/*2E74 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2E76 2109     */ __ASM(" MOVS r1,#0x09                ");
/*2E78 4798     */ __ASM(" BLX  r3                      ");
/*2E7A 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2E7C 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2E7E 2001     */ __ASM(" MOVS r0,#0x01                ");
/*2E80 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2E82 210B     */ __ASM(" MOVS r1,#0x0B                ");
/*2E84 2200     */ __ASM(" MOVS r2,#0x00                ");
/*2E86 4798     */ __ASM(" BLX  r3                      ");
/*2E88 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2E8A 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2E8C 2002     */ __ASM(" MOVS r0,#0x02                ");
/*2E8E 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2E90 210B     */ __ASM(" MOVS r1,#0x0B                ");
/*2E92 2200     */ __ASM(" MOVS r2,#0x00                ");
/*2E94 4798     */ __ASM(" BLX  r3                      ");
/*2E96 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2E98 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2E9A 2003     */ __ASM(" MOVS r0,#0x03                ");
/*2E9C 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2E9E 2109     */ __ASM(" MOVS r1,#0x09                ");
/*2EA0 E01F     */ __ASM(" B    L_2EE2                  ");
__ASM("L_2EA2: ");
/*2EA2 4B56     */ __ASM(" LDR  r3,[pc,#344]  ; @0x2FFC ");
/*2EA4 429D     */ __ASM(" CMP  r5,r3                   ");
/*2EA6 D901     */ __ASM(" BLS  L_2EAC                  ");
__ASM("L_2EA8: ");
/*2EA8 4E55     */ __ASM(" LDR  r6,[pc,#340]  ; @0x3000 ");
/*2EAA E09C     */ __ASM(" B    L_2FE6                  ");
__ASM("L_2EAC: ");
/*2EAC 4C51     */ __ASM(" LDR  r4,[pc,#324]  ; @0x2FF4 ");
/*2EAE 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2EB0 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2EB2 2000     */ __ASM(" MOVS r0,#0x00                ");
/*2EB4 4602     */ __ASM(" MOV  r2,r0                   ");
/*2EB6 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2EB8 210B     */ __ASM(" MOVS r1,#0x0B                ");
/*2EBA 4798     */ __ASM(" BLX  r3                      ");
/*2EBC 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2EBE 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2EC0 2001     */ __ASM(" MOVS r0,#0x01                ");
/*2EC2 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2EC4 210B     */ __ASM(" MOVS r1,#0x0B                ");
/*2EC6 2200     */ __ASM(" MOVS r2,#0x00                ");
/*2EC8 4798     */ __ASM(" BLX  r3                      ");
/*2ECA 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2ECC 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2ECE 2002     */ __ASM(" MOVS r0,#0x02                ");
/*2ED0 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2ED2 210B     */ __ASM(" MOVS r1,#0x0B                ");
/*2ED4 2200     */ __ASM(" MOVS r2,#0x00                ");
/*2ED6 4798     */ __ASM(" BLX  r3                      ");
/*2ED8 6823     */ __ASM(" LDR  r3,[r4,#0x00]           ");
/*2EDA 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2EDC 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2EDE 2003     */ __ASM(" MOVS r0,#0x03                ");
/*2EE0 210B     */ __ASM(" MOVS r1,#0x0B                ");
__ASM("L_2EE2: ");
/*2EE2 2200     */ __ASM(" MOVS r2,#0x00                ");
/*2EE4 4798     */ __ASM(" BLX  r3                      ");
__ASM("L_2EE6: ");
/*2EE6 2600     */ __ASM(" MOVS r6,#0x00                ");
/*2EE8 E07D     */ __ASM(" B    L_2FE6                  ");
__ASM("L_2EEA: ");
/*2EEA 2E00     */ __ASM(" CMP  r6,#0x00                ");
/*2EEC D17A     */ __ASM(" BNE  L_2FE4                  ");
/*2EEE F7FFFED3 */ __ASM(" BL.W getBROMVersion          ");
/*2EF2 F2411302 */ __ASM(" MOVW r3,#0x1102              ");
/*2EF6 4298     */ __ASM(" CMP  r0,r3                   ");
/*2EF8 D10B     */ __ASM(" BNE  L_2F12                  ");
/*2EFA F04F4380 */ __ASM(" MOV  r3,#0x40000000          ");
/*2EFE 4941     */ __ASM(" LDR  r1,[pc,#260]  ; @0x3004 ");
/*2F00 F8D303FC */ __ASM(" LDR  r0,[r3,#0x3FC]          ");
/*2F04 4A40     */ __ASM(" LDR  r2,[pc,#256]  ; @0x3008 ");
/*2F06 4B41     */ __ASM(" LDR  r3,[pc,#260]  ; @0x300C ");
/*2F08 4298     */ __ASM(" CMP  r0,r3                   ");
/*2F0A BF14     */ __ASM(" ITE  NE                      ");
#warning ROM Version 0x1102 would fail here
/*2F0C 4613     */ __ASM(" NOP           ");/*MOV  r3,r2*/
/*2F0E 460B     */ __ASM(" NOP           ");/*MOV  r3,r1*/
/*2F10 E000     */ __ASM(" B    L_2F14                  ");
__ASM("L_2F12: ");
/*2F12 4B3D     */ __ASM(" LDR  r3,[pc,#244]  ; @0x3008 ");
__ASM("L_2F14: ");
/*2F14 F44F727A */ __ASM(" MOV  r2,#0x3E8               ");
/*2F18 FBB5F2F2 */ __ASM(" UDIV r2,r5,r2                ");
/*2F1C 429A     */ __ASM(" CMP  r2,r3                   ");
/*2F1E D8C3     */ __ASM(" BHI  L_2EA8                  ");
/*2F20 F04F4380 */ __ASM(" MOV  r3,#0x40000000          ");
/*2F24 4A31     */ __ASM(" LDR  r2,[pc,#196]  ; @0x2FEC ");
/*2F26 F8C32218 */ __ASM(" STR  r2,[r3,#0x218]          ");
/*2F2A F8D37124 */ __ASM(" LDR  r7,[r3,#0x124]          ");
/*2F2E 4B38     */ __ASM(" LDR  r3,[pc,#224]  ; @0x3010 ");
/*2F30 429D     */ __ASM(" CMP  r5,r3                   ");
/*2F32 F4274770 */ __ASM(" BIC  r7,r7,#0xF000           ");
/*2F36 D91C     */ __ASM(" BLS  L_2F72                  ");
/*2F38 4B36     */ __ASM(" LDR  r3,[pc,#216]  ; @0x3014 ");
/*2F3A 429D     */ __ASM(" CMP  r5,r3                   ");
/*2F3C D91B     */ __ASM(" BLS  L_2F76                  ");
/*2F3E F5030337 */ __ASM(" ADD  r3,r3,#0xB70000         ");
/*2F42 F50353D8 */ __ASM(" ADD  r3,r3,#0x1B00           ");
/*2F46 429D     */ __ASM(" CMP  r5,r3                   ");
/*2F48 D917     */ __ASM(" BLS  L_2F7A                  ");
/*2F4A 4B33     */ __ASM(" LDR  r3,[pc,#204]  ; @0x3018 ");
/*2F4C 429D     */ __ASM(" CMP  r5,r3                   ");
/*2F4E D916     */ __ASM(" BLS  L_2F7E                  ");
/*2F50 4B32     */ __ASM(" LDR  r3,[pc,#200]  ; @0x301C ");
/*2F52 429D     */ __ASM(" CMP  r5,r3                   ");
/*2F54 D915     */ __ASM(" BLS  L_2F82                  ");
/*2F56 F5030337 */ __ASM(" ADD  r3,r3,#0xB70000         ");
/*2F5A F50353D8 */ __ASM(" ADD  r3,r3,#0x1B00           ");
/*2F5E 429D     */ __ASM(" CMP  r5,r3                   ");
/*2F60 D911     */ __ASM(" BLS  L_2F86                  ");
/*2F62 4B2F     */ __ASM(" LDR  r3,[pc,#188]  ; @0x3020 ");
/*2F64 4A2F     */ __ASM(" LDR  r2,[pc,#188]  ; @0x3024 ");
/*2F66 4C30     */ __ASM(" LDR  r4,[pc,#192]  ; @0x3028 ");
/*2F68 42A5     */ __ASM(" CMP  r5,r4                   ");
// NOTE I took a guess here based on R5 being greater than R4, seems to work. mar
/*2F6A BF8C     */ __ASM(" NOP                          ");/* ITE HI    */
/*2F6C 4614     */ __ASM(" MOV r4,r2                    ");/* MOV r4,r2 */
/*2F6E 461C     */ __ASM(" NOP                          ");/* MOV r4,r3 */
/*2F70 E00A     */ __ASM(" B    L_2F88                  ");
__ASM("L_2F72: ");
/*2F72 4C2E     */ __ASM(" LDR  r4,[pc,#184]  ; @0x302C ");
/*2F74 E008     */ __ASM(" B    L_2F88                  ");
__ASM("L_2F76: ");
/*2F76 4C2E     */ __ASM(" LDR  r4,[pc,#184]  ; @0x3030 ");
/*2F78 E006     */ __ASM(" B    L_2F88                  ");
__ASM("L_2F7A: ");
/*2F7A 4C2E     */ __ASM(" LDR  r4,[pc,#184]  ; @0x3034 ");
/*2F7C E004     */ __ASM(" B    L_2F88                  ");
__ASM("L_2F7E: ");
/*2F7E 4C2E     */ __ASM(" LDR  r4,[pc,#184]  ; @0x3038 ");
/*2F80 E002     */ __ASM(" B    L_2F88                  ");
__ASM("L_2F82: ");
/*2F82 4C2E     */ __ASM(" LDR  r4,[pc,#184]  ; @0x303C ");
/*2F84 E000     */ __ASM(" B    L_2F88                  ");
__ASM("L_2F86: ");
/*2F86 4C2E     */ __ASM(" LDR  r4,[pc,#184]  ; @0x3040 ");
__ASM("L_2F88: ");
/*2F88 4D1A     */ __ASM(" LDR  r5,[pc,#104]  ; @0x2FF4 ");
/*2F8A 682B     */ __ASM(" LDR  r3,[r5,#0x00]           ");
/*2F8C 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2F8E 2000     */ __ASM(" MOVS r0,#0x00                ");
/*2F90 F004010F */ __ASM(" AND  r1,r4,#0x0F             ");
/*2F94 4602     */ __ASM(" MOV  r2,r0                   ");
/*2F96 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2F98 4798     */ __ASM(" BLX  r3                      ");
/*2F9A 682B     */ __ASM(" LDR  r3,[r5,#0x00]           ");
/*2F9C 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2F9E 2001     */ __ASM(" MOVS r0,#0x01                ");
/*2FA0 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2FA2 210B     */ __ASM(" MOVS r1,#0x0B                ");
/*2FA4 2200     */ __ASM(" MOVS r2,#0x00                ");
/*2FA6 4798     */ __ASM(" BLX  r3                      ");
/*2FA8 682B     */ __ASM(" LDR  r3,[r5,#0x00]           ");
/*2FAA 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2FAC F3C43103 */ __ASM(" UBFX r1,r4,#12,#4            ");
/*2FB0 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2FB2 2002     */ __ASM(" MOVS r0,#0x02                ");
/*2FB4 2200     */ __ASM(" MOVS r2,#0x00                ");
/*2FB6 4798     */ __ASM(" BLX  r3                      ");
/*2FB8 682B     */ __ASM(" LDR  r3,[r5,#0x00]           ");
/*2FBA 68DB     */ __ASM(" LDR  r3,[r3,#0x0C]           ");
/*2FBC F3C44183 */ __ASM(" UBFX r1,r4,#18,#4            ");
/*2FC0 691B     */ __ASM(" LDR  r3,[r3,#0x10]           ");
/*2FC2 2003     */ __ASM(" MOVS r0,#0x03                ");
/*2FC4 2200     */ __ASM(" MOVS r2,#0x00                ");
/*2FC6 4798     */ __ASM(" BLX  r3                      ");
/*2FC8 0E24     */ __ASM(" LSRS r4,r4,#24               ");
/*2FCA F04F4380 */ __ASM(" MOV  r3,#0x40000000          ");
/*2FCE D006     */ __ASM(" BEQ  L_2FDE                  ");
/*2FD0 F0470720 */ __ASM(" ORR  r7,r7,#0x20             ");
/*2FD4 EA473404 */ __ASM(" ORR  r4,r7,r4,LSL #12        ");
/*2FD8 F8C34124 */ __ASM(" STR  r4,[r3,#0x124]          ");
/*2FDC E003     */ __ASM(" B    L_2FE6                  ");
__ASM("L_2FDE: ");
/*2FDE F8C37124 */ __ASM(" STR  r7,[r3,#0x124]          ");
/*2FE2 E780     */ __ASM(" B    L_2EE6                  ");
__ASM("L_2FE4: ");
/*2FE4 4E17     */ __ASM(" LDR  r6,[pc,#92]  ; @0x3044  ");
__ASM("L_2FE6: ");
/*2FE6 4630     */ __ASM(" MOV  r0,r6                   ");
/*2FE8 BDF8     */ __ASM(" POP  {r3-r7,pc}              ");
/*2FEA BF00     */ __ASM(" NOP                          ");

/*2FEC :*/ __ASM(".word 0X38000004");
/*2FF0 :*/ __ASM(".word 0X01312CFF");
/*2FF4 :*/ __ASM(".word 0X03000200");
/*2FF8 :*/ __ASM(".word 0X04C4B3FF");
/*2FFC :*/ __ASM(".word 0X05F5E100");
/*3000 :*/ __ASM(".word 0X000B0002");
/*3004 :*/ __ASM(".word 0X000186A0"); 
/*3008 :*/ __ASM(".word 0X00017700"); 
/*300C :*/ __ASM(".word 0X08C1FECE"); 
/*3010 :*/ __ASM(".word 0X00B71B00"); 
/*3014 :*/ __ASM(".word 0X016E3600"); 
/*3018 :*/ __ASM(".word 0X02DC6C00"); 
/*301C :*/ __ASM(".word 0X03938700"); 
/*3020 :*/ __ASM(".word 0X0430C2CC"); 
/*3024 :*/ __ASM(".word 0X0534D2CD"); 
/*3028 :*/ __ASM(".word 0X0501BD00"); 
/*302C :*/ __ASM(".word 0X001CB2C7"); 
/*3030 :*/ __ASM(".word 0X0120B2C8"); 
/*3034 :*/ __ASM(".word 0X0224B2C9"); 
/*3038 :*/ __ASM(".word 0X0228B2CA"); 
/*303C :*/ __ASM(".word 0X032CB2CB"); 
/*3040 :*/ __ASM(".word 0X0330C2CC"); 
/*3044 :*/ __ASM(".word 0X000C0004"); 
}

#else // for M0
 extern unsigned short f_table[];

#endif

extern void * MEMCPY(void *dst0, void *src0, int len0);

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
  volatile uint32_t i;

#ifdef LPC54102m0			// not much to do, most is setup, except vectors  
	if (((*(unsigned int *) (f_table[4]<<4)) == 0xFFFFFFFF) || ((*(unsigned int *) (f_table[4]<<4)) == 0)){
		while (1);
	}

  #ifdef FOR_BASIC
	MEMCPY((void *)0x03400000, (void *)0x00004000, 58<<2);
	SCB->VTOR = 0x03400000; // assign new vector table in RAM, so interrupts can be patched by BASIC
  #endif
	systick_init();
	delay_ms(10);
#else	

	// System clock to the IOCON and SWM needs to be enabled or most of the I/O related peripherals won't work. */
	LPC_SYSCON->SYSAHBCLKCTRL[0] |= ((1<<SYSCTL_CLOCK_SRAM1) | (1<<SYSCTL_CLOCK_SRAM2) | (1<<SYSCTL_CLOCK_FLASH) | (1<<SYSCTL_CLOCK_IOCON) | (1<<SYSCTL_CLOCK_MUX) | (1<<SYSCTL_CLOCK_GPIO0) | (1<<SYSCTL_CLOCK_GPIO1) | (1<<SYSCTL_CLOCK_FMC) | (1<<SYSCTL_CLOCK_MBOX));
	
	// check for ROM version 0x1102, hang and blink 5 times/second
	if (getBROMVersion() == 0x1102){
		LPC_GPIO->DIR[0] |= 1 << 31; // LED
		while(1){
			LPC_GPIO->NOT[0] |= 1 << 31;
			for(i=0;i<120000;i++);// 100ms on, 100ms off
		}
	}
	
	SystemCoreClock = 96000000;	

	LPC_SYSCON->ASYNCVPBCTRL  = 1;		// enable APB control
	LPC_SYSCON->SYSTICKCLKDIV = 0;//1;		// enable Systick clock divider
	LPC_ASYNC_SYSCTL->ASYNCCLKDIV = 1;	// UART clock divider for all UARTs
	LPC_ASYNC_SYSCTL->ASYNCVPBCLKCTRLSET = (1<<ASYNC_SYSCTL_CLOCK_FRG);
	LPC_ASYNC_SYSCTL->FRGCTRL = (22<<8) + 255;		// adjust 12 MHz to 12 * 115/125 for 115.2Kbaud

	// Initialize and power up PLL
	LPC_SYSCON->PDRUNCFGCLR = (1 << 3) | (1 << 4); // SYSCON_PDRUNCFG_PD_IRC_OSC | SYSCON_PDRUNCFG_PD_IRC
	LPC_SYSCON->SYSPLLCLKSEL = 0;   // Select the PLL input to the IRC

	LPC_SYSCON->FLASHCFG &= (LPC_SYSCON->FLASHCFG & ~(0xF << 12));
	LPC_SYSCON->FLASHCFG |= (4 << 12); // SYSCON_FLASH_4CYCLE

	// Power down PLL to change the PLL divider ratio
	LPC_SYSCON->PDRUNCFGSET = 1 << 22;

	// Write PLL setup data
	LPC_SYSCON->SYSPLLCTRL = 0x001D2540;
	LPC_SYSCON->SYSPLLNDEC = 0x00000302;
	LPC_SYSCON->SYSPLLNDEC = 0x00000302 | (1<<10);//PLL_NDEC_NREQ latch
	LPC_SYSCON->SYSPLLPDEC = 0x0000007F;
	LPC_SYSCON->SYSPLLPDEC = 0x0000007F | (1<<7);//PLL_PDEC_PREQ;// latch
	LPC_SYSCON->SYSPLLSSCGCTRL[0] = 0x0004003F;
	LPC_SYSCON->SYSPLLSSCGCTRL[0] = 0x0004003F | (1<<17);//PLL_SSCG0_MREQ;	// latch
	LPC_SYSCON->SYSPLLSSCGCTRL[1] = 0x100000000;
	LPC_SYSCON->SYSPLLSSCGCTRL[1] = 0x100000000 | (1<<19);//PLL_SSCG1_MD_REQ	latch

	// perform the following sequence to accelerate PLL lock when turning the PLL back on
	volatile uint32_t delayX;
	uint32_t maxCCO = (1 << 18) | 0x5dd2;	// CCO = 1.6Ghz + MDEC enabled
	i = LPC_SYSCON->SYSPLLSSCGCTRL[0] & ~(1 << 17);	// current value with mreq cleared

	// Initialize and power up PLL
	LPC_SYSCON->SYSPLLSSCGCTRL[0] = maxCCO;
	LPC_SYSCON->PDRUNCFGCLR = 1 << 22; // SYSCON_PDRUNCFG_PD_SYS_PLL;
	LPC_SYSCON->SYSPLLSSCGCTRL[0] = maxCCO | (1 << 17); // Set mreq to activate
	for (delayX = 0xAC; delayX; --delayX) {}            // Delay for 72 uSec @ 12Mhz
	LPC_SYSCON->SYSPLLSSCGCTRL[0] = i;                  // clear mreq to prepare for restoring mreq
	LPC_SYSCON->SYSPLLSSCGCTRL[0] = i | (1 << 17);      // set original value back and activate
	while (!(LPC_SYSCON->SYSPLLSTAT & 0x01));	        // Wait Until PLL Locked   

	// System voltage adjustment, occurs prior to setting main system clock
 	//Chip_POWER_SetVoltage(POWER_LOW_POWER_MODE, 0x05B8D800); // value is curPllRate, this is a libpower.a call
 	mike_POWER_SetVoltage(POWER_LOW_POWER_MODE, 0x05B8D800); // value is curPllRate, this is a libpower.a call

	LPC_SYSCON->SYSAHBCLKDIV = 1;
	LPC_SYSCON->MAINCLKSELB = 2; // PLLOUT
	LPC_SYSCON->ASYNCVPBCTRL = 0x01; // Enable asynchronous APB bridge and subsystem 
	LPC_ASYNC_SYSCON->ASYNCVPBCLKSELA = 0; // Select IRC Clock Output
	LPC_ASYNC_SYSCON->ASYNCVPBCLKSELB = 3; // Select ASYNCVPBCLKSELA

	LPC_SYSCON->PRESETCTRLSET[0] = 1 << 14; // toggle GPIO resets
	LPC_SYSCON->PRESETCTRLCLR[0] = 1 << 14;
	LPC_SYSCON->PRESETCTRLSET[0] = 1 << 15;
	LPC_SYSCON->PRESETCTRLCLR[0] = 1 << 15;

#if defined CORE_M4
  fpu_init();
#endif  

  #ifdef FOR_BASIC
	MEMCPY((void *)0x02000000, (void *)0x00000000, 58<<2);
	SCB->VTOR = 0x02000000; //assign new vector table in RAM, so interrupts can be patched by BASIC
  #endif
  	
	//LPC_GPIO->DIR[0] |= 1 << 31; // LED
	//LPC_GPIO->DIR[0] |= 1 << 2;
	//LPC_GPIO->DIR[0] |= 1 << 21;
	
	//LPC_SYSCON->SYSAHBCLKCTRL[0] |= 1<<26; // Enable Mailbox from M4

#endif

	//NVIC->ISER[0] = (1 << 31); // Enable mailbox interrupt from both M4 and M0
}

//#ifdef LPC54102m0
//void MBOX_IRQHandler(void)
//{
//	//uint32_t *psharedLEDStates = (uint32_t *) Chip_MBOX_GetValue(LPC_MBOX, myCoreBox);
//	//while (LPC_MBOX->MUTEX == 0) {}//	mutexTake();
////	sharedLEDStates = *psharedLEDStates;
////	ledToggleBit(1);
////	*psharedLEDStates = sharedLEDStates;
//	//LPC_MBOX->MUTEX = 1;//	mutexGive();

//	LPC_MBOX->BOX[0].IRQCLR = 0xFFFFFFFF; // clear interrupt
//	LPC_MBOX->BOX[1].IRQ = 1; // ACK back
//	LPC_GPIO->NOT[0] = 1 << 2; // wiggle P0.2 for LA
//}
//#else
//void MBOX_IRQHandler(void)
//{
//	//updateLEDStates();
//	LPC_MBOX->BOX[1].IRQCLR = 0xFFFFFFFF;
//	LPC_GPIO->NOT[0] = 1 << 21;
//}
//#endif

#if defined CORE_M4
void M0_start(void) {
	// boot m0
	volatile unsigned int stackAddr = *(int*)0x00004000;//stackAddr
	volatile unsigned int jumpAddr  = *(int*)0x00004004;//jumpAddr
	LPC_SYSCTL->CPBOOT  = jumpAddr;   // ResetISR of M0
	LPC_SYSCTL->CPSTACK = stackAddr;  // end of M0 stack
	LPC_SYSCTL->CPUCTRL = 0xC0C4806D; // reset M0
	LPC_SYSCTL->CPUCTRL = 0xC0C4804D; // here we go
}
#endif


void IO2AD(int chan) {
	if(chan==0 )LPC_IOCON->PIO[0][29] = 0; else // PIO0_29 ADC_0 
	if(chan==1 )LPC_IOCON->PIO[0][30] = 0; else // PIO0_30 ADC_1 
	if(chan==2 )LPC_IOCON->PIO[0][31] = 0; else // PIO0_31 ADC_2 
	if(chan==3 )LPC_IOCON->PIO[1][0 ] = 0; else // PIO1_0  ADC_3 
	if(chan==4 )LPC_IOCON->PIO[1][1 ] = 0; else // PIO1_1  ADC_4 
	if(chan==5 )LPC_IOCON->PIO[1][2 ] = 0; else // PIO1_2  ADC_5 
	if(chan==6 )LPC_IOCON->PIO[1][3 ] = 0; else // PIO1_3  ADC_6 
	if(chan==7 )LPC_IOCON->PIO[1][4 ] = 0; else // PIO1_4  ADC_7 
	if(chan==8 )LPC_IOCON->PIO[1][5 ] = 0; else // PIO1_5  ADC_8 
	if(chan==9 )LPC_IOCON->PIO[1][6 ] = 0; else // PIO1_6  ADC_9 
	if(chan==10)LPC_IOCON->PIO[1][7 ] = 0; else // PIO1_7  ADC_10
	if(chan==11)LPC_IOCON->PIO[1][8 ] = 0;      // PIO1_8  ADC_11
}

 
#if defined CORE_M4

#define	LPC_CPACR	        0xE000ED88               

#define SCB_MVFR0           0xE000EF40
#define SCB_MVFR0_RESET     0x10110021

#define SCB_MVFR1           0xE000EF44
#define SCB_MVFR1_RESET     0x11000011

void fpu_init(void)
{
// from arm trm manual:
//                ; CPACR is located at address 0xE000ED88
//                LDR.W R0, =0xE000ED88
//                ; Read CPACR
//                LDR R1, [R0]
//                ; Set bits 20-23 to enable CP10 and CP11 coprocessors
//                ORR R1, R1, #(0xF << 20)
//                ; Write back the modified value to the CPACR
//                STR R1, [R0]

                
    volatile uint32_t* regCpacr = (uint32_t*) LPC_CPACR;
    volatile uint32_t* regMvfr0 = (uint32_t*) SCB_MVFR0;
    volatile uint32_t* regMvfr1 = (uint32_t*) SCB_MVFR1;
    volatile uint32_t Cpacr;
    volatile uint32_t Mvfr0;
    volatile uint32_t Mvfr1;    
    char vfpPresent = 0;

    Mvfr0 = *regMvfr0;
    Mvfr1 = *regMvfr1;

    vfpPresent = ((SCB_MVFR0_RESET == Mvfr0) && (SCB_MVFR1_RESET == Mvfr1));
    
    if(vfpPresent)
    {
        Cpacr = *regCpacr;
        Cpacr |= (0xF << 20);
        *regCpacr = Cpacr;   // enable CP10 and CP11 for full access
    }
}

#endif

/// Pin muxing table 
//const PINMUX_GRP_T pinmuxing[] = {
//	// UART0 
//	{0, 0,  (IOCON_FUNC1 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// UART0 RX 
//	{0, 1,  (IOCON_FUNC1 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// UART0 TX 

//	// UART1 
//	{0, 5,  (IOCON_FUNC1 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// UART1 RX 
//	{0, 6,  (IOCON_FUNC1 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// UART1 TX 

//	// UART2 
//	{0, 8,  (IOCON_FUNC1 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// UART2 RX 
//	{0, 9,  (IOCON_FUNC1 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// UART2 TX 

//	// UART3 
//	{1, 12, (IOCON_FUNC2 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// UART3 RX 
//	{1, 13, (IOCON_FUNC2 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// UART3 TX 

//	// SPI0 (bridge) 
//	{0, 12, (IOCON_FUNC1 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN)},// BRIDGE_MOSI (SPI MOSI) 
//	{0, 13, (IOCON_FUNC1 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN)},// BRIDGE_MISO (MISO) 
//	// 0, 14 BRIDGE_SSEL is configured in ConfigureBridgeSSEL() 
//	{1, 3,  (IOCON_FUNC5 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN)},// BRIDGE_SCK (SCK) 
//	{0, 19, (IOCON_FUNC0 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN)},	// BRIDGE_INTR (GPIO) 
//	{0, 20, (IOCON_FUNC0 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN)},// BRIDGE_GPIO (GPIO) 

//	// SPI1 (master) 
//	{1, 6,  (IOCON_FUNC2 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN)},// SPI1_SCK 
//	{1, 7,  (IOCON_FUNC2 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN)},// SPI1_MOSI 
//	{1, 14, (IOCON_FUNC4 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN)},// SPI1_MISO 
//	{1, 15, (IOCON_FUNC4 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN)},// SPI1_SSEL0 

//	// I2C0 standard/fast (master) 
//	{0, 23, (IOCON_FUNC1 | IOCON_MODE_INACT | IOCON_DIGITAL_EN | IOCON_STDI2C_EN)},	// I2C0_SCL (SCL) 
//	{0, 24, (IOCON_FUNC1 | IOCON_MODE_INACT | IOCON_DIGITAL_EN | IOCON_STDI2C_EN)},	// I2C0_SDA-WAKEUP (SDA) 

//	// I2C1 standard/fast (bridge) 
//	{0, 27, (IOCON_FUNC1 | IOCON_MODE_INACT | IOCON_DIGITAL_EN | IOCON_STDI2C_EN)},	// BRIDGE_SCL (SCL) 
//	{0, 28, (IOCON_FUNC1 | IOCON_MODE_INACT | IOCON_DIGITAL_EN | IOCON_STDI2C_EN)},	// BRIDGE_SDA (SDA) 

//	// ADC inputs 
//	{1, 0,  (IOCON_FUNC0 | IOCON_MODE_INACT)},	// ADC3 
//	{1, 1,  (IOCON_FUNC0 | IOCON_MODE_INACT)},	// ADC4 
//	{1, 2,  (IOCON_FUNC0 | IOCON_MODE_INACT)},	// ADC5 
//	{1, 4,  (IOCON_FUNC0 | IOCON_MODE_INACT)},	// ADC7 
//	{1, 5,  (IOCON_FUNC0 | IOCON_MODE_INACT)},	// ADC8 
//	{1, 8,  (IOCON_FUNC0 | IOCON_MODE_INACT)},	// ADC11 
//	//PIO0_29 ADC_0 
//	//PIO0_30 ADC_1 
//	//PIO0_31 ADC_2 
//	//PIO1_0  ADC_3 
//	//PIO1_1  ADC_4 
//	//PIO1_2  ADC_5 
//	//PIO1_3  ADC_6 
//	//PIO1_4  ADC_7 
//	//PIO1_5  ADC_8 
//	//PIO1_6  ADC_9 
//	//PIO1_7  ADC_10
//	//PIO1_8  ADC_11

//	// Misc 

//	na {0, 25, (IOCON_FUNC2 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// UART1 CTS 
//	na {1, 11, (IOCON_FUNC2 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// UART1 RTS 
//	{0, 2,  (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// ARDUINO_INT 
//	{0, 3,  (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// CT32B1_MAT3 
//	taken for uart {0, 6,  (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// CT32B0_MAT1 
//	{0, 7,  (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// CT32B0_MAT2 
//	taken for uart {0, 8,  (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// CT32B0_MAT3 
//	taken for uart {0, 9,  (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// DMIC_DATA 
//	{0, 10, (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// BTLE_CONN 
//	{0, 11, (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// DMIC_CLKIN 
//	{0, 21, (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// CLKOUT-CT32B3_MAT0 
//	{0, 26, (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// I2C1_SDA-CT32B0_CAP3 
//	{1, 9,  (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// BTLE_CMD_DAT 
//	{1, 16, (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// CT32B0_MAT0 
//	{1, 17, (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// IR_LEARN_EN 

//	// Debugger signals 
//	{0, 15, (IOCON_FUNC2 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// SWO 
//#if 0
//	// Not setup by SystemInit(), since default state after reset is already correct 
//	{0, 16, (IOCON_FUNC5 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// SWCLK_TCK 
//	{0, 17, (IOCON_FUNC5 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// SWDIO 
//#endif

//	// Sensor related 
//	{0, 4,  (IOCON_FUNC0 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN)},// GYR_INT1 (GPIO input) 
//	{0, 18, (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGITAL_EN)},	// CT32B0_MAT0-ACCL_INT1 
//	{0, 22, (IOCON_FUNC0 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN)},// MAG_DRDY_INT (GPIO input) 

//	// LEDs on P0.29, P0.30, and P0.31 are set as part of Board_LED_Init(), left in GPIO state 
//};
