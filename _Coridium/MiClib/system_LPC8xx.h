/******************************************************************************
 * @file:    system_LPC8xx.h
 * @purpose: CMSIS Cortex-M0+ Device Peripheral Access Layer Header File
 *           for the NXP LPC8xx Device Series 
 * @version: V1.0
 * @date:    16. Aug. 2012
 *----------------------------------------------------------------------------
 *
 * Copyright (C) 2012 ARM Limited. All rights reserved.
 *
 * ARM Limited (ARM) is supplying this software for use with Cortex-M0+ 
 * processor based microcontrollers.  This file can be freely distributed 
 * within development tools that are supporting such ARM based processors. 
 *
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 ******************************************************************************/


#ifndef __SYSTEM_LPC8xx_H
#define __SYSTEM_LPC8xx_H

#ifndef CORE_M0                                                     /*!< Cortex core                    */
  #define CORE_M0
#endif

// STACK MUST BE > 334 bytes to at least run the debugger -- maybe need to be bigger

#ifdef LPC812
  #define CPU_NUM			0x0812
  #define MAX_VAR_COUNT   	512
  #define BASIC_CODE_START	(0x03000>>4)		// if float disabled then this reduced by 0x1000 in startup_user.S
  #define FLASH_END			0x04000>>4
#elif LPC802
  #define CPU_NUM			0x0802
  #define MAX_VAR_COUNT   	32
  #define BASIC_CODE_START	(0x03000>>4)		// if float disabled then this reduced by 0x1000 in startup_user.S
  #define FLASH_END			0x04000>>4
#elif defined LPC824
  #define CPU_NUM			0x0824
  #define MAX_VAR_COUNT   	(1024+256)
  #define BASIC_CODE_START	(0x03800>>4)
  #define FLASH_END			0x08000>>4
  #define USE_AD	
#endif

#define SAVE_SPACE
#define SMALL_TABLE

// define these Flash constants here, as this file gets included in startup.S and to much stuff in lpc407x.h that assembler doesn't like
#define FLASHMAP_812
#define WRFLASH_BLOCK_SIZE	0x400

#ifndef GCC_ASM_STEP

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

extern void * MEMCPY(void *dst0, void *src0, int len0);

//extern uint32_t SystemCoreClock;     /*!< System Clock Frequency (Core Clock)  */
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

/*
 *
 *	startUserCode  -- checks validity of first word of BASIC code
 *
 *  returns 1 if the code is "OK" to branch to
 *  normally if called with 1 (a run command) a 1 will be returned
 *
 */
 
#define START_USER_CODE_DEFINED		

#ifndef BREAK_WAIT
#define BREAK_WAIT	1000
#endif

extern int startUserCode(int);


#ifdef __cplusplus
}
#endif

#endif	//ndef GCC_ASM_STEP
#endif /* __SYSTEM_LPC8xx_H */
