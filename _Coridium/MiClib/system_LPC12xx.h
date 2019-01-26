/**************************************************************************//**
 * $Id: system_LPC12xx.h 6231 2011-01-21 08:07:04Z cnh20509 $
 *
 * @file     system_LPC12xx.h
 * @brief    CMSIS Cortex-M0 Device Peripheral Access Layer Header File
 *           for the NXP LPC12xx Device Series
 * @version  1.0
 * @date     23. Jan. 2011
 * @author   NXP MCU Team
 *
 * @note
 * Copyright (C) 2011 NXP Semiconductors(NXP). All rights reserved.
 *
 * @par
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
 ******************************************************************************/

#ifndef __SYSTEM_LPC12xx_H
#define __SYSTEM_LPC12xx_H


// define these Flash constants here, as this file gets included in startup.S and to much stuff in lpc407x.h that assembler doesn't like
#define FLASHMAP_1758
#define WRFLASH_BLOCK_SIZE	0x0400		// this is the blocksize used in writes -- in this case limited by available RAM memory

#ifndef GCC_ASM_STEP

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

extern uint32_t SystemCoreClock;     /*!< System Clock Frequency (Core Clock)  */
extern uint32_t MainClock;          /*!< Main Clock Frequency (Main Clock) */

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

#ifdef __cplusplus
}
#endif

#ifdef __COMPILE_INLINE		// doing this for a special linux environment
#include "system_LPC12xx.c"
#endif
#endif

#endif /* __SYSTEM_LPC12xx_H */
