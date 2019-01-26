/**************************************************************************//**
 * @file     system_LPC546xx.h
 * @brief    CMSIS Cortex-M4 Device Peripheral Access Layer Header File
 *           for the NXP LPC546xx Device Series
 * @version  V1.10
 * @date     24. November 2016
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

#define CPU_NUM				0x5468

#if defined LPC54618
  #define BASIC_CODE_START	0x08000>>4 // sector 1
  #define FLASH_END			0x80000>>4 // thru 15
  #define MAX_VAR_COUNT   	0x5800
  #define BLOCK_SIZE	   	0x8000
#else
 #error CPU defines not set properly
#endif

// define these Flash constants here, as this file gets included in startup.S and to much stuff in lpc407x.h that assembler doesn't like
#define FLASHMAP_54102 // NOTICE its the same isn't it?
#define WRFLASH_BLOCK_SIZE		0x8000	

//#define USE_AD

#ifdef GCC_ASM_STEP
#else


#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>


extern uint32_t SystemCoreClock;     /*!< System Clock Frequency (Core Clock)  */


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

extern void IO2AD(int chan) ;






#ifdef __cplusplus
}
#endif

#endif /* __SYSTEM_LPC15xx_H */
