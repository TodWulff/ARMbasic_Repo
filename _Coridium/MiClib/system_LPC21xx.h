/**************************************************************************//**
 * @file     system_LPC21xx.h
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
 * Modified from sources for LPC21xx by Coridium Corp
 *
 ******************************************************************************/



#ifndef __SYSTEM_LPC21xx_H
#define __SYSTEM_LPC21xx_H


// defines for BASIC

#ifdef LPC2103
  #define MAX_VAR_COUNT   	(1024+256)
  #define CPU_NUM			0x2103
  #define BASIC_CODE_START	0x4000>>4
  #define FLASH_END			0x8000>>4
  #define USE_AD
#elif (defined ARMmite) || (defined ARMexpLITE) 
  #define MAX_VAR_COUNT   	(1024+256)
  #define CPU_NUM			0x2103
  #define BASIC_CODE_START	0x4000>>4
  #define FLASH_END			0x8000>>4
  #define USE_AD  
#elif defined LPC2119
  #define MAX_VAR_COUNT   	(1024+256)
  #define CPU_NUM			0x2119
  #define BASIC_CODE_START	0x4000>>4
  #define FLASH_END			0x20000>>4
  #define USE_AD 	
#elif defined ARMweb
  #define MAX_VAR_COUNT   	1024
  #define CPU_NUM			0x2138
  #define BASIC_CODE_START	0x68000>>4
  #define FLASH_END			0x78000>>4
  #define USE_AD 	  
  #define SYMBOL_TBL_START 	(f_table[41]<<4) // flashend
  #define MAX_CSTRINGS		WRFLASH_BLOCK_SIZE
  #define MAX_DATA_LIST 	(MAX_CSTRINGS >> 2)
  #define DATA_LIST_START 	0x78000		// want to merge DATA symbol STRING for onchip into 1 sector --
#elif (defined DINusb)
  #define MAX_VAR_COUNT   	(0x6000>>2)
  #define CPU_NUM			0x2138
  #define BASIC_CODE_START	0x4000>>4
  #define FLASH_END			0x18000>>4
  #define USE_AD 	   
#endif  

 
#define LPC21xx

#define FLASHMAP_2138
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


#ifdef ARMmite
#endif
 
extern void IO2AD(int chan) ;
extern void AD2IO(int chan) ;		// used by older parts
	

#ifdef __cplusplus
}
#endif

#endif /* __SYSTEM_LPC17xx_H */
#endif // GCC_ASM_STEP
