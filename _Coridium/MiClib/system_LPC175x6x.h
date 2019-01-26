/**************************************************************************//**
 * @file     system_LPC175x6x.h
 * @brief    CMSIS Cortex-M3 Device Peripheral Access Layer Header File
 *           for the NXP LPC17xx Device Series
 * @version  V1.02
 * @date     08. September 2009
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
 * modified by Coridium Corp, 2011
 *
 ******************************************************************************/


#ifndef __SYSTEM_LPC175x6x_H
#define __SYSTEM_LPC175x6x_H


#if defined PROplus ||  defined LPC1751
  #define MAX_VAR_COUNT   	(1024+128)	//(1024+256) //?? + 1375
  #define CPU_NUM			0x1751
  #define BASIC_CODE_START	0x03000>>4
  #define FLASH_END			0x08000>>4
  #define USE_AD	
#elif defined LPC1756
  #define MAX_VAR_COUNT   	(2048+256) //?? + 1375
  #define CPU_NUM			0x1756
	#ifdef SUPERweb
		#define BASIC_CODE_START	0x68000>>4
		#define FLASH_END			0x78000>>4
  		#define FILE_SYSTEM
  		#define SDCARD_SSP1
	#else
		#define BASIC_CODE_START	0x08000>>4
		#define FLASH_END			0x20000>>4
	#endif
  #define USE_AD	
  #define SYMBOL_TBL_START 	(f_table[41]<<4) // flashend
#elif defined LPC1768
	#define CPU_NUM			0x1768
	#ifdef SUPERweb
        #define MAX_VAR_COUNT   1024
		#define BASIC_CODE_START	0x68000>>4
		#define FLASH_END					0x78000>>4
  		#define FILE_SYSTEM
  		#define SDCARD_SSP1
	#else
		#define MAX_VAR_COUNT   	(2048+256) //?? + 1375
        #define BASIC_CODE_START	0x08000>>4
		#define FLASH_END					0x20000>>4
	#endif
  #define USE_AD	
  #define SYMBOL_TBL_START 	(f_table[41]<<4) // flashend
#endif

#define FLASHMAP_1758
#define WRFLASH_BLOCK_SIZE		0x1000	

#ifndef GCC_ASM_STEP

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
#endif	// GCC_ASM_STEP

#endif /* __SYSTEM_LPC17xx_H */
