
/****************************************************************************************************//**
 * @file     LPC15xx.h
 *
 * 
 *
 * @brief    CMSIS Cortex-M3 Core Peripheral Access Layer Header File for
 *           default LPC15xx Device Series
 *
 * @version  V0.1
 * @date     18. Jan 2012
 *
 * @note     Generated with SFDGen V2.6 Build 4f  on Tuesday, 17.01.2012 13:39:52
 *
 *           from CMSIS SVD File 'LPC15xx_svd_v0.1.xml' Version 0.1,
 *           created on Thurs, 01.19.2012 15:13:15, last modified on Thurs, 01.19.2012 15:53:09
 *
 *******************************************************************************************************/



/** @addtogroup NXP
  * @{
  */

/** @addtogroup LPC15xx
  * @{
  */

#ifndef __LPC15XX_H__
#define __LPC15XX_H__

#ifdef __cplusplus
extern "C" {
#endif 


#if defined ( __CC_ARM   )
  #pragma anon_unions
#endif

#define CORTEX_M3

 /* Interrupt Number Definition */

typedef enum {
// -------------------------  Cortex-M0 Processor Exceptions Numbers  -----------------------------
  Reset_IRQn                        = -15,  /*!<   1  Reset Vector, invoked on Power up and warm reset */
  NonMaskableInt_IRQn               = -14,  /*!<   2  Non maskable Interrupt, cannot be stopped or preempted */
  HardFault_IRQn                    = -13,  /*!<   3  Hard Fault, all classes of Fault */
  MemoryManagement_IRQn             = -12,  /*!<   4  Memory Management, MPU mismatch, including Access Violation and No Match */
  BusFault_IRQn                     = -11,  /*!<   5  Bus Fault, Pre-Fetch-, Memory Access Fault, other address/memory related Fault */
  UsageFault_IRQn                   = -10,  /*!<   6  Usage Fault, i.e. Undef Instruction, Illegal State Transition */
  SVCall_IRQn                       = -5,   /*!<  11  System Service Call via SVC instruction */
  DebugMonitor_IRQn                 = -4,   /*!<  12  Debug Monitor                    */
  PendSV_IRQn                       = -2,   /*!<  14  Pendable request for system service */
  SysTick_IRQn                      = -1,   /*!<  15  System Tick Timer                */

	// ---------------------------  LPC15xx Specific Interrupt Numbers  ------------------------------
	WDT_IRQn                = 0,     
  BOD_IRQn                = 1,
  FLASH_IRQn              = 2,
  EE_IRQn                 = 3,
  DMA_IRQn                = 4,   
  GINT0_IRQn              = 5,        /*!< Grouped Interrupt 0                              */
  GINT1_IRQn              = 6,        /*!< Grouped Interrupt 1                              */	
  PIN_INT0_IRQn           = 7,        /*!< All I/O pins can be routed to below 8 interrupts. */
  PIN_INT1_IRQn           = 8,
  PIN_INT2_IRQn           = 9,
  PIN_INT3_IRQn           = 10,
  PIN_INT4_IRQn           = 11,   
  PIN_INT5_IRQn           = 12,        
  PIN_INT6_IRQn           = 13,        
  PIN_INT7_IRQn           = 14,        
  RIT_IRQn                = 15,        
  SCT0_IRQn               = 16,        
  SCT1_IRQn               = 17, 
  SCT2_IRQn               = 18,      
  SCT3_IRQn               = 19,       
  
	MRT_IRQn                = 20,       
  UART0_IRQn              = 21,       
  UART1_IRQn              = 22,      
  UART2_IRQn              = 23,     
  I2C_IRQn                = 24,      
  SPI0_IRQn               = 25,       
  SPI1_IRQn               = 26,   
  CAN_IRQn                = 27,      
  USB_IRQn                = 28,      
  USB_FIQn                = 29,       
	USBWakeup_IRQn          = 30,      
  ADC0_SEQA_IRQn          = 31,       
	ADC0_SEQB_IRQn          = 32,      
  ADC0_THCMP_IRQn         = 33,      
  ADC0_OVR_IRQn           = 34,      
	ADC1_SEQA_IRQn          = 35,      
	ADC1_SEQB_IRQn          = 36,     
  ADC1_THCMP_IRQn         = 37,      
  ADC1_OVR_IRQn           = 38,       
	DAC_IRQn                = 39,      
  
  COMP0_IRQn              = 40,     
  COMP1_IRQn              = 41,      
  COMP2_IRQn              = 42,      
  COMP3_IRQn              = 43,
	QEI_IRQn                = 44,      
  RTCALARM_IRQn           = 45,      
	RTCWAKE_IRQn            = 46   
} IRQn_Type;


/** @addtogroup Configuration_of_CMSIS
  * @{
  */

/* Processor and Core Peripheral Section */ /* Configuration of the Cortex-M3 Processor and Core Peripherals */

#define __CM3_REV              0x0201       /*!< Cortex-M3 Core Revision               */
#define __MPU_PRESENT             0         /*!< MPU present or not                    */
#define __NVIC_PRIO_BITS          3         /*!< Number of Bits used for Priority Levels */
#define __Vendor_SysTickConfig    0         /*!< Set to 1 if different SysTick Config is used */
/** @} */ /* End of group Configuration_of_CMSIS */

#include <core_cm3.h>                       /*!< Cortex-M3 processor and core peripherals */
#include "system_LPC15xx.h"                 /*!< LPC1xxx System                          */

/** @addtogroup Device_Peripheral_Registers
  * @{
  */


/*------------- Inter-Integrated Circuit (I2C) -------------------------------*/
/** @addtogroup LPC15xx_I2C I2C-Bus Interface 
  @{
*/
typedef struct
{
  __IO uint32_t  I2CCFG;			  /* 0x00 */
  __IO uint32_t  I2CSTAT;
  __IO uint32_t  I2CINTENSET;
  __O  uint32_t  I2CINTENCLR;
  __IO uint32_t  I2CTIMEOUT;		/* 0x10 */
  __IO uint32_t  I2CCLKDIV;
  __IO uint32_t  I2CINTSTAT;
       uint32_t  Reserved0[1];  
  __IO uint32_t  MSTCTL;			  /* 0x20 */
  __IO uint32_t  MSTTIME;
  __IO uint32_t  MSTDAT;
       uint32_t  Reserved1[5];
  __IO uint32_t  SLVCTL;			  /* 0x40 */
  __IO uint32_t  SLVDAT;
  __IO uint32_t  SLVADR0;
  __IO uint32_t  SLVADR1;
  __IO uint32_t  SLVADR2;			  /* 0x50 */
  __IO uint32_t  SLVADR3;
  __IO uint32_t  SLVQUAL0;
       uint32_t  Reserved2[9];
  __I  uint32_t  MONRXDAT;			/* 0x80 */		
       uint32_t  Reserved3[990];	
  __I  uint32_t  ID;				    /* 0x0FFC */
} LPC_I2C_TypeDef;

/**
  * @brief State Configurable Timer Input Processing Unit (SCT_IPU) (SCT_IPU)
  */

typedef struct {
  __IO uint32_t ENABLE;  
  __IO uint32_t SOURCE;  
       uint32_t RESERVED[6];  
} LPC_SCTIPU_AbortType;


typedef struct {
  __IO uint32_t SAMPLE_CTRL;   //(SCTIPU_base + 32'h000) 
  __IO uint32_t RESERVE[7];  
  LPC_SCTIPU_AbortType ABORT[4];   //(SCTIPU_base + 32'h020 - 0x100) 
} LPC_SCT_IPU_TypeDef;

/**
  * @brief State Configurable Timer (SCT) (SCT)
  */

/**
  * @brief Product name title=UM10430 Chapter title=LPC15xx State Configurable Timer (SCT) Modification date=1/18/2011 Major revision=0 Minor revision=7  (SCT)
  */

/*                         match/cap registers,     events,           states,         inputs,         outputs
SCT0 and SCT1              16                       16                16              8               10
SCT2 and SCT3              8                        10                10              3               6
Below configuration is based on SCT0 and SCT1, the bigger of the two pairs, otherwise, two sets of SCT structure will be needed. */

#define CONFIG_SCT_nEV   (16)           /* Number of events */
#define CONFIG_SCT_nRG   (16)           /* Number of match/compare registers */
#define CONFIG_SCT_nOU   (10)           /* Number of outputs */

typedef struct
{
    __IO  uint32_t CONFIG;              /* 0x000 Configuration Register */
    union {
        __IO uint32_t CTRL_U;           /* 0x004 Control Register */
        struct {
            __IO uint16_t CTRL_L;       /* 0x004 low control register */
            __IO uint16_t CTRL_H;       /* 0x006 high control register */
        };
    };
    __IO uint16_t LIMIT_L;              /* 0x008 limit register for counter L */
    __IO uint16_t LIMIT_H;              /* 0x00A limit register for counter H */
    __IO uint16_t HALT_L;               /* 0x00C halt register for counter L */
    __IO uint16_t HALT_H;               /* 0x00E halt register for counter H */
    __IO uint16_t STOP_L;               /* 0x010 stop register for counter L */
    __IO uint16_t STOP_H;               /* 0x012 stop register for counter H */
    __IO uint16_t START_L;              /* 0x014 start register for counter L */
    __IO uint16_t START_H;              /* 0x016 start register for counter H */
         uint32_t RESERVED1[10];        /* 0x018-0x03C reserved */
    union {
        __IO uint32_t COUNT_U;          /* 0x040 counter register */
        struct {
            __IO uint16_t COUNT_L;      /* 0x040 counter register for counter L */
            __IO uint16_t COUNT_H;      /* 0x042 counter register for counter H */
        };
    };
    __IO uint16_t STATE_L;              /* 0x044 state register for counter L */
    __IO uint16_t STATE_H;              /* 0x046 state register for counter H */
    __I  uint32_t INPUT;                /* 0x048 input register */
    __IO uint16_t REGMODE_L;            /* 0x04C match - capture registers mode register L */
    __IO uint16_t REGMODE_H;            /* 0x04E match - capture registers mode register H */
    __IO uint32_t OUTPUT;               /* 0x050 output register */
    __IO uint32_t OUTPUTDIRCTRL;        /* 0x054 Output counter direction Control Register */
    __IO uint32_t RES;                  /* 0x058 conflict resolution register */
    __IO uint32_t DMA0REQUEST;          /* 0x05C DMA0 Request Register */
    __IO uint32_t DMA1REQUEST;          /* 0x060 DMA1 Request Register */
         uint32_t RESERVED2[35];        /* 0x064-0x0EC reserved */
    __IO uint32_t EVEN;                 /* 0x0F0 event enable register */
    __IO uint32_t EVFLAG;               /* 0x0F4 event flag register */
    __IO uint32_t CONEN;                /* 0x0F8 conflict enable register */
    __IO uint32_t CONFLAG;              /* 0x0FC conflict flag register */

    union {
        __IO union {                    /* 0x100-... Match / Capture value */
            uint32_t U;                 /*       SCTMATCH[i].U  Unified 32-bit register */
            struct {
                uint16_t L;             /*       SCTMATCH[i].L  Access to L value */
                uint16_t H;             /*       SCTMATCH[i].H  Access to H value */
            };
        } MATCH[CONFIG_SCT_nRG];
        __I union {
            uint32_t U;                 /*       SCTCAP[i].U  Unified 32-bit register */
            struct {
                uint16_t L;             /*       SCTCAP[i].L  Access to H value */
                uint16_t H;             /*       SCTCAP[i].H  Access to H value */
            };
        } CAP[CONFIG_SCT_nRG];
    };


         uint32_t RESERVED3[32-CONFIG_SCT_nRG];      /* ...-0x17C reserved */

    union {
        __IO uint16_t MATCH_L[CONFIG_SCT_nRG];       /* 0x180-... Match Value L counter */
        __I  uint16_t CAP_L[CONFIG_SCT_nRG];         /* 0x180-... Capture Value L counter */
    };
         uint16_t RESERVED4[32-CONFIG_SCT_nRG];      /* ...-0x1BE reserved */
    union {
        __IO uint16_t MATCH_H[CONFIG_SCT_nRG];       /* 0x1C0-... Match Value H counter */
        __I  uint16_t CAP_H[CONFIG_SCT_nRG];         /* 0x1C0-... Capture Value H counter */
    };
		
         uint16_t RESERVED5[32-CONFIG_SCT_nRG];      /* ...-0x1FE reserved */

		
    union {
        __IO union {                    /* 0x200-... Match Reload / Capture Control value */
            uint32_t U;                 /*       SCTMATCHREL[i].U  Unified 32-bit register */
            struct {
                uint16_t L;             /*       SCTMATCHREL[i].L  Access to L value */
                uint16_t H;             /*       SCTMATCHREL[i].H  Access to H value */
            };
        } MATCHREL[CONFIG_SCT_nRG];
        __IO union {
            uint32_t U;                 /*       SCTCAPCTRL[i].U  Unified 32-bit register */
            struct {
                uint16_t L;             /*       SCTCAPCTRL[i].L  Access to H value */
                uint16_t H;             /*       SCTCAPCTRL[i].H  Access to H value */
            };
        } CAPCTRL[CONFIG_SCT_nRG];
    };

         uint32_t RESERVED6[32-CONFIG_SCT_nRG];      /* ...-0x27C reserved */

    union {
        __IO uint16_t MATCHREL_L[CONFIG_SCT_nRG];    /* 0x280-... Match Reload value L counter */
        __IO uint16_t CAPCTRL_L[CONFIG_SCT_nRG];     /* 0x280-... Capture Control value L counter */
    };
         uint16_t RESERVED7[32-CONFIG_SCT_nRG];      /* ...-0x2BE reserved */
    union {
        __IO uint16_t MATCHREL_H[CONFIG_SCT_nRG];    /* 0x2C0-... Match Reload value H counter */
        __IO uint16_t CAPCTRL_H[CONFIG_SCT_nRG];     /* 0x2C0-... Capture Control value H counter */
    };
         uint16_t RESERVED8[32-CONFIG_SCT_nRG];      /* ...-0x2FE reserved */

    __IO struct {                       /* 0x300-0x3FC  SCTEVENT[i].STATE / SCTEVENT[i].CTRL*/
        uint32_t STATE;                 /* Event State Register */
        uint32_t CTRL;                  /* Event Control Register */
    } EVENT[CONFIG_SCT_nEV];

         uint32_t RESERVED9[128-2*CONFIG_SCT_nEV];   /* ...-0x4FC reserved */

    __IO struct {                       /* 0x500-0x57C  SCTOUT[i].SET / SCTOUT[i].CLR */
        uint32_t SET;                   /* Output n Set Register */
        uint32_t CLR;                   /* Output n Clear Register */
    } OUT[CONFIG_SCT_nOU];

         uint32_t RESERVED10[191-2*CONFIG_SCT_nOU];  /* ...-0x7F8 reserved */

    __I  uint32_t MODULECONTENT;        /* 0x7FC Module Content */

} LPC_SCT_TypeDef;
/*@}*/ /* end of group LPC15xx_SCT */


// ------------------------------------------------------------------------------------------------
// -----                                         WWDT                                         -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x Windowed Watchdog Timer (WWDT) Modification date=3/16/2011 Major revision=0 Minor revision=3  (WWDT)
  */

typedef struct {                            /*!< (@ 0x40004000) WWDT Structure         */
  __IO uint32_t MOD;                        /*!< (@ 0x40004000) Watchdog mode register*/
  __IO uint32_t TC;                         /*!< (@ 0x40004004) Watchdog timer constant register */
  __IO uint32_t FEED;                       /*!< (@ 0x40004008) Watchdog feed sequence register */
  __I  uint32_t TV;                         /*!< (@ 0x4000400C) Watchdog timer value register */
  __IO uint32_t CLKSEL;                     /*!< (@ 0x40004010) Watchdog clock select register. */
  __IO uint32_t WARNINT;                    /*!< (@ 0x40004014) Watchdog Warning Interrupt compare value. */
  __IO uint32_t WINDOW;                     /*!< (@ 0x40004018) Watchdog Window compare value. */
} LPC_WWDT_TypeDef;

// ------------------------------------------------------------------------------------------------
// -----                                         RIT                                          -----
// ------------------------------------------------------------------------------------------------

/**
  * @brief Product name title=UM10462 Chapter title=LPC15xx Repetitive Timer (RIT) or OS timer, Modification date=3/16/2011 Major revision=0 Minor revision=3  (RIT)
  */
typedef struct
{
  __IO uint32_t COMPVAL;
  __IO uint32_t MASK;
  __IO uint32_t CTRL;
  __IO uint32_t COUNTER;
  __IO uint32_t COMPVAL_H;
  __IO uint32_t MASK_H;
  __IO uint32_t COUNTER_H;
} LPC_RIT_TypeDef;


/*------------- Universal Asynchronous Receiver Transmitter (UART) -----------*/
/** @addtogroup LPC15xx_UART LPC15xx Universal Asynchronous Receiver/Transmitter 
  @{
*/
/**
  * @brief Product name title=Oscar MCU Chapter title=UART Modification date=4/18/2012 Major revision=0 Minor revision=9  (UART)
  */
  
#define MIN_UART

typedef struct
{
  __IO uint32_t  CFG;								/* 0x00 */
  __IO uint32_t  CTRL;
  __IO uint32_t  STAT;
  __IO uint32_t  INTENSET;
  __O  uint32_t  INTENCLR;					/* 0x10 */
  __I  uint32_t  RXDATA;
  __I  uint32_t  RXDATA_STAT;
  __IO uint32_t  TXDATA;
  __IO uint32_t  BRG;								/* 0x20 */
  __IO uint32_t  INTSTAT;
       uint32_t  Reserved[1013];
  __I  uint32_t  ID;								/* 0xFFC */
} LPC_UART_TypeDef;

/*@}*/ /* end of group LPC15xx_UART */


/*------------- Synchronous Serial Interface Controller (SPI) -----------------------*/
/** @addtogroup LPC15xx_SPI LPC15xx Synchronous Serial Port 
  @{
*/
typedef struct
{
  __IO uint32_t  CFG;			    /* 0x00 */
  __IO uint32_t  DLY;
  __IO uint32_t  STAT;
  __IO uint32_t  INTENSET;
  __O  uint32_t  INTENCLR;		/* 0x10 */
  __I  uint32_t  RXDAT;
  __IO uint32_t  TXDATCTL;
  __IO uint32_t  TXDAT;
  __IO uint32_t  TXCTRL;		  /* 0x20 */
  __IO uint32_t  DIV;
  __I  uint32_t  INTSTAT;
       uint32_t  Reserved[1012];
  __I  uint32_t  ID;			    /* 0xFFC */
} LPC_SPI_TypeDef;
/*@}*/ /* end of group LPC15xx_SPI */

/*------------- RTC Timer (RTC) --------------------------------------------------*/
/** @addtogroup LPC15xx_RTC LPC15xx Comparator
  @{
*/
typedef struct {                            /*!< (@ 0x40028000) RTC Structure          */
  __IO uint32_t  CTRL;                      /*!< (@ 0x40028000) Alarm/Wakeup Timer Control register */
  __IO uint32_t  MATCH;                     /*!< (@ 0x40028004) Alarm/Wakeup TImer Match register */
  __IO uint32_t  COUNT;                     /*!< (@ 0x40028008) Alarm/Wakeup TImer counter register */
  __IO uint32_t  WAKE;                      /*!< (@ 0x4002800C) Alarm/Wakeup TImer Wakeup register */
} LPC_RTC_TypeDef;
/*@}*/ /* end of group LPC15xx_RTC */


/*------------- Multi-Rate Timer(MRT) --------------------------------------------------*/
typedef struct {
  __IO uint32_t INTVAL;        							
  __IO uint32_t TIMER;         							
  __IO uint32_t CTRL;          							
  __IO uint32_t STAT;          							
} MRT_Channel_cfg_Type;

typedef struct {
  MRT_Channel_cfg_Type Channel[15]; 		
  __IO uint32_t PARAM; 				
  __IO uint32_t IDLE_CH; 			
  __IO uint32_t IRQ_FLAG; 		
  __IO uint32_t ID; 				
} LPC_MRT_TypeDef;


// ------------------------------------------------------------------------------------------------
// -----                                          ADC                                         -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x ADC Modification date=3/16/2011 Major revision=0 Minor revision=3  (ADC)
  */

typedef struct {                            /*!< (@ 0x40000000) ADC Structure          */
  __IO uint32_t CTRL;                       /*!< (@ 0x40000000) A/D Control Register */
  __IO uint32_t INPUTSEL;                   /*!< (@ 0x40000004) A/D Input Control Register */
  union {
  __IO uint32_t SEQ_CTRL[2];
    struct {
    __IO uint32_t SEQA_CTRL;                  /*!< (@ 0x40000008) A/D SEQA Ctrl Register */
    __IO uint32_t SEQB_CTRL;                  /*!< (@ 0x4000000C) A/D SEQB Ctrl Register */
    };
  };
  union {
  __IO uint32_t SEQ_GDAT[2];
    struct {	
    __IO uint32_t SEQA_GDAT;                  /*!< (@ 0x40000010) A/D SEQA Global Data Register */
    __IO uint32_t SEQB_GDAT;                  /*!< (@ 0x40000014) A/D SEQB Global Data Register */
    };
  };
  uint32_t Reserved[2];
  union {
  __I  uint32_t DAT[12];                    /*!< (@ 0x40000020) A/D Channel Data Register*/
    struct {
    __I  uint32_t DAT0;                       	/*!< (@ 0x40000020) A/D Channel Data Register 0*/
    __I  uint32_t DAT1;                       	/*!< (@ 0x40000024) A/D Channel Data Register 1*/
    __I  uint32_t DAT2;                       	/*!< (@ 0x40000028) A/D Channel Data Register 2*/
    __I  uint32_t DAT3;                       	/*!< (@ 0x4000002C) A/D Channel Data Register 3*/
    __I  uint32_t DAT4;                       	/*!< (@ 0x40000030) A/D Channel Data Register 4*/
    __I  uint32_t DAT5;                       	/*!< (@ 0x40000034) A/D Channel Data Register 5*/
    __I  uint32_t DAT6;                       	/*!< (@ 0x40000038) A/D Channel Data Register 6*/
    __I  uint32_t DAT7;                       	/*!< (@ 0x4000003C) A/D Channel Data Register 7*/
    __I  uint32_t DAT8;                       	/*!< (@ 0x40000040) A/D Channel Data Register 8*/
    __I  uint32_t DAT9;                       	/*!< (@ 0x40000044) A/D Channel Data Register 9*/
    __I  uint32_t DAT10;                      	/*!< (@ 0x40000048) A/D Channel Data Register 10*/
    __I  uint32_t DAT11;                      	/*!< (@ 0x4000004C) A/D Channel Data Register 11*/
    };
  };
  union {
  __IO uint32_t THR_LOW[2];
    struct {
    __IO uint32_t THR0_LOW;                  /*!< (@ 0x40000050) A/D Low Threhold Register 0. */
    __IO uint32_t THR1_LOW;                  /*!< (@ 0x40000054) A/D Low Threhold Register 1. */
    };
  };
  union {
  __IO uint32_t THR_HIGH[2];
    struct {
    __IO uint32_t THR0_HIGH;                 /*!< (@ 0x40000058) A/D High Threhold Register 0. */
    __IO uint32_t THR1_HIGH;                 /*!< (@ 0x4000005C) A/D High Threhold Register 1. */
    };
  };
  __IO uint32_t CHAN_THRSEL;               /*!< (@ 0x40000060) A/D Channel Threhold Select Register. */
  __IO uint32_t INTEN;                     /*!< (@ 0x40000064) A/D Interrupt Enable Register. */
  __IO uint32_t FLAGS;                     /*!< (@ 0x40000068) A/D Interrupt Request Flags Register. */
  __IO uint32_t TRM;                       /*!< (@ 0x4000006C) A/D Trim Register. */
} LPC_ADC_TypeDef;


// ------------------------------------------------------------------------------------------------
// -----                                          DAC                                         -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC15xx D/A Converter Modification date=3/16/2011 Major revision=0 Minor revision=3  (PMU)
  */

typedef struct {                            /*!< (@ 0x40004000) DAC Structure          */
  __IO uint32_t  VAL;                       /*!< (@ 0x40004000) D/A control register   */
  __IO uint32_t  CTRL;                      /*!< (@ 0x40004004) D/A control register   */
  __IO uint32_t  CNTVAL;                    /*!< (@ 0x40004008) D/A control register   */
} LPC_DAC_TypeDef;


// ------------------------------------------------------------------------------------------------
// -----                                          QEI                                         -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10430 Chapter title=LPC18xx Quadrature Encoder Interface (QEI) Modification date=1/18/2011 Major revision=0 Minor revision=7  (QEI)
  */

typedef struct {                            /*!< (@ 0x40058000) QEI Structure          */
  __O  uint32_t CON;                        /*!< (@ 0x40058000) Control register       */
  __I  uint32_t STAT;                       /*!< (@ 0x40058004) Encoder status register */
  __IO uint32_t CONF;                       /*!< (@ 0x40058008) Configuration register */
  __I  uint32_t POS;                        /*!< (@ 0x4005800C) Position register      */
  __IO uint32_t MAXPOS;                     /*!< (@ 0x40058010) Maximum position register */
  __IO uint32_t CMPOS0;                     /*!< (@ 0x40058014) position compare register 0 */
  __IO uint32_t CMPOS1;                     /*!< (@ 0x40058018) position compare register 1 */
  __IO uint32_t CMPOS2;                     /*!< (@ 0x4005801C) position compare register 2 */
  __I  uint32_t INXCNT;                     /*!< (@ 0x40058020) Index count register   */
  __IO uint32_t INXCMP0;                    /*!< (@ 0x40058024) Index compare register 0 */
  __IO uint32_t LOAD;                       /*!< (@ 0x40058028) Velocity timer reload register */
  __I  uint32_t TIME;                       /*!< (@ 0x4005802C) Velocity timer register */
  __I  uint32_t VEL;                        /*!< (@ 0x40058030) Velocity counter register */
  __I  uint32_t CAP;                        /*!< (@ 0x40058034) Velocity capture register */
  __IO uint32_t VELCOMP;                    /*!< (@ 0x40058038) Velocity compare register */
  __IO uint32_t FILTERPHA;                  /*!< (@ 0x4005803C) Digital filter register on input phase A (QEI_A) */
  __IO uint32_t FILTERPHB;                  /*!< (@ 0x40058040) Digital filter register on input phase B (QEI_B) */
  __IO uint32_t FILTERINX;                  /*!< (@ 0x40058044) Digital filter register on input index (QEI_IDX) */
  __IO uint32_t WINDOW;                     /*!< (@ 0x40058048) Index acceptance window register */
  __IO uint32_t INXCMP1;                    /*!< (@ 0x4005804C) Index compare register 1 */
  __IO uint32_t INXCMP2;                    /*!< (@ 0x40058050) Index compare register 2 */
  __I  uint32_t RESERVED0[993];
  __O  uint32_t IEC;                        /*!< (@ 0x40058FD8) Interrupt enable clear register */
  __O  uint32_t IES;                        /*!< (@ 0x40058FDC) Interrupt enable set register */
  __I  uint32_t INTSTAT;                    /*!< (@ 0x40058FE0) Interrupt status register */
  __I  uint32_t IE;                         /*!< (@ 0x40058FE4) Interrupt enable register */
  __O  uint32_t CLR;                        /*!< (@ 0x40058FE8) Interrupt status clear register */
  __O  uint32_t SET;                        /*!< (@ 0x40058FEC) Interrupt status set register */
} LPC_QEI_TypeDef;


// ------------------------------------------------------------------------------------------------
// -----                                          PMU                                         -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x Power Management Unit (PMU) Modification date=3/16/2011 Major revision=0 Minor revision=3  (PMU)
  */

typedef struct {                            /*!< (@ 0x40038000) PMU Structure          */
  __IO uint32_t PCON;                       /*!< (@ 0x40038000) Power control register */
  union{
  __IO uint32_t GPREG[5];                   /*!< (@ 0x40038004) General purpose register 0 */
  struct{
  __IO uint32_t GPREG0;                   	/*!< (@ 0x40038004) General purpose register 0 */
  __IO uint32_t GPREG1;                   	/*!< (@ 0x40038008) General purpose register 1 */
  __IO uint32_t GPREG2;                   	/*!< (@ 0x4003800C) General purpose register 2 */
  __IO uint32_t GPREG3;                   	/*!< (@ 0x40038010) General purpose register 3 */
  __IO uint32_t GPREG4;                   	/*!< (@ 0x4003801C) General purpose register 4 */
  };
  };
} LPC_PMU_TypeDef;


/**
  * @brief Product name title=UM10462 Chapter title=LPC15xx Flash programming firmware Major revision=0 Minor revision=3  (NVMC)
  */
typedef struct {                            /*!< (@ 0x40040000) NVMC Structure    */
  __I  uint32_t RESERVED0[4];
  __IO uint32_t FLASHCFG;                   /*!< (@ 0x40040010) Flash memory access time configuration register */
  __I  uint32_t RESERVED1[3];
  __IO uint32_t FMSSTART;                   /*!< (@ 0x40040020) Signature start address register */
  __IO uint32_t FMSSTOP;                    /*!< (@ 0x40040024) Signature stop-address register */
  __I  uint32_t RESERVED2[1];
  __I  uint32_t FMSW0;                      /*!< (@ 0x4004002C) Word 0 [31:0]          */
  __I  uint32_t FMSW1;                      /*!< (@ 0x40040030) Word 1 [63:32]         */
  __I  uint32_t FMSW2;                      /*!< (@ 0x40040034) Word 2 [95:64]         */
  __I  uint32_t FMSW3;                      /*!< (@ 0x40040038) Word 3 [127:96]        */
  __I  uint32_t RESERVED3[1001];
  __I  uint32_t FMSTAT;                     /*!< (@ 0x40040FE0) Signature generation status register */
  __I  uint32_t RESERVED4[1];
  __IO uint32_t FMSTATCLR;                  /*!< (@ 0x40040FE8) Signature generation status clear register */
} LPC_FMC_TypeDef;
/*@}*/ /* end of group LPC15xx_NVMC */

// ------------------------------------------------------------------------------------------------
// -----                                       IOCONFIG                                       -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC15xx I/O configuration Modification date=3/16/2011 Major revision=0 Minor revision=3  (IOCONFIG)
  */

typedef struct {                            /*!< (@ 0x40044000) IOCONFIG Structure     */
  __IO uint32_t PIO0_0;                     /*!< (@ 0x40044000) I/O configuration for pin PIO0_0 */
  __IO uint32_t PIO0_1;                     /*!< (@ 0x40044004) I/O configuration for pin PIO0_1 */
  __IO uint32_t PIO0_2;                     /*!< (@ 0x40044008) I/O configuration for pin PIO0_2 */
  __IO uint32_t PIO0_3;                     /*!< (@ 0x4004400C) I/O configuration for pin PIO0_3 */
  __IO uint32_t PIO0_4;                     /*!< (@ 0x40044010) I/O configuration for pin PIO0_4 */
  __IO uint32_t PIO0_5;                     /*!< (@ 0x40044014) I/O configuration for pin PIO0_5 */
  __IO uint32_t PIO0_6;                     /*!< (@ 0x40044018) I/O configuration for pin PIO0_6 */
  __IO uint32_t PIO0_7;                     /*!< (@ 0x4004401C) I/O configuration for pin PIO0_7 */
  __IO uint32_t PIO0_8;                     /*!< (@ 0x40044020) I/O configuration for pin PIO0_8 */
  __IO uint32_t PIO0_9;                     /*!< (@ 0x40044024) I/O configuration for pin PIO0_9 */
  __IO uint32_t PIO0_10;                    /*!< (@ 0x40044028) I/O configuration for pin PIO0_10 */
  __IO uint32_t PIO0_11;                    /*!< (@ 0x4004402C) I/O configuration for pin PIO0_11 */
  __IO uint32_t PIO0_12;                    /*!< (@ 0x40044030) I/O configuration for pin PIO0_12 */
  __IO uint32_t PIO0_13;                    /*!< (@ 0x40044034) I/O configuration for pin PIO0_13 */
  __IO uint32_t PIO0_14;                    /*!< (@ 0x40044038) I/O configuration for pin PIO0_14 */
  __IO uint32_t PIO0_15;                    /*!< (@ 0x4004403C) I/O configuration for pin PIO0_15 */
  __IO uint32_t PIO0_16;                    /*!< (@ 0x40044040) I/O configuration for pin PIO0_16 */
  __IO uint32_t PIO0_17;                    /*!< (@ 0x40044044) I/O configuration for pin PIO0_17 */
  __IO uint32_t PIO0_18;                    /*!< (@ 0x40044048) I/O configuration for pin PIO0_18 */
  __IO uint32_t PIO0_19;                    /*!< (@ 0x4004404C) I/O configuration for pin PIO0_19 */
  __IO uint32_t PIO0_20;                    /*!< (@ 0x40044050) I/O configuration for pin PIO0_20 */
  __IO uint32_t PIO0_21;                    /*!< (@ 0x40044054) I/O configuration for pin PIO0_21 */
  __IO uint32_t PIO0_22;                    /*!< (@ 0x40044058) I/O configuration for pin PIO0_22 */
  __IO uint32_t PIO0_23;                    /*!< (@ 0x4004405C) I/O configuration for pin PIO0_23 */
  __IO uint32_t PIO0_24;                    /*!< (@ 0x40044060) I/O configuration for pin PIO0_24 */
  __IO uint32_t PIO0_25;                    /*!< (@ 0x40044064) I/O configuration for pin PIO0_25 */
  __IO uint32_t PIO0_26;                    /*!< (@ 0x40044068) I/O configuration for pin PIO0_26 */
  __IO uint32_t PIO0_27;                    /*!< (@ 0x4004406C) I/O configuration for pin PIO0_27 */
  __IO uint32_t PIO0_28;                    /*!< (@ 0x40044070) I/O configuration for pin PIO0_28 */
  __IO uint32_t PIO0_29;                    /*!< (@ 0x40044074) I/O configuration for pin PIO0_29 */
  __IO uint32_t PIO0_30;                    /*!< (@ 0x40044078) I/O configuration for pin PIO0_30 */
  __IO uint32_t PIO0_31;                    /*!< (@ 0x4004407C) I/O configuration for pin PIO0_31 */
  __IO uint32_t PIO1_0;                     /*!< Offset: 0x080 */
  __IO uint32_t PIO1_1;         
  __IO uint32_t PIO1_2;       
  __IO uint32_t PIO1_3;      
  __IO uint32_t PIO1_4;                     /*!< Offset: 0x090 */
  __IO uint32_t PIO1_5;                     
  __IO uint32_t PIO1_6;     
  __IO uint32_t PIO1_7;       
  __IO uint32_t PIO1_8;                     /*!< Offset: 0x0A0 */
  __IO uint32_t PIO1_9;        
  __IO uint32_t PIO1_10;        
  __IO uint32_t PIO1_11;       
  __IO uint32_t PIO1_12;                    /*!< Offset: 0x0B0 */
  __IO uint32_t PIO1_13;                   
  __IO uint32_t PIO1_14;                    
  __IO uint32_t PIO1_15;                    
  __IO uint32_t PIO1_16;                    /*!< (@ 0x400440C0) I/O configuration for pin PIO1_16 */
  __IO uint32_t PIO1_17;
  __IO uint32_t PIO1_18;
  __IO uint32_t PIO1_19;                    
  __IO uint32_t PIO1_20;                    /*!< (@ 0x400440D0) I/O configuration for pin PIO1_20 */
  __IO uint32_t PIO1_21;                    /*!< (@ 0x400440D4) I/O configuration for pin PIO1_21 */
  __IO uint32_t PIO1_22;                    /*!< (@ 0x400440D8) I/O configuration for pin PIO1_22 */
  __IO uint32_t PIO1_23;                    /*!< (@ 0x400440DC) I/O configuration for pin PIO1_23 */
  __IO uint32_t PIO1_24;                    /*!< (@ 0x400440E0) I/O configuration for pin PIO1_24 */
  __IO uint32_t PIO1_25;                    /*!< (@ 0x400440E4) I/O configuration for pin PIO1_25 */
  __IO uint32_t PIO1_26;                    /*!< (@ 0x400440E8) I/O configuration for pin PIO1_26 */
  __IO uint32_t PIO1_27;                    /*!< (@ 0x400440EC) I/O configuration for pin PIO1_27 */
  __IO uint32_t PIO1_28;                    /*!< (@ 0x400440F0) I/O configuration for pin PIO1_28 */
  __IO uint32_t PIO1_29;                    /*!< (@ 0x400440F4) I/O configuration for pin PIO1_29 */
  __IO uint32_t PIO1_30;                    /*!< (@ 0x400440FC) I/O configuration for pin PIO1_30 */
  __IO uint32_t PIO1_31;                    /*!< (@ 0x400440FC) I/O configuration for pin PIO1_31 */
  __IO uint32_t PIO2_0;                     /*!< (@ 0x40044100) I/O configuration for pin PIO2_0 */
  __IO uint32_t PIO2_1;                     /*!< (@ 0x40044104) I/O configuration for pin PIO2_1 */
  __IO uint32_t PIO2_2;                     /*!< (@ 0x40044108) I/O configuration for pin PIO2_2 */
  __IO uint32_t PIO2_3;                     /*!< (@ 0x4004410C) I/O configuration for pin PIO2_3 */
  __IO uint32_t PIO2_4;                     /*!< (@ 0x40044110) I/O configuration for pin PIO2_4 */
  __IO uint32_t PIO2_5;                     /*!< (@ 0x40044114) I/O configuration for pin PIO2_5 */
  __IO uint32_t PIO2_6;                     /*!< (@ 0x40044118) I/O configuration for pin PIO2_6 */
  __IO uint32_t PIO2_7;                     /*!< (@ 0x4004411C) I/O configuration for pin PIO2_7 */
  __IO uint32_t PIO2_8;                     /*!< (@ 0x40044120) I/O configuration for pin PIO2_8 */
  __IO uint32_t PIO2_9;                     /*!< (@ 0x40044124) I/O configuration for pin PIO2_9 */
  __IO uint32_t PIO2_10;                    /*!< (@ 0x40044128) I/O configuration for pin PIO2_10 */
  __IO uint32_t PIO2_11;                    /*!< (@ 0x4004412C) I/O configuration for pin PIO2_11 */
  __IO uint32_t PIO2_12;                    /*!< (@ 0x40044130) I/O configuration for pin PIO2_12 */
  __IO uint32_t PIO2_13;                    /*!< (@ 0x40044134) I/O configuration for pin PIO2_13 */
} LPC_IOCON_TypeDef;

// ------------------------------------------------------------------------------------------------
// -----                                       PIN_MUX                                       -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC15xx I/O Mux configuration Modification date=3/16/2011 Major revision=0 Minor revision=3  (IOCONFIG)
  */

typedef struct {                            /*!< (@ 0x40014000) PIN_MUX Structure     */
  union{
  __IO uint32_t SCT0_P_MUX[8];                  
  struct{
  __IO uint32_t SCT0_P_MUX0;                   	
  __IO uint32_t SCT0_P_MUX1;                   	
  __IO uint32_t SCT0_P_MUX2;                   	
  __IO uint32_t SCT0_P_MUX3;                   	
  __IO uint32_t SCT0_P_MUX4;
  __IO uint32_t SCT0_P_MUX5;                   	
  __IO uint32_t SCT0_P_MUX6;                   	
  __IO uint32_t SCT0_P_MUX7; 		
  };
  };
  union{
  __IO uint32_t SCT1_P_MUX[8];                  
  struct{
  __IO uint32_t SCT1_P_MUX0;                   	
  __IO uint32_t SCT1_P_MUX1;                   	
  __IO uint32_t SCT1_P_MUX2;                   	
  __IO uint32_t SCT1_P_MUX3;                   	
  __IO uint32_t SCT1_P_MUX4;
  __IO uint32_t SCT1_P_MUX5;                   	
  __IO uint32_t SCT1_P_MUX6;                   	
  __IO uint32_t SCT1_P_MUX7; 		
  };
  };
  union{
  __IO uint32_t SCT2_P_MUX[8];                  
  struct{
  __IO uint32_t SCT2_P_MUX0;                   	
  __IO uint32_t SCT2_P_MUX1;                   	
  __IO uint32_t SCT2_P_MUX2;                   	
  __IO uint32_t SCT2_P_MUX3;                   	
  __IO uint32_t SCT2_P_MUX4;
  __IO uint32_t SCT2_P_MUX5;                   	
  __IO uint32_t SCT2_P_MUX6;                   	
  __IO uint32_t SCT2_P_MUX7; 		
  };
  };
  union{
  __IO uint32_t SCT3_P_MUX[8];                  
  struct{
  __IO uint32_t SCT3_P_MUX0;                   	
  __IO uint32_t SCT3_P_MUX1;                   	
  __IO uint32_t SCT3_P_MUX2;                   	
  __IO uint32_t SCT3_P_MUX3;                   	
  __IO uint32_t SCT3_P_MUX4;
  __IO uint32_t SCT3_P_MUX5;                   	
  __IO uint32_t SCT3_P_MUX6;                   	
  __IO uint32_t SCT3_P_MUX7; 		
  };
  };
	     uint32_t RESERVED0[16];
  union{
  __IO uint32_t GPIO_INT_P_MUX[8];                  
  struct{
  __IO uint32_t GPIO_INT_P_MUX0;                   	
  __IO uint32_t GPIO_INT_P_MUX1;                   	
  __IO uint32_t GPIO_INT_P_MUX2;                   	
  __IO uint32_t GPIO_INT_P_MUX3;                   	
  __IO uint32_t GPIO_INT_P_MUX4;
  __IO uint32_t GPIO_INT_P_MUX5;                   	
  __IO uint32_t GPIO_INT_P_MUX6;                   	
  __IO uint32_t GPIO_INT_P_MUX7; 		
  };
  };
  union{
       uint32_t DMA_ITRIG_P_MUX[18];                  
  struct{
  __IO uint32_t DMA_ITRIG_P_MUX0;                   	
  __IO uint32_t DMA_ITRIG_P_MUX1;                   	
  __IO uint32_t DMA_ITRIG_P_MUX2;                   	
  __IO uint32_t DMA_ITRIG_P_MUX3;                   	
  __IO uint32_t DMA_ITRIG_P_MUX4;
  __IO uint32_t DMA_ITRIG_P_MUX5;                   	
  __IO uint32_t DMA_ITRIG_P_MUX6;                   	
  __IO uint32_t DMA_ITRIG_P_MUX7;
  __IO uint32_t DMA_ITRIG_P_MUX8;                   	
  __IO uint32_t DMA_ITRIG_P_MUX9;                   	
  __IO uint32_t DMA_ITRIG_P_MUX10;                   	
  __IO uint32_t DMA_ITRIG_P_MUX11;                   	
  __IO uint32_t DMA_ITRIG_P_MUX12;
  __IO uint32_t DMA_ITRIG_P_MUX13;                   	
  __IO uint32_t DMA_ITRIG_P_MUX14;                   	
  __IO uint32_t DMA_ITRIG_P_MUX15;
  __IO uint32_t DMA_ITRIG_P_MUX16;                   	
  __IO uint32_t DMA_ITRIG_P_MUX17;     		
  };
  };
	     uint32_t RESERVED1[6];
  union{
  __IO uint32_t DMA_OTIRG_P_MUX[8];                  
  struct{
  __IO uint32_t DMA_OTIRG_P_MUX0;                   	
  __IO uint32_t DMA_OTIRG_P_MUX1;                   	
  __IO uint32_t DMA_OTIRG_P_MUX2;                   	
  __IO uint32_t DMA_OTIRG_P_MUX3;                   	
  __IO uint32_t DMA_OTIRG_P_MUX4;
  __IO uint32_t DMA_OTIRG_P_MUX5;                   	
  __IO uint32_t DMA_OTIRG_P_MUX6;                   	
  __IO uint32_t DMA_OTIRG_P_MUX7; 		
  };
  };
  union{
  __IO uint32_t FREQ_ME_P_MUX[8];                  
  struct{
  __IO uint32_t FREQ_ME_P_MUX0;                   	
  __IO uint32_t FREQ_ME_P_MUX1;                   	
  __IO uint32_t FREQ_ME_P_MUX2;                   	
  __IO uint32_t FREQ_ME_P_MUX3;                   	
  __IO uint32_t FREQ_ME_P_MUX4;
  __IO uint32_t FREQ_ME_P_MUX5;                   	
  __IO uint32_t FREQ_ME_P_MUX6;                   	
  __IO uint32_t FREQ_ME_P_MUX7; 		
  };
  };
} LPC_PMUX_TypeDef;

// ------------------------------------------------------------------------------------------------
// -----                                        SYSCON                                        -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC15xx System control block Modification date=3/16/2011 Major revision=0 Minor revision=3  (SYSCON)
  */

typedef struct
{
  volatile unsigned int SYSMEMREMAP                              ; // (0x000)
  volatile unsigned int AHBMATPRIO                               ; // (0x004)
  volatile unsigned int AHBFUNPRIO                               ; // (0x008)
  volatile unsigned int AHBBUFEN0                                ; // (0x00C)
  volatile unsigned int AHBBUFEN1                                ; // (0x010)
  volatile unsigned int SYSTCKCAL                                ; // (0x014)
  volatile unsigned int IRQLATENCY                               ; // (0x018)
  volatile unsigned int NMISRC                                   ; // (0x01C)
  volatile unsigned int RESERVED1[8]                             ; 
  volatile unsigned int SYSRESSTAT                               ; // (0x040)
  volatile unsigned int PRESETCTRL0                              ; // (0x044)
  volatile unsigned int PRESETCTRL1                              ; // (0x048)
  volatile unsigned int PIOPORCAP0                               ; // (0x04C)
  volatile unsigned int PIOPORCAP1                               ; // (0x050)
  volatile unsigned int PIOPORCAP2                               ; // (0x054)
  volatile unsigned int RESERVED2[10]                             ; 
  volatile unsigned int MAINCLKSELA                              ; // (0x080)
  volatile unsigned int MAINCLKSELB                              ; // (0x084)
  volatile unsigned int USBCLKSEL                                ; // (0x088)
  volatile unsigned int ADCASYNCCLKSEL                           ; // (0x08C)
  volatile unsigned int RESERVED3                                ; 
  volatile unsigned int CLKOUTCLKSELA                            ; // (0x094)
  volatile unsigned int CLKOUTCLKSELB                            ; // (0x098)
  volatile unsigned int SPIFICLKSEL                              ; // (0x09C)
  volatile unsigned int SYSPLLCLKSEL                             ; // (0x0A0)
  volatile unsigned int USBPLLCLKSEL                             ; // (0x0A4)
  volatile unsigned int SCTPLLCLKSEL                             ; // (0x0A8)
  volatile unsigned int RESERVED4[5]                              ; 
  volatile unsigned int SYSAHBCLKDIV                             ; // (0x0C0)
  volatile unsigned int SYSAHBCLKCTRL0                           ; // (0x0C4)
  volatile unsigned int SYSAHBCLKCTRL1                           ; // (0x0C8)
  volatile unsigned int SYSTICKCLKDIV                            ; // (0x0CC)
  volatile unsigned int UARTCLKDIV                               ; // (0x0D0)
  volatile unsigned int IOCONCLKDIV                              ; // (0x0D4)
  volatile unsigned int TRACECLKDIV                              ; // (0x0D8)
  volatile unsigned int RESERVED5[4]                             ; 
  volatile unsigned int USBCLKDIV                                ; // (0x0EC)
  volatile unsigned int ADCASYNCCLKDIV                           ; // (0x0F0)
  volatile unsigned int RESERVED6                                ; 
  volatile unsigned int CLKOUTDIV                                ; // (0x0F8)
  volatile unsigned int SPIFICLKDIV                              ; // (0x0FC)
  volatile unsigned int RESERVED7[8]                             ; 
  volatile unsigned int FREQMECTRL                               ; // (0x120)
  volatile unsigned int FLASHCFG                                 ; // (0x124)
  volatile unsigned int FRGCTRL                                  ; // (0x128)
  volatile unsigned int USBCLKCTRL                               ; // (0x12C)
  volatile unsigned int USBCLKSTAT                               ; // (0x130)
  volatile unsigned int EZHINT                                   ; // (0x134)
  volatile unsigned int SCRATCHREG0                              ; // (0x138)
  volatile unsigned int SCRATCHREG1                              ; // (0x13C)
  volatile unsigned int SCRATCHREG2                              ; // (0x140)
  volatile unsigned int SCRATCHREG3                              ; // (0x144)
  volatile unsigned int RESERVED8[14]                            ; 
  volatile unsigned int BODCTRL                                  ; // (0x180)
  volatile unsigned int IRCCTRL                                  ; // (0x184)
  volatile unsigned int SYSOSCCTRL                               ; // (0x188)
  volatile unsigned int WDTOSCCTRL                               ; // (0x18C)
  volatile unsigned int RTCOSCCTRL                               ; // (0x190)
  volatile unsigned int PVTDCTRL                                 ; // (0x194)
  volatile unsigned int SYSPLLCTRL                               ; // (0x198)
  volatile unsigned int SYSPLLSTAT                               ; // (0x19C)
  volatile unsigned int USBPLLCTRL                               ; // (0x1A0)
  volatile unsigned int USBPLLSTAT                               ; // (0x1A4)
  volatile unsigned int SCTPLLCTRL                               ; // (0x1A8)
  volatile unsigned int SCTPLLSTAT                               ; // (0x1AC)
  volatile unsigned int RESERVED9[20]                            ; 
  volatile unsigned int PDSLEEPCFG                               ; // (0x200)
  volatile unsigned int PDAWAKECFG                               ; // (0x204)
  volatile unsigned int PDRUNCFG                                 ; // (0x208)
  volatile unsigned int RESERVED10[3]                            ; 
  volatile unsigned int STARTERP0                                ; // (0x218)
  volatile unsigned int STARTERP1                                ; // (0x21C)
  volatile unsigned int RESERVED11[54]                           ; 
  volatile unsigned int PDSAFTY                                  ; // (0x2F8)
  volatile unsigned int MAINCLKSAFETY                            ; // (0x2FC)
  volatile unsigned int RESERVED12[32]                           ; 
  volatile unsigned int ROMWSCTRL                                ; // (0x380)
  volatile unsigned int AUTOCGOR                                 ; // (0x384)
  volatile unsigned int GPIOPSYNC                                ; // (0x388)
  volatile unsigned int FMCRDDELAY                               ; // (0x38C)
  volatile unsigned int REGVCTRL0                                ; // (0x390)
  volatile unsigned int REGVCTRL1                                ; // (0x394)
  volatile unsigned int REGVPROT                                 ; // (0x398)
  volatile unsigned int FLASHREFCLKEN                            ; // (0x39C)
  volatile unsigned int RESERVED13[4]                            ; 
  volatile unsigned int DIE_ID                                   ; // (0x3B0)
  volatile unsigned int RESERVED14[9]                            ; 
  volatile unsigned int DEVCFGEESIZE                             ; // (0x3D8)
  volatile unsigned int DEVCFGROMSIZE                            ; // (0x3DC)
  volatile unsigned int DEVCFGFLASHSIZE                          ; // (0x3E0)
  volatile unsigned int DEVCFGLOCK                               ; // (0x3E4)
  volatile unsigned int DEVCFGRAMSIZE                            ; // (0x3E8)
  volatile unsigned int DEVCFGPERIPH                             ; // (0x3EC)
  volatile unsigned int DEVCFGSECPORT                            ; // (0x3F0)
  volatile unsigned int JTAG_IDCODE                              ; // (0x3F4)
  volatile unsigned int DEVICE_ID0                               ; // (0x3F8)
  volatile unsigned int DEVICE_ID1                               ; // (0x3FC)
} LPC_SYSCON_TypeDef;


/*------------- Switch Matrix Port --------------------------*/
/** @addtogroup LPC15xx_SWM LPC15xx Switch Matrix Port 
  @{
*/
typedef struct
{
  union {
    __IO uint32_t PINASSIGN[16];
    struct {
      __IO uint32_t PINASSIGN0;
      __IO uint32_t PINASSIGN1;
      __IO uint32_t PINASSIGN2;
      __IO uint32_t PINASSIGN3;
      __IO uint32_t PINASSIGN4;
      __IO uint32_t PINASSIGN5;
      __IO uint32_t PINASSIGN6;
      __IO uint32_t PINASSIGN7;
      __IO uint32_t PINASSIGN8;
      __IO uint32_t PINASSIGN9;
      __IO uint32_t PINASSIGN10;
      __IO uint32_t PINASSIGN11;
      __IO uint32_t PINASSIGN12;
      __IO uint32_t PINASSIGN13;
      __IO uint32_t PINASSIGN14;
      __IO uint32_t PINASSIGN15;
    };
  };
  __I  uint32_t RESERVED0[96];
	union {
    __IO uint32_t PINENABLE[2];					/* Also known as fixed pin */
    struct {
      __IO uint32_t PINENABLE0;
      __IO uint32_t PINENABLE1;
    };
  };
} LPC_SWM_TypeDef;
/*@}*/ /* end of group LPC15xx_SWM */


// ------------------------------------------------------------------------------------------------
// -----                                       GPIO_PORT                                      -----
// ------------------------------------------------------------------------------------------------

/**
  * @brief Product name title=UM10462 Chapter title=LPC15xx GPIO Modification date=3/17/2011 Major revision=0 Minor revision=3  (GPIO_PORT)
  */

typedef struct {                            
  union {
    struct {
      __IO uint8_t B0[32];                       /*!< (@ 0x0000) Byte pin registers port 0; pins PIO0_0 to PIO0_31 */
      __IO uint8_t B1[32];                       /*!< (@ 0x0020) Byte pin registers port 1 */
      __IO uint8_t B2[32];                       /*!< (@ 0x0040) Byte pin registers port 2 */
    };
    __IO uint8_t B[96];                          /*!< (@ 0x0000) Byte pin registers port 0/1/2 */
  };
  __I  uint32_t RESERVED0[1000];
  union {
    struct {
      __IO uint32_t W0[32];                      /*!< (@ 0x1000) Word pin registers port 0 */
      __IO uint32_t W1[32];                      /*!< (@ 0x1080) Word pin registers port 1 */
      __IO uint32_t W2[32];                      /*!< (@ 0x1100) Word pin registers port 2 */
    };
    __IO uint32_t W[96];                         /*!< (@ 0x1000) Word pin registers port 0/1/2 */
  };
       uint32_t RESERVED1[928];
  __IO uint32_t DIR[3];			/* 0x2000 */
       uint32_t RESERVED2[29];
  __IO uint32_t MASK[3];		/* 0x2080 */
       uint32_t RESERVED3[29];
  __IO uint32_t PIN[3];			/* 0x2100 */
       uint32_t RESERVED4[29];
  __IO uint32_t MPIN[3];		/* 0x2180 */
       uint32_t RESERVED5[29];
  __IO uint32_t SET[3];			/* 0x2200 */
       uint32_t RESERVED6[29];
  __O  uint32_t CLR[3];			/* 0x2280 */
       uint32_t RESERVED7[29];
  __O  uint32_t NOT[3];			/* 0x2300 */
} LPC_GPIO_TypeDef;


// ------------------------------------------------------------------------------------------------
// -----                                         GPIOn (same as GPIO_PORT, backward compatibility)                                        -----
// ------------------------------------------------------------------------------------------------

// Is a backward compatibility for struct members important: DIR/MASK/PIN/SET/CLR??? NOT is new.

typedef struct {
  __IO  uint32_t RESERVED1[2048];         //reserved for Byte pin (PB) and Word pin (PW) registers
  __IO uint32_t DIR;                       /*!< (@ 0x400F6000) Direction registers port n */
  __IO  uint32_t RESERVED2[31];            //reserved for port 1 ..7 (tricky)
  __IO uint32_t MASK;                      /*!< (@ 0x400F6080) Mask register port n */
  __IO  uint32_t RESERVED3[31];            //reserved for port 1 ..7 (tricky)
  __IO  uint32_t RESERVED4[32];            //Do not use GPIO port register due to non-masking
  __IO uint32_t PIN;                       /*!< (@ 0x400F6180) Masked port register port n */
  __IO  uint32_t RESERVED5[31];            //reserved for port 1 ..7 (tricky)
  __IO uint32_t SET;                       /*!< (@ 0x400F6200) Write: Set register for port n Read: output bits for port n */
  __IO  uint32_t RESERVED6[31];            //reserved for port 1 ..7 (tricky)
  __O  uint32_t CLR;                       /*!< (@ 0x400F6280) Clear port n */
  __IO  uint32_t RESERVED7[31];            //reserved for port 1 ..7 (tricky)
  __O  uint32_t NOT;                       /*!< (@ 0x400F6300) Toggle port n */
  __IO  uint32_t RESERVED8[31];            //reserved for port 1 ..7 (tricky)
  //to be expanded
} LPC_GPIOn_TypeDef;



// ------------------------------------------------------------------------------------------------
// -----                                     GPIO_INT                                     -----
// ------------------------------------------------------------------------------------------------

/**
  * @brief Product name title=UM10462 Chapter title=LPC15xx GPIO Modification date=3/17/2011 Major revision=0 Minor revision=3  (GPIO_INT)
  */

typedef struct {                            /*!< (@ 0xA0004000) GPIO_PIN_INT Structure */
  __IO uint32_t ISEL;                       /*!< (@ 0xA0004000) Pin Interrupt Mode register */
  __IO uint32_t IENR;                       /*!< (@ 0xA0004004) Pin Interrupt Enable (Rising) register */
  __IO uint32_t SIENR;                      /*!< (@ 0xA0004008) Set Pin Interrupt Enable (Rising) register */
  __IO uint32_t CIENR;                      /*!< (@ 0xA000400C) Clear Pin Interrupt Enable (Rising) register */
  __IO uint32_t IENF;                       /*!< (@ 0xA0004010) Pin Interrupt Enable Falling Edge / Active Level register */
  __IO uint32_t SIENF;                      /*!< (@ 0xA0004014) Set Pin Interrupt Enable Falling Edge / Active Level register */
  __IO uint32_t CIENF;                      /*!< (@ 0xA0004018) Clear Pin Interrupt Enable Falling Edge / Active Level address */
  __IO uint32_t RISE;                       /*!< (@ 0xA000401C) Pin Interrupt Rising Edge register */
  __IO uint32_t FALL;                       /*!< (@ 0xA0004020) Pin Interrupt Falling Edge register */
  __IO uint32_t IST;                        /*!< (@ 0xA0004024) Pin Interrupt Status register */
  __IO uint32_t PMCTRL;                     /*!< (@ 0xA0004028) GPIO pattern match interrupt control register          */
  __IO uint32_t PMSRC;                      /*!< (@ 0xA000402C) GPIO pattern match interrupt bit-slice source register */
  __IO uint32_t PMCFG;                      /*!< (@ 0xA0004030) GPIO pattern match interrupt bit slice configuration register */
} LPC_GPIO_INT_TypeDef;


/*------------- CRC Engine (CRC) -----------------------------------------*/
/** @addtogroup LPC15xx_CRC LPC15xx Comparator
  @{
*/
typedef struct
{
  __IO uint32_t MODE;
  __IO uint32_t SEED;
  union {
  __I  uint32_t SUM;
  __O  uint32_t WR_DATA_DWORD;
  __O  uint16_t WR_DATA_WORD;
       uint16_t RESERVED_WORD;
  __O  uint8_t WR_DATA_BYTE;
       uint8_t RESERVED_BYTE[3];
  };
} LPC_CRC_TypeDef;
/*@}*/ /* end of group LPC15xx_CRC */

/*------------- Comparator (CMP) --------------------------------------------------*/
/** @addtogroup LPC15xx_CMP LPC15xx Comparator
  @{
*/
typedef struct {
  __IO uint32_t CTRL;         // (0x00)
  __IO uint32_t CMP0;         // (0x04)
  __IO uint32_t CMPFILTR0;    // (0x08)
  __IO uint32_t CMP1;         // (0x0C)
  __IO uint32_t CMPFILTR1;    // (0x10)
  __IO uint32_t CMP2;         // (0x14)
  __IO uint32_t CMPFILTR2;    // (0x18)
  __IO uint32_t CMP3;         // (0x1C)
  __IO uint32_t CMPFILTR3;    // (0x20)
} LPC_COMP_TypeDef;

/*@}*/ /* end of group LPC15xx_CMP */


// ------------------------------------------------------------------------------------------------
// -----                                    GPIO_GROUP_INT0/1                                   -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC15xx GPIO Modification date=3/17/2011 Major revision=0 Minor revision=3  (GPIO_GROUP_INT0)
  */

typedef struct {                            /*!< (@ 0x4005C000) GPIO_GROUP_INT0 Structure */
  __IO uint32_t CTRL;                       /*!< (@ 0x4005C000) GPIO grouped interrupt control register */
  __I  uint32_t RESERVED0[7];
  __IO uint32_t PORT_POL[3];                /*!< (@ 0x4005C020) GPIO grouped interrupt port 0 polarity register */
  __I  uint32_t RESERVED1[5];
  __IO uint32_t PORT_ENA[3];                /*!< (@ 0x4005C040) GPIO grouped interrupt port 0/1 enable register */
} LPC_GPIO_GROUP_INTx_Type;



// ------------------------------------------------------------------------------------------------
// -----                                          USB                                         -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC15xx USB2.0device controller Modification date=3/16/2011 Major revision=0 Minor revision=3  (USB)
  */

typedef struct {                            /*!< (@ 0x40080000) USB Structure          */
  __IO uint32_t DEVCMDSTAT;                 /*!< (@ 0x40080000) USB Device Command/Status register */
  __IO uint32_t INFO;                       /*!< (@ 0x40080004) USB Info register      */
  __IO uint32_t EPLISTSTART;                /*!< (@ 0x40080008) USB EP Command/Status List start address */
  __IO uint32_t DATABUFSTART;               /*!< (@ 0x4008000C) USB Data buffer start address */
  __IO uint32_t LPM;                        /*!< (@ 0x40080010) Link Power Management register */
  __IO uint32_t EPSKIP;                     /*!< (@ 0x40080014) USB Endpoint skip      */
  __IO uint32_t EPINUSE;                    /*!< (@ 0x40080018) USB Endpoint Buffer in use */
  __IO uint32_t EPBUFCFG;                   /*!< (@ 0x4008001C) USB Endpoint Buffer Configuration register */
  __IO uint32_t INTSTAT;                    /*!< (@ 0x40080020) USB interrupt status register */
  __IO uint32_t INTEN;                      /*!< (@ 0x40080024) USB interrupt enable register */
  __IO uint32_t INTSETSTAT;                 /*!< (@ 0x40080028) USB set interrupt status register */
  __IO uint32_t INTROUTING;                 /*!< (@ 0x4008002C) USB interrupt routing register */
  __I  uint32_t RESERVED0[1];
  __I  uint32_t EPTOGGLE;                   /*!< (@ 0x40080034) USB Endpoint toggle register */
} LPC_USB_TypeDef;

/*------------- CAN Controller (CAN) ----------------------------*/
/** @addtogroup LPC15xx_CAN LPC15xx Controller Area Network(CAN) 
  @{
*/
typedef struct
{
  __IO uint32_t CNTL;				/* 0x000 */
  __IO uint32_t STAT;
  __IO uint32_t EC;
  __IO uint32_t BT;
  __IO uint32_t INT;
  __IO uint32_t TEST;
  __IO uint32_t BRPE;
       uint32_t RESERVED0;
  __IO uint32_t IF1_CMDREQ;			/* 0x020 */
  __IO uint32_t IF1_CMDMSK;
  __IO uint32_t IF1_MSK1;
  __IO uint32_t IF1_MSK2;
  __IO uint32_t IF1_ARB1;
  __IO uint32_t IF1_ARB2;
  __IO uint32_t IF1_MCTRL;
  __IO uint32_t IF1_DA1;
  __IO uint32_t IF1_DA2;
  __IO uint32_t IF1_DB1;
  __IO uint32_t IF1_DB2;
       uint32_t RESERVED1[13];   
  __IO uint32_t IF2_CMDREQ;			/* 0x080 */
  __IO uint32_t IF2_CMDMSK;
  __IO uint32_t IF2_MSK1;
  __IO uint32_t IF2_MSK2;
  __IO uint32_t IF2_ARB1;
  __IO uint32_t IF2_ARB2;
  __IO uint32_t IF2_MCTRL;
  __IO uint32_t IF2_DA1;
  __IO uint32_t IF2_DA2;
  __IO uint32_t IF2_DB1;
  __IO uint32_t IF2_DB2;
       uint32_t RESERVED2[21];
  __I  uint32_t TXREQ1;				/* 0x100 */
  __I  uint32_t TXREQ2;
       uint32_t RESERVED3[6];
  __I  uint32_t ND1;				/* 0x120 */
  __I  uint32_t ND2;
       uint32_t RESERVED4[6];
  __I  uint32_t IR1;				/* 0x140 */
  __I  uint32_t IR2;
       uint32_t RESERVED5[6];
  __I  uint32_t MSGV1;				/* 0x160 */
  __I  uint32_t MSGV2;
       uint32_t RESERVED6[6];
  __IO uint32_t CLKDIV;				/* 0x180 */
} LPC_CAN_TypeDef;
/*@}*/ /* end of group LPC15xx_CAN */

/*------------- DMA Controller (DMA) ----------------------------*/
/** @addtogroup LPC15xx_DMA LPC15xx DMA Controller(DNA) 
  @{
*/
typedef struct {                            /*!< (@ 0x4004C000) SDMA Structure    */
  __IO uint32_t CTRL;					/* 0x00 */                    
  __I  uint32_t INTSTAT;                   
  __IO uint32_t SRAMBASE;
       uint32_t RESERVED0[5];                   
  __IO uint32_t ENABLESET0;				/* 0x20 */           
  __IO uint32_t ENABLESET1;
  __O  uint32_t ENABLECLR0;
  __O  uint32_t ENABLECLR1;
  __I  uint32_t ACTIVE0;					/* 0x30 */        
  __I  uint32_t ACTIVE1;        
  __I  uint32_t BUSY0;      
  __I  uint32_t BUSY1;    
  __IO uint32_t ERRINT0;					/* 0x40 */        
  __IO uint32_t ERRINT1;    
  __IO uint32_t INTENSET0;         
  __IO uint32_t INTENSET1;
  __O  uint32_t INTENCLR0;				/* 0x50 */         
  __O  uint32_t INTENCLR1;
  __IO uint32_t INTA0;        
  __IO uint32_t INTA1;        
  __IO uint32_t INTB0;					/* 0x60 */      
  __IO uint32_t INTB1;
  __O  uint32_t SETVALID0;         
  __O  uint32_t SETVALID1;
  __O  uint32_t SETTRIG0;				/* 0x70 */        
  __O  uint32_t SETTRIG1;        
  __O  uint32_t ABORT0;      
  __O  uint32_t ABORT1;			 			           
} LPC_DMA_TypeDef;

typedef struct
{
  __IO uint32_t CFG;          // 0x000
  __I  uint32_t CTLSTAT;      // 0x004
  __IO uint32_t XFERCFG;      // 0x008
       uint32_t RESERVED;     // 0x00C
} LPC_DMA_Channel;

/*@}*/ /* end of group LPC15xx_DMA */

#if defined ( __CC_ARM   )
  #pragma no_anon_unions
#endif

/******************************************************************************/
/*                         Peripheral memory map                              */
/******************************************************************************/
/* Base addresses                                                             */
#define LPC_FLASH_BASE        (0x00000000UL)
#define LPC_RAM0_BASE         (0x02000000UL)
#define LPC_RAM1_BASE         (0x02400000UL)
#define LPC_RAM2_BASE         (0x02800000UL)
#define LPC_ROM_BASE          (0x03000000UL)
#define LPC_APB0_BASE         (0x40000000UL)
#define LPC_AHB_BASE          (0x10000000UL)

/* APB0 peripherals */
#define LPC_ADC0_BASE         (LPC_APB0_BASE + 0x00000)
#define LPC_DAC_BASE          (LPC_APB0_BASE + 0x04000)
#define LPC_CMP_BASE          (LPC_APB0_BASE + 0x08000)
#define LPC_PMUX_BASE         (LPC_APB0_BASE + 0x14000)
#define LPC_RTC_BASE          (LPC_APB0_BASE + 0x28000)
#define LPC_WWDT_BASE         (LPC_APB0_BASE + 0x2C000)
#define LPC_SWM_BASE          (LPC_APB0_BASE + 0x38000)
#define LPC_PMU_BASE          (LPC_APB0_BASE + 0x3C000)
#define LPC_UART0_BASE        (LPC_APB0_BASE + 0x40000)
#define LPC_UART1_BASE        (LPC_APB0_BASE + 0x44000)
#define LPC_LSPI0_BASE        (LPC_APB0_BASE + 0x48000)
#define LPC_LSPI1_BASE        (LPC_APB0_BASE + 0x4C000)
#define LPC_I2C_BASE          (LPC_APB0_BASE + 0x50000)
#define LPC_QEI_BASE          (LPC_APB0_BASE + 0x58000)
#define LPC_SYSCON_BASE       (LPC_APB0_BASE + 0x74000)

/* APB1 peripherals */
#define LPC_ADC1_BASE         (LPC_APB0_BASE + 0x80000)
#define LPC_MRT_BASE          (LPC_APB0_BASE + 0xA0000)
#define LPC_GPIO_INT_BASE     (LPC_APB0_BASE + 0xA4000)
#define LPC_GRP0_INT_BASE     (LPC_APB0_BASE + 0xA8000)
#define LPC_GRP1_INT_BASE     (LPC_APB0_BASE + 0xAC000)

#define LPC_RIT_BASE          (LPC_APB0_BASE + 0xB4000)
#define LPC_SCT_IPU_BASE      (LPC_APB0_BASE + 0xB8000)
#define LPC_FMC_BASE          (LPC_APB0_BASE + 0xBC000)
#define LPC_UART2_BASE        (LPC_APB0_BASE + 0xC0000)
#define LPC_PVT_BASE          (LPC_APB0_BASE + 0xE8000)
#define LPC_CAN_BASE          (LPC_APB0_BASE + 0xF0000)
#define LPC_IOCON_BASE        (LPC_APB0_BASE + 0xF8000)
#define LPC_EECTRL_BASE       (LPC_APB0_BASE + 0xFC000)

/* AHB peripherals                                                            */
#define LPC_NVMC_BASE        (LPC_FLASH_BASE + 0x01000000)
#define LPC_EE_BASE          (LPC_FLASH_BASE + 0x03200000)

#define LPC_GPIO_BASE        (LPC_AHB_BASE + 0x0C000000)
#define LPC_USB_BASE         (LPC_AHB_BASE + 0x0C00C000)
#define LPC_CRC_BASE         (LPC_AHB_BASE + 0x0C010000)
#define LPC_SCT0_BASE        (LPC_AHB_BASE + 0x0C018000)
#define LPC_SCT1_BASE        (LPC_AHB_BASE + 0x0C01C000)
#define LPC_SCT2_BASE        (LPC_AHB_BASE + 0x0C020000)
#define LPC_SCT3_BASE        (LPC_AHB_BASE + 0x0C024000)

#define LPC_DMA_BASE         (LPC_AHB_BASE + 0x0C004000)
#define LPC_DMA_CH_BASE      (LPC_DMA_BASE + 0x00000400)

/******************************************************************************/
/*                         Peripheral declaration                             */
/******************************************************************************/
#define LPC_WWDT              ((LPC_WWDT_TypeDef   *) LPC_WWDT_BASE  )
#define LPC_RIT               ((LPC_RIT_TypeDef    *) LPC_RIT_BASE   )
#define LPC_MRT               ((LPC_MRT_TypeDef    *) LPC_MRT_BASE   )
#define LPC_ADC0              ((LPC_ADC_TypeDef    *) LPC_ADC0_BASE  )
#define LPC_ADC1              ((LPC_ADC_TypeDef    *) LPC_ADC1_BASE  )
#define LPC_DAC               ((LPC_DAC_TypeDef    *) LPC_DAC_BASE   )

#define LPC_RTC               ((LPC_RTC_TypeDef    *) LPC_RTC_BASE   )
#define LPC_SWM               ((LPC_SWM_TypeDef    *) LPC_SWM_BASE   )
#define LPC_PMU               ((LPC_PMU_TypeDef    *) LPC_PMU_BASE   )
#define LPC_CMP               ((LPC_COMP_TypeDef   *) LPC_CMP_BASE   )
#define LPC_PMUX              ((LPC_PMUX_TypeDef   *) LPC_PMUX_BASE  )

#define LPC_FMC               ((LPC_FMC_TypeDef    *) LPC_FMC_BASE   )
#define LPC_IOCON             ((LPC_IOCON_TypeDef  *) LPC_IOCON_BASE )
#define LPC_SYSCON            ((LPC_SYSCON_TypeDef *) LPC_SYSCON_BASE)
#define LPC_I2C               ((LPC_I2C_TypeDef    *) LPC_I2C_BASE   )
#define LPC_QEI               ((LPC_QEI_TypeDef    *) LPC_QEI_BASE   )
#define LPC_CAN               ((LPC_CAN_TypeDef    *) LPC_CAN_BASE   )
#define LPC_SPI0              ((LPC_SPI_TypeDef    *) LPC_LSPI0_BASE  )
#define LPC_SPI1              ((LPC_SPI_TypeDef    *) LPC_LSPI1_BASE  )
#define LPC_UART0             ((LPC_UART_TypeDef   *) LPC_UART0_BASE )
#define LPC_UART1             ((LPC_UART_TypeDef   *) LPC_UART1_BASE )
#define LPC_UART2             ((LPC_UART_TypeDef   *) LPC_UART2_BASE )

#define LPC_CRC               ((LPC_CRC_TypeDef    *) LPC_CRC_BASE   )
#define LPC_SCT_IPU           ((LPC_SCT_IPU_TypeDef *) LPC_SCT_IPU_BASE)
#define LPC_SCT0              ((LPC_SCT_TypeDef    *) LPC_SCT0_BASE   )
#define LPC_SCT1              ((LPC_SCT_TypeDef    *) LPC_SCT1_BASE   )
#define LPC_SCT2              ((LPC_SCT_TypeDef    *) LPC_SCT2_BASE   )
#define LPC_SCT3              ((LPC_SCT_TypeDef    *) LPC_SCT3_BASE   )

#define LPC_USB               ((LPC_USB_TypeDef    *) LPC_USB_BASE   )

#define LPC_GPIO              ((LPC_GPIO_TypeDef   *) LPC_GPIO_BASE  )
#define LPC_GPIO0             ((LPC_GPIOn_TypeDef   *) LPC_GPIO_BASE )		// who ever heard of backward compatability
#define LPC_GPIO1             ((LPC_GPIOn_TypeDef   *) (LPC_GPIO_BASE+4) )		
#define LPC_GPIO2             ((LPC_GPIOn_TypeDef   *) (LPC_GPIO_BASE+8) )		
#define LPC_GPIO3             ((LPC_GPIOn_TypeDef   *) (LPC_GPIO_BASE+12) )		
#define LPC_GPIO_PIN_INT      ((LPC_GPIO_INT_TypeDef   *) LPC_GPIO_INT_BASE  )
#define LPC_GPIO_GROUP_INT0   ((LPC_GPIO_GROUP_INTx_Type *) LPC_GRP0_INT_BASE  )
#define LPC_GPIO_GROUP_INT1   ((LPC_GPIO_GROUP_INTx_Type *) LPC_GRP1_INT_BASE  )

#define LPC_DMA               ((LPC_DMA_TypeDef    *) LPC_DMA_BASE   )
#define LPC_DMA_CH(i)         ((LPC_DMA_Channel    *)(LPC_DMA_CH_BASE + ((i)<<4)))


/* AHB/APB Clock 0 enable bits for peripherals on H2 */
#define     EN0_ROM0        (1<<1)
#define     EN0_RAM1        (1<<3)
#define     EN0_RAM2        (1<<4)
#define     EN0_FLASH       (1<<7)
#define     EN0_FMC         (1<<8)
#define     EN0_EE          (1<<9)
#define     EN0_P_MUX       (1<<11)
#define     EN0_SWM         (1<<12)
#define     EN0_IOCON       (1<<13)
#define     EN0_GPIO0       (1<<14)
#define     EN0_GPIO1       (1<<15)
#define     EN0_GPIO2       (1<<16)
#define     EN0_GPIO_INT    (1<<18)
#define     EN0_GPIO_GINT   (1<<19)
#define     EN0_DMA         (1<<20)
#define     EN0_CRC         (1<<21)
#define     EN0_WDT         (1<<22)
#define     EN0_RTC         (1<<23)
#define     EN0_ADC0        (1<<27)
#define     EN0_ADC1        (1<<28)
#define     EN0_DAC0        (1<<29)
#define     EN0_COMP        (1<<30)

/* AHB/APB Clock 1 enable bits for peripherals on H2 */
#define     EN1_MRT         (1<<0)
#define     EN1_RIT         (1<<1)
#define     EN1_SCT0        (1<<2)
#define     EN1_SCT1        (1<<3)
#define     EN1_SCT2        (1<<4)
#define     EN1_SCT3        (1<<5)
#define     EN1_SCT_IPU     (1<<6)
#define     EN1_CAN         (1<<7)
#define     EN1_SPI0        (1<<9)
#define     EN1_SPI1        (1<<10)
#define     EN1_I2C         (1<<13)
#define     EN1_UART0       (1<<17)
#define     EN1_UART1       (1<<18)
#define     EN1_UART2       (1<<19)
#define     EN1_QEI         (1<<21)
#define     EN1_USB         (1<<23)
#define     EN1_PVT         (1<<28)
#define     EN1_BODY_BIAS   (1<<29)
#define     EN1_EZH         (1<<31)

/* PDRUNCFG bit info. */
#define     PDEN_MAIN_CLK   (1<<0)
#define     PDEN_MAIN_REG   (1<<1)
#define     PDEN_MAIN_REG_LP (1<<2)
#define     PDEN_IRC_OSC    (1<<3)
#define     PDEN_DIE_IRC    (1<<4)
#define     PDEN_IRC        (PDEN_IRC_OSC | PDEN_DIE_IRC)
#define     PDEN_FLASH      (1<<5)
#define     PDEN_EE         (1<<6)
#define     PDEN_BOD        (1<<8)
#define     PDEN_USB_PHY    (1<<9)
#define     PDEN_ADC0       (1<<10)
#define     PDEN_ADC1       (1<<11)
#define     PDEN_DAC0       (1<<12)
#define     PDEN_COMP0      (1<<13)
#define     PDEN_COMP1      (1<<14)
#define     PDEN_COMP2      (1<<15)
#define     PDEN_COMP3      (1<<16)
#define     PDEN_IREF       (1<<17)
#define     PDEN_TEMP_SENSE (1<<18)
#define     PDEN_VDDA_DIV   (1<<19)
#define     PDEN_WDT_OSC    (1<<20)
#define     PDEN_SYS_OSC    (1<<21)
#define     PDEN_SYS_PLL    (1<<22)
#define     PDEN_USB_PLL    (1<<23)
#define     PDEN_SCT_PLL    (1<<24)

#ifdef __cplusplus
}
#endif 


#endif  // __LPC15XX_H__
