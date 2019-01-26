
#ifndef __LPC11UXX_H__
#define __LPC11UXX_H__

'/****************************************************************************************************//**
' * @file     LPC11U3x.h
' *
' *
' * @brief    CMSIS Cortex-M0 Core Peripheral Access Layer Header File for
' *           default LPC11U3x Device Series
' *
' * @version  V0.1
' * @date     21. March 2011
' *
' * @note     Generated with SFDGen V2.6 Build 3j (beta) on Thursday, 17.03.2011 13:19:45
' *
' *           from CMSIS SVD File 'LPC11U1x_svd.xml' Version 0.1,
' *           created on Wednesday, 16.03.2011 20:30:42, last modified on Thursday, 17.03.2011 20:19:40
' *
' *			  converted to a BASIC file 11/15/17
' *
' *******************************************************************************************************/

#include "STAMP_PINS.bas"

' /* Interrupt Number Definition */


'// ---------------------------  LPC11Uxx Specific Interrupt Numbers  ------------------------------
#define FLEX_INT0_IRQn                0 	'      /*!< All I/O pins can be routed to below 8 interrupts. */
#define FLEX_INT1_IRQn                1 	'
#define FLEX_INT2_IRQn                2 	'
#define FLEX_INT3_IRQn                3 	'
#define FLEX_INT4_IRQn                4 	' 
#define FLEX_INT5_IRQn                5 	'      
#define FLEX_INT6_IRQn                6 	'      
#define FLEX_INT7_IRQn                7 	'      
#define GINT0_IRQn                    8 	'      /*!< Grouped Interrupt 0                              */
#define GINT1_IRQn                    9 	'      /*!< Grouped Interrupt 1                              */
#define Reserved0_IRQn                10	'      /*!< Reserved Interrupt                               */
#define Reserved1_IRQn                11	'      
#define Reserved2_IRQn                12	'      
#define Reserved3_IRQn                13	'      
#define SSP1_IRQn                     14	'      /*!< SSP1 Interrupt                                   */
#define I2C_IRQn                      15	'      /*!< I2C Interrupt                                    */
#define TIMER2_IRQn  	              16	'      /*!< swap 32 bit timers in order --16-bit Timer0 Interrupt                          */
#define TIMER3_IRQn  	              17	'      /*!< swap 32 bit timers in order --16-bit Timer1 Interrupt                          */
#define TIMER0_IRQn  	              18	'      /*!< swap 16 bit timers in order --32-bit Timer0 Interrupt                          */
#define TIMER1_IRQn  	              19	'      /*!< swap 16 bit timers in order --32-bit Timer1 Interrupt                          */
#define SSP0_IRQn                     20	'      /*!< SSP0 Interrupt                                   */
#define UART0_IRQn                    21	'      /*!< UART Interrupt                                   */
#define USB_IRQn                      22	'      /*!< USB IRQ Interrupt                                */
#define USB_FIQn                      23	'      /*!< USB FIQ Interrupt                                */
#define ADC_IRQn                      24	'      /*!< A/D Converter Interrupt                          */
#define WDT_IRQn                      25	'      /*!< Watchdog timer Interrupt                         */  
#define BOD_IRQn                      26	'      /*!< Brown Out Detect(BOD) Interrupt                  */
#define FMC_IRQn                      27	'      /*!< Flash Memory Controller Interrupt                */

'VIC Vector Table
#define FLEX_INT0_ISR	*&H10000040 ' 0:  The FLEX_INT0 handler
#define FLEX_INT1_ISR	*&H10000044 ' 1:  The FLEX_INT1 handler
#define FLEX_INT2_ISR	*&H10000048 ' 2:  The FLEX_INT2 handler
#define FLEX_INT3_ISR	*&H1000004C ' 3:  The FLEX_INT3 handler
#define FLEX_INT4_ISR	*&H10000050 ' 4:  The FLEX_INT4 handler
#define FLEX_INT5_ISR	*&H10000054 ' 5:  The FLEX_INT5 handler
#define FLEX_INT6_ISR	*&H10000058 ' 6:  The FLEX_INT6 handler
#define FLEX_INT7_ISR	*&H1000005C ' 7:  The FLEX_INT7 handler
#define GINT0_ISR		*&H10000060 ' 8:  The GINT0 handler
#define GINT1_ISR		*&H10000064 ' 9:  The GINT1 handler
                               ' 68   10
                               ' 6C   11
                               ' 70   12
                               ' 74   13
#define SSP1_ISR 		*&H10000078 ' 14: The SSP1 handler
#define I2C_ISR 		*&H1000007C ' 15: The I2C handler
#define TIMER2_ISR 		*&H10000080 ' 16: swap 16 bit counters with 32 Timer0
#define TIMER3_ISR 		*&H10000084 ' 17: swap 16 bit counters with 32 Timer1
#define TIMER0_ISR 		*&H10000088 ' 18: Timer2
#define TIMER1_ISR 		*&H1000008C ' 19: Timer3
#define SSP0_ISR 		*&H10000090 ' 20: SSP0
#define UART0_ISR 		*&H10000094 ' 21: UART0
#define USB_ISR 		*&H10000098 ' 22: USB IRQ
#define USB_FIQ_ISR 	*&H1000009C ' 23: USB FIQ
#define ADC_ISR 		*&H100000A0 ' 24: ADC
#define WDT_ISR 		*&H100000A4 ' 25: WDT
#define BOD_ISR 		*&H100000A8 ' 26: BOD
#define FMC_ISR 		*&H100000AC ' 27: FMC


///* Vectored Interrupt Controller (VIC) */
#define VIC_BASE_ADDR	&HE000E000
#define VIC_VTOR   *(VIC_BASE_ADDR + &HD08)

#define VICIntEnable0   *(VIC_BASE_ADDR + &H100)
#define VICIntEnable1   *(VIC_BASE_ADDR + &H104)
#define VICIntEnClear0  *(VIC_BASE_ADDR + &H180)
#define VICIntEnClear1  *(VIC_BASE_ADDR + &H184)
#define VICIntSetPend0  *(VIC_BASE_ADDR + &H200) //nvic Irq 0-31 Set Pending
#define VICIntSetPend1  *(VIC_BASE_ADDR + &H204) //nvic Irq 32-63 Set Pending
#define VICIntClrPend0  *(VIC_BASE_ADDR + &H280) //nvic Irq 0-31 Clr Pending
#define VICIntClrPend1  *(VIC_BASE_ADDR + &H284) //nvic Irq 32-63 Clr Pending
//aka's
#define VICIntEnable   *(VIC_BASE_ADDR + &H100)
#define VICIntEnClear  *(VIC_BASE_ADDR + &H180)
#define VICIntSetPend  *(VIC_BASE_ADDR + &H200) //nvic Irq 0-31 Set Pending
#define VICIntClrPend  *(VIC_BASE_ADDR + &H280) //nvic Irq 0-31 Clr Pending



'/* Processor and Core Peripheral Section */ /* Configuration of the Cortex-M0 Processor and Core Peripherals */

#define __MPU_PRESENT             0         /*!< MPU present or not                    */
#define __NVIC_PRIO_BITS          2         /*!< Number of Bits used for Priority Levels */
#define __Vendor_SysTickConfig    0         /*!< Set to 1 if different SysTick Config is used */
'/** @} */ /* End of group Configuration_of_CMSIS */



'// ------------------------------------------------------------------------------------------------
'// -----                                          I2C                                         -----
'// ------------------------------------------------------------------------------------------------



'typedef struct {                            /*!< (@ &H40000000) I2C Structure          */
#define I2C_CONSET                     *&H40000000	'	I2C Control Set Register */
#define I2C_STAT                       *&H40000004	'	I2C Status Register */
#define I2C_DAT                        *&H40000008	'	I2C Data Register.  */
#define I2C_ADR0                       *&H4000000C	'	I2C Slave Address Register 0 */
#define I2C_SCLH                       *&H40000010	'	SCH Duty Cycle Register High Half Word */
#define I2C_SCLL                       *&H40000014	'	SCL Duty Cycle Register Low Half Word */
#define I2C_CONCLR                     *&H40000018	'	I2C Control Clear Register*/
#define I2C_MMCTRL                     *&H4000001C	'	Monitor mode control register*/
#define I2C_ADR1                       *&H40000020	'	I2C Slave Address Register 1*/
#define I2C_ADR2                       *&H40000024	'	I2C Slave Address Register 2*/
#define I2C_ADR3                       *&H40000028	'	I2C Slave Address Register 3*/
#define I2C_DATA_BUFFER                *&H4000002C	'	Data buffer register */
#define I2C_MASK(x)                    *(&H40000030+(x<<2))	'	I2C Slave address mask register */
'} LPC_I2C_'typedef


'// ------------------------------------------------------------------------------------------------
'// -----                                         WWDT                                         -----
'// ------------------------------------------------------------------------------------------------



'typedef struct {                            /*!< (@ &H40004000) WWDT Structure         */
#define WWDT_MOD                        *&H40004000	'	Watchdog mode register*/
#define WWDT_TC                         *&H40004004	'	Watchdog timer constant register */
#define WWDT_FEED                       *&H40004008	'	Watchdog feed sequence register */
#define WWDT_TV                         *&H4000400C	'	Watchdog timer value register */
#define WWDT_CLKSEL                     *&H40004010	'	Watchdog clock select register. */
#define WWDT_WARNINT                    *&H40004014	'	Watchdog Warning Interrupt compare value. */
#define WWDT_WINDOW                     *&H40004018	'	Watchdog Window compare value. */
'} LPC_WWDT_'typedef


'// ------------------------------------------------------------------------------------------------
'// -----                                         USART                                        -----
'// ------------------------------------------------------------------------------------------------



'typedef struct {                            /*!< (@ &H40008000) USART Structure        */
  
'  union {
#define USART_DLL                        *&H40008000	'	Divisor Latch LSB. Least significant byte of the baud rate divisor value. The full divisor is used to generate a baud rate from the fractional rate divider. (DLAB=1) */
#define USART_THR                        *&H40008000	'	Transmit Holding Register. The next character to be transmitted is written here. (DLAB=0) */
#define USART_RBR                        *&H40008000	'	Receiver Buffer Register. Contains the next received character to be read. (DLAB=0) */
'  }                                     *	'	
'  union {                               *	'	
#define USART_IER                        *&H40008004	'	Interrupt Enable Register. Contains individual interrupt enable bits for the 7 potential USART interrupts. (DLAB=0) */
#define USART_DLM                        *&H40008004	'	Divisor Latch MSB. Most significant byte of the baud rate divisor value. The full divisor is used to generate a baud rate from the fractional rate divider. (DLAB=1) */
'  }                                     *	'	
'  union {                               *	'	
#define USART_FCR                        *&H40008008	'	FIFO Control Register. Controls USART FIFO usage and modes. */
#define USART_IIR                      	 *&H40008008	'	Interrupt ID Register. Identifies which interrupt(s) are pending. */
'  }                                     *	'	
#define USART_LCR                        *&H4000800C	'	Line Control Register. Contains controls for frame formatting and break generation. */
#define USART_MCR                        *&H40008010	'	Modem Control Register. */
#define USART_LSR                        *&H40008014	'	Line Status Register. Contains flags for transmit and receive status, including line errors. */
#define USART_MSR                        *&H40008018	'	Modem Status Register. */
#define USART_SCR                        *&H4000801C	'	Scratch Pad Register. Eight-bit temporary storage for software. */
#define USART_ACR                        *&H40008020	'	Auto-baud Control Register. Contains controls for the auto-baud feature. */
#define USART_ICR                        *&H40008024	'	IrDA Control Register. Enables and configures the IrDA (remote control) mode. */
#define USART_FDR                        *&H40008028	'	Fractional Divider Register. Generates a clock input for the baud rate divider. */
#define USART_OSR                        *&H4000802C	'	Oversampling Register. Controls the degree of oversampling during each bit time. */
#define USART_TER                        *&H40008030	'	Transmit Enable Register. Turns off USART transmitter for use with software flow control. */
#define USART_HDEN                       *&H40008040	'	Half duplex enable register. */
#define USART_SCICTRL                    *&H40008048	'	Smart Card Interface Control register. Enables and configures the Smart Card Interface feature. */
#define USART_RS485CTRL                  *&H4000804C	'	RS-485/EIA-485 Control. Contains controls to configure various aspects of RS-485/EIA-485 modes. */
#define USART_RS485ADRMATCH              *&H40008050	'	RS-485/EIA-485 address match. Contains the address match value for RS-485/EIA-485 mode. */
#define USART_RS485DLY                   *&H40008054	'	RS-485/EIA-485 direction control delay. */
#define USART_SYNCCTRL 
'} LPC_UART_'typedef


// ------------------------------------------------------------------------------------------------
// -----                                        Timer                                       -----
// ------------------------------------------------------------------------------------------------

#define LPC_CT32B0_BASE           (&H40014000)
#define LPC_CT32B1_BASE           (&H40018000)
#define LPC_CT16B0_BASE           (&H4000C000)
#define LPC_CT16B1_BASE           (&H40010000)

#define T0_IR                         *&H40014000	'	Interrupt Register      */
#define T0_TCR                        *&H40014004	'	Timer Control Register  */
#define T0_TC                         *&H40014008	'	Timer Counter 		*/
#define T0_PR                         *&H4001400C	'	Prescale Register  	*/
#define T0_PC                         *&H40014010	'	Prescale Counter	 */
#define T0_MCR                        *&H40014014	'	Match Control Register */
#define T0_MR(x)                      *(&H40014018+(x<<2))	'	Match Register */
#define T0_MR0                        *&H40014018	'	Match Register. MR0 */
#define T0_MR1                        *&H4001401C	'	Match Register. MR1 */
#define T0_MR2                        *&H40014020	'	Match Register. MR2 */
#define T0_MR3                        *&H40014024	'	Match Register. MR3 */
#define T0_CCR                        *&H40014028	'	Capture Control Register */
#define T0_CR(x)                      *(&H4001402C+(x<<2))	'	Capture Register  */
#define T0_CR0			    		  *&H4001402C	'	Capture Register. CR 0 */
#define T0_CR1			    		  *&H40014030	'	Capture Register. CR 1 */
#define T0_CR2			    		  *&H40014034	'	Capture Register. CR 2 */
#define T0_CR3			    		  *&H40014038	'	Capture Register. CR 3 */
#define T0_EMR                        *&H4001403C	'	External Match Register */
#define T0_CTCR                       *&H40014070	'	Count Control Register */
#define T0_PWMC                       *&H40014074	'	PWM Control Register */'

#define T1_IR                         *&H40018000	'	Interrupt Register      */
#define T1_TCR                        *&H40018004	'	Timer Control Register  */
#define T1_TC                         *&H40018008	'	Timer Counter 		*/
#define T1_PR                         *&H4001800C	'	Prescale Register  	*/
#define T1_PC                         *&H40018010	'	Prescale Counter	 */
#define T1_MCR                        *&H40018014	'	Match Control Register */
#define T1_MR(x)                      *(&H40018018+(x<<2))	'	Match Register */
#define T1_MR0                        *&H40018018	'	Match Register. MR0 */
#define T1_MR1                        *&H4001801C	'	Match Register. MR1 */
#define T1_MR2                        *&H40018020	'	Match Register. MR2 */
#define T1_MR3                        *&H40018024	'	Match Register. MR3 */
#define T1_CCR                        *&H40018028	'	Capture Control Register */
#define T1_CR(x)                      *(&H4001802C+(x<<2))	'	Capture Register  */
#define T1_CR0			    		  *&H4001802C	'	Capture Register. CR 0 */
#define T1_CR1			    		  *&H40018030	'	Capture Register. CR 1 */
#define T1_CR2			    		  *&H40018034	'	Capture Register. CR 2 */
#define T1_CR3			    		  *&H40018038	'	Capture Register. CR 3 */
#define T1_EMR                        *&H4001803C	'	External Match Register */
#define T1_CTCR                       *&H40018070	'	Count Control Register */
#define T1_PWMC                       *&H40018074	'	PWM Control Register */'

#define T2_IR                         *&H4000C000	'	Interrupt Register      */
#define T2_TCR                        *&H4000C004	'	Timer Control Register  */
#define T2_TC                         *&H4000C008	'	Timer Counter 		*/
#define T2_PR                         *&H4000C00C	'	Prescale Register  	*/
#define T2_PC                         *&H4000C010	'	Prescale Counter	 */
#define T2_MCR                        *&H4000C014	'	Match Control Register */
#define T2_MR(x)                     *(&H4000C018+(x<<2))	'	Match Register */
#define T2_MR0                        *&H4000C018	'	Match Register. MR0 */
#define T2_MR1                        *&H4000C01C	'	Match Register. MR1 */
#define T2_MR2                        *&H4000C020	'	Match Register. MR2 */
#define T2_MR3                        *&H4000C024	'	Match Register. MR3 */
#define T2_CCR                        *&H4000C028	'	Capture Control Register */
#define T2_CR(x)                     *(&H4000C02C+(x<<2))	'	Capture Register  */
#define T2_CR0			    		  *&H4000C02C	'	Capture Register. CR 0 */
#define T2_CR1			    		  *&H4000C030	'	Capture Register. CR 1 */
#define T2_CR2			    		  *&H4000C034	'	Capture Register. CR 2 */
#define T2_CR3			    		  *&H4000C038	'	Capture Register. CR 3 */
#define T2_EMR                        *&H4000C03C	'	External Match Register */
#define T2_CTCR                       *&H4000C070	'	Count Control Register */
#define T2_PWMC                       *&H4000C074	'	PWM Control Register */'
          
#define T3_IR                         *&H40010000	'	Interrupt Register      */
#define T3_TCR                        *&H40010004	'	Timer Control Register  */
#define T3_TC                         *&H40010008	'	Timer Counter 		*/
#define T3_PR                         *&H4001000C	'	Prescale Register  	*/
#define T3_PC                         *&H40010010	'	Prescale Counter	 */
#define T3_MCR                        *&H40010014	'	Match Control Register */
#define T3_MR(x)                     *(&H40010018+(x<<2))	'	Match Register */
#define T3_MR0                        *&H40010018	'	Match Register. MR0 */
#define T3_MR1                        *&H4001001C	'	Match Register. MR1 */
#define T3_MR2                        *&H40010020	'	Match Register. MR2 */
#define T3_MR3                        *&H40010024	'	Match Register. MR3 */
#define T3_CCR                        *&H40010028	'	Capture Control Register */
#define T3_CR(x)                     *(&H4001002C+(x<<2))	'	Capture Register  */
#define T3_CR0			    		  *&H4001002C	'	Capture Register. CR 0 */
#define T3_CR1			    		  *&H40010030	'	Capture Register. CR 1 */
#define T3_CR2			    		  *&H40010034	'	Capture Register. CR 2 */
#define T3_CR3			    		  *&H40010038	'	Capture Register. CR 3 */
#define T3_EMR                        *&H4001003C	'	External Match Register */
#define T3_CTCR                       *&H40010070	'	Count Control Register */
#define T3_PWMC                       *&H40010074	'	PWM Control Register */'


// ------------------------------------------------------------------------------------------------
// -----                                          ADC                                         -----
// ------------------------------------------------------------------------------------------------



'typedef struct {                            /*!< (@ &H4001C000) ADC Structure          */
#define ADC_CR                        *&H4001C000	'	A/D Control Register */
#define ADC_GDR                       *&H4001C004	'	A/D Global Data Register */
#define ADC_INTEN                     *&H4001C00C	'	A/D Interrupt Enable Register */
#define ADC_DR(x)                     *(&H4001C010+(x<<2))	'	A/D Channel Data Register*/
#define ADC_DR0                       *&H40020010	'	A/D Channel Data Register 0*/
#define ADC_DR1                       *&H40020014	'	A/D Channel Data Register 1*/
#define ADC_DR2                       *&H40020018	'	A/D Channel Data Register 2*/
#define ADC_DR3                       *&H4002001C	'	A/D Channel Data Register 3*/
#define ADC_DR4                       *&H40020020	'	A/D Channel Data Register 4*/
#define ADC_DR5                       *&H40020024	'	A/D Channel Data Register 5*/
#define ADC_DR6                       *&H40020028	'	A/D Channel Data Register 6*/
#define ADC_DR7                       *&H4002002C	'	A/D Channel Data Register 7*/
#define ADC_STAT                      *&H4001C030	'	A/D Status Register.  */
'} LPC_ADC_'typedef


// ------------------------------------------------------------------------------------------------
// -----                                          PMU                                         -----
// ------------------------------------------------------------------------------------------------



'typedef struct {                            /*!< (@ &H40038000) PMU Structure          */
 #define PMU_PCON                        *&H40038000	'	Power control register */
 #define PMU_GPREG(x)                    *(&H40038004+(x<<2))'	General purpose registers */
 #define PMU_GPREG0                   	 *&H40038004	'	General purpose register 0 */
 #define PMU_GPREG1                   	 *&H40038008	'	General purpose register 1 */
 #define PMU_GPREG2                   	 *&H4003800C	'	General purpose register 2 */
 #define PMU_GPREG3                   	 *&H40038010	'	General purpose register 3 */
'} LPC_PMU_'typedef

#if 0

// ------------------------------------------------------------------------------------------------
// -----                                       FLASHCTRL                                      -----
// ------------------------------------------------------------------------------------------------



'typedef struct {                            /*!< (@ &H4003C000) FLASHCTRL Structure    */
  __I  uint32_t RESERVED0[4]
  __IO uint32_t FLASHCFG                   /*!< (@ &H4003C010) Flash memory access time configuration register */
  __I  uint32_t RESERVED1[3]
  __IO uint32_t FMSSTART                   /*!< (@ &H4003C020) Signature start address register */
  __IO uint32_t FMSSTOP                    /*!< (@ &H4003C024) Signature stop-address register */
  __I  uint32_t RESERVED2[1]
  __I  uint32_t FMSW0                      /*!< (@ &H4003C02C) Word 0 [31:0]          */
  __I  uint32_t FMSW1                      /*!< (@ &H4003C030) Word 1 [63:32]         */
  __I  uint32_t FMSW2                      /*!< (@ &H4003C034) Word 2 [95:64]         */
  __I  uint32_t FMSW3                      /*!< (@ &H4003C038) Word 3 [127:96]        */
  __I  uint32_t RESERVED3[1001]
  __I  uint32_t FMSTAT                     /*!< (@ &H4003CFE0) Signature generation status register */
  __I  uint32_t RESERVED4[1]
  __IO uint32_t FMSTATCLR                  /*!< (@ &H4003CFE8) Signature generation status clear register */
} LPC_FLASHCTRL_'typedef

#endif

// ------------------------------------------------------------------------------------------------
// -----                                         SSP0/1                                         -----
// ------------------------------------------------------------------------------------------------



'typedef struct {                            /*!< (@ &H40040000) SSP0 Structure         */
#define SSP0_CR0                        *&H40040000	'	Control Register 0. Selects the serial clock rate, bus type, and data size. */
#define SSP0_CR1                        *&H40040004	'	Control Register 1. Selects master/slave and other modes. */
#define SSP0_DR                         *&H40040008	'	Data Register. Writes fill the transmit FIFO, and reads empty the receive FIFO. */
#define SSP0_SR                         *&H4004000C	'	Status Register        */
#define SSP0_CPSR                       *&H40040010	'	Clock Prescale Register */
#define SSP0_IMSC                       *&H40040014	'	Interrupt Mask Set and Clear Register */
#define SSP0_RIS                        *&H40040018	'	Raw Interrupt Status Register */
#define SSP0_MIS                        *&H4004001C	'	Masked Interrupt Status Register */
#define SSP0_ICR                        *&H40040020	'	SSPICR Interrupt Clear Register */
'} LPC_SSPx_'typedef

#define SSP1_CR0                        *&H40058000	'	Control Register 0. Selects the serial clock rate, bus type, and data size. */
#define SSP1_CR1                        *&H40058004	'	Control Register 1. Selects master/slave and other modes. */
#define SSP1_DR                         *&H40058008	'	Data Register. Writes fill the transmit FIFO, and reads empty the receive FIFO. */
#define SSP1_SR                         *&H4005800C	'	Status Register        */
#define SSP1_CPSR                       *&H40058010	'	Clock Prescale Register */
#define SSP1_IMSC                       *&H40058014	'	Interrupt Mask Set and Clear Register */
#define SSP1_RIS                        *&H40058018	'	Raw Interrupt Status Register */
#define SSP1_MIS                        *&H4005801C	'	Masked Interrupt Status Register */
#define SSP1_ICR                        *&H40058020	'	SSPICR Interrupt Clear Register */


'// ------------------------------------------------------------------------------------------------
'// -----                                       IOCONFIG                                       -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10462 Chapter title=LPC11U1x I/O configuration Modification date=3/16/2011 Major revision=0 Minor revision=3  (IOCONFIG)
'  */


''typedef struct {                            /*!< (@ &H40044000) IOCONFIG Structure     */
#define IOCON_RESET_PIO0_0               *&H40044000 '	I/O configuration for pin RESET/PIO0_0 */
#define IOCON_PIO0_1                     *&H40044004 '	I/O configuration for pin PIO0_1/CLKOUT/CT32B0_MAT2/USB_FTOGGLE */
#define IOCON_PIO0_2                     *&H40044008 '	I/O configuration for pin PIO0_2/SSEL0/CT16B0_CAP0 */
#define IOCON_PIO0_3                     *&H4004400C '	I/O configuration for pin PIO0_3/USB_VBUS */
#define IOCON_PIO0_4                     *&H40044010 '	I/O configuration for pin PIO0_4/SCL */
#define IOCON_PIO0_5                     *&H40044014 '	I/O configuration for pin PIO0_5/SDA */
#define IOCON_PIO0_6                     *&H40044018 '	I/O configuration for pin PIO0_6/USB_CONNECT/SCK0 */
#define IOCON_PIO0_7                     *&H4004401C '	I/O configuration for pin PIO0_7/CTS */
#define IOCON_PIO0_8                     *&H40044020 '	I/O configuration for pin PIO0_8/MISO0/CT16B0_MAT0 */
#define IOCON_PIO0_9                     *&H40044024 '	I/O configuration for pin PIO0_9/MOSI0/CT16B0_MAT1 */
#define IOCON_SWCLK_PIO0_10              *&H40044028 '	I/O configuration for pin SWCLK/PIO0_10/ SCK0/CT16B0_MAT2 */
#define IOCON_TDI_PIO0_11                *&H4004402C '	I/O configuration for pin TDI/PIO0_11/AD0/CT32B0_MAT3 */
#define IOCON_TMS_PIO0_12                *&H40044030 '	I/O configuration for pin TMS/PIO0_12/AD1/CT32B1_CAP0 */
#define IOCON_TDO_PIO0_13                *&H40044034 '	I/O configuration for pin TDO/PIO0_13/AD2/CT32B1_MAT0 */
#define IOCON_TRST_PIO0_14               *&H40044038 '	I/O configuration for pin TRST/PIO0_14/AD3/CT32B1_MAT1 */
#define IOCON_SWDIO_PIO0_15              *&H4004403C '	I/O configuration for pin SWDIO/PIO0_15/AD4/CT32B1_MAT2 */
#define IOCON_PIO0_16                    *&H40044040 '	I/O configuration for pin PIO0_16/AD5/CT32B1_MAT3/ WAKEUP */
#define IOCON_PIO0_17                    *&H40044044 '	I/O configuration for pin PIO0_17/RTS/CT32B0_CAP0/SCLK */
#define IOCON_PIO0_18                    *&H40044048 '	I/O configuration for pin PIO0_18/RXD/CT32B0_MAT0 */
#define IOCON_PIO0_19                    *&H4004404C '	I/O configuration for pin PIO0_19/TXD/CT32B0_MAT1 */
#define IOCON_PIO0_20                    *&H40044050 '	I/O configuration for pin PIO0_20/CT16B1_CAP0 */
#define IOCON_PIO0_21                    *&H40044054 '	I/O configuration for pin PIO0_21/CT16B1_MAT0/MOSI1 */
#define IOCON_PIO0_22                    *&H40044058 '	I/O configuration for pin PIO0_22/AD6/CT16B1_MAT1/MISO1 */
#define IOCON_PIO0_23                    *&H4004405C '	I/O configuration for pin PIO0_23/AD7 */
#define IOCON_PIO1_0                 	 *&H40044060 '	/*!< Offset: &H060 */
#define IOCON_PIO1_1                     *&H40044064 '
#define IOCON_PIO1_2                     *&H40044068 '
#define IOCON_PIO1_3                     *&H4004406C '
#define IOCON_PIO1_4                 	 *&H40044070 '	/*!< Offset: &H070 */
#define IOCON_PIO1_5                     *&H40044074 '	/*!< (@ &H40044074) I/O configuration for pin PIO1_5/CT32B1_CAP1 */
#define IOCON_PIO1_6                     *&H40044078 '
#define IOCON_PIO1_7                     *&H4004407C '
#define IOCON_PIO1_8                 	 *&H40044080 '	/*!< Offset: &H080 */
#define IOCON_PIO1_9                     *&H40044084 '
#define IOCON_PIO1_10                    *&H40044088 '
#define IOCON_PIO1_11                    *&H4004408C '
#define IOCON_PIO1_12                	 *&H40044090 '	/*!< Offset: &H090 */
#define IOCON_PIO1_13                    *&H40044094 '	 /*!< (@ &H40044094) I/O configuration for pin PIO1_13/DTR/CT16B0_MAT0/TXD */
#define IOCON_PIO1_14                    *&H40044098 '	 /*!< (@ &H40044098) I/O configuration for pin PIO1_14/DSR/CT16B0_MAT1/RXD */
#define IOCON_PIO1_15                    *&H4004409C '	 /*!< (@ &H4004409C) I/O configuration for pin PIO1_15/DCD/ CT16B0_MAT2/SCK1 */
#define IOCON_PIO1_16                    *&H400440A0 '	 /*!< (@ &H400440A0) I/O configuration for pin PIO1_16/RI/CT16B0_CAP0 */
#define IOCON_PIO1_17	                 *&H400440A4 '
#define IOCON_PIO1_18	                 *&H400440A8 '
#define IOCON_PIO1_19                    *&H400440AC '	 /*!< (@ &H400440AC) I/O configuration for pin PIO1_19/DTR/SSEL1 */
#define IOCON_PIO1_20                    *&H400440B0 '	 /*!< (@ &H400440B0) I/O configuration for pin PIO1_20/DSR/SCK1 */
#define IOCON_PIO1_21                    *&H400440B4 '	 /*!< (@ &H400440B4) I/O configuration for pin PIO1_21/DCD/MISO1 */
#define IOCON_PIO1_22                    *&H400440B8 '	 /*!< (@ &H400440B8) I/O configuration for pin PIO1_22/RI/MOSI1 */
#define IOCON_PIO1_23                    *&H400440BC '	 /*!< (@ &H400440BC) I/O configuration for pin PIO1_23/CT16B1_MAT1/SSEL1 */
#define IOCON_PIO1_24                    *&H400440C0 '	 /*!< (@ &H400440C0) I/O configuration for pin PIO1_24/ CT32B0_MAT0 */
#define IOCON_PIO1_25                    *&H400440C4 '	 /*!< (@ &H400440C4) I/O configuration for pin PIO1_25/CT32B0_MAT1 */
#define IOCON_PIO1_26                    *&H400440C8 '	 /*!< (@ &H400440C8) I/O configuration for pin PIO1_26/CT32B0_MAT2/ RXD */
#define IOCON_PIO1_27                    *&H400440CC '	 /*!< (@ &H400440CC) I/O configuration for pin PIO1_27/CT32B0_MAT3/ TXD */
#define IOCON_PIO1_28                    *&H400440D0 '	 /*!< (@ &H400440D0) I/O configuration for pin PIO1_28/CT32B0_CAP0/ SCLK */
#define IOCON_PIO1_29                    *&H400440D4 '	 /*!< (@ &H400440D4) I/O configuration for pin PIO1_29/SCK0/ CT32B0_CAP1 */
#define IOCON_PIO1_30                    *&H400440D8 '
#define IOCON_PIO1_31                    *&H400440DC ' 	/*!< (@ &H400440DC) I/O configuration for pin PIO1_31 */
'} LPC_IOCON_'typedef


'// ------------------------------------------------------------------------------------------------
'// -----                                        SYSCON                                        -----
'// ------------------------------------------------------------------------------------------------



''typedef struct {                            /*!< (@ &H40048000) SYSCON Structure       */
#define SYSCON_SYSMEMREMAP                *&H40048000	'System memory remap    */
#define SYSCON_PRESETCTRL                 *&H40048004	'Peripheral reset control */
#define SYSCON_SYSPLLCTRL                 *&H40048008	'System PLL control     */
#define SYSCON_SYSPLLSTAT                 *&H4004800C	'System PLL status      */
#define SYSCON_USBPLLCTRL                 *&H40048010	'USB PLL control        */
#define SYSCON_USBPLLSTAT                 *&H40048014	'USB PLL status         */
#define SYSCON_SYSOSCCTRL                 *&H40048020	'System oscillator control */
#define SYSCON_WDTOSCCTRL                 *&H40048024	'Watchdog oscillator control */
#define SYSCON_SYSRESSTAT                 *&H40048030	'System reset status register */
#define SYSCON_SYSPLLCLKSEL               *&H40048040	'System PLL clock source select */
#define SYSCON_SYSPLLCLKUEN               *&H40048044	'System PLL clock source update enable */
#define SYSCON_USBPLLCLKSEL               *&H40048048	'USB PLL clock source select */
#define SYSCON_USBPLLCLKUEN               *&H4004804C	'USB PLL clock source update enable */
#define SYSCON_MAINCLKSEL                 *&H40048070	'Main clock source select */
#define SYSCON_MAINCLKUEN                 *&H40048074	'Main clock source update enable */
#define SYSCON_SYSAHBCLKDIV               *&H40048078	'System clock divider   */
#define SYSCON_SYSAHBCLKCTRL              *&H40048080	'System clock control   */
#define SYSCON_SSP0CLKDIV                 *&H40048094	'SSP0 clock divider     */
#define SYSCON_UARTCLKDIV                 *&H40048098	'UART clock divider     */
#define SYSCON_SSP1CLKDIV                 *&H4004809C	'SSP1 clock divider     */
#define SYSCON_USBCLKSEL                  *&H400480C0	'USB clock source select */
#define SYSCON_USBCLKUEN                  *&H400480C4	'USB clock source update enable */
#define SYSCON_USBCLKDIV                  *&H400480C8	'USB clock source divider */
#define SYSCON_CLKOUTSEL                  *&H400480E0	'CLKOUT clock source select */
#define SYSCON_CLKOUTUEN                  *&H400480E4	'CLKOUT clock source update enable */
#define SYSCON_CLKOUTDIV                  *&H400480E8	'CLKOUT clock divider   */
#define SYSCON_PIOPORCAP0                 *&H40048100	'POR captured PIO status 0 */
#define SYSCON_PIOPORCAP1                 *&H40048104	'POR captured PIO status 1 */
#define SYSCON_BODCTRL                    *&H40048150	'Brown-Out Detect       */
#define SYSCON_SYSTCKCAL                  *&H40048154	'System tick counter calibration */
#define SYSCON_IRQLATENCY                 *&H40048170	'IQR delay */
#define SYSCON_NMISRC                     *&H40048174	'NMI Source Control     */
#define SYSCON_PINTSEL(x)                 *(&H40048178+(x<<2))	'GPIO Pin Interrupt Select register 0 */
#define SYSCON_USBCLKCTRL                 *&H40048198	'USB clock control      */
#define SYSCON_USBCLKST                   *&H4004819C	'USB clock status       */
#define SYSCON_STARTERP0                  *&H40048204	'Start logic 0 interrupt wake-up enable register 0 */
#define SYSCON_STARTERP1                  *&H40048214	'Start logic 1 interrupt wake-up enable register 1 */
#define SYSCON_PDSLEEPCFG                 *&H40048230	'Power-down states in deep-sleep mode */
#define SYSCON_PDAWAKECFG                 *&H40048234	'Power-down states for wake-up from deep-sleep */
#define SYSCON_PDRUNCFG                   *&H40048238	'Power configuration register */
#define SYSCON_DEVICE_ID                  *&H400483F4	'Device ID              */
'} LPC_SYSCON_'typedef

//#define SYSRESSTAT SYSRSTSTAT // can't we get any continuity around here?
'// ------------------------------------------------------------------------------------------------
'// -----                                     GPIO_PIN_INT                                     -----
'// ------------------------------------------------------------------------------------------------



'typedef struct {                            /*!< (@ &H4004C000) GPIO_PIN_INT Structure */
#define GPIO_PIN_ISEL                       *&H4004C000	'	Pin Interrupt Mode register */
#define GPIO_PIN_IENR                       *&H4004C004	'	Pin Interrupt Enable (Rising) register */
#define GPIO_PIN_SIENR                      *&H4004C008	'	Set Pin Interrupt Enable (Rising) register */
#define GPIO_PIN_CIENR                      *&H4004C00C	'	Clear Pin Interrupt Enable (Rising) register */
#define GPIO_PIN_IENF                       *&H4004C010	'	Pin Interrupt Enable Falling Edge / Active Level register */
#define GPIO_PIN_SIENF                      *&H4004C014	'	Set Pin Interrupt Enable Falling Edge / Active Level register */
#define GPIO_PIN_CIENF                      *&H4004C018	'	Clear Pin Interrupt Enable Falling Edge / Active Level address */
#define GPIO_PIN_RISE                       *&H4004C01C	'	Pin Interrupt Rising Edge register */
#define GPIO_PIN_FALL                       *&H4004C020	'	Pin Interrupt Falling Edge register */
#define GPIO_PIN_IST                        *&H4004C024	'	Pin Interrupt Status register */
'} LPC_GPIO_PIN_INT_'typedef


// ------------------------------------------------------------------------------------------------
// -----                                    GPIO_GROUP_INT0/1                                   -----
// ------------------------------------------------------------------------------------------------



'typedef struct {                           *&H4005C000  	'	GPIO_GROUP_INT0 Structure */
#define GPIO_GROUP_INT_CTRL                       *&H4005C000  	'	GPIO grouped interrupt control register */
#define GPIO_GROUP_INT_PORT_POL(x)                *(&H4005C020+(x<<2))	'	 GPIO grouped interrupt port 0 polarity register */
#define GPIO_GROUP_INT_PORT_ENA(x)                *(&H4005C040+(x<<2))	'	 GPIO grouped interrupt port 0/1 enable register */
'} LPC_GPIO_GROUP_INTx_'typedef



// ------------------------------------------------------------------------------------------------
// -----                                          USB                                         -----
// ------------------------------------------------------------------------------------------------

#if 0


'typedef struct {                            /*!< (@ &H40080000) USB Structure          */
  __IO uint32_t DEVCMDSTAT                 /*!< (@ &H40080000) USB Device Command/Status register */
  __IO uint32_t INFO                       /*!< (@ &H40080004) USB Info register      */
  __IO uint32_t EPLISTSTART                /*!< (@ &H40080008) USB EP Command/Status List start address */
  __IO uint32_t DATABUFSTART               /*!< (@ &H4008000C) USB Data buffer start address */
  __IO uint32_t LPM                        /*!< (@ &H40080010) Link Power Management register */
  __IO uint32_t EPSKIP                     /*!< (@ &H40080014) USB Endpoint skip      */
  __IO uint32_t EPINUSE                    /*!< (@ &H40080018) USB Endpoint Buffer in use */
  __IO uint32_t EPBUFCFG                   /*!< (@ &H4008001C) USB Endpoint Buffer Configuration register */
  __IO uint32_t INTSTAT                    /*!< (@ &H40080020) USB interrupt status register */
  __IO uint32_t INTEN                      /*!< (@ &H40080024) USB interrupt enable register */
  __IO uint32_t INTSETSTAT                 /*!< (@ &H40080028) USB set interrupt status register */
  __IO uint32_t INTROUTING                 /*!< (@ &H4008002C) USB interrupt routing register */
  __I  uint32_t RESERVED0[1]
  __I  uint32_t EPTOGGLE                   /*!< (@ &H40080034) USB Endpoint toggle register */
} LPC_USB_'typedef

#endif

// ------------------------------------------------------------------------------------------------
// -----                                       GPIO_PORT                                      -----
// ------------------------------------------------------------------------------------------------



'typedef struct {                            
#define GPIO_W1(x)                      *(&H50001080+(x<<2))	'	 Word pin registers port 1 */
#define GPIO_B0(x)                      *(&H50000000+x)	'	 Byte pin registers port 0 pins PIO0_0 to PIO0_31 */
#define GPIO_B1(x)                      *(&H50000020+x)	'	 Byte pin registers port 1 */
#define GPIO_B(x)                       *(&H50000000+x)	'	 Byte pin registers port 0/1 */
#define GPIO_W0(x)                      *(&H50001000+(x<<2))	'	 Word pin registers port 0 */
#define GPIO_W(x)                       *(&H50001000+(x<<2))	'	 Word pin registers port 0/1 */
#define GPIO_DIR(x)						*(&H50002000+(x<<2))	' */
#define GPIO_MASK(x)					*(&H50002080+(x<<2))	' */
#define GPIO_PIN(x)						*(&H50002100+(x<<2))	' */
#define GPIO_MPIN(x)					*(&H50002180+(x<<2))	' */
#define GPIO_SET(x)						*(&H50002200+(x<<2))	' */
#define GPIO_CLR(x)						*(&H50002280+(x<<2))	' */
#define GPIO_NOT(x)						*(&H50002300+(x<<2))	' */
'} LPC_GPIO_'typedef

#define GPIO0_DIR						*&H50002000	' */
#define GPIO0_MASK						*&H50002080	' */
#define GPIO0_PIN						*&H50002100	' */
#define GPIO0_MPIN						*&H50002180	' */
#define GPIO0_SET						*&H50002200	' */
#define GPIO0_CLR						*&H50002280	' */
#define GPIO0_NOT						*&H50002300	' */

#define GPIO1_DIR						*&H50002004	' */
#define GPIO1_MASK						*&H50002084	' */
#define GPIO1_PIN						*&H50002104	' */
#define GPIO1_MPIN						*&H50002184	' */
#define GPIO1_SET						*&H50002204	' */
#define GPIO1_CLR						*&H50002284	' */
#define GPIO1_NOT						*&H50002304	' */

'// ------------------------------------------------------------------------------------------------
'// -----                                 Peripheral memory map                                -----
'// ------------------------------------------------------------------------------------------------

#define LPC_I2C_BASE              (&H40000000)
#define LPC_WWDT_BASE             (&H40004000)
#define LPC_UART_BASE             (&H40008000)
#define LPC_ADC_BASE              (&H4001C000)
#define LPC_PMU_BASE              (&H40038000)
#define LPC_FLASHCTRL_BASE        (&H4003C000)
#define LPC_SSP0_BASE             (&H40040000)
#define LPC_SSP1_BASE             (&H40058000)
#define LPC_IOCON_BASE            (&H40044000)
#define LPC_SYSCON_BASE           (&H40048000)
#define LPC_GPIO_PIN_INT_BASE     (&H4004C000)
#define LPC_GPIO_GROUP_INT0_BASE  (&H4005C000)
#define LPC_GPIO_GROUP_INT1_BASE  (&H40060000)
#define LPC_USB_BASE              (&H40080000)
#define LPC_GPIO_BASE             (&H50000000)


// ------------------------------------------------------------------------------------------------
// -----                                Peripheral declaration                                -----
// ------------------------------------------------------------------------------------------------

'#define LPC_I2C                   ((LPC_I2C_'typedef            *) LPC_I2C_BASE)
'#define LPC_WWDT                  ((LPC_WWDT_'typedef           *) LPC_WWDT_BASE)
'#define LPC_UART0                 ((LPC_UART_'typedef           *) LPC_UART_BASE)
'#define LPC_USART                 ((LPC_UART_'typedef           *) LPC_UART_BASE)
'#define LPC_CT16B0                ((LPC_CTxxBx_'typedef         *) LPC_CT16B0_BASE)
'#define LPC_CT16B1                ((LPC_CTxxBx_'typedef         *) LPC_CT16B1_BASE)
'#define LPC_CT32B0                ((LPC_CTxxBx_'typedef         *) LPC_CT32B0_BASE)
'#define LPC_CT32B1                ((LPC_CTxxBx_'typedef         *) LPC_CT32B1_BASE)
'#define LPC_ADC                   ((LPC_ADC_'typedef            *) LPC_ADC_BASE)
'#define LPC_PMU                   ((LPC_PMU_'typedef            *) LPC_PMU_BASE)
'#define LPC_FLASHCTRL             ((LPC_FLASHCTRL_'typedef      *) LPC_FLASHCTRL_BASE)
'#define LPC_SSP0                  ((LPC_SSPx_'typedef           *) LPC_SSP0_BASE)
'#define LPC_SSP1                  ((LPC_SSPx_'typedef           *) LPC_SSP1_BASE)
'#define LPC_IOCON                 ((LPC_IOCON_'typedef          *) LPC_IOCON_BASE)
'#define LPC_SYSCON                ((LPC_SYSCON_'typedef         *) LPC_SYSCON_BASE)
'#define LPC_GPIO_PIN_INT          ((LPC_GPIO_PIN_INT_'typedef   *) LPC_GPIO_PIN_INT_BASE)
'#define LPC_GPIO_GROUP_INT0       ((LPC_GPIO_GROUP_INTx_'typedef*) LPC_GPIO_GROUP_INT0_BASE)
'#define LPC_GPIO_GROUP_INT1       ((LPC_GPIO_GROUP_INTx_'typedef*) LPC_GPIO_GROUP_INT1_BASE)
'#define LPC_USB                   ((LPC_USB_'typedef            *) LPC_USB_BASE)
'#define LPC_GPIO                  ((LPC_GPIO_'typedef           *) LPC_GPIO_BASE)
'#define LPC_GPIO0                  ((LPC_GPIO_LegacyDef          *) LPC_GPIO_BASE)
'#define LPC_GPIO1                  ((LPC_GPIO_LegacyDef          *) (LPC_GPIO_BASE+4)



#endif  // __LPC11UXX_H__
