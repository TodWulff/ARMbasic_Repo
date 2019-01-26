#ifndef LPC21xx_H
#define LPC21xx_H


#ifdef UNO32 
#define XTAL        (22118400UL)        /* Oscillator frequency               */
#else
#define XTAL        (20000000UL)        /* Oscillator frequency               */
#endif


/*******************************************************************************
lpc21xx.h - Register defs for Philips LPC210X: LPC2104, LPC2105 and LPC2106

           
THE SOFTWARE IS DELIVERED "AS IS" WITHOUT WARRANTY OR CONDITION OF ANY KIND, 
EITHER EXPRESS, IMPLIED OR STATUTORY. THIS INCLUDES WITHOUT LIMITATION ANY 
WARRANTY OR CONDITION WITH RESPECT TO MERCHANTABILITY OR FITNESS FOR ANY 
PARTICULAR PURPOSE, OR AGAINST THE INFRINGEMENTS OF INTELLECTUAL PROPERTY RIGHTS 
OF OTHERS.
           
This file may be freely used for commercial and non-commercial applications, 
including being redistributed with any tools.

If you find a problem with the file, please report it so that it can be fixed.

Created by Sten Larsson (sten_larsson at yahoo com)

Edited by Richard Barry.

Modified by Bruce Eisenhard, Mike Ray (at Coridium)
*******************************************************************************/

#define ARM7TDMI

#define __ASM            __asm 
  
#define REG8  (volatile unsigned char*)
#define REG16 (volatile unsigned short*)
#define REG32 (volatile unsigned int*)


/*##############################################################################
## MISC
##############################################################################*/

        /* Constants for data to put in IRQ/FIQ Exception Vectors */
#define VECTDATA_IRQ  0xE51FFFF0  /* LDR PC,[PC,#-0xFF0] */
#define VECTDATA_FIQ  /* __TODO */


/*##############################################################################
## VECTORED INTERRUPT CONTROLLER
##############################################################################*/

#define VICIRQStatus    (*(REG32 (0xFFFFF000)))
#define VICFIQStatus    (*(REG32 (0xFFFFF004)))
#define VICRawIntr      (*(REG32 (0xFFFFF008)))
#define VICIntSelect    (*(REG32 (0xFFFFF00C)))
#define VICIntEnable    (*(REG32 (0xFFFFF010)))
#define VICIntEnClear   (*(REG32 (0xFFFFF014)))
#define VICSoftInt      (*(REG32 (0xFFFFF018)))
#define VICSoftIntClear (*(REG32 (0xFFFFF01C)))
#define VICProtection   (*(REG32 (0xFFFFF020)))
#define VICVectAddr     (*(REG32 (0xFFFFF030)))
#define VICDefVectAddr  (*(REG32 (0xFFFFF034)))

#define VICVectAddr0    (*(REG32 (0xFFFFF100)))
#define VICVectAddr1    (*(REG32 (0xFFFFF104)))
#define VICVectAddr2    (*(REG32 (0xFFFFF108)))
#define VICVectAddr3    (*(REG32 (0xFFFFF10C)))
#define VICVectAddr4    (*(REG32 (0xFFFFF110)))
#define VICVectAddr5    (*(REG32 (0xFFFFF114)))
#define VICVectAddr6    (*(REG32 (0xFFFFF118)))
#define VICVectAddr7    (*(REG32 (0xFFFFF11C)))
#define VICVectAddr8    (*(REG32 (0xFFFFF120)))
#define VICVectAddr9    (*(REG32 (0xFFFFF124)))
#define VICVectAddr10   (*(REG32 (0xFFFFF128)))
#define VICVectAddr11   (*(REG32 (0xFFFFF12C)))
#define VICVectAddr12   (*(REG32 (0xFFFFF130)))
#define VICVectAddr13   (*(REG32 (0xFFFFF134)))
#define VICVectAddr14   (*(REG32 (0xFFFFF138)))
#define VICVectAddr15   (*(REG32 (0xFFFFF13C)))

#define VICVectCntl0    (*(REG32 (0xFFFFF200)))
#define VICVectCntl1    (*(REG32 (0xFFFFF204)))
#define VICVectCntl2    (*(REG32 (0xFFFFF208)))
#define VICVectCntl3    (*(REG32 (0xFFFFF20C)))
#define VICVectCntl4    (*(REG32 (0xFFFFF210)))
#define VICVectCntl5    (*(REG32 (0xFFFFF214)))
#define VICVectCntl6    (*(REG32 (0xFFFFF218)))
#define VICVectCntl7    (*(REG32 (0xFFFFF21C)))
#define VICVectCntl8    (*(REG32 (0xFFFFF220)))
#define VICVectCntl9    (*(REG32 (0xFFFFF224)))
#define VICVectCntl10   (*(REG32 (0xFFFFF228)))
#define VICVectCntl11   (*(REG32 (0xFFFFF22C)))
#define VICVectCntl12   (*(REG32 (0xFFFFF230)))
#define VICVectCntl13   (*(REG32 (0xFFFFF234)))
#define VICVectCntl14   (*(REG32 (0xFFFFF238)))
#define VICVectCntl15   (*(REG32 (0xFFFFF23C)))

#define VICITCR         (*(REG32 (0xFFFFF300)))
#define VICITIP1        (*(REG32 (0xFFFFF304)))
#define VICITIP2        (*(REG32 (0xFFFFF308)))
#define VICITOP1        (*(REG32 (0xFFFFF30C)))
#define VICITOP2        (*(REG32 (0xFFFFF310)))
#define VICPeriphID0    (*(REG32 (0xFFFFFFE0)))
#define VICPeriphID1    (*(REG32 (0xFFFFFFE4)))
#define VICPeriphID2    (*(REG32 (0xFFFFFFE8)))
#define VICPeriphID3    (*(REG32 (0xFFFFFFEC)))

#define VICIntEnClr     VICIntEnClear
#define VICSoftIntClr   VICSoftIntClear



/*##############################################################################
## PCB - Pin Connect Block
##############################################################################*/

#define PCB_PINSEL0     (*(REG32 (0xE002C000)))
#define PCB_PINSEL1     (*(REG32 (0xE002C004)))
// LPC2138
#define PCB_PINSEL2     (*(REG32 (0xE002C014)))


/*##############################################################################
## GPIO - General Purpose I/O
##############################################################################*/

#if (defined ARMexpress) || (defined LPC2106)
	// ignore earlier 2119, 2129, 2138 without fast ios

 #define GPIO_IOPIN      (*(REG32 (0xE0028000))) /* ALTERNATE NAME GPIO = GPIO0 */
 #define GPIO_IOSET      (*(REG32 (0xE0028004)))
 #define GPIO_IODIR      (*(REG32 (0xE0028008)))
 #define GPIO_IOCLR      (*(REG32 (0xE002800C)))
 
 #define GPIO0_IOPIN     (*(REG32 (0xE0028000))) /* ALTERNATE NAME GPIO = GPIO0 */
 #define GPIO0_IOSET     (*(REG32 (0xE0028004)))
 #define GPIO0_IODIR     (*(REG32 (0xE0028008)))
 #define GPIO0_IOCLR     (*(REG32 (0xE002800C)))
 
 #define GPIO1_IOPIN     (*(REG32 (0xE0028010))) 
 #define GPIO1_IOSET     (*(REG32 (0xE0028014)))
 #define GPIO1_IODIR     (*(REG32 (0xE0028018)))
 #define GPIO1_IOCLR     (*(REG32 (0xE002801C)))

#else
  	// high speed IOs
 #define SCB_SCS         (*(REG32 (0xE01FC1A0)))	// set to 1 to enable highspeed IOs

 #define GPIO_IOPIN      (*(REG32 (0x3FFFC014))) /* ALTERNATE NAME GPIO = GPIO0 */
 #define GPIO_IOSET      (*(REG32 (0x3FFFC018)))
 #define GPIO_IODIR      (*(REG32 (0x3FFFC000)))
 #define GPIO_IOCLR      (*(REG32 (0x3FFFC01C)))
 
 #define GPIO0_IOPIN     (*(REG32 (0x3FFFC014))) /* ALTERNATE NAME GPIO = GPIO0 */
 #define GPIO0_IOSET     (*(REG32 (0x3FFFC018)))
 #define GPIO0_IODIR     (*(REG32 (0x3FFFC000)))
 #define GPIO0_IOCLR     (*(REG32 (0x3FFFC01C)))
 #define GPIO0_IOMASK    (*(REG32 (0x3FFFC010)))
 
 // LPC2138
 #define GPIO1_IOPIN     (*(REG32 (0x3FFFC034))) 
 #define GPIO1_IOSET     (*(REG32 (0x3FFFC038)))
 #define GPIO1_IODIR     (*(REG32 (0x3FFFC020)))
 #define GPIO1_IOCLR     (*(REG32 (0x3FFFC03C)))
 #define GPIO1_IOMASK    (*(REG32 (0x3FFFC030)))
#endif

#define FIO0DIR		GPIO0_IODIR
#define FIO1DIR		GPIO1_IODIR

/*##############################################################################
## UART0 / UART1
##############################################################################*/

/* ---- UART 0 --------------------------------------------- */
#define UART0_RBR       (*(REG32 (0xE000C000)))
#define UART0_THR       (*(REG32 (0xE000C000)))
#define UART0_IER       (*(REG32 (0xE000C004)))
#define UART0_IIR       (*(REG32 (0xE000C008)))
#define UART0_FCR       (*(REG32 (0xE000C008)))
#define UART0_LCR       (*(REG32 (0xE000C00C)))
#define UART0_LSR       (*(REG32 (0xE000C014)))
#define UART0_SCR       (*(REG32 (0xE000C01C)))
#define UART0_DLL       (*(REG32 (0xE000C000)))
#define UART0_DLM       (*(REG32 (0xE000C004)))
#define UART0_FDR       (*(REG32 (0xE000C028)))

/* ---- UART 1 --------------------------------------------- */
#define UART1_RBR       (*(REG32 (0xE0010000)))
#define UART1_THR       (*(REG32 (0xE0010000)))
#define UART1_IER       (*(REG32 (0xE0010004)))
#define UART1_IIR       (*(REG32 (0xE0010008)))
#define UART1_FCR       (*(REG32 (0xE0010008)))
#define UART1_LCR       (*(REG32 (0xE001000C)))
#define UART1_LSR       (*(REG32 (0xE0010014)))
#define UART1_SCR       (*(REG32 (0xE001001C)))
#define UART1_DLL       (*(REG32 (0xE0010000)))
#define UART1_DLM       (*(REG32 (0xE0010004)))
#define UART1_MCR       (*(REG32 (0xE0010010)))
#define UART1_MSR       (*(REG32 (0xE0010018)))



/*##############################################################################
## I2C
##############################################################################*/

#define I2C_I2CONSET    (*(REG32 (0xE001C000)))
#define I2C_I2STAT      (*(REG32 (0xE001C004)))
#define I2C_I2DAT       (*(REG32 (0xE001C008)))
#define I2C_I2ADR       (*(REG32 (0xE001C00C)))
#define I2C_I2SCLH      (*(REG32 (0xE001C010)))
#define I2C_I2SCLL      (*(REG32 (0xE001C014)))
#define I2C_I2CONCLR    (*(REG32 (0xE001C018)))


/*##############################################################################
## SPI - Serial Peripheral Interface
##############################################################################*/

#define SPI_SPCR        (*(REG32 (0xE0020000)))
#define SPI_SPSR        (*(REG32 (0xE0020004)))
#define SPI_SPDR        (*(REG32 (0xE0020008)))
#define SPI_SPCCR       (*(REG32 (0xE002000C)))
#define SPI_SPTCR       (*(REG32 (0xE0020010)))
#define SPI_SPTSR       (*(REG32 (0xE0020014)))
#define SPI_SPTOR       (*(REG32 (0xE0020018)))
#define SPI_SPINT       (*(REG32 (0xE002001C)))


/*##############################################################################
## Timer 0 and Timer 1
##############################################################################*/

/* ---- Timer 0 -------------------------------------------- */
#define T0_IR           (*(REG32 (0xE0004000)))
#define T0_TCR          (*(REG32 (0xE0004004)))
#define T0_TC           (*(REG32 (0xE0004008)))
#define T0_PR           (*(REG32 (0xE000400C)))
#define T0_PC           (*(REG32 (0xE0004010)))
#define T0_MCR          (*(REG32 (0xE0004014)))
#define T0_MR0          (*(REG32 (0xE0004018)))
#define T0_MR1          (*(REG32 (0xE000401C)))
#define T0_MR2          (*(REG32 (0xE0004020)))
#define T0_MR3          (*(REG32 (0xE0004024)))
#define T0_CCR          (*(REG32 (0xE0004028)))
#define T0_CR0          (*(REG32 (0xE000402C)))
#define T0_CR1          (*(REG32 (0xE0004030)))
#define T0_CR2          (*(REG32 (0xE0004034)))
#define T0_CR3          (*(REG32 (0xE0004038)))
#define T0_EMR          (*(REG32 (0xE000403C)))

/* ---- Timer 1 -------------------------------------------- */
#define T1_IR           (*(REG32 (0xE0008000)))
#define T1_TCR          (*(REG32 (0xE0008004)))
#define T1_TC           (*(REG32 (0xE0008008)))
#define T1_PR           (*(REG32 (0xE000800C)))
#define T1_PC           (*(REG32 (0xE0008010)))
#define T1_MCR          (*(REG32 (0xE0008014)))
#define T1_MR0          (*(REG32 (0xE0008018)))
#define T1_MR1          (*(REG32 (0xE000801C)))
#define T1_MR2          (*(REG32 (0xE0008020)))
#define T1_MR3          (*(REG32 (0xE0008024)))
#define T1_CCR          (*(REG32 (0xE0008028)))
#define T1_CR0          (*(REG32 (0xE000802C)))
#define T1_CR1          (*(REG32 (0xE0008030)))
#define T1_CR2          (*(REG32 (0xE0008034)))
#define T1_CR3          (*(REG32 (0xE0008038)))
#define T1_EMR          (*(REG32 (0xE000803C)))

//  CPU TYPE == 2103  #if (defined ARM-mite) || (defined ARMexp-LITE)
#define PWM0CON       	(*(REG32 (0xE0004074)))
#define PWM1CON       	(*(REG32 (0xE0008074)))
#define PWM2CON       	(*(REG32 (0xE0070074)))
#define PWM3CON       	(*(REG32 (0xE0074074)))


/* ---- Timer 2 -------------------------------------------- */
#define T2_IR           (*(REG32 (0xE0070000)))
#define T2_TCR          (*(REG32 (0xE0070004)))
#define T2_TC           (*(REG32 (0xE0070008)))
#define T2_PR           (*(REG32 (0xE007000C)))
#define T2_PC           (*(REG32 (0xE0070010)))
#define T2_MCR          (*(REG32 (0xE0070014)))
#define T2_MR0          (*(REG32 (0xE0070018)))
#define T2_MR1          (*(REG32 (0xE007001C)))
#define T2_MR2          (*(REG32 (0xE0070020)))
#define T2_MR3          (*(REG32 (0xE0070024)))
#define T2_CCR          (*(REG32 (0xE0070028)))
#define T2_CR0          (*(REG32 (0xE007002C)))
#define T2_CR1          (*(REG32 (0xE0070030)))
#define T2_CR2          (*(REG32 (0xE0070034)))
#define T2_CR3          (*(REG32 (0xE0070038)))
#define T2_EMR          (*(REG32 (0xE007003C)))

/* ---- Timer 3 -------------------------------------------- */
#define T3_IR           (*(REG32 (0xE0074000)))
#define T3_TCR          (*(REG32 (0xE0074004)))
#define T3_TC           (*(REG32 (0xE0074008)))
#define T3_PR           (*(REG32 (0xE007400C)))
#define T3_PC           (*(REG32 (0xE0074010)))
#define T3_MCR          (*(REG32 (0xE0074014)))
#define T3_MR0          (*(REG32 (0xE0074018)))
#define T3_MR1          (*(REG32 (0xE007401C)))
#define T3_MR2          (*(REG32 (0xE0074020)))
#define T3_MR3          (*(REG32 (0xE0074024)))
#define T3_CCR          (*(REG32 (0xE0074028)))
#define T3_CR0          (*(REG32 (0xE007402C)))
#define T3_CR1          (*(REG32 (0xE0074030)))
#define T3_CR2          (*(REG32 (0xE0074034)))
#define T3_CR3          (*(REG32 (0xE0074038)))
#define T3_EMR          (*(REG32 (0xE007403C)))
//#endif


/*##############################################################################
## PWM
##############################################################################*/

#define PWM_IR          (*(REG32 (0xE0014000)))
#define PWM_TCR         (*(REG32 (0xE0014004)))
#define PWM_TC          (*(REG32 (0xE0014008)))
#define PWM_PR          (*(REG32 (0xE001400C)))
#define PWM_PC          (*(REG32 (0xE0014010)))
#define PWM_MCR         (*(REG32 (0xE0014014)))
#define PWM_MR0         (*(REG32 (0xE0014018)))
#define PWM_MR1         (*(REG32 (0xE001401C)))
#define PWM_MR2         (*(REG32 (0xE0014020)))
#define PWM_MR3         (*(REG32 (0xE0014024)))
#define PWM_MR4         (*(REG32 (0xE0014040)))
#define PWM_MR5         (*(REG32 (0xE0014044)))
#define PWM_MR6         (*(REG32 (0xE0014048)))
#define PWM_EMR         (*(REG32 (0xE001403C)))
#define PWM_PCR         (*(REG32 (0xE001404C)))
#define PWM_LER         (*(REG32 (0xE0014050)))
#define PWM_CCR         (*(REG32 (0xE0014028)))
#define PWM_CR0         (*(REG32 (0xE001402C)))
#define PWM_CR1         (*(REG32 (0xE0014030)))
#define PWM_CR2         (*(REG32 (0xE0014034)))
#define PWM_CR3         (*(REG32 (0xE0014038)))

/*##############################################################################
## RTC
##############################################################################*/

/* ---- RTC: Miscellaneous Register Group ------------------ */
#define RTC_ILR         (*(REG32 (0xE0024000)))
#define RTC_CTC         (*(REG32 (0xE0024004)))
#define RTC_CCR         (*(REG32 (0xE0024008)))  
#define RTC_CIIR        (*(REG32 (0xE002400C)))
#define RTC_AMR         (*(REG32 (0xE0024010)))
#define RTC_CTIME0      (*(REG32 (0xE0024014)))
#define RTC_CTIME1      (*(REG32 (0xE0024018)))
#define RTC_CTIME2      (*(REG32 (0xE002401C)))

/* ---- RTC: Timer Control Group --------------------------- */
#define RTC_SEC         (*(REG32 (0xE0024020)))
#define RTC_MIN         (*(REG32 (0xE0024024)))
#define RTC_HOUR        (*(REG32 (0xE0024028)))
#define RTC_DAY         (*(REG32 (0xE002402C)))
#define RTC_DOW         (*(REG32 (0xE0024030)))
#define RTC_DOY         (*(REG32 (0xE0024034)))
#define RTC_MONTH       (*(REG32 (0xE0024038)))
#define RTC_YEAR        (*(REG32 (0xE002403C)))

/* ---- RTC: Alarm Control Group --------------------------- */
#define RTC_ALSEC       (*(REG32 (0xE0024060)))
#define RTC_ALMIN       (*(REG32 (0xE0024064)))
#define RTC_ALHOUR      (*(REG32 (0xE0024068)))
#define RTC_ALDAY       (*(REG32 (0xE002406C)))
#define RTC_ALDOW       (*(REG32 (0xE0024070)))
#define RTC_ALDOY       (*(REG32 (0xE0024074)))
#define RTC_ALMONTH     (*(REG32 (0xE0024078)))
#define RTC_ALYEAR      (*(REG32 (0xE002407C)))

/* ---- RTC: Reference Clock Divider Group ----------------- */
#define RTC_PREINT      (*(REG32 (0xE0024080)))
#define RTC_PREFRAC     (*(REG32 (0xE0024084)))


/*##############################################################################
## WD - Watchdog
##############################################################################*/

#define WD_WDMOD        (*(REG32 (0xE0000000)))
#define WD_WDTC         (*(REG32 (0xE0000004)))
#define WD_WDFEED       (*(REG32 (0xE0000008)))
#define WD_WDTV         (*(REG32 (0xE000000C)))


/*##############################################################################
## System Control Block
##############################################################################*/

#define SCB_MEMMAP      (*(REG32 (0xE01FC040)))
#define SCB_PLLCON      (*(REG32 (0xE01FC080)))
#define SCB_PLLCFG      (*(REG32 (0xE01FC084)))
#define SCB_PLLSTAT     (*(REG32 (0xE01FC088)))
#define SCB_PLLFEED     (*(REG32 (0xE01FC08C)))
#define SCB_PCON        (*(REG32 (0xE01FC0C0)))
#define SCB_PCONP       (*(REG32 (0xE01FC0C4)))
#define SCB_APBDIV      (*(REG32 (0xE01FC100)))
#define SCB_EXTINT      (*(REG32 (0xE01FC140)))
#define SCB_EXTWAKE     (*(REG32 (0xE01FC144)))
#define SCB_EXTMODE     (*(REG32 (0xE01FC148)))
#define SCB_EXTPOLAR    (*(REG32 (0xE01FC14C)))
#define SCB_RSIR	    (*(REG32 (0xE01FC180)))

// LPC2368 registers
#define SCB_CCLKCFG     (*(REG32 (0xE01FC104)))
#define SCB_CLKSRCSEL   (*(REG32 (0xE01FC10C)))
#define SCB_PCLKSEL0    (*(REG32 (0xE01FC1A8)))
#define SCB_PCLKSEL1    (*(REG32 (0xE01FC1AC)))

#ifdef LPC2368
#define PLLSTAT_LOCK  (1 << 26)         // PLL Lock Status Bit
#define PLLSTAT_CONNECT  (1 << 25)      // PLL Connect Status Bit
#else
#define PLLSTAT_LOCK  (1 << 10)         // PLL Lock Status Bit
#endif

// PLLCON Register Bit Definitions
#define PLLCON_PLLE   (1 << 0)          // PLL Enable
#define PLLCON_PLLC   (1 << 1)          // PLL Connect



/*##############################################################################
## Memory Accelerator Module (MAM)
##############################################################################*/

#define MAM_TIM			(*(REG32 (0xE01FC004)))
#define MAM_CR			(*(REG32 (0xE01FC000)))

// MAM defines
#define MAMCR_FULL    2

// MEMMAP defines
#define MEMMAP_FLASH  1                 // Interrupt Vectors in Flash

#define MAMTIM_CYCLES 	(((__CORE_CLK) + 19999999) / 20000000)


/*##############################################################################
## A/D controller (2103)
##############################################################################*/

#define AD_ADCR			(*(REG32 (0xE0034000)))
#define AD_ADGDR		(*(REG32 (0xE0034004)))
#define AD_ADSTAT		(*(REG32 (0xE0034030)))
#define AD_ADINTEN		(*(REG32 (0xE003400C)))
#define AD_ADDR0		(*(REG32 (0xE0034010)))
#define AD_ADDR1		(*(REG32 (0xE0034014)))
#define AD_ADDR2		(*(REG32 (0xE0034018)))
#define AD_ADDR3		(*(REG32 (0xE003401C)))
#define AD_ADDR4		(*(REG32 (0xE0034020)))
#define AD_ADDR5		(*(REG32 (0xE0034024)))
#define AD_ADDR6		(*(REG32 (0xE0034028)))
#define AD_ADDR7		(*(REG32 (0xE003402C)))

///////////////////////////////////////////////////// CMSIS definitions ////////////////////////////////////////////////////

#ifndef GCC_ASM_STEP

#include <stdint.h>                      /*!< standard types definitions                      */


/* IO definitions (access restrictions to peripheral registers) */
#ifdef __cplusplus
  #define   __I     volatile             /*!< defines 'read only' permissions                 */
#else
  #define   __I     volatile const       /*!< defines 'read only' permissions                 */
#endif
#define     __O     volatile             /*!< defines 'write only' permissions                */
#define     __IO    volatile             /*!< defines 'read / write' permissions              */

/*------------- Real-Time Clock (RTC) ----------------------------------------*/
typedef struct
{
  __IO uint8_t  ILR;
       uint8_t  RESERVED0[7];
  __IO uint8_t  CCR;
       uint8_t  RESERVED1[3];
  __IO uint8_t  CIIR;
       uint8_t  RESERVED2[3];
  __IO uint8_t  AMR;
       uint8_t  RESERVED3[3];
  __I  uint32_t CTIME0;
  __I  uint32_t CTIME1;
  __I  uint32_t CTIME2;
  __IO uint8_t  SEC;
       uint8_t  RESERVED4[3];
  __IO uint8_t  MIN;
       uint8_t  RESERVED5[3];
  __IO uint8_t  HOUR;
       uint8_t  RESERVED6[3];
  __IO uint8_t  DOM;
       uint8_t  RESERVED7[3];
  __IO uint8_t  DOW;
       uint8_t  RESERVED8[3];
  __IO uint16_t DOY;
       uint16_t RESERVED9;
  __IO uint8_t  MONTH;
       uint8_t  RESERVED10[3];
  __IO uint16_t YEAR;
       uint16_t RESERVED11;
  __IO uint32_t CALIBRATION;
  __IO uint32_t GPREG0;
  __IO uint32_t GPREG1;
  __IO uint32_t GPREG2;
  __IO uint32_t GPREG3;
  __IO uint32_t GPREG4;
  __IO uint8_t  AUXEN;
       uint8_t  RESERVED12[3];
  __IO uint8_t  AUX;
       uint8_t  RESERVED13[3];
  __IO uint8_t  ALSEC;
       uint8_t  RESERVED14[3];
  __IO uint8_t  ALMIN;
       uint8_t  RESERVED15[3];
  __IO uint8_t  ALHOUR;
       uint8_t  RESERVED16[3];
  __IO uint8_t  ALDOM;
       uint8_t  RESERVED17[3];
  __IO uint8_t  ALDOW;
       uint8_t  RESERVED18[3];
  __IO uint16_t ALDOY;
       uint16_t RESERVED19;
  __IO uint8_t  ALMON;
       uint8_t  RESERVED20[3];
  __IO uint16_t ALYEAR;
       uint16_t RESERVED21;
  __IO uint32_t PREINT;
  __IO uint32_t PREFRAC;
       
} LPC_RTC_TypeDef;

/*------------- Timer (TIM) --------------------------------------------------*/
typedef struct
{
  __IO uint32_t IR;
  __IO uint32_t TCR;
  __IO uint32_t TC;
  __IO uint32_t PR;
  __IO uint32_t PC;
  __IO uint32_t MCR;
  __IO uint32_t MR[4];
  __IO uint32_t CCR;
  __I  uint32_t CR[4];
  __IO uint32_t EMR;
       uint32_t RESERVED1[12];
  __IO uint32_t CTCR;
} LPC_TIM_TypeDef;

/*------------- Universal Asynchronous Receiver Transmitter (UART) -----------*/
typedef struct
{
  union {
  __I  uint8_t  RBR;
  __O  uint8_t  THR;
  __IO uint8_t  DLL;
       uint32_t RESERVED0;
  };
  union {
  __IO uint8_t  DLM;
  __IO uint32_t IER;
  };
  union {
  __I  uint32_t IIR;
  __O  uint8_t  FCR;
  };
  __IO uint8_t  LCR;
       uint8_t  RESERVED1[7];
  __I  uint8_t  LSR;
       uint8_t  RESERVED2[7];
  __IO uint8_t  SCR;
       uint8_t  RESERVED3[3];
  __IO uint32_t ACR;
  __IO uint8_t  ICR;
       uint8_t  RESERVED4[3];
  __IO uint8_t  FDR;
       uint8_t  RESERVED5[7];
  __IO uint8_t  TER;
       uint8_t  RESERVED6[39];
  __IO uint32_t FIFOLVL;
} LPC_UART_TypeDef;

/*------------- General Purpose Input/Output (GPIO) --------------------------*/

#if (defined ARMexpress) || (defined LPC2106)
typedef struct
{
    __IO uint32_t PIN;
    __IO uint32_t SET;
    __IO uint32_t DIR;
    __O  uint32_t CLR;
} LPC_GPIO_TypeDef; 
#else
typedef struct
{
  union {
    __IO uint32_t DIR;
    struct {
      __IO uint16_t DIRL;
      __IO uint16_t DIRH;
    };
    struct {
      __IO uint8_t DIR0;
      __IO uint8_t DIR1;
      __IO uint8_t DIR2;
      __IO uint8_t DIR3;
    };
  };
  uint32_t RESERVED0[3];
  union {
    __IO uint32_t MASK;
    struct {
      __IO uint16_t MASKL;
      __IO uint16_t MASKH;
    };
    struct {
      __IO uint8_t MASK0;
      __IO uint8_t MASK1;
      __IO uint8_t MASK2;
      __IO uint8_t MASK3;
    };
  };
  union {
    __IO uint32_t PIN;
    struct {
      __IO uint16_t PINL;
      __IO uint16_t PINH;
    };
    struct {
      __IO uint8_t PIN0;
      __IO uint8_t PIN1;
      __IO uint8_t PIN2;
      __IO uint8_t PIN3;
    };
  };
  union {
    __IO uint32_t SET;
    struct {
      __IO uint16_t SETL;
      __IO uint16_t SETH;
    };
    struct {
      __IO uint8_t SET0;
      __IO uint8_t SET1;
      __IO uint8_t SET2;
      __IO uint8_t SET3;
    };
  };
  union {
    __O  uint32_t CLR;
    struct {
      __O  uint16_t CLRL;
      __O  uint16_t CLRH;
    };
    struct {
      __O  uint8_t CLR0;
      __O  uint8_t CLR1;
      __O  uint8_t CLR2;
      __O  uint8_t CLR3;
    };
  };
} LPC_GPIO_TypeDef;
#endif

/*------------- Analog-to-Digital Converter (ADC) ----------------------------*/
typedef struct {                            /*!< (@ 0x400Ex000) ADCn Structure         */
  __IO uint32_t CR;                         /*!< (@ 0x400Ex000) A/D Control Register. The AD0CR register must be written to select the operating mode before A/D conversion can occur. */
  __I  uint32_t GDR;                        /*!< (@ 0x400Ex004) A/D Global Data Register. Contains the result of the most recent A/D conversion. */
  __I  uint32_t RESERVED0[1];
  __IO uint32_t INTEN;                      /*!< (@ 0x400Ex00C) A/D Interrupt Enable Register. This register contains enable bits that allow the DONE flag of each A/D channel to be included or excluded from contributing to the generation of an A/D interrupt. */
  __I  uint32_t DR[8];                      /*!< (@ 0x400Ex010) A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
  __I  uint32_t STAT;                       /*!< (@ 0x400Ex030) A/D Status Register. This register contains DONE and OVERRUN flags for all of the A/D channels, as well as the A/D interrupt flag. */
} LPC_ADC_TypeDef;


/*------------- Watchdog Timer (WDT) -----------------------------------------*/
typedef struct
{
  __IO uint8_t  WDMOD;
       uint8_t  RESERVED0[3];
  __IO uint32_t WDTC;
  __O  uint8_t  WDFEED;
       uint8_t  RESERVED1[3];
  __I  uint32_t WDTV;
} LPC_WDT_TypeDef;

/*------------- Pulse-Width Modulation (PWM) ---------------------------------*/
typedef struct
{
  __IO uint32_t IR;	
  __IO uint32_t TCR;
  __IO uint32_t TC;	
  __IO uint32_t PR;	
  __IO uint32_t PC;	
  __IO uint32_t MCR;
  __IO uint32_t MR0;
  __IO uint32_t MR1;
  __IO uint32_t MR2;
  __IO uint32_t MR3;
  __IO uint32_t CCR;
  __I  uint32_t CR0;
  __I  uint32_t CR1;
  __I  uint32_t CR2;
  __I  uint32_t CR3;
       uint32_t RESERVED0;//we have this as	PWM_EMR but I don't find it in the pdf. mar
  __IO uint32_t MR4;
  __IO uint32_t MR5;
  __IO uint32_t MR6;
  __IO uint32_t PCR;
  __IO uint32_t LER;
       uint32_t RESERVED1[7];
  //__IO uint32_t CTCR;	 //this does not seem to be a member in the LPC21xx. mar
} LPC_PWM_TypeDef;

#endif  //GCC_ASM_STEP


#define LPC_UART0_BASE       	0xE000C000
#define LPC_UART1_BASE       	0xE0010000

#define LPC_TIM0_BASE           0xE0004000
#define LPC_TIM1_BASE           0xE0008000
#define LPC_TIM2_BASE           0xE0070000
#define LPC_TIM3_BASE           0xE0074000

#define LPC_RTC_BASE           	0xE0024000

#if (defined ARMexpress) || (defined LPC2106)
 #define LPC_GPIO0_BASE				0xE0028000
#else
 #define LPC_GPIO0_BASE         	0x3FFFC000
 #define LPC_GPIO1_BASE         	0x3FFFC020
#endif

#define LPC_ADC_BASE         	0xE0034000
#define LPC_WDT_BASE         	0xE0000000
#define LPC_PWM1_BASE         	0xE0014000


#define LPC_ADC               ((LPC_ADC_TypeDef       *) LPC_ADC_BASE      )
#define LPC_WDT               ((LPC_WDT_TypeDef       *) LPC_WDT_BASE      )
#define LPC_PWM1              ((LPC_PWM_TypeDef       *) LPC_PWM1_BASE     )

#define LPC_TIM0              ((LPC_TIM_TypeDef       *) LPC_TIM0_BASE     )
#define LPC_TIM1              ((LPC_TIM_TypeDef       *) LPC_TIM1_BASE     )
#define LPC_TIM2              ((LPC_TIM_TypeDef       *) LPC_TIM2_BASE     )
#define LPC_TIM3              ((LPC_TIM_TypeDef       *) LPC_TIM3_BASE     )
#define LPC_UART0             ((LPC_UART_TypeDef      *) LPC_UART0_BASE    )
#define LPC_UART1             ((LPC_UART_TypeDef      *) LPC_UART1_BASE    )

#define LPC_RTC               ((LPC_RTC_TypeDef       *) LPC_RTC_BASE      )

#define LPC_GPIO0             ((LPC_GPIO_TypeDef      *) LPC_GPIO0_BASE    )
#if (defined ARMexpress) || (defined LPC2106) || (defined LPC2103)
 // ain't no port 1
#else
 #define LPC_GPIO1             ((LPC_GPIO_TypeDef      *) LPC_GPIO1_BASE    )
#endif

#endif /* lpc21xx_h */

