/***********************************************************************
 * $Id: system_LPC43xx.h 8242 2011-10-11 15:15:25Z nxp28536 $
 *
 * Project: LPC43xx Common
 *
 * Description:
 *     CMSIS Cortex-M4 Device Peripheral Access Layer Header File
 *     for the NXP LPC43xx Device Series
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
 **********************************************************************/


#ifndef __SYSTEM_LPC18xx_H
#define __SYSTEM_LPC18xx_H

	// Memory Map for LPC4330 SPIFI                           moves to SRAM at			DATA							loadLPC map
	//
	//		0x14030000 - 				available for shared 
	//									code run from SPIFI 
	//
	//		0x14024000 -				may get used for firmware/user programs, but open for now
	//
	//																				0x2000F000 - 0x2000FFFF
	//		0x14022000 - 0x14023FFF		IOH user BASIC			0x2000E000
	//		0x14020000 - 0x14021FFF		IOH firmware			0x2000C000												0xc000 - 0xffff
	//
	//																				0x10090000 - 0x10091FFF
	//		0x1401C000 - 0x1401FFFF		M0 user BASIC			0x10084000
	//		0x14018000 - 0x1401BFFF		M0 firmware				0x10080000												0x8000 - 0xbfff
	//
	//																				0x10018000 - 0x1001FFFF
	//		0x14008000 - 0x14017FFF		M4 user BASIC			0x10008000
	//		0x14000000 - 0x14007FFF		M4 firmware				0x10000000												0x0000 - 0x7fff


#ifdef FOR_BASIC
 #if defined LPC4330 || defined LPC1850
	#ifdef CORE_M0a
	  #define MAX_VAR_COUNT   	(0x200)
	  #define BASIC_CODE_START	0x04000>>4		
	  #define FLASH_END			0x10000>>4
	  #define BASIC_BASE_ADDR   0x0002			// WriteFlash moves 0x20000 - 0x30000 into 0x14018000 and 0x10080000
	  #define SLAVE_CPU
	#else
	  #define MAX_VAR_COUNT   	(0x1000)
	  #define BASIC_CODE_START	0x08000>>4
	  #define FLASH_END			0x18000>>4
	  #define BASIC_BASE_ADDR   0x0000
	  #ifndef LPC1850
	    #define MASTER_CPU
	  #endif
	#endif
  #define CPU_NUM			0x4330

 #endif
#endif

#define USE_AD	
#define FLASHMAP_SPIFI
#define WRFLASH_BLOCK_SIZE		0x1000	
  
#ifndef GCC_ASM_STEP


#include <stdint.h>

#ifdef __cplusplus
 extern "C" {
#endif 

extern uint32_t SystemCoreClock;	// M4Frequency;


typedef enum CLKDIV
{
	DIV1	= 1,
	DIV2	= 2,
	DIV4	= 4,
	DIV8 	= 8,
	DIV16	= 16,
	DIV256	= 256,
} CLKDIV_Type;

typedef enum CLKSRC
{
	SRC_OSC32K    	= 0,
	SRC_IRC        	= 1,
	SRC_ENET_RX_CLK	= 2,
	SRC_ENET_TX_CLK = 3,
	SRC_EXT_TCK 	= 4,
	RESERVED    	= 5,  // Do NOT use
	SRC_XTAL       	= 6,
	SRC_PL550M_0   	= 7,
	SRC_PL550M_FRAC	= 8, //New in Falcon
	SRC_PL160M_0   	= 9,
	SRC_PL160M_1   	= 10,
	SRC_PL160M_2   	= 11,
	SRC_IDIV_0     	= 12,
	SRC_IDIV_1     	= 13,
	SRC_IDIV_2     	= 14,
	SRC_IDIV_3     	= 15,
	SRC_IDIV_4     	= 16,
	NOT_DEFINED		= 0xFFFFFFF,	// Force a signed int enum, so every possible frequency can be entered
} CLKSRC_Type;

typedef enum CLKBASE
{
	PL550M 			= 0, //PL550Frac is new, should be added???
	PL160M 			= 1,
	IDIVA_4 		= 2,
	IDIVB_16 		= 3,
	IDIVC_16 		= 4,
	IDIVD_16 		= 5,
	IDIVE_256 		= 6,
	BASE_SAFE_CLK 	= 7,
	BASE_USB0_CLK 	= 8,
	BASE_M0_CLK 	= 9,
	BASE_USB1_CLK 	= 10,
	BASE_M4_CLK 	= 11,
	BASE_SPIFI_CLK 	= 12,
	BASE_SPI_CLK 	= 13,
	BASE_PHY_RX_CLK = 14,
	BASE_PHY_TX_CLK = 15,
	BASE_VPB1_CLK 	= 16,
	BASE_VPB3_CLK 	= 17,
	BASE_LCD_CLK 	= 18,
	BASE_VADC_CLK 	= 19,	//New
	BASE_SDIO_CLK 	= 20,
	BASE_SSP0_CLK 	= 21,
	BASE_SSP1_CLK 	= 22,
	BASE_UART0_CLK 	= 23,
	BASE_UART1_CLK 	= 24,
	BASE_UART2_CLK 	= 25,
	BASE_UART3_CLK 	= 26,
	BASE_OUT_CLK 	= 27,
	BASE_AOTEST_CLK = 28,
	BASE_ISO_TCK 	= 29,
	BASE_BSR_TCK 	= 30,
	BASE_CLK_TEST	= 31,
	BASE_APLL_CLK 	= 32, //New in Falcon
	BASE_SPARE0_CLK	= 33, //New in Falcon
	BASE_SPARE1_CLK	= 34, //New in Falcon
	XTAL			= 253,
	ENET_RX			= 254,
	ENET_TX			= 255,
}CLKBASE_Type;	

// PL550M
#define	MODE1A		(0x3<<2)	// Normal operating mode without post-divider and without pre-divider	
#define	MODE1B	   	(0x2<<2)	// Normal operating mode with post-divider and without pre-divider
#define	MODE1C	   	(0x1<<2)	// Normal operating mode without post-divider and with pre-divider
#define	MODE1D	   	(0x0<<2)	// Normal operating mode with post-divider and with pre-divider.
#define BYPASSOFF 	(0<<1)
#define CLKEN		(1<<4)

// PL160M
#define FBSEL 			(1<<6)
#define MSEL_FBDIV(n)	(n<<16)	// MSEL = feedback-divider value	2*M (1 to 2^15)
#define NSEL_PREDIV(n)	(n<<12)	// NSEL = pre-divider value			N	(1 to 2^8)		  	
#define PSEL_POSTDIV(n)	(n<<8)	// PSEL = post-divider value		P*2	(1 to 2^5)

// Generic clock properties
#define AUTO_BLOCK	(1<<11)
#define PD_ENABLE	(1<<0)

extern void SystemInit(void);
extern void SetClock(CLKBASE_Type target_clk, CLKSRC_Type src_clk, CLKDIV_Type div);
extern void SetPL160M(CLKSRC_Type src_clk, uint32_t mult);
extern void SetPLLUSB(void);
extern void EnableSourceClk(CLKSRC_Type src_clk);
extern void DisableSourceClk(CLKSRC_Type src_clk);
extern void IOInit(void);
extern uint32_t GetClockFrequency(CLKSRC_Type src_clk);

extern void M0_start(void);
extern void IO2AD(int chan);
extern int  PORhappened(void);
extern int  RESEThappened(void);
extern int  WDT_BODhappened(void);

#ifdef __cplusplus
}
#endif

#endif		//ndef GCC_ASM_STEP

#endif /* __SYSTEM_LPC43xx_H */
