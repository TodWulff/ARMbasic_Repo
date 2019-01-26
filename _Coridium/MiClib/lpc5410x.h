/*
 * @brief Basic CMSIS include file
 *
 * @note
 * Copyright(C) NXP Semiconductors, 2013
 * All rights reserved.
 *
 * @par
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * LPC products.  This software is supplied "AS IS" without any warranties of
 * any kind, and NXP Semiconductors and its licensor disclaim any and
 * all warranties, express or implied, including all implied warranties of
 * merchantability, fitness for a particular purpose and non-infringement of
 * intellectual property rights.  NXP Semiconductors assumes no responsibility
 * or liability for the use of the software, conveys no license or rights under any
 * patent, copyright, mask work right, or any other intellectual property rights in
 * or to any products. NXP Semiconductors reserves the right to make changes
 * in the software without notification. NXP Semiconductors also makes no
 * representation or warranty that such application will be suitable for the
 * specified use without further testing or modification.
 *
 * @par
 * Permission to use, copy, modify, and distribute this software and its
 * documentation is hereby granted, under NXP Semiconductors' and its
 * licensor's relevant copyrights in the software, without fee, provided that it
 * is used in conjunction with NXP Semiconductors microcontrollers.  This
 * copyright, permission, and disclaimer notice must appear in all copies of
 * this code.
 */

#ifndef __LPC412X_H_
#define __LPC412X_H_

#ifdef LPC54102m0
 #define UART_NOBUFFER
 #define CORE_M0PLUS
#else
 #define CORE_M4
#endif

#include "lpc_types.h"
//#include "sys_config.h"

#ifdef __cplusplus
extern "C" {
#endif

/** @defgroup CMSIS_412X_ALL CHIP: LPC412X CMSIS include file
 * @ingroup CHIP_412X_Drivers
 * @{
 */

#if defined(__ARMCC_VERSION)
// Kill warning "#pragma push with no matching #pragma pop"
  #pragma diag_suppress 2525
  #pragma push
  #pragma anon_unions
#elif defined(__CWCC__)
  #pragma push
  #pragma cpp_extensions on
#elif defined(__GNUC__)
/* anonymous unions are enabled by default */
#elif defined(__IAR_SYSTEMS_ICC__)
//  #pragma push // FIXME not usable for IAR
  #pragma language=extended
#else
  #error Not supported compiler type
#endif

#if !defined(CORE_M4)
#if !defined(CORE_M0PLUS)
#error Please #define CORE_M4 or CORE_M0PLUS
#endif
#endif


// MAR from here
/** @defgroup CMSIS_5410X_M4_COMMON CHIP: LPC5410X M4 core Cortex CMSIS definitions
 * @{
 */

#if defined(CORE_M4)
/* Configuration of the Cortex-M4 Processor and Core Peripherals */
#define __CM4_REV                 0x0001	/*!< Cortex-M4 Core Revision                          */
#define __MPU_PRESENT             1			/*!< MPU present or not                               */
#define __NVIC_PRIO_BITS          3			/*!< Number of Bits used for Priority Levels          */
#define __Vendor_SysTickConfig    0			/*!< Set to 1 if different SysTick Config is used     */
#define __FPU_PRESENT             1

#else 

#if defined(CORE_M0PLUS)
/* Configuration of the Cortex-M0+ Processor and Core Peripherals */
#define __CM0PLUS_REV             0x0001	/*!< Cortex-M0PLUS Core Revision                      */
#define __MPU_PRESENT             0			/*!< MPU present or not                               */
#define __NVIC_PRIO_BITS          2			/*!< Number of Bits used for Priority Levels          */
#define __Vendor_SysTickConfig    0			/*!< Set to 1 if different SysTick Config is used     */
#define __VTOR_PRESENT            1
#endif
#endif
// MAR to here


/**
 * @}
 */

/** @defgroup CMSIS_412X_IRQ CHIP: LPC412X peripheral interrupt numbers
 * @ingroup CMSIS_412X_ALL
 * @{
 */

typedef enum {
	/******  Cortex-M0 Processor Exceptions Numbers ***************************************************/
	Reset_IRQn                    = -15,	/*!< 1 Reset Vector, invoked on Power up and warm reset */
	NonMaskableInt_IRQn           = -14,	/*!< 2 Non Maskable Interrupt                           */
	HardFault_IRQn                = -13,	/*!< 3 Cortex-M0 Hard Fault Interrupt                   */
	SVCall_IRQn                   = -5,		/*!< 11 Cortex-M0 SV Call Interrupt                     */
	PendSV_IRQn                   = -2,		/*!< 14 Cortex-M0 Pend SV Interrupt                     */
	SysTick_IRQn                  = -1,		/*!< 15 Cortex-M0 System Tick Interrupt                 */
	
	/******  LPC412X Specific Interrupt Numbers ********************************************************/
	WWDT_IRQn                     = 0,		/*!< WWDT                                             */
	BOD_IRQn                      = 1,		/*!< BOD                                              */
	Reserved0_IRQn                = 2,		/*!< Reserved Interrupt                               */
	DMA_IRQn                      = 3,		/*!< DMA                                              */
	GINT0_IRQn                    = 4,		/*!< GINT0                                            */
	PININT0_IRQn                  = 5,		/*!< PININT0                                          */
	PININT1_IRQn                  = 6,		/*!< PININT1                                          */
	PININT2_IRQn                  = 7,		/*!< PININT2                                          */
	PININT3_IRQn                  = 8,		/*!< PININT3                                          */
	UTICK_IRQn                    = 9,		/*!< UTICK                                            */
	MRT_IRQn                      = 10,		/*!< MRT                                              */
	CTIMER0_IRQn                  = 11,		/*!< CTMR0                                            */
	CTIMER1_IRQn                  = 12,		/*!< CTMR1                                            */
	CTIMER2_IRQn                  = 13,		/*!< CTMR2                                            */
	CTIMER3_IRQn                  = 14,		/*!< CTMR3                                            */
	CTIMER4_IRQn                  = 15,		/*!< CTMR4                                            */

	SCT_IRQn                      = 16,		/*!< SCT                                              */
	UART0_IRQn                    = 17,		/*!< UART0                                            */
	UART1_IRQn                    = 18,		/*!< UART1                                            */
	UART2_IRQn                    = 19,		/*!< UART2                                            */
	UART3_IRQn                    = 20,		/*!< UART3                                            */
	I2C0_IRQn                     = 21,		/*!< I2C0                                             */
	I2C1_IRQn                     = 22,		/*!< I2C1                                             */
	I2C2_IRQn                     = 23,		/*!< I2C2                                             */
	SPI0_IRQn                     = 24,		/*!< SPI0                                             */
	SPI1_IRQn                     = 25,		/*!< SPI1                                             */
	ADC_SEQA_IRQn                 = 26,		/*!< ADC SEQA                                         */
	ADC_SEQB_IRQn                 = 27,		/*!< ADC SEQB                                         */
	ADC_THCMP_OVR_IRQn            = 28,		/*!< ADC THCMP OVERRUN                                */
	RTC_IRQn                      = 29,		/*!< RTC                                              */
	MBOX_IRQn                     = 31,		/*!< MBOX                                             */
  /* Below is for CM4 only */
#if defined(CORE_M4)	
	GINT1_IRQn                    = 32,		/*!< GINT1                                            */
	PININT4_IRQn                  = 33,		/*!< External Interrupt 4                             */
	PININT5_IRQn                  = 34,		/*!< External Interrupt 5                             */
	PININT6_IRQn                  = 35,		/*!< External Interrupt 6                             */
	PININT7_IRQn                  = 36,		/*!< External Interrupt 7                             */
	OSTIMER_IRQn                  = 40,		/*!< OSTIMER or RIT                                   */
#endif
} IRQn_Type;
/**
 * @}
 */

//MIKE? #if defined(CORE_M0PLUS)	
//MIKE? #include "core_cm0plus.h"				/*!< Cortex-M0 Plus processor and core peripherals        */
//MIKE? #endif

#if defined(CORE_M4)	
#include "core_cm4.h"				/*!< Cortex-M4 processor and core peripherals        */
#else
#if defined(CORE_M0PLUS)	
#include "core_cm0plus.h"				/*!< Cortex-M0 Plus processor and core peripherals        */
#endif
#endif
/**
 * @}
 */

#ifdef __cplusplus
}
#endif


#define LPC_GPIO_PORT_BASE         0x1C000000UL
#define LPC_DMA_BASE               0x1C004000UL
#define LPC_CRC_BASE               0x1C010000UL
#define LPC_SCT_BASE               0x1C018000UL
#define LPC_MBOX_BASE              0x1C02C000UL
#define LPC_ADC_BASE               0x1C034000UL
#define LPC_VFIFO_BASE             0x1C038000UL

#if 1
#define LPC_SYSCTL_BASE            (0x40000000UL + (0x4000 * 0))
#define LPC_CTIMER2_BASE           (0x40000000UL + (0x4000 * 1))
#define LPC_CTIMER3_BASE           (0x40000000UL + (0x4000 * 2))
#define LPC_CTIMER4_BASE           (0x40000000UL + (0x4000 * 3))
#define LPC_GPIO_GROUPINT0_BASE    (0x40000000UL + (0x4000 * 4))	/* GPIO_GROUPINT0 */
#define LPC_GPIO_GROUPINT1_BASE    (0x40000000UL + (0x4000 * 5))	/* GPIO_GROUPINT1 */
#define LPC_PIN_INT_BASE           (0x40000000UL + (0x4000 * 6))	/* GPIO_INT */
#define LPC_IOCON_BASE             (0x40000000UL + (0x4000 * 7))	/* IOCON */
#define LPC_UTICK_BASE             (0x40000000UL + (0x4000 * 8))	/* UTICK */
#define LPC_FMC_BASE               (0x40000000UL + (0x4000 * 9))	/* Flash Controller */

#define LPC_POWER_BASE             (0x40000000UL + (0x4000 * 11))	/* PMU0 */
#define LPC_WWDT_BASE              (0x40000000UL + (0x4000 * 14))	/* WDT */
#define LPC_RTC_BASE               (0x40000000UL + (0x4000 * 15))	/* RTC */

#define LPC_EZH_ARCH_A_CON_BASE    (0x40000000UL + (0x4000 * 19))
#define LPC_EZH_ARCH_B_CON_BASE    (0x40000000UL + (0x4000 * 19) + 0x20)
#define LPC_INMUX_BASE             (0x40000000UL + (0x4000 * 20))

#define LPC_OSTIMER_BASE           (0x40000000UL + (0x4000 * 28))		/* OSTIMER */
#define LPC_RITIMER_BASE            0x40070000UL                        /* same as LPC_OSTIMER_BASE*/
#define LPC_MRT_BASE               (0x40000000UL + (0x4000 * 29))		/* MRT */

#define LPC_ASYNC_SYSCTL_BASE      (0x40080000UL + (0x4000 * 0))
#define LPC_FRG0_BASE              (0x40080000UL + (0x4000 * 0) + 0x030)// resides in the syscon
#define LPC_USART0_BASE            (0x40080000UL + (0x4000 * 1))	/* USART0 */
#define LPC_USART1_BASE            (0x40080000UL + (0x4000 * 2))	/* USART1 */
#define LPC_USART2_BASE            (0x40080000UL + (0x4000 * 3))	/* USART2 */
#define LPC_USART3_BASE            (0x40080000UL + (0x4000 * 4))	/* USART3 */
#define LPC_I2C0_BASE              (0x40080000UL + (0x4000 * 5))
#define LPC_I2C1_BASE              (0x40080000UL + (0x4000 * 6))
#define LPC_I2C2_BASE              (0x40080000UL + (0x4000 * 7))
#define LPC_I2C3_BASE              (0x40080000UL + (0x4000 * 8))
#define LPC_SPI0_BASE              (0x40080000UL + (0x4000 * 9))
#define LPC_SPI1_BASE              (0x40080000UL + (0x4000 * 10))
#define LPC_SPI2_BASE              (0x40080000UL + (0x4000 * 11))
#define LPC_SPI3_BASE              (0x40080000UL + (0x4000 * 12))
#define LPC_CTIMER0_BASE           (0x40080000UL + (0x4000 * 13))
#define LPC_CTIMER1_BASE           (0x40080000UL + (0x4000 * 14))

#else
// FIXME - THESE ARE WHAT THE USER MANUAL SAYS - IT'S WRONG
#define LPC_ASYNC_SYSCTL_BASE      0x40000000UL
#define LPC_USART0_BASE            0x40004000UL
#define LPC_USART1_BASE            0x40008000UL
#define LPC_USART2_BASE            0x4000C000UL
#define LPC_USART3_BASE            0x40010000UL
#define LPC_I2C0_BASE              0x40014000UL
#define LPC_I2C1_BASE              0x40018000UL
#define LPC_I2C2_BASE              0x4001C000UL
#define LPC_SPI0_BASE              0x40024000UL
#define LPC_SPI1_BASE              0x40028000UL
#define LPC_CTIMER0_BASE           0x40034000UL
#define LPC_CTIMER1_BASE           0x40038000UL
#define LPC_SYSCTL_BASE            0x40080000UL
#define LPC_CTIMER2_BASE           0x40084000UL
#define LPC_CTIMER3_BASE           0x40088000UL
#define LPC_CTIMER4_BASE           0x4008C000UL
#define LPC_GPIO_GROUPINT0_BASE    0x40090000UL
#define LPC_GPIO_GROUPINT1_BASE    0x40094000UL
#define LPC_PIN_INT_BASE           0x40098000UL
#define LPC_IOCON_BASE             0x4009C000UL
#define LPC_UTICK_BASE             0x400A0000UL
#define LPC_FMC_BASE               0x400A4000UL
#define LPC_POWER_BASE             0x400AC000UL	// FIXME - does this existt?
#define LPC_BODYBIAS_BASE          0x40030000UL	// FIXME not in UM
#define LPC_PVTVF0_BASE            0x40034000UL	// FIXME not in UM
#define LPC_PVTMON0_BASE           0x40034060UL	// FIXME - array with mod structure with LPC_PVTVF0_BASE
#define LPC_PVTVF1_BASE            0x40034080UL	// FIXME - array with mod structure with LPC_PVTVF0_BASE, not in UM
#define LPC_WWDT_BASE              0x400B8000UL
#define LPC_RTC_BASE               0x400BC000UL
#define LPC_EZH_ARCH_A_CON_BASE    0x4004C000UL
// #define LPC_EZH_ARCH_B_CON_BASE    0x4004C020UL // Array with A base
#define LPC_INMUX_BASE             0x400D0000UL
#define LPC_OSTIMER_BASE           0x400F0000UL
#define LPC_MRT_BASE               0x400F4000UL
#endif

#define LPC_WWDT                  ((LPC_WWDT_T     *) LPC_WWDT_BASE)
#define LPC_ADC                   ((LPC_ADC_T      *) LPC_ADC_BASE)
#define LPC_INMUX                 ((LPC_INMUX_T    *) LPC_INMUX_BASE)
#define LPC_CTIMER0               ((LPC_TIMER_T    *) LPC_CTIMER0_BASE)
#define LPC_CTIMER1               ((LPC_TIMER_T    *) LPC_CTIMER1_BASE)
#define LPC_CTIMER2               ((LPC_TIMER_T    *) LPC_CTIMER2_BASE)
#define LPC_CTIMER3               ((LPC_TIMER_T    *) LPC_CTIMER3_BASE)
#define LPC_CTIMER4               ((LPC_TIMER_T    *) LPC_CTIMER4_BASE)
#define LPC_TIM0               ((LPC_TIMER_T    *) LPC_CTIMER0_BASE)
#define LPC_TIM1               ((LPC_TIMER_T    *) LPC_CTIMER1_BASE)
#define LPC_TIM2               ((LPC_TIMER_T    *) LPC_CTIMER2_BASE)
#define LPC_TIM3               ((LPC_TIMER_T    *) LPC_CTIMER3_BASE)
#define LPC_TIM4               ((LPC_TIMER_T    *) LPC_CTIMER4_BASE)
#define LPC_UTICK                 ((LPC_UTICK_T    *) LPC_UTICK_BASE)
#define LPC_DMA                   ((LPC_DMA_T      *) LPC_DMA_BASE)
#define LPC_POWER                 ((LPC_POWER_T    *) LPC_POWER_BASE)
#define LPC_BODYBIAS              ((LPC_BODYBIAS_T *) LPC_BODYBIAS_BASE)
#define LPC_OSTIMER               ((LPC_OSTIMER_T  *) LPC_OSTIMER_BASE)
#define LPC_RITIMER               ((LPC_RITIMER_T  *) LPC_RITIMER_BASE)	/* same as LPC_OSTIMER */

#define LPC_VFIFO                 ((LPC_VFIFO_T    *) LPC_VFIFO_BASE)

#if 0	// FIXME
#define LPC_PVTMON0               ((LPC_PVTMON_Type  *)        LPC_PVTMON0_BASE)	// FIXME should be _T
#define LPC_PVTVF0                ((LPC_PVTVF_Type   *)        LPC_PVTVF0_BASE)
#define LPC_PVTVF1                ((LPC_PVTVF_Type   *)        LPC_PVTVF1_BASE)
#endif

//#define MIN_UART

#define LPC_RTC             ((LPC_RTC_T             *) LPC_RTC_BASE)
#define LPC_UART0           ((LPC_UART_TypeDef           *) LPC_USART0_BASE)
#define LPC_UART1           ((LPC_UART_TypeDef           *) LPC_USART1_BASE)
#define LPC_UART2           ((LPC_UART_TypeDef           *) LPC_USART2_BASE)
#define LPC_UART3           ((LPC_UART_TypeDef           *) LPC_USART3_BASE)
#define LPC_USART0          ((LPC_UART_TypeDef           *) LPC_USART0_BASE)
#define LPC_USART1          ((LPC_UART_TypeDef           *) LPC_USART1_BASE)
#define LPC_USART2          ((LPC_UART_TypeDef           *) LPC_USART2_BASE)
#define LPC_USART3          ((LPC_UART_TypeDef           *) LPC_USART3_BASE)
#define LPC_I2C0            ((LPC_I2C_T             *) LPC_I2C0_BASE)
#define LPC_I2C1            ((LPC_I2C_T             *) LPC_I2C1_BASE)
#define LPC_I2C2            ((LPC_I2C_T             *) LPC_I2C2_BASE)
#define LPC_I2C3            ((LPC_I2C_T             *) LPC_I2C3_BASE)
#define LPC_SPI0            ((LPC_SPI_T             *) LPC_SPI0_BASE)
#define LPC_SPI1            ((LPC_SPI_T             *) LPC_SPI1_BASE)
#define LPC_PMU             ((LPC_PMU_T             *) LPC_PMU_BASE)
#define LPC_CRC             ((LPC_CRC_T             *) LPC_CRC_BASE)
#define LPC_SCT             ((LPC_SCT_T             *) LPC_SCT_BASE)
#define LPC_GPIO            ((LPC_GPIO_T            *) LPC_GPIO_PORT_BASE)
#define LPC_PININT          ((LPC_PIN_INT_T         *) LPC_PIN_INT_BASE)
#define LPC_GINT            ((LPC_GPIOGROUPINT_T    *) LPC_GPIO_GROUPINT0_BASE)
#define LPC_IOCON           ((LPC_IOCON_T           *) LPC_IOCON_BASE)
#define LPC_SYSCTL          ((LPC_SYSCTL_T          *) LPC_SYSCTL_BASE)
#define LPC_SYSCON          ((LPC_SYSCTL_T          *) LPC_SYSCTL_BASE)	/* Alias for LPC_SYSCTL */
#define LPC_ASYNC_SYSCTL    ((LPC_ASYNC_SYSCTL_T    *) LPC_ASYNC_SYSCTL_BASE)
#define LPC_ASYNC_SYSCON    ((LPC_ASYNC_SYSCTL_T    *) LPC_ASYNC_SYSCTL_BASE)
#define LPC_FMC             ((LPC_FMC_T             *) LPC_FMC_BASE)
#define LPC_MRT             ((LPC_MRT_T             *) LPC_MRT_BASE)
#define LPC_MBOX            ((LPC_MBOX_T            *) LPC_MBOX_BASE)

/**
 * @}
 */

 
/**
 * System reset status values
 */
#define SYSCTL_RST_POR    (1 << 0)	/*!< POR reset status */
#define SYSCTL_RST_EXTRST (1 << 1)	/*!< External reset status */
#define SYSCTL_RST_WDT    (1 << 2)	/*!< Watchdog reset status */
#define SYSCTL_RST_BOD    (1 << 3)	/*!< Brown-out detect reset status */
#define SYSCTL_RST_SYSRST (1 << 4)	/*!< software system reset status */

// bit definitions
#define PDRUNCFG_LP_VD1           (1 << 2)
#define PDRUNCFG_PD_IRC_OSC_EN    (1 << 3)
#define PDRUNCFG_PD_IRC_EN        (1 << 4)
#define PDRUNCFG_PD_FLASH         (1 << 5)
#define PDRUNCFG_PD_BOD_RESET     (1 << 7)
#define PDRUNCFG_PD_BOD_INTR      (1 << 8)
#define PDRUNCFG_PD_VD2_ANA       (1 << 9)
#define PDRUNCFG_PD_ADC0          (1 << 10)
#define PDRUNCFG_PD_VDDFLASH_ENA  (1 << 11)
#define PDRUNCFG_VDDFLASH_SEL_VD3 (1 << 12)
#define PDRUNCFG_PD_RAM0          (1 << 13)
#define PDRUNCFG_PD_RAM1          (1 << 14)
#define PDRUNCFG_PD_RAM2          (1 << 15)
#define PDRUNCFG_PD_RAM3          (1 << 16)
#define PDRUNCFG_PD_ROM           (1 << 17)
#define PDRUNCFG_PD_VDDHV_ENA     (1 << 18)
#define PDRUNCFG_PD_VD7_ENA       (1 << 19)
#define PDRUNCFG_PD_WDT_OSC       (1 << 20)
#define PDRUNCFG_PD_SYS_PLL0      (1 << 22)
#define PDRUNCFG_PD_VREFP_SW      (1 << 23)
#define PDRUNCFG_PD_32K_OSC       (1 << 24)
#define PDRUNCFG_PD_FLASH_BG      (1 << 25)
#define PDRUNCFG_LP_VD2           (1 << 27)
#define PDRUNCFG_LP_VD3           (1 << 28)
#define PDRUNCFG_LP_VD8           (1UL << 29)

// VFIFO enable positions for VFIFOCTRL reg
#define VFIFO_MINUART0_TX_ENABLE(d) (d << 0)
#define VFIFO_MINUART1_TX_ENABLE(d) (d << 1)
#define VFIFO_MINUART2_TX_ENABLE(d) (d << 2)
#define VFIFO_MINUART3_TX_ENABLE(d) (d << 3)

#define VFIFO_MINUART0_RX_ENABLE(d) (d << 8)
#define VFIFO_MINUART1_RX_ENABLE(d) (d << 9)
#define VFIFO_MINUART2_RX_ENABLE(d) (d << 10)
#define VFIFO_MINUART3_RX_ENABLE(d) (d << 11)

#define VFIFO_LSPI0_TX_ENABLE(d) (d << 4)
#define VFIFO_LSPI1_TX_ENABLE(d) (d << 5)

#define VFIFO_LSPI0_RX_ENABLE(d) (d << 12)
#define VFIFO_LSPI1_RX_ENABLE(d) (d << 13)

/**
 * Non-Maskable Interrupt Enable/Disable value
 */
#define SYSCTL_NMISRC_ENABLE   ((uint32_t) 1 << 31)	/*!< Enable the Non-Maskable Interrupt (NMI) source */

/**
 * Non-Maskable Interrupt Enable/Disable value
 */
#define SYSCTL_FREMEA_ENABLE   ((uint32_t) 1 << 31)	/*!< Enable frequency measure */

/**
 * @brief LPC540XX System Control and Clock register block structure
 */
typedef struct {
	__IO uint32_t SYSMEMREMAP;								// /< System Remap                (0x000)
	__IO uint32_t AHBMATPRIO;								// /< AHB Matrix Priority         (0x004)
	__IO uint32_t AHBFUNPRIO;								// /< AHB Funnel Priority         (0x008)
	__IO uint32_t AHBBUFEN[2];								// /< AHB Buffering Enable        (0x00C)
	__IO uint32_t SYSTCKCAL;								// /< System Tick Calibration     (0x014)
	__IO uint32_t IRQLATENCY;								// /< IRQ Latency (for Cortex-M0) (0x018)
	__IO uint32_t NMISRC;									// /< NMI Source select           (0x01C)
	__IO uint32_t ASYNCVPBCTRL;								// /< Asynch VPB chiplet control  (0x020)
	__I  uint32_t RESERVED0[7];
	__IO uint32_t SYSRSTSTAT;								// /< System Reset Stat           (0x040)
	__IO uint32_t PRESETCTRL[2];							// /< Peripheral Reset Ctrl       (0x044 - 0x048)
	__IO uint32_t PRESETCTRLSET[2];							// /< Peripheral Reset Ctrl Set   (0x04c - 0x050)
	__IO uint32_t PRESETCTRLCLR[2];							// /< Peripheral Reset Ctrl Clr   (0x054 - 0x058)
	__IO uint32_t PIOPORCAP[3];								// /< PIO Power-On Reset Capture  (0x05C - 0x064)
	__IO uint32_t PIORESCAP[2];								// /< PIO Pad Reset Capture       (0x068 - 0x06c)
	__I  uint32_t RESERVED1[4];
	__IO uint32_t MAINCLKSELA;								// /< Main Clk sel Source Sel A   (0x080)
	__IO uint32_t MAINCLKSELB;								// /< Main Clk sel Source Sel B   (0x084)
	__IO uint32_t RESERVED2;								// /< USB Clk sel                 (0x088)
	__IO uint32_t ADCASYNCCLKSEL;							// /< ADC Async Clk Sel           (0x08C)
	__IO uint32_t RESERVED3;
	__IO uint32_t CLKOUTCLKSELA;							// /< Clk Out Sel Source A        (0x094)
	__IO uint32_t CLKOUTCLKSELB;							// /< Clk Out Sel Source B        (0x098)
	__IO uint32_t RESERVED4;
	__IO uint32_t SYSPLLCLKSEL;								// /< System PLL Clk Sel          (0x0A0)
	__I  uint32_t RESERVED5[7];
	__IO uint32_t SYSAHBCLKCTRL[2];							// /< AHB Peripheral Clk Enable    (0x0C0 - 0x0C4)
	__IO uint32_t SYSAHBCLKCTRLSET[2];						// /< AHB Peripheral Clk Enable Set(0x0C8 - 0xCC)
	__IO uint32_t SYSAHBCLKCTRLCLR[2];						// /< AHB Peripheral Clk Enable Clr(0x0D0 - 0xD4)
	__I  uint32_t RESERVED6[2];								// /<
	__IO uint32_t SYSTICKCLKDIV;							// /< Systick Clock divider       (0x0E0)
	__IO uint32_t TRACECLKDIV;								// /< Trace Clk Divider           (0x0E4)
	__I  uint32_t RESERVED7[6];
	__IO uint32_t SYSAHBCLKDIV;								// /< Main Clk Divider            (0x100)
	__IO uint32_t RESERVED8;
	__IO uint32_t ADCASYNCCLKDIV;							// /< ADC Async Clk Divider       (0x108)
	__IO uint32_t CLKOUTDIV;								// /< Clk Out Divider             (0x10c)
	__IO uint32_t RESERVED9[3];
	__IO uint32_t CLKGENUPDATELOCK;							// /< Clockgen (divider and source switch synchroniser disable), if this is one, those can not be updated (0x11C)
	__IO uint32_t FREQMECTRL;								// /< Frequency Measure Control (0x120)
	__IO uint32_t FLASHCFG;									// /< Flash Config (0x124)
	__I  uint32_t RESERVED10[8];
	__IO uint32_t VFIFOCTRL;								// /< VFIFO control (0x148)
	__I  uint32_t RESERVED11[14];
	__IO uint32_t IRCCTRL;									// /< IRC Oscillator Control (0x184)
	__IO uint32_t SYSOSCCTRL;								// /< System Oscillator Control (0x188)
	__IO uint32_t WDTOSCCTRL;								// /< Watchdog Oscillator Control (0x18C)
	__IO uint32_t RTCOSCCTRL;								// /< RTC Oscillator Control(0x190)
	__IO uint32_t PVTDCTRL;									// /< ???? (0x194)
	__I  uint32_t RESERVED12[6];
	__IO uint32_t SYSPLLCTRL;								// /< SYS PLL CTRL 0x1B0
	__IO uint32_t SYSPLLSTAT;								// /< SYS PLL STAT 0x1B4
	__IO uint32_t SYSPLLNDEC;								// /< SYS PLL NDEC 0x1B8
	__IO uint32_t SYSPLLPDEC;								// /< SYS Pll Pdec 0x1BC
	__IO uint32_t SYSPLLSSCGCTRL[2];						// /< Spread Spectrum control 0x1C0  - 0x1c4
	__I  uint32_t RESERVED13[14];
	__IO uint32_t PDSLEEPCFG;								// /< Power Down Sleep Config (0x200)
	__I  uint32_t RESERVED14[3];							// /< Reserved (0x204 - 0x20c)
	__IO uint32_t PDRUNCFG;									// /< Power Down Run Config     (0x210)
	__IO uint32_t PDRUNCFGSET;								// /< Power Down Run Config Set (0x214)
	__IO uint32_t PDRUNCFGCLR;								// /< Power Down Run Config Clr (0x218)
	__IO uint32_t RESERVED15[9];
	__IO uint32_t STARTER[2];								// /< Start Signal Enable Register     (0x240 - 0x244)
	__IO uint32_t STARTERSET[2];							// /< Start Signal Enable Set Register (0x248 - 0x24C)
	__IO uint32_t STARTERCLR[2];							// /< Start Signal Enable Clr Register (0x250 - 0x254)
	__I  uint32_t RESERVED16[37];
	__IO uint32_t IRCPDSTRETCH;								// /< Stretch entry into PD using IRC (to let regulator settle low before going LP) (0x2EC)
	__IO uint32_t IRCSAFETY;								// /< IRC Safety wakeup counter Ctrl (0x2F0)
	__IO uint32_t RETENCTRL;								// /< Retention Ctrl (0x2F4)
	__IO uint32_t PDSAFTY;									// /< Power Down Safety Control (0x2F8)
	__IO uint32_t MAINCLKSAFETY;							// /< Main Clock Wakeup Delay   (0x2FC)
	__IO uint32_t CPUCTRL;									// /< CPU CTRL   (0x300)
	__IO uint32_t CPBOOT;									// /< COPROCESSOR BOOT   (0x304)
	__IO uint32_t CPSTACK;									// /< COPROCESSOR STACK   (0x308)
	__IO uint32_t CPU_STAT;									// /< CPU STAT   (0x30C)
	__I  uint32_t RESERVED17[29];
	__IO uint32_t AUTOCGOR;									// /< Auto Clockgating Override (0x384)
	__I  uint32_t RESERVED18[27];
	__IO uint32_t JTAG_IDCODE;								// /< (0x3F4)
	__IO uint32_t DEVICE_ID0;								// /< (0x3F8)
	__IO uint32_t DEVICE_ID1;								// /< (0x3FC)
} LPC_SYSCTL_T;

typedef struct {
	__IO uint32_t ASYNCPRESETCTRL;							// /< peripheral reset             (0x000)
	__IO uint32_t ASYNCPRESETCTRLSET;						// /< peripheral reset  Set        (0x004)
	__IO uint32_t ASYNCPRESETCTRLCLR;						// /< peripheral reset  Clr        (0x008)
	__I  uint32_t RESERVED0;								// /<
	__IO uint32_t ASYNCVPBCLKCTRL;							// /< clk enable                   (0x010)
	__IO uint32_t ASYNCVPBCLKCTRLSET;						// /< clk enable        Set        (0x014)
	__IO uint32_t ASYNCVPBCLKCTRLCLR;						// /< clk enable        Clr        (0x018)
	__I  uint32_t RESERVED1;								// /<
	__IO uint32_t ASYNCVPBCLKSELA;							// /< clk source mux A             (0x020)
	__IO uint32_t ASYNCVPBCLKSELB;							// /< clk source mux B             (0x024)
	__IO uint32_t ASYNCCLKDIV;								// /< clk div                      (0x028)
	__IO uint32_t ASYNCAUTOCGOR;							// /< autoclk  override            (0x02c)
	__IO uint32_t FRGCTRL;									// /< Fraction Rate Generator Ctrl (0x030)
} LPC_ASYNC_SYSCTL_T;

/**
 * Peripheral reset identifiers
 */
typedef enum {
	STARTERP0_WWDT = 0,
	STARTERP0_BOD,
	STARTERP0_FLASH,
	STARTERP0_DMA,
	STARTERP0_GINT0,
	STARTERP0_PINT0,
	STARTERP0_PINT1,
	STARTERP0_PINT2,
	STARTERP0_PINT3,
	STARTERP0_UTICK,
	STARTERP0_MRT,
	STARTERP0_CTIMER0,
	STARTERP0_CTIMER1,
	STARTERP0_CTIMER2,
	STARTERP0_CTIMER3,
	STARTERP0_CTIMER4,
	STARTERP0_SCT,
	STARTERP0_UART0,
	STARTERP0_UART1,
	STARTERP0_UART2,
	STARTERP0_UART3,
	STARTERP0_I2C0,
	STARTERP0_I2C1,
	STARTERP0_I2C2,
	STARTERP0_SPI0,
	STARTERP0_SPI1,
	STARTERP0_ADC_SEQA,
	STARTERP0_ADC_SEQB,
	STARTERP0_ADC_OVCR,
	STARTERP0_RTC,
	STARTERP0_MBOX = 31,
	/* For M4 only */
	STARTERP1_GINT1 = 32 + 0,
	STARTERP1_PINT4,
	STARTERP1_PINT5,
	STARTERP1_PINT6,
	STARTERP1_PINT7,
	STARTERP1_OSTMR = 32 + 8,
} CHIP_SYSCTL_WAKEUP_T;

/**
 * System memory remap modes used to remap interrupt vectors
 */
typedef enum CHIP_SYSCTL_BOOT_MODE_REMAP {
	REMAP_BOOT_LOADER_MODE,	/*!< Interrupt vectors are re-mapped to Boot ROM */
	REMAP_USER_RAM_MODE,	/*!< Interrupt vectors are re-mapped to user Static RAM */
	REMAP_USER_FLASH_MODE	/*!< Interrupt vectors are not re-mapped and reside in Flash */
} CHIP_SYSCTL_BOOT_MODE_REMAP_T;

/**
 * Peripheral reset identifiers
 */
typedef enum {
	/* Peripheral reset enables for PRESETCTRL0 */
	RESET_FLASH = 7,				/*!< FLASH clock */
	RESET_GPIO0 = 14,				/*!< GPIO Port 0 */
	RESET_GPIO1,					/*!< GPIO Port 1 */
	RESET_PININT = 18,			/*!< Pin Interrupt Block */
	RESET_GINT,							/*!< Group Interrupt Block */
	RESET_DMA,							/*!< DMA clock */
	RESET_CRC,						/*!< CRC clock */
	RESET_WWDT,						/*!< WDT clock */
	RESET_RTC,						/*!< RTC clock */
	RESET_ADC0 = 27,				/*!< ADC0 clock */

	/* Peripheral reset enables for PRESETCTRL1 */
	RESET_MRT = 32,					/*!< multi-rate timer clock */
	RESET_OSTIMER,						/*!< OS timer clock */
	RESET_SCT0,					/*!< SCT0 clock */
	RESET_VFIFO = 32 + 9,		/*!< VFIFO clock */
	RESET_UTICK,							/*!< UTICK clock */
	RESET_CTIMER2 = 32 + 22,		/*!< TIMER2 clock */
	RESET_CTIMER3 = 32 + 26,		/*!< TIMER3 clock */
	RESET_CTIMER4,					/*!< TIMER4 clock */
	RESET_PVT,							/*!< PVT clock */
	RESET_BODY_BIAS,						/*!< Body Bias clock */
	RESET_EZH_A,						/*!< EZH_A clock */
	RESET_EZH_B,						/*!< EZH_B clock */
} CHIP_SYSCTL_PERIPH_RESET_T;

/**
 * Async peripheral reset identifiers
 */
typedef enum {
	/* Async peripheral reset enables for ASYNCPRESETCTRL */
	ASYNC_RESET_UART0 = 1,			/*!< UART0 clock */
	ASYNC_RESET_UART1,					/*!< UART1 clock */
	ASYNC_RESET_UART2,					/*!< UART2 clock */
	ASYNC_RESET_UART3,					/*!< UART3 clock */
	ASYNC_RESET_I2C0,					/*!< I2C0  clock */
	ASYNC_RESET_I2C1,					/*!< I2C1  clock */
	ASYNC_RESET_I2C2,					/*!< I2C2  clock */
	ASYNC_RESET_SPI0 = 9,				/*!< SPI0  clock */
	ASYNC_RESET_SPI1,						/*!< SPI1  clock */
	ASYNC_RESET_SPI2,					/*!< SPI2  clock */
	ASYNC_RESET_CTIMER0 = 13,		/*!< TIMER0 clock */
	ASYNC_RESET_CTIMER1,				/*!< TIMER1 clock */
	ASYNC_RESET_FRG,						/*!< FRG clock */
} CHIP_ASYNC_SYSCTL_PERIPH_RESET_T;

/**
 * Brown-out detector reset level
 */
typedef enum CHIP_SYSCTL_BODRSTLVL {
	SYSCTL_BODRSTLVL_0,	/*!< Brown-out reset at 1.46 ~ 1.63v */
	SYSCTL_BODRSTLVL_1,	/*!< Brown-out reset at 2.06v ~ 2.15v */
	SYSCTL_BODRSTLVL_2,	/*!< Brown-out reset at 2.35v ~ 2.43v */
	SYSCTL_BODRSTLVL_3,	/*!< Brown-out reset at 2.63v ~ 2.71v */
} CHIP_SYSCTL_BODRSTLVL_T;

/**
 * Brown-out detector interrupt level
 */
typedef enum CHIP_SYSCTL_BODRINTVAL {
	SYSCTL_BODINTVAL_LVL0,	/* Brown-out interrupt at 1.65 ~ 1.80v */
	SYSCTL_BODINTVAL_LVL1,	/* Brown-out interrupt at 2.22v ~ 2.35v*/
	SYSCTL_BODINTVAL_LVL2,	/* Brown-out interrupt at 2.52v ~ 2.66v */
	SYSCTL_BODINTVAL_LVL3,	/* Brown-out interrupt at 2.80v ~ 2.90v */
} CHIP_SYSCTL_BODRINTVAL_T;


/**
 * @}
 */

/**
 * @brief FLASH Access time definitions
 */
typedef enum {
	FLASHTIM_20MHZ_CPU = 2,		/*!< Flash accesses use 2 CPU clocks. Use for up to 20 MHz CPU clock*/
	FLASHTIM_72MHZ_CPU = 5,		/*!< Flash accesses use 4 CPU clocks. Use for up to 72 MHz CPU clock*/
} FMC_FLASHTIM_T;


/* CPU control and status definitions for M0 and M4 cores */
#define MC_M4_BOOT              (1 << 0)	/*!< Determines which CPU is considered the master, 0 = CM0+, 1 = CM4 */
#define MC_CM4_CLK_ENABLE       (1 << 2)	/*!< Cortex-M4 clock enable */
#define MC_CM0_CLK_ENABLE       (1 << 3)	/*!< Cortex-M0+ clock enable */
#define MC_CM4_RESET_ENABLE     (1 << 4)	/*!< Cortex-M4 reset */
#define MC_CM0_RESET_ENABLE     (1 << 5)	/*!< Cortex-M0+ reset */
#define MC_CM4_SLEEPCON_OWNER   (1 << 6)	/*!< Identifies the owner of reduced power mode control, 0 = CM0+, 1 = CM4 */

/* CPU STAT regsiter */	// FIXME - these definitions are not in the UM!
#define MC_M4_SLEEPING          (1 << 0)
#define MC_M0_SLEEPING          (1 << 1)
#define MC_M4_LOCKUP            (1 << 2)
#define MC_M0_LOCKUP            (1 << 3)



/**
 * @}
 */


/* Internal oscillator frequency */
#define SYSCTL_IRC_FREQ     (12000000)
#define SYSCTL_WDTOSC_FREQ  (500000)
#define SYSCTL_RTC_FREQ     (32000)

/**
 * Clock sources for system PLLs
 */
typedef enum CHIP_SYSCTL_PLLCLKSRC {
	SYSCTL_PLLCLKSRC_IRC = 0,		/*!< Internal oscillator */
	SYSCTL_PLLCLKSRC_CLKIN, 		/*!< Crystal (system) oscillator */
	SYSCTL_PLLCLKSRC_WDTOSC, 		/*!< WDT oscillator */
	SYSCTL_PLLCLKSRC_RTC, 			/*!< RTC oscillator */
} CHIP_SYSCTL_PLLCLKSRC_T;

/**
 * System and peripheral clocks enum
 */
typedef enum CHIP_SYSCTL_CLOCK {
	/* Peripheral clock enables for SYSAHBCLKCTRL0 */
	SYSCTL_CLOCK_SYS = 0,				/*!< System clock */
	SYSCTL_CLOCK_ROM,					/*!< ROM clock */
	SYSCTL_CLOCK_SRAM1 = 3,				/*!< SRAM1 clock */
	SYSCTL_CLOCK_SRAM2,					/*!< SRAM2 clock */
	SYSCTL_CLOCK_FLASH = 7,				/*!< FLASH controller clock */
	SYSCTL_CLOCK_FMC, 				/*!< FMC clock */
	SYSCTL_CLOCK_MUX = 11,				/*!< Input mux clock */
	SYSCTL_CLOCK_IOCON = 13,		/*!< IOCON clock */
	SYSCTL_CLOCK_GPIO0,					/*!< GPIO0 clock */
	SYSCTL_CLOCK_GPIO1,					/*!< GPIO1 clock */
	SYSCTL_CLOCK_PININT = 18,			/*!< PININT clock */
	SYSCTL_CLOCK_GINT,					/*!< grouped pin interrupt block clock */
	SYSCTL_CLOCK_DMA,					/*!< DMA clock */
	SYSCTL_CLOCK_CRC,					/*!< CRC clock */
	SYSCTL_CLOCK_WWDT,				/*!< WDT clock */
	SYSCTL_CLOCK_RTC,					/*!< RTC clock */
	SYSCTL_CLOCK_MBOX = 26,				/*!< Mailbox clock */
	SYSCTL_CLOCK_ADC0,				/*!< ADC0 clock */

	/* Peripheral clock enables for SYSAHBCLKCTRL1 */
	SYSCTL_CLOCK_MRT = 32,				    /*!< multi-rate timer clock */
	SYSCTL_CLOCK_OSTIMER,					    /*!< OS timer clock */
	SYSCTL_CLOCK_SCT0,		            /*!< SCT0 clock */
	SYSCTL_CLOCK_VFIFO = 32 + 9,	    /*!< VFIFO clock */
	SYSCTL_CLOCK_UTICK,					      /*!< UTICK clock */
	SYSCTL_CLOCK_CTIMER2 = 32 + 22,	  /*!< CTIMER2 clock */
	SYSCTL_CLOCK_CTIMER3 = 32 + 26,		/*!< CTIMER3 clock */
	SYSCTL_CLOCK_CTIMER4,		          /*!< CTIMER4 clock */
	SYSCTL_CLOCK_PVT,					        /*!< PVT clock */
	SYSCTL_CLOCK_BODY_BIAS,					  /*!< Body Bias clock */
	SYSCTL_CLOCK_EZH_A,			          /*!< EZH_A clock */
	SYSCTL_CLOCK_EZH_B,			          /*!< EZH_B clock */
} CHIP_SYSCTL_CLOCK_T;

/**
 * System and peripheral clocks enum
 */
typedef enum CHIP_ASYNC_SYSCTL_CLOCK {
	/* Peripheral clock enables for SYSAHBCLKCTRL0 */
	ASYNC_SYSCTL_CLOCK_UART0 = 1,			/*!< UART0 clock */
	ASYNC_SYSCTL_CLOCK_UART1,					/*!< UART1 clock */
	ASYNC_SYSCTL_CLOCK_UART2,				  /*!< UART2 clock */
	ASYNC_SYSCTL_CLOCK_UART3,					/*!< UART3 clock */
	ASYNC_SYSCTL_CLOCK_I2C0,			 	  /*!< I2C0  clock */
	ASYNC_SYSCTL_CLOCK_I2C1, 				  /*!< I2C1  clock */
	ASYNC_SYSCTL_CLOCK_I2C2,				  /*!< I2C2  clock */
	ASYNC_SYSCTL_CLOCK_SPI0 = 9,			/*!< SPI0  clock */
	ASYNC_SYSCTL_CLOCK_SPI1,					/*!< SPI1  clock */
	ASYNC_SYSCTL_CLOCK_SPI2,			    /*!< SPI2  clock */
	ASYNC_SYSCTL_CLOCK_CTIMER0 = 13,	/*!< CTIMER0 clock */
	ASYNC_SYSCTL_CLOCK_CTIMER1,				/*!< CTIMER1 clock */
	ASYNC_SYSCTL_CLOCK_FRG,					  /*!< FRG clock */
} CHIP_ASYNC_SYSCTL_CLOCK_T;

/**
 * Clock sources for CLKOUT
 */
typedef enum CHIP_SYSCTL_CLKOUTSRC {
	SYSCTL_CLKOUTSRC_MAINSYSCLK = 0,	/*!< Main system clock for CLKOUT */
	SYSCTL_CLKOUTSRC_CLKIN,		  /*!< CLKIN for CLKOUT */
	SYSCTL_CLKOUTSRC_WDTOSC,		/*!< Watchdog oscillator for CLKOUT */
	SYSCTL_CLKOUTSRC_IRC,		    /*!< Internal oscillator for CLKOUT */
	SYSCTL_CLKOUTSRCA_OUTPUT,		  /*!< clkoutA output route to input of clkoutB */
	SYSCTL_CLKOUTSRC_RTC = 7				  /*!< RTC oscillator 32KHz output */
} CHIP_SYSCTL_CLKOUTSRC_T;

/* SYS PLL related bit fields */
#define SYS_PLL_BYPASS_PLL(d)    (d<<15)
#define SYS_PLL_BYPASS_FBDIV2(d) (d<<16)
#define SYS_PLL_LIMUPOFF(d) (d<<17)
#define SYS_PLL_BANDSEL(d)  (d<<18)
#define SYS_PLL_DIRECTI(d)  (d<<19)
#define SYS_PLL_DIRECTO(d)  (d<<20)
#define SYS_PLL_INSELR(d)   ((d&0xf)<<0)      
#define SYS_PLL_INSELI(d)   ((d&0x3f)<<4) 
#define SYS_PLL_INSELP(d)   ((d&0x1f)<<10) 

/**
 * Clock source selections for only the main A system clock. The main A system
 * clock is used as an input into the main B system clock selector. Main clock A
 * only needs to be setup if the main clock A input is used in the main clock
 * system selector.
 */
typedef enum CHIP_SYSCTL_MAIN_A_CLKSRC {
	SYSCTL_MAIN_A_CLKSRC_IRC = 0,		/*!< Internal oscillator */
	SYSCTL_MAIN_A_CLKSRCA_CLKIN,		/*!< Crystal (main) oscillator in */
	SYSCTL_MAIN_A_CLKSRCA_WDTOSC,		/*!< Watchdog oscillator rate */
} CHIP_SYSCTL_MAIN_A_CLKSRC_T;

/**
 * @brief	Return main A clock rate
 * @return	main A clock rate in Hz
 */
uint32_t Chip_Clock_GetMain_A_ClockRate(void);

/**
 * Clock sources for only main B system clock
 */
typedef enum CHIP_SYSCTL_MAIN_B_CLKSRC {
	SYSCTL_MAIN_B_CLKSRC_MAINCLKSELA = 0,	/*!< main clock A */
	SYSCTL_MAIN_B_CLKSRC_SYSPLLIN,			/*!< System PLL input */
	SYSCTL_MAIN_B_CLKSRC_SYSPLLOUT,			/*!< System PLL output */
	SYSCTL_MAIN_B_CLKSRC_RTC,				/*!< RTC oscillator 32KHz output */
} CHIP_SYSCTL_MAIN_B_CLKSRC_T;


/**
 * @brief	Return main B clock rate
 * @return	main B clock rate
 */
uint32_t Chip_Clock_GetMain_B_ClockRate(void);


/**
 * Clock source selections for the AsyncSyscon A system clock. The AsyncSyscon A system
 * clock is used as an input into the AsyncSyscon B system clock selector. AsyncSyscon clock A
 * only needs to be setup if the AsyncSyscon A input is used in the AsyncSyscon clock
 * system selector.
 */
typedef enum CHIP_ASYNC_SYSCTL_A_SRC {
	ASYNC_SYSCTL_IRC,		        /*!< IRC or RingOSC input (TBD) */
	ASYNC_SYSCTL_WDTOSC,		    /*!< external CLK input */
} CHIP_ASYNC_SYSCTL_A_SRC_T;

/**
 * @brief	Return AsyncSyscon A clock rate
 * @return	AsyncSyscon A clock rate in Hz
 */
uint32_t Chip_Clock_GetAsyncSyscon_A_ClockRate(void);

/**
 * Clock sources for only AsyncSyscon B system clock
 */
typedef enum CHIP_ASYNC_SYSCTL_B_SRC {
	ASYNC_SYSCTL_MAINCLK = 0,		/*!< Internal oscillator */
	ASYNC_SYSCTL_CLKIN,		      /*!< external CLK input */
	ASYNC_SYSCTL_PLLOUT,		    /*!< PLL output */
	ASYNC_SYSCTL_A_OUTPUT,		  /*!< output from ASYNC APBCLKSEL_A */
} CHIP_ASYNC_SYSCTL_B_SRC_T;

/**
 * @brief	Return main B clock rate
 * @return	main B clock rate
 */
uint32_t Chip_Clock_GetAsyncSyscon_B_ClockRate(void);


/**
 * Clock sources for ADC asynchronous clock source select	
 */
typedef enum CHIP_SYSCTL_ADCASYNCCLKSRC {
	SYSCTL_ADCASYNCCLKSRC_MAINCLK = 0, 	  /*!< Main clock */
	SYSCTL_ADCASYNCCLKSRC_SYSPLLOUT,      /*!< PLL output */
	SYSCTL_ADCASYNCCLKSRC_IRC             /*!< Internal oscillator */
}
CHIP_SYSCTL_ADCASYNCCLKSRC_T;

/**
 * @brief	Return ADC asynchronous clock rate
 * @return	ADC asynchronous clock rate
 */
uint32_t Chip_Clock_GetADCASYNCRate(void);

/**
 * Clock sources for main system clock. This is a mix of both main clock A
 * and B seelctions.
 */
typedef enum CHIP_SYSCTL_MAINCLKSRC {
	SYSCTL_MAINCLKSRC_IRC = 0,			/*!< Internal oscillator */
	SYSCTL_MAINCLKSRC_CLKIN,			  /*!< Crystal (main) oscillator in */
	SYSCTL_MAINCLKSRC_WDTOSC,			  /*!< Watchdog oscillator rate */
	SYSCTL_MAINCLKSRCA_OUTPUT,		  /*!< MainclkA output route to input of MainclkB */
	SYSCTL_MAINCLKSRC_PLLIN,		    /*!< System PLL input */
	SYSCTL_MAINCLKSRC_PLLOUT,		    /*!< System PLL output */
	SYSCTL_MAINCLKSRC_RTC,				  /*!< RTC oscillator 32KHz output */
} CHIP_SYSCTL_MAINCLKSRC_T;

/**
 * Clock sources for AsyncSyscon system clock. This is a mix of both AsyncSyscon clock A
 * and B seelctions.
 */
typedef enum CHIP_SYSCTL_ASYNCSYSCONCLKSRC {
	ASYNC_SYSCTL_CLOCK_MAINCLK = 0,		    /*!< MainclkA output route to input of AsyncSysconClkB */
	ASYNC_SYSCTL_CLOCK_CLKIN,		          /*!< CLKIN input */
	ASYNC_SYSCTL_CLOCK_PLLOUT,		        /*!< System PLL output */
	ASYNC_SYSCTL_CLOCK_A_OUTPUT,				  /*!< ASYNC SYSCTRL A OUTPUT to ASYNC SYSCTRL B INPUT */
	ASYNC_SYSCTL_CLOCK_IRC,		    	      /*!< Internal oscillator */
	ASYNC_SYSCTL_CLOCK_WDTOSC,			      /*!< WDT oscillator in */
} CHIP_SYSCTL_ASYNCSYSCONCLKSRC_T;



/**
 * @brief LPC540XX IO Configuration Unit register block structure
 */
typedef struct {			/*!< LPC540XX IOCON Structure */
	__IO uint32_t  PIO[2][32];
} LPC_IOCON_T;

/**
 * @brief Array of IOCON pin definitions passed to Chip_IOCON_SetPinMuxing() must be in this format
 */
typedef struct {
	uint32_t port : 8;			/* Pin port */
	uint32_t pin : 8;			/* Pin number */
	uint32_t modefunc : 16;		/* Function and mode */
} PINMUX_GRP_T;

/**
 * IOCON function and mode selection definitions
 * See the User Manual for specific modes and functions supported by the
 * various LPC15XX pins.
 */
#define IOCON_FUNC0             0x0				/*!< Selects pin function 0 */
#define IOCON_FUNC1             0x1				/*!< Selects pin function 1 */
#define IOCON_FUNC2             0x2				/*!< Selects pin function 2 */
#define IOCON_FUNC3             0x3				/*!< Selects pin function 3 */
#define IOCON_FUNC4             0x4				/*!< Selects pin function 4 */
#define IOCON_FUNC5             0x5				/*!< Selects pin function 5 */
#define IOCON_FUNC6             0x6				/*!< Selects pin function 6 */
#define IOCON_FUNC7             0x7				/*!< Selects pin function 7 */
#define IOCON_MODE_INACT        (0x0 << 3)		/*!< No addition pin function */
#define IOCON_MODE_PULLDOWN     (0x1 << 3)		/*!< Selects pull-down function */
#define IOCON_MODE_PULLUP       (0x2 << 3)		/*!< Selects pull-up function */
#define IOCON_MODE_REPEATER     (0x3 << 3)		/*!< Selects pin repeater function */
#define IOCON_HYS_EN            (0x1 << 5)		/*!< Enables hysteresis */
#define IOCON_GPIO_MODE         (0x1 << 5)		/*!< GPIO Mode */
#define IOCON_I2C_SLEW          (0x1 << 5)		/*!< I2C Slew Rate Control */
#define IOCON_INV_EN            (0x1 << 6)		/*!< Enables invert function on input */
#define IOCON_ANALOG_EN         (0x0 << 7)		/*!< Enables analog function by setting 0 to bit 7 */
#define IOCON_DIGITAL_EN        (0x1 << 7)		/*!< Enables digital function by setting 1 to bit 7(default) */
#define IOCON_SFI2C_EN          (0x0 << 8)		/*!< I2C standard mode/fast-mode */
#define IOCON_STDI2C_EN         (0x1 << 8)		/*!< I2C standard I/O functionality */
#define IOCON_FASTI2C_EN        (0x2 << 8)		/*!< I2C Fast-mode Plus */
#define IOCON_INPFILT_OFF       (0x1 << 8)		/*!< Input filter Off for GPIO pins */
#define IOCON_INPFILT_ON        (0x0 << 8)		/*!< Input filter On for GPIO pins */
#define IOCON_OPENDRAIN_EN      (0x1 << 10)		/*!< Enables open-drain function */
#define IOCON_S_MODE_0CLK       (0x0 << 11)		/*!< Bypass input filter */
#define IOCON_S_MODE_1CLK       (0x1 << 11)		/*!< Input pulses shorter than 1 filter clock are rejected */
#define IOCON_S_MODE_2CLK       (0x2 << 11)		/*!< Input pulses shorter than 2 filter clock2 are rejected */
#define IOCON_S_MODE_3CLK       (0x3 << 11)		/*!< Input pulses shorter than 3 filter clock2 are rejected */
#define IOCON_S_MODE(clks)      ((clks) << 11)	/*!< Select clocks for digital input filter mode */
#define IOCON_CLKDIV(div)       ((div) << 13)	/*!< Select peripheral clock divider for input filter sampling clock, 2^n, n=0-6 */


/**
 * @brief	Set all I/O Control pin muxing
 * @param	pIOCON	    : The base of IOCON peripheral on the chip
 * @param	pinArray    : Pointer to array of pin mux selections
 * @param	arrayLength : Number of entries in pinArray
 * @return	Nothing
 */
void Chip_IOCON_SetPinMuxing(LPC_IOCON_T *pIOCON, const PINMUX_GRP_T *pinArray, uint32_t arrayLength);

/**
 * @}
 */

/**
 * @brief FLASH Memory Controller Unit register block structure
 */
typedef struct {
  __I  uint32_t RESERVED0[8] ;
  __IO uint32_t FMSSTART     ;
  __IO uint32_t FMSSTOP      ;
  __IO uint32_t RESERVED1    ;
  __IO uint32_t FMSW[4]      ;
} LPC_FMC_T;

/* Flash signature start and busy status bit */
#define FMC_FLASHSIG_BUSY     ((uint32_t) 1 << 31)

/* mem_b is 128 in Niobe, byte addr divided by 16, if mem_b = 256, FLASH_WORD_ALIGNED is 5, divided by 32 */
#define FLASH_WORD_ALIGNED    4

/**
 * @}
 */

 
/**
 * @brief LPC540XX Pin Interrupt and Pattern Match register block structure
 */
typedef struct {			/*!< PIN_INT Structure */
	__IO uint32_t ISEL;		/*!< Pin Interrupt Mode register */
	__IO uint32_t IENR;		/*!< Pin Interrupt Enable (Rising) register */
	__IO uint32_t SIENR;	/*!< Set Pin Interrupt Enable (Rising) register */
	__IO uint32_t CIENR;	/*!< Clear Pin Interrupt Enable (Rising) register */
	__IO uint32_t IENF;		/*!< Pin Interrupt Enable Falling Edge / Active Level register */
	__IO uint32_t SIENF;	/*!< Set Pin Interrupt Enable Falling Edge / Active Level register */
	__IO uint32_t CIENF;	/*!< Clear Pin Interrupt Enable Falling Edge / Active Level address */
	__IO uint32_t RISE;		/*!< Pin Interrupt Rising Edge register */
	__IO uint32_t FALL;		/*!< Pin Interrupt Falling Edge register */
	__IO uint32_t IST;		/*!< Pin Interrupt Status register */
	__IO uint32_t PMCTRL;	/*!< GPIO pattern match interrupt control register          */
	__IO uint32_t PMSRC;	/*!< GPIO pattern match interrupt bit-slice source register */
	__IO uint32_t PMCFG;	/*!< GPIO pattern match interrupt bit slice configuration register */
} LPC_PIN_INT_T;

/**
 * LPC540XX Pin Interrupt and Pattern match engine register
 * bit fields and macros
 */

/* PININT Interrupt Mode Mask */
#define PININT_ISEL_PMODE_MASK   ((uint32_t) 0x00FF)

/* PININT Pattern Match Control Register Mask */
#define PININT_PMCTRL_MASK       ((uint32_t) 0xFF000003)

/* PININT interrupt control register */
#define PININT_PMCTRL_PMATCH_SEL (1 << 0)
#define PININT_PMCTRL_RXEV_ENA   (1 << 1)

/* PININT Bit slice source register bits */
#define PININT_SRC_BITSOURCE_START  8
#define PININT_SRC_BITSOURCE_MASK   7

/* PININT Bit slice configuration register bits */
#define PININT_SRC_BITCFG_START  8
#define PININT_SRC_BITCFG_MASK   7

/**
 * LPC540XX Pin Interrupt channel values
 */
#define PININTCH0         (1 << 0)
#define PININTCH1         (1 << 1)
#define PININTCH2         (1 << 2)
#define PININTCH3         (1 << 3)
#define PININTCH4         (1 << 4)
#define PININTCH5         (1 << 5)
#define PININTCH6         (1 << 6)
#define PININTCH7         (1 << 7)
#define PININTCH(ch)      (1 << (ch))

/**
 * LPC540XX Pin Interrupt select enum values
 */
typedef enum Chip_PININT_SELECT {
	PININTSELECT0 = 0,
	PININTSELECT1 = 1,
	PININTSELECT2 = 2,
	PININTSELECT3 = 3,
	PININTSELECT4 = 4,
	PININTSELECT5 = 5,
	PININTSELECT6 = 6,
	PININTSELECT7 = 7
} Chip_PININT_SELECT_T;

/**
 * LPC540XX Pin Matching Interrupt bit slice enum values
 */
typedef enum Chip_PININT_BITSLICE {
	PININTBITSLICE0 = 0,	/*!< PININT Bit slice 0 */
	PININTBITSLICE1 = 1,	/*!< PININT Bit slice 1 */
	PININTBITSLICE2 = 2,	/*!< PININT Bit slice 2 */
	PININTBITSLICE3 = 3,	/*!< PININT Bit slice 3 */
	PININTBITSLICE4 = 4,	/*!< PININT Bit slice 4 */
	PININTBITSLICE5 = 5,	/*!< PININT Bit slice 5 */
	PININTBITSLICE6 = 6,	/*!< PININT Bit slice 6 */
	PININTBITSLICE7 = 7		/*!< PININT Bit slice 7 */
} Chip_PININT_BITSLICE_T;

/**
 * LPC540XX Pin Matching Interrupt bit slice configuration enum values
 */
typedef enum Chip_PININT_BITSLICE_CFG {
	PININT_PATTERNCONST1           = 0x0,	/*!< Contributes to product term match */
	PININT_PATTERNRISING           = 0x1,	/*!< Rising edge */
	PININT_PATTERNFALLING          = 0x2,	/*!< Falling edge */
	PININT_PATTERNRISINGORFALLING  = 0x3,	/*!< Rising or Falling edge */
	PININT_PATTERNHIGH             = 0x4,	/*!< High level */
	PININT_PATTERNLOW              = 0x5,	/*!< Low level */
	PININT_PATTERNCONST0           = 0x6,	/*!< Never contributes for match */
	PININT_PATTERNEVENT            = 0x7	/*!< Match occurs on event */
} Chip_PININT_BITSLICE_CFG_T;



/**
 * @brief LPC540XX Input Mux Register Block Structure
 */
typedef struct {						/*!< INMUX Structure */
	__IO uint32_t SCT0_INMUX[6];		/*!< Input mux registers for SCT0 inputs */
	__I  uint32_t RESERVED0[42];
	__IO uint32_t PINTSEL[8];			/*!< Pin interrupt select registers */
	__IO uint32_t DMA_ITRIG_INMUX[22];	/*!< Input mux register for DMA trigger inputs */
	__I  uint32_t RESERVED1[2];
	__IO uint32_t DMA_OTIRG_INMUX[4];	/*!< Input mux register for DMA trigger inputs */
	__I  uint32_t RESERVED2[4];
	__IO uint32_t FREQMEAS_REF;			/*!< Clock selection for frequency measurement ref clock */
	__IO uint32_t FREQMEAS_TARGET;		/*!< Clock selection for frequency measurement target clock */
} LPC_INMUX_T;

/**
 * LPC540XX DMA input trigger source to DMA
 */
typedef enum {
	INMUX_ADC0_SEQA_DMA = 0,
	INMUX_ADC0_SEQB_DMA,
	INMUX_SCT0_A_DMA,
	INMUX_SCT0_B_DMA,
	INMUX_CTIMER0_M0_DMA,
	INMUX_CTIMER0_M1_DMA,
	INMUX_CTIMER1_M0_DMA,
	INMUX_CTIMER2_M0_DMA,
	INMUX_CTIMER2_M1_DMA,
	INMUX_CTIMER3_M0_DMA,
	INMUX_CTIMER3_M1_DMA,
	INMUX_CTIMER4_M0_DMA,
	INMUX_PINTINT0_DMA,
	INMUX_PINTINT1_DMA,
	INMUX_PINTINT2_DMA,
	INMUX_PINTINT3_DMA,
	INMUX_OTRIG0_DMA,
	INMUX_OTRIG1_DMA,
	INMUX_OTRIG2_DMA,
	INMUX_OTRIG3_DMA,
} Chip_INMUX_DMA_ITRIG_CFG_T;


/**
 * @brief CRC register block structure
 */
typedef struct {					/*!< CRC Structure */
	__IO    uint32_t    MODE;		/*!< CRC Mode Register */
	__IO    uint32_t    SEED;		/*!< CRC SEED Register */
	union {
		__I     uint32_t    SUM;	/*!< CRC Checksum Register. */
		__O     uint32_t    WRDATA32;	/*!< CRC Data Register: write size 32-bit*/
		__O     uint16_t    WRDATA16;	/*!< CRC Data Register: write size 16-bit*/
		__O     uint8_t     WRDATA8;	/*!< CRC Data Register: write size 8-bit*/
	};

} LPC_CRC_T;

/*
 * @brief CRC MODE register description
 */
#define CRC_MODE_POLY_BITMASK   ((0x03))	/** CRC polynomial Bit mask */
#define CRC_MODE_POLY_CCITT     (0x00)		/** Select CRC-CCITT polynomial */
#define CRC_MODE_POLY_CRC16     (0x01)		/** Select CRC-16 polynomial */
#define CRC_MODE_POLY_CRC32     (0x02)		/** Select CRC-32 polynomial */
#define CRC_MODE_WRDATA_BITMASK (0x03 << 2)	/** CRC WR_Data Config Bit mask */
#define CRC_MODE_WRDATA_BIT_RVS (1 << 2)	/** Select Bit order reverse for WR_DATA (per byte) */
#define CRC_MODE_WRDATA_CMPL    (1 << 3)	/** Select One's complement for WR_DATA */
#define CRC_MODE_SUM_BITMASK    (0x03 << 4)	/** CRC Sum Config Bit mask */
#define CRC_MODE_SUM_BIT_RVS    (1 << 4)	/** Select Bit order reverse for CRC_SUM */
#define CRC_MODE_SUM_CMPL       (1 << 5)	/** Select One's complement for CRC_SUM */

#define MODE_CFG_CCITT          (0x00)	/** Pre-defined mode word for default CCITT setup */
#define MODE_CFG_CRC16          (0x15)	/** Pre-defined mode word for default CRC16 setup */
#define MODE_CFG_CRC32          (0x36)	/** Pre-defined mode word for default CRC32 setup */

#define CRC_SEED_CCITT          (0x0000FFFF)/** Initial seed value for CCITT mode */
#define CRC_SEED_CRC16          (0x00000000)/** Initial seed value for CRC16 mode */
#define CRC_SEED_CRC32          (0xFFFFFFFF)/** Initial seed value for CRC32 mode */

/**
 * @brief CRC polynomial
 */
typedef enum IP_CRC_001_POLY {
	CRC_POLY_CCITT = CRC_MODE_POLY_CCITT,	/**< CRC-CCIT polynomial */
	CRC_POLY_CRC16 = CRC_MODE_POLY_CRC16,	/**< CRC-16 polynomial */
	CRC_POLY_CRC32 = CRC_MODE_POLY_CRC32,	/**< CRC-32 polynomial */
	CRC_POLY_LAST,
} CRC_POLY_T;


/**
 * @brief  GPIO port register block structure
 */
typedef struct {				/*!< GPIO_PORT Structure */
	__IO uint8_t B[128][32];	/*!< Offset 0x0000: Byte pin registers ports 0 to n; pins PIOn_0 to PIOn_31 */
	__IO uint32_t W[32][32];	/*!< Offset 0x1000: Word pin registers port 0 to n */
	__IO uint32_t DIR[32];		/*!< Offset 0x2000: Direction registers port n */
	__IO uint32_t MASK[32];		/*!< Offset 0x2080: Mask register port n */
	__IO uint32_t PIN[32];		/*!< Offset 0x2100: Portpin register port n */
	__IO uint32_t MPIN[32];		/*!< Offset 0x2180: Masked port register port n */
	__IO uint32_t SET[32];		/*!< Offset 0x2200: Write: Set register for port n Read: output bits for port n */
	__O  uint32_t CLR[32];		/*!< Offset 0x2280: Clear port n */
	__O  uint32_t NOT[32];		/*!< Offset 0x2300: Toggle port n */
} LPC_GPIO_T;


/**
 * @brief LPC540XX MRT chip configuration
 */
#define MRT_CHANNELS_NUM      (4)
#define MRT_NO_IDLE_CHANNEL   (0x40)

/**
 * @brief MRT register block structure
 */
typedef struct {
	__IO uint32_t INTVAL;	/*!< Timer interval register */
	__O  uint32_t TIMER;	/*!< Timer register */
	__IO uint32_t CTRL;		/*!< Timer control register */
	__IO uint32_t STAT;		/*!< Timer status register */
} LPC_MRT_CH_T;

/**
 * @brief MRT register block structure
 */
typedef struct {
	LPC_MRT_CH_T CHANNEL[MRT_CHANNELS_NUM];
	uint32_t unused[45];
	__O  uint32_t IDLE_CH;
	__IO uint32_t IRQ_FLAG;
} LPC_MRT_T;

/**
 * @brief MRT Interrupt Modes enum
 */
typedef enum MRT_MODE {
	MRT_MODE_REPEAT =  (0 << 1),	/*!< MRT Repeat interrupt mode */
	MRT_MODE_ONESHOT = (1 << 1)		/*!< MRT One-shot interrupt mode */
} MRT_MODE_T;

/**
 * @brief MRT register bit fields & masks
 */
/* MRT Time interval register bit fields */
#define MRT_INTVAL_IVALUE        (0x7FFFFFFF)	/* Maximum interval load value and mask */
#define MRT_INTVAL_LOAD          (0x80000000UL)	/* Force immediate load of timer interval register bit */

/* MRT Control register bit fields & masks */
#define MRT_CTRL_INTEN_MASK      (0x01)
#define MRT_CTRL_MODE_MASK       (0x06)

/* MRT Status register bit fields & masks */
#define MRT_STAT_INTFLAG         (0x01)
#define MRT_STAT_RUNNING         (0x02)

/* Pointer to individual MR register blocks */
#define LPC_MRT_CH0         ((LPC_MRT_CH_T *) &LPC_MRT->CHANNEL[0])
#define LPC_MRT_CH1         ((LPC_MRT_CH_T *) &LPC_MRT->CHANNEL[1])
#define LPC_MRT_CH2         ((LPC_MRT_CH_T *) &LPC_MRT->CHANNEL[2])
#define LPC_MRT_CH3         ((LPC_MRT_CH_T *) &LPC_MRT->CHANNEL[3])
#define LPC_MRT_CH(ch)      ((LPC_MRT_CH_T *) &LPC_MRT->CHANNEL[(ch)])

/* Global interrupt flag register interrupt mask/clear values */
#define MRT0_INTFLAG        (1)
#define MRT1_INTFLAG        (2)
#define MRT2_INTFLAG        (4)
#define MRT3_INTFLAG        (8)
#define MRTn_INTFLAG(ch)    (1 << (ch))


/**
 * @brief UART register block structure
 */
typedef struct {
	__IO uint32_t  CFG;				/*!< Configuration register */
	__IO uint32_t  CTRL;			/*!< Control register           arm-none-eabi-objdump -x -D "${BuildArtifactFileName}" > out.lss */
	__IO uint32_t  STAT;  /*LSR*/	/*!< Status register  */
	__IO uint32_t  INTENSET;		/*!< Interrupt Enable read and set register */
	__O  uint32_t  INTENCLR;		/*!< Interrupt Enable clear register */
	__I  uint32_t  RXDATA;/*RBR*/	/*!< Receive Data register  */
	__I  uint32_t  RXDATA_STAT;		/*!< Receive Data with status register */
	__IO uint32_t  TXDATA;/*THR*/	/*!< Transmit data register */
	__IO uint32_t  BRG;				/*!< Baud Rate Generator register */
	__IO uint32_t  INTSTAT;/*IIR*/  /*!< Interrupt status register */
	__IO uint32_t  OSR;			    /*!< Oversample selection register */  
	__IO uint32_t  ADDR;			  /*!< Address register */    
} LPC_UART_TypeDef;

#define MIN_UART

/**
 * @brief UART CFG register definitions
 */
#define UART_CFG_ENABLE         (0x01 << 0)
#define UART_CFG_DATALEN_7      (0x00 << 2)		/*!< UART 7 bit length mode */
#define UART_CFG_DATALEN_8      (0x01 << 2)		/*!< UART 8 bit length mode */
#define UART_CFG_DATALEN_9      (0x02 << 2)		/*!< UART 9 bit length mode */
#define UART_CFG_STOPLEN_1      (0x00 << 6)		/*!< UART One Stop Bit Select */
#define UART_CFG_STOPLEN_2      (0x01 << 6)		/*!< UART Two Stop Bits Select */
#define UART_CFG_MODE32K        (0x01 << 7)		/*!< UART 32K MODE */
#define UART_CFG_LINMODE        (0x01 << 8)		/*!< UART LIN MODE */
#define UART_CFG_CTSEN          (0x01 << 9)		/*!< CTS enable bit */
#define UART_CFG_SYNCEN         (0x01 << 11)	/*!< Synchronous mode enable bit */
#define UART_CFG_CLKPOL         (0x01 << 12)	/*!< Un_RXD rising edge sample enable bit */
#define UART_CFG_SYNCMST        (0x01 << 14)	/*!< Select master mode (synchronous mode) enable bit */
#define UART_CFG_LOOP           (0x01 << 15)	/*!< Loopback mode enable bit */

/**
 * @brief UART CTRL register definitions
 */
#define UART_CTRL_TXBRKEN       (0x01 << 1)		/*!< Continuous break enable bit */
#define UART_CTRL_ADDRDET       (0x01 << 2)		/*!< Address detect mode enable bit */
#define UART_CTRL_TXDIS         (0x01 << 6)		/*!< Transmit disable bit */
#define UART_CTRL_CC            (0x01 << 8)		/*!< Continuous Clock mode enable bit */
#define UART_CTRL_CLRCC         (0x01 << 9)		/*!< Clear Continuous Clock bit */
#define UART_CTRL_AUTOBAUD      (0x01 << 16)	/*!< Auto baud bit */

/**
 * @brief UART STAT register definitions
 */
#define UART_STAT_RXRDY         (0x01 << 0)			/*!< Receiver ready */
#define UART_STAT_RXIDLE        (0x01 << 1)			/*!< Receiver idle */
#define UART_STAT_TXRDY         (0x01 << 2)			/*!< Transmitter ready for data */
#define UART_STAT_TXIDLE        (0x01 << 3)			/*!< Transmitter idle */
#define UART_STAT_CTS           (0x01 << 4)			/*!< Status of CTS signal */
#define UART_STAT_DELTACTS      (0x01 << 5)			/*!< Change in CTS state */
#define UART_STAT_TXDISINT      (0x01 << 6)			/*!< Transmitter disabled */
#define UART_STAT_OVERRUNINT    (0x01 << 8)			/*!< Overrun Error interrupt flag. */
#define UART_STAT_RXBRK         (0x01 << 10)		/*!< Received break */
#define UART_STAT_DELTARXBRK    (0x01 << 11)		/*!< Change in receive break detection */
#define UART_STAT_START         (0x01 << 12)		/*!< Start detected */
#define UART_STAT_FRM_ERRINT    (0x01 << 13)		/*!< Framing Error interrupt flag */
#define UART_STAT_PAR_ERRINT    (0x01 << 14)		/*!< Parity Error interrupt flag */
#define UART_STAT_RXNOISEINT    (0x01 << 15)		/*!< Received Noise interrupt flag */
#define UART_STAT_ABERR         (0x01 << 16)		/*!< Auto baud error flag */

/**
 * @brief UART INTENSET/INTENCLR register definitions
 */
#define UART_INTEN_RXRDY        (0x01 << 0)			/*!< Receive Ready interrupt */
#define UART_INTEN_TXRDY        (0x01 << 2)			/*!< Transmit Ready interrupt */
#define UART_INTEN_DELTACTS     (0x01 << 5)			/*!< Change in CTS state interrupt */
#define UART_INTEN_TXDIS        (0x01 << 6)			/*!< Transmitter disable interrupt */
#define UART_INTEN_OVERRUN      (0x01 << 8)			/*!< Overrun error interrupt */
#define UART_INTEN_DELTARXBRK   (0x01 << 11)		/*!< Change in receiver break detection interrupt */
#define UART_INTEN_START        (0x01 << 12)		/*!< Start detect interrupt */
#define UART_INTEN_FRAMERR      (0x01 << 13)		/*!< Frame error interrupt */
#define UART_INTEN_PARITYERR    (0x01 << 14)		/*!< Parity error interrupt */
#define UART_INTEN_RXNOISE      (0x01 << 15)		/*!< Received noise interrupt */
 

/**
 * @brief Windowed Watchdog register block structure
 */
typedef struct {				/*!< WWDT Structure         */
	__IO uint32_t  MOD;			/*!< Watchdog mode register. This register contains the basic mode and status of the Watchdog Timer. */
	__IO uint32_t  TC;			/*!< Watchdog timer constant register. This register determines the time-out value. */
	__O  uint32_t  FEED;		/*!< Watchdog feed sequence register. Writing 0xAA followed by 0x55 to this register reloads the Watchdog timer with the value contained in WDTC. */
	__I  uint32_t  TV;			/*!< Watchdog timer value register. This register reads out the current value of the Watchdog timer. */
	__I  uint32_t  RESERVED0;
	__IO uint32_t  WARNINT;		/*!< Watchdog warning interrupt register. This register contains the Watchdog warning interrupt compare value. */
	__IO uint32_t  WINDOW;		/*!< Watchdog timer window register. This register contains the Watchdog window value. */
} LPC_WWDT_T;

/**
 * @brief Watchdog Mode register definitions
 */
/** Watchdog Mode Bitmask */
#define WWDT_WDMOD_BITMASK          ((uint32_t) 0x3F)
/** WWDT enable bit */
#define WWDT_WDMOD_WDEN             ((uint32_t) (1 << 0))
/** WWDT reset enable bit */
#define WWDT_WDMOD_WDRESET          ((uint32_t) (1 << 1))
/** WWDT time-out flag bit */
#define WWDT_WDMOD_WDTOF            ((uint32_t) (1 << 2))
/** WWDT warning interrupt flag bit */
#define WWDT_WDMOD_WDINT            ((uint32_t) (1 << 3))
/** WWDT Protect flag bit */
#define WWDT_WDMOD_WDPROTECT        ((uint32_t) (1 << 4))
/** WWDT lock bit */
#define WWDT_WDMOD_LOCK             ((uint32_t) (1 << 5))


    /*                         match/cap registers,     events,           states,         inputs,         outputs
    *
     * @brief SCT Module configuration
     */
#define CONFIG_SCT_nEV   (16)			/*!< Number of events */
#define CONFIG_SCT_nRG   (16)			/*!< Number of match/compare registers */
#define CONFIG_SCT_nOU   (10)			/*!< Number of outputs */
#define CONFIG_SCT_nIN   (8)			/*!< Number of outputs */

    /**
     * @brief State Configurable Timer register block structure
     */
    typedef struct {
        __IO uint32_t CONFIG; /*!< Configuration Register */

        union {
            __IO uint32_t CTRL_U; /*!< Control Register */

            struct {
                __IO uint16_t CTRL_L; /*!< Low control register */
                __IO uint16_t CTRL_H; /*!< High control register */
            };

        };

        __IO uint16_t LIMIT_L; /*!< limit register for counter L */
        __IO uint16_t LIMIT_H; /*!< limit register for counter H */
        __IO uint16_t HALT_L; /*!< halt register for counter L */
        __IO uint16_t HALT_H; /*!< halt register for counter H */
        __IO uint16_t STOP_L; /*!< stop register for counter L */
        __IO uint16_t STOP_H; /*!< stop register for counter H */
        __IO uint16_t START_L; /*!< start register for counter L */
        __IO uint16_t START_H; /*!< start register for counter H */
        uint32_t RESERVED1[10]; /*!< 0x03C reserved */

        union {
            __IO uint32_t COUNT_U; /*!< counter register */

            struct {
                __IO uint16_t COUNT_L; /*!< counter register for counter L */
                __IO uint16_t COUNT_H; /*!< counter register for counter H */
            };

        };

        __IO uint16_t STATE_L; /*!< state register for counter L */
        __IO uint16_t STATE_H; /*!< state register for counter H */
        __I uint32_t INPUT; /*!< input register */
        __IO uint16_t REGMODE_L; /*!< match - capture registers mode register L */
        __IO uint16_t REGMODE_H; /*!< match - capture registers mode register H */
        __IO uint32_t OUTPUT; /*!< output register */
        __IO uint32_t OUTPUTDIRCTRL; /*!< output counter direction Control Register */
        __IO uint32_t RES; /*!< conflict resolution register */
        __IO uint32_t DMA0REQUEST; /*!< DMA0 Request Register */
        __IO uint32_t DMA1REQUEST; /*!< DMA1 Request Register */
        uint32_t RESERVED2[35];
        __IO uint32_t EVEN; /*!< event enable register */
        __IO uint32_t EVFLAG; /*!< event flag register */
        __IO uint32_t CONEN; /*!< conflict enable register */
        __IO uint32_t CONFLAG; /*!< conflict flag register */

        union {

            __IO union { /*!< ... Match / Capture value */
                uint32_t U; /*!<       SCTMATCH[i].U  Unified 32-bit register */

                struct {
                    uint16_t L; /*!<       SCTMATCH[i].L  Access to L value */
                    uint16_t H; /*!<       SCTMATCH[i].H  Access to H value */
                };
            } MATCH[CONFIG_SCT_nRG];

            __I union {
                uint32_t U; /*!<       SCTCAP[i].U  Unified 32-bit register */

                struct {
                    uint16_t L; /*!<       SCTCAP[i].L  Access to L value */
                    uint16_t H; /*!<       SCTCAP[i].H  Access to H value */
                };
            } CAP[CONFIG_SCT_nRG];
        };

#if 0        

        union { /* 0x140-... FRAMatch value */
            __IO uint32_t U; /*       FRASCTMATCH[i].U  Unified 32-bit register */

            struct {
                __IO uint16_t L; /*       FRASCTFRAMATCH[i].L  Access to L value */
                __IO uint16_t H; /*       FRASCTFRAMATCH[i].H  Access to H value */
            };
        } FRAMATCH[6];
#endif

        uint32_t RESERVED3[48];

        union {

            __IO union { /* 0x200-... Match Reload / Capture Control value */
                uint32_t U; /*       SCTMATCHREL[i].U  Unified 32-bit register */

                struct {
                    uint16_t L; /*       SCTMATCHREL[i].L  Access to L value */
                    uint16_t H; /*       SCTMATCHREL[i].H  Access to H value */
                };
            } MATCHREL[CONFIG_SCT_nRG];

            __IO union {
                uint32_t U; /*       SCTCAPCTRL[i].U  Unified 32-bit register */

                struct {
                    uint16_t L; /*       SCTCAPCTRL[i].L  Access to H value */
                    uint16_t H; /*       SCTCAPCTRL[i].H  Access to H value */
                };
            } CAPCTRL[CONFIG_SCT_nRG];
        };

#if 0        

        union { /* 0x240-... FRAMatch Reload value */
            __IO uint32_t U; /*       RELFRAMATCH[i].U  Unified 32-bit register */

            struct {
                __IO uint16_t L; /*       RELFRAMATCH[i].L  Access to L value */
                __IO uint16_t H; /*       RELFRAMATCH[i].H  Access to H value */
            };
        } RELFRAMATCH[6];
#endif

        uint32_t RESERVED6[48];

        __IO struct { /* 0x300-0x3FC  SCTEVENT[i].STATE / SCTEVENT[i].CTRL*/
            uint32_t STATE; /* Event State Register */
            uint32_t CTRL; /* Event Control Register */
        } EVENT[CONFIG_SCT_nEV];

        uint32_t RESERVED9[128 - 2 * CONFIG_SCT_nEV]; /*!< ...-0x4FC reserved */

        __IO struct { /*!< 0x500-0x57C  SCTOUT[i].SET / SCTOUT[i].CLR */
            uint32_t SET; /*!< Output n Set Register */
            uint32_t CLR; /*!< Output n Clear Register */
        } OUT[CONFIG_SCT_nOU];

        uint32_t RESERVED10[191 - 2 * CONFIG_SCT_nOU]; /*!< ...-0x7F8 reserved */
        __I uint32_t MODULECONTENT; /*!< 0x7FC Module Content */
    } LPC_SCT_T;



    /*
     * @brief Macro defines for SCT configuration register
     */
#define SCT_CONFIG_16BIT_COUNTER        0x00000000	/*!< Operate as 2 16-bit counters */
#define SCT_CONFIG_32BIT_COUNTER        0x00000001	/*!< Operate as 1 32-bit counter */

#define SCT_CONFIG_CLKMODE_BUSCLK       (0x0 << 1)	/*!< Bus clock */
#define SCT_CONFIG_CLKMODE_SCTCLK       (0x1 << 1)	/*!< SCT clock */
#define SCT_CONFIG_CLKMODE_INCLK        (0x2 << 1)	/*!< Input clock selected in CLKSEL field */
#define SCT_CONFIG_CLKMODE_INEDGECLK    (0x3 << 1)	/*!< Input clock edge selected in CLKSEL field */


#define SCT_CONFIG_CLKMODE_SYSCLK               (0x0 << 1)	/*!< System clock */
#define SCT_CONFIG_CLKMODE_PRESCALED_SYSCLK     (0x1 << 1)	/*!< Prescaled system clock */
#define SCT_CONFIG_CLKMODE_SCT_INPUT            (0x2 << 1)	/*!< Input clock/edge selected in CKSEL field */
#define SCT_CONFIG_CLKMODE_PRESCALED_SCT_INPUT  (0x3 << 1)	/*!< Prescaled input clock/edge selected in CKSEL field */

#define SCT_CONFIG_CKSEL_RISING_IN_0    (0x0UL << 3)               
#define SCT_CONFIG_CKSEL_FALLING_IN_0   (0x1UL << 3)               
#define SCT_CONFIG_CKSEL_RISING_IN_1    (0x2UL << 3)               
#define SCT_CONFIG_CKSEL_FALLING_IN_1   (0x3UL << 3)               
#define SCT_CONFIG_CKSEL_RISING_IN_2    (0x4UL << 3)               
#define SCT_CONFIG_CKSEL_FALLING_IN_2   (0x5UL << 3)               
#define SCT_CONFIG_CKSEL_RISING_IN_3    (0x6UL << 3)               
#define SCT_CONFIG_CKSEL_FALLING_IN_3   (0x7UL << 3)               
#define SCT_CONFIG_CKSEL_RISING_IN_4    (0x8UL << 3)               
#define SCT_CONFIG_CKSEL_FALLING_IN_4   (0x9UL << 3)               
#define SCT_CONFIG_CKSEL_RISING_IN_5    (0xAUL << 3)               
#define SCT_CONFIG_CKSEL_FALLING_IN_5   (0xBUL << 3)               
#define SCT_CONFIG_CKSEL_RISING_IN_6    (0xCUL << 3)               
#define SCT_CONFIG_CKSEL_FALLING_IN_6   (0xDUL << 3)               
#define SCT_CONFIG_CKSEL_RISING_IN_7    (0xEUL << 3)               
#define SCT_CONFIG_CKSEL_FALLING_IN_7   (0xFUL << 3)               
#define SCT_CONFIG_NORELOADL_U          (0x1 << 7)	/*!< Operate as 1 32-bit counter */
#define SCT_CONFIG_NORELOADH            (0x1 << 8)	/*!< Operate as 1 32-bit counter */
#define SCT_CONFIG_AUTOLIMIT_U          (0x1UL << 17)
#define SCT_CONFIG_AUTOLIMIT_L          (0x1UL << 17)    
#define SCT_CONFIG_AUTOLIMIT_H          (0x1UL << 18) 
    
    
    /*
     * @brief Macro defines for SCT control register
     */
#define COUNTUP_TO_LIMIT_THEN_CLEAR_TO_ZERO     0			/*!< Direction for low or unified counter */
#define COUNTUP_TO LIMIT_THEN_COUNTDOWN_TO_ZERO 1

#define SCT_CTRL_STOP_L                 (1 << 1)				/*!< Stop low counter */
#define SCT_CTRL_HALT_L                 (1 << 2)				/*!< Halt low counter */
#define SCT_CTRL_CLRCTR_L               (1 << 3)				/*!< Clear low or unified counter */
#define SCT_CTRL_BIDIR_L(x)             (((x) & 0x01) << 4)		/*!< Bidirectional bit */
#define SCT_CTRL_PRE_L(x)               (((x) & 0xFF) << 5)		/*!< Prescale clock for low or unified counter */

#define COUNTUP_TO_LIMIT_THEN_CLEAR_TO_ZERO     0			/*!< Direction for high counter */
#define COUNTUP_TO LIMIT_THEN_COUNTDOWN_TO_ZERO 1
#define SCT_CTRL_STOP_H                 (1 << 17)				/*!< Stop high counter */
#define SCT_CTRL_HALT_H                 (1 << 18)				/*!< Halt high counter */
#define SCT_CTRL_CLRCTR_H               (1 << 19)				/*!< Clear high counter */
#define SCT_CTRL_BIDIR_H(x)             (((x) & 0x01) << 20)
#define SCT_CTRL_PRE_H(x)               (((x) & 0xFF) << 21)	/*!< Prescale clock for high counter */

#define SCT_EV_CTRL_MATCHSEL(reg)               (reg << 0)
#define SCT_EV_CTRL_HEVENT_L                    (0UL << 4)
#define SCT_EV_CTRL_HEVENT_H                    (1UL << 4)
#define SCT_EV_CTRL_OUTSEL_INPUT                (0UL << 5)
#define SCT_EV_CTRL_OUTSEL_OUTPUT               (0UL << 5)
#define SCT_EV_CTRL_IOSEL(signal)               (signal << 6)

#define SCT_EV_CTRL_IOCOND_LOW                  (0UL << 10)
#define SCT_EV_CTRL_IOCOND_RISE                 (0x1UL << 10)
#define SCT_EV_CTRL_IOCOND_FALL                 (0x2UL << 10)
#define SCT_EV_CTRL_IOCOND_HIGH                 (0x3UL << 10)
#define SCT_EV_CTRL_COMBMODE_OR                 (0x0UL << 12)
#define SCT_EV_CTRL_COMBMODE_MATCH              (0x1UL << 12)
#define SCT_EV_CTRL_COMBMODE_IO                 (0x2UL << 12)
#define SCT_EV_CTRL_COMBMODE_AND                (0x3UL << 12)
#define SCT_EV_CTRL_STATELD                     (0x1UL << 14)
#define SCT_EV_CTRL_STATEV(x)                   (x << 15)
#define SCT_EV_CTRL_MATCHMEM                    (0x1UL << 20)
#define SCT_EV_CTRL_DIRECTION_INDEPENDENT       (0x0UL << 21)
#define SCT_EV_CTRL_DIRECTION_UP                (0x1UL << 21)
#define SCT_EV_CTRL_DIRECTION_DOWN              (0x2UL << 21)




    /*
     * @brief Macro defines for SCT Conflict resolution register
     */
#define SCT_RES_NOCHANGE                (0)
#define SCT_RES_SET_OUTPUT              (1)
#define SCT_RES_CLEAR_OUTPUT            (2)
#define SCT_RES_TOGGLE_OUTPUT           (3)

    /**
     * SCT Match register values enum
     */
    typedef enum CHIP_SCT_MATCH_REG {
        SCT_MATCH_0 = 0, /*!< SCT Match register 0 */
        SCT_MATCH_1,
        SCT_MATCH_2,
        SCT_MATCH_3,
        SCT_MATCH_4,
        SCT_MATCH_5,
        SCT_MATCH_6,
        SCT_MATCH_7,
        SCT_MATCH_8,
        SCT_MATCH_9,
        SCT_MATCH_10,
        SCT_MATCH_11,
        SCT_MATCH_12,
        SCT_MATCH_13,
        SCT_MATCH_14,
        SCT_MATCH_15
    } CHIP_SCT_MATCH_REG_T;

    /**
     * SCT Event values enum
     */
    typedef enum CHIP_SCT_EVENT {
        SCT_EVT_0 = (1 << 0), /*!< Event 0 */
        SCT_EVT_1 = (1 << 1), /*!< Event 1 */
        SCT_EVT_2 = (1 << 2), /*!< Event 2 */
        SCT_EVT_3 = (1 << 3), /*!< Event 3 */
        SCT_EVT_4 = (1 << 4), /*!< Event 4 */
        SCT_EVT_5 = (1 << 5), /*!< Event 5 */
        SCT_EVT_6 = (1 << 6), /*!< Event 6 */
        SCT_EVT_7 = (1 << 7), /*!< Event 7 */
        SCT_EVT_8 = (1 << 8), /*!< Event 8 */
        SCT_EVT_9 = (1 << 9), /*!< Event 9 */
        SCT_EVT_10 = (1 << 10), /*!< Event 10 */
        SCT_EVT_11 = (1 << 11), /*!< Event 11 */
        SCT_EVT_12 = (1 << 12), /*!< Event 12 */
        SCT_EVT_13 = (1 << 13), /*!< Event 13 */
        SCT_EVT_14 = (1 << 14), /*!< Event 14 */
        SCT_EVT_15 = (1 << 15) /*!< Event 15 */
    } CHIP_SCT_EVENT_T;

    

/**
 * @brief SPI register block structure
 */
typedef struct {					/*!< SPI Structure */
	__IO uint32_t  CFG;				/*!< SPI Configuration register */
	__IO uint32_t  DLY;				/*!< SPI Delay register */
	__IO uint32_t  STAT;			/*!< SPI Status register */
	__IO uint32_t  INTENSET;		/*!< SPI Interrupt Enable Set register */
	__O  uint32_t  INTENCLR;		/*!< SPI Interrupt Enable Clear register */
	__I  uint32_t  RXDAT;			/*!< SPI Receive Data register */
	__IO uint32_t  TXDATCTL;		/*!< SPI Transmit Data with Control register */
	__IO uint32_t  TXDAT;			/*!< SPI Transmit Data register */
	__IO uint32_t  TXCTRL;			/*!< SPI Transmit Control register */
	__IO uint32_t  DIV;				/*!< SPI clock Divider register */
	__I  uint32_t  INTSTAT;			/*!< SPI Interrupt Status register */
} LPC_SPI_T;

/**
 * Macro defines for SPI Configuration register
 */
#define SPI_CFG_BITMASK			(0xFBD)						/** SPI register bit mask */
#define SPI_CFG_SPI_EN			(1 << 0)					/** SPI Slave Mode Select */
#define SPI_CFG_SLAVE_EN		(0 << 0)					/** SPI Master Mode Select */
#define SPI_CFG_MASTER_EN		(1 << 2)					/** SPI MSB First mode enable */
#define SPI_CFG_MSB_FIRST_EN	(0 << 3)					/** SPI LSB First mode enable */
#define SPI_CFG_LSB_FIRST_EN	(1 << 3)					/** SPI Clock Phase Select */
#define SPI_CFG_CPHA_FIRST		(0 << 4)					/** Capture data on the first edge, Change data on the following edge */
#define SPI_CFG_CPHA_SECOND		(1 << 4)					/** SPI Clock Polarity Select */
#define SPI_CFG_CPOL_LO			(0 << 5)					/** The rest state of the clock (between frames) is low. */
#define SPI_CFG_CPOL_HI			(1 << 5)					/** The rest state of the clock (between frames) is high. */
#define SPI_CFG_LBM_EN			(1 << 7)					/** SPI control 1 loopback mode enable */
#define SPI_CFG_SPOL_LO			(0 << 8)					/** SPI SSEL0 Polarity Select */
#define SPI_CFG_SPOL_HI			(1 << 8)					/** SSEL0 is active High */
#define SPI_CFG_SPOLNUM_HI(n)	(1 << ((n) + 8))			/** SSELN is active High, selects 0 - 3 */

/**
 * Macro defines for SPI Delay register
 */
#define  SPI_DLY_BITMASK			(0xFFFF)				/** SPI DLY Register Mask */
#define  SPI_DLY_PRE_DELAY(n)		(((n) & 0x0F) << 0)		/** Time in SPI clocks between SSEL assertion and the beginning of a data frame */
#define  SPI_DLY_POST_DELAY(n)		(((n) & 0x0F) << 4)		/** Time in SPI clocks between the end of a data frame and SSEL deassertion. */
#define  SPI_DLY_FRAME_DELAY(n)		(((n) & 0x0F) << 8)		/** Minimum time in SPI clocks between adjacent data frames. */
#define  SPI_DLY_TRANSFER_DELAY(n)	(((n) & 0x0F) << 12)	/** Minimum time in SPI clocks that the SSEL is deasserted between transfers. */

/**
 * Macro defines for SPI Status register
 */
#define SPI_STAT_BITMASK			(0x1FF)					/** SPI STAT Register BitMask */
#define SPI_STAT_RXRDY				(1 << 0)				/** Receiver Ready Flag */
#define SPI_STAT_TXRDY				(1 << 1)				/** Transmitter Ready Flag */
#define SPI_STAT_RXOV				(1 << 2)				/** Receiver Overrun interrupt flag */
#define SPI_STAT_TXUR				(1 << 3)				/** Transmitter Underrun interrupt flag (In Slave Mode only) */
#define SPI_STAT_SSA				(1 << 4)				/** Slave Select Assert */
#define SPI_STAT_SSD				(1 << 5)				/** Slave Select Deassert */
#define SPI_STAT_STALLED			(1 << 6)				/** Stalled status flag */
#define SPI_STAT_EOT				(1 << 7)				/** End Transfer flag */
#define SPI_STAT_MSTIDLE			(1 << 8)				/** Idle status flag */

/**
 * Macro defines for SPI Interrupt Enable read and Set register
 */
#define SPI_INTENSET_BITMASK		(0x3F)					/** SPI INTENSET Register BitMask */
#define SPI_INTENSET_RXDYEN			(1 << 0)				/** Enable Interrupt when receiver data is available */
#define SPI_INTENSET_TXDYEN			(1 << 1)				/** Enable Interrupt when the transmitter holding register is available. */
#define SPI_INTENSET_RXOVEN			(1 << 2)				/**  Enable Interrupt when a receiver overrun occurs */
#define SPI_INTENSET_TXUREN			(1 << 3)				/**  Enable Interrupt when a transmitter underrun occurs (In Slave Mode Only)*/
#define SPI_INTENSET_SSAEN			(1 << 4)				/**  Enable Interrupt when the Slave Select is asserted.*/
#define SPI_INTENSET_SSDEN			(1 << 5)				/**  Enable Interrupt when the Slave Select is deasserted..*/

/**
 * Macro defines for SPI Interrupt Enable Clear register
 */
#define SPI_INTENCLR_BITMASK		(0x3F)					/** SPI INTENCLR Register BitMask */
#define SPI_INTENCLR_RXDYEN			(1 << 0)				/** Disable Interrupt when receiver data is available */
#define SPI_INTENCLR_TXDYEN			(1 << 1)				/** Disable Interrupt when the transmitter holding register is available. */
#define SPI_INTENCLR_RXOVEN			(1 << 2)				/** Disable Interrupt when a receiver overrun occurs */
#define SPI_INTENCLR_TXUREN			(1 << 3)				/** Disable Interrupt when a transmitter underrun occurs (In Slave Mode Only) */
#define SPI_INTENCLR_SSAEN			(1 << 4)				/** Disable Interrupt when the Slave Select is asserted. */
#define SPI_INTENCLR_SSDEN			(1 << 5)				/** Disable Interrupt when the Slave Select is deasserted.. */

/**
 * Macro defines for SPI Receiver Data register
 */
#define SPI_RXDAT_BITMASK			(0x1FFFFF)				/** SPI RXDAT Register BitMask */
#define SPI_RXDAT_DATA(n)			((n) & 0xFFFF)			/** Receiver Data  */
#define SPI_RXDAT_RXSSELN_ACTIVE	(0 << 16)				/** The state of SSEL pin is active */
#define SPI_RXDAT_RXSSELN_INACTIVE	((1 << 16)				/** The state of SSEL pin is inactive */
#define SPI_RXDAT_RXSSELNUM_INACTIVE(n)	(1 << ((n) + 16))	/** The state of SSELN pin is inactive */
#define SPI_RXDAT_SOT				(1 << 20)				/** Start of Transfer flag  */

/**
 * Macro defines for SPI Transmitter Data and Control register
 */
#define SPI_TXDATCTL_BITMASK		(0xF7FFFFF)				/** SPI TXDATCTL Register BitMask */
#define SPI_TXDATCTL_DATA(n)		((n) & 0xFFFF)			/** SPI Transmit Data */
#define SPI_TXDATCTL_CTRLMASK		(0xF7F0000)				/** SPI TXDATCTL Register BitMask for control bits only */
#define SPI_TXDATCTL_ASSERT_SSEL	(0 << 16)				/** Assert SSEL0 pin */
#define SPI_TXDATCTL_DEASSERT_SSEL	(1 << 16)				/** Deassert SSEL0 pin */
#define SPI_TXDATCTL_DEASSERTNUM_SSEL(n)	(1 << ((n) + 16))	/** Deassert SSELN pin */
#define SPI_TXDATCTL_DEASSERT_ALL	(0xF << 16)				/** Deassert all SSEL pins */
#define SPI_TXDATCTL_EOT            (1 << 20)				/** End of Transfer flag (TRANSFER_DELAY is applied after sending the current frame) */
#define SPI_TXDATCTL_EOF            (1 << 21)				/** End of Frame flag (FRAME_DELAY is applied after sending the current part) */
#define SPI_TXDATCTL_RXIGNORE       (1 << 22)				/** Receive Ignore Flag */
#define SPI_TXDATCTL_FLEN(n)        (((n) & 0x0F) << 24)	/** Frame length - 1 */

/**
 * Macro defines for SPI Transmitter Data Register
 */
#define SPI_TXDAT_DATA(n)			((n) & 0xFFFF)			/** SPI Transmit Data */


/**
 * Macro defines for SPI Transmitter Control register
 */
#define SPI_TXCTL_BITMASK			(0xF7F0000)				/** SPI TXDATCTL Register BitMask */
#define SPI_TXCTL_ASSERT_SSEL		(0 << 16)				/** Assert SSEL0 pin */
#define SPI_TXCTL_DEASSERT_SSEL		(1 << 16)				/** Deassert SSEL0 pin */
#define SPI_TXCTL_DEASSERTNUM_SSEL(n)	(1 << ((n) + 16))	/** Deassert SSELN pin */
#define SPI_TXDATCTL_DEASSERT_ALL	(0xF << 16)				/** Deassert all SSEL pins */
#define SPI_TXCTL_EOT				(1 << 20)				/** End of Transfer flag (TRANSFER_DELAY is applied after sending the current frame) */
#define SPI_TXCTL_EOF				(1 << 21)				/** End of Frame flag (FRAME_DELAY is applied after sending the current part) */
#define SPI_TXCTL_RXIGNORE			(1 << 22)				/** Receive Ignore Flag */
#define SPI_TXCTL_FLEN(n)			((((n) - 1) & 0x0F) << 24)	/** Frame length, 0 - 16 */
#define SPI_TXCTL_FLENMASK			(0xF << 24)				/** Frame length mask */


/**
 * Macro defines for SPI Divider register
 */
#define SPI_DIV_VAL(n)          ((n) & 0xFFFF)				/** Rate divider value mask (In Master Mode only)*/

/**
 * Macro defines for SPI Interrupt Status register
 */
#define SPI_INTSTAT_BITMASK			(0x3F)					/** SPI INTSTAT Register Bitmask */
#define SPI_INTSTAT_RXRDY			(1 << 0)				/** Receiver Ready Flag */
#define SPI_INTSTAT_TXRDY			(1 << 1)				/** Transmitter Ready Flag */
#define SPI_INTSTAT_RXOV			(1 << 2)				/** Receiver Overrun interrupt flag */
#define SPI_INTSTAT_TXUR			(1 << 3)				/** Transmitter Underrun interrupt flag (In Slave Mode only) */
#define SPI_INTSTAT_SSA				(1 << 4)				/** Slave Select Assert */
#define SPI_INTSTAT_SSD				(1 << 5)				/** Slave Select Deassert */



/**
 * @brief I2C register block structure
 */
typedef struct {					/* I2C0 Structure         */
	__IO uint32_t CFG;				/*!< I2C Configuration Register common for Master, Slave and Monitor */
	__IO uint32_t STAT;				/*!< I2C Status Register common for Master, Slave and Monitor */
	__IO uint32_t INTENSET;			/*!< I2C Interrupt Enable Set Register common for Master, Slave and Monitor */
	__O  uint32_t INTENCLR;			/*!< I2C Interrupt Enable Clear Register common for Master, Slave and Monitor */
	__IO uint32_t TIMEOUT;			/*!< I2C Timeout value Register */
	__IO uint32_t CLKDIV;			/*!< I2C Clock Divider Register */
	__I  uint32_t INTSTAT;			/*!< I2C Interrupt Status Register */
	__I  uint32_t RESERVED0;
	__IO uint32_t MSTCTL;			/*!< I2C Master Control Register */
	__IO uint32_t MSTTIME;			/*!< I2C Master Time Register for SCL */
	__IO uint32_t MSTDAT;			/*!< I2C Master Data Register */
	__I  uint32_t RESERVED1[5];
	__IO uint32_t SLVCTL;			/*!< I2C Slave Control Register */
	__IO uint32_t SLVDAT;			/*!< I2C Slave Data Register */
	__IO uint32_t SLVADR[4];		/*!< I2C Slave Address Registers */
	__IO uint32_t SLVQUAL0;			/*!< I2C Slave Address Qualifier 0 Register */
	__I  uint32_t RESERVED2[9];
	__I  uint32_t MONRXDAT;			/*!< I2C Monitor Data Register */
} LPC_I2C_T;

/*
 * @brief I2C Configuration register Bit definition
 */
#define I2C_CFG_MSTEN             (1 << 0)	/*!< Master Enable/Disable Bit */
#define I2C_CFG_SLVEN             (1 << 1)	/*!< Slave Enable/Disable Bit */
#define I2C_CFG_MONEN             (1 << 2)	/*!< Monitor Enable/Disable Bit */
#define I2C_CFG_TIMEOUTEN         (1 << 3)	/*!< Timeout Enable/Disable Bit */
#define I2C_CFG_MONCLKSTR         (1 << 4)	/*!< Monitor Clock Stretching Bit */
#define I2C_CFG_MASK              ((uint32_t) 0x1F)	/*!< Configuration Register Mask */

/*
 * @brief I2C Status register Bit definition
 */
#define I2C_STAT_MSTPENDING       (1 << 0)		/*!< Master Pending Status Bit */
#define I2C_STAT_MSTSTATE         (0x7 << 1)	/*!< Master State Code */
#define I2C_STAT_MSTRARBLOSS      (1 << 4)		/*!< Master Arbitration Loss Bit */
#define I2C_STAT_MSTSTSTPERR      (1 << 6)		/*!< Master Start Stop Error Bit */
#define I2C_STAT_SLVPENDING       (1 << 8)		/*!< Slave Pending Status Bit */
#define I2C_STAT_SLVSTATE         (0x3 << 9)	/*!< Slave State Code */
#define I2C_STAT_SLVNOTSTR        (1 << 11)		/*!< Slave not stretching Clock Bit */
#define I2C_STAT_SLVIDX           (0x3 << 12)	/*!< Slave Address Index */
#define I2C_STAT_SLVSEL           (1 << 14)		/*!< Slave Selected Bit */
#define I2C_STAT_SLVDESEL         (1 << 15)		/*!< Slave Deselect Bit */
#define I2C_STAT_MONRDY           (1 << 16)		/*!< Monitor Ready Bit */
#define I2C_STAT_MONOV            (1 << 17)		/*!< Monitor Overflow Flag */
#define I2C_STAT_MONACTIVE        (1 << 18)		/*!< Monitor Active Flag */
#define I2C_STAT_MONIDLE          (1 << 19)		/*!< Monitor Idle Flag */
#define I2C_STAT_EVENTTIMEOUT     (1 << 24)		/*!< Event Timeout Interrupt Flag */
#define I2C_STAT_SCLTIMEOUT       (1 << 25)		/*!< SCL Timeout Interrupt Flag */

#define I2C_STAT_MSTCODE_IDLE       (0)			/*!< Master Idle State Code */
#define I2C_STAT_MSTCODE_RXREADY    (1)			/*!< Master Receive Ready State Code */
#define I2C_STAT_MSTCODE_TXREADY    (2)			/*!< Master Transmit Ready State Code */
#define I2C_STAT_MSTCODE_NACKADR    (3)			/*!< Master NACK by slave on address State Code */
#define I2C_STAT_MSTCODE_NACKDAT    (4)			/*!< Master NACK by slave on data State Code */

#define I2C_STAT_SLVCODE_ADDR         (0)		/*!< Master Idle State Code */
#define I2C_STAT_SLVCODE_RX           (1)		/*!< Received data is available Code */
#define I2C_STAT_SLVCODE_TX           (2)		/*!< Data can be transmitted Code */

/*
 * @brief I2C Interrupt Enable Set register Bit definition
 */
#define I2C_INTENSET_MSTPENDING       (1 << 0)		/*!< Master Pending Interrupt Enable Bit */
#define I2C_INTENSET_MSTRARBLOSS      (1 << 4)		/*!< Master Arbitration Loss Interrupt Enable Bit */
#define I2C_INTENSET_MSTSTSTPERR      (1 << 6)		/*!< Master Start Stop Error Interrupt Enable Bit */
#define I2C_INTENSET_SLVPENDING       (1 << 8)		/*!< Slave Pending Interrupt Enable Bit */
#define I2C_INTENSET_SLVNOTSTR        (1 << 11)		/*!< Slave not stretching Clock Interrupt Enable Bit */
#define I2C_INTENSET_SLVDESEL         (1 << 15)		/*!< Slave Deselect Interrupt Enable Bit */
#define I2C_INTENSET_MONRDY           (1 << 16)		/*!< Monitor Ready Interrupt Enable Bit */
#define I2C_INTENSET_MONOV            (1 << 17)		/*!< Monitor Overflow Interrupt Enable Bit */
#define I2C_INTENSET_MONIDLE          (1 << 19)		/*!< Monitor Idle Interrupt Enable Bit */
#define I2C_INTENSET_EVENTTIMEOUT     (1 << 24)		/*!< Event Timeout Interrupt Enable Bit */
#define I2C_INTENSET_SCLTIMEOUT       (1 << 25)		/*!< SCL Timeout Interrupt Enable Bit */

/*
 * @brief I2C Interrupt Enable Clear register Bit definition
 */
#define I2C_INTENCLR_MSTPENDING       (1 << 0)		/*!< Master Pending Interrupt Clear Bit */
#define I2C_INTENCLR_MSTRARBLOSS      (1 << 4)		/*!< Master Arbitration Loss Interrupt Clear Bit */
#define I2C_INTENCLR_MSTSTSTPERR      (1 << 6)		/*!< Master Start Stop Error Interrupt Clear Bit */
#define I2C_INTENCLR_SLVPENDING       (1 << 8)		/*!< Slave Pending Interrupt Clear Bit */
#define I2C_INTENCLR_SLVNOTSTR        (1 << 11)		/*!< Slave not stretching Clock Interrupt Clear Bit */
#define I2C_INTENCLR_SLVDESEL         (1 << 15)		/*!< Slave Deselect Interrupt Clear Bit */
#define I2C_INTENCLR_MONRDY           (1 << 16)		/*!< Monitor Ready Interrupt Clear Bit */
#define I2C_INTENCLR_MONOV            (1 << 17)		/*!< Monitor Overflow Interrupt Clear Bit */
#define I2C_INTENCLR_MONIDLE          (1 << 19)		/*!< Monitor Idle Interrupt Clear Bit */
#define I2C_INTENCLR_EVENTTIMEOUT     (1 << 24)		/*!< Event Timeout Interrupt Clear Bit */
#define I2C_INTENCLR_SCLTIMEOUT       (1 << 25)		/*!< SCL Timeout Interrupt Clear Bit */

/*
 * @brief I2C TimeOut Value Macro
 */
#define I2C_TIMEOUT_VAL(n)              (((uint32_t) ((n) - 1) & 0xFFF0) | 0x000F)		/*!< Macro for Timeout value register */

/*
 * @brief I2C Interrupt Status register Bit definition
 */
#define I2C_INTSTAT_MSTPENDING      (1 << 0)		/*!< Master Pending Interrupt Status Bit */
#define I2C_INTSTAT_MSTRARBLOSS     (1 << 4)		/*!< Master Arbitration Loss Interrupt Status Bit */
#define I2C_INTSTAT_MSTSTSTPERR     (1 << 6)		/*!< Master Start Stop Error Interrupt Status Bit */
#define I2C_INTSTAT_SLVPENDING      (1 << 8)		/*!< Slave Pending Interrupt Status Bit */
#define I2C_INTSTAT_SLVNOTSTR       (1 << 11)		/*!< Slave not stretching Clock Interrupt Status Bit */
#define I2C_INTSTAT_SLVDESEL        (1 << 15)		/*!< Slave Deselect Interrupt Status Bit */
#define I2C_INTSTAT_MONRDY          (1 << 16)		/*!< Monitor Ready Interrupt Status Bit */
#define I2C_INTSTAT_MONOV           (1 << 17)		/*!< Monitor Overflow Interrupt Status Bit */
#define I2C_INTSTAT_MONIDLE         (1 << 19)		/*!< Monitor Idle Interrupt Status Bit */
#define I2C_INTSTAT_EVENTTIMEOUT    (1 << 24)		/*!< Event Timeout Interrupt Status Bit */
#define I2C_INTSTAT_SCLTIMEOUT      (1 << 25)		/*!< SCL Timeout Interrupt Status Bit */

/*
 * @brief I2C Master Control register Bit definition
 */
#define I2C_MSTCTL_MSTCONTINUE  (1 << 0)		/*!< Master Continue Bit */
#define I2C_MSTCTL_MSTSTART     (1 << 1)		/*!< Master Start Control Bit */
#define I2C_MSTCTL_MSTSTOP      (1 << 2)		/*!< Master Stop Control Bit */
#define I2C_MSTCTL_MSTDMA       (1 << 3)		/*!< Master DMA Enable Bit */

/*
 * @brief I2C Master Time Register Field definition
 */
#define I2C_MSTTIME_MSTSCLLOW   (0x07 << 0)		/*!< Master SCL Low Time field */
#define I2C_MSTTIME_MSTSCLHIGH  (0x07 << 4)		/*!< Master SCL High Time field */

/*
 * @brief I2C Master Data Mask
 */
#define I2C_MSTDAT_DATAMASK         ((uint32_t) 0x00FF << 0)	/*!< Master data mask */

/*
 * @brief I2C Slave Control register Bit definition
 */
#define I2C_SLVCTL_SLVCONTINUE    (1 << 0)		/*!< Slave Continue Bit */
#define I2C_SLVCTL_SLVNACK        (1 << 1)		/*!< Slave NACK Bit */
#define I2C_SLVCTL_SLVDMA         (1 << 3)		/*!< Slave DMA Enable Bit */

/*
 * @brief I2C Slave Data Mask
 */
#define I2C_SLVDAT_DATAMASK         ((uint32_t) 0x00FF << 0)	/*!< Slave data mask */

/*
 * @brief I2C Slave Address register Bit definition
 */
#define I2C_SLVADR_SADISABLE      (1 << 0)		/*!< Slave Address n Disable Bit */
#define I2C_SLVADR_SLVADR         (0x7F << 1)	/*!< Slave Address field */
#define I2C_SLVADR_MASK           ((uint32_t) 0x00FF)	/*!< Slave Address Mask */

/*
 * @brief I2C Slave Address Qualifier 0 Register Bit definition
 */
#define I2C_SLVQUAL_QUALMODE0     (1 << 0)		/*!< Slave Qualifier Mode Enable Bit */
#define I2C_SLVQUAL_SLVQUAL0      (0x7F << 1)	/*!< Slave Qualifier Address for Address 0 */

/*
 * @brief I2C Monitor Data Register Bit definition
 */
#define I2C_MONRXDAT_DATA         (0xFF << 0)		/*!< Monitor Function Receive Data Field */
#define I2C_MONRXDAT_MONSTART     (1 << 8)			/*!< Monitor Received Start Bit */
#define I2C_MONRXDAT_MONRESTART   (1 << 9)			/*!< Monitor Received Repeated Start Bit */
#define I2C_MONRXDAT_MONNACK      (1 << 10)			/*!< Monitor Received Nack Bit */



/**
 * @brief LPC540XX Pin Interrupt and Pattern Match register block structure
 */
typedef struct {			/*!< RTC */
	__IO uint32_t CTRL;		/*!< RTC control register */
	__IO uint32_t MATCH;	/*!< PRTC match (alarm) register */
	__IO uint32_t COUNT;	/*!< RTC counter register */
	__IO uint32_t WAKE;		/*!< RTC high-resolution/wake-up timer control register */
} LPC_RTC_T;

/* CTRL register defniitions */
#define RTC_CTRL_SWRESET        (1 << 0)	/*!< Apply reset to RTC */
#define RTC_CTRL_OFD            (1 << 1)	/*!< Oscillator fail detect status (failed bit) */
#define RTC_CTRL_ALARM1HZ       (1 << 2)	/*!< RTC 1 Hz timer alarm flag status (match) bit */
#define RTC_CTRL_WAKE1KHZ       (1 << 3)	/*!< RTC 1 kHz timer wake-up flag status (timeout) bit */
#define RTC_CTRL_ALARMDPD_EN    (1 << 4)	/*!< RTC 1 Hz timer alarm for Deep power-down enable bit */
#define RTC_CTRL_WAKEDPD_EN     (1 << 5)	/*!< RTC 1 kHz timer wake-up for Deep power-down enable bit */
#define RTC_CTRL_RTC1KHZ_EN     (1 << 6)	/*!< RTC 1 kHz clock enable bit */
#define RTC_CTRL_RTC_EN         (1 << 7)	/*!< RTC enable bit */
#define RTC_CTRL_MASK           ((uint32_t) 0xF1)	/*!< RTC Control register Mask for reserved and status bits */



/**
 * @brief 32-bit Standard timer register block structure
 */
typedef struct {					/*!< TIMERn Structure       */
	__IO uint32_t IR;				/*!< Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending. */
	__IO uint32_t TCR;				/*!< Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR. */
	__IO uint32_t TC;				/*!< Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR. */
	__IO uint32_t PR;				/*!< Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC. */
	__IO uint32_t PC;				/*!< Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface. */
	__IO uint32_t MCR;				/*!< Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs. */
	__IO uint32_t MR[4];			/*!< Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
	__IO uint32_t CCR;				/*!< Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place. */
	__IO uint32_t CR[4];			/*!< Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
	__IO uint32_t EMR;				/*!< External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively). */
	__I  uint32_t RESERVED0[12];
	__IO uint32_t CTCR;				/*!< Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting. */
	__IO uint32_t PWMC;
} LPC_TIMER_T;

/** Macro to clear interrupt pending */
#define TIMER_IR_CLR(n)         _BIT(n)

/** Macro for getting a timer match interrupt bit */
#define TIMER_MATCH_INT(n)      (_BIT((n) & 0x0F))
/** Macro for getting a capture event interrupt bit */
#define TIMER_CAP_INT(n)        (_BIT((((n) & 0x0F) + 4)))

/** Timer/counter enable bit */
#define TIMER_ENABLE            ((uint32_t) (1 << 0))
/** Timer/counter reset bit */
#define TIMER_RESET             ((uint32_t) (1 << 1))
/** Timer Control register Mask */
#define TIMER_CTRL_MASK         ((uint32_t) 0x03)

/** Bit location for interrupt on MRx match, n = 0 to 3 */
#define TIMER_INT_ON_MATCH(n)   (_BIT(((n) * 3)))
/** Bit location for reset on MRx match, n = 0 to 3 */
#define TIMER_RESET_ON_MATCH(n) (_BIT((((n) * 3) + 1)))
/** Bit location for stop on MRx match, n = 0 to 3 */
#define TIMER_STOP_ON_MATCH(n)  (_BIT((((n) * 3) + 2)))
/** Match Control register Mask */
#define TIMER_MCR_MASK          ((uint32_t) 0x0FFF)

/** Bit location for CAP.n on CRx rising edge, n = 0 to 3 */
#define TIMER_CAP_RISING(n)     (_BIT(((n) * 3)))
/** Bit location for CAP.n on CRx falling edge, n = 0 to 3 */
#define TIMER_CAP_FALLING(n)    (_BIT((((n) * 3) + 1)))
/** Bit location for CAP.n on CRx interrupt enable, n = 0 to 3 */
#define TIMER_INT_ON_CAP(n)     (_BIT((((n) * 3) + 2)))
/** Capture Control register Mask */
#define TIMER_CCR_MASK          ((uint32_t) 0x0FFF)
/** External Match register Mask */
#define TIMER_EMR_MASK          ((uint32_t) 0x0FFF)
/** Counter Control register Mask */
#define TIMER_CTCR_MASK          ((uint32_t) 0x0F)



/// The OS_TIMER register file definition.
typedef struct {
  __IO uint32_t CMPVAL;      // @ offset (0x00)
  __IO uint32_t MASK;        // @ offset (0x04)
  __IO uint32_t CTRL;        // @ offset (0x08)
  __IO uint32_t CUNT;        // @ offset (0x0C)
  __IO uint32_t CMPVAL_H;    // @ offset (0x10)
  __IO uint32_t MASK_H;      // @ offset (0x14)
  __IO uint32_t RESERVED;    // @ offset (0x18), // Reserved
  __IO uint32_t CUNT_H;      // @ offset (0x1C)
} LPC_OSTIMER_T;

// bit definitions, _ostimer 
#define OSTIMER_INT_FLAG    (1U << 0)
#define OSTIMER_EN_CLR      (1U << 1)
#define OSTIMER_EN_4_DEBUG  (1U << 2)
#define OSTIMER_EN_TIMER    (1U << 3)

/** same as OS_TIMER but ...
 * @brief Repetitive Interrupt Timer register block structure
 */
typedef struct {				/*!< RITIMER Structure */
	__IO uint32_t  COMPVAL;		/*!< Compare register */
	__IO uint32_t  MASK;		/*!< Mask register */
	__IO uint32_t  CTRL;		/*!< Control register */
	__IO uint32_t  COUNTER;		/*!< 32-bit counter */
	__IO uint32_t  COMPVAL_H;	/*!< Compare register, upper 16-bits */
	__IO uint32_t  MASK_H;		/*!< Compare register, upper 16-bits */
	__I  uint32_t  reserved;
	__IO uint32_t  COUNTER_H;	/*!< Counter register, upper 16-bits */
} LPC_RITIMER_T;



/**
 * @brief LPC540XX Micro Tick register block structure
 */
typedef struct {
	__IO uint32_t CTRL;				/*!< UTick Control register. This register contains the delay value and configuration of one shot or repetitive timer */
	__IO uint32_t STATUS;			/*!< UTick Status register. This register contains interrupt status and timer active status bits */
} LPC_UTICK_T;

/**
 * @brief UTick register definitions
 */
/** UTick repeat delay bit */
#define UTICK_CTRL_REPEAT           ((uint32_t) 1 << 31)
/** UTick Delay Value Mask */
#define UTICK_CTRL_DELAY_MASK       ((uint32_t) 0x7FFFFFFF)
/** UTick Interrupt Status bit */
#define UTICK_STATUS_INTR           ((uint32_t) 1 << 0)
/** UTick Active Status bit */
#define UTICK_STATUS_ACTIVE         ((uint32_t) 1 << 1)
/** UTick Status Register Mask */
#define UTICK_STATUS_MASK           ((uint32_t) 0x03)



/**
 * @brief DMA Controller shared registers structure
 */
typedef struct {					/*!< DMA shared registers structure */
	__IO uint32_t  ENABLESET;		/*!< DMA Channel Enable read and Set for all DMA channels */
	__I  uint32_t  RESERVED0;
	__O  uint32_t  ENABLECLR;		/*!< DMA Channel Enable Clear for all DMA channels */
	__I  uint32_t  RESERVED1;
	__I  uint32_t  ACTIVE;			/*!< DMA Channel Active status for all DMA channels */
	__I  uint32_t  RESERVED2;
	__I  uint32_t  BUSY;			/*!< DMA Channel Busy status for all DMA channels */
	__I  uint32_t  RESERVED3;
	__IO uint32_t  ERRINT;			/*!< DMA Error Interrupt status for all DMA channels */
	__I  uint32_t  RESERVED4;
	__IO uint32_t  INTENSET;		/*!< DMA Interrupt Enable read and Set for all DMA channels */
	__I  uint32_t  RESERVED5;
	__O  uint32_t  INTENCLR;		/*!< DMA Interrupt Enable Clear for all DMA channels */
	__I  uint32_t  RESERVED6;
	__IO uint32_t  INTA;			/*!< DMA Interrupt A status for all DMA channels */
	__I  uint32_t  RESERVED7;
	__IO uint32_t  INTB;			/*!< DMA Interrupt B status for all DMA channels */
	__I  uint32_t  RESERVED8;
	__O  uint32_t  SETVALID;		/*!< DMA Set ValidPending control bits for all DMA channels */
	__I  uint32_t  RESERVED9;
	__O  uint32_t  SETTRIG;			/*!< DMA Set Trigger control bits for all DMA channels */
	__I  uint32_t  RESERVED10;
	__O  uint32_t  ABORT;			/*!< DMA Channel Abort control for all DMA channels */
} LPC_DMA_COMMON_T;

/**
 * @brief DMA Controller shared registers structure
 */
typedef struct {					/*!< DMA channel register structure */
	__IO uint32_t  CFG;				/*!< DMA Configuration register */
	__I  uint32_t  CTLSTAT;			/*!< DMA Control and status register */
	__IO uint32_t  XFERCFG;			/*!< DMA Transfer configuration register */
	__I  uint32_t  RESERVED;
} LPC_DMA_CHANNEL_T;

/* DMA channel mapping - each channel is mapped to an individual peripheral
   and direction or a DMA imput mux trigger */
typedef enum {
	DMAREQ_UART0_RX = 0,				/*!< UART00 receive DMA channel */
	DMA_CH0 = DMAREQ_UART0_RX,
	DMAREQ_UART0_TX,					/*!< UART0 transmit DMA channel */
	DMA_CH1 = DMAREQ_UART0_TX,
	DMAREQ_UART1_RX,					/*!< UART1 receive DMA channel */
	DMA_CH2 = DMAREQ_UART1_RX,
	DMAREQ_UART1_TX,					/*!< UART1 transmit DMA channel */
	DMA_CH3 = DMAREQ_UART1_TX,
	DMAREQ_UART2_RX,					/*!< UART2 receive DMA channel */
	DMA_CH4 = DMAREQ_UART2_RX,
	DMAREQ_UART2_TX,					/*!< UART2 transmit DMA channel */
	DMA_CH5 = DMAREQ_UART2_TX,
	DMAREQ_UART3_RX,					/*!< UART3 receive DMA channel */
	DMA_CH6 = DMAREQ_UART3_RX,
	DMAREQ_UART3_TX,					/*!< UART3 transmit DMA channel */
	DMA_CH7 = DMAREQ_UART3_TX,
	DMAREQ_SPI0_RX,					/*!< SPI0 receive DMA channel */
	DMA_CH8 = DMAREQ_SPI0_RX,
	DMAREQ_SPI0_TX,					/*!< SPI0 transmit DMA channel */
	DMA_CH9 = DMAREQ_SPI0_TX,
	DMAREQ_SPI1_RX,					/*!< SPI1 receive DMA channel */
	DMA_CH10 = DMAREQ_SPI1_RX,
	DMAREQ_SPI1_TX,					/*!< SPI1 transmit DMA channel */
	DMA_CH11 = DMAREQ_SPI1_TX,
	DMAREQ_I2C0_SLAVE,					/*!< I2C0 Slave DMA channel */
	DMA_CH12 = DMAREQ_I2C0_SLAVE,
	DMAREQ_I2C0_MASTER,					/*!< I2C0 Master DMA channel */
	DMA_CH13 = DMAREQ_I2C0_MASTER,
	DMAREQ_I2C1_SLAVE,					/*!< I2C1 Slave DMA channel */
	DMA_CH14 = DMAREQ_I2C1_SLAVE,
	DMAREQ_I2C1_MASTER,					/*!< I2C1 Master DMA channel */
	DMA_CH15 = DMAREQ_I2C1_MASTER,
	DMAREQ_I2C2_SLAVE,					/*!< I2C2 Slave DMA channel */
	DMA_CH16 = DMAREQ_I2C2_SLAVE,
	DMAREQ_I2C2_MASTER,					/*!< I2C2 Master DMA channel */
	DMA_CH17 = DMAREQ_I2C2_MASTER,
	DMAREQ_I2C0_MONITOR,					/*!< I2C0 Monitor DMA channel */
	DMA_CH18 = DMAREQ_I2C0_MONITOR,
	DMAREQ_I2C1_MONITOR,					/*!< I2C1 Monitor DMA channel */
	DMA_CH19 = DMAREQ_I2C1_MONITOR,
	DMAREQ_I2C2_MONITOR,					/*!< I2C2 Monitor DMA channel */
	DMA_CH20 = DMAREQ_I2C2_MONITOR,
	RESERVED_SPARE_DMA,
	DMA_CH21 = RESERVED_SPARE_DMA
} DMA_CHID_T;

/* On LPC540XX, Max DMA channel is 22 */
#define MAX_DMA_CHANNEL			(DMA_CH21+1)

/**
 * @brief DMA Controller register block structure
 */
typedef struct {					/*!< DMA Structure */
	__IO uint32_t  CTRL;			/*!< DMA control register */
	__I  uint32_t  INTSTAT;			/*!< DMA Interrupt status register */
	__IO uint32_t  SRAMBASE;		/*!< DMA SRAM address of the channel configuration table */
	__I  uint32_t  RESERVED2[5];
	LPC_DMA_COMMON_T DMACOMMON[1];	/*!< DMA shared channel (common) registers */
	__I  uint32_t  RESERVED0[225];
	LPC_DMA_CHANNEL_T DMACH[MAX_DMA_CHANNEL];	/*!< DMA channel registers */
} LPC_DMA_T;


    /**
     * @brief LPC540XX VFIFO register block structure
     */
    typedef struct {
        __IO uint32_t CFGU; // 0x0                     
        __IO uint32_t STATU; // 0x4
        __IO uint32_t INTSTATU; // 0x8
        __IO uint32_t CTLSETU; // 0xC
        __IO uint32_t CTLCLRU; // 0x10                       
        __IO uint32_t RXDATU; // 0x14
        __IO uint32_t RXDATSTATU; // 0x18
        __IO uint32_t TXDATU; // 0x1C
        uint32_t RESERVED0[(0x100 - 0x20) / 4]; // 0x20-0xFF  
    } VFIFO_UART_T;

    typedef struct {
        __IO uint32_t CFGSPI; // 0x0                     
        __IO uint32_t STATSPI; // 0x4
        __IO uint32_t INTSTATSPI; // 0x8
        __IO uint32_t CTLSETSPI; // 0xC
        __IO uint32_t CTLCLRSPI; // 0x10                       
        __I  uint32_t RXDATSPI; // 0x14
        union {
          struct {
            __O uint16_t TXDATSPI_DATA;
            __O uint16_t TXDATSPI_CTRL;
          };
          __O uint32_t TXDATSPI; // 0x18
        };
        uint32_t RESERVED0[(0x100 - 0x1C) / 4]; // 0x1C-0xFF  
    } VFIFO_SPI_T;

    typedef struct {
        uint32_t RESERVED0[0x100 / 4]; //(@0x0-0xFF) 
        __IO uint32_t FIFOCTLUART; //(@0x100) 
        __IO uint32_t FIFORSTUART; //(@0x104)
        uint32_t RESERVED1[2]; //(@0x108-0x10F)
        __IO uint32_t FIFOCFGU[(0x200 - 0x110) / 4]; //(@0x110-0x1FF)
        __IO uint32_t FIFOCTLSPI; //(@0x200) 
        __IO uint32_t FIFORSTSPI; //(@0x204)
        uint32_t RESERVED2[2]; //(@0x208-0x20C)
        __IO uint32_t FIFOCFGSPI[(0x300 - 0x210) / 4]; //(@0x210-0x2FF)  
        uint32_t RESERVED3[(0xFFC - 0x300) / 4]; //(@0x300-0xFFB)  
        __IO uint32_t ID; //(@0xFFC)
        VFIFO_UART_T UART[16]; //(@0x1000-0x1FFF)
        VFIFO_SPI_T SPI[16]; //(@0x2000-0x2FFF)
    } LPC_VFIFO_T;

    typedef struct { // block of RAM allocated by the application program
        uint32_t uart_num;
        uint32_t tx_rx_flag; // 0 is TX only, 1, is RX only, 0x2 is TX and RX	
        uint32_t rx_threshold;
        uint32_t tx_threshold;
        uint32_t timeout_base;
        uint32_t timeout_value;
        uint32_t timeout_cont_on_write;
        uint32_t timeout_cont_on_empty;
        uint32_t uart_tx_used_fifo_size;
        uint32_t uart_rx_used_fifo_size;
        uint16_t uart_tx_fifo_size;
        uint32_t uart_rx_fifo_size;
    } VFIFO_UART_DRIVER_T; //HEADER_TypeDef	 *********************************

    typedef struct { // block of RAM allocated by the application program
        uint32_t spi_num;
        uint32_t tx_rx_flag; // 0 is TX only, 1, is RX only, 0x2 is TX and RX	
        uint32_t rx_threshold;
        uint32_t tx_threshold;
        uint32_t timeout_base;
        uint32_t timeout_value;
        uint32_t timeout_cont_on_write;
        uint32_t timeout_cont_on_empty;
        uint32_t spi_tx_used_fifo_size;
        uint32_t spi_rx_used_fifo_size;
        uint16_t spi_tx_fifo_size;
        uint32_t spi_rx_fifo_size;
    } VFIFO_SPI_DRIVER_T; //HEADER_TypeDef	 *********************************

    // bit definitions
    // FIFOCtl* register
#define VFIFO_RXPAUSE  (1UL << 0)
#define VFIFO_RXPAUSED (1UL << 1)
#define VFIFO_RXEMPTY  (1UL << 2)
#define VFIFO_TXPAUSE  (1UL << 8)
#define VFIFO_TXPAUSED (1UL << 9)
#define VFIFO_RXFIFO_TOTAL(FIFOCtlUart_val)  (((FIFOCtlUart_val) >> 16) & 0xFF)
#define VFIFO_TXFIFO_TOTAL(FIFOCtlUart_val)  (((FIFOCtlUart_val) >> 24) & 0xFF)

    // FIFORst* register
#define VFIFO_RXRST(ch) (1UL << (ch))
#define VFIFO_TXRST(ch) (1UL << ((ch) + 16))

    // FIFOCfg* register
#define VFIFO_RXSIZE(d) ((d) << 0)
#define VFIFO_TXSIZE(d) ((d) << 8)

    // Cfg register
#define VFIFO_TIMEOUT_CONTINUE_ON_WRITE (1 << 4)
#define VFIFO_TIMEOUT_CONTINUE_ON_EMPTY (1 << 5) 
#define VFIFO_TIMEOUT_BASE(d)     ((d) << 8)
#define VFIFO_TIMEOUT_VALUE(d)    ((d) << 12)
#define VFIFO_RXTHRESHOLD(d)      ((d) << 16)
#define VFIFO_TXTHRESHOLD(d)      ((d) << 24)

    // Stat and IntStat register
#define VFIFO_ST_RXTHRESHOLD       (1 << 0)
#define VFIFO_ST_TXTHRESHOLD       (1 << 1)
#define VFIFO_ST_RXTIMEOUT         (1 << 4)
#define VFIFO_ST_BUSERROR          (1 << 7)
#define VFIFO_ST_RXEMPTY           (1 << 8)
#define VFIFO_ST_TXEMPTY           (1 << 9)
#define VFIFO_ST_RXCOUNT(Stat_val)     (((Stat_val) >> 16) & 0xFF)
#define VFIFO_ST_TXAVAILABLE(Stat_val) (((Stat_val) >> 24) & 0xFF) 
#define VFIFO_ST_RXCOUNTMASK           (0xFFUL << 16)
#define VFIFO_ST_TXAVAILABLEMASK       (0xFFUL << 24) 

    // CtlSet and CtlClr register
#define VFIFO_RX_THRESHOLD_INT_EN       (1 << 0)
#define VFIFO_TX_THRESHOLD_INT_EN       (1 << 1)
#define VFIFO_RX_TIMEOUT_INT_EN         (1 << 4)


/**
 * brown-out detection reset status
 */
#define POWER_BOD_RST     (1 << 6)
/**
 * brown-out detection interrupt status
 */
#define POWER_BOD_INT     (1 << 7)

typedef volatile struct {
  volatile uint32_t VDCTRL[4];     ///< (0x00) VD1, vd2, vd3, vd8 domain voltage Control 
  volatile uint32_t RESERVED0[4];  ///< (0x10) VD1, vd2, vd3, vd8 domain voltage Control 
  volatile uint32_t VDCLAMP[4];    ///< (0x20) VD1, vd2, vd3, vd8 domain voltage Control  
  volatile uint32_t RESERVED1[4];  ///< (0x30) VD1, vd2, vd3, vd8 domain voltage Control 
  volatile uint32_t LPCTRL;        ///< (0x40) LP VD control  
  volatile uint32_t BODCTRL;       ///< (0x44) bod Control   
  volatile uint32_t BODTRIM;       ///< (0x48) bod Trim  
  volatile uint32_t PWRSWACK;      ///< (0x4C) Power Switch Acknowledge  
  volatile uint32_t DPDWAKESRC;    ///< (0x50) Deep power down wakeup source flags  
} LPC_POWER_T;

typedef volatile struct{
  volatile uint32_t BBCTRL;     ///< (0x00)  Body Bias Control  
  volatile uint32_t FBBOFFSET;  ///< (0x04)  FBB offset adjust  
} LPC_BODYBIAS_T;

/**
 * Brown-out detector reset level
 */
typedef enum CHIP_POWER_BODRSTLVL {
	POWER_BODRSTLVL_0,	/*!< Brown-out reset at 1.46 ~ 1.63v */
	POWER_BODRSTLVL_1,	/*!< Brown-out reset at 2.06v ~ 2.15v */
	POWER_BODRSTLVL_2,	/*!< Brown-out reset at 2.35v ~ 2.43v */
	POWER_BODRSTLVL_3,	/*!< Brown-out reset at 2.63v ~ 2.71v */
} CHIP_POWER_BODRSTLVL_T;

/**
 * Brown-out detector interrupt level
 */
typedef enum CHIP_POWER_BODRINTVAL {
	POWER_BODINTVAL_LVL0,	/* Brown-out interrupt at 1.65 ~ 1.80v */
	POWER_BODINTVAL_LVL1,	/* Brown-out interrupt at 2.22v ~ 2.35v*/
	POWER_BODINTVAL_LVL2,	/* Brown-out interrupt at 2.52v ~ 2.66v */
	POWER_BODINTVAL_LVL3,	/* Brown-out interrupt at 2.80v ~ 2.90v */
} CHIP_POWER_BODRINTVAL_T;


/* Mailbox indexes */
typedef enum {
	MAILBOX_CM0PLUS = 0,
	MAILBOX_CM4
} MBOX_IDX_T;
#define MAILBOX_AVAIL       (MAILBOX_CM4 + 1)	/* Number of available mailboxes */

/** Individual mailbox IRQ structure */
typedef struct {
	__IO    uint32_t        IRQ;		/*!< Mailbox data */
	__O     uint32_t        IRQSET;		/*!< Mailbox data set bits only */
	__O     uint32_t        IRQCLR;		/*!< Mailbox dataclearset bits only */
	__I     uint32_t        RESERVED;
} LPC_MBOXIRQ_T;

/** Mailbox register structure */
typedef struct {						/*!< Mailbox register structure */
	LPC_MBOXIRQ_T           BOX[MAILBOX_AVAIL];	/*!< Mailbox, offset 0 = M0+, offset 1 = M4 */
	LPC_MBOXIRQ_T           RESERVED1[15 - MAILBOX_AVAIL];
	__I     uint32_t        RESERVED2[2];
	__IO    uint32_t        MUTEX;		/*!< Mutex */
} LPC_MBOX_T;


/**
 * @brief GPIO grouped interrupt register block structure
 */
typedef struct {					/*!< GPIO_GROUP_INTn Structure */
	__IO uint32_t  CTRL;			/*!< GPIO grouped interrupt control register */
	__I  uint32_t  RESERVED0[7];
	__IO uint32_t  PORT_POL[8];		/*!< GPIO grouped interrupt port polarity register */
	__IO uint32_t  PORT_ENA[8];		/*!< GPIO grouped interrupt port m enable register */
	uint32_t       RESERVED1[4072];
} LPC_GPIOGROUPINT_T;

/**
 * LPC540xx GPIO group bit definitions
 */
#define GPIOGR_INT       (1 << 0)	/*!< GPIO interrupt pending/clear bit */
#define GPIOGR_COMB      (1 << 1)	/*!< GPIO interrupt OR(0)/AND(1) mode bit */
#define GPIOGR_TRIG      (1 << 2)	/*!< GPIO interrupt edge(0)/level(1) mode bit */
#define GPIOGR_CTRL_MASK ((uint32_t) 0x06)
     
/**
 * @brief ADC register block structure
 */
typedef struct {	/*!< ADCn Structure */
	__IO uint32_t CTRL;
	__O uint32_t RESERVED0;
	__IO uint32_t SEQ_CTRL[2];
	__IO uint32_t SEQ_GDAT[2];
	__IO uint32_t RESERVED1[2];
	__IO uint32_t DAT[12];
	__IO uint32_t THR_LOW[2];
	__IO uint32_t THR_HIGH[2];
	__IO uint32_t CHAN_THRSEL;
	__IO uint32_t INTEN;
	__IO uint32_t FLAGS;
	__IO uint32_t STARTUP;
	__IO uint32_t CALIBR;
} LPC_ADC_T;

#endif /* __LPC412X_H_ */








