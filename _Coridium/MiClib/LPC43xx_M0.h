/**************************************************************************//**
 * @file     LPC43xx_M0.h (M0 application core inside LPC43xx)
 * @brief    CMSIS Cortex-M0 Core Peripheral Access Layer Header File for
 *           NXP LPC43xx Device Series
 * @version  V1.00
 * @date     17. November 2009
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
 ******************************************************************************/


#ifndef __LPC43xx_M0_H__
#define __LPC43xx_M0_H__

#ifdef __cplusplus
 extern "C" {
#endif

/** @addtogroup LPC43xx_M0_Definitions LPC43xx M0 Definitions
  This file defines all structures and symbols for LPC43xx M0:
    - Registers and bitfields
    - peripheral base address
    - peripheral ID
    - PIO definitions
  @{
*/


/******************************************************************************/
/*                Processor and Core Peripherals                              */
/******************************************************************************/
/** @addtogroup LPC43xx_M0_CMSIS LPC43xx M0 CMSIS Definitions
  Configuration of the Cortex-M0 Processor and Core Peripherals
  @{
*/

/*
 * ==========================================================================
 * ---------- Interrupt Number Definition -----------------------------------
 * ==========================================================================
 */

typedef enum IRQn
{
// -------------------------  Cortex-M0 Processor Exceptions Numbers  -----------------------------
  NonMaskableInt_IRQn           = -14,    /*!< 2 Non Maskable Interrupt                           */
  HardFault_IRQn                = -13,    /*!< 3 Cortex-M0 Hard Fault Interrupt                   */
  SVCall_IRQn                   = -5,     /*!< 11 Cortex-M0 SV Call Interrupt                     */
  PendSV_IRQn                   = -2,     /*!< 14 Cortex-M0 Pend SV Interrupt                     */
  SysTick_IRQn                  = -1,     /*!< 15 Cortex-M0 System Tick Interrupt                 */
// ---------------------------  LPC43xx_M0 Specific Interrupt Numbers  ---------------------------
  RTC_IRQn                          = 0,    /*!<   0  RTC                              */
  M4_IRQn                           = 1,    /*!<   1  M4                               */
  DMA_IRQn                          = 2,    /*!<   2  DMA                              */
  RESERVED0_IRQn                    = 3,    
  ATIMER_FLASH_EEPROM_IRQn          = 4,    /*!<   4  ATIMER, Flash0/1 and EEPROM or-ed*/
  ETH_IRQn                          = 5,    /*!<   5  ETHERNET                         */
  SDIO_IRQn                         = 6,    /*!<   6  SDIO                             */
  LCD_IRQn                          = 7,    /*!<   7  LCD                              */
  USB0_IRQn                         = 8,    /*!<   8  USB0                             */
  USB1_IRQn                         = 9,    /*!<   9  USB1                             */
  SCT_IRQn                          = 10,   /*!<  10  SCT                              */
  RITIMER_WDT_IRQn                  = 11,   /*!<  11  RITIMER and WDT or'ed            */
  TIMER0_IRQn                       = 12,   /*!<  12  TIMER0                           */
  GINT1_IRQn                        = 12,   /*!<  12  GINT1                            */
  PIN_INT4_IRQn                     = 13,   /*!<  13  PIN_INT4                         */
  TIMER3_IRQn                       = 14,   /*!<  14  TIMER3_INT                       */
  MCPWM_IRQn                        = 16,   /*!<  16  MCPWM                            */
  ADC0_IRQn                         = 17,   /*!<  17  ADC0                             */
  I2C0_I2C1_IRQn                    = 18,   /*!<  18  I2C0 and I2C1 or'ed              */
  SGPIO_IRQn                        = 19,   /*!<  19  SGPIO                            */
  SPI_DAC_IRQn                      = 20,   /*!<  20  SPI and DAC or'ed                */
  ADC1_IRQn                         = 21,   /*!<  21  ADC1                             */
  SSP0_SSP1_IRQn                    = 22,   /*!<  22  SSP0 and SSP1 or'ed              */
  EVENTROUTER_INT_IRQn              = 23,   /*!<  23  EVENTROUTER_INT                  */
  USART0_IRQn                       = 24,   /*!<  24  USART0                           */
  UART1_IRQn                        = 25,   /*!<  25  UART1                            */
  USART2_C_CAN1_IRQn                = 26,   /*!<  26  USART2 and C_CAN1 or'ed          */
  USART3_IRQn                       = 27,   /*!<  27  USART3                           */
  I2S0_I2S1_QEI_IRQn                = 28,   /*!<  28  I2S0, I2S1 and QEI or'ed         */
  C_CAN0_IRQn                       = 29,   /*!<  29  C_CAN0                           */
  SPIFI_VADC_IRQn                   = 30,   /*!<  30  SPIFI and VADC or'ed             */
  RESERVED1_IRQn                    = 31,   
} IRQn_Type;

#include "LPC43xx.h"

#ifdef __cplusplus
}
#endif

#endif  /* __LPC43xx_M0_H__ */
