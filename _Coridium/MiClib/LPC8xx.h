/****************************************************************************
 *   $Id:: LPC8xx.h 6437 2012-10-31 11:06:06Z dep00694                     $
 *   Project: NXP LPC8xx software example  
 *
 *   Description:
 *     CMSIS Cortex-M0+ Core Peripheral Access Layer Header File for 
 *     NXP LPC800 Device Series 
 *
 ****************************************************************************
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * products. This software is supplied "AS IS" without any warranties.
 * NXP Semiconductors assumes no responsibility or liability for the
 * use of the software, conveys no license or title under any patent,
 * copyright, or mask work right to the product. NXP Semiconductors
 * reserves the right to make changes in the software without
 * notification. NXP Semiconductors also make no representation or
 * warranty that such application will be suitable for the specified
 * use without further testing or modification.

 * Permission to use, copy, modify, and distribute this software and its 
 * documentation is hereby granted, under NXP Semiconductors' 
 * relevant copyright in the software, without fee, provided that it 
 * is used in conjunction with NXP Semiconductors microcontrollers. This 
 * copyright, permission, and disclaimer notice must appear in all copies of 
 * this code.
 
  modofied for LPC82x.h Coridium Corp Jan 10, 2015
  
****************************************************************************/
#ifndef __LPC8xx_H__
#define __LPC8xx_H__

#define CORE_M0

#ifndef GCC_ASM_STEP

#ifdef __cplusplus
 extern "C" {
#endif 

/** @addtogroup LPC8xx_Definitions LPC8xx Definitions
  This file defines all structures and symbols for LPC8xx:
    - Registers and bitfields
    - peripheral base address
    - PIO definitions
  @{
*/


/******************************************************************************/
/*                Processor and Core Peripherals                              */
/******************************************************************************/
/** @addtogroup LPC8xx_CMSIS LPC8xx CMSIS Definitions
  Configuration of the Cortex-M0+ Processor and Core Peripherals
  @{
*/

/*
 * ==========================================================================
 * ---------- Interrupt Number Definition -----------------------------------
 * ==========================================================================
 */
typedef enum IRQn
{
/******  Cortex-M0 Processor Exceptions Numbers ***************************************************/
  Reset_IRQn                    = -15,    /*!< 1 Reset Vector, invoked on Power up and warm reset*/  
  NonMaskableInt_IRQn           = -14,    /*!< 2 Non Maskable Interrupt                           */
  HardFault_IRQn                = -13,    /*!< 3 Cortex-M0 Hard Fault Interrupt                   */
  SVCall_IRQn                   = -5,     /*!< 11 Cortex-M0 SV Call Interrupt                     */
  PendSV_IRQn                   = -2,     /*!< 14 Cortex-M0 Pend SV Interrupt                     */
  SysTick_IRQn                  = -1,     /*!< 15 Cortex-M0 System Tick Interrupt                 */

/******  LPC8xx Specific Interrupt Numbers ********************************************************/
  SPI0_IRQn                     = 0,        /*!< SPI0                                             */
  SPI1_IRQn                     = 1,        /*!< SPI1                                             */
  Reserved0_IRQn                = 2,        /*!< Reserved Interrupt                               */	
  UART0_IRQn                    = 3,        /*!< USART0                                            */
  UART1_IRQn                    = 4,        /*!< USART1                                            */
  UART2_IRQn                    = 5,        /*!< USART2                                            */
  Reserved1_IRQn                = 6,        /*!< Reserved Interrupt                               */    
  I2C1_IRQn                     = 7,        /*!< I2C1                               */
  I2C_IRQn                      = 8,        /*!< I2C0                                              */
  SCT_IRQn                      = 9,        /*!< SCT                                              */
  MRT_IRQn                      = 10,       /*!< MRT                                              */ 
  CMP_IRQn                      = 11,       /*!< CMP                                              */
  WDT_IRQn                      = 12,       /*!< WDT                                              */
  BOD_IRQn                      = 13,       /*!< BOD                                              */
  FLASH_IRQn                    = 14,       /*!< Flash                               */
  WKT_IRQn                      = 15,       /*!< WKT Interrupt                                    */
  ADC_SEQA_IRQn                 = 16,       /*!< ADC sequence A completion                               */    
  ADC_SEQB_IRQn                 = 17,       /*!< ADC sequence B completion                               */
  ADC_THCMP_IRQn                = 18,       /*!< ADC threshold compare                               */    
  ADC_OVR_IRQn                  = 19,       /*!< ADC overrun                               */
  DMA_IRQn                      = 20,       /*!< DMA interrupt                               */    
  I2C2n_IRQn                    = 21,       /*!< I2C2                               */
  I2C3n_IRQn                    = 22,       /*!< I2C3                               */    
  CT32B0_IRQn                   = 23,       /*!< Reserved Interrupt                               */
  PININT0_IRQn               	= 24,       /*!< External Interrupt 0                             */
  PININT1_IRQn                  = 25,       /*!< External Interrupt 1                             */  
  PININT2_IRQn                  = 26,       /*!< External Interrupt 2                             */
  PININT3_IRQn                  = 27,       /*!< External Interrupt 3                             */
  PININT4_IRQn                  = 28,       /*!< External Interrupt 4                             */
  PININT5_IRQn                  = 29,       /*!< External Interrupt 5                             */
  PININT6_IRQn                  = 30,       /*!< External Interrupt 6                             */
  PININT7_IRQn                  = 31,       /*!< External Interrupt 7                             */
} IRQn_Type;

/*
 * ==========================================================================
 * ----------- Processor and Core Peripheral Section ------------------------
 * ==========================================================================
 */

/* Configuration of the Cortex-M0+ Processor and Core Peripherals */
#define __MPU_PRESENT             0         /*!< MPU present or not                               */
#define __NVIC_PRIO_BITS          2         /*!< Number of Bits used for Priority Levels          */
#define __Vendor_SysTickConfig    0         /*!< Set to 1 if different SysTick Config is used     */

/*@}*/ /* end of group LPC8xx_CMSIS */


#include "core_cm0plus.h"                  /* Cortex-M0+ processor and core peripherals          */
#include "system_LPC8xx.h"                 /* System Header                                      */


/******************************************************************************/
/*                Device Specific Peripheral Registers structures             */
/******************************************************************************/

#if defined ( __CC_ARM   )
#pragma anon_unions
#endif

/*------------- System Control (SYSCON) --------------------------------------*/
/** @addtogroup LPC8xx_SYSCON LPC8xx System Control Block 
  @{
*/
typedef struct
{
  __IO uint32_t SYSMEMREMAP;            /*!< Offset: 0x000 System memory remap (R/W) */
  __IO uint32_t PRESETCTRL;             /*!< Offset: 0x004 Peripheral reset control (R/W) */
  __IO uint32_t SYSPLLCTRL;             /*!< Offset: 0x008 System PLL control (R/W) */
  __IO uint32_t SYSPLLSTAT;             /*!< Offset: 0x00C System PLL status (R/W ) */
       uint32_t RESERVED0[4];

  __IO uint32_t SYSOSCCTRL;             /*!< Offset: 0x020 System oscillator control (R/W) */
  __IO uint32_t WDTOSCCTRL;             /*!< Offset: 0x024 Watchdog oscillator control (R/W) */            
       uint32_t RESERVED1[2];
  __IO uint32_t SYSRSTSTAT;             /*!< Offset: 0x030 System reset status Register (R/W ) */
       uint32_t RESERVED2[3];
  __IO uint32_t SYSPLLCLKSEL;           /*!< Offset: 0x040 System PLL clock source select (R/W) */	
  __IO uint32_t SYSPLLCLKUEN;           /*!< Offset: 0x044 System PLL clock source update enable (R/W) */
       uint32_t RESERVED3[10];

  __IO uint32_t MAINCLKSEL;             /*!< Offset: 0x070 Main clock source select (R/W) */
  __IO uint32_t MAINCLKUEN;             /*!< Offset: 0x074 Main clock source update enable (R/W) */
  __IO uint32_t SYSAHBCLKDIV;           /*!< Offset: 0x078 System AHB clock divider (R/W) */
       uint32_t RESERVED4[1];

  __IO uint32_t SYSAHBCLKCTRL;          /*!< Offset: 0x080 System AHB clock control (R/W) */
#ifdef LPC802
       uint32_t RESERVED5[3];         
  __IO uint32_t UARTCLKSEL[2];          /*!< Offset: 0x090 UART clock select (R/W) */         
       uint32_t RESERVED6[3];
  __IO uint32_t I2CCLKSEL;             /*!< Offset: 0x0A4 I2C  clock select (R/W) */         
       uint32_t RESERVED6a[3];
  __IO uint32_t SPICLKSEL;             /*!< Offset: 0x0B4 SPI  clock select (R/W) */         
       uint32_t RESERVED6b[6];
  __IO uint32_t UARTFRGDIV;              /*!< Offset: 0x0D0 UART fractional divider SUB(R/W) */ 
  __IO uint32_t UARTFRGMULT;             /*!< Offset: 0x0D4 UART fractional multiplier ADD(R/W) */   
  __IO uint32_t UARTFRGSEL;              /*!< Offset: 0x0D8 UART fractional select ADD(R/W) */   
       uint32_t RESERVED6c;
#else
       uint32_t RESERVED5[4];         
  __IO uint32_t UARTCLKDIV;          /*!< Offset: 0x094 UART clock select (R/W) */         
       uint32_t RESERVED6[18];
#endif 

  __IO uint32_t CLKOUTSEL;              /*!< Offset: 0x0E0 CLKOUT clock source select (R/W) */
  __IO uint32_t CLKOUTUEN;              /*!< Offset: 0x0E4 CLKOUT clock source update enable (R/W) */
  __IO uint32_t CLKOUTDIV;              /*!< Offset: 0x0E8 CLKOUT clock divider (R/W) */       
#ifdef LPC802
       uint32_t RESERVED7[3];
#else  
       uint32_t RESERVED7;
  __IO uint32_t UARTFRGDIV;              /*!< Offset: 0x0F0 UART fractional divider SUB(R/W) */ 
  __IO uint32_t UARTFRGMULT;             /*!< Offset: 0x0F4 UART fractional multiplier ADD(R/W) */   
#endif
       uint32_t RESERVED8[1];  
  __IO uint32_t EXTTRACECMD;            /*!< (@ 0x400480FC) External trace buffer command register  */  
  __IO uint32_t PIOPORCAP0;             /*!< Offset: 0x100 POR captured PIO status 0 (R/ ) */  
       uint32_t RESERVED9[12];
  __IO uint32_t IOCONCLKDIV[7];       /*!< (@0x40048134-14C) Peripheral clock x to the IOCON block for programmable glitch filter */
  __IO uint32_t BODCTRL;                /*!< Offset: 0x150 BOD control (R/W) */
  __IO uint32_t SYSTCKCAL;              /*!< Offset: 0x154 System tick counter calibration (R/W) */
       uint32_t RESERVED10[6];
  __IO uint32_t IRQLATENCY;             /*!< (@ 0x40048170) IRQ delay */
  __IO uint32_t NMISRC;                 /*!< (@ 0x40048174) NMI Source Control     */
  __IO uint32_t PINTSEL[8];             /*!< (@ 0x40048178) GPIO Pin Interrupt Select register 0 */
       uint32_t RESERVED11[27];
  __IO uint32_t STARTERP0;              /*!< Offset: 0x204 Start logic signal enable Register 0 (R/W) */      
       uint32_t RESERVED12[3];
  __IO uint32_t STARTERP1;              /*!< Offset: 0x214 Start logic signal enable Register 0 (R/W) */      
       uint32_t RESERVED13[6];
  __IO uint32_t PDSLEEPCFG;             /*!< Offset: 0x230 Power-down states in Deep-sleep mode (R/W) */
  __IO uint32_t PDAWAKECFG;             /*!< Offset: 0x234 Power-down states after wake-up (R/W) */        
  __IO uint32_t PDRUNCFG;               /*!< Offset: 0x238 Power-down configuration Register (R/W) */
       uint32_t RESERVED14[110];
  __I  uint32_t DEVICE_ID;              /*!< Offset: 0x3F4 Device ID (R/ ) */
} LPC_SYSCON_TypeDef;
/*@}*/ /* end of group LPC8xx_SYSCON */


#if defined LPC824
/**
  * @brief I/O configuration (IOCON) (IOCON)
  */
 
typedef struct {                                    /*!< (@ 0x40044000) IOCON Structure                                        */
  __IO uint32_t  PIO0_17;                           /*!< (@ 0x40044000) I/O configuration for pin PIO0_17                      */
  __IO uint32_t  PIO0_13;                           /*!< (@ 0x40044004) I/O configuration for pin PIO0_13                      */
  __IO uint32_t  PIO0_12;                           /*!< (@ 0x40044008) I/O configuration for pin PIO0_12                      */
  __IO uint32_t  PIO0_5;                            /*!< (@ 0x4004400C) I/O configuration for pin PIO0_5/RESET                 */
  __IO uint32_t  PIO0_4;                            /*!< (@ 0x40044010) I/O configuration for pin PIO0_4                       */
  __IO uint32_t  PIO0_3;                            /*!< (@ 0x40044014) I/O configuration for pin PIO0_3/SWCLK                 */
  __IO uint32_t  PIO0_2;                            /*!< (@ 0x40044018) I/O configuration for pin PIO0_2/SWDIO                 */
  __IO uint32_t  PIO0_11;                           /*!< (@ 0x4004401C) I/O configuration for pin PIO0_11. This is the
                                                         pin configuration for the true open-drain pin.                        */
  __IO uint32_t  PIO0_10;                           /*!< (@ 0x40044020) I/O configuration for pin PIO0_10. This is the
                                                         pin configuration for the true open-drain pin.                        */
  __IO uint32_t  PIO0_16;                           /*!< (@ 0x40044024) I/O configuration for pin PIO0_16                      */
  __IO uint32_t  PIO0_15;                           /*!< (@ 0x40044028) I/O configuration for pin PIO0_15                      */
  __IO uint32_t  PIO0_1;                            /*!< (@ 0x4004402C) I/O configuration for pin PIO0_17                      */
  __I  uint32_t  RESERVED0;
  __IO uint32_t  PIO0_9;                            /*!< (@ 0x40044034) I/O configuration for pin PIO0_9/XTALOUT               */
  __IO uint32_t  PIO0_8;                            /*!< (@ 0x40044038) I/O configuration for pin PIO0_8/XTALIN                */
  __IO uint32_t  PIO0_7;                            /*!< (@ 0x4004403C) I/O configuration for pin PIO0_7                       */
  __IO uint32_t  PIO0_6;                            /*!< (@ 0x40044040) I/O configuration for pin PIO0_6/VDDCMP                */
  __IO uint32_t  PIO0_0;                            /*!< (@ 0x40044044) I/O configuration for pin PIO0_0/ACMP_I0               */
  __IO uint32_t  PIO0_14;                           /*!< (@ 0x40044048) I/O configuration for pin PIO0_14                      */
  __I  uint32_t  RESERVED1;
  __IO uint32_t  PIO0_28;                           /*!< (@ 0x40044050) I/O configuration for pin PIO0_28                      */
  __IO uint32_t  PIO0_27;                           /*!< (@ 0x40044054) I/O configuration for pin PIO0_27                      */
  __IO uint32_t  PIO0_26;                           /*!< (@ 0x40044058) I/O configuration for pin PIO0_26                      */
  __IO uint32_t  PIO0_25;                           /*!< (@ 0x4004405C) I/O configuration for pin PIO0_25                      */
  __IO uint32_t  PIO0_24;                           /*!< (@ 0x40044060) I/O configuration for pin PIO0_24                      */
  __IO uint32_t  PIO0_23;                           /*!< (@ 0x40044064) I/O configuration for pin PIO0_23/ADC_3                */
  __IO uint32_t  PIO0_22;                           /*!< (@ 0x40044068) I/O configuration for pin PIO0_22/ADC_4                */
  __IO uint32_t  PIO0_21;                           /*!< (@ 0x4004406C) I/O configuration for pin PIO0_21/ACMP_I4/ADC_5        */
  __IO uint32_t  PIO0_20;                           /*!< (@ 0x40044070) I/O configuration for pin PIO0_20/ADC_6                */
  __IO uint32_t  PIO0_19;                           /*!< (@ 0x40044074) I/O configuration for pin PIO0_19/ADC_7                */
  __IO uint32_t  PIO0_18;                           /*!< (@ 0x40044078) I/O configuration for pin PIO0_18/ADC_8                */
} LPC_IOCON_TypeDef;
 
 
#else
/**
  * @brief Product name title=UM10462 Chapter title=LPC8xx I/O configuration Modification date=3/16/2011 Major revision=0 Minor revision=3  (IOCONFIG)
  */

typedef struct {                            /*!< (@ 0x40044000) IOCONFIG Structure     */
  __IO uint32_t PIO0_17;                    /*!< (@ 0x40044000) I/O configuration for pin PIO0_17 */
  __IO uint32_t PIO0_13;                    /*!< (@ 0x40044004) I/O configuration for pin PIO0_13 */
  __IO uint32_t PIO0_12;                    /*!< (@ 0x40044008) I/O configuration for pin PIO0_12 */
  __IO uint32_t PIO0_5;                     /*!< (@ 0x4004400C) I/O configuration for pin PIO0_5 */
  __IO uint32_t PIO0_4;                     /*!< (@ 0x40044010) I/O configuration for pin PIO0_4 */
  __IO uint32_t PIO0_3;                     /*!< (@ 0x40044014) I/O configuration for pin PIO0_3 */
  __IO uint32_t PIO0_2;                     /*!< (@ 0x40044018) I/O configuration for pin PIO0_2 */
  __IO uint32_t PIO0_11;                    /*!< (@ 0x4004401C) I/O configuration for pin PIO0_11 */
  __IO uint32_t PIO0_10;                    /*!< (@ 0x40044020) I/O configuration for pin PIO0_10 */
  __IO uint32_t PIO0_16;                    /*!< (@ 0x40044024) I/O configuration for pin PIO0_16 */
  __IO uint32_t PIO0_15;                    /*!< (@ 0x40044028) I/O configuration for pin PIO0_15 */
  __IO uint32_t PIO0_1;                     /*!< (@ 0x4004402C) I/O configuration for pin PIO0_1 */
  __IO uint32_t Reserved;                   /*!< (@ 0x40044030) I/O configuration for pin (Reserved) */
  __IO uint32_t PIO0_9;                     /*!< (@ 0x40044034) I/O configuration for pin PIO0_9 */
  __IO uint32_t PIO0_8;                     /*!< (@ 0x40044038) I/O configuration for pin PIO0_8 */
  __IO uint32_t PIO0_7;                     /*!< (@ 0x4004403C) I/O configuration for pin PIO0_7 */
  __IO uint32_t PIO0_6;                     /*!< (@ 0x40044040) I/O configuration for pin PIO0_6 */
  __IO uint32_t PIO0_0;                     /*!< (@ 0x40044044) I/O configuration for pin PIO0_0 */
  __IO uint32_t PIO0_14;                    /*!< (@ 0x40044048) I/O configuration for pin PIO0_14 */
} LPC_IOCON_TypeDef;

#endif
/*@}*/ /* end of group LPC8xx_IOCON */

/**
  * @brief Product name title=UM10462 Chapter title=LPC8xx Flash programming firmware Major revision=0 Minor revision=3  (FLASHCTRL)
  */
typedef struct {                            /*!< (@ 0x40040000) FLASHCTRL Structure    */
  __I  uint32_t  RESERVED0[4];
  __IO uint32_t  FLASHCFG;                          /*!< (@ 0x40040010) Flash configuration register                           */
  __I  uint32_t  RESERVED1[3];
  __IO uint32_t  FMSSTART;                          /*!< (@ 0x40040020) Signature start address register                       */
  __IO uint32_t  FMSSTOP;                           /*!< (@ 0x40040024) Signature stop-address register                        */
  __I  uint32_t  RESERVED2;
  __I  uint32_t  FMSW0; 
} LPC_FLASHCTRL_TypeDef;
/*@}*/ /* end of group LPC8xx_FLASHCTRL */


/*------------- Power Management Unit (PMU) --------------------------*/
/** @addtogroup LPC8xx_PMU LPC8xx Power Management Unit 
  @{
*/
typedef struct
{
  __IO uint32_t PCON;                   /*!< Offset: 0x000 Power control Register (R/W) */
  __IO uint32_t GPREG0;                 /*!< Offset: 0x004 General purpose Register 0 (R/W) */
  __IO uint32_t GPREG1;                 /*!< Offset: 0x008 General purpose Register 1 (R/W) */
  __IO uint32_t GPREG2;                 /*!< Offset: 0x00C General purpose Register 2 (R/W) */
  __IO uint32_t GPREG3;                 /*!< Offset: 0x010 General purpose Register 3 (R/W) */
  __IO uint32_t DPDCTRL;                /*!< Offset: 0x014 Deep power-down control register (R/W) */
} LPC_PMU_TypeDef;
/*@}*/ /* end of group LPC8xx_PMU */


/*------------- Switch Matrix Port --------------------------*/
/** @addtogroup LPC8xx_SWM LPC8xx Switch Matrix Port 
  @{
*/
typedef struct
{
  union {
    __IO uint32_t PINASSIGN[9];
    struct {
      __IO uint32_t PINASSIGN0;
      __IO uint32_t PINASSIGN1;
      __IO uint32_t PINASSIGN2;
      __IO uint32_t PINASSIGN3;
      __IO uint32_t PINASSIGN4;
      __IO uint32_t PINASSIGN5;
      __IO uint32_t PINASSIGN6;
      __IO uint32_t PINASSIGN7;
      __IO uint32_t PINASSIGN8;
    };
  };
  __I  uint32_t  RESERVED0[103];
  __IO uint32_t  PINENABLE0;
} LPC_SWM_TypeDef;
/*@}*/ /* end of group LPC8xx_SWM */


// ------------------------------------------------------------------------------------------------
// -----                                       GPIO_PORT                                      -----
// ------------------------------------------------------------------------------------------------

/**
  * @brief Product name title=UM10462 Chapter title=LPC8xx GPIO Modification date=3/17/2011 Major revision=0 Minor revision=3  (GPIO_PORT)
  */
#if defined LPC824
typedef struct {                            
  __IO uint8_t B0[29];                   /*!< (@ 0xA0000000) Byte pin registers port 0 */
  __I  uint8_t   RESERVED0[4067];
  __IO uint32_t W0[29];                  /*!< (@ 0xA0001000) Word pin registers port 0 */
       uint32_t RESERVED1[995];
  __IO uint32_t DIR[1];                          /* 0x2000 */
       uint32_t RESERVED2[31];
  __IO uint32_t MASK[1];                                 /* 0x2080 */
       uint32_t RESERVED3[31];
  __IO uint32_t PIN[1];                          /* 0x2100 */
       uint32_t RESERVED4[31];
  __IO uint32_t MPIN[1];                                   /* 0x2180 */
       uint32_t RESERVED5[31];
  __IO uint32_t SET[1];                         /* 0x2200 */
       uint32_t RESERVED6[31];
  __O  uint32_t CLR[1];                         /* 0x2280 */
       uint32_t RESERVED7[31];
  __O  uint32_t NOT0;                                    /* 0x2300 */
  __I  uint32_t  RESERVED8[31];
  __O  uint32_t  DIRSET0;                           /*!< (@ 0xA0002380) Set pin direction bits for port 0.                     */
  __I  uint32_t  RESERVED9[31];
  __O  uint32_t  DIRCLR0;                           /*!< (@ 0xA0002400) Clear pin direction bits for port 0.                   */
  __I  uint32_t  RESERVED10[31];
  __O  uint32_t  DIRNOT0;                           /*!< (@ 0xA0002480) Toggle pin direction bits for port 0.                  */

} LPC_GPIO_PORT_TypeDef;

#else

typedef struct {                            
  __IO uint8_t B0[18];                   /*!< (@ 0xA0000000) Byte pin registers port 0 */
  __I  uint16_t RESERVED0[2039];
  __IO uint32_t W0[18];                  /*!< (@ 0xA0001000) Word pin registers port 0 */
       uint32_t RESERVED1[1006];
  __IO uint32_t DIR[1];                          /* 0x2000 */
       uint32_t RESERVED2[31];
  __IO uint32_t MASK[1];                                  /* 0x2080 */
       uint32_t RESERVED3[31];
  __IO uint32_t PIN[1];                          /* 0x2100 */
       uint32_t RESERVED4[31];
  __IO uint32_t MPIN[1];                                   /* 0x2180 */
       uint32_t RESERVED5[31];
  __IO uint32_t SET[1];                         /* 0x2200 */
       uint32_t RESERVED6[31];
  __O  uint32_t CLR[1];                         /* 0x2280 */
       uint32_t RESERVED7[31];
  __O  uint32_t NOT[1];                                    /* 0x2300 */

} LPC_GPIO_PORT_TypeDef;
#endif

// ------------------------------------------------------------------------------------------------
// -----                                     PIN_INT                                     -----
// ------------------------------------------------------------------------------------------------

/**
  * @brief Product name title=UM10462 Chapter title=LPC8xx GPIO Modification date=3/17/2011 Major revision=0 Minor revision=3  (PIN_INT)
  */

typedef struct {                            /*!< (@ 0xA0004000) PIN_INT Structure */
  __IO uint32_t ISEL;                       /*!< (@ 0xA0004000) Pin Interrupt Mode register */
  __IO uint32_t IENR;                       /*!< (@ 0xA0004004) Pin Interrupt Enable (Rising) register */
  __IO uint32_t SIENR;                      /*!< (@ 0xA0004008) Set Pin Interrupt Enable (Rising) register */
  __IO uint32_t CIENR;                      /*!< (@ 0xA000400C) Clear Pin Interrupt Enable (Rising) register */
  __IO uint32_t IENF;                       /*!< (@ 0xA0004010) Pin Interrupt Enable Falling Edge / Active Level register */
  __IO uint32_t SIENF;                      /*!< (@ 0xA0004014) Set Pin Interrupt Enable Falling Edge / Active Level register */
  __IO uint32_t CIENF;                      /*!< (@ 0xA0004018) Clear Pin Interrupt Enable Falling Edge / Active Level address */
  __IO uint32_t RISE;                       /*!< (@ 0xA000401C) Pin Interrupt Rising Edge register */
  __IO uint32_t FALL;                       /*!< (@ 0xA0004020) Pin Interrupt Falling Edge register */
  __IO uint32_t IST;                        /*!< (@ 0xA0004024) Pin Interrupt Status register */
  __IO uint32_t PMCTRL;                     /*!< (@ 0xA0004028) GPIO pattern match interrupt control register          */
  __IO uint32_t PMSRC;                      /*!< (@ 0xA000402C) GPIO pattern match interrupt bit-slice source register */
  __IO uint32_t PMCFG;                      /*!< (@ 0xA0004030) GPIO pattern match interrupt bit slice configuration register */
} LPC_PIN_INT_TypeDef;


/*------------- CRC Engine (CRC) -----------------------------------------*/
/** @addtogroup LPC8xx_CRC 
  @{
*/
typedef struct
{
  __IO uint32_t MODE;
  __IO uint32_t SEED;
  union {
  __I  uint32_t SUM;
  __O  uint32_t WR_DATA_DWORD;
  __O  uint16_t WR_DATA_WORD;
       uint16_t RESERVED_WORD;
  __O  uint8_t WR_DATA_BYTE;
       uint8_t RESERVED_BYTE[3];
  };
} LPC_CRC_TypeDef;
/*@}*/ /* end of group LPC8xx_CRC */

/*------------- Comparator (CMP) --------------------------------------------------*/
/** @addtogroup LPC8xx_CMP LPC8xx Comparator
  @{
*/
typedef struct {                            /*!< (@ 0x40024000) CMP Structure          */
  __IO uint32_t  CTRL;                      /*!< (@ 0x40024000) Comparator control register */
  __IO uint32_t  LAD;                       /*!< (@ 0x40024004) Voltage ladder register */
} LPC_CMP_TypeDef;
/*@}*/ /* end of group LPC8xx_CMP */


/*------------- Wakeup Timer (WKT) --------------------------------------------------*/
/** @addtogroup LPC8xx_WKT 
  @{
*/
typedef struct {                            /*!< (@ 0x40028000) WKT Structure          */
  __IO uint32_t  CTRL;                      /*!< (@ 0x40028000) Alarm/Wakeup Timer Control register */
       uint32_t  Reserved[2];
  __IO uint32_t  COUNT;                     /*!< (@ 0x4002800C) Alarm/Wakeup TImer counter register */
} LPC_WKT_TypeDef;
/*@}*/ /* end of group LPC8xx_WKT */


/*------------- Multi-Rate Timer(MRT) --------------------------------------------------*/
typedef struct {
__IO uint32_t INTVAL;        							
__IO uint32_t TIMER;         							
__IO uint32_t CTRL;          							
__IO uint32_t STAT;          							
#if defined LPC824
  __IO uint32_t  INTVAL1;                           /*!< (@ 0x40004010) MRTx Time interval value register. This value
                                                         is loaded into the TIMERx register.                                   */
  __I  uint32_t  TIMER1;                            /*!< (@ 0x40004014) MRTx Timer register. This register reads the
                                                         value of the down-counter.                                            */
  __IO uint32_t  CTRL1;                             /*!< (@ 0x40004018) MRTx Control register. This register controls
                                                         the MRT0 modes.                                                       */
  __IO uint32_t  STAT1;                             /*!< (@ 0x4000401C) MRTx Status register.                                  */
  __IO uint32_t  INTVAL2;                           /*!< (@ 0x40004020) MRTx Time interval value register. This value
                                                         is loaded into the TIMERx register.                                   */
  __I  uint32_t  TIMER2;                            /*!< (@ 0x40004024) MRTx Timer register. This register reads the
                                                         value of the down-counter.                                            */
  __IO uint32_t  CTRL2;                             /*!< (@ 0x40004028) MRTx Control register. This register controls
                                                         the MRT0 modes.                                                       */
  __IO uint32_t  STAT2;                             /*!< (@ 0x4000402C) MRTx Status register.                                  */
  __IO uint32_t  INTVAL3;                           /*!< (@ 0x40004030) MRTx Time interval value register. This value
                                                         is loaded into the TIMERx register.                                   */
  __I  uint32_t  TIMER3;                            /*!< (@ 0x40004034) MRTx Timer register. This register reads the
                                                         value of the down-counter.                                            */
  __IO uint32_t  CTRL3;                             /*!< (@ 0x40004038) MRTx Control register. This register controls
                                                         the MRT0 modes.                                                       */
  __IO uint32_t  STAT3;                             /*!< (@ 0x4000403C) MRTx Status register.                                  */
  __I  uint32_t  RESERVED0[45];
  __I  uint32_t  IDLE_CH;                           /*!< (@ 0x400040F4) Idle channel register. This register returns
                                                         the number of the first idle channel.                                 */
  __IO uint32_t  IRQ_FLAG;                          /*!< (@ 0x400040F8) Global interrupt flag register                         */
#endif
} MRT_Channel_cfg_Type;

typedef struct {
  MRT_Channel_cfg_Type Channel[4]; 		
   uint32_t Reserved0[1]; 				
  __IO uint32_t IDLE_CH; 			
  __IO uint32_t IRQ_FLAG; 						
} LPC_MRT_TypeDef;


/*------------- Universal Asynchronous Receiver Transmitter (USART) -----------*/
/** @addtogroup LPC8xx_UART LPC8xx Universal Asynchronous Receiver/Transmitter 
  @{
*/
/**
  * @brief Product name title=LPC8xx MCU Chapter title=USART Modification date=4/18/2012 Major revision=0 Minor revision=9  (USART)
  */
  
#define MIN_UART
  
typedef struct
{
  __IO uint32_t  CFG;								/* 0x00 */
  __IO uint32_t  CTRL;
  __IO uint32_t  STAT;
  __IO uint32_t  INTENSET;
  __O  uint32_t  INTENCLR;					/* 0x10 */
  __I  uint32_t  RXDATA;
  __I  uint32_t  RXDATA_STAT;
  __IO uint32_t  TXDATA;
  __IO uint32_t  BRG;								/* 0x20 */
  __IO uint32_t  INTSTAT;
//} LPC_USART_TypeDef;
} LPC_UART_TypeDef;

/*@}*/ /* end of group LPC8xx_USART */


/*------------- Synchronous Serial Interface Controller (SPI) -----------------------*/
/** @addtogroup LPC8xx_SPI LPC8xx Synchronous Serial Port 
  @{
*/
typedef struct
{
  __IO uint32_t  CFG;			    /* 0x00 */
  __IO uint32_t  DLY;
  __IO uint32_t  STAT;
  __IO uint32_t  INTENSET;
  __O  uint32_t  INTENCLR;		/* 0x10 */
  __I  uint32_t  RXDAT;
  __IO uint32_t  TXDATCTL;
  __IO uint32_t  TXDAT;
  __IO uint32_t  TXCTRL;		  /* 0x20 */
  __IO uint32_t  DIV;
  __I  uint32_t  INTSTAT;
} LPC_SPI_TypeDef;
/*@}*/ /* end of group LPC8xx_SPI */


/*------------- Inter-Integrated Circuit (I2C) -------------------------------*/
/** @addtogroup LPC8xx_I2C I2C-Bus Interface 
  @{
*/
typedef struct
{
  __IO uint32_t  CFG;			  /* 0x00 */
  __IO uint32_t  STAT;
  __IO uint32_t  INTENSET;
  __O  uint32_t  INTENCLR;
  __IO uint32_t  TIMEOUT;		/* 0x10 */
  __IO uint32_t  DIV;
  __IO uint32_t  INTSTAT;
       uint32_t  Reserved0[1];  
  __IO uint32_t  MSTCTL;			  /* 0x20 */
  __IO uint32_t  MSTTIME;
  __IO uint32_t  MSTDAT;
       uint32_t  Reserved1[5];
  __IO uint32_t  SLVCTL;			  /* 0x40 */
  __IO uint32_t  SLVDAT;
  __IO uint32_t  SLVADR0;
  __IO uint32_t  SLVADR1;
  __IO uint32_t  SLVADR2;			  /* 0x50 */
  __IO uint32_t  SLVADR3;
  __IO uint32_t  SLVQUAL0;
       uint32_t  Reserved2[9];
  __I  uint32_t  MONRXDAT;			/* 0x80 */		
} LPC_I2C_TypeDef;

/*@}*/ /* end of group LPC8xx_I2C */

/**
  * @brief State Configurable Timer (SCT) (SCT)
  */

/**
  * @brief Product name title=UM10430 Chapter title=LPC8xx State Configurable Timer (SCT) Modification date=1/18/2011 Major revision=0 Minor revision=7  (SCT)
  */

#define CONFIG_SCT_nEV   (6)             /* Number of events */
#define CONFIG_SCT_nRG   (5)             /* Number of match/compare registers */
#define CONFIG_SCT_nOU   (4)             /* Number of outputs */

typedef struct
{
    __IO  uint32_t CONFIG;              /* 0x000 Configuration Register */
    union {
        __IO uint32_t CTRL_U;           /* 0x004 Control Register */
        struct {
            __IO uint16_t CTRL_L;       /* 0x004 low control register */
            __IO uint16_t CTRL_H;       /* 0x006 high control register */
        };
    };
    __IO uint16_t LIMIT_L;              /* 0x008 limit register for counter L */
    __IO uint16_t LIMIT_H;              /* 0x00A limit register for counter H */
    __IO uint16_t HALT_L;               /* 0x00C halt register for counter L */
    __IO uint16_t HALT_H;               /* 0x00E halt register for counter H */
    __IO uint16_t STOP_L;               /* 0x010 stop register for counter L */
    __IO uint16_t STOP_H;               /* 0x012 stop register for counter H */
    __IO uint16_t START_L;              /* 0x014 start register for counter L */
    __IO uint16_t START_H;              /* 0x016 start register for counter H */
         uint32_t RESERVED1[10];        /* 0x018-0x03C reserved */
    union {
        __IO uint32_t COUNT_U;          /* 0x040 counter register */
        struct {
            __IO uint16_t COUNT_L;      /* 0x040 counter register for counter L */
            __IO uint16_t COUNT_H;      /* 0x042 counter register for counter H */
        };
    };
    __IO uint16_t STATE_L;              /* 0x044 state register for counter L */
    __IO uint16_t STATE_H;              /* 0x046 state register for counter H */
    __I  uint32_t INPUT;                /* 0x048 input register */
    __IO uint16_t REGMODE_L;            /* 0x04C match - capture registers mode register L */
    __IO uint16_t REGMODE_H;            /* 0x04E match - capture registers mode register H */
    __IO uint32_t OUTPUT;               /* 0x050 output register */
    __IO uint32_t OUTPUTDIRCTRL;        /* 0x054 Output counter direction Control Register */
    __IO uint32_t RES;                  /* 0x058 conflict resolution register */
         uint32_t RESERVED2[37];        /* 0x05C-0x0EC reserved */
    __IO uint32_t EVEN;                 /* 0x0F0 event enable register */
    __IO uint32_t EVFLAG;               /* 0x0F4 event flag register */
    __IO uint32_t CONEN;                /* 0x0F8 conflict enable register */
    __IO uint32_t CONFLAG;              /* 0x0FC conflict flag register */

    union {
        __IO union {                    /* 0x100-... Match / Capture value */
            uint32_t U;                 /*       SCTMATCH[i].U  Unified 32-bit register */
            struct {
                uint16_t L;             /*       SCTMATCH[i].L  Access to L value */
                uint16_t H;             /*       SCTMATCH[i].H  Access to H value */
            };
        } MATCH[CONFIG_SCT_nRG];
        __I union {
            uint32_t U;                 /*       SCTCAP[i].U  Unified 32-bit register */
            struct {
                uint16_t L;             /*       SCTCAP[i].L  Access to H value */
                uint16_t H;             /*       SCTCAP[i].H  Access to H value */
            };
        } CAP[CONFIG_SCT_nRG];
    };


         uint32_t RESERVED3[32-CONFIG_SCT_nRG];      /* ...-0x17C reserved */

    union {
        __IO uint16_t MATCH_L[CONFIG_SCT_nRG];       /* 0x180-... Match Value L counter */
        __I  uint16_t CAP_L[CONFIG_SCT_nRG];         /* 0x180-... Capture Value L counter */
    };
         uint16_t RESERVED4[32-CONFIG_SCT_nRG];      /* ...-0x1BE reserved */
    union {
        __IO uint16_t MATCH_H[CONFIG_SCT_nRG];       /* 0x1C0-... Match Value H counter */
        __I  uint16_t CAP_H[CONFIG_SCT_nRG];         /* 0x1C0-... Capture Value H counter */
    };
		
         uint16_t RESERVED5[32-CONFIG_SCT_nRG];      /* ...-0x1FE reserved */

		
    union {
        __IO union {                    /* 0x200-... Match Reload / Capture Control value */
            uint32_t U;                 /*       SCTMATCHREL[i].U  Unified 32-bit register */
            struct {
                uint16_t L;             /*       SCTMATCHREL[i].L  Access to L value */
                uint16_t H;             /*       SCTMATCHREL[i].H  Access to H value */
            };
        } MATCHREL[CONFIG_SCT_nRG];
        __IO union {
            uint32_t U;                 /*       SCTCAPCTRL[i].U  Unified 32-bit register */
            struct {
                uint16_t L;             /*       SCTCAPCTRL[i].L  Access to H value */
                uint16_t H;             /*       SCTCAPCTRL[i].H  Access to H value */
            };
        } CAPCTRL[CONFIG_SCT_nRG];
    };

         uint32_t RESERVED6[32-CONFIG_SCT_nRG];      /* ...-0x27C reserved */

    union {
        __IO uint16_t MATCHREL_L[CONFIG_SCT_nRG];    /* 0x280-... Match Reload value L counter */
        __IO uint16_t CAPCTRL_L[CONFIG_SCT_nRG];     /* 0x280-... Capture Control value L counter */
    };
         uint16_t RESERVED7[32-CONFIG_SCT_nRG];      /* ...-0x2BE reserved */
    union {
        __IO uint16_t MATCHREL_H[CONFIG_SCT_nRG];    /* 0x2C0-... Match Reload value H counter */
        __IO uint16_t CAPCTRL_H[CONFIG_SCT_nRG];     /* 0x2C0-... Capture Control value H counter */
    };
         uint16_t RESERVED8[32-CONFIG_SCT_nRG];      /* ...-0x2FE reserved */

    __IO struct {                       /* 0x300-0x3FC  SCTEVENT[i].STATE / SCTEVENT[i].CTRL*/
        uint32_t STATE;                 /* Event State Register */
        uint32_t CTRL;                  /* Event Control Register */
    } EVENT[CONFIG_SCT_nEV];

         uint32_t RESERVED9[128-2*CONFIG_SCT_nEV];   /* ...-0x4FC reserved */

    __IO struct {                       /* 0x500-0x57C  SCTOUT[i].SET / SCTOUT[i].CLR */
        uint32_t SET;                   /* Output n Set Register */
        uint32_t CLR;                   /* Output n Clear Register */
    } OUT[CONFIG_SCT_nOU];

         uint32_t RESERVED10[191-2*CONFIG_SCT_nOU];  /* ...-0x7F8 reserved */

    __I  uint32_t MODULECONTENT;        /* 0x7FC Module Content */

} LPC_SCT_TypeDef;
/*@}*/ /* end of group LPC8xx_SCT */


/*------------- Watchdog Timer (WWDT) -----------------------------------------*/
/** @addtogroup LPC8xx_WDT LPC8xx WatchDog Timer 
  @{
*/
typedef struct
{
  __IO uint32_t MOD;                    /*!< Offset: 0x000 Watchdog mode register (R/W) */
  __IO uint32_t TC;                     /*!< Offset: 0x004 Watchdog timer constant register (R/W) */
  __O  uint32_t FEED;                   /*!< Offset: 0x008 Watchdog feed sequence register (W) */
  __I  uint32_t TV;                     /*!< Offset: 0x00C Watchdog timer value register (R) */
       uint32_t RESERVED;               /*!< Offset: 0x010 RESERVED                          */
  __IO uint32_t WARNINT;                /*!< Offset: 0x014 Watchdog timer warning int. register (R/W) */
  __IO uint32_t WINDOW;                 /*!< Offset: 0x018 Watchdog timer window value register (R/W) */
} LPC_WWDT_TypeDef;
/*@}*/ /* end of group LPC8xx_WDT */
 
/* ================================================================================ */
/* ================                       DMA                      ================ */
/* ================================================================================ */
 
 
/**
  * @brief DMA controller  (DMA)
  */
 
typedef struct {                                    /*!< (@ 0x50008000) DMA Structure                                          */
  __IO uint32_t  CTRL;                              /*!< (@ 0x50008000) DMA control.                                           */
  __I  uint32_t  INTSTAT;                           /*!< (@ 0x50008004) Interrupt status.                                      */
  __IO uint32_t  SRAMBASE;                          /*!< (@ 0x50008008) SRAM address of the channel configuration table.       */
  __I  uint32_t  RESERVED0[5];
  __IO uint32_t  ENABLESET0;                        /*!< (@ 0x50008020) Channel Enable read and Set for all DMA channels.      */
  __I  uint32_t  RESERVED1;
  __O  uint32_t  ENABLECLR0;                        /*!< (@ 0x50008028) Channel Enable Clear for all DMA channels.             */
  __I  uint32_t  RESERVED2;
  __I  uint32_t  ACTIVE0;                           /*!< (@ 0x50008030) Channel Active status for all DMA channels.            */
  __I  uint32_t  RESERVED3;
  __I  uint32_t  BUSY0;                             /*!< (@ 0x50008038) Channel Busy status for all DMA channels.              */
  __I  uint32_t  RESERVED4;
  __IO uint32_t  ERRINT0;                           /*!< (@ 0x50008040) Error Interrupt status for all DMA channels.           */
  __I  uint32_t  RESERVED5;
  __IO uint32_t  INTENSET0;                         /*!< (@ 0x50008048) Interrupt Enable read and Set for all DMA channels.    */
  __I  uint32_t  RESERVED6;
  __O  uint32_t  INTENCLR0;                         /*!< (@ 0x50008050) Interrupt Enable Clear for all DMA channels.           */
  __I  uint32_t  RESERVED7;
  __IO uint32_t  INTA0;                             /*!< (@ 0x50008058) Interrupt A status for all DMA channels.               */
  __I  uint32_t  RESERVED8;
  __IO uint32_t  INTB0;                             /*!< (@ 0x50008060) Interrupt B status for all DMA channels.               */
  __I  uint32_t  RESERVED9;
  __O  uint32_t  SETVALID0;                         /*!< (@ 0x50008068) Set ValidPending control bits for all DMA channels.    */
  __I  uint32_t  RESERVED10;
  __O  uint32_t  SETTRIG0;                          /*!< (@ 0x50008070) Set Trigger control bits for all DMA channels.         */
  __I  uint32_t  RESERVED11;
  __O  uint32_t  ABORT0;                            /*!< (@ 0x50008078) Channel Abort control for all DMA channels.            */
  __I  uint32_t  RESERVED12[225];
  __IO uint32_t  CFG0;                              /*!< (@ 0x50008400) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT0;                          /*!< (@ 0x50008404) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG0;                          /*!< (@ 0x50008408) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED13;
  __IO uint32_t  CFG1;                              /*!< (@ 0x50008410) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT1;                          /*!< (@ 0x50008414) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG1;                          /*!< (@ 0x50008418) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED14;
  __IO uint32_t  CFG2;                              /*!< (@ 0x50008420) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT2;                          /*!< (@ 0x50008424) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG2;                          /*!< (@ 0x50008428) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED15;
  __IO uint32_t  CFG3;                              /*!< (@ 0x50008430) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT3;                          /*!< (@ 0x50008434) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG3;                          /*!< (@ 0x50008438) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED16;
  __IO uint32_t  CFG4;                              /*!< (@ 0x50008440) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT4;                          /*!< (@ 0x50008444) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG4;                          /*!< (@ 0x50008448) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED17;
  __IO uint32_t  CFG5;                              /*!< (@ 0x50008450) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT5;                          /*!< (@ 0x50008454) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG5;                          /*!< (@ 0x50008458) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED18;
  __IO uint32_t  CFG6;                              /*!< (@ 0x50008460) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT6;                          /*!< (@ 0x50008464) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG6;                          /*!< (@ 0x50008468) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED19;
  __IO uint32_t  CFG7;                              /*!< (@ 0x50008470) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT7;                          /*!< (@ 0x50008474) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG7;                          /*!< (@ 0x50008478) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED20;
  __IO uint32_t  CFG8;                              /*!< (@ 0x50008480) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT8;                          /*!< (@ 0x50008484) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG8;                          /*!< (@ 0x50008488) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED21;
  __IO uint32_t  CFG9;                              /*!< (@ 0x50008490) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT9;                          /*!< (@ 0x50008494) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG9;                          /*!< (@ 0x50008498) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED22;
  __IO uint32_t  CFG10;                             /*!< (@ 0x500084A0) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT10;                         /*!< (@ 0x500084A4) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG10;                         /*!< (@ 0x500084A8) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED23;
  __IO uint32_t  CFG11;                             /*!< (@ 0x500084B0) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT11;                         /*!< (@ 0x500084B4) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG11;                         /*!< (@ 0x500084B8) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED24;
  __IO uint32_t  CFG12;                             /*!< (@ 0x500084C0) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT12;                         /*!< (@ 0x500084C4) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG12;                         /*!< (@ 0x500084C8) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED25;
  __IO uint32_t  CFG13;                             /*!< (@ 0x500084D0) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT13;                         /*!< (@ 0x500084D4) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG13;                         /*!< (@ 0x500084D8) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED26;
  __IO uint32_t  CFG14;                             /*!< (@ 0x500084E0) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT14;                         /*!< (@ 0x500084E4) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG14;                         /*!< (@ 0x500084E8) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED27;
  __IO uint32_t  CFG15;                             /*!< (@ 0x500084F0) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT15;                         /*!< (@ 0x500084F4) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG15;                         /*!< (@ 0x500084F8) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED28;
  __IO uint32_t  CFG16;                             /*!< (@ 0x50008500) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT16;                         /*!< (@ 0x50008504) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG16;                         /*!< (@ 0x50008508) Transfer configuration register for DMA channel
                                                         0.                                                                    */
  __I  uint32_t  RESERVED29;
  __IO uint32_t  CFG17;                             /*!< (@ 0x50008510) Configuration register for DMA channel 0.              */
  __I  uint32_t  CTLSTAT17;                         /*!< (@ 0x50008514) Control and status register for DMA channel 0.         */
  __IO uint32_t  XFERCFG17;                         /*!< (@ 0x50008518) Transfer configuration register for DMA channel
                                                         0.                                                                    */
} LPC_DMA_Type;
 
/**
  * @brief Input multiplexing  (INPUTMUX)
  */
 
typedef struct {                                    /*!< (@ 0x4002C000) INPUTMUX Structure                                     */
  __IO uint32_t  DMA_INMUX_INMUX0;                  /*!< (@ 0x4002C000) Input mux register for DMA trigger input 20.
                                                         Selects from 18 DMA trigger outputs.                                  */
  __IO uint32_t  DMA_INMUX_INMUX1;                  /*!< (@ 0x4002C004) Input mux register for DMA trigger input 20.
                                                         Selects from 18 DMA trigger outputs.                                  */
  __I  uint32_t  RESERVED0[6];
  __IO uint32_t  SCT0_INMUX0;                       /*!< (@ 0x4002C020) Input mux register for SCT input 0                     */
  __IO uint32_t  SCT0_INMUX1;                       /*!< (@ 0x4002C024) Input mux register for SCT input 0                     */
  __IO uint32_t  SCT0_INMUX2;                       /*!< (@ 0x4002C028) Input mux register for SCT input 0                     */
  __IO uint32_t  SCT0_INMUX3;                       /*!< (@ 0x4002C02C) Input mux register for SCT input 0                     */
} LPC_INPUTMUX_Type;
 
/**
  * @brief DMA trigger mux (DMATRIGMUX)
  */
 
typedef struct {                                    /*!< (@ 0x40028000) DMATRIGMUX Structure                                   */
  __IO uint32_t  DMA_ITRIG_INMUX0;                  /*!< (@ 0x40028000) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX1;                  /*!< (@ 0x40028004) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX2;                  /*!< (@ 0x40028008) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX3;                  /*!< (@ 0x4002800C) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX4;                  /*!< (@ 0x40028010) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX5;                  /*!< (@ 0x40028014) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX6;                  /*!< (@ 0x40028018) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX7;                  /*!< (@ 0x4002801C) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX8;                  /*!< (@ 0x40028020) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX9;                  /*!< (@ 0x40028024) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX10;                 /*!< (@ 0x40028028) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX11;                 /*!< (@ 0x4002802C) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX12;                 /*!< (@ 0x40028030) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX13;                 /*!< (@ 0x40028034) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX14;                 /*!< (@ 0x40028038) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX15;                 /*!< (@ 0x4002803C) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX16;                 /*!< (@ 0x40028040) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
  __IO uint32_t  DMA_ITRIG_INMUX17;                 /*!< (@ 0x40028044) Input mux register for trigger inputs 0 to 23
                                                         connected to DMA channel 0. Selects from ADC, SCT, ACMP, pin
                                                          interrupts, and DMA requests.                                        */
} LPC_DMATRIGMUX_Type;
 
 
 
/**
  * @brief 12-bit Analog-to-Digital Converter (ADC) (ADC)
  */
 
typedef struct {                                    /*!< (@ 0x4001C000) ADC Structure                                          */
  __IO uint32_t  CR; /*was CTRL; */                              /*!< (@ 0x4001C000) A/D Control Register. Contains the clock divide
                                                         value, enable bits for each sequence and the A/D power-down
                                                          bit.                                                                 */
  __I  uint32_t  RESERVED0;
  __IO uint32_t  SEQA_CTRL;                         /*!< (@ 0x4001C008) A/D Conversion Sequence-A control Register: Controls
                                                         triggering and channel selection for conversion sequence-A.
                                                          Also specifies interrupt mode for sequence-A.                        */
  __IO uint32_t  SEQB_CTRL;                         /*!< (@ 0x4001C00C) A/D Conversion Sequence-B Control Register: Controls
                                                         triggering and channel selection for conversion sequence-B.
                                                          Also specifies interrupt mode for sequence-B.                        */
  __IO uint32_t  SEQA_GDAT;                         /*!< (@ 0x4001C010) A/D Sequence-A Global Data Register. This register
                                                         contains the result of the most recent A/D conversion performed
                                                          under sequence-A                                                     */
  __IO uint32_t  SEQB_GDAT;                         /*!< (@ 0x4001C014) A/D Sequence-B Global Data Register. This register
                                                         contains the result of the most recent A/D conversion performed
                                                          under sequence-B                                                     */
  __I  uint32_t  RESERVED1[2];
  __I  uint32_t  DR[12];
 // __I  uint32_t  DAT0;                              /*!< (@ 0x4001C020) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT1;                              /*!< (@ 0x4001C024) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT2;                              /*!< (@ 0x4001C028) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT3;                              /*!< (@ 0x4001C02C) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT4;                              /*!< (@ 0x4001C030) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT5;                              /*!< (@ 0x4001C034) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT6;                              /*!< (@ 0x4001C038) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT7;                              /*!< (@ 0x4001C03C) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT8;                              /*!< (@ 0x4001C040) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT9;                              /*!< (@ 0x4001C044) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT10;                             /*!< (@ 0x4001C048) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
 // __I  uint32_t  DAT11;                             /*!< (@ 0x4001C04C) A/D Channel 0 Data Register. This register contains
 //                                                        the result of the most recent conversion completed on channel
 //                                                         0.                                                                   */
  __IO uint32_t  THR0_LOW;                          /*!< (@ 0x4001C050) A/D Low Compare Threshold Register 0 : Contains
                                                         the lower threshold level for automatic threshold comparison
                                                          for any channels linked to threshold pair 0.                         */
  __IO uint32_t  THR1_LOW;                          /*!< (@ 0x4001C054) A/D Low Compare Threshold Register 1: Contains
                                                         the lower threshold level for automatic threshold comparison
                                                          for any channels linked to threshold pair 1.                         */
  __IO uint32_t  THR0_HIGH;                         /*!< (@ 0x4001C058) A/D High Compare Threshold Register 0: Contains
                                                         the upper threshold level for automatic threshold comparison
                                                          for any channels linked to threshold pair 0.                         */
  __IO uint32_t  THR1_HIGH;                         /*!< (@ 0x4001C05C) A/D High Compare Threshold Register 1: Contains
                                                         the upper threshold level for automatic threshold comparison
                                                          for any channels linked to threshold pair 1.                         */
  __IO uint32_t  CHAN_THRSEL;                       /*!< (@ 0x4001C060) A/D Channel-Threshold Select Register. Specifies
                                                         which set of threshold compare registers are to be used for
                                                          each channel                                                         */
  __IO uint32_t  INTEN;                             /*!< (@ 0x4001C064) A/D Interrupt Enable Register. This register
                                                         contains enable bits that enable the sequence-A, sequence-B,
                                                          threshold compare and data overrun interrupts to be generated.       */
  __IO uint32_t  FLAGS;                             /*!< (@ 0x4001C068) A/D Flags Register. Contains the four interrupt
                                                         request flags and the individual component overrun and threshold-compare
                                                          flags. (The overrun bits replicate information stored in the
                                                          result registers).                                                   */
  __IO uint32_t  TRM;                               /*!< (@ 0x4001C06C) ADC trim register.                                     */
} LPC_ADC_Type;
 
 
 
// ------------------------------------------------------------------------------------------------
// -----                                        Timer                                       -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x 32-bitcounter/timers CT32B0/1 Modification date=3/16/2011 Major revision=0 Minor revision=3  
  */

typedef struct {                            /*!< (@ 0x40014000) CT32B0 Structure        */
  __IO uint32_t IR;                         /*!< (@ 0x40014000) Interrupt Register      */
  __IO uint32_t TCR;                        /*!< (@ 0x40014004) Timer Control Register  */
  __IO uint32_t TC;                         /*!< (@ 0x40014008) Timer Counter 		*/
  __IO uint32_t PR;                         /*!< (@ 0x4001400C) Prescale Register  	*/
  __IO uint32_t PC;                         /*!< (@ 0x40014010) Prescale Counter	 */
  __IO uint32_t MCR;                        /*!< (@ 0x40014014) Match Control Register */
  union {
  __IO uint32_t MR[4];                      /*!< (@ 0x40014018) Match Register */
  struct{
  __IO uint32_t MR0;                        /*!< (@ 0x40018018) Match Register. MR0 */
  __IO uint32_t MR1;                        /*!< (@ 0x4001801C) Match Register. MR1 */
  __IO uint32_t MR2;                        /*!< (@ 0x40018020) Match Register. MR2 */
  __IO uint32_t MR3;                        /*!< (@ 0x40018024) Match Register. MR3 */
  };
  };
  __IO uint32_t CCR;                        /*!< (@ 0x40014028) Capture Control Register */
  union{
  __I  uint32_t CR[4];                      /*!< (@ 0x4001402C) Capture Register  */
    struct{
  __I  uint32_t CR0;			    /*!< (@ 0x4001802C) Capture Register. CR 0 */
  __I  uint32_t CR1;			    /*!< (@ 0x40018030) Capture Register. CR 1 */
  __I  uint32_t CR2;			    /*!< (@ 0x40018034) Capture Register. CR 2 */
  __I  uint32_t CR3;			    /*!< (@ 0x40018038) Capture Register. CR 3 */
  };
  };
__IO uint32_t EMR;                        /*!< (@ 0x4001403C) External Match Register */
  __I  uint32_t RESERVED0[12];
  __IO uint32_t CTCR;                       /*!< (@ 0x40014070) Count Control Register */
  __IO uint32_t PWMC;                       /*!< (@ 0x40014074) PWM Control Register */
} LPC_CTxxBx_TypeDef;




#if defined ( __CC_ARM   )
#pragma no_anon_unions
#endif

/******************************************************************************/
/*                         Peripheral memory map                              */
/******************************************************************************/
/* Base addresses                                                             */
#define LPC_FLASH_BASE        (0x00000000UL)
#define LPC_RAM_BASE          (0x10000000UL)
#define LPC_ROM_BASE          (0x1FFF0000UL)
#define LPC_APB0_BASE         (0x40000000UL)
#define LPC_AHB_BASE          (0x50000000UL)

/* APB0 peripherals */
#define LPC_WWDT_BASE         (LPC_APB0_BASE + 0x00000)
#define LPC_MRT_BASE          (LPC_APB0_BASE + 0x04000)
#define LPC_WKT_BASE          (LPC_APB0_BASE + 0x08000)
#define LPC_SWM_BASE          (LPC_APB0_BASE + 0x0C000)
#define LPC_ADC_BASE                    0x4001C000UL
#define LPC_PMU_BASE          (LPC_APB0_BASE + 0x20000)
#define LPC_CMP_BASE          (LPC_APB0_BASE + 0x24000)
#define LPC_DMATRIGMUX_BASE             0x40028000UL
#define LPC_INPUTMUX_BASE               0x4002C000UL
#define LPC_CT32B0_BASE        (LPC_APB0_BASE + 0x38000)

#define LPC_FLASHCTRL_BASE    (LPC_APB0_BASE + 0x40000)
#define LPC_IOCON_BASE        (LPC_APB0_BASE + 0x44000)
#define LPC_SYSCON_BASE       (LPC_APB0_BASE + 0x48000)
#define LPC_I2C_BASE          (LPC_APB0_BASE + 0x50000)
#define LPC_I2C1_BASE                   0x40054000UL
#define LPC_SPI0_BASE         (LPC_APB0_BASE + 0x58000)
#define LPC_SPI1_BASE         (LPC_APB0_BASE + 0x5C000)
#define LPC_UART0_BASE        (LPC_APB0_BASE + 0x64000)
#define LPC_UART1_BASE        (LPC_APB0_BASE + 0x68000)
#define LPC_UART2_BASE        (LPC_APB0_BASE + 0x6C000)
#define LPC_I2C2_BASE                   0x40070000UL
#define LPC_I2C3_BASE                   0x40074000UL

/* AHB peripherals                                                            */
#define LPC_CRC_BASE         (LPC_AHB_BASE + 0x00000)
#define LPC_SCT_BASE         (LPC_AHB_BASE + 0x04000)
#define LPC_DMA_BASE                    0x50008000UL

#define LPC_GPIO_PORT_BASE    (0xA0000000)
#define LPC_PIN_INT_BASE     (LPC_GPIO_PORT_BASE  + 0x4000)

/******************************************************************************/
/*                         Peripheral declaration                             */
/******************************************************************************/
#define LPC_WWDT              ((LPC_WWDT_TypeDef   *) LPC_WWDT_BASE  )
#define LPC_MRT               ((LPC_MRT_TypeDef    *) LPC_MRT_BASE   )


#define LPC_WKT               ((LPC_WKT_TypeDef    *) LPC_WKT_BASE   )
#define LPC_SWM               ((LPC_SWM_TypeDef    *) LPC_SWM_BASE   )
#if defined LPC824
  #define LPC_ADC                         ((LPC_ADC_Type            *) LPC_ADC_BASE)
#endif
#define LPC_PMU               ((LPC_PMU_TypeDef    *) LPC_PMU_BASE   )
#define LPC_CMP               ((LPC_CMP_TypeDef    *) LPC_CMP_BASE   )
#define LPC_DMATRIGMUX                  ((LPC_DMATRIGMUX_Type     *) LPC_DMATRIGMUX_BASE)
#define LPC_INPUTMUX                    ((LPC_INPUTMUX_Type       *) LPC_INPUTMUX_BASE)

#define LPC_FLASHCTRL         ((LPC_FLASHCTRL_TypeDef *) LPC_FLASHCTRL_BASE )
#define LPC_IOCON             ((LPC_IOCON_TypeDef  *) LPC_IOCON_BASE )
#define LPC_SYSCON            ((LPC_SYSCON_TypeDef *) LPC_SYSCON_BASE)
#define LPC_I2C               ((LPC_I2C_TypeDef    *) LPC_I2C_BASE   )
#define LPC_I2C1                        ((LPC_I2C0_Type           *) LPC_I2C1_BASE)
#define LPC_SPI0              ((LPC_SPI_TypeDef    *) LPC_SPI0_BASE  )
#define LPC_SPI1              ((LPC_SPI_TypeDef    *) LPC_SPI1_BASE  )
#define LPC_UART0             ((LPC_UART_TypeDef   *) LPC_UART0_BASE )
#if defined LPC824
  #define LPC_UART1             ((LPC_UART_TypeDef   *) LPC_UART1_BASE )
//NOTE I left out UART2
//  #define LPC_UART2             ((LPC_UART_TypeDef   *) LPC_UART2_BASE )
#endif
#define LPC_I2C2                        ((LPC_I2C0_Type           *) LPC_I2C2_BASE)
#define LPC_I2C3                        ((LPC_I2C0_Type           *) LPC_I2C3_BASE)
#define LPC_CRC               ((LPC_CRC_TypeDef    *) LPC_CRC_BASE   )
#define LPC_SCT               ((LPC_SCT_TypeDef    *) LPC_SCT_BASE   )
#define LPC_DMA                         ((LPC_DMA_Type            *) LPC_DMA_BASE)

#define LPC_GPIO_PORT         ((LPC_GPIO_PORT_TypeDef  *) LPC_GPIO_PORT_BASE  )
//aka
#define LPC_GPIO0	         ((LPC_GPIO_PORT_TypeDef  *) LPC_GPIO_PORT_BASE  )
#define LPC_PIN_INT          ((LPC_PIN_INT_TypeDef   *) LPC_PIN_INT_BASE  )

#define LPC_CT32B0                ((LPC_CTxxBx_TypeDef         *) LPC_CT32B0_BASE)


#ifdef __cplusplus
}
#endif

#endif	//ndef GCC_ASM_STEP
#endif  /* __LPC8xx_H__ */
