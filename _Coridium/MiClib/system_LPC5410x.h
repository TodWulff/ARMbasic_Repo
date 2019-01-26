/**************************************************************************//**
 * @file     system_LPC1540x.h
 * @brief    CMSIS Cortex-M3 Device Peripheral Access Layer Header File
 *           for the NXP LPC15xx Device Series
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
 ******************************************************************************/

#define CPU_NUM				0x5402		// love NXP keeping standards, why 5 digit numbers now?? -- save 5412 for 54112

#if defined LPC54102m0 
  #define MAX_VAR_COUNT   	512
  #define BASIC_CODE_START	0x70000>>4 // sector 14
  #define FLASH_END			0x80000>>4 // thru 15
  #define MAX_VAR_COUNT   	1024 // leaves 1832 free, +256 left 772 free and M0 failed
//  #define BLOCK_SIZE	   	0x8000
#elif defined LPC54102
  #define BASIC_CODE_START	0x08000>>4 // sector 1
  #define FLASH_END			0x70000>>4 // thru 13
  #define MAX_VAR_COUNT   	0x5800 // leaves 4376 free, using last 1K for shared space
  #define BLOCK_SIZE	   	0x8000
  #define MASTER_CPU
#else
 #error CPU defines not set properly
#endif

// define these Flash constants here, as this file gets included in startup.S and to much stuff in lpc407x.h that assembler doesn't like
#define FLASHMAP_54102
#define WRFLASH_BLOCK_SIZE		0x8000	

#define USE_AD

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

//extern int getBROMVersion();
extern void M0_start(void);
extern void IO2AD(int chan) ;


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
#define IOCON_MODE_INACT        (0x0 << 3)		/*!< No addition pin function */
#define IOCON_MODE_PULLDOWN     (0x1 << 3)		/*!< Selects pull-down function */
#define IOCON_MODE_PULLUP       (0x2 << 3)		/*!< Selects pull-up function */
#define IOCON_MODE_REPEATER     (0x3 << 3)		/*!< Selects pin repeater function */
#define IOCON_HYS_EN            (0x1 << 5)		/*!< Enables hysteresis */
#define IOCON_GPIO_MODE         (0x1 << 5)		/*!< GPIO Mode */
#define IOCON_I2C_SLEW          (0x1 << 5)		/*!< I2C Slew Rate Control */
#define IOCON_INV_EN            (0x1 << 6)		/*!< Enables invert function on input */
#define IOCON_ANALOG_EN         (0x0 << 7)		/*!< Enables analog function by setting 0 to bit 7 */
#define IOCON_DIGITAL_EN        (0x1 << 7)		/*!< Enables digital function by setting 1 to bit 7(default) */
#define IOCON_STDI2C_EN         (0x1 << 8)		/*!< I2C standard mode/fast-mode */
#define IOCON_FASTI2C_EN        (0x3 << 8)		/*!< I2C Fast-mode Plus and high-speed slave */
#define IOCON_INPFILT_OFF       (0x1 << 8)		/*!< Input filter Off for GPIO pins */
#define IOCON_INPFILT_ON        (0x0 << 8)		/*!< Input filter On for GPIO pins */
#define IOCON_OPENDRAIN_EN      (0x1 << 10)		/*!< Enables open-drain function */
#define IOCON_S_MODE_0CLK       (0x0 << 11)		/*!< Bypass input filter */
#define IOCON_S_MODE_1CLK       (0x1 << 11)		/*!< Input pulses shorter than 1 filter clock are rejected */
#define IOCON_S_MODE_2CLK       (0x2 << 11)		/*!< Input pulses shorter than 2 filter clock2 are rejected */
#define IOCON_S_MODE_3CLK       (0x3 << 11)		/*!< Input pulses shorter than 3 filter clock2 are rejected */
#define IOCON_S_MODE(clks)      ((clks) << 11)	/*!< Select clocks for digital input filter mode */
#define IOCON_CLKDIV(div)       ((div) << 13)	/*!< Select peripheral clock divider for input filter sampling clock, 2^n, n=0-6 */





#ifdef __cplusplus
}
#endif

#endif /* __SYSTEM_LPC15xx_H */
