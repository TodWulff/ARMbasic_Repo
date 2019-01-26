#ifndef __LPC54102_H
#define __LPC54102_H

'VIC Vector Table		-- mapped to 0x0000 for both parts

#define VECTOR_BASE		&H02000000

#define	SysTick_ISR		*(VECTOR_BASE + &H3c)		'         = 15		/*!< 15 Cortex-M0 System Tick Interrupt                 */

#define	WWDT_ISR           *(VECTOR_BASE + &H40)		' = 0.		/*!< WWDT                                             */
#define	BOD_ISR            *(VECTOR_BASE + &H44)		' = 1,		/*!< BOD                                              */
#define	Reserved0_ISR      *(VECTOR_BASE + &H48)		' = 2,		/*!< Reserved Interrupt                               */
#define	DMA_ISR            *(VECTOR_BASE + &H4c)		' = 3,		/*!< DMA                                              */
#define	GINT0_ISR          *(VECTOR_BASE + &H50)		' = 4,		/*!< GINT0                                            */
#define	PININT0_ISR        *(VECTOR_BASE + &H54)		' = 5,		/*!< PININT0                                          */
#define	PININT1_ISR        *(VECTOR_BASE + &H58)		' = 6,		/*!< PININT1                                          */
#define	PININT2_ISR        *(VECTOR_BASE + &H5c)		' = 7,		/*!< PININT2                                          */
#define	PININT3_ISR        *(VECTOR_BASE + &H60)		' = 8,		/*!< PININT3                                          */
#define	UTICK_ISR          *(VECTOR_BASE + &H64)		' = 9,		/*!< UTICK                                            */
#define	MRT_ISR            *(VECTOR_BASE + &H68)		' = 10,		/*!< MRT                                              */
#define	TIMER0_ISR         *(VECTOR_BASE + &H6c)		' = 11,		/*!< CTMR0                                            */
#define	TIMER1_ISR         *(VECTOR_BASE + &H70)		' = 12,		/*!< CTMR1                                            */
#define	TIMER2_ISR         *(VECTOR_BASE + &H74)		' = 13,		/*!< CTMR2                                            */
#define	TIMER3_ISR         *(VECTOR_BASE + &H78)		' = 14,		/*!< CTMR3                                            */
#define	TIMER4_ISR         *(VECTOR_BASE + &H7c)		' = 15,		/*!< CTMR4                                            */

#define	SCT_ISR            *(VECTOR_BASE + &H80)		' = 16,		/*!< SCT                                              */
#define	UART0_ISR          *(VECTOR_BASE + &H84)		' = 17,		/*!< UART0                                            */
#define	UART1_ISR          *(VECTOR_BASE + &H88)		' = 18,		/*!< UART1                                            */
#define	UART2_ISR          *(VECTOR_BASE + &H8c)		' = 19,		/*!< UART2                                            */
#define	UART3_ISR          *(VECTOR_BASE + &H90)		' = 20,		/*!< UART3                                            */
#define	I2C0_ISR           *(VECTOR_BASE + &H94)		' = 21,		/*!< I2C0                                             */
#define	I2C1_ISR           *(VECTOR_BASE + &H98)		' = 22,		/*!< I2C1                                             */
#define	I2C2_ISR           *(VECTOR_BASE + &H9c)		' = 23,		/*!< I2C2                                             */
#define	SPI0_ISR           *(VECTOR_BASE + &Ha0)		' = 24,		/*!< SPI0                                             */
#define	SPI1_ISR           *(VECTOR_BASE + &Ha4)		' = 25,		/*!< SPI1                                             */
#define	ADC_SEQA_ISR       *(VECTOR_BASE + &Ha8)		' = 26,		/*!< ADC SEQA                                         */
#define	ADC_SEQB_ISR       *(VECTOR_BASE + &Hac)		' = 27,		/*!< ADC SEQB                                         */
#define	ADC_THCMP_OVR_ISR  *(VECTOR_BASE + &Hb0)		' = 28,		/*!< ADC THCMP OVERRUN                                */
#define	RTC_ISR            *(VECTOR_BASE + &Hb4)		' = 29,		/*!< RTC                                              */
#define	MBOX_ISR           *(VECTOR_BASE + &Hb8)		' = 31,		/*!< MBOX                                             */

#define	WWDT_IRQn            0		'	/*!< WWDT                                             */
#define	BOD_IRQn             1		'	/*!< BOD                                              */
#define	Reserved0_IRQn       2		'	/*!< Reserved Interrupt                               */
#define	DMA_IRQn             3		'	/*!< DMA                                              */
#define	GINT0_IRQn           4		'	/*!< GINT0                                            */
#define	PININT0_IRQn         5		'	/*!< PININT0                                          */
#define	PININT1_IRQn         6		'	/*!< PININT1                                          */
#define	PININT2_IRQn         7		'	/*!< PININT2                                          */
#define	PININT3_IRQn         8		'	/*!< PININT3                                          */
#define	UTICK_IRQn           9		'	/*!< UTICK                                            */
#define	MRT_IRQn             10		'	/*!< MRT                                              */
#define	TIMER0_IRQn          11		'	/*!< CTMR0                                            */
#define	TIMER1_IRQn          12		'	/*!< CTMR1                                            */
#define	TIMER2_IRQn          13		'	/*!< CTMR2                                            */
#define	TIMER3_IRQn          14		'	/*!< CTMR3                                            */
#define	TIMER4_IRQn          15		'	/*!< CTMR4                                            */
                                    '	
#define	SCT_IRQn             16		'	/*!< SCT                                              */
#define	UART0_IRQn           17		'	/*!< UART0                                            */
#define	UART1_IRQn           18		'	/*!< UART1                                            */
#define	UART2_IRQn           19		'	/*!< UART2                                            */
#define	UART3_IRQn           20		'	/*!< UART3                                            */
#define	I2C0_IRQn            21		'	/*!< I2C0                                             */
#define	I2C1_IRQn            22		'	/*!< I2C1                                             */
#define	I2C2_IRQn            23		'	/*!< I2C2                                             */
#define	SPI0_IRQn            24		'	/*!< SPI0                                             */
#define	SPI1_IRQn            25		'	/*!< SPI1                                             */
#define	ADC_SEQA_IRQn        26		'	/*!< ADC SEQA                                         */
#define	ADC_SEQB_IRQn        27		'	/*!< ADC SEQB                                         */
#define	ADC_THCMP_OVR_IRQn   28		'	/*!< ADC THCMP OVERRUN                                */
#define	RTC_IRQn             29		'	/*!< RTC                                              */
#define	MBOX_IRQn            31		'	/*!< MBOX                                             */

'   '/* Below is for CM4 only */              
#define	GINT1_ISR          *(VECTOR_BASE + &Hbc)		' = 32,		/*!< GINT1                                            */
#define	PININT4_ISR        *(VECTOR_BASE + &Hc0)		' = 33,		/*!< External Interrupt 4                             */
#define	PININT5_ISR        *(VECTOR_BASE + &Hc4)		' = 34,		/*!< External Interrupt 5                             */
#define	PININT6_ISR        *(VECTOR_BASE + &Hc8)		' = 35,		/*!< External Interrupt 6                             */
#define	PININT7_ISR        *(VECTOR_BASE + &Hcc)		' = 36,		/*!< External Interrupt 7                             */
#define	OSTIMER_ISR        *(VECTOR_BASE + &Hd0)		' = 40,		/*!< OSTIMER or RIT                                   */

#define	GINT1_IRQn          32	'	/*!< GINT1                                            */
#define	PININT4_IRQn        33	'	/*!< External Interrupt 4                             */
#define	PININT5_IRQn        34	'	/*!< External Interrupt 5                             */
#define	PININT6_IRQn        35	'	/*!< External Interrupt 6                             */
#define	PININT7_IRQn        36	'	/*!< External Interrupt 7                             */
#define	OSTIMER_IRQn        40	'	/*!< OSTIMER or RIT                                   */
                                             

'/* Vectored Interrupt Controller (VIC) */
#define VIC_BASE_ADDR	&HE000E000
#define VIC_VTOR   *(VIC_BASE_ADDR + &HD08)

#define VICIntEnSet0   *(VIC_BASE_ADDR + &H100)
#define VICIntEnSet1   *(VIC_BASE_ADDR + &H104)
#define VICIntEnClear0  *(VIC_BASE_ADDR + &H180)
#define VICIntEnClear1  *(VIC_BASE_ADDR + &H184)
#define VICIntSetPend0  *(VIC_BASE_ADDR + &H200) //nvic Irq 0-31 Set Pending
#define VICIntSetPend1  *(VIC_BASE_ADDR + &H204) //nvic Irq 32-63 Set Pending
#define VICIntClrPend0  *(VIC_BASE_ADDR + &H280) //nvic Irq 0-31 Clr Pending
#define VICIntClrPend1  *(VIC_BASE_ADDR + &H284) //nvic Irq 32-63 Clr Pending
'//aka's
#define VICIntEnable(x)   *(VIC_BASE_ADDR + &H100 + (x << 2))
#define VICIntEnClear(x)  *(VIC_BASE_ADDR + &H180 + (x << 2))
#define VICIntSetPend(x)  *(VIC_BASE_ADDR + &H200 + (x << 2)) //nvic Irq 0-31 Set Pending
#define VICIntClrPend(x)  *(VIC_BASE_ADDR + &H280 + (x << 2)) //nvic Irq 0-31 Clr Pending

#define VICVectPriority(x)  *(VIC_BASE_ADDR + &H400 + (x<<2))
'/* The name convention below is from previous LPC2000 family MCUs, in LPC23xx, these registers are known as VICVectPriority(x). */
#define VICVectCntl0   *(VIC_BASE_ADDR + &H400)
#define VICVectCntl1   *(VIC_BASE_ADDR + &H404)
#define VICVectCntl2   *(VIC_BASE_ADDR + &H408)
#define VICVectCntl3   *(VIC_BASE_ADDR + &H40C)
#define VICVectCntl4   *(VIC_BASE_ADDR + &H410)
#define VICVectCntl5   *(VIC_BASE_ADDR + &H414)
#define VICVectCntl6   *(VIC_BASE_ADDR + &H418)
#define VICVectCntl7   *(VIC_BASE_ADDR + &H41C)
#define VICVectCntl8   *(VIC_BASE_ADDR + &H420)

#define VICSTIR    *(VIC_BASE_ADDR + &HF00)
#define VICVectAddr *(VIC_BASE_ADDR + &HF00)

#define NVIC_FAULT_STAT_R       *(&HE000ED28)
'// The following are defines for the bit fields in the NVIC_FAULT_STAT register.
#define NVIC_FAULT_STAT_DIV0    &H02000000  // Divide by zero fault
#define NVIC_FAULT_STAT_UNALIGN &H01000000  // Unaligned access fault
#define NVIC_FAULT_STAT_NOCP    &H00080000  // No coprocessor fault
#define NVIC_FAULT_STAT_INVPC   &H00040000  // Invalid PC fault
#define NVIC_FAULT_STAT_INVSTAT &H00020000  // Invalid state fault
#define NVIC_FAULT_STAT_UNDEF   &H00010000  // Undefined instruction fault
#define NVIC_FAULT_STAT_BFARV   &H00008000  // BFAR is valid
#define NVIC_FAULT_STAT_BSTKE   &H00001000  // Stack bus fault
#define NVIC_FAULT_STAT_BUSTKE  &H00000800  // Unstack bus fault
#define NVIC_FAULT_STAT_IMPRE   &H00000400  // Imprecise data bus error
#define NVIC_FAULT_STAT_PRECISE &H00000200  // Precise data bus error
#define NVIC_FAULT_STAT_IBUS    &H00000100  // Instruction bus fault
#define NVIC_FAULT_STAT_MMARV   &H00000080  // MMAR is valid
#define NVIC_FAULT_STAT_MSTKE   &H00000010  // Stack access violation
#define NVIC_FAULT_STAT_MUSTKE  &H00000008  // Unstack access violation
#define NVIC_FAULT_STAT_DERR    &H00000002  // Data access violation
#define NVIC_FAULT_STAT_IERR    &H00000001  // Instruction access violation

'/* SYSTEM CONTROL */
#define SCB_BASE_ADDR	&H40000000
#define SCB_AHBMATPRIO	       *(SCB_BASE_ADDR + &H04)   		'	/*!< System Remap register */
#define SCB_SYSTCKCAL          *(SCB_BASE_ADDR + &H14) 			'	/*!< System Tick Calibration register */
#define SCB_NMISRC             *(SCB_BASE_ADDR + &H1C)			'	/*!< NMI Source select register */
#define SCB_ASYNCAPBCTRL       *(SCB_BASE_ADDR + &H20)    		'	/*!< Asynch APB chiplet control register */
#define SCB_SYSRSTSTAT         *(SCB_BASE_ADDR + &H40)  		'	/*!< System Reset Stat register */
#define SCB_PRESETCTRL(x)      *(SCB_BASE_ADDR + &H44 +(x<<2))  '	/*!< Peripheral Reset Ctrl register */
#define SCB_PRESETCTRLSET(x)   *(SCB_BASE_ADDR + &H4C +(x<<2))  '	/*!< Peripheral Reset Ctrl Set register */
#define SCB_PRESETCTRLCLR(x)   *(SCB_BASE_ADDR + &H50 +(x<<2))  '	/*!< Peripheral Reset Ctrl Clr register */
#define SCB_PIOPORCAP(x)       *(SCB_BASE_ADDR + &H58 +(x<<2))  '	/*!< PIO Power-On Reset Capture register */
#define SCB_PIORESCAP(x)       *(SCB_BASE_ADDR + &H60 +(x<<2))  '	/*!< PIO Pad Reset Capture register */
#define SCB_MAINCLKSELA        *(SCB_BASE_ADDR + &H80)   		'	/*!< Main Clk sel Source Sel A register */
#define SCB_MAINCLKSELB        *(SCB_BASE_ADDR + &H84)   		'	/*!< Main Clk sel Source Sel B register */
#define SCB_ADCCLKSEL          *(SCB_BASE_ADDR + &H8C) 			'	/*!< ADC Async Clk Sel register */
#define SCB_CLKOUTSELA         *(SCB_BASE_ADDR + &H94)  		'	/*!< Clk Out Sel Source A register */
#define SCB_CLKOUTSELB         *(SCB_BASE_ADDR + &H98)  		'	/*!< Clk Out Sel Source B register */
#define SCB_SYSPLLCLKSEL       *(SCB_BASE_ADDR + &HA0)    		'	/*!< System PLL Clk Selregister */
#define SCB_AHBCLKCTRL(x)      *(SCB_BASE_ADDR + &HC0 +(x<<2))  '	/*!< AHB Peripheral Clk Enable register */
#define SCB_AHBCLKCTRLSET(x)   *(SCB_BASE_ADDR + &HC8 +(x<<2))  '	/*!< AHB Peripheral Clk Enable Set register */
#define SCB_AHBCLKCTRLCLR(x)   *(SCB_BASE_ADDR + &HD0 +(x<<2))  '	/*!< AHB Peripheral Clk Enable Clr register */
#define SCB_SYSTICKCLKDIV      *(SCB_BASE_ADDR + &HE0)     		'	/*!< Systick Clock divider register */
#define SCB_AHBCLKDIV          *(SCB_BASE_ADDR + &H100) 		'	/*!< Main Clk Divider register */
#define SCB_ADCCLKDIV          *(SCB_BASE_ADDR + &H108) 		'	/*!< ADC Async Clk Divider register */
#define SCB_CLKOUTDIV          *(SCB_BASE_ADDR + &H10C) 		'	/*!< Clk Out Divider register */
#define SCB_FREQMECTRL         *(SCB_BASE_ADDR + &H120)  		'	/*!< Frequency Measure Control register */
#define SCB_FLASHCFG           *(SCB_BASE_ADDR + &H124)			'	/*!< Flash Config register */
#define SCB_FIFOCTRL           *(SCB_BASE_ADDR + &H148)			'	/*!< VFIFO control register */
#define SCB_IRCCCTRL           *(SCB_BASE_ADDR + &H184)  		'	/*!< RTC Oscillator Control register */
#define SCB_RTOSCCTRL          *(SCB_BASE_ADDR + &H190)  		'	/*!< RTC Oscillator Control register */
#define SCB_SYSPLLCTRL         *(SCB_BASE_ADDR + &H1B0)  		'	/*!< System PLL control register */
#define SCB_SYSPLLSTAT         *(SCB_BASE_ADDR + &H1B4)  		'	/*!< PLL status register */
#define SCB_SYSPLLNDEC         *(SCB_BASE_ADDR + &H1B8)  		'	/*!< PLL N decoder register */
#define SCB_SYSPLLPDEC         *(SCB_BASE_ADDR + &H1BC)  		'	/*!< PLL P decoder register */
#define SCB_SYSPLLSSCTRL(x)    *(SCB_BASE_ADDR + &H1C0 +(x<<2)) '	/*!< Spread Spectrum control registers */
#define SCB_PDRUNCFG           *(SCB_BASE_ADDR + &H210)			'	/*!< Power Down Run Config register */
#define SCB_PDRUNCFGSET        *(SCB_BASE_ADDR + &H214)   		'	/*!< Power Down Run Config Set register */
#define SCB_PDRUNCFGCLR        *(SCB_BASE_ADDR + &H218)   		'	/*!< Power Down Run Config Clr register */
#define SCB_STARTERP(x)        *(SCB_BASE_ADDR + &H240 +(x<<2)) '	/*!< Start Signal Enable Register */
#define SCB_STARTERSET(x)      *(SCB_BASE_ADDR + &H248 +(x<<2)) '	/*!< Start Signal Enable Set Register */
#define SCB_STARTERCLR(x)      *(SCB_BASE_ADDR + &H250 +(x<<2)) '	/*!< Start Signal Enable Clr Register */
#define SCB_CPUCTRL		       *(SCB_BASE_ADDR + &H300)         '	
#define SCB_CPUBOOT		       *(SCB_BASE_ADDR + &H304)         '	
#define SCB_CPUSTACK	       *(SCB_BASE_ADDR + &H308)         '	
#define SCB_CPUSTAT		       *(SCB_BASE_ADDR + &H30C)         '	
#define SCB_JTAG_ID		       *(SCB_BASE_ADDR + &H3F4)  		'	/*!< Boot ROM and die revision register */
#define SCB_DEVICE_ID0         *(SCB_BASE_ADDR + &H3F8)  		'	/*!< Boot ROM and die revision register */
#define SCB_DEVICE_ID1         *(SCB_BASE_ADDR + &H3FC)  		'	/*!< Boot ROM and die revision register */

'   bit fields for clock control fields
'	/* Peripheral clock enables for SCB_AHBCLKCTRL(0) */
#define SYSCON_CLOCK_ROM  		(1<<1)		'	/*!< ROM clock */
#define SYSCON_CLOCK_SRAM1  	(1<<3)		'	/*!< SRAM1 clock */
#define SYSCON_CLOCK_SRAM2		(1<<4)		'	/*!< SRAM2 clock */
#define SYSCON_CLOCK_FLASH  	(1<<7)		'	/*!< FLASH controller clock */
#define SYSCON_CLOCK_FMC		(1<<8)		'	/*!< FMC clock */
#define SYSCON_CLOCK_INPUTMUX  	(1<<11)		'	/*!< Input mux clock */
#define SYSCON_CLOCK_IOCON  	(1<<13)		'	/*!< IOCON clock */
#define SYSCON_CLOCK_GPIO0		(1<<14)		'	/*!< GPIO0 clock */
#define SYSCON_CLOCK_GPIO1		(1<<15)		'	/*!< GPIO1 clock */
#define SYSCON_CLOCK_PINT   	(1<<18)		'	/*!< PININT clock */
#define SYSCON_CLOCK_GINT		(1<<19)		'	/*!< grouped pin interrupt block clock */
#define SYSCON_CLOCK_DMA		(1<<20)		'	/*!< DMA clock */
#define SYSCON_CLOCK_CRC		(1<<21)		'	/*!< CRC clock */
#define SYSCON_CLOCK_WWDT		(1<<22)		'	/*!< WDT clock */
#define SYSCON_CLOCK_RTC		(1<<23)		'	/*!< RTC clock */
#define SYSCON_CLOCK_MAILBOX  	(1<<26)		'	/*!< Mailbox clock */
#define SYSCON_CLOCK_ADC0		(1<<27)		'	/*!< ADC0 clock */
 
' /* Peripheral clock enables for SCB_AHBCLKCTRL(1) */
#define SYSCON_CLOCK_MRT 		(1<<0)		'	/*!< multi-rate timer clock */
#define SYSCON_CLOCK_RIT		(1<<1)		'	/*!< Repetitive interval timer clock */
#define SYSCON_CLOCK_SCT0		(1<<2)		'	/*!< SCT0 clock */
#define SYSCON_CLOCK_FIFO 		(1<<9)		'	/*!< System FIFO clock */
#define SYSCON_CLOCK_UTICK		(1<<10)		'	/*!< UTICK clock */
#define SYSCON_CLOCK_TIMER2     (1<<22)		'	/*!< TIMER2 clock */
#define SYSCON_CLOCK_TIMER3     (1<<26)		'	/*!< TIMER3 clock */
#define SYSCON_CLOCK_TIMER4		(1<<27)		'	/*!< TIMER4 clock */


'/* ASYNC APB CONTROL */
#define ASYNC_BASE_ADDR	&H40080000
#define AYSNCPRESETCTRL		*(ASYNC_BASE_ADDR + &H00)	'	/*!< peripheral reset register */
#define ASYNCPRESETCTRLSET	*(ASYNC_BASE_ADDR + &H04)	'	/*!< peripheral reset Set register */
#define ASYNCPRESETCTRLCLR	*(ASYNC_BASE_ADDR + &H08)	'	/*!< peripheral reset Clr register */
#define ASYNCAPBCLKCTRL		*(ASYNC_BASE_ADDR + &H10)	'	/*!< clk enable register */
#define ASYNCAPBCLKCTRLSET	*(ASYNC_BASE_ADDR + &H14)	'	/*!< clk enable Set register */
#define ASYNCAPBCLKCTRLCLR	*(ASYNC_BASE_ADDR + &H18)	'	/*!< clk enable Clr register */
#define ASYNCAPBCLKSELA		*(ASYNC_BASE_ADDR + &H20)	'	/*!< clk source mux A register */
#define ASYNCAPBCLKSELB		*(ASYNC_BASE_ADDR + &H24)	'	/*!< clk source mux B register */
#define ASYNCCLKDIV			*(ASYNC_BASE_ADDR + &H28)	'	/*!< clk div register */
#define FRGCTRL				*(ASYNC_BASE_ADDR + &H30)	'	/*!< Fraction Rate Generator Ctrl register */

 
' /* Peripheral clock enables for AYSNCPRESETCTRL */
#define SYSCON_CLOCK_USART0 	(1<<1)		'	/*!< USART0 clock */
#define SYSCON_CLOCK_USART1		(1<<2)		'	/*!< USART1 clock */
#define SYSCON_CLOCK_USART2		(1<<3)		'	/*!< USART2 clock */
#define SYSCON_CLOCK_USART3		(1<<4)		'	/*!< USART3 clock */
#define SYSCON_CLOCK_I2C0		(1<<5)		'	/*!< I2C0  clock */
#define SYSCON_CLOCK_I2C1		(1<<6)		'	/*!< I2C1  clock */
#define SYSCON_CLOCK_I2C2		(1<<7)		'	/*!< I2C2  clock */
#define SYSCON_CLOCK_SPI0       (1<<9)		'	/*!< SPI0  clock */
#define SYSCON_CLOCK_SPI1		(1<<10)		'	/*!< SPI1  clock */
#define SYSCON_CLOCK_TIMER0     (1<<13)		'	/*!< TIMER0 clock */
#define SYSCON_CLOCK_TIMER1		(1<<14)		'	/*!< TIMER1 clock */
#define SYSCON_CLOCK_FRG		(1<<15)		'	/*!< FRG clock */


//'/* Pin Connect Block */
#define IOCON_BASE_ADDR	&H4001C000
#define IOCON(port,pin)    *(IOCON_BASE_ADDR + (port << 7) + (pin <<2))


#define GINT0_INT_ADDR		&H40010000
#define GINT1_INT_ADDR		&H40014000

'/* GPIO Interrupt Registers */
#define GINT0_CTRL   	  *(GINT0_INT_ADDR + &H00) 
#define GINT0_PORT_POL0   *(GINT0_INT_ADDR + &H20)
#define GINT0_PORT_POL1   *(GINT0_INT_ADDR + &H24)
#define GINT0_PORT_EN0    *(GINT0_INT_ADDR + &H40)
#define GINT0_PORT_EN1    *(GINT0_INT_ADDR + &H44)

#define GINT1_CTRL   	  *(GINT1_INT_ADDR + &H00) 
#define GINT1_PORT_POL0   *(GINT1_INT_ADDR + &H20)
#define GINT1_PORT_POL1   *(GINT1_INT_ADDR + &H24)
#define GINT1_PORT_EN0    *(GINT1_INT_ADDR + &H40)
#define GINT1_PORT_EN1    *(GINT1_INT_ADDR + &H44)


'/* GP I/O setup */
#define GPIO_BASE_ADDR		&H1C000000
#define GPIO0DIR        *(GPIO_BASE_ADDR + &H2000) 
#define GPIO0MASK       *(GPIO_BASE_ADDR + &H2080)
#define GPIO0PIN        *(GPIO_BASE_ADDR + &H2100)
#define GPIO0MIN        *(GPIO_BASE_ADDR + &H2180)
#define GPIO0SET        *(GPIO_BASE_ADDR + &H2200)
#define GPIO0CLR        *(GPIO_BASE_ADDR + &H2280)

#define GPIO1DIR        *(GPIO_BASE_ADDR + &H2004) 
#define GPIO1MASK       *(GPIO_BASE_ADDR + &H2084)
#define GPIO1PIN        *(GPIO_BASE_ADDR + &H2104)
#define GPIO1MPIN       *(GPIO_BASE_ADDR + &H2184)
#define GPIO1SET        *(GPIO_BASE_ADDR + &H2204)
#define GPIO1CLR        *(GPIO_BASE_ADDR + &H2284)

#define DIR0	GPIO0DIR
#define DIR1	GPIO1DIR

'/* INMUX setup */
#define INMUX_BASE_ADDR		&H40050000

#define INMUX_PINTSEL(x)			*(INMUX_BASE_ADDR + &HC0 + (x << 2))	'/*!< Pin interrupt select registers */
#define INMUX_DMA_ITRIG_INMUX(x)	*(INMUX_BASE_ADDR + &HE0 + (x << 2))	'/*!< Input mux register for DMA trigger inputs */
#define INMUX_DMA_OTIRG_INMUX(x)	*(INMUX_BASE_ADDR + &H140 + (x << 2))	'/*!< Input mux register for DMA trigger inputs */
#define INMUX_FREQMEAS_REF			*(INMUX_BASE_ADDR + &H160)				'/*!< Clock selection for frequency measurement ref clock */
#define INMUX_FREQMEAS_TARGET		*(INMUX_BASE_ADDR + &H164)				'/*!< Clock selection for frequency measurement target clock */

#define DMATRIG_ADC0_SEQA_IRQ		0	'	/*!< ADC0 sequencer A interrupt as trigger */
#define DMATRIG_ADC0_SEQB_IRQ		1	'	/*!< ADC0 sequencer B interrupt as trigger */
#define DMATRIG_SCT0_DMA0			2	'	/*!< SCT 0, DMA 0 as trigger */
#define DMATRIG_SCT0_DMA1			3	'	/*!< SCT 1, DMA 1 as trigger */
#define DMATRIG_TIMER0_MATCH0		4	'	/*!< Timer 0, match 0 trigger */
#define DMATRIG_TIMER0_MATCH1		5	'	/*!< Timer 0, match 1 trigger */
#define DMATRIG_TIMER1_MATCH0		6	'	/*!< Timer 1, match 0 trigger */
#define DMATRIG_TIMER1_MATCH1		7	'	/*!< Timer 1, match 1 trigger */
#define DMATRIG_TIMER2_MATCH0		8	'	/*!< Timer 2, match 0 trigger */
#define DMATRIG_TIMER2_MATCH1		9	'	/*!< Timer 2, match 1 trigger */
#define DMATRIG_TIMER3_MATCH0		10	'	/*!< Timer 3, match 0 trigger */
#define DMATRIG_TIMER3_MATCH1		11	'	/*!< Timer 3, match 1 trigger */
#define DMATRIG_TIMER4_MATCH0		12	'	/*!< Timer 4, match 0 trigger */
#define DMATRIG_TIMER4_MATCH1		13	'	/*!< Timer 4, match 1 trigger */
#define DMATRIG_PININT0				14	'	/*!< Pin interrupt 0 trigger */
#define DMATRIG_PININT1				15	'	/*!< Pin interrupt 1 trigger */
#define DMATRIG_PININT2				16	'	/*!< Pin interrupt 2 trigger */
#define DMATRIG_PININT3				17	'	/*!< Pin interrupt 3 trigger */
#define DMATRIG_OUTMUX0 			18	'	/*!< DMA trigger tied to this source, Select with Chip_INMUX_SetDMAOutMux */
#define DMATRIG_OUTMUX1 			19	'	/*!< DMA trigger tied to this source, Select with Chip_INMUX_SetDMAOutMux */
#define DMATRIG_OUTMUX2 			20	'	/*!< DMA trigger tied to this source, Select with Chip_INMUX_SetDMAOutMux */
#define DMATRIG_OUTMUX3				21	'	/*!< DMA trigger tied to this source, Select with Chip_INMUX_SetDMAOutMux */
                                             
'/* FIFO setup */
#define FIFO_BASE_ADDR		&H1C038000
#define FIFOCTLUSART		*(FIFO_BASE_ADDR + &H100)			'	/*!< USART FIFO global control Register */
#define FIFOUPDATEUSART		*(FIFO_BASE_ADDR + &H104)			'	/*!< USART FIFO global update Register */
#define FIFOCFGUSART(x)		*(FIFO_BASE_ADDR + &H110 +(x << 2))	'	/*!< USART FIFO configuration Registers */
#define FIFOCTLSPI			*(FIFO_BASE_ADDR + &H200)			'	/*!< SPI FIFO global control Register */
#define FIFOUPDATESPI		*(FIFO_BASE_ADDR + &H204)			'	/*!< SPI FIFO global update Register */
#define FIFOCFGSPI(x)		*(FIFO_BASE_ADDR + &H210 +(x << 2))	'	/*!< SPI FIFO configuration Registers */
	
#define FIFO_UART_CFG(x)		*(FIFO_BASE_ADDR + &H1000 * (x<<8))		'	/*!< USART configuration Register */
#define FIFO_UART_STAT(x)		*(FIFO_BASE_ADDR + &H1004 * (x<<8))		'	/*!< USART status Register */
#define FIFO_UART_INTSTAT(x)	*(FIFO_BASE_ADDR + &H1008 * (x<<8))		'	/*!< USART interrupt status Register */
#define FIFO_UART_CTLSET(x)		*(FIFO_BASE_ADDR + &H100C * (x<<8))		'	/*!< USART control read and set Register */
#define FIFO_UART_CTLCLR(x)		*(FIFO_BASE_ADDR + &H1010 * (x<<8))		'	/*!< USART control clear Register */
#define FIFO_UART_RXDAT(x)		*(FIFO_BASE_ADDR + &H1014 * (x<<8))		'	/*!< USART received data Register */
#define FIFO_UART_RXDATSTAT(x)	*(FIFO_BASE_ADDR + &H1018 * (x<<8))		'	/*!< USART received data with status Register */
#define FIFO_UART_TXDAT(x)		*(FIFO_BASE_ADDR + &H101C * (x<<8))		'	/*!< USART transmit data Register */

#define FIFO_SPI_CFG(x)			*(FIFO_BASE_ADDR + &H2000 * (x<<8))		'	/*!< SPI configuration Register */
#define FIFO_SPI_STAT(x)		*(FIFO_BASE_ADDR + &H2004 * (x<<8))		'	/*!< SPI status Register */
#define FIFO_SPI_INTSTAT(x)		*(FIFO_BASE_ADDR + &H2008 * (x<<8))		'	/*!< SPI interrupt status Register */
#define FIFO_SPI_CTLSET(x)		*(FIFO_BASE_ADDR + &H200C * (x<<8))		'	/*!< SPI control read and set Register */
#define FIFO_SPI_CTLCLR(x)		*(FIFO_BASE_ADDR + &H2010 * (x<<8))		'	/*!< SPI control clear Register */
#define FIFO_SPI_RXDAT(x)		*(FIFO_BASE_ADDR + &H2014 * (x<<8))		'	/*!< SPI received data Register */
#define FIFO_SPI_TXDATSPI(x)	*(FIFO_BASE_ADDR + &H2018 * (x<<8))		'	/*!< SPI transmit data and control Register */
                               	
	
'/* Universal Asynchronous Receiver Transmitter 0 (UART0) */
#define UART0_BASE_ADDR		&H40084000
#define UART0_CFG          *(UART0_BASE_ADDR + &H00)
#define UART0_CTL          *(UART0_BASE_ADDR + &H04)
#define UART0_STAT         *(UART0_BASE_ADDR + &H08)
#define UART0_INTENSET     *(UART0_BASE_ADDR + &H0C)
#define UART0_INTENCLR     *(UART0_BASE_ADDR + &H10)
#define UART0_RXDAT        *(UART0_BASE_ADDR + &H14)
#define UART0_RXDATSTAT    *(UART0_BASE_ADDR + &H18)
#define UART0_TXDAY        *(UART0_BASE_ADDR + &H1C)
#define UART0_BRG          *(UART0_BASE_ADDR + &H20)
#define UART0_INTSTAT      *(UART0_BASE_ADDR + &H24)
#define UART0_OSR          *(UART0_BASE_ADDR + &H28)
#define UART0_ADDR         *(UART0_BASE_ADDR + &H2C)

'/* Universal Asynchronous Receiver Transmitter 1 (UART1) */
#define UART1_BASE_ADDR		&H40088000
#define UART1_CFG          *(UART1_BASE_ADDR + &H00)
#define UART1_CTL          *(UART1_BASE_ADDR + &H04)
#define UART1_STAT         *(UART1_BASE_ADDR + &H08)
#define UART1_INTENSET     *(UART1_BASE_ADDR + &H0C)
#define UART1_INTENCLR     *(UART1_BASE_ADDR + &H10)
#define UART1_RXDAT        *(UART1_BASE_ADDR + &H14)
#define UART1_RXDATSTAT    *(UART1_BASE_ADDR + &H18)
#define UART1_TXDAY        *(UART1_BASE_ADDR + &H1C)
#define UART1_BRG          *(UART1_BASE_ADDR + &H20)
#define UART1_INTSTAT      *(UART1_BASE_ADDR + &H24)
#define UART1_OSR          *(UART1_BASE_ADDR + &H28)
#define UART1_ADDR         *(UART1_BASE_ADDR + &H2C)

'/* Universal Asynchronous Receiver Transmitter 2 (UART2) */
#define UART2_BASE_ADDR		&H4008C000
#define UART2_CFG          *(UART2_BASE_ADDR + &H00)
#define UART2_CTL          *(UART2_BASE_ADDR + &H04)
#define UART2_STAT         *(UART2_BASE_ADDR + &H08)
#define UART2_INTENSET     *(UART2_BASE_ADDR + &H0C)
#define UART2_INTENCLR     *(UART2_BASE_ADDR + &H10)
#define UART2_RXDAT        *(UART2_BASE_ADDR + &H14)
#define UART2_RXDATSTAT    *(UART2_BASE_ADDR + &H18)
#define UART2_TXDAY        *(UART2_BASE_ADDR + &H1C)
#define UART2_BRG          *(UART2_BASE_ADDR + &H20)
#define UART2_INTSTAT      *(UART2_BASE_ADDR + &H24)
#define UART2_OSR          *(UART2_BASE_ADDR + &H28)
#define UART2_ADDR         *(UART2_BASE_ADDR + &H2C)

'/* Universal Asynchronous Receiver Transmitter 3 (UART3) */
#define UART3_BASE_ADDR		&H40090000
#define UART3_CFG          *(UART3_BASE_ADDR + &H00)
#define UART3_CTL          *(UART3_BASE_ADDR + &H04)
#define UART3_STAT         *(UART3_BASE_ADDR + &H08)
#define UART3_INTENSET     *(UART3_BASE_ADDR + &H0C)
#define UART3_INTENCLR     *(UART3_BASE_ADDR + &H10)
#define UART3_RXDAT        *(UART3_BASE_ADDR + &H14)
#define UART3_RXDATSTAT    *(UART3_BASE_ADDR + &H18)
#define UART3_TXDAY        *(UART3_BASE_ADDR + &H1C)
#define UART3_BRG          *(UART3_BASE_ADDR + &H20)
#define UART3_INTSTAT      *(UART3_BASE_ADDR + &H24)
#define UART3_OSR          *(UART3_BASE_ADDR + &H28)
#define UART3_ADDR         *(UART3_BASE_ADDR + &H2C)


'/* SCT timer */
#define SCT_BASE_ADDR		&H1C018000
#define SCT_CONFIG			*(SCT_BASE_ADDR + &H00)	'; /*!< Configuration Register */
	
#define SCT_CTRL			*(SCT_BASE_ADDR + &H04)	'; /*!< Control Register */
	
#define SCT_LIMIT			*(SCT_BASE_ADDR + &H08)	'; /*!< limit register for counter L */
#define SCT_HALT			*(SCT_BASE_ADDR + &H0C)	'; /*!< halt register for counter L */
#define SCT_STOP			*(SCT_BASE_ADDR + &H10)	'; /*!< stop register for counter L */
#define SCT_START			*(SCT_BASE_ADDR + &H14)	'; /*!< start register for counter L */
	
#define SCT_COUNT			*(SCT_BASE_ADDR + &H40)	'; /*!< counter register */
  
#define SCT_STATE			*(SCT_BASE_ADDR + &H44)	'; /*!< state register for counter L */
#define SCT_INPUT			*(SCT_BASE_ADDR + &H48)	'; /*!< input register */
#define SCT_REGMODE			*(SCT_BASE_ADDR + &H4C)	'; /*!< match - capture registers mode register L */
#define SCT_OUTPUT			*(SCT_BASE_ADDR + &H50)	'; /*!< output register */
#define SCT_OUTPUTDIRCTRL	*(SCT_BASE_ADDR + &H54)	'; /*!< output counter direction Control Register */
#define SCT_RES				*(SCT_BASE_ADDR + &H58)	'; /*!< conflict resolution register */
#define SCT_DMA0REQUEST		*(SCT_BASE_ADDR + &H5C)	'; /*!< DMA0 Request Register */
#define SCT_DMA1REQUEST		*(SCT_BASE_ADDR + &H60)	'; /*!< DMA1 Request Register */
#define SCT_EVEN			*(SCT_BASE_ADDR + &HF0)	'; /*!< event enable register */
#define SCT_EVFLAG			*(SCT_BASE_ADDR + &HF4)	'; /*!< event flag register */
#define SCT_CONEN			*(SCT_BASE_ADDR + &HF8)	'; /*!< conflict enable register */
#define SCT_CONFLAG			*(SCT_BASE_ADDR + &HFC)	'; /*!< conflict flag register */

#define SCT_MATCH(x)		*(SCT_BASE_ADDR + &H100 + (x << 2))	'; /*!< match */
#define SCT_CAP(x)			*(SCT_BASE_ADDR + &H100 + (x << 2))	'; /*!< capture addr same as match */

#define SCT_MATCHREL(x)		*(SCT_BASE_ADDR + &H200 + (x << 2))	'; /*!< match rel */
#define SCT_CAPCTRL(x)		*(SCT_BASE_ADDR + &H200 + (x << 2))	'; /*!< capture ctrl addr same as match rel */

#define SCT_EVSTATE(x)		*(SCT_BASE_ADDR + &H300 + (x << 3))	'; /*!< event state */
#define SCT_EVCTRL(x)		*(SCT_BASE_ADDR + &H304 + (x << 3))	'; /*!< event ctrl  */

#define SCT_OUTSET(x)		*(SCT_BASE_ADDR + &H500 + (x << 3))	'; /*!< set output */
#define SCT_OUTCLR(x)		*(SCT_BASE_ADDR + &H504 + (x << 3))	'; /*!< clear output  */




'/* Timer 0 */
#define TMR0_BASE_ADDR		&H400B4000
#define T0_IR           *(TMR0_BASE_ADDR + &H00)
#define T0_TCR          *(TMR0_BASE_ADDR + &H04)
#define T0_TC           *(TMR0_BASE_ADDR + &H08)
#define T0_PR           *(TMR0_BASE_ADDR + &H0C)
#define T0_PC           *(TMR0_BASE_ADDR + &H10)
#define T0_MCR          *(TMR0_BASE_ADDR + &H14)
#define T0_MR0          *(TMR0_BASE_ADDR + &H18)
#define T0_MR1          *(TMR0_BASE_ADDR + &H1C)
#define T0_MR2          *(TMR0_BASE_ADDR + &H20)
#define T0_MR3          *(TMR0_BASE_ADDR + &H24)
#define T0_CCR          *(TMR0_BASE_ADDR + &H28)
#define T0_CR0          *(TMR0_BASE_ADDR + &H2C)
#define T0_CR1          *(TMR0_BASE_ADDR + &H30)
#define T0_CR2          *(TMR0_BASE_ADDR + &H34)
#define T0_CR3          *(TMR0_BASE_ADDR + &H38)
#define T0_EMR          *(TMR0_BASE_ADDR + &H3C)
#define T0_CTCR         *(TMR0_BASE_ADDR + &H70)
#define T0_PWMC         *(TMR4_BASE_ADDR + &H74)

'/* Timer 1 */
#define TMR1_BASE_ADDR		&H400B8000
#define T1_IR           *(TMR1_BASE_ADDR + &H00)
#define T1_TCR          *(TMR1_BASE_ADDR + &H04)
#define T1_TC           *(TMR1_BASE_ADDR + &H08)
#define T1_PR           *(TMR1_BASE_ADDR + &H0C)
#define T1_PC           *(TMR1_BASE_ADDR + &H10)
#define T1_MCR          *(TMR1_BASE_ADDR + &H14)
#define T1_MR0          *(TMR1_BASE_ADDR + &H18)
#define T1_MR1          *(TMR1_BASE_ADDR + &H1C)
#define T1_MR2          *(TMR1_BASE_ADDR + &H20)
#define T1_MR3          *(TMR1_BASE_ADDR + &H24)
#define T1_CCR          *(TMR1_BASE_ADDR + &H28)
#define T1_CR0          *(TMR1_BASE_ADDR + &H2C)
#define T1_CR1          *(TMR1_BASE_ADDR + &H30)
#define T1_CR2          *(TMR1_BASE_ADDR + &H34)
#define T1_CR3          *(TMR0_BASE_ADDR + &H38)
#define T1_EMR          *(TMR1_BASE_ADDR + &H3C)
#define T1_CTCR         *(TMR1_BASE_ADDR + &H70)
#define T1_PWMC         *(TMR4_BASE_ADDR + &H74)

'/* Timer 2 */
#define TMR2_BASE_ADDR		&H40004000
#define T2_IR           *(TMR2_BASE_ADDR + &H00)
#define T2_TCR          *(TMR2_BASE_ADDR + &H04)
#define T2_TC           *(TMR2_BASE_ADDR + &H08)
#define T2_PR           *(TMR2_BASE_ADDR + &H0C)
#define T2_PC           *(TMR2_BASE_ADDR + &H10)
#define T2_MCR          *(TMR2_BASE_ADDR + &H14)
#define T2_MR0          *(TMR2_BASE_ADDR + &H18)
#define T2_MR1          *(TMR2_BASE_ADDR + &H1C)
#define T2_MR2          *(TMR2_BASE_ADDR + &H20)
#define T2_MR3          *(TMR2_BASE_ADDR + &H24)
#define T2_CCR          *(TMR2_BASE_ADDR + &H28)
#define T2_CR0          *(TMR2_BASE_ADDR + &H2C)
#define T2_CR1          *(TMR2_BASE_ADDR + &H30)
#define T2_CR2          *(TMR2_BASE_ADDR + &H34)
#define T2_CR3          *(TMR0_BASE_ADDR + &H38)
#define T2_EMR          *(TMR2_BASE_ADDR + &H3C)
#define T2_CTCR         *(TMR2_BASE_ADDR + &H70)
#define T2_PWMC         *(TMR4_BASE_ADDR + &H74)

'/* Timer 3 */
#define TMR3_BASE_ADDR		&H40008000
#define T3_IR           *(TMR3_BASE_ADDR + &H00)
#define T3_TCR          *(TMR3_BASE_ADDR + &H04)
#define T3_TC           *(TMR3_BASE_ADDR + &H08)
#define T3_PR           *(TMR3_BASE_ADDR + &H0C)
#define T3_PC           *(TMR3_BASE_ADDR + &H10)
#define T3_MCR          *(TMR3_BASE_ADDR + &H14)
#define T3_MR0          *(TMR3_BASE_ADDR + &H18)
#define T3_MR1          *(TMR3_BASE_ADDR + &H1C)
#define T3_MR2          *(TMR3_BASE_ADDR + &H20)
#define T3_MR3          *(TMR3_BASE_ADDR + &H24)
#define T3_CCR          *(TMR3_BASE_ADDR + &H28)
#define T3_CR0          *(TMR3_BASE_ADDR + &H2C)
#define T3_CR1          *(TMR3_BASE_ADDR + &H30)
#define T3_CR2          *(TMR3_BASE_ADDR + &H34)
#define T3_CR3          *(TMR0_BASE_ADDR + &H38)
#define T3_EMR          *(TMR3_BASE_ADDR + &H3C)
#define T3_CTCR         *(TMR3_BASE_ADDR + &H70)
#define T3_PWMC         *(TMR4_BASE_ADDR + &H74)

'/* Timer 4 */
#define TMR4_BASE_ADDR		&H4000C000
#define T4_IR           *(TMR4_BASE_ADDR + &H00)
#define T4_TCR          *(TMR4_BASE_ADDR + &H04)
#define T4_TC           *(TMR4_BASE_ADDR + &H08)
#define T4_PR           *(TMR4_BASE_ADDR + &H0C)
#define T4_PC           *(TMR4_BASE_ADDR + &H10)
#define T4_MCR          *(TMR4_BASE_ADDR + &H14)
#define T4_MR0          *(TMR4_BASE_ADDR + &H18)
#define T4_MR1          *(TMR4_BASE_ADDR + &H1C)
#define T4_MR2          *(TMR4_BASE_ADDR + &H20)
#define T4_MR3          *(TMR4_BASE_ADDR + &H24)
#define T4_CCR          *(TMR4_BASE_ADDR + &H28)
#define T4_CR0          *(TMR4_BASE_ADDR + &H2C)
#define T4_CR1          *(TMR4_BASE_ADDR + &H30)
#define T4_CR2          *(TMR4_BASE_ADDR + &H34)
#define T4_CR3          *(TMR0_BASE_ADDR + &H38)
#define T4_EMR          *(TMR4_BASE_ADDR + &H3C)
#define T4_CTCR         *(TMR4_BASE_ADDR + &H70)
#define T4_PWMC         *(TMR4_BASE_ADDR + &H74)


'/* RTC */
#define RTC_BASE_ADDR		&H4003C000
#define RTC_CTRL	    *(RTC_BASE_ADDR + &H00)
#define RTC_MATCH	    *(RTC_BASE_ADDR + &H04)
#define RTC_COUNT	    *(RTC_BASE_ADDR + &H08)
#define RTC_WAKE	    *(RTC_BASE_ADDR + &H0C)



'/* RItimer */
#define RITIMER_BASE_ADDR		&H40070000
#define RITIMER_COMPVAL		*(RITIMER_BASE_ADDR + &H00)
#define RITIMER_MASK		*(RITIMER_BASE_ADDR + &H04)
#define RITIMER_CTRL		*(RITIMER_BASE_ADDR + &H08)
#define RITIMER_COUNTER		*(RITIMER_BASE_ADDR + &H0C)
#define RITIMER_COMPVAL_H	*(RITIMER_BASE_ADDR + &H10)
#define RITIMER_MASK_H		*(RITIMER_BASE_ADDR + &H14)
#define RITIMER_COUNTER_H	*(RITIMER_BASE_ADDR + &H1C)
                            
							
'/* MRtimer */
#define MRT_BASE_ADDR		&H40074000
#define MRT_INTVAL(x)	    *(MRT_BASE_ADDR + &H00 + (x << 4))
#define MRT_TIMER(x)	    *(MRT_BASE_ADDR + &H04 + (x << 4))
#define MRT_CTRL(x)		    *(MRT_BASE_ADDR + &H08 + (x << 4))
#define MRT_STAT(x)		    *(MRT_BASE_ADDR + &H0C + (x << 4))
                           
#define MRT_MODCFG          *(MRT_BASE_ADDR + &HF0)
#define MRT_IDLE_CH         *(MRT_BASE_ADDR + &HF4)
#define MRT_IRQ_FLAG        *(MRT_BASE_ADDR + &HF8)


'/* MicroTick */
#define UTICK_BASE_ADDR		&H40020000
#define UTICK_CTRL      *(UTICK_BASE_ADDR + &H00)
#define UTICK_STAT      *(UTICK_BASE_ADDR + &H04)


'/* A/D Converter 0 (AD0) */
#define AD0_BASE_ADDR		&H1C034000
#define AD_CTRL          *(AD0_BASE_ADDR + &H00)
#define AD_SEQA_CTRL     *(AD0_BASE_ADDR + &H08)
#define AD_SEQB_CTRL     *(AD0_BASE_ADDR + &H0C)
#define AD_SEQA_GDAT     *(AD0_BASE_ADDR + &H10)
#define AD_SEQB_GDAT     *(AD0_BASE_ADDR + &H14)
#define AD_DAT(x)        *(AD0_BASE_ADDR + &H20 + (x<<2))
#define AD_DAT0          *(AD0_BASE_ADDR + &H20)
#define AD_DAT1          *(AD0_BASE_ADDR + &H24)
#define AD_DAT2          *(AD0_BASE_ADDR + &H28)
#define AD_DAT3          *(AD0_BASE_ADDR + &H2C)
#define AD_DAT4          *(AD0_BASE_ADDR + &H30)
#define AD_DAT5          *(AD0_BASE_ADDR + &H34)
#define AD_DAT6          *(AD0_BASE_ADDR + &H38)
#define AD_DAT7          *(AD0_BASE_ADDR + &H3C)
#define AD_DAT8          *(AD0_BASE_ADDR + &H40)
#define AD_DAT9          *(AD0_BASE_ADDR + &H44)
#define AD_DAT10         *(AD0_BASE_ADDR + &H48)
#define AD_DAT11         *(AD0_BASE_ADDR + &H4C) 
#define AD_THR0_LOW      *(AD0_BASE_ADDR + &H50)
#define AD_THR1_LOW      *(AD0_BASE_ADDR + &H54)
#define AD_THR0_HIGH     *(AD0_BASE_ADDR + &H58)
#define AD_THR1_HIGH     *(AD0_BASE_ADDR + &H5C)
#define AD_CHAN_THRSET   *(AD0_BASE_ADDR + &H60)
#define AD_INTEN         *(AD0_BASE_ADDR + &H64)
#define AD_FLAGS         *(AD0_BASE_ADDR + &H68)
#define AD_STARTUP       *(AD0_BASE_ADDR + &H6C)
#define AD_CALIB         *(AD0_BASE_ADDR + &H70)



'/* Watchdog */
#define WDG_BASE_ADDR		&H40038000
#define WD_WDMOD          *(WDG_BASE_ADDR + &H00)
#define WD_WDTC           *(WDG_BASE_ADDR + &H04)
#define WD_WDFEED         *(WDG_BASE_ADDR + &H08)
#define WD_WDTV           *(WDG_BASE_ADDR + &H0C)
#define WD_WARNINT        *(WDG_BASE_ADDR + &H14)
#define WD_WINDOW         *(WDG_BASE_ADDR + &H18)


'/* SPI0 */
#define SPI0_BASE_ADDR		&H400A4000
#define SPI0_CFG			*(SPI0_BASE_ADDR + &H00)	'	/*!< SPI Configuration register */
#define SPI0_DLY			*(SPI0_BASE_ADDR + &H04)	'	/*!< SPI Delay register */
#define SPI0_STAT			*(SPI0_BASE_ADDR + &H08)	'	/*!< SPI Status register */
#define SPI0_INTENSET		*(SPI0_BASE_ADDR + &H0C)	'	/*!< SPI Interrupt Enable Set register */
#define SPI0_INTENCLR		*(SPI0_BASE_ADDR + &H10)	'	/*!< SPI Interrupt Enable Clear register */
#define SPI0_RXDAT			*(SPI0_BASE_ADDR + &H14)	'	/*!< SPI Receive Data register */
#define SPI0_TXDATCTL		*(SPI0_BASE_ADDR + &H18)	'	/*!< SPI Transmit Data with Control register */
#define SPI0_TXDAT			*(SPI0_BASE_ADDR + &H1C)	'	/*!< SPI Transmit Data register */
#define SPI0_TXCTRL			*(SPI0_BASE_ADDR + &H20)	'	/*!< SPI Transmit Control register */
#define SPI0_DIV			*(SPI0_BASE_ADDR + &H24)	'	/*!< SPI clock Divider register */
#define SPI0_INTSTAT		*(SPI0_BASE_ADDR + &H28)	'	/*!< SPI Interrupt Status register */

'/* SPI1 */
#define SPI1_BASE_ADDR		&H400A8000
#define SPI1_CFG			*(SPI1_BASE_ADDR + &H00)	'	/*!< SPI Configuration register */
#define SPI1_DLY			*(SPI1_BASE_ADDR + &H04)	'	/*!< SPI Delay register */
#define SPI1_STAT			*(SPI1_BASE_ADDR + &H08)	'	/*!< SPI Status register */
#define SPI1_INTENSET		*(SPI1_BASE_ADDR + &H0C)	'	/*!< SPI Interrupt Enable Set register */
#define SPI1_INTENCLR		*(SPI1_BASE_ADDR + &H10)	'	/*!< SPI Interrupt Enable Clear register */
#define SPI1_RXDAT			*(SPI1_BASE_ADDR + &H14)	'	/*!< SPI Receive Data register */
#define SPI1_TXDATCTL		*(SPI1_BASE_ADDR + &H18)	'	/*!< SPI Transmit Data with Control register */
#define SPI1_TXDAT			*(SPI1_BASE_ADDR + &H1C)	'	/*!< SPI Transmit Data register */
#define SPI1_TXCTRL			*(SPI1_BASE_ADDR + &H20)	'	/*!< SPI Transmit Control register */
#define SPI1_DIV			*(SPI1_BASE_ADDR + &H24)	'	/*!< SPI clock Divider register */
#define SPI1_INTSTAT		*(SPI1_BASE_ADDR + &H28)	'	/*!< SPI Interrupt Status register */


'/* I2C0 */
#define I2C0_BASE_ADDR		&H40094000
#define I2C0_CFG			*(I2C0_BASE_ADDR + &H00)		' /*!< I2C Configuration Register common for Master, Slave and Monitor */
#define I2C0_STAT			*(I2C0_BASE_ADDR + &H04)		' /*!< I2C Status Register common for Master, Slave and Monitor */
#define I2C0_INTENSET		*(I2C0_BASE_ADDR + &H08)		' /*!< I2C Interrupt Enable Set Register common for Master, Slave and Monitor */
#define I2C0_INTENCLR		*(I2C0_BASE_ADDR + &H0C)		' /*!< I2C Interrupt Enable Clear Register common for Master, Slave and Monitor */
#define I2C0_TIMEOUT		*(I2C0_BASE_ADDR + &H10)		' /*!< I2C Timeout value Register */
#define I2C0_CLKDIV			*(I2C0_BASE_ADDR + &H14)		' /*!< I2C Clock Divider Register */
#define I2C0_INTSTAT		*(I2C0_BASE_ADDR + &H18)		' /*!< I2C Interrupt Status Register */
#define I2C0_MSTCTL			*(I2C0_BASE_ADDR + &H20)		' /*!< I2C Master Control Register */
#define I2C0_MSTTIME		*(I2C0_BASE_ADDR + &H24)		' /*!< I2C Master Time Register for SCL */
#define I2C0_MSTDAT			*(I2C0_BASE_ADDR + &H28)		' /*!< I2C Master Data Register */
#define I2C0_SLVCTL			*(I2C0_BASE_ADDR + &H40)		' /*!< I2C Slave Control Register */
#define I2C0_SLVDAT			*(I2C0_BASE_ADDR + &H44)		' /*!< I2C Slave Data Register */
#define I2C0_SLVADR(x)		*(I2C0_BASE_ADDR + &H48 + (x << 2))		' /*!< I2C Slave Address Registers */
#define I2C0_SLVQUAL0		*(I2C0_BASE_ADDR + &H58)		' /*!< I2C Slave Address Qualifier 0 Register */
#define I2C0_MONRXDAT		*(I2C0_BASE_ADDR + &H80)		' /*!< I2C Monitor Data Register */

'/* I2C1 */
#define I2C1_BASE_ADDR		&H40098000
#define I2C1_CFG			*(I2C1_BASE_ADDR + &H00)		' /*!< I2C Configuration Register common for Master, Slave and Monitor */
#define I2C1_STAT			*(I2C1_BASE_ADDR + &H04)		' /*!< I2C Status Register common for Master, Slave and Monitor */
#define I2C1_INTENSET		*(I2C1_BASE_ADDR + &H08)		' /*!< I2C Interrupt Enable Set Register common for Master, Slave and Monitor */
#define I2C1_INTENCLR		*(I2C1_BASE_ADDR + &H0C)		' /*!< I2C Interrupt Enable Clear Register common for Master, Slave and Monitor */
#define I2C1_TIMEOUT		*(I2C1_BASE_ADDR + &H10)		' /*!< I2C Timeout value Register */
#define I2C1_CLKDIV			*(I2C1_BASE_ADDR + &H14)		' /*!< I2C Clock Divider Register */
#define I2C1_INTSTAT		*(I2C1_BASE_ADDR + &H18)		' /*!< I2C Interrupt Status Register */
#define I2C1_MSTCTL			*(I2C1_BASE_ADDR + &H20)		' /*!< I2C Master Control Register */
#define I2C1_MSTTIME		*(I2C1_BASE_ADDR + &H24)		' /*!< I2C Master Time Register for SCL */
#define I2C1_MSTDAT			*(I2C1_BASE_ADDR + &H28)		' /*!< I2C Master Data Register */
#define I2C1_SLVCTL			*(I2C1_BASE_ADDR + &H40)		' /*!< I2C Slave Control Register */
#define I2C1_SLVDAT			*(I2C1_BASE_ADDR + &H44)		' /*!< I2C Slave Data Register */
#define I2C1_SLVADR(x)		*(I2C1_BASE_ADDR + &H48 + (x << 2))		' /*!< I2C Slave Address Registers */
#define I2C1_SLVQUAL0		*(I2C1_BASE_ADDR + &H58)		' /*!< I2C Slave Address Qualifier 0 Register */
#define I2C1_MONRXDAT		*(I2C1_BASE_ADDR + &H80)		' /*!< I2C Monitor Data Register */

'/* I2C2 */
#define I2C2_BASE_ADDR		&H4009C000
#define I2C2_CFG			*(I2C2_BASE_ADDR + &H00)		' /*!< I2C Configuration Register common for Master, Slave and Monitor */
#define I2C2_STAT			*(I2C2_BASE_ADDR + &H04)		' /*!< I2C Status Register common for Master, Slave and Monitor */
#define I2C2_INTENSET		*(I2C2_BASE_ADDR + &H08)		' /*!< I2C Interrupt Enable Set Register common for Master, Slave and Monitor */
#define I2C2_INTENCLR		*(I2C2_BASE_ADDR + &H0C)		' /*!< I2C Interrupt Enable Clear Register common for Master, Slave and Monitor */
#define I2C2_TIMEOUT		*(I2C2_BASE_ADDR + &H10)		' /*!< I2C Timeout value Register */
#define I2C2_CLKDIV			*(I2C2_BASE_ADDR + &H14)		' /*!< I2C Clock Divider Register */
#define I2C2_INTSTAT		*(I2C2_BASE_ADDR + &H18)		' /*!< I2C Interrupt Status Register */
#define I2C2_MSTCTL			*(I2C2_BASE_ADDR + &H20)		' /*!< I2C Master Control Register */
#define I2C2_MSTTIME		*(I2C2_BASE_ADDR + &H24)		' /*!< I2C Master Time Register for SCL */
#define I2C2_MSTDAT			*(I2C2_BASE_ADDR + &H28)		' /*!< I2C Master Data Register */
#define I2C2_SLVCTL			*(I2C2_BASE_ADDR + &H40)		' /*!< I2C Slave Control Register */
#define I2C2_SLVDAT			*(I2C2_BASE_ADDR + &H44)		' /*!< I2C Slave Data Register */
#define I2C2_SLVADR(x)		*(I2C2_BASE_ADDR + &H48 + (x << 2))		' /*!< I2C Slave Address Registers */
#define I2C2_SLVQUAL0		*(I2C2_BASE_ADDR + &H58)		' /*!< I2C Slave Address Qualifier 0 Register */
#define I2C2_MONRXDAT		*(I2C2_BASE_ADDR + &H80)		' /*!< I2C Monitor Data Register */


'/* MAILBOX */
' M4 only
#define MLBX_BASE_ADDR		&H1C02C000
#define MLBX_IRQ0			*(MLBX_BASE_ADDR + &H00)		'/*!< Mailbox data -- M0 */
#define MLBX_IRQ0SET		*(MLBX_BASE_ADDR + &H04)		'/*!< Mailbox data set bits only */
#define MLBX_IRQC0LR		*(MLBX_BASE_ADDR + &H08)		'/*!< Mailbox dataclearset bits only */
' M0 only
#define MLBX_IRQ1			*(MLBX_BASE_ADDR + &H10)		'/*!< Mailbox data -- M4*/
#define MLBX_IRQ1SET		*(MLBX_BASE_ADDR + &H14)		'/*!< Mailbox data set bits only */
#define MLBX_IRQ10LR		*(MLBX_BASE_ADDR + &H18)		'/*!< Mailbox dataclearset bits only */
	
#define MLBX_MUTEX			*(MLBX_BASE_ADDR + &HF8)		'/*!< Mutex */


'/* CRC */
#define CRC_BASE_ADDR		&H1C010000
#define MODE				*(CRC_BASE_ADDR + &H00)			'/*!< CRC Mode Register */
#define SEED				*(CRC_BASE_ADDR + &H04)			'/*!< CRC SEED Register */
#define SUM					*(CRC_BASE_ADDR + &H08)			'/*!< CRC Checksum Register. */
#define WRDATA32			*(CRC_BASE_ADDR + &H08)			'/*!< CRC Data Register: write size 32-bit*/

#endif

