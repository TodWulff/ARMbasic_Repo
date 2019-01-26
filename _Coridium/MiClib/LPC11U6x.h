
/****************************************************************************************************//**
 * @file     LPC11U6x.h
 *
 *
 * @brief    CMSIS Cortex-M0 Core Peripheral Access Layer Header File for
 *           default LPC11U6x Device Series
 *
 * @version  V0.1
 * @date     21. March 2011
 *
 * @note     Generated with SFDGen V2.6 Build 3j (beta) on Thursday, 17.03.2011 13:19:45
 *
 *           from CMSIS SVD File 'LPC11U1x_svd.xml' Version 0.1,
 *           created on Wednesday, 16.03.2011 20:30:42, last modified on Thursday, 17.03.2011 20:19:40
 *
 *******************************************************************************************************/

 #define DISABLE_JTAG		// normal state is to define this -- those pins are used in the product
 
//NOTE changed all USART to UART. mar

/** @addtogroup NXP
  * @{
  */

/** @addtogroup LPC11U6x
  * @{
  */

#ifndef __LPC11U6X_H__
#define __LPC11U6X_H__

#ifdef __cplusplus
extern "C" {
#endif 

#if defined ( __CC_ARM   )
  #pragma anon_unions
#endif

#ifndef CORE_M0PLUS                                                     /*!< Cortex core                    */
  #define CORE_M0PLUS
#endif

 /* Interrupt Number Definition */

typedef enum {
// -------------------------  Cortex-M0 Processor Exceptions Numbers  -----------------------------
  Reset_IRQn                        = -15,  /*!<   1  Reset Vector, invoked on Power up and warm reset */
  NonMaskableInt_IRQn               = -14,  /*!<   2  Non maskable Interrupt, cannot be stopped or preempted */
  HardFault_IRQn                    = -13,  /*!<   3  Hard Fault, all classes of Fault */
  SVCall_IRQn                       = -5,   /*!<  11  System Service Call via SVC instruction */
  DebugMonitor_IRQn                 = -4,   /*!<  12  Debug Monitor                    */
  PendSV_IRQn                       = -2,   /*!<  14  Pendable request for system service */
  SysTick_IRQn                      = -1,   /*!<  15  System Tick Timer                */
// ---------------------------  LPC11U6x Specific Interrupt Numbers  ------------------------------
  PININT0_IRQn                  = 0,        /*!< All I/O pins can be routed to below 8 interrupts. */
  PININT1_IRQn                  = 1,
  PININT2_IRQn                  = 2,
  PININT3_IRQn                  = 3,
  PININT4_IRQn                  = 4,   
  PININT5_IRQn                  = 5,        
  PININT6_IRQn                  = 6,        
  PININT7_IRQn                  = 7,        
  GINT0_IRQn                    = 8,        /*!< Grouped Interrupt 0                              */
  GINT1_IRQn                    = 9,        /*!< Grouped Interrupt 1                              */
  I2C1_IRQn                     = 10,       /*!< Reserved Interrupt                               */
  UART1_4_IRQn                  = 11,       
  UART2_3_IRQn                  = 12,       
  SCT0_1_IRQn                   = 13,       
  SSP1_IRQn                     = 14,       /*!< SSP1 Interrupt                                   */
  I2C_IRQn                      = 15,       /*!< I2C Interrupt                                    */
  TIMER_16_0_IRQn               = 16,       /*!< 16-bit Timer0 Interrupt                          */
  TIMER_16_1_IRQn               = 17,       /*!< 16-bit Timer1 Interrupt                          */
  TIMER_32_0_IRQn               = 18,       /*!< 32-bit Timer0 Interrupt                          */
  TIMER_32_1_IRQn               = 19,       /*!< 32-bit Timer1 Interrupt                          */
  SSP0_IRQn                     = 20,       /*!< SSP0 Interrupt                                   */
  UART0_IRQn                    = 21,       /*!< UART Interrupt                                   */
  USB_IRQn                      = 22,       /*!< USB IRQ Interrupt                                */
  USB_FIQn                      = 23,       /*!< USB FIQ Interrupt                                */
  ADC_IRQn                      = 24,       /*!< A/D Converter Interrupt                          */
  WDT_IRQn                      = 25,       /*!< Watchdog timer Interrupt                         */  
  BOD_IRQn                      = 26,       /*!< Brown Out Detect(BOD) Interrupt                  */
  FMC_IRQn                      = 27,       /*!< Flash Memory Controller Interrupt                */
  DMA_IRQn                      = 28,       /*!< Reserved Interrupt                               */
  ADC_B_IRQn                    = 29,       /*!< Reserved Interrupt                               */
  USBWakeup_IRQn                = 30,       /*!< USB wakeup Interrupt                             */
  Reserved6_IRQn                = 31,       /*!< Reserved Interrupt                               */
} IRQn_Type;

// aka for UARTs
#define UART1_IRQn UART1_4_IRQn
#define UART4_IRQn UART1_4_IRQn
#define UART2_IRQn UART2_3_IRQn
#define UART3_IRQn UART2_3_IRQn

/** @addtogroup Configuration_of_CMSIS
  * @{
  */

/* Processor and Core Peripheral Section */ /* Configuration of the Cortex-M0 Processor and Core Peripherals */

#define __MPU_PRESENT             0         /*!< MPU present or not                    */
#define __NVIC_PRIO_BITS          2         /*!< Number of Bits used for Priority Levels */
#define __Vendor_SysTickConfig    0         /*!< Set to 1 if different SysTick Config is used */
/** @} */ /* End of group Configuration_of_CMSIS */

#include "core_cm0plus.h"                       /*!< Cortex-M0 processor and core peripherals */
#include "system_LPC11U6x.h"                /*!< LPC11U6x System                       */

/** @addtogroup Device_Peripheral_Registers
  * @{
  */


// ------------------------------------------------------------------------------------------------
// -----                                          I2C                                         -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x I2C-bus controller Modification date=3/16/2011 Major revision=0 Minor revision=3  (I2C)
  */

typedef struct {                            /*!< (@ 0x40000000) I2C Structure          */
  __IO uint32_t CONSET;                     /*!< (@ 0x40000000) I2C Control Set Register */
  __I  uint32_t STAT;                       /*!< (@ 0x40000004) I2C Status Register */
  __IO uint32_t DAT;                        /*!< (@ 0x40000008) I2C Data Register.  */
  __IO uint32_t ADR0;                       /*!< (@ 0x4000000C) I2C Slave Address Register 0 */
  __IO uint32_t SCLH;                       /*!< (@ 0x40000010) SCH Duty Cycle Register High Half Word */
  __IO uint32_t SCLL;                       /*!< (@ 0x40000014) SCL Duty Cycle Register Low Half Word */
  __IO uint32_t CONCLR;                     /*!< (@ 0x40000018) I2C Control Clear Register*/
  __IO uint32_t MMCTRL;                     /*!< (@ 0x4000001C) Monitor mode control register*/
  __IO uint32_t ADR1;                       /*!< (@ 0x40000020) I2C Slave Address Register 1*/
  __IO uint32_t ADR2;                       /*!< (@ 0x40000024) I2C Slave Address Register 2*/
  __IO uint32_t ADR3;                       /*!< (@ 0x40000028) I2C Slave Address Register 3*/
  __I  uint32_t DATA_BUFFER;                /*!< (@ 0x4000002C) Data buffer register */
union{
  __IO uint32_t MASK[4];                    /*!< (@ 0x40000030) I2C Slave address mask register */
  struct{
  __IO uint32_t MASK0;
  __IO uint32_t MASK1;
  __IO uint32_t MASK2;
  __IO uint32_t MASK3;
  };
  };
} LPC_I2C_TypeDef;


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
// -----                                         USART                                        -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x USART Modification date=3/16/2011 Major revision=0 Minor revision=3  (USART)
  */

typedef struct {                            /*!< (@ 0x40008000) USART Structure        */
  
  union {
    __IO uint32_t DLL;                      /*!< (@ 0x40008000) Divisor Latch LSB. Least significant byte of the baud rate divisor value. The full divisor is used to generate a baud rate from the fractional rate divider. (DLAB=1) */
    __O  uint32_t THR;                      /*!< (@ 0x40008000) Transmit Holding Register. The next character to be transmitted is written here. (DLAB=0) */
    __I  uint32_t RBR;                      /*!< (@ 0x40008000) Receiver Buffer Register. Contains the next received character to be read. (DLAB=0) */
  };
  
  union {
    __IO uint32_t IER;                      /*!< (@ 0x40008004) Interrupt Enable Register. Contains individual interrupt enable bits for the 7 potential USART interrupts. (DLAB=0) */
    __IO uint32_t DLM;                      /*!< (@ 0x40008004) Divisor Latch MSB. Most significant byte of the baud rate divisor value. The full divisor is used to generate a baud rate from the fractional rate divider. (DLAB=1) */
  };
  
  union {
    __O  uint32_t FCR;                      /*!< (@ 0x40008008) FIFO Control Register. Controls USART FIFO usage and modes. */
    __I  uint32_t IIR;                      /*!< (@ 0x40008008) Interrupt ID Register. Identifies which interrupt(s) are pending. */
  };
  __IO uint32_t LCR;                        /*!< (@ 0x4000800C) Line Control Register. Contains controls for frame formatting and break generation. */
  __IO uint32_t MCR;                        /*!< (@ 0x40008010) Modem Control Register. */
  __I  uint32_t LSR;                        /*!< (@ 0x40008014) Line Status Register. Contains flags for transmit and receive status, including line errors. */
  __I  uint32_t MSR;                        /*!< (@ 0x40008018) Modem Status Register. */
  __IO uint32_t SCR;                        /*!< (@ 0x4000801C) Scratch Pad Register. Eight-bit temporary storage for software. */
  __IO uint32_t ACR;                        /*!< (@ 0x40008020) Auto-baud Control Register. Contains controls for the auto-baud feature. */
  __IO uint32_t ICR;                        /*!< (@ 0x40008024) IrDA Control Register. Enables and configures the IrDA (remote control) mode. */
  __IO uint32_t FDR;                        /*!< (@ 0x40008028) Fractional Divider Register. Generates a clock input for the baud rate divider. */
  __IO uint32_t OSR;                        /*!< (@ 0x4000802C) Oversampling Register. Controls the degree of oversampling during each bit time. */
  __IO uint32_t TER;                        /*!< (@ 0x40008030) Transmit Enable Register. Turns off USART transmitter for use with software flow control. */
  __I  uint32_t RESERVED0[3];
  __IO uint32_t HDEN;                       /*!< (@ 0x40008040) Half duplex enable register. */
  __I  uint32_t RESERVED1;
  __IO uint32_t SCICTRL;                    /*!< (@ 0x40008048) Smart Card Interface Control register. Enables and configures the Smart Card Interface feature. */
  __IO uint32_t RS485CTRL;                  /*!< (@ 0x4000804C) RS-485/EIA-485 Control. Contains controls to configure various aspects of RS-485/EIA-485 modes. */
  __IO uint32_t RS485ADRMATCH;              /*!< (@ 0x40008050) RS-485/EIA-485 address match. Contains the address match value for RS-485/EIA-485 mode. */
  __IO uint32_t RS485DLY;                   /*!< (@ 0x40008054) RS-485/EIA-485 direction control delay. */
  __IO uint32_t SYNCCTRL; 
} LPC_UART_TypeDef;


// ------------------------------------------------------------------------------------------------
// -----                                        Timer                                       -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x 32-bitcounter/timers CT32B0/1 Modification date=3/16/2011 Major revision=0 Minor revision=3  
  */

typedef struct {                            /*!< (@ 0x40014000) CT32B0 Structure        */
  __IO uint32_t IR;                         /*!< (@ 0x40014000) Interrupt Register      */
  __IO uint32_t TCR;                        /*!< (@ 0x40014004) Timer Control Register  */
  __IO uint32_t TC;                         /*!< (@ 0x40014008) Timer Counter 		*/
  __IO uint32_t PR;                         /*!< (@ 0x4001400C) Prescale Register  	*/
  __IO uint32_t PC;                         /*!< (@ 0x40014010) Prescale Counter	 */
  __IO uint32_t MCR;                        /*!< (@ 0x40014014) Match Control Register */
  union {
  __IO uint32_t MR[4];                      /*!< (@ 0x40014018) Match Register */
  struct{
  __IO uint32_t MR0;                        /*!< (@ 0x40018018) Match Register. MR0 */
  __IO uint32_t MR1;                        /*!< (@ 0x4001801C) Match Register. MR1 */
  __IO uint32_t MR2;                        /*!< (@ 0x40018020) Match Register. MR2 */
  __IO uint32_t MR3;                        /*!< (@ 0x40018024) Match Register. MR3 */
  };
  };
  __IO uint32_t CCR;                        /*!< (@ 0x40014028) Capture Control Register */
  union{
  __I  uint32_t CR[4];                      /*!< (@ 0x4001402C) Capture Register  */
    struct{
  __I  uint32_t CR0;			    /*!< (@ 0x4001802C) Capture Register. CR 0 */
  __I  uint32_t CR1;			    /*!< (@ 0x40018030) Capture Register. CR 1 */
  __I  uint32_t CR2;			    /*!< (@ 0x40018034) Capture Register. CR 2 */
  __I  uint32_t CR3;			    /*!< (@ 0x40018038) Capture Register. CR 3 */
  };
  };
__IO uint32_t EMR;                        /*!< (@ 0x4001403C) External Match Register */
  __I  uint32_t RESERVED0[12];
  __IO uint32_t CTCR;                       /*!< (@ 0x40014070) Count Control Register */
  __IO uint32_t PWMC;                       /*!< (@ 0x40014074) PWM Control Register */
} LPC_CTxxBx_TypeDef;



// ------------------------------------------------------------------------------------------------
// -----                                          ADC                                         -----
// ------------------------------------------------------------------------------------------------

/**
 * @brief ADC register block structure
 */
typedef struct {								/*!< ADCn Structure */
	__IO uint32_t CTRL;							/*!< A/D Control Register. The AD0CR register must be written to select the operating mode before A/D conversion can occur. */
	__I  uint32_t RESERVED0;
	__IO uint32_t SEQ_CTRL[2];	                /*!< A/D Sequence A & B Control Register. Controls triggering and channel selection for sonversion sequence. */
	__IO uint32_t SEQ_GDAT[2];	                /*!< A/D Sequence A & B Global Data Register. Contains the result of the most recent A/D conversion for sequence. */
	__I  uint32_t RESERVED1[2];
	__I  uint32_t DAT[12];						/*!< A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
	__IO uint32_t THR_LOW[2];					/*!< A/D Low Compare Threshold Register 0 & 1. Contains the lower threshold level for automatic threshold comparison. */
	__IO uint32_t THR_HIGH[2];					/*!< A/D High Compare Threshold Register 0 & 1. Contains the higher threshold level for automatic threshold comparison. */
	__IO uint32_t CHAN_THRSEL;					/*!< A/D Channel Threshold Select Register. Specifies which set of threshold compare registers to use. */
	__IO uint32_t INTEN;						/*!< A/D Interrupt Enable Register. This register contains enable bits that enable sequence-A, sequence-B, threshold compare and overrun interrupts. */
	__IO uint32_t FLAGS;						/*!< A/D Flags Register. This register contains interrupt flags. - To be checked */
	__IO uint32_t TRM;							/*!< A/D Trim Register. */
} LPC_ADC_TypeDef;


// ------------------------------------------------------------------------------------------------
// -----                                          PMU                                         -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x Power Management Unit (PMU) Modification date=3/16/2011 Major revision=0 Minor revision=3  (PMU)
  */

typedef struct {                            /*!< (@ 0x40038000) PMU Structure          */
  __IO uint32_t PCON;                       /*!< (@ 0x40038000) Power control register */
  union{
  __IO uint32_t GPREG[4];                   /*!< (@ 0x40038004) General purpose register 0 */
  struct{
  __IO uint32_t GPREG0;                   	/*!< (@ 0x40038004) General purpose register 0 */
  __IO uint32_t GPREG1;                   	/*!< (@ 0x40038008) General purpose register 1 */
  __IO uint32_t GPREG2;                   	/*!< (@ 0x4003800C) General purpose register 2 */
  __IO uint32_t GPREG3;                   	/*!< (@ 0x40038010) General purpose register 3 */
  };
  };
} LPC_PMU_TypeDef;


// ------------------------------------------------------------------------------------------------
// -----                                       FLASHCTRL                                      -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x Flash programming firmware Modification date=3/17/2011 Major revision=0 Minor revision=3  (FLASHCTRL)
  */

typedef struct {                            /*!< (@ 0x4003C000) FLASHCTRL Structure    */
  __I  uint32_t RESERVED0[4];
  __IO uint32_t FLASHCFG;                   /*!< (@ 0x4003C010) Flash memory access time configuration register */
  __I  uint32_t RESERVED1[3];
  __IO uint32_t FMSSTART;                   /*!< (@ 0x4003C020) Signature start address register */
  __IO uint32_t FMSSTOP;                    /*!< (@ 0x4003C024) Signature stop-address register */
  __I  uint32_t RESERVED2[1];
  __I  uint32_t FMSW0;                      /*!< (@ 0x4003C02C) Word 0 [31:0]          */
  __I  uint32_t FMSW1;                      /*!< (@ 0x4003C030) Word 1 [63:32]         */
  __I  uint32_t FMSW2;                      /*!< (@ 0x4003C034) Word 2 [95:64]         */
  __I  uint32_t FMSW3;                      /*!< (@ 0x4003C038) Word 3 [127:96]        */
  __I  uint32_t RESERVED3[1001];
  __I  uint32_t FMSTAT;                     /*!< (@ 0x4003CFE0) Signature generation status register */
  __I  uint32_t RESERVED4[1];
  __IO uint32_t FMSTATCLR;                  /*!< (@ 0x4003CFE8) Signature generation status clear register */
} LPC_FLASHCTRL_TypeDef;


// ------------------------------------------------------------------------------------------------
// -----                                         SSP0/1                                         -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x SSP/SPI Modification date=3/16/2011 Major revision=0 Minor revision=3  (SSP0)
  */

typedef struct {                            /*!< (@ 0x40040000) SSP0 Structure         */
  __IO uint32_t CR0;                        /*!< (@ 0x40040000) Control Register 0. Selects the serial clock rate, bus type, and data size. */
  __IO uint32_t CR1;                        /*!< (@ 0x40040004) Control Register 1. Selects master/slave and other modes. */
  __IO uint32_t DR;                         /*!< (@ 0x40040008) Data Register. Writes fill the transmit FIFO, and reads empty the receive FIFO. */
  __I  uint32_t SR;                         /*!< (@ 0x4004000C) Status Register        */
  __IO uint32_t CPSR;                       /*!< (@ 0x40040010) Clock Prescale Register */
  __IO uint32_t IMSC;                       /*!< (@ 0x40040014) Interrupt Mask Set and Clear Register */
  __I  uint32_t RIS;                        /*!< (@ 0x40040018) Raw Interrupt Status Register */
  __I  uint32_t MIS;                        /*!< (@ 0x4004001C) Masked Interrupt Status Register */
  __IO uint32_t ICR;                        /*!< (@ 0x40040020) SSPICR Interrupt Clear Register */
	// same as LPC407x or LPC17xx except no DMACR
} LPC_SSPx_TypeDef;



// ------------------------------------------------------------------------------------------------
// -----                                       IOCONFIG                                       -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x I/O configuration Modification date=3/16/2011 Major revision=0 Minor revision=3  (IOCONFIG)
  */

typedef struct {                            /*!< (@ 0x40044000) IOCONFIG Structure     */
  __IO uint32_t RESET_PIO0_0;               /*!< (@ 0x40044000) I/O configuration for pin RESET/PIO0_0 */
  __IO uint32_t PIO0_1;                     /*!< (@ 0x40044004) I/O configuration for pin PIO0_1/CLKOUT/CT32B0_MAT2/USB_FTOGGLE */
  __IO uint32_t PIO0_2;                     /*!< (@ 0x40044008) I/O configuration for pin PIO0_2/SSEL0/CT16B0_CAP0 */
  __IO uint32_t PIO0_3;                     /*!< (@ 0x4004400C) I/O configuration for pin PIO0_3/USB_VBUS */
  __IO uint32_t PIO0_4;                     /*!< (@ 0x40044010) I/O configuration for pin PIO0_4/SCL */
  __IO uint32_t PIO0_5;                     /*!< (@ 0x40044014) I/O configuration for pin PIO0_5/SDA */
  __IO uint32_t PIO0_6;                     /*!< (@ 0x40044018) I/O configuration for pin PIO0_6/USB_CONNECT/SCK0 */
  __IO uint32_t PIO0_7;                     /*!< (@ 0x4004401C) I/O configuration for pin PIO0_7/CTS */
  __IO uint32_t PIO0_8;                     /*!< (@ 0x40044020) I/O configuration for pin PIO0_8/MISO0/CT16B0_MAT0 */
  __IO uint32_t PIO0_9;                     /*!< (@ 0x40044024) I/O configuration for pin PIO0_9/MOSI0/CT16B0_MAT1 */
  __IO uint32_t SWCLK_PIO0_10;              /*!< (@ 0x40044028) I/O configuration for pin SWCLK/PIO0_10/ SCK0/CT16B0_MAT2 */
  __IO uint32_t TDI_PIO0_11;                /*!< (@ 0x4004402C) I/O configuration for pin TDI/PIO0_11/AD0/CT32B0_MAT3 */
  __IO uint32_t TMS_PIO0_12;                /*!< (@ 0x40044030) I/O configuration for pin TMS/PIO0_12/AD1/CT32B1_CAP0 */
  __IO uint32_t TDO_PIO0_13;                /*!< (@ 0x40044034) I/O configuration for pin TDO/PIO0_13/AD2/CT32B1_MAT0 */
  __IO uint32_t TRST_PIO0_14;               /*!< (@ 0x40044038) I/O configuration for pin TRST/PIO0_14/AD3/CT32B1_MAT1 */
  __IO uint32_t SWDIO_PIO0_15;              /*!< (@ 0x4004403C) I/O configuration for pin SWDIO/PIO0_15/AD4/CT32B1_MAT2 */
  __IO uint32_t PIO0_16;                    /*!< (@ 0x40044040) I/O configuration for pin PIO0_16/AD5/CT32B1_MAT3/ WAKEUP */
  __IO uint32_t PIO0_17;                    /*!< (@ 0x40044044) I/O configuration for pin PIO0_17/RTS/CT32B0_CAP0/SCLK */
  __IO uint32_t PIO0_18;                    /*!< (@ 0x40044048) I/O configuration for pin PIO0_18/RXD/CT32B0_MAT0 */
  __IO uint32_t PIO0_19;                    /*!< (@ 0x4004404C) I/O configuration for pin PIO0_19/TXD/CT32B0_MAT1 */
  __IO uint32_t PIO0_20;                    /*!< (@ 0x40044050) I/O configuration for pin PIO0_20/CT16B1_CAP0 */
  __IO uint32_t PIO0_21;                    /*!< (@ 0x40044054) I/O configuration for pin PIO0_21/CT16B1_MAT0/MOSI1 */
  __IO uint32_t PIO0_22;                    /*!< (@ 0x40044058) I/O configuration for pin PIO0_22/AD6/CT16B1_MAT1/MISO1 */
  __IO uint32_t PIO0_23;                    /*!< (@ 0x4004405C) I/O configuration for pin PIO0_23/AD7 */
  __IO uint32_t PIO1_0;                 /*!< Offset: 0x060 */
  __IO uint32_t PIO1_1;         
  __IO uint32_t PIO1_2;       
  __IO uint32_t PIO1_3;      
  __IO uint32_t PIO1_4;                 /*!< Offset: 0x070 */
  __IO uint32_t PIO1_5;                     /*!< (@ 0x40044074) I/O configuration for pin PIO1_5/CT32B1_CAP1 */
  __IO uint32_t PIO1_6;     
  __IO uint32_t PIO1_7;       
  __IO uint32_t PIO1_8;                 /*!< Offset: 0x080 */
  __IO uint32_t PIO1_9;        
  __IO uint32_t PIO1_10;        
  __IO uint32_t PIO1_11;       
  __IO uint32_t PIO1_12;                /*!< Offset: 0x090 */
  __IO uint32_t PIO1_13;                    /*!< (@ 0x40044094) I/O configuration for pin PIO1_13/DTR/CT16B0_MAT0/TXD */
  __IO uint32_t PIO1_14;                    /*!< (@ 0x40044098) I/O configuration for pin PIO1_14/DSR/CT16B0_MAT1/RXD */
  __IO uint32_t PIO1_15;                    /*!< (@ 0x4004409C) I/O configuration for pin PIO1_15/DCD/ CT16B0_MAT2/SCK1 */
  __IO uint32_t PIO1_16;                    /*!< (@ 0x400440A0) I/O configuration for pin PIO1_16/RI/CT16B0_CAP0 */
  __IO uint32_t PIO1_17;
  __IO uint32_t PIO1_18;
  __IO uint32_t PIO1_19;                    /*!< (@ 0x400440AC) I/O configuration for pin PIO1_19/DTR/SSEL1 */
  __IO uint32_t PIO1_20;                    /*!< (@ 0x400440B0) I/O configuration for pin PIO1_20/DSR/SCK1 */
  __IO uint32_t PIO1_21;                    /*!< (@ 0x400440B4) I/O configuration for pin PIO1_21/DCD/MISO1 */
  __IO uint32_t PIO1_22;                    /*!< (@ 0x400440B8) I/O configuration for pin PIO1_22/RI/MOSI1 */
  __IO uint32_t PIO1_23;                    /*!< (@ 0x400440BC) I/O configuration for pin PIO1_23/CT16B1_MAT1/SSEL1 */
  __IO uint32_t PIO1_24;                    /*!< (@ 0x400440C0) I/O configuration for pin PIO1_24/ CT32B0_MAT0 */
  __IO uint32_t PIO1_25;                    /*!< (@ 0x400440C4) I/O configuration for pin PIO1_25/CT32B0_MAT1 */
  __IO uint32_t PIO1_26;                    /*!< (@ 0x400440C8) I/O configuration for pin PIO1_26/CT32B0_MAT2/ RXD */
  __IO uint32_t PIO1_27;                    /*!< (@ 0x400440CC) I/O configuration for pin PIO1_27/CT32B0_MAT3/ TXD */
  __IO uint32_t PIO1_28;                    /*!< (@ 0x400440D0) I/O configuration for pin PIO1_28/CT32B0_CAP0/ SCLK */
  __IO uint32_t PIO1_29;                    /*!< (@ 0x400440D4) I/O configuration for pin PIO1_29/SCK0/ CT32B0_CAP1 */
  __IO uint32_t PIO1_30;
  __IO uint32_t PIO1_31;                    /*!< (@ 0x400440DC) I/O configuration for pin PIO1_31 */
  __IO uint32_t RESERVED0;
  __IO uint32_t RESERVED1;
  __IO uint32_t RESERVED2;
  __IO uint32_t RESERVED3;
  __IO uint32_t PIO2_0;                 /*!< Offset: 0x060 */
  __IO uint32_t PIO2_1;         
  __IO uint32_t RESERVED4;
  __IO uint32_t PIO2_2;       
  __IO uint32_t PIO2_3;      
  __IO uint32_t PIO2_4;                 /*!< Offset: 0x070 */
  __IO uint32_t PIO2_5;                     /*!< (@ 0x40044074) I/O configuration for pin PIO1_5/CT32B1_CAP1 */
  __IO uint32_t PIO2_6;     
  __IO uint32_t PIO2_7;       
  __IO uint32_t PIO2_8;                 /*!< Offset: 0x080 */
  __IO uint32_t PIO2_9;        
  __IO uint32_t PIO2_10;        
  __IO uint32_t PIO2_11;       
  __IO uint32_t PIO2_12;                /*!< Offset: 0x090 */
  __IO uint32_t PIO2_13;                    /*!< (@ 0x40044094) I/O configuration for pin PIO1_13/DTR/CT16B0_MAT0/TXD */
  __IO uint32_t PIO2_14;                    /*!< (@ 0x40044098) I/O configuration for pin PIO1_14/DSR/CT16B0_MAT1/RXD */
  __IO uint32_t PIO2_15;                    /*!< (@ 0x4004409C) I/O configuration for pin PIO1_15/DCD/ CT16B0_MAT2/SCK1 */
  __IO uint32_t PIO2_16;                    /*!< (@ 0x400440A0) I/O configuration for pin PIO1_16/RI/CT16B0_CAP0 */
  __IO uint32_t PIO2_17;
  __IO uint32_t PIO2_18;
  __IO uint32_t PIO2_19;                    /*!< (@ 0x400440AC) I/O configuration for pin PIO1_19/DTR/SSEL1 */
  __IO uint32_t PIO2_20;                    /*!< (@ 0x400440B0) I/O configuration for pin PIO1_20/DSR/SCK1 */
  __IO uint32_t PIO2_21;                    /*!< (@ 0x400440B4) I/O configuration for pin PIO1_21/DCD/MISO1 */
  __IO uint32_t PIO2_22;                    /*!< (@ 0x400440B8) I/O configuration for pin PIO1_22/RI/MOSI1 */
  __IO uint32_t PIO2_23;                    /*!< (@ 0x400440BC) I/O configuration for pin PIO1_23/CT16B1_MAT1/SSEL1 */
} LPC_IOCON_TypeDef;


// ------------------------------------------------------------------------------------------------
// -----                                        SYSCON                                        -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x System control block Modification date=3/16/2011 Major revision=0 Minor revision=3  (SYSCON)
  */

typedef struct {                   /* old names           !<(@ 0x40048000) SYSCON Structure       */
 	__IO uint32_t  SYSMEMREMAP;	   /*SYSMEMREMAP;    */	/*!< System Memory remap register */
	__IO uint32_t  PRESETCTRL;	   /*PRESETCTRL;     */	/*!< Peripheral reset Control register */
	__IO uint32_t  SYSPLLCTRL;	   /*SYSPLLCTRL;     */	/*!< System PLL control register */
	__I  uint32_t  SYSPLLSTAT;	   /*SYSPLLSTAT;     */	/*!< System PLL status register */
	__IO uint32_t  USBPLLCTRL;	   /*USBPLLCTRL;     */	/*!< USB PLL control register */
	__I  uint32_t  USBPLLSTAT;	   /*USBPLLSTAT;     */	/*!< USB PLL status register */
	__I  uint32_t  RESERVED1[1];   /*RESERVED0[2];   */
	__IO uint32_t  RTCOSCCTRL;	   /*xx              */	/*!< RTC Oscillator control register */
	__IO uint32_t  SYSOSCCTRL;	   /*SYSOSCCTRL;     */	/*!< System Oscillator control register */
	__IO uint32_t  WDTOSCCTRL;	   /*WDTOSCCTRL;     */	/*!< Watchdog Oscillator control register */
	__I  uint32_t  RESERVED2[2];   /*RESERVED1[2];   */
	__IO uint32_t  SYSRESSTAT;	   /*SYSRESSTAT;     */	/*!< System Reset Status register */
	__I  uint32_t  RESERVED3[3];   /*RESERVED2[3];   */
	__IO uint32_t  SYSPLLCLKSEL;   /*SYSPLLCLKSEL;   */	/*!< System PLL clock source select register */
	__IO uint32_t  SYSPLLCLKUEN;   /*SYSPLLCLKUEN;   */	/*!< System PLL clock source update enable register*/
	__IO uint32_t  USBPLLCLKSEL;   /*USBPLLCLKSEL;   */	/*!< USB PLL clock source select register */
	__IO uint32_t  USBPLLCLKUEN;   /*USBPLLCLKUEN;   */	/*!< USB PLL clock source update enable register */
	__I  uint32_t  RESERVED4[8];   /*RESERVED3[8];   */
	__IO uint32_t  MAINCLKSEL;	   /*MAINCLKSEL;     */	/*!< Main clock source select register */
	__IO uint32_t  MAINCLKUEN;	   /*MAINCLKUEN;     */	/*!< Main clock source update enable register */
	__IO uint32_t  SYSAHBCLKDIV;   /*SYSAHBCLKDIV;   */	/*!< System Clock divider register */
	__I  uint32_t  RESERVED5;	   /*RESERVED4[1];   */
	__IO uint32_t  SYSAHBCLKCTRL;  /*SYSAHBCLKCTRL;  */	/*!< System clock control register */
	__I  uint32_t  RESERVED6[4];   /*RESERVED5[4];   */
	__IO uint32_t  SSP0CLKDIV;	   /*SSP0CLKDIV;     */	/*!< SSP0 clock divider register */
	__IO uint32_t  UARTCLKDIV;     /*UARTCLKDIV;     */	/*!< UART clock divider register */
	__IO uint32_t  SSP1CLKDIV;	   /*SSP1CLKDIV;     */	/*!< SSP1 clock divider register */
	__IO uint32_t  FRGCLKDIV;	   /*xx              */	/*!< FRG clock divider (USARTS 1 - 4) register */
	__I  uint32_t  RESERVED7[7];   /*RESERVED6[8];   */
	__IO uint32_t  USBCLKSEL;	   /*USBCLKSEL;      */	/*!< USB clock source select register */
	__IO uint32_t  USBCLKUEN;	   /*USBCLKUEN;      */	/*!< USB clock source update enable register */
	__IO uint32_t  USBCLKDIV;	   /*USBCLKDIV;      */	/*!< USB clock source divider register */
	__I  uint32_t  RESERVED8[5];   /*RESERVED7[5];   */
	__IO uint32_t  CLKOUTSEL;	   /*CLKOUTSEL;      */	/*!< Clock out source select register */
	__IO uint32_t  CLKOUTUEN;	   /*CLKOUTUEN;      */	/*!< Clock out source update enable register */
	__IO uint32_t  CLKOUTDIV;	   /*CLKOUTDIV;      */	/*!< Clock out divider register */
	__I  uint32_t  RESERVED9;	   /*RESERVED8[5];   */
	__IO uint32_t  UARTFRGDIV;	   /*xx              */	/*!< USART fractional generator divider (USARTS 1 - 4) register */
	__IO uint32_t  UARTFRGMULT;	   /*xx              */	/*!< USART fractional generator multiplier (USARTS 1 - 4) register */
	__I  uint32_t  RESERVED10;	   /*xx              */
	__IO uint32_t  EXTTRACECMD;	   /*xx              */	/*!< External trace buffer command register */
	__I  uint32_t  PIOPORCAP[3];   /*PIOPORCAP0;     */	/*!< POR captured PIO status registers */
	__I  uint32_t  RESERVED11[10]; /*PIOPORCAP1;     */
	__IO uint32_t  IOCONCLKDIV[7]; /*RESERVED9[18];  */	/*!< IOCON block for programmable glitch filter divider registers */
	__IO uint32_t  BODCTRL;		   /*BODCTRL;        */	/*!< Brown Out Detect register */
	__IO uint32_t  SYSTCKCAL;	   /*SYSTCKCAL;      */	/*!< System tick counter calibration register */
	__I  uint32_t  RESERVED12[6];  /*RESERVED10[6];  */
	__IO uint32_t  IRQLATENCY;	   /*IRQLATENCY;     */	/*!< IRQ delay register */
	__IO uint32_t  NMISRC;		   /*NMISRC;         */	/*!< NMI source control register */
	__IO uint32_t  PINTSEL[8];	   /*PINTSEL[8];     */	/*!< GPIO pin interrupt select register 0-7 */
	__IO uint32_t  USBCLKCTRL;	   /*USBCLKCTRL;     */	/*!< USB clock control register */
	__I  uint32_t  USBCLKST;	   /*USBCLKST;       */	/*!< USB clock status register */
	__I  uint32_t  RESERVED13[25]; /*RESERVED11[25]; */
	__IO uint32_t  STARTERP0;	   /*STARTERP0;      */	/*!< Start logic 0 interrupt wake-up enable register */
	__I  uint32_t  RESERVED14[3];  /*RESERVED12[3];  */
	__IO uint32_t  STARTERP1;	   /*STARTERP1;      */	/*!< Start logic 1 interrupt wake-up enable register */
	__I  uint32_t  RESERVED15[6];  /*RESERVED13[6];  */
	__IO uint32_t  PDSLEEPCFG;	   /*PDSLEEPCFG;     */	/*!< Power down states in deep sleep mode register */
	__IO uint32_t  PDWAKECFG;	   /*PDAWAKECFG;     */	/*!< Power down states in wake up from deep sleep register */
	__IO uint32_t  PDRUNCFG;	   /*PDRUNCFG;       */	/*!< Power configuration register*/
	__I  uint32_t  RESERVED16[110];/*RESERVED14[110];*/
	__I  uint32_t  DEVICEID;	   /*DEVICE_ID;      */	/*!< Device ID register */
  
} LPC_SYSCON_TypeDef;

//#define SYSRESSTAT SYSRSTSTAT // can't we get any continuity around here?
// ------------------------------------------------------------------------------------------------
// -----                                          USB                                         -----
// ------------------------------------------------------------------------------------------------


/**
  * @brief Product name title=UM10462 Chapter title=LPC11U1x USB2.0device controller Modification date=3/16/2011 Major revision=0 Minor revision=3  (USB)
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



/**
 * @brief LPC11u6x Pin Interrupt and Pattern Match register block structure
 */
typedef struct {			/*!< PIN_INT Structure */
	__IO uint32_t ISEL;		/*!< Pin Interrupt Mode register */
	__IO uint32_t IENR;		/*!< Pin Interrupt Enable (Rising) register */
	__IO uint32_t SIENR;	/*!< Set Pin Interrupt Enable (Rising) register */
	__IO uint32_t CIENR;	/*!< Clear Pin Interrupt Enable (Rising) register */
	__IO uint32_t IENF;		/*!< Pin Interrupt Enable Falling Edge / Active Level register */
	__IO uint32_t SIENF;	/*!< Set Pin Interrupt Enable Falling Edge / Active Level register */
	__IO uint32_t CIENF;	/*!< Clear Pin Interrupt Enable Falling Edge / Active Level address */
	__IO uint32_t RISE;		/*!< Pin Interrupt Rising Edge register */
	__IO uint32_t FALL;		/*!< Pin Interrupt Falling Edge register */
	__IO uint32_t IST;		/*!< Pin Interrupt Status register */
	__IO uint32_t PMCTRL;	/*!< GPIO pattern match interrupt control register          */
	__IO uint32_t PMSRC;	/*!< GPIO pattern match interrupt bit-slice source register */
	__IO uint32_t PMCFG;	/*!< GPIO pattern match interrupt bit slice configuration register */
} LPC_GPIO_PIN_INT_TypeDef;


/**
 * @brief GPIO grouped interrupt register block structure
 */
typedef struct {					/*!< GPIO_GROUP_INTn Structure */
	__IO uint32_t  CTRL;			/*!< GPIO grouped interrupt control register */
	__I  uint32_t  RESERVED0[7];
	__IO uint32_t  PORT_POL[8];		/*!< GPIO grouped interrupt port polarity register */
	__IO uint32_t  PORT_ENA[8];		/*!< GPIO grouped interrupt port m enable register */
	uint32_t       RESERVED1[4072];
} LPC_GPIO_GROUP_INTx_TypeDef;

/**
 * @brief  GPIO port register block structure
 */
typedef struct {				/*!< GPIO_PORT Structure */
	__IO uint8_t B[128][32];	/*!< Offset 0x0000: Byte pin registers ports 0 to n; pins PIOn_0 to PIOn_31 */
	__IO uint32_t W[32][32];	/*!< Offset 0x1000: Word pin registers port 0 to n */
	__IO uint32_t DIR[32];		/*!< Offset 0x2000: Direction registers port n */
	__IO uint32_t MASK[32];		/*!< Offset 0x2080: Mask register port n */
	__IO uint32_t PIN[32];		/*!< Offset 0x2100: Portpin register port n */
	__IO uint32_t MPIN[32];		/*!< Offset 0x2180: Masked port register port n */
	__IO uint32_t SET[32];		/*!< Offset 0x2200: Write: Set register for port n Read: output bits for port n */
	__O  uint32_t CLR[32];		/*!< Offset 0x2280: Clear port n */
	__O  uint32_t NOT[32];		/*!< Offset 0x2300: Toggle port n */
} LPC_GPIO_TypeDef;

#define LPC_GPIO_LegacyDef LPC_GPIO_TypeDef



/** @defgroup SCT_11U6X CHIP: LPC11u6x State Configurable Timer driver
 * @ingroup CHIP_11U6X_Drivers
 * @{
 */

/*
 * @brief SCT Module configuration
 */
#define CONFIG_SCT_nEV   (6)			/*!< Number of events */
#define CONFIG_SCT_nRG   (5)			/*!< Number of match/compare registers */
#define CONFIG_SCT_nOU   (4)			/*!< Number of outputs */

/**
 * @brief State Configurable Timer register block structure
 */
typedef struct {
	__IO  uint32_t CONFIG;				/*!< Configuration Register */
	union {
		__IO uint32_t CTRL_U;			/*!< Control Register */
		struct {
			__IO uint16_t CTRL_L;		/*!< Low control register */
			__IO uint16_t CTRL_H;		/*!< High control register */
		};

	};

	union {
		__IO uint32_t LIMIT;			/*!< limit Register */
		struct {
			__IO uint16_t LIMIT_L;		/*!< limit register for counter L */
			__IO uint16_t LIMIT_H;		/*!< limit register for counter H */
		};

	};

	union {
		__IO uint32_t HALT;				/*!< Halt Register */
		struct {
			__IO uint16_t HALT_L;		/*!< halt register for counter L */
			__IO uint16_t HALT_H;		/*!< halt register for counter H */
		};

	};

	union {
		__IO uint32_t STOP;				/*!< Stop Register */
		struct {
			__IO uint16_t STOP_L;		/*!< stop register for counter L */
			__IO uint16_t STOP_H;		/*!< stop register for counter H */
		};

	};

	union {
		__IO uint32_t START;			/*!< start Register */
		struct {
			__IO uint16_t START_L;		/*!< start register for counter L */
			__IO uint16_t START_H;		/*!< start register for counter H */
		};

	};

	uint32_t RESERVED1[10];				/*!< 0x03C reserved */
	union {
		__IO uint32_t COUNT_U;			/*!< counter register */
		struct {
			__IO uint16_t COUNT_L;		/*!< counter register for counter L */
			__IO uint16_t COUNT_H;		/*!< counter register for counter H */
		};

	};

	union {
		__IO uint32_t STATE;			/*!< State register */
		struct {
			__IO uint16_t STATE_L;		/*!< state register for counter L */
			__IO uint16_t STATE_H;		/*!< state register for counter H */
		};

	};

	__I  uint32_t INPUT;				/*!< input register */
	union {
		__IO uint32_t REGMODE;			/*!< RegMode register */
		struct {
			__IO uint16_t REGMODE_L;	/*!< match - capture registers mode register L */
			__IO uint16_t REGMODE_H;	/*!< match - capture registers mode register H */
		};

	};

	__IO uint32_t OUTPUT;				/*!< output register */
	__IO uint32_t OUTPUTDIRCTRL;		/*!< output counter direction Control Register */
	__IO uint32_t RES;					/*!< conflict resolution register */
	__IO uint32_t DMA0REQUEST;			/*!< DMA0 Request Register */
	__IO uint32_t DMA1REQUEST;			/*!< DMA1 Request Register */
	uint32_t RESERVED2[35];
	__IO uint32_t EVEN;					/*!< event enable register */
	__IO uint32_t EVFLAG;				/*!< event flag register */
	__IO uint32_t CONEN;				/*!< conflict enable register */
	__IO uint32_t CONFLAG;				/*!< conflict flag register */
	union {
		__IO union {					/*!< ... Match / Capture value */
			uint32_t U;					/*!<       SCTMATCH[i].U  Unified 32-bit register */
			struct {
				uint16_t L;				/*!<       SCTMATCH[i].L  Access to L value */
				uint16_t H;				/*!<       SCTMATCH[i].H  Access to H value */
			};

		} MATCH[CONFIG_SCT_nRG];

		__I union {
			uint32_t U;					/*!<       SCTCAP[i].U  Unified 32-bit register */
			struct {
				uint16_t L;				/*!<       SCTCAP[i].L  Access to L value */
				uint16_t H;				/*!<       SCTCAP[i].H  Access to H value */
			};

		} CAP[CONFIG_SCT_nRG];

	};

	uint32_t RESERVED3[64 - CONFIG_SCT_nRG];		/*!< ...-0x1FC reserved */

	union {
		__IO union {					/*!< ... Match reload value */
			uint32_t U;					/*!<       MATCHREL[i].U  Unified 32-bit register */
			struct {
				uint16_t L;				/*!<       MATCHREL[i].L  Access to L value */
				uint16_t H;				/*!<       MATCHREL[i].H  Access to H value */
			};

		} MATCHREL[CONFIG_SCT_nRG];

		__I union {
			uint32_t U;					/*!<       CAPCTRL[i].U  Unified 32-bit register */
			struct {
				uint16_t L;				/*!<       CAPCTRL[i].L  Access to L value */
				uint16_t H;				/*!<       CAPCTRL[i].H  Access to H value */
			};

		} CAPCTRL[CONFIG_SCT_nRG];

	};

	uint32_t RESERVED4[64 - CONFIG_SCT_nRG];		/*!< ...-0x2FC reserved */

	__IO struct {						/*!< SCTEVENT[i].STATE / SCTEVENT[i].CTRL*/
		uint32_t STATE;					/*!< Event State Register */
		uint32_t CTRL;					/*!< Event Control Register */
	} EVENT[CONFIG_SCT_nEV];

	uint32_t RESERVED9[128 - 2 * CONFIG_SCT_nEV];	/*!< ...-0x4FC reserved */
	__IO struct {						/*!< SCTOUT[i].SET / SCTOUT[i].CLR */
		uint32_t SET;					/*!< Output n Set Register */
		uint32_t CLR;					/*!< Output n Clear Register */
	} OUT[CONFIG_SCT_nOU];

} LPC_SCT_T;


/**
 * @brief LPC11u6x RTC register block structure
 */
typedef struct {			/*!< RTC */
	__IO uint32_t CTRL;		/*!< RTC control register */
	__IO uint32_t MATCH;	/*!< PRTC match (alarm) register */
	__IO uint32_t COUNT;	/*!< RTC counter register */
	__IO uint32_t WAKE;		/*!< RTC high-resolution/wake-up timer control register */
} LPC_RTC_T;



/** @defgroup DMA_11U6X CHIP: LPC11u6x DMA Controller driver
 * @ingroup CHIP_11U6X_Drivers
 * @{
 */

/**
 * @brief DMA Controller shared registers structure
 */
typedef struct {					/*!< DMA shared registers structure */
	__IO uint32_t  ENABLESET;		/*!< DMA Channel Enable read and Set for all DMA channels */
	__I  uint32_t  RESERVED0;
	__O  uint32_t  ENABLECLR;		/*!< DMA Channel Enable Clear for all DMA channels */
	__I  uint32_t  RESERVED1;
	__I  uint32_t  ACTIVE;			/*!< DMA Channel Active status for all DMA channels */
	__I  uint32_t  RESERVED2;
	__I  uint32_t  BUSY;			/*!< DMA Channel Busy status for all DMA channels */
	__I  uint32_t  RESERVED3;
	__IO uint32_t  ERRINT;			/*!< DMA Error Interrupt status for all DMA channels */
	__I  uint32_t  RESERVED4;
	__IO uint32_t  INTENSET;		/*!< DMA Interrupt Enable read and Set for all DMA channels */
	__I  uint32_t  RESERVED5;
	__O  uint32_t  INTENCLR;		/*!< DMA Interrupt Enable Clear for all DMA channels */
	__I  uint32_t  RESERVED6;
	__IO uint32_t  INTA;			/*!< DMA Interrupt A status for all DMA channels */
	__I  uint32_t  RESERVED7;
	__IO uint32_t  INTB;			/*!< DMA Interrupt B status for all DMA channels */
	__I  uint32_t  RESERVED8;
	__O  uint32_t  SETVALID;		/*!< DMA Set ValidPending control bits for all DMA channels */
	__I  uint32_t  RESERVED9;
	__O  uint32_t  SETTRIG;			/*!< DMA Set Trigger control bits for all DMA channels */
	__I  uint32_t  RESERVED10;
	__O  uint32_t  ABORT;			/*!< DMA Channel Abort control for all DMA channels */
} LPC_DMA_COMMON_T;

/**
 * @brief DMA Controller shared registers structure
 */
typedef struct {					/*!< DMA channel register structure */
	__IO uint32_t  CFG;				/*!< DMA Configuration register */
	__I  uint32_t  CTLSTAT;			/*!< DMA Control and status register */
	__IO uint32_t  XFERCFG;			/*!< DMA Transfer configuration register */
	__I  uint32_t  RESERVED;
} LPC_DMA_CHANNEL_T;

// 16 channels with 14 channels connected to peripheral request inputs
#define MAX_DMA_CHANNEL	 17 //		(DMA_CH15 + 1)

/**
 * @brief DMA Controller register block structure
 */
typedef struct {					/*!< DMA Structure */
	__IO uint32_t  CTRL;			/*!< DMA control register */
	__I  uint32_t  INTSTAT;			/*!< DMA Interrupt status register */
	__IO uint32_t  SRAMBASE;		/*!< DMA SRAM address of the channel configuration table */
	__I  uint32_t  RESERVED2[5];
	LPC_DMA_COMMON_T DMACOMMON[1];	/*!< DMA shared channel (common) registers */
	__I  uint32_t  RESERVED0[225];
	LPC_DMA_CHANNEL_T DMACH[MAX_DMA_CHANNEL];	/*!< DMA channel registers */
} LPC_DMA_T;



/**
 * @brief DMA trigger pin muxing structure
 */
typedef struct {					/*!< DMA trigger pin muxing register structure */
	__IO uint32_t  DMA_ITRIG_INMUX[MAX_DMA_CHANNEL];	/*!< Trigger input select register for DMA channels */
} LPC_DMATRIGMUX_T;


/**
 * @brief CRC register block structure
 */
typedef struct {					/*!< CRC Structure */
	__IO    uint32_t    MODE;		/*!< CRC Mode Register */
	__IO    uint32_t    SEED;		/*!< CRC SEED Register */
	union {
		__I     uint32_t    SUM;	/*!< CRC Checksum Register. */
		__O     uint32_t    WRDATA32;	/*!< CRC Data Register: write size 32-bit*/
		__O     uint16_t    WRDATA16;	/*!< CRC Data Register: write size 16-bit*/
		__O     uint8_t     WRDATA8;	/*!< CRC Data Register: write size 8-bit*/
	};

} LPC_CRC_T;


#if defined ( __CC_ARM   )
  #pragma no_anon_unions
#endif


// ------------------------------------------------------------------------------------------------
// -----                                 Peripheral memory map                                -----
// ------------------------------------------------------------------------------------------------

#define LPC_I2C_BASE              (0x40000000)
#define LPC_WWDT_BASE             (0x40004000)
#define LPC_UART_BASE             (0x40008000)
#define LPC_CT16B0_BASE           (0x4000C000)
#define LPC_CT16B1_BASE           (0x40010000)
#define LPC_CT32B0_BASE           (0x40014000)
#define LPC_CT32B1_BASE           (0x40018000)
#define LPC_ADC_BASE              (0x4001C000)
#define LPC_PMU_BASE              (0x40038000)
#define LPC_FLASHCTRL_BASE        (0x4003C000)
#define LPC_SSP0_BASE             (0x40040000)
#define LPC_SSP1_BASE             (0x40058000)
#define LPC_IOCON_BASE            (0x40044000)
#define LPC_SYSCON_BASE           (0x40048000)
#define LPC_GPIO_GROUP_INT0_BASE  (0x4005C000)
#define LPC_GPIO_GROUP_INT1_BASE  (0x40060000)
#define LPC_USB_BASE              (0x40080000)

#define LPC_GPIO_BASE             (0xA0000000)
#define LPC_GPIO_PIN_INT_BASE     (0xA0004000)

#define LPC_UART1_BASE           0x4006C000
#define LPC_UART2_BASE           0x40070000
#define LPC_UART3_BASE           0x40074000
#define LPC_UART4_BASE           0x4004C000
#define LPC_I2C1_BASE            0x40020000
#define LPC_SCT0_BASE             0x5000C000
#define LPC_SCT1_BASE             0x5000E000
#define LPC_RTC_BASE              0x40024000
#define LPC_DMA_BASE              0x50004000
#define LPC_CRC_BASE              0x50000000
#define LPC_DMATRIGMUX_BASE       0x40028000

// ------------------------------------------------------------------------------------------------
// -----                                Peripheral declaration                                -----
// ------------------------------------------------------------------------------------------------

#define LPC_I2C                   ((LPC_I2C_TypeDef            *) LPC_I2C_BASE)
#define LPC_I2C0                  ((LPC_I2C_TypeDef            *) LPC_I2C_BASE) // aka
#define LPC_I2C1                  ((LPC_I2C_TypeDef            *) LPC_I2C1_BASE)
#define LPC_WWDT                  ((LPC_WWDT_TypeDef           *) LPC_WWDT_BASE)
#define LPC_UART0                 ((LPC_UART_TypeDef           *) LPC_UART_BASE)
//aka remove
#define LPC_USART                 ((LPC_UART_TypeDef           *) LPC_UART_BASE)
#define LPC_CT16B0                ((LPC_CTxxBx_TypeDef         *) LPC_CT16B0_BASE)
#define LPC_CT16B1                ((LPC_CTxxBx_TypeDef         *) LPC_CT16B1_BASE)
#define LPC_CT32B0                ((LPC_CTxxBx_TypeDef         *) LPC_CT32B0_BASE)
#define LPC_CT32B1                ((LPC_CTxxBx_TypeDef         *) LPC_CT32B1_BASE)
#define LPC_ADC                   ((LPC_ADC_TypeDef            *) LPC_ADC_BASE)
#define LPC_PMU                   ((LPC_PMU_TypeDef            *) LPC_PMU_BASE)
#define LPC_FLASHCTRL             ((LPC_FLASHCTRL_TypeDef      *) LPC_FLASHCTRL_BASE) // aka FMC
#define LPC_SSP0                  ((LPC_SSPx_TypeDef           *) LPC_SSP0_BASE)
#define LPC_SSP1                  ((LPC_SSPx_TypeDef           *) LPC_SSP1_BASE)
#define LPC_IOCON                 ((LPC_IOCON_TypeDef          *) LPC_IOCON_BASE)
#define LPC_SYSCON                ((LPC_SYSCON_TypeDef         *) LPC_SYSCON_BASE)
#define LPC_GPIO_PIN_INT          ((LPC_GPIO_PIN_INT_TypeDef   *) LPC_GPIO_PIN_INT_BASE)
#define LPC_GPIO_GROUP_INT0       ((LPC_GPIO_GROUP_INTx_TypeDef*) LPC_GPIO_GROUP_INT0_BASE)
#define LPC_GPIO_GROUP_INT1       ((LPC_GPIO_GROUP_INTx_TypeDef*) LPC_GPIO_GROUP_INT1_BASE)
#define LPC_USB                   ((LPC_USB_TypeDef            *) LPC_USB_BASE)
#define LPC_GPIO                  ((LPC_GPIO_TypeDef           *) LPC_GPIO_BASE)
//aka
#define LPC_GPIO0                  ((LPC_GPIO_LegacyDef          *) LPC_GPIO_BASE)
#define LPC_GPIO1                  ((LPC_GPIO_LegacyDef          *) (LPC_GPIO_BASE+4)

// LPC_USARTN_T different from LPC_UART_TypeDef and not yet done
//#define LPC_UART1                 ((LPC_USARTN_T           *) LPC_UART1_BASE)
//#define LPC_UART2                 ((LPC_USARTN_T           *) LPC_UART2_BASE)
//#define LPC_UART3                 ((LPC_USARTN_T           *) LPC_UART3_BASE)
//#define LPC_UART4                 ((LPC_USARTN_T           *) LPC_UART4_BASE)
#define LPC_I2C0                  ((LPC_I2C_TypeDef            *) LPC_I2C_BASE) // aka
#define LPC_I2C1                  ((LPC_I2C_TypeDef            *) LPC_I2C1_BASE)

// TODO
#define LPC_SCT0                  ((LPC_SCT_T              *) LPC_SCT0_BASE)
#define LPC_SCT1                  ((LPC_SCT_T              *) LPC_SCT1_BASE)
#define LPC_RTC                   ((LPC_RTC_T              *) LPC_RTC_BASE)
#define LPC_DMA                   ((LPC_DMA_T              *) LPC_DMA_BASE)
#define LPC_DMATRIGMUX            ((LPC_DMATRIGMUX_T       *) LPC_DMATRIGMUX_BASE)
#define LPC_CRC                   ((LPC_CRC_T              *) LPC_CRC_BASE)


/** @} */ /* End of group Device_Peripheral_Registers */
/** @} */ /* End of group (null) */
/** @} */ /* End of group LPC11U6x */

#ifdef __cplusplus
}
#endif 


#endif  // __LPC11U6X_H__
