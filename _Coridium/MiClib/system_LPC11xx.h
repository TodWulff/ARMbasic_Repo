/**************************************************************************//**
 * @file     system_LPC11xx.h
 * @brief    CMSIS Cortex-M0 Device Peripheral Access Layer Header File
 *           for the NXP LPC11xx Device Series
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


#ifndef __SYSTEM_LPC11xx_H
#define __SYSTEM_LPC11xx_H

#if defined LPC1114
  #define MAX_VAR_COUNT   	512
  #define CPU_NUM			0x1114
  #define BASIC_CODE_START	0x03000>>4
  #define FLASH_END			0x08000>>4
#endif

#define LPC111x
#define USE_AD

#define SAVE_SPACE
#define SMALL_TABLE

// define these Flash constants here, as this file gets included in startup.S and to much stuff in lpc407x.h that assembler doesn't like
#define FLASHMAP_1758
#define WRFLASH_BLOCK_SIZE	0x0400		// this is the blocksize used in writes -- in this case limited by available RAM memory

#ifndef GCC_ASM_STEP

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

extern int SystemCoreClock;     /*!< System Clock Frequency (Core Clock)  */


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

extern void IO2AD(int chan);


#ifdef __cplusplus
}
#endif

#endif
#endif /* __SYSTEM_LPC11x_H */
