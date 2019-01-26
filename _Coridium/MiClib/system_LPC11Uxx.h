/**************************************************************************//**
 * @file     system_LPC11U3Uxx.h
 * @brief    CMSIS Cortex-M0 Device Peripheral Access Layer Header File
 *           for the NXP LPC11U3Uxx Device Series
 * @version  V1.10
 * @date     24. November 2010
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
 ( 0.13K code + 0.02K const)/112K   0.02/6K data programmed 
 ******************************************************************************/


#ifndef __SYSTEM_LPC11U3Uxx_H
#define __SYSTEM_LPC11U3Uxx_H

#define NEED_SETUP_CHIP

#define START_USER_CODE_DEFINED

#if defined LPC11U35
  #define CPU_NUM			0x1135
  #define MAX_VAR_COUNT   	(1024+256)//+64	might work -- was 512, nearly worked, seeing some setting in high mem being clobbered there -- probably too pessimistic
  #define BASIC_CODE_START	0x04000>>4
  #define FLASH_END			0x10000>>4 //11U35
  //#define FLASH_END			0x20000>>4//11U37
#elif defined LPC11U37
  #define CPU_NUM			0x1137
  #define MAX_VAR_COUNT   	(1024+256)//+64	might work -- was 512, nearly worked, seeing some setting in high mem being clobbered there -- probably too pessimistic
  #define BASIC_CODE_START	0x04000>>4
  #define FLASH_END			0x20000>>4//11U37

#endif

#define USE_AD	

#define FLASHMAP_15xx
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

extern void IO2AD(int chan);
extern unsigned short f_table[];

extern int  alt_inbit(int) ;			
extern void alt_outbit(int pinum, int pinval) ;
extern int  alt_rddirbit(int pinnum) ;
extern void alt_wrdirbit(int pinnum, int dirval) ;
extern int 	startUserCode(int isRUNcommand) ;
extern void setSoftResetPoint(void);	// this sets a place for code to return to on a soft reset
extern void setupchip(void);			// does setup after SystemInit and timer_tick_init

#ifdef __cplusplus
}
#endif

#endif
#endif /* __SYSTEM_LPC11U3Uxx_H */
