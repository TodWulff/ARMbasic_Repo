/**********************************************************************
* $Id$		system_LPC407x_8x_177x_8x.h			2011-06-02
*//**
* @file		system_LPC407x_8x_177x_8x.h
* @brief	CMSIS Cortex-M3 Device Peripheral Access Layer Source File
*			for the NXP LPC Device Series
* @version	1.0
* @date		02. June. 2011
* @author	NXP MCU SW Application Team
* 
* Copyright(C) 2011, NXP Semiconductor
* All rights reserved.
*
***********************************************************************
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
* is used in conjunction with NXP Semiconductors microcontrollers.  This
* copyright, permission, and disclaimer notice must appear in all copies of
* this code.
**********************************************************************/

#ifndef __SYSTEM_LPC407x_8x_177x_8x_H
#define __SYSTEM_LPC407x_8x_177x_8x_H

#ifdef LPC4074
  #define MAX_VAR_COUNT   	(1024+256)
// 	#define MAX_VAR_COUNT   	(2048+256) //?? + 1375	-- superpro
  #define CPU_NUM			0x4074
  #define BASIC_CODE_START	0x08000>>4
  #define FLASH_END			0x20000>>4
  #define __FPU_PRESENT     0            /*!< FPU present or not                                                    */
#elif defined LPC4078
  #define MAX_VAR_COUNT   	(12288+2048+256)
  #define CPU_NUM			0x4078
  #define BASIC_CODE_START	0x10000>>4
  #define FLASH_END			0x70000>>4
  #define __FPU_PRESENT     1            /*!< FPU present or not                                                    */
#endif  

// define these Flash constants here, as this file gets included in startup.S and to much stuff in lpc407x.h that assembler doesn't like
#define FLASHMAP_1758
#define WRFLASH_BLOCK_SIZE		0x1000	

#define USE_AD

#ifndef GCC_ASM_STEP


#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

extern uint32_t SystemCoreClock;      /*!< System Clock Frequency (Core Clock)  	*/
extern uint32_t PeripheralClock;	    /*!< Peripheral Clock Frequency (Pclk) 	    */
extern uint32_t EMCClock;			        /*!< EMC Clock                              */
extern uint32_t USBClock;			        /*!< USB Frequency 						              */


/**
 * Initialize the system
 *
 * @param  none
 * @return none
 *
 * @brief  Setup the microcontroller system.
 *         Initialize the System and update the SystemCoreClock variable.
 */
extern void SystemInit (void);

/**
 * Update SystemCoreClock variable
 *
 * @param  none
 * @return none
 *
 * @brief  Updates the SystemCoreClock with current core Clock
 *         retrieved from cpu registers.
 */
extern void SystemCoreClockUpdate (void);

void IO2AD(int chan);

#endif	//#ifndef GCC_ASM_STEP

/*----------------------------------------------------------------------------
  Define clocks
 *----------------------------------------------------------------------------*/
#define XTAL        (12000000UL)        /* Oscillator frequency               */
#define OSC_CLK     (      XTAL)        /* Main oscillator frequency          */
#define RTC_CLK     (   32768UL)        /* RTC oscillator frequency           */
#define IRC_OSC     (12000000UL)        /* Internal RC oscillator frequency   */
#define WDT_OSC		  (  500000UL)		/* Internal WDT oscillator frequency  */




/*
//-------- <<< end of configuration section >>> ------------------------------
*/

#ifdef __cplusplus
}
#endif

#endif /* __SYSTEM_LPC407x_8x_177x_8x_H */
