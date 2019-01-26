/******************************************************************************
 * @file:    system_LPC177x_8x.h
 * @purpose: CMSIS Cortex-M3 Device Peripheral Access Layer Header File
 *           for the NXP LPC177x_8x Device Series 
 * @version: V1.01
 * @date:    22. Jul. 2009
 *----------------------------------------------------------------------------
 *
 * Copyright (C) 2009 ARM Limited. All rights reserved.
 *
 * ARM Limited (ARM) is supplying this software for use with Cortex-M3 
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


#ifndef __SYSTEM_LPC177x_8x_H
#define __SYSTEM_LPC177x_8x_H

  #define MAX_VAR_COUNT   	(8192+256) // 64K space available, will be smaller for web version

  
// define these Flash constants here, as this file gets included in startup.S and to much stuff in lpc407x.h that assembler doesn't like
#define FLASHMAP_1758
#define WRFLASH_BLOCK_SIZE		0x1000	

#define USE_AD

#ifndef GCC_ASM_STEP

#ifdef __cplusplus
 extern "C" {
#endif 

extern int      SystemCoreClock;    /*!< System Clock Frequency (Core Clock)  */
extern int      PeripheralFrequency;


/**
 * Initialize the system
 *
 * @param  none
 * @return none
 *
 * @brief  Setup the microcontroller system.
 *         Initialize the System and update the SystemFrequency variable.
 */
extern void SystemInit (void);

#ifdef __cplusplus
}
#endif
#endif

#endif /* __SYSTEM_LPC177x_8x_H */
