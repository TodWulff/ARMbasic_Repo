/*
 * @brief Basic CMSIS include file for LPC546xx M4 core
 *
 * @note
 * Copyright(C) NXP Semiconductors, 2014
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

#ifndef __CMSIS_5460X_H_
#define __CMSIS_5460X_H_

#ifdef __cplusplus
extern "C" {
#endif

/** @defgroup CMSIS_5460X_M4 CHIP: LPC5460X M4 core CMSIS include file
 * @ingroup CHIP_5460X_CMSIS_DRIVERS
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

/*
 * ==========================================================================
 * ---------- Interrupt Number Definition -----------------------------------
 * ==========================================================================
 */

#define CORE_M4

#include "lpc_types.h"
#include "core_cm4.h"				/*!< Cortex-M4 processor and core peripherals        */

/** @defgroup CMSIS_5460X_M4_IRQ CHIP_5460X: LPC5460X M4 core peripheral interrupt numbers
 * @{
 */

typedef enum {
	/******  Cortex-M4 Processor Exceptions Numbers ***************************************************/
	Reset_IRQn                    = -15,    /*!< 1  Reset Vector, invoked on Power up and warm reset */
	NonMaskableInt_IRQn           = -14,    /*!< 2  Non maskable Interrupt, cannot be stopped or preempted */
	HardFault_IRQn                = -13,    /*!< 3  Hard Fault, all classes of Fault */
	MemoryManagement_IRQn         = -12,    /*!< 4  Memory Management, MPU mismatch, including Access Violation and No Match */
	BusFault_IRQn                 = -11,    /*!< 5  Bus Fault, Pre-Fetch-, Memory Access Fault, other address/memory related Fault */
	UsageFault_IRQn               = -10,    /*!< 6  Usage Fault, i.e. Undef Instruction, Illegal State Transition */
	SVCall_IRQn                   =  -5,    /*!< 11  System Service Call via SVC instruction */
	DebugMonitor_IRQn             =  -4,    /*!< 12  Debug Monitor                    */
	PendSV_IRQn                   =  -2,    /*!< 14  Pendable request for system service */
	SysTick_IRQn                  =  -1,    /*!< 15  System Tick Timer                */

	/******  LPC5460X Specific Interrupt Numbers ********************************************************/
	WDTBOD_IRQn,        /*!< 0  WWDT                                             */
	DMA_IRQn,           /*!< 1  DMA                                              */
	GINT0_IRQn,         /*!< 2  GINT0                                            */
	GINT1_IRQn,         /*!< 3  GINT1                                            */
	PIN_INT0_IRQn,      /*!< 4  PININT0                                          */
	PIN_INT1_IRQn,      /*!< 5  PININT1                                          */
	PIN_INT2_IRQn,      /*!< 6  PININT2                                          */
	PIN_INT3_IRQn,      /*!< 7  PININT3                                          */
	UTICK_IRQn,         /*!< 8  Micro-tick Timer interrupt                       */
	MRT_IRQn,           /*!< 9  Multi-rate timer interrupt                       */
	CT32B0_IRQn,        /*!< 10 CTMR0                                            */
	CT32B1_IRQn,        /*!< 11 CTMR1                                            */
	SCT0_IRQn,          /*!< 12 SCT                                              */
	CT32B3_IRQn,        /*!< 13 CTMR3                                            */
	FLEXCOMM0_IRQn,     /*!< 14 FLEXCOMM0                                        */
	FLEXCOMM1_IRQn,     /*!< 15 FLEXCOMM1                                        */
	FLEXCOMM2_IRQn,     /*!< 16 FLEXCOMM2                                        */
	FLEXCOMM3_IRQn,     /*!< 17 FLEXCOMM3                                        */
	FLEXCOMM4_IRQn,     /*!< 18 FLEXCOMM4                                        */
	FLEXCOMM5_IRQn,     /*!< 19 FLEXCOMM5                                        */
	FLEXCOMM6_IRQn,     /*!< 20 FLEXCOMM6                                        */
	FLEXCOMM7_IRQn,     /*!< 21 FLEXCOMM7                                        */
	ADC_SEQA_IRQn,      /*!< 22 ADC0 sequence A completion                       */
	ADC_SEQB_IRQn,      /*!< 23 ADC0 sequence B completion                       */
	ADC_THCMP_IRQn,     /*!< 24 ADC0 threshold compare and error                 */
	DMIC_IRQn,          /*!< 25 Digital Mic                                      */
	HWVAD_IRQn,         /*!< 26 Hardware Voice acitivity detect                  */
	USB0ACT_IRQn,       /*!< 27 USB Activity                                     */
	USB0_IRQn,          /*!< 28 USB                                              */
	RTC_IRQn,           /*!< 29 RTC alarm and wake-up interrupts                 */
	Reserved_IRQn,      /*!< 30 Reserved Interrupt                               */
	WAKEUP_IRQn,        /*!< 31 FIXME: what is wakeup (is this reserved?)        */
	PIN_INT4_IRQn,      /*!< 32 External Interrupt 4                             */
	PIN_INT5_IRQn,      /*!< 33 External Interrupt 5                             */
	PIN_INT6_IRQn,      /*!< 34 External Interrupt 6                             */
	PIN_INT7_IRQn,      /*!< 35 External Interrupt 7                             */
	CT32B2_IRQn,        /*!< 36 CTMR2                                            */
	CT32B4_IRQn,        /*!< 37 CTMR4                                            */
	RITIMER_IRQn,       /*!< 38 OSTIMER Interrupt                                */
	SPIFI_IRQn,         /*!< 39 SPI Flash interface                              */
	FLEXCOMM8_IRQn,     /*!< 40 Flexcomm8 interrupt                              */
	FLEXCOMM9_IRQn,     /*!< 41 Flexcomm9 interrupt                              */
	SDIO_IRQn,          /*!< 42 SDIO Interrupt                                   */
	CAN0_0_IRQn,        /*!< 43 CAN0 Interrupt0                                  */
	CAN0_1_IRQn,        /*!< 44 CAN0 Interrupt1                                  */
	Reserved1_IRQn,     /*!< 45 FIXME: Is this really CAN1_0_IRQn (?)            */
	Reserved2_IRQn,     /*!< 46 FIXME: Is this really CAN1_1_IRQn (?)            */
	USB1_IRQn,          /*!< 47 USB1 Interrupt                                   */
	USB1ACT_IRQn,       /*!< 48 USB1 Activity interrupt                          */
	ETH_IRQn,           /*!< 49 Ethernet Interrupt handler                       */
	ETH_PMT_IRQn,       /*!< 50 FIXME: What is this (?)                          */
	ETH_MACLP_IRQn,     /*!< 51 FIXME: Check what this is!                       */
	EEPROM_IRQn,        /*!< 52 EEPROM Interrupt                                 */
	LCD_IRQn,           /*!< 53 LCD Controller Interrupt                         */
	SHA_IRQn,           /*!< 54 Hash engine interrupt                            */
	SMARTCARD0_IRQn,    /*!< 55 Smart card-0 interrupt                           */
	SMARTCARD1_IRQn,    /*!< 56 Smart card-1 interrupt                           */
} IRQn_Type;

/**
 * @}
 */

/*
 * ==========================================================================
 * ----------- Processor and Core Peripheral Section ------------------------
 * ==========================================================================
 */

/** @defgroup CMSIS_5460X_M4_COMMON CHIP: LPC5460X M4 core Cortex CMSIS definitions
 * @{
 */

/* Configuration of the Cortex-M4 Processor and Core Peripherals */
#define __CM4_REV                 0x0001	/*!< Cortex-M4 Core Revision                          */
#define __MPU_PRESENT             1			/*!< MPU present or not                               */
#define __NVIC_PRIO_BITS          3			/*!< Number of Bits used for Priority Levels          */
#define __Vendor_SysTickConfig    0			/*!< Set to 1 if different SysTick Config is used     */
#define __FPU_PRESENT             1

/** @brief interrupt Alias */
#define TIMER0_IRQn CT32B0_IRQn
#define TIMER1_IRQn CT32B1_IRQn
#define TIMER2_IRQn CT32B2_IRQn
#define TIMER3_IRQn CT32B3_IRQn
#define TIMER4_IRQn CT32B4_IRQn
#define SCT_IRQn SCT0_IRQn
#define ADC0_SEQA_IRQn ADC_SEQA_IRQn
#define ADC0_SEQB_IRQn ADC_SEQB_IRQn
#define ADC0_THCMP_IRQn ADC_THCMP_IRQn

/** @brief	Interrupt handler Alias */
#define TIMER0_IRQHandler CT32B0_IRQHandler
#define TIMER1_IRQHandler CT32B1_IRQHandler
#define TIMER2_IRQHandler CT32B2_IRQHandler
#define TIMER3_IRQHandler CT32B3_IRQHandler
#define TIMER4_IRQHandler CT32B4_IRQHandler
#define SCT_IRQHandler SCT0_IRQHandler
#define ADC0_SEQA_IRQHandler ADC_SEQA_IRQHandler
#define ADC0_SEQB_IRQHandler ADC_SEQB_IRQHandler
#define ADC0_THCMP_IRQHandler ADC_THCMP_IRQHandler

#ifdef __cplusplus
}
#endif



/** @defgroup PERIPH_5460X_BASE CHIP: LPC5460X Peripheral addresses and register set declarations
 * @ingroup CHIP_5460X_DRIVERS
 * @{
 */

#ifndef __DOXYGEN__
/* Macros to append params */
#define __APPEND30(x,y,z) x##y##z
#define __APPEND3(x,y,z) __APPEND30(x,y,z)
#endif

/* Main memory addresses */
#define LPC_FLASHMEM_BASE          0x00000000UL
#define LPC_SRAMX_BASE             0x04000000UL
#define LPC_SRAM0_BASE             0x20000000UL
#define LPC_SRAM1_BASE             0x20010000UL
#define LPC_SRAM2_BASE             0x20018000UL
#define LPC_USB_SRAM_BASE          0x40100000UL
#define LPC_USB_SRAM_SIZE          0x00002000UL
#define LPC_ROM_BASE               0x03000000UL

/* APB0 peripheral group addresses */
#define LPC_SYSCON_BASE            0x40000000UL
#define LPC_IOCON_BASE             0x40001000UL
#define LPC_GPIO_GROUPINT0_BASE    0x40002000UL
#define LPC_GPIO_GROUPINT1_BASE    0x40003000UL
#define LPC_PIN_INT_BASE           0x40004000UL
#define LPC_INMUX_BASE             0x40005000UL
#define LPC_TIMER0_BASE            0x40008000UL
#define LPC_TIMER1_BASE            0x40009000UL
#define LPC_WWDT_BASE              0x4000C000UL
#define LPC_MRT_BASE               0x4000D000UL
#define LPC_UTICK_BASE             0x4000E000UL
#define LPC_EEPROM_BASE            0x40014000UL
#define LPC_OTP_BASE               0x40015000UL

/* APB1 peripheral group address */
#define LPC_PMU_BASE               0x40020000UL
#define LPC_TIMER2_BASE            0x40028000UL
#define LPC_RTC_BASE               0x4002C000UL
#define LPC_RITIMER_BASE           0x4002D000UL
#define LPC_FMC_BASE               0x40034000UL

/* Asynchronous APB peripheral group addresses */
#define LPC_ASYNC_SYSCON_BASE      0x40040000UL
#define LPC_TIMER3_BASE            0x40048000UL
#define LPC_TIMER4_BASE            0x40049000UL

/* AHB Peripherals base address */
#define LPC_SPIFI_BASE             0x40080000UL
#define LPC_EMC_BASE               0x40081000UL
#define LPC_DMA_BASE               0x40082000UL
#define LPC_LCD_BASE               0x40083000UL
#define LPC_USB0_BASE              0x40084000UL
#define LPC_LCD_BASE               0x40083000UL
#define LPC_SCT_BASE               0x40085000UL
#define LPC_FLEXCOMM0_BASE         0x40086000UL
#define LPC_FLEXCOMM1_BASE         0x40087000UL
#define LPC_FLEXCOMM2_BASE         0x40088000UL
#define LPC_FLEXCOMM3_BASE         0x40089000UL
#define LPC_FLEXCOMM4_BASE         0x4008A000UL
#define LPC_GPIO_PORT_BASE         0x4008C000UL
#define LPC_DMIC_BASE              0x40090000UL
#define LPC_ETHERNET_BASE          0x40092000UL
#define LPC_USB1_BASE              0x40094000UL
#define LPC_CRC_BASE               0x40095000UL
#define LPC_FLEXCOMM5_BASE         0x40096000UL
#define LPC_FLEXCOMM6_BASE         0x40097000UL
#define LPC_FLEXCOMM7_BASE         0x40098000UL
#define LPC_FLEXCOMM8_BASE         0x40099000UL
#define LPC_FLEXCOMM9_BASE         0x4009A000UL
#define LPC_SDIO_BASE              0x4009B000UL
#define LPC_ISPAP_BASE             0x4009C000UL
#define LPC_CAN0_BASE              0x4009D000UL
#define LPC_CAN1_BASE              0x4009E000UL
#define LPC_ADC_BASE               0x400A0000UL
#define LPC_AES_BASE               0x400A1000UL
#define LPC_USB0_HOST_BASE         0x400A2000UL
#define LPC_USB1_HOST_BASE         0x400A3000UL
#define LPC_HASH_BASE              0x400A4000UL

/* Main memory register access */
#define LPC_GPIO           ((LPC_GPIO_T            *) LPC_GPIO_PORT_BASE)
//#define LPC_DMA            ((LPC_DMA_T             *) LPC_DMA_BASE)
#define LPC_EMC            ((LPC_EMC_T             *) LPC_EMC_BASE)
//#define LPC_LCD            ((LPC_LCD_T             *) LPC_LCD_BASE)
//#define LPC_CRC            ((LPC_CRC_T             *) LPC_CRC_BASE)
#define LPC_SDIO           ((LPC_SDMMC_T           *) LPC_SDIO_BASE)
//#define LPC_SCT            ((LPC_SCT_T             *) LPC_SCT_BASE)
#define LPC_ADC            ((LPC_ADC_T             *) LPC_ADC_BASE)
//#define LPC_PMU            ((LPC_PMU_T             *) LPC_PMU_BASE)
//#define LPC_DMIC           ((LPC_DMIC_T            *) LPC_DMIC_BASE)
//#define LPC_USB0           ((LPC_USB_T             *) LPC_USB0_BASE)
//#define LPC_USB1           ((LPC_USB_T             *) LPC_USB1_BASE)
//#define LPC_USBH0          ((LPC_USBH0_T           *) LPC_USB0_HOST_BASE)
//#define LPC_USBH1          ((LPC_USBH1_T           *) LPC_USB1_HOST_BASE)
//#define LPC_ETHERNET		((LPC_ENET_T			*) LPC_ETHERNET_BASE)
//#define LPC_EEPROM			((LPC_EEPROM_T 			*) LPC_EEPROM_BASE)

/* APB0 peripheral group register access */
#define LPC_SYSCON         ((LPC_SYSCON_T          *) LPC_SYSCON_BASE)
#define LPC_SYSCTL         ((LPC_SYSCON_T          *) LPC_SYSCON_BASE)
//#define LPC_TIMER2         ((LPC_TIMER_T           *) LPC_TIMER2_BASE)
//#define LPC_TIMER3         ((LPC_TIMER_T           *) LPC_TIMER3_BASE)
//#define LPC_TIMER4         ((LPC_TIMER_T           *) LPC_TIMER4_BASE)
//#define LPC_GINT           ((LPC_GPIOGROUPINT_T    *) LPC_GPIO_GROUPINT0_BASE)
//#define LPC_PININT         ((LPC_PIN_INT_T         *) LPC_PIN_INT_BASE)
#define LPC_IOCON          ((LPC_IOCON_T           *) LPC_IOCON_BASE)
//#define LPC_UTICK          ((LPC_UTICK_T           *) LPC_UTICK_BASE)
//#define LPC_WWDT           ((LPC_WWDT_T            *) LPC_WWDT_BASE)
//#define LPC_RTC            ((LPC_RTC_T             *) LPC_RTC_BASE)
//#define LPC_OTP			   ((LPC_OTP_T			   *) LPC_OTP_BASE)
//#define LPC_SDMMC          LPC_SDIO
#define LPC_SPIFI                 ((LPC_SPIFI_Type          *) LPC_SPIFI_BASE)

/* APB1 peripheral group register access */
#define LPC_ASYNC_SYSCON   ((LPC_ASYNC_SYSCON_T    *) LPC_ASYNC_SYSCON_BASE)
#define LPC_TIMER0         ((LPC_TIMER_T           *) LPC_TIMER0_BASE)
//#define LPC_TIMER1         ((LPC_TIMER_T           *) LPC_TIMER1_BASE)
//#define LPC_INMUX          ((LPC_INMUX_T           *) LPC_INMUX_BASE)
//#define LPC_MRT            ((LPC_MRT_T             *) LPC_MRT_BASE)
#define LPC_RITIMER        ((LPC_RITIMER_T         *) LPC_RITIMER_BASE)

#ifndef __DOXYGEN__

/* USART0 Defines */
#define USART0_FLEXCOMM                 0
#define LPC_USART0_BASE   __APPEND3(LPC_FLEXCOMM,USART0_FLEXCOMM,_BASE)
#define LPC_USART0        ((LPC_USART_T *) LPC_USART0_BASE)
#define LPC_UART0        ((LPC_USART_T *) LPC_USART0_BASE)
#define USART0_IRQHandler __APPEND3(FLEXCOMM,USART0_FLEXCOMM,_IRQHandler)
#define USART0_IRQn       __APPEND3(FLEXCOMM,USART0_FLEXCOMM,_IRQn)
#define DMAREQ_USART0_RX  __APPEND3(DMAREQ_FLEXCOMM,USART0_FLEXCOMM,_RX)
#define DMAREQ_USART0_TX  __APPEND3(DMAREQ_FLEXCOMM,USART0_FLEXCOMM,_TX)

#define LPC_UART_TypeDef LPC_USART_T

///* USART1 Defines */
//#define LPC_USART1_BASE   __APPEND3(LPC_FLEXCOMM,USART1_FLEXCOMM,_BASE)
//#define LPC_USART1        ((LPC_USART_T *) LPC_USART1_BASE)
//#define USART1_IRQHandler __APPEND3(FLEXCOMM,USART1_FLEXCOMM,_IRQHandler)
//#define USART1_IRQn       __APPEND3(FLEXCOMM,USART1_FLEXCOMM,_IRQn)
//#define DMAREQ_USART1_RX  __APPEND3(DMAREQ_FLEXCOMM,USART1_FLEXCOMM,_RX)
//#define DMAREQ_USART1_TX  __APPEND3(DMAREQ_FLEXCOMM,USART1_FLEXCOMM,_TX)

///* USART2 Defines */
//#define LPC_USART2_BASE   __APPEND3(LPC_FLEXCOMM,USART2_FLEXCOMM,_BASE)
//#define LPC_USART2        ((LPC_USART_T *) LPC_USART2_BASE)
//#define USART2_IRQHandler __APPEND3(FLEXCOMM,USART2_FLEXCOMM,_IRQHandler)
//#define USART2_IRQn       __APPEND3(FLEXCOMM,USART2_FLEXCOMM,_IRQn)
//#define DMAREQ_USART2_RX  __APPEND3(DMAREQ_FLEXCOMM,USART2_FLEXCOMM,_RX)
//#define DMAREQ_USART2_TX  __APPEND3(DMAREQ_FLEXCOMM,USART2_FLEXCOMM,_TX)

///* USART3 Defines */
//#define LPC_USART3_BASE   __APPEND3(LPC_FLEXCOMM,USART3_FLEXCOMM,_BASE)
//#define LPC_USART3        ((LPC_USART_T *) LPC_USART3_BASE)
//#define USART3_IRQHandler __APPEND3(FLEXCOMM,USART3_FLEXCOMM,_IRQHandler)
//#define USART3_IRQn       __APPEND3(FLEXCOMM,USART3_FLEXCOMM,_IRQn)
//#define DMAREQ_USART3_RX  __APPEND3(DMAREQ_FLEXCOMM,USART3_FLEXCOMM,_RX)
//#define DMAREQ_USART3_TX  __APPEND3(DMAREQ_FLEXCOMM,USART3_FLEXCOMM,_TX)

///* USART4 Defines */
//#define LPC_USART4_BASE   __APPEND3(LPC_FLEXCOMM,USART4_FLEXCOMM,_BASE)
//#define LPC_USART4        ((LPC_USART_T *) LPC_USART4_BASE)
//#define USART4_IRQHandler __APPEND3(FLEXCOMM,USART4_FLEXCOMM,_IRQHandler)
//#define USART4_IRQn       __APPEND3(FLEXCOMM,USART4_FLEXCOMM,_IRQn)
//#define DMAREQ_USART4_RX  __APPEND3(DMAREQ_FLEXCOMM,USART4_FLEXCOMM,_RX)
//#define DMAREQ_USART4_TX  __APPEND3(DMAREQ_FLEXCOMM,USART4_FLEXCOMM,_TX)

///* USART5 Defines */
//#define LPC_USART5_BASE   __APPEND3(LPC_FLEXCOMM,USART5_FLEXCOMM,_BASE)
//#define LPC_USART5        ((LPC_USART_T *) LPC_USART5_BASE)
//#define USART5_IRQHandler __APPEND3(FLEXCOMM,USART5_FLEXCOMM,_IRQHandler)
//#define USART5_IRQn       __APPEND3(FLEXCOMM,USART5_FLEXCOMM,_IRQn)
//#define DMAREQ_USART5_RX  __APPEND3(DMAREQ_FLEXCOMM,USART5_FLEXCOMM,_RX)
//#define DMAREQ_USART5_TX  __APPEND3(DMAREQ_FLEXCOMM,USART5_FLEXCOMM,_TX)

///* USART6 Defines */
//#define LPC_USART6_BASE   __APPEND3(LPC_FLEXCOMM,USART6_FLEXCOMM,_BASE)
//#define LPC_USART6        ((LPC_USART_T *) LPC_USART6_BASE)
//#define USART6_IRQHandler __APPEND3(FLEXCOMM,USART6_FLEXCOMM,_IRQHandler)
//#define USART6_IRQn       __APPEND3(FLEXCOMM,USART6_FLEXCOMM,_IRQn)
//#define DMAREQ_USART6_RX  __APPEND3(DMAREQ_FLEXCOMM,USART6_FLEXCOMM,_RX)
//#define DMAREQ_USART6_TX  __APPEND3(DMAREQ_FLEXCOMM,USART6_FLEXCOMM,_TX)

///* USART7 Defines */
//#define LPC_USART7_BASE   __APPEND3(LPC_FLEXCOMM,USART7_FLEXCOMM,_BASE)
//#define LPC_USART7        ((LPC_USART_T *) LPC_USART7_BASE)
//#define USART7_IRQHandler __APPEND3(FLEXCOMM,USART7_FLEXCOMM,_IRQHandler)
//#define USART7_IRQn       __APPEND3(FLEXCOMM,USART7_FLEXCOMM,_IRQn)
//#define DMAREQ_USART7_RX  __APPEND3(DMAREQ_FLEXCOMM,USART7_FLEXCOMM,_RX)
//#define DMAREQ_USART7_TX  __APPEND3(DMAREQ_FLEXCOMM,USART7_FLEXCOMM,_TX)

#endif


/**
 * System reset status values
 */
#define SYSCON_RST_POR    (1 << 0)	/*!< POR reset status */
#define SYSCON_RST_EXTRST (1 << 1)	/*!< External reset status */
#define SYSCON_RST_WDT    (1 << 2)	/*!< Watchdog reset status */
#define SYSCON_RST_BOD    (1 << 3)	/*!< Brown-out detect reset status */
#define SYSCON_RST_SYSRST (1 << 4)	/*!< software system reset status */


/**
 * @brief LPC5460X Main system configuration register block structure
 */
typedef struct {
	__I  uint32_t RESERVED0[4];
	__IO uint32_t AHBMATPRIO;           /*!< AHB Martix priority register */
	__I  uint32_t RESERVED1[11];
	__IO uint32_t SYSTCKCAL;			/*!< System Tick Calibration register */
	__I  uint32_t RESERVED2[1];
	__IO uint32_t NMISRC;				/*!< NMI Source select register */
	__IO uint32_t ASYNCAPBCTRL;			/*!< Asynch APB chiplet control register */
	__I  uint32_t RESERVED3[28];
	__I  uint32_t PIOPORCAP[2];         /*!< Power on Reset; port capture register */
	__I  uint32_t RESERVED4[2];
	__I  uint32_t PIORESCAP[2];         /*!< Reset; port capture register */
	__I  uint32_t RESERVED5[10];
	__IO uint32_t PRESETCTRL[3];		/*!< Peripheral Reset control */
	__I  uint32_t RESERVED6[5];
	__O  uint32_t PRESETCTRLSET[3];     /*!< Peripheral Reset Control set */
	__I  uint32_t RESERVED7[5];
	__O  uint32_t PRESETCTRLCLR[3];     /*!< Peripheral Reset Control set */
	__I  uint32_t RESERVED8[41];
	__IO uint32_t SYSRSTSTAT;			/*!< System Reset Stat register */
	__I  uint32_t RESERVED9[3];
	__IO uint32_t AHBCLKCTRL[3];        /*!< AHB Peripheral Clk Enable register */
	__I  uint32_t RESERVED10[5];
	__O  uint32_t AHBCLKCTRLSET[3];     /*!< AHB Peripheral Clk Enable Set register */
	__I  uint32_t RESERVED11[5];
	__O  uint32_t AHBCLKCTRLCLR[3];     /*!< AHB Peripheral Clk Enable Clr register */
	__I  uint32_t RESERVED12[13];
	__IO uint32_t MAINCLKSELA;			/*!< Main Clk sel Source Sel A register */
	__IO uint32_t MAINCLKSELB;			/*!< Main Clk sel Source Sel B register */
	__IO uint32_t CLKOUTSELA;			/*!< Clk Out Sel Source B register */
	__I  uint32_t RESERVED13;
	__IO uint32_t SYSPLLCLKSEL;			/*!< System PLL Clk Selregister */
	__I  uint32_t RESERVED14[1];
	__IO uint32_t AUDPLLCLKSEL;			/*!< Audio PLL Clk Selregister */
	__I  uint32_t RESERVED15[1];
	__IO uint32_t SPIFICLKSEL;          /*!< SPIFI clock selection register */
	__IO uint32_t ADCCLKSEL;			/*!< ADC Async Clk Sel register */
	__IO uint32_t USB0CLKSEL;			/*!< USB0 Clk Sel register */
	__IO uint32_t USB1CLKSEL;           /*!< USB1 Clock select register */
	__IO uint32_t FXCOMCLKSEL[10];       /*!< FlexCOM CLK sel register */
	__I  uint32_t RESERVED16[2];
	__IO uint32_t MCLKCLKSEL;           /*!< MCLK Clock select register */
	__I  uint32_t RESERVED16A;
	__IO uint32_t FRGCLKSEL;            /*!< FRG Clock select register */
	__IO uint32_t DMICCLKSEL;           /*!< DMIC Clock select register */
	__IO uint32_t SCTCLKSEL;            /*!< SCT Clock select register */
	__IO uint32_t LCDCLKSEL;            /*!< LCD Controller clock select register */
	__IO uint32_t SDIOCLKSEL;           /*!< SDIO Clock select register */
	__I  uint32_t RESERVED17;
	__IO uint32_t SYSTICKCLKDIV;		/*!< Systick Clock divider register */
    __IO uint32_t ARMTRCLKDIV;	    	/*!< ARM Trace Clock divider register */
    __IO uint32_t CAN0CLKDIV;		    /*!< CAN0 Clock divider register */
    __IO uint32_t CAN1CLKDIV;		    /*!< CAN1 Clock divider register */
    __IO uint32_t SC0CLKDIV;		    /*!< Smart Card 0 Clock divider register */
    __IO uint32_t SC1CLKDIV;		    /*!< Smart Card 1 Clock divider register */
	__I  uint32_t RESERVED18[26];
	__IO uint32_t AHBCLKDIV;            /*!< AHB Clock divider */
	__IO uint32_t CLKOUTDIV;            /*!< CLKOUT divider */
    __IO uint32_t FROHFCLKDIV;          /*!< FRO HF Clock divider */
	__I  uint32_t RESERVED19[1];
	__IO uint32_t SPIFICLKDIV;          /*!< SPIFI clock divider register */
	__IO uint32_t ADCCLKDIV;            /*!< ADC Clock divider register */
	__IO uint32_t USB0CLKDIV;           /*!< USB 0 Clock divider register */
	__IO uint32_t USB1CLKDIV;           /*!< USB 1 Clock divider register */
	__IO uint32_t FRGCTRL;				/*!< Fraction Rate Generator Ctrl register */
	__I  uint32_t RESERVED21;
	__IO uint32_t DMICCLKDIV;            /*!< DMIC Clock divider register */
	__IO uint32_t MCLKDIV;               /*!< I2S MClock divider register */
	__IO uint32_t LCDCLKDIV;             /*!< LCD Controller Clock divide */
	__IO uint32_t SCTCLKDIV;             /*!< SCT/PWM Clock divide */
	__IO uint32_t EMCCLKDIV;             /*!< EMC Clock divide */
	__IO uint32_t SDIOCLKDIV;            /*!< SDIO Clock Divide */
	__I  uint32_t RESERVED22[16];
	__IO uint32_t FLASHCFG;              /*!< Flash wait state configuration register */
	__I  uint32_t RESERVED23[2];
	__IO uint32_t USB0CLKCTRL;           /*!< USB Clock control register */
	__IO uint32_t USB0CLKSTAT;           /*!< USB Clock Status register */
	__I  uint32_t RESERVED24;
	__IO uint32_t FREQMECTRL;            /*!< Frequency measure register */
	__I  uint32_t RESERVED25;
	__IO uint32_t MCLKIO;                /*!< MCLK Input Output register */
  __IO uint32_t USB1CLKCTRL;           /*!< USB1 Clock Control register */
  __IO uint32_t USB1CLKSTAT;           /*!< USB1 Clock Status register */
	__I  uint32_t RESERVED261[6];
    __IO uint32_t EMCSYSCTRL;            /*!< EMC System Control register */
    __IO uint32_t EMCDLYCTRL;            /*!< EMC Clock Delay Control register */
    __IO uint32_t EMCDLYCAL;             /*!< EMC Clock Delay Chain Calibration register */
    __IO uint32_t ETHPHYSEL;             /*!< Ethernet Phy Selection register */
    __IO uint32_t ETHSBDCTRL;            /*!< Ethernet SBD Flow Control register */
    __I  uint32_t RESERVED262[2];
    __IO uint32_t SDIOCLKCTRL;           /*!< SDIO Clock Control register */
    __I  uint32_t RESERVED263[39];
	__IO uint32_t FROCTRL;               /*!< FRO oscillator control register */
	__IO uint32_t SYSOSCCTRL;            /*!< System oscillator control register */
	__IO uint32_t WDTOSCCTRL;            /*!< Watchdog Oscillator control */
	__IO uint32_t RTCOSCCTRL;            /*!< RTC Oscillator control register */
	__I  uint32_t RESERVED28[3];
	__IO uint32_t USBPLLCTRL;            /*!< USB PLL control register */
	__I  uint32_t USBPLLSTAT;            /*!< USB PLL status register */
	__I  uint32_t RESERVED29[23];
	__IO uint32_t SYSPLLCTRL;            /*!< System PLL control register */
	__I  uint32_t SYSPLLSTAT;            /*!< System PLL status register */
	__IO uint32_t SYSPLLNDEC;            /*!< System PLL N-DEC register */
	__IO uint32_t SYSPLLPDEC;            /*!< System PLL P-DEC register */
	__IO uint32_t SYSPLLMDEC;
	__I  uint32_t RESERVED30[3];
	__IO uint32_t AUDPLLCTRL;            /*!< Audio PLL control register */
	__I  uint32_t AUDPLLSTAT;            /*!< Audio PLL status register */
	__IO uint32_t AUDPLLNDEC;            /*!< Audio PLL N-DEC register */
	__IO uint32_t AUDPLLPDEC;            /*!< Audio PLL P-DEC register */
	__IO uint32_t AUDPLLMDEC;       	 /*!< Audio PLL M-DEC register */
	__IO uint32_t AUDPLLFRAC;      		 /*!< Audio PLL Fractional divider control register */
	__I  uint32_t RESERVED31[22];
	__IO uint32_t PDRUNCFG[2];           /*!< Power Down configuration registers */
	__I  uint32_t RESERVED32[2];
	__O  uint32_t PDRUNCFGSET[2];        /*!< Power down configuartion set register */
	__I  uint32_t RESERVED33[2];
	__O  uint32_t PDRUNCFGCLR[2];        /*!< Power down configuartion clear register */
	__I  uint32_t RESERVED34[18];
	__IO uint32_t STARTERP[2];           /*!< Start logic wakeup enable register */
	__I  uint32_t RESERVED35[6];
	__O  uint32_t STARTERPSET[2];        /*!< Start logic wakeup enable set register */
	__I  uint32_t RESERVED36[6];
	__O  uint32_t STARTERPCLR[2];        /*!< Start logic wakeup enable clear register */
	__I  uint32_t RESERVED37[46];
	__IO uint32_t HWWAKE;                /*!< Special Hardware Wake register */
	__I  uint32_t RESERVED38[540];
	__I  uint32_t JTAGIDCODE;            /*!< JTAG ID Code register */
	__I  uint32_t DEVICE_ID[2];           /*!< Device ID Registers */
} LPC_SYSCON_T;

/**
 * @brief LPC5460X Asynchronous system configuration register block structure
 */
typedef struct {
	__IO uint32_t AYSNCPRESETCTRL;		/*!< peripheral reset register */
	__O  uint32_t ASYNCPRESETCTRLSET;	/*!< peripheral reset Set register */
	__O  uint32_t ASYNCPRESETCTRLCLR;	/*!< peripheral reset Clr register */
	__I  uint32_t RESERVED0;
	__IO uint32_t ASYNCAPBCLKCTRL;		/*!< clk enable register */
	__IO uint32_t ASYNCAPBCLKCTRLSET;	/*!< clk enable Set register */
	__IO uint32_t ASYNCAPBCLKCTRLCLR;	/*!< clk enable Clr register */
	__I  uint32_t RESERVED1;
	__IO uint32_t ASYNCAPBCLKSELA;		/*!< clk source mux A register */
} LPC_ASYNC_SYSCON_T;

#define SYSCON_PDRUNCFG_PD_SRAM0         (1 << 14)		/*!< SRAM0 */
#define SYSCON_PDRUNCFG_PD_SRAM1         (1 << 15)		/*!< SRAM1 */
#define SYSCON_PDRUNCFG_PD_USB_RAM       (1 << 16)		/*!< USB RAM */

#define SYSCON_FROCTRL_MASK            ((1 << 15) | (0xF << 26))  /**< MASK for reserved bits in FROCTRL register */
#define SYSCON_FROCTRL_WRTRIM          (1UL << 31)   /**< Enable Writes to FROCTRL register */
#define SYSCON_FROCTRL_HSPDCLK         (1UL << 30)   /**< High speed clock (FROHF) enable bit */
#define SYSCON_FROCTRL_USBMODCHG       (1UL << 25)   /**< When set Trim value is pending to be set by SOF from USB */
#define SYSCON_FROCTRL_USBCLKADJ       (1UL << 24)   /**< Automatically adjust FRO trim value based on SOF from USB */
#define SYSCON_FROCTRL_SEL96MHZ        (1UL << 14)   /**< When set FROHF will be 96MHz; else FROHF will be 48MHz */

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
 * @brief External Memory Controller (EMC) register block structure
 */
typedef struct {							/*!< EMC Structure          */
	__IO uint32_t  CONTROL;					/*!< Controls operation of the memory controller. */
	__I  uint32_t  STATUS;					/*!< Provides EMC status information. */
	__IO uint32_t  CONFIG;					/*!< Configures operation of the memory controller. */
	__I  uint32_t  RESERVED0[5];
	__IO uint32_t  DYNAMICCONTROL;			/*!< Controls dynamic memory operation. */
	__IO uint32_t  DYNAMICREFRESH;			/*!< Configures dynamic memory refresh operation. */
	__IO uint32_t  DYNAMICREADCONFIG;		/*!< Configures the dynamic memory read strategy. */
	__I  uint32_t  RESERVED1;
	__IO uint32_t  DYNAMICRP;				/*!< Selects the precharge command period. */
	__IO uint32_t  DYNAMICRAS;				/*!< Selects the active to precharge command period. */
	__IO uint32_t  DYNAMICSREX;				/*!< Selects the self-refresh exit time. */
	__IO uint32_t  DYNAMICAPR;				/*!< Selects the last-data-out to active command time. */
	__IO uint32_t  DYNAMICDAL;				/*!< Selects the data-in to active command time. */
	__IO uint32_t  DYNAMICWR;				/*!< Selects the write recovery time. */
	__IO uint32_t  DYNAMICRC;				/*!< Selects the active to active command period. */
	__IO uint32_t  DYNAMICRFC;				/*!< Selects the auto-refresh period. */
	__IO uint32_t  DYNAMICXSR;				/*!< Selects the exit self-refresh to active command time. */
	__IO uint32_t  DYNAMICRRD;				/*!< Selects the active bank A to active bank B latency. */
	__IO uint32_t  DYNAMICMRD;				/*!< Selects the load mode register to active command time. */
	__I  uint32_t  RESERVED2[9];
	__IO uint32_t  STATICEXTENDEDWAIT;		/*!< Selects time for long static memory read and write transfers. */
	__I  uint32_t  RESERVED3[31];
	__IO uint32_t  DYNAMICCONFIG0;			/*!< Selects the configuration information for dynamic memory chip select n. */
	__IO uint32_t  DYNAMICRASCAS0;			/*!< Selects the RAS and CAS latencies for dynamic memory chip select n. */
	__I  uint32_t  RESERVED4[6];
	__IO uint32_t  DYNAMICCONFIG1;			/*!< Selects the configuration information for dynamic memory chip select n. */
	__IO uint32_t  DYNAMICRASCAS1;			/*!< Selects the RAS and CAS latencies for dynamic memory chip select n. */
	__I  uint32_t  RESERVED5[6];
	__IO uint32_t  DYNAMICCONFIG2;			/*!< Selects the configuration information for dynamic memory chip select n. */
	__IO uint32_t  DYNAMICRASCAS2;			/*!< Selects the RAS and CAS latencies for dynamic memory chip select n. */
	__I  uint32_t  RESERVED6[6];
	__IO uint32_t  DYNAMICCONFIG3;			/*!< Selects the configuration information for dynamic memory chip select n. */
	__IO uint32_t  DYNAMICRASCAS3;			/*!< Selects the RAS and CAS latencies for dynamic memory chip select n. */
	__I  uint32_t  RESERVED7[38];
	__IO uint32_t  STATICCONFIG0;			/*!< Selects the memory configuration for static chip select n. */
	__IO uint32_t  STATICWAITWEN0;			/*!< Selects the delay from chip select n to write enable. */
	__IO uint32_t  STATICWAITOEN0;			/*!< Selects the delay from chip select n or address change, whichever is later, to output enable. */
	__IO uint32_t  STATICWAITRD0;			/*!< Selects the delay from chip select n to a read access. */
	__IO uint32_t  STATICWAITPAG0;			/*!< Selects the delay for asynchronous page mode sequential accesses for chip select n. */
	__IO uint32_t  STATICWAITWR0;			/*!< Selects the delay from chip select n to a write access. */
	__IO uint32_t  STATICWAITTURN0;			/*!< Selects bus turnaround cycles */
	__I  uint32_t  RESERVED8;
	__IO uint32_t  STATICCONFIG1;			/*!< Selects the memory configuration for static chip select n. */
	__IO uint32_t  STATICWAITWEN1;			/*!< Selects the delay from chip select n to write enable. */
	__IO uint32_t  STATICWAITOEN1;			/*!< Selects the delay from chip select n or address change, whichever is later, to output enable. */
	__IO uint32_t  STATICWAITRD1;			/*!< Selects the delay from chip select n to a read access. */
	__IO uint32_t  STATICWAITPAG1;			/*!< Selects the delay for asynchronous page mode sequential accesses for chip select n. */
	__IO uint32_t  STATICWAITWR1;			/*!< Selects the delay from chip select n to a write access. */
	__IO uint32_t  STATICWAITTURN1;			/*!< Selects bus turnaround cycles */
	__I  uint32_t  RESERVED9;
	__IO uint32_t  STATICCONFIG2;			/*!< Selects the memory configuration for static chip select n. */
	__IO uint32_t  STATICWAITWEN2;			/*!< Selects the delay from chip select n to write enable. */
	__IO uint32_t  STATICWAITOEN2;			/*!< Selects the delay from chip select n or address change, whichever is later, to output enable. */
	__IO uint32_t  STATICWAITRD2;			/*!< Selects the delay from chip select n to a read access. */
	__IO uint32_t  STATICWAITPAG2;			/*!< Selects the delay for asynchronous page mode sequential accesses for chip select n. */
	__IO uint32_t  STATICWAITWR2;			/*!< Selects the delay from chip select n to a write access. */
	__IO uint32_t  STATICWAITTURN2;			/*!< Selects bus turnaround cycles */
	__I  uint32_t  RESERVED10;
	__IO uint32_t  STATICCONFIG3;			/*!< Selects the memory configuration for static chip select n. */
	__IO uint32_t  STATICWAITWEN3;			/*!< Selects the delay from chip select n to write enable. */
	__IO uint32_t  STATICWAITOEN3;			/*!< Selects the delay from chip select n or address change, whichever is later, to output enable. */
	__IO uint32_t  STATICWAITRD3;			/*!< Selects the delay from chip select n to a read access. */
	__IO uint32_t  STATICWAITPAG3;			/*!< Selects the delay for asynchronous page mode sequential accesses for chip select n. */
	__IO uint32_t  STATICWAITWR3;			/*!< Selects the delay from chip select n to a write access. */
	__IO uint32_t  STATICWAITTURN3;			/*!< Selects bus turnaround cycles */
} LPC_EMC_T;



/**	@brief	UART Registers */
typedef struct {                   /* UART registers Structure          */
	__IO uint32_t CFG;             /*!< Offset: 0x000 Configuration register  */
	__IO uint32_t CTL;             /*!< Offset: 0x004 Control register */
	__IO uint32_t STAT;            /*!< Offset: 0x008 Status register */
	__IO uint32_t INTENSET;        /*!< Offset: 0x00C Interrupt Enable Read and Set register */
	__O  uint32_t INTENCLR;        /*!< Offset: 0x010 Interrupt Enable Clear register @cond */
	__I  uint32_t RESERVED0A[3];   /*!< Offset: 0x014 Reserved register @endcond */
	__IO uint32_t BRG;             /*!< Offset: 0x020 Baud Rate Generator register */
	__I  uint32_t INTSTAT;         /*!< Offset: 0x024 Interrupt Status register */
	__IO uint32_t OSR;             /*!< Offset: 0x028 Oversampling register */
	__IO uint32_t ADDR;            /*!< Offset: 0x02C Address register (for automatic address matching) @cond */
	__I  uint32_t RESERVED0[884];  /*!< Offset: 0x030 Reserved member */

	/** UART FIFO Specific registers @endcond */
	__IO uint32_t FIFOCFG;         /*!< Offset: 0xE00 FIFO Configuration register */
	__IO uint32_t FIFOSTAT;        /*!< Offset: 0xE04 FIFO Status register */
	__IO uint32_t FIFOTRIG;        /*!< Offset: 0xE08 FIFO Trigger level register @cond */
	__I  uint32_t RESERVED1;       /*!< Offset: 0xE0C Reserved register @endcond */
	__IO uint32_t FIFOINTENSET;    /*!< Offset: 0xE10 FIFO Interrupt enable SET register */
	__IO uint32_t FIFOINTENCLR;    /*!< Offset: 0xE14 FIFO Interrupt enable CLEAR register */
	__IO uint32_t FIFOINTSTAT;     /*!< Offset: 0xE18 FIFO Interrupt Status register @cond */
	__I  uint32_t RESERVED2;       /*!< Offset: 0xE1C Reserved register @endcond */
	__O  uint32_t FIFOWR;          /*!< Offset: 0xE20 FIFO Data write register @cond */
	__I  uint32_t RESERVED3[3];    /*!< Offset: 0xE24 Reserved register @endcond */
	__I  uint32_t FIFORD;          /*!< Offset: 0xE30 FIFO Data read register @cond */
	__I  uint32_t RESERVED4[3];    /*!< Offset: 0xE24 Reserved register @endcond */
	__I  uint32_t FIFORDNOPOP;     /*!< Offset: 0xE40 FIFO Data peek (read without popping out of queue) register @cond */
	__I  uint32_t RESERVED5[109];  /*!< Offset: 0xE44 Reserved register */

	/** FLEXCOMM Interface registers @endcond */
	__IO uint32_t PSELID;          /*!< Offset: 0xFF8 Peripheral select/identification register */
	__I  uint32_t PID;             /*!< Offset: 0xFFC Module identification register */
} LPC_USART_T;

/**
 * @brief LPC5460X IO Configuration Unit register block structure
 */
typedef struct {			/*!< LPC5460X IOCON Structure */
	__IO uint32_t  PIO[5][32];
} LPC_IOCON_T;

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
#define IOCON_FUNC8             0x8				/*!< Selects pin function 8 */
#define IOCON_FUNC9             0x9				/*!< Selects pin function 9 */
#define IOCON_FUNC10            0xA				/*!< Selects pin function 10 */
#define IOCON_FUNC11            0xB				/*!< Selects pin function 11 */
#define IOCON_FUNC12            0xC				/*!< Selects pin function 12 */
#define IOCON_FUNC13            0xD				/*!< Selects pin function 13 */
#define IOCON_FUNC14            0xE				/*!< Selects pin function 14 */
#define IOCON_FUNC15            0xF				/*!< Selects pin function 15 */
#define IOCON_MODE_INACT        (0x0 << 4)		/*!< No addition pin function */
#define IOCON_MODE_PULLDOWN     (0x1 << 4)		/*!< Selects pull-down function */
#define IOCON_MODE_PULLUP       (0x2 << 4)		/*!< Selects pull-up function */
#define IOCON_MODE_REPEATER     (0x3 << 4)		/*!< Selects pin repeater function */
#define IOCON_HYS_EN            (0x1 << 6)		/*!< Enables hysteresis */
#define IOCON_GPIO_MODE         (0x1 << 6)		/*!< GPIO Mode */
#define IOCON_I2C_SLEW          (0x1 << 6)		/*!< I2C Slew Rate Control */
#define IOCON_INV_EN            (0x1 << 7)		/*!< Enables invert function on input */
#define IOCON_ANALOG_EN         (0x0 << 8)		/*!< Enables analog function by setting 0 to bit 7 */
#define IOCON_DIGITAL_EN        (0x1 << 8)		/*!< Enables digital function by setting 1 to bit 7(default) */
#define IOCON_STDI2C_EN         (0x1 << 9)		/*!< I2C standard mode/fast-mode */
#define IOCON_FASTI2C_EN        (0x3 << 9)		/*!< I2C Fast-mode Plus and high-speed slave */
#define IOCON_INPFILT_OFF       (0x1 << 9)		/*!< Input filter Off for GPIO pins */
#define IOCON_INPFILT_ON        (0x0 << 9)		/*!< Input filter On for GPIO pins */
#define IOCON_HIGH_SPEED_EN     (0x1 << 10)     /*!< High speed enable */
#define IOCON_OPENDRAIN_EN      (0x1 << 11)		/*!< Enables open-drain function */
#define IOCON_S_MODE_0CLK       (0x0 << 12)		/*!< Bypass input filter */
#define IOCON_S_MODE_1CLK       (0x1 << 12)		/*!< Input pulses shorter than 1 filter clock are rejected */
#define IOCON_S_MODE_2CLK       (0x2 << 12)		/*!< Input pulses shorter than 2 filter clock2 are rejected */
#define IOCON_S_MODE_3CLK       (0x3 << 12)		/*!< Input pulses shorter than 3 filter clock2 are rejected */
#define IOCON_S_MODE(clks)      ((clks) << 12)	/*!< Select clocks for digital input filter mode */
#define IOCON_CLKDIV(div)       ((div) << 14)	/*!< Select peripheral clock divider for input filter sampling clock, 2^n, n=0-6 */

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

/**
  * @brief Product name title=UM10430 Chapter title=LPC43xx SPI Flash Interface (SPIFI) Modification date=1/19/2011 Major revision=0 Minor revision=7  (SPIFI)
  */

typedef struct {                            /*!< (@ 0x40003000) SPIFI Structure        */
  __IO uint32_t CTRL;                       /*!< (@ 0x40003000) SPIFI control register */
  __IO uint32_t CMD;                        /*!< (@ 0x40003004) SPIFI command register */
  __IO uint32_t ADDR;                       /*!< (@ 0x40003008) SPIFI address register */
  __IO uint32_t DATINTM;                    /*!< (@ 0x4000300C) SPIFI intermediate data register */
  __IO uint32_t ADDRINTM;                   /*!< (@ 0x40003010) SPIFI address and intermediate data register */
  __IO uint32_t DAT;                        /*!< (@ 0x40003014) SPIFI data register    */
  __IO uint32_t MEMCMD;                     /*!< (@ 0x40003018) SPIFI memory command register */
  __IO uint32_t STAT;                       /*!< (@ 0x4000301C) SPIFI status register  */
} LPC_SPIFI_Type;

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

/** @defgroup SDIF_5460X CHIP: LPC5460x SD/SDIO driver
 * @ingroup CHIP_5460X_Drivers
 * @{
 */

/**
 * @brief SD/MMC & SDIO register block structure
 */
typedef struct {				/*!< SDMMC Structure        */
	__IO uint32_t  CTRL;		/*!< Control Register       */
	__IO uint32_t  PWREN;		/*!< Power Enable Register  */
	__IO uint32_t  CLKDIV;		/*!< Clock Divider Register */
	__IO uint32_t  CLKSRC;		/*!< SD Clock Source Register */
	__IO uint32_t  CLKENA;		/*!< Clock Enable Register  */
	__IO uint32_t  TMOUT;		/*!< Timeout Register       */
	__IO uint32_t  CTYPE;		/*!< Card Type Register     */
	__IO uint32_t  BLKSIZ;		/*!< Block Size Register    */
	__IO uint32_t  BYTCNT;		/*!< Byte Count Register    */
	__IO uint32_t  INTMASK;		/*!< Interrupt Mask Register */
	__IO uint32_t  CMDARG;		/*!< Command Argument Register */
	__IO uint32_t  CMD;			/*!< Command Register       */
	__I  uint32_t  RESP0;		/*!< Response Register 0    */
	__I  uint32_t  RESP1;		/*!< Response Register 1    */
	__I  uint32_t  RESP2;		/*!< Response Register 2    */
	__I  uint32_t  RESP3;		/*!< Response Register 3    */
	__I  uint32_t  MINTSTS;		/*!< Masked Interrupt Status Register */
	__IO uint32_t  RINTSTS;		/*!< Raw Interrupt Status Register */
	__I  uint32_t  STATUS;		/*!< Status Register        */
	__IO uint32_t  FIFOTH;		/*!< FIFO Threshold Watermark Register */
	__I  uint32_t  CDETECT;		/*!< Card Detect Register   */
	__I  uint32_t  WRTPRT;		/*!< Write Protect Register */
	__IO uint32_t  GPIO;		/*!< General Purpose Input/Output Register */
	__I  uint32_t  TCBCNT;		/*!< Transferred CIU Card Byte Count Register */
	__I  uint32_t  TBBCNT;		/*!< Transferred Host to BIU-FIFO Byte Count Register */
	__IO uint32_t  DEBNCE;		/*!< Debounce Count Register */
	__IO uint32_t  USRID;		/*!< User ID Register       */
	__I  uint32_t  VERID;		/*!< Version ID Register    */
	__I  uint32_t  RESERVED0;
	__IO uint32_t  UHS_REG;		/*!< UHS-1 Register         */
	__IO uint32_t  RST_N;		/*!< Hardware Reset         */
	__I  uint32_t  RESERVED1;
	__IO uint32_t  BMOD;		/*!< Bus Mode Register      */
	__O  uint32_t  PLDMND;		/*!< Poll Demand Register   */
	__IO uint32_t  DBADDR;		/*!< Descriptor List Base Address Register */
	__IO uint32_t  IDSTS;		/*!< Internal DMAC Status Register */
	__IO uint32_t  IDINTEN;		/*!< Internal DMAC Interrupt Enable Register */
	__I  uint32_t  DSCADDR;		/*!< Current Host Descriptor Address Register */
	__I  uint32_t  BUFADDR;		/*!< Current Buffer Descriptor Address Register */
} LPC_SDMMC_T;

#endif /* __CMSIS_5460X_H_ */
