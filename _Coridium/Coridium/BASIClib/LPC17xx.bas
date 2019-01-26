#ifndef __LPC17xx_H
#define __LPC17xx_H

'VIC Vector Table
#define PSV_ISR 		*&H10000038 ' 14: The PendSV handler
#define SYSTICK_ISR 	*&H1000003C ' 15: The SysTick handler
#define WDT_ISR 		*&H10000040 ' 16: Watchdog Timer
#define TIMER0_ISR 		*&H10000044 ' 17: Timer0
#define TIMER1_ISR 		*&H10000048 ' 18: Timer1
#define TIMER2_ISR 		*&H1000004C ' 19: Timer2
#define TIMER3_ISR 		*&H10000050 ' 20: Timer3
#define UART0_ISR 		*&H10000054 ' 21: UART0
#define UART1_ISR 		*&H10000058 ' 22: UART1
#define UART2_ISR 		*&H1000005C ' 23: UART2
#define UART3_ISR 		*&H10000060 ' 24: UART3
#define PWM1_ISR 		*&H10000064 ' 25: PWM1
#define I2C0_ISR 		*&H10000068 ' 26: I2C0
#define I2C1_ISR 		*&H1000006C ' 27: I2C1
#define I2C2_ISR 		*&H10000070 ' 28: I2C2
#define SPI_ISR 		*&H10000074 ' 29: SPI

#define SSP0_ISR 		*&H10000078 ' 30: SSP0
#define SSP1_ISR 		*&H1000007C ' 31: SSP1
#define PLL0L_ISR 		*&H10000080 ' 32: PLL0 Lock (Main PLL)
#define RTC_ISR 		*&H10000084 ' 33: Real Time Clock
#define EINT0_ISR 		*&H10000088 ' 34: External Interrupt 0
#define EINT1_ISR 		*&H1000008C ' 35: External Interrupt 1
#define EINT2_ISR 		*&H10000090 ' 36: External Interrupt 2
#define EINT3_ISR 		*&H10000094 ' 37: External Interrupt 3
#define ADC_ISR 		*&H10000098 ' 38: A/D Converter
#define BOD_ISR 		*&H1000009C ' 39: Brown-Out Detect
#define USB_ISR 		*&H100000A0 ' 40: USB
#define CAN_ISR 		*&H100000A4 ' 41: CAN
#define DMA_ISR 		*&H100000A8 ' 42: General Purpose DMA
#define I2S_ISR 		*&H100000AC ' 43: I2S
#define ETH_ISR 		*&H100000B0 ' 44: Ethernet
#define RIT_ISR 		*&H100000B4 ' 45: Repetitive Interrupt Timer
#define MOTOCON_ISR 	*&H100000B8 ' 46: Motor Control PWM
#define QUAD_ISR 		*&H100000BC ' 47: Quadrature Encoder Interface
#define PLL1L_ISR 		*&H100000C0 ' 48: PLL1 Lock (USB PLL)

#define WDT_IRQn 		0	' Watchdog Timer
#define TIMER0_IRQn 	1	' Timer0
#define TIMER1_IRQn 	2	' Timer1
#define TIMER2_IRQn 	3	' Timer2
#define TIMER3_IRQn 	4	' Timer3
#define UART0_IRQn 		5	' UART0
#define UART1_IRQn 		6	' UART1
#define UART2_IRQn 		7	' UART2
#define UART3_IRQn 		8	' UART3
#define PWM1_IRQn 		9	' PWM1
#define I2C0_IRQn 		10 	' I2C0
#define I2C1_IRQn 		11 	' I2C1
#define I2C2_IRQn 		12 	' I2C2
#define SPI_IRQn 		13 	' SPI                         
#define SSP0_IRQn 		14 	' SSP0
#define SSP1_IRQn 		15 	' SSP1

#define PLL0L_IRQn 		16 	' PLL0 Lock (Main PLL)
#define RTC_IRQn 		17 	' Real Time Clock
#define EINT0_IRQn 		18 	' External Interrupt 0
#define EINT1_IRQn 		19 	' External Interrupt 1
#define EINT2_IRQn 		20 	' External Interrupt 2
#define EINT3_IRQn 		21 	' External Interrupt 3
#define ADC_IRQn 		22 	' A/D Converter
#define BOD_IRQn 		23 	' Brown-Out Detect
#define USB_IRQn 		24 	' USB
#define CAN_IRQn 		25 	' CAN
#define DMA_IRQn 		26 	' General Purpose DMA
#define I2S_IRQn 		27 	' I2S
#define ETH_IRQn 		28 	' Ethernet
#define RIT_IRQn 		29 	' Repetitive Interrupt Timer
#define MOTOCON_IRQn 	30 	' Motor Control PWM
#define QUAD_IRQn 		31 	' Quadrature Encoder Interface

#define PLL1L_IRQn		1 	' PLL1 Lock (USB PLL)
                         	
                        
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


///* The name convention below is from previous LPC2000 family MCUs, in LPC23xx, these registers are known as "VICVectPriority(x)". */
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
// The following are defines for the bit fields in the NVIC_FAULT_STAT register.
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


///* Pin Connect Block */
#define PINSEL_BASE_ADDR	&H4002C000
#define PCB_PINSEL0        *(PINSEL_BASE_ADDR + &H00)
#define PCB_PINSEL1        *(PINSEL_BASE_ADDR + &H04)
#define PCB_PINSEL2        *(PINSEL_BASE_ADDR + &H08)
#define PCB_PINSEL3        *(PINSEL_BASE_ADDR + &H0C)
#define PCB_PINSEL4        *(PINSEL_BASE_ADDR + &H10)
#define PCB_PINSEL5        *(PINSEL_BASE_ADDR + &H14)
#define PCB_PINSEL6        *(PINSEL_BASE_ADDR + &H18)
#define PCB_PINSEL7        *(PINSEL_BASE_ADDR + &H1C)
#define PCB_PINSEL8        *(PINSEL_BASE_ADDR + &H20)
#define PCB_PINSEL9        *(PINSEL_BASE_ADDR + &H24)
#define PCB_PINSEL10       *(PINSEL_BASE_ADDR + &H28)
#define PCB_PINMODE0       *(PINSEL_BASE_ADDR + &H40)
#define PCB_PINMODE1       *(PINSEL_BASE_ADDR + &H44)
#define PCB_PINMODE2       *(PINSEL_BASE_ADDR + &H48)
#define PCB_PINMODE3       *(PINSEL_BASE_ADDR + &H4C)
#define PCB_PINMODE4       *(PINSEL_BASE_ADDR + &H50)
#define PCB_PINMODE5       *(PINSEL_BASE_ADDR + &H54)
#define PCB_PINMODE6       *(PINSEL_BASE_ADDR + &H58)
#define PCB_PINMODE7       *(PINSEL_BASE_ADDR + &H5C)
#define PCB_PINMODE8       *(PINSEL_BASE_ADDR + &H60)
#define PCB_PINMODE9       *(PINSEL_BASE_ADDR + &H64)

#define PCB_PINMODEOD0     *(PINSEL_BASE_ADDR + &H68)
#define PCB_PINMODEOD1     *(PINSEL_BASE_ADDR + &H6C)
#define PCB_PINMODEOD2     *(PINSEL_BASE_ADDR + &H70)
#define PCB_PINMODEOD3     *(PINSEL_BASE_ADDR + &H74)
#define PCB_PINMODEOD4     *(PINSEL_BASE_ADDR + &H78)
#define PCB_I2CPADCFG      *(PINSEL_BASE_ADDR + &H7C)


#define GPIO_BASE_ADDR		&H40028000

/* GPIO Interrupt Registers */
#define GPIO0_INT_EN_R    *(GPIO_BASE_ADDR + &H90) 
#define GPIO0_INT_EN_F    *(GPIO_BASE_ADDR + &H94)
#define GPIO0_INT_STAT_R  *(GPIO_BASE_ADDR + &H84)
#define GPIO0_INT_STAT_F  *(GPIO_BASE_ADDR + &H88)
#define GPIO0_INT_CLR     *(GPIO_BASE_ADDR + &H8C)

#define GPIO2_INT_EN_R    *(GPIO_BASE_ADDR + &HB0) 
#define GPIO2_INT_EN_F    *(GPIO_BASE_ADDR + &HB4)
#define GPIO2_INT_STAT_R  *(GPIO_BASE_ADDR + &HA4)
#define GPIO2_INT_STAT_F  *(GPIO_BASE_ADDR + &HA8)
#define GPIO2_INT_CLR     *(GPIO_BASE_ADDR + &HAC)

#define GPIO_INT_STAT     *(GPIO_BASE_ADDR + &H80)


/* Fast I/O setup */
#define FIO_BASE_ADDR		&H2009C000
#define FIO0DIR        *(FIO_BASE_ADDR + &H00) 
#define FIO0MASK       *(FIO_BASE_ADDR + &H10)
#define FIO0PIN        *(FIO_BASE_ADDR + &H14)
#define FIO0SET        *(FIO_BASE_ADDR + &H18)
#define FIO0CLR        *(FIO_BASE_ADDR + &H1C)

#define FIO1DIR        *(FIO_BASE_ADDR + &H20) 
#define FIO1MASK       *(FIO_BASE_ADDR + &H30)
#define FIO1PIN        *(FIO_BASE_ADDR + &H34)
#define FIO1SET        *(FIO_BASE_ADDR + &H38)
#define FIO1CLR        *(FIO_BASE_ADDR + &H3C)

#define FIO2DIR        *(FIO_BASE_ADDR + &H40) 
#define FIO2MASK       *(FIO_BASE_ADDR + &H50)
#define FIO2PIN        *(FIO_BASE_ADDR + &H54)
#define FIO2SET        *(FIO_BASE_ADDR + &H58)
#define FIO2CLR        *(FIO_BASE_ADDR + &H5C)

#define FIO3DIR        *(FIO_BASE_ADDR + &H60) 
#define FIO3MASK       *(FIO_BASE_ADDR + &H70)
#define FIO3PIN        *(FIO_BASE_ADDR + &H74)
#define FIO3SET        *(FIO_BASE_ADDR + &H78)
#define FIO3CLR        *(FIO_BASE_ADDR + &H7C)

#define FIO4DIR        *(FIO_BASE_ADDR + &H80) 
#define FIO4MASK       *(FIO_BASE_ADDR + &H90)
#define FIO4PIN        *(FIO_BASE_ADDR + &H94)
#define FIO4SET        *(FIO_BASE_ADDR + &H98)
#define FIO4CLR        *(FIO_BASE_ADDR + &H9C)

#define DIR0	FIO0DIR
#define DIR1	FIO1DIR
#define DIR2	FIO2DIR
#define DIR3	FIO3DIR
#define DIR4	FIO4DIR


///* System Control Block(SCB) modules include Memory Accelerator Module,
//Phase Locked Loop, VPB divider, Power Control, External Interrupt, 
//Reset, and Code Security/Debugging */
#define SCB_BASE_ADDR	&H400FC000

///* Memory Accelerator Module (MAM) */
#define MAM_CR          *(SCB_BASE_ADDR + &H000)
//aka, FLASHCFG includes TIM
#define SCB_FLASHCFG          *(SCB_BASE_ADDR + &H000)
//#define MAM_TIM         *(SCB_BASE_ADDR + &H004)
//#define SCB_MEMMAP         *(SCB_BASE_ADDR + &H040)

///* Phase Locked Loop (Main PLL) */
#define SCB_PLLCON         *(SCB_BASE_ADDR + &H080)
#define SCB_PLLCFG         *(SCB_BASE_ADDR + &H084)
#define SCB_PLLSTAT        *(SCB_BASE_ADDR + &H088)
#define SCB_PLLFEED        *(SCB_BASE_ADDR + &H08C)
//aka Main PLL
#define SCB_PLL0CON         *(SCB_BASE_ADDR + &H080)
#define SCB_PLL0CFG         *(SCB_BASE_ADDR + &H084)
#define SCB_PLL0STAT        *(SCB_BASE_ADDR + &H088)
#define SCB_PLL0FEED        *(SCB_BASE_ADDR + &H08C)

//USB PLL
#define SCB_PLL1CON         *(SCB_BASE_ADDR + &H0A0)
#define SCB_PLL1CFG         *(SCB_BASE_ADDR + &H0A4)
#define SCB_PLL1STAT        *(SCB_BASE_ADDR + &H0A8)
#define SCB_PLL1FEED        *(SCB_BASE_ADDR + &H0AC)


/* Clock Divider */
// #define APBDIV         *(SCB_BASE_ADDR + &H100)
#define SCB_CCLKCFG        *(SCB_BASE_ADDR + &H104)
#define SCB_USBCLKCFG      *(SCB_BASE_ADDR + &H108)
#define SCB_CLKSRCSEL      *(SCB_BASE_ADDR + &H10C)
#define SCB_IRCTRIM        *(SCB_BASE_ADDR + &H1A4)
#define SCB_PCLKSEL0       *(SCB_BASE_ADDR + &H1A8)
#define SCB_PCLKSEL1       *(SCB_BASE_ADDR + &H1AC)
	
/* Power Control */
#define SCB_PCON           *(SCB_BASE_ADDR + &H0C0)
#define SCB_PCONP          *(SCB_BASE_ADDR + &H0C4)

/* Utility */
#define SCB_CLOCKOUTCFG    *(SCB_BASE_ADDR + &H1C8)

///* External Interrupts */
#define SCB_EXTINT         *(SCB_BASE_ADDR + &H140)
//#define SCB_INTWAKE        *(SCB_BASE_ADDR + &H144)
#define SCB_EXTMODE        *(SCB_BASE_ADDR + &H148)
#define SCB_EXTPOLAR       *(SCB_BASE_ADDR + &H14C)

///* Reset, reset source identification */
#define SCB_RSIR           *(SCB_BASE_ADDR + &H180)

///* RSID, code security protection */
//#define SCB_CSPR           *(SCB_BASE_ADDR + &H184)

///* AHB configuration */
//#define SCB_AHBCFG1        *(SCB_BASE_ADDR + &H188)
//#define SCB_AHBCFG2        *(SCB_BASE_ADDR + &H18C)

///* System Controls and Status */
#define SCB_SCS            *(SCB_BASE_ADDR + &H1A0)	

///* System Controls and Status */
#define SCB_DMAREQSEL      *(SCB_BASE_ADDR + &H1C4)	
	
/* Timer 0 */
#define TMR0_BASE_ADDR		&H40004000
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
#define T0_EMR          *(TMR0_BASE_ADDR + &H3C)
#define T0_CTCR         *(TMR0_BASE_ADDR + &H70)

/* Timer 1 */
#define TMR1_BASE_ADDR		&H40008000
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
#define T1_EMR          *(TMR1_BASE_ADDR + &H3C)
#define T1_CTCR         *(TMR1_BASE_ADDR + &H70)

/* Timer 2 */
#define TMR2_BASE_ADDR		&H40090000
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
#define T2_EMR          *(TMR2_BASE_ADDR + &H3C)
#define T2_CTCR         *(TMR2_BASE_ADDR + &H70)

/* Timer 3 */
#define TMR3_BASE_ADDR		&H40094000
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
#define T3_EMR          *(TMR3_BASE_ADDR + &H3C)
#define T3_CTCR         *(TMR3_BASE_ADDR + &H70)

/* Repetitive Timer */
#define RI_BASE_ADDR		&H400B0000
#define RI_COMPVAL      *(RI_BASE_ADDR + &H00)
#define RI_MASK         *(RI_BASE_ADDR + &H04)
#define RI_CTRL         *(RI_BASE_ADDR + &H08)
#define RI_COUNER       *(RI_BASE_ADDR + &H0C)

/* Sys Tick Timer */
#define ST_BASE_ADDR		&HE000E000
#define ST_CTRL         *(ST_BASE_ADDR + &H10)
#define ST_RELOAD       *(ST_BASE_ADDR + &H14)
#define ST_CURR         *(ST_BASE_ADDR + &H18)
#define ST_CALIB        *(ST_BASE_ADDR + &H1C)


/* Pulse Width Modulator (PWM) */

#define PWM1_BASE_ADDR		&H40018000
#define PWM1_IR          *(PWM1_BASE_ADDR + &H00)
#define PWM1_TCR         *(PWM1_BASE_ADDR + &H04)
#define PWM1_TC          *(PWM1_BASE_ADDR + &H08)
#define PWM1_PR          *(PWM1_BASE_ADDR + &H0C)
#define PWM1_PC          *(PWM1_BASE_ADDR + &H10)
#define PWM1_MCR         *(PWM1_BASE_ADDR + &H14)
#define PWM1_MR0         *(PWM1_BASE_ADDR + &H18)
#define PWM1_MR1         *(PWM1_BASE_ADDR + &H1C)
#define PWM1_MR2         *(PWM1_BASE_ADDR + &H20)
#define PWM1_MR3         *(PWM1_BASE_ADDR + &H24)
#define PWM1_CCR         *(PWM1_BASE_ADDR + &H28)
#define PWM1_CR0         *(PWM1_BASE_ADDR + &H2C)
#define PWM1_CR1         *(PWM1_BASE_ADDR + &H30)
#define PWM1_CR2         *(PWM1_BASE_ADDR + &H34)
#define PWM1_CR3         *(PWM1_BASE_ADDR + &H38)
#define PWM1_EMR         *(PWM1_BASE_ADDR + &H3C)
#define PWM1_MR4         *(PWM1_BASE_ADDR + &H40)
#define PWM1_MR5         *(PWM1_BASE_ADDR + &H44)
#define PWM1_MR6         *(PWM1_BASE_ADDR + &H48)
#define PWM1_PCR         *(PWM1_BASE_ADDR + &H4C)
#define PWM1_LER         *(PWM1_BASE_ADDR + &H50)
#define PWM1_CTCR        *(PWM1_BASE_ADDR + &H70)


/* Universal Asynchronous Receiver Transmitter 0 (UART0) */
#define UART0_BASE_ADDR		&H4000C000
#define UART0_RBR          *(UART0_BASE_ADDR + &H00)
#define UART0_THR          *(UART0_BASE_ADDR + &H00)
#define UART0_DLL          *(UART0_BASE_ADDR + &H00)
#define UART0_DLM          *(UART0_BASE_ADDR + &H04)
#define UART0_IER          *(UART0_BASE_ADDR + &H04)
#define UART0_IIR          *(UART0_BASE_ADDR + &H08)
#define UART0_FCR          *(UART0_BASE_ADDR + &H08)
#define UART0_LCR          *(UART0_BASE_ADDR + &H0C)
#define UART0_LSR          *(UART0_BASE_ADDR + &H14)
#define UART0_SCR          *(UART0_BASE_ADDR + &H1C)
#define UART0_ACR          *(UART0_BASE_ADDR + &H20)
#define UART0_ICR          *(UART0_BASE_ADDR + &H24)
#define UART0_FDR          *(UART0_BASE_ADDR + &H28)
#define UART0_TER          *(UART0_BASE_ADDR + &H30)
#define UART0_FIFOLVL      *(UART0_BASE_ADDR + &H58)

/* Universal Asynchronous Receiver Transmitter 1 (UART1) */
#define UART1_BASE_ADDR		&H40010000
#define UART1_RBR          *(UART1_BASE_ADDR + &H00)
#define UART1_THR          *(UART1_BASE_ADDR + &H00)
#define UART1_DLL          *(UART1_BASE_ADDR + &H00)
#define UART1_DLM          *(UART1_BASE_ADDR + &H04)
#define UART1_IER          *(UART1_BASE_ADDR + &H04)
#define UART1_IIR          *(UART1_BASE_ADDR + &H08)
#define UART1_FCR          *(UART1_BASE_ADDR + &H08)
#define UART1_LCR          *(UART1_BASE_ADDR + &H0C)
#define UART1_MCR          *(UART1_BASE_ADDR + &H10)
#define UART1_LSR          *(UART1_BASE_ADDR + &H14)
#define UART1_MSR          *(UART1_BASE_ADDR + &H18)
#define UART1_SCR          *(UART1_BASE_ADDR + &H1C)
#define UART1_ACR          *(UART1_BASE_ADDR + &H20)
#define UART1_FDR          *(UART1_BASE_ADDR + &H28)
#define UART1_TER          *(UART1_BASE_ADDR + &H30)
#define UART1_FIFOLVL      *(UART1_BASE_ADDR + &H58)

/* Universal Asynchronous Receiver Transmitter 2 (UART2) */
#define UART2_BASE_ADDR		&H40098000
#define UART2_RBR          *(UART2_BASE_ADDR + &H00)
#define UART2_THR          *(UART2_BASE_ADDR + &H00)
#define UART2_DLL          *(UART2_BASE_ADDR + &H00)
#define UART2_DLM          *(UART2_BASE_ADDR + &H04)
#define UART2_IER          *(UART2_BASE_ADDR + &H04)
#define UART2_IIR          *(UART2_BASE_ADDR + &H08)
#define UART2_FCR          *(UART2_BASE_ADDR + &H08)
#define UART2_LCR          *(UART2_BASE_ADDR + &H0C)
#define UART2_LSR          *(UART2_BASE_ADDR + &H14)
#define UART2_SCR          *(UART2_BASE_ADDR + &H1C)
#define UART2_ACR          *(UART2_BASE_ADDR + &H20)
#define UART2_ICR          *(UART2_BASE_ADDR + &H24)
#define UART2_FDR          *(UART2_BASE_ADDR + &H28)
#define UART2_TER          *(UART2_BASE_ADDR + &H30)
#define UART2_FIFOLVL      *(UART2_BASE_ADDR + &H58)

/* Universal Asynchronous Receiver Transmitter 3 (UART3) */
#define UART3_BASE_ADDR		&H4009C000
#define UART3_RBR          *(UART3_BASE_ADDR + &H00)
#define UART3_THR          *(UART3_BASE_ADDR + &H00)
#define UART3_DLL          *(UART3_BASE_ADDR + &H00)
#define UART3_DLM          *(UART3_BASE_ADDR + &H04)
#define UART3_IER          *(UART3_BASE_ADDR + &H04)
#define UART3_IIR          *(UART3_BASE_ADDR + &H08)
#define UART3_FCR          *(UART3_BASE_ADDR + &H08)
#define UART3_LCR          *(UART3_BASE_ADDR + &H0C)
#define UART3_LSR          *(UART3_BASE_ADDR + &H14)
#define UART3_SCR          *(UART3_BASE_ADDR + &H1C)
#define UART3_ACR          *(UART3_BASE_ADDR + &H20)
#define UART3_ICR          *(UART3_BASE_ADDR + &H24)
#define UART3_FDR          *(UART3_BASE_ADDR + &H28)
#define UART3_TER          *(UART3_BASE_ADDR + &H30)
#define UART3_FIFOLVL      *(UART3_BASE_ADDR + &H58)

/* use a pointer to save space */
#define UARTX_RBR       *(UARTBASE + &H00)
#define UARTX_THR       *(UARTBASE + &H00)
#define UARTX_IER       *(UARTBASE + &H04)
#define UARTX_IIR       *(UARTBASE + &H08)
#define UARTX_FCR       *(UARTBASE + &H08)
#define UARTX_LCR       *(UARTBASE + &H0C)
#define UARTX_LSR       *(UARTBASE + &H14)
#define UARTX_SCR       *(UARTBASE + &H1C)
#define UARTX_DLL       *(UARTBASE + &H00)
#define UARTX_DLM       *(UARTBASE + &H04)

/* I2C Interface 0 */
#define I2C0_BASE_ADDR		&H4001C000
#define I2C0CONSET      *(I2C0_BASE_ADDR + &H00)
#define I2C0STAT        *(I2C0_BASE_ADDR + &H04)
#define I2C0DAT         *(I2C0_BASE_ADDR + &H08)
#define I2C0ADR         *(I2C0_BASE_ADDR + &H0C)
#define I2C0SCLH        *(I2C0_BASE_ADDR + &H10)
#define I2C0SCLL        *(I2C0_BASE_ADDR + &H14)
#define I2C0CONCLR      *(I2C0_BASE_ADDR + &H18)
#define I2C0MMCTL       *(I2C0_BASE_ADDR + &H1C)

/* I2C Interface 1 */
#define I2C1_BASE_ADDR		&H4005C000
#define I2C1CONSET      *(I2C1_BASE_ADDR + &H00)
#define I2C1STAT        *(I2C1_BASE_ADDR + &H04)
#define I2C1DAT         *(I2C1_BASE_ADDR + &H08)
#define I2C1ADR         *(I2C1_BASE_ADDR + &H0C)
#define I2C1SCLH        *(I2C1_BASE_ADDR + &H10)
#define I2C1SCLL        *(I2C1_BASE_ADDR + &H14)
#define I2C1CONCLR      *(I2C1_BASE_ADDR + &H18)
#define I2C1MMCTL       *(I2C1_BASE_ADDR + &H1C)

/* I2C Interface 2 */
#define I2C2_BASE_ADDR		&H400A0000
#define I2C2CONSET      *(I2C2_BASE_ADDR + &H00)
#define I2C2STAT        *(I2C2_BASE_ADDR + &H04)
#define I2C2DAT         *(I2C2_BASE_ADDR + &H08)
#define I2C2ADR         *(I2C2_BASE_ADDR + &H0C)
#define I2C2SCLH        *(I2C2_BASE_ADDR + &H10)
#define I2C2SCLL        *(I2C2_BASE_ADDR + &H14)
#define I2C2CONCLR      *(I2C2_BASE_ADDR + &H18)
#define I2C2MMCTL       *(I2C2_BASE_ADDR + &H1C)

/* SPI0 (Serial Peripheral Interface 0) */
#define SPI0_BASE_ADDR		&H40020000
#define S0SPCR         *(SPI0_BASE_ADDR + &H00)
#define S0SPSR         *(SPI0_BASE_ADDR + &H04)
#define S0SPDR         *(SPI0_BASE_ADDR + &H08)
#define S0SPCCR        *(SPI0_BASE_ADDR + &H0C)
#define S0SPINT        *(SPI0_BASE_ADDR + &H1C)

/* SSP0 Controller */
#define SSP0_BASE_ADDR		&H40088000
#define SSP0CR0        *(SSP0_BASE_ADDR + &H00)
#define SSP0CR1        *(SSP0_BASE_ADDR + &H04)
#define SSP0DR         *(SSP0_BASE_ADDR + &H08)
#define SSP0SR         *(SSP0_BASE_ADDR + &H0C)
#define SSP0CPSR       *(SSP0_BASE_ADDR + &H10)
#define SSP0IMSC       *(SSP0_BASE_ADDR + &H14)
#define SSP0RIS        *(SSP0_BASE_ADDR + &H18)
#define SSP0MIS        *(SSP0_BASE_ADDR + &H1C)
#define SSP0ICR        *(SSP0_BASE_ADDR + &H20)
#define SSP0DMACR      *(SSP0_BASE_ADDR + &H24)

/* SSP1 Controller */
#define SSP1_BASE_ADDR		&H40030000
#define SSP1CR0        *(SSP1_BASE_ADDR + &H00)
#define SSP1CR1        *(SSP1_BASE_ADDR + &H04)
#define SSP1DR         *(SSP1_BASE_ADDR + &H08)
#define SSP1SR         *(SSP1_BASE_ADDR + &H0C)
#define SSP1CPSR       *(SSP1_BASE_ADDR + &H10)
#define SSP1IMSC       *(SSP1_BASE_ADDR + &H14)
#define SSP1RIS        *(SSP1_BASE_ADDR + &H18)
#define SSP1MIS        *(SSP1_BASE_ADDR + &H1C)
#define SSP1ICR        *(SSP1_BASE_ADDR + &H20)
#define SSP1DMACR      *(SSP1_BASE_ADDR + &H24)


/* Real Time Clock */
#define RTC_BASE_ADDR		&H40024000
#define RTC_ILR            *(RTC_BASE_ADDR + &H00)
#define RTC_CTC            *(RTC_BASE_ADDR + &H04)
#define RTC_CCR            *(RTC_BASE_ADDR + &H08)
#define RTC_CIIR           *(RTC_BASE_ADDR + &H0C)
#define RTC_AMR            *(RTC_BASE_ADDR + &H10)
#define RTC_CTIME0         *(RTC_BASE_ADDR + &H14)
#define RTC_CTIME1         *(RTC_BASE_ADDR + &H18)
#define RTC_CTIME2         *(RTC_BASE_ADDR + &H1C)
#define RTC_SEC            *(RTC_BASE_ADDR + &H20)
#define RTC_MIN            *(RTC_BASE_ADDR + &H24)
#define RTC_HOUR           *(RTC_BASE_ADDR + &H28)
#define RTC_DOM            *(RTC_BASE_ADDR + &H2C)
#define RTC_DAY            *(RTC_BASE_ADDR + &H2C) //aka
#define RTC_DOW            *(RTC_BASE_ADDR + &H30)
#define RTC_DOY            *(RTC_BASE_ADDR + &H34)
#define RTC_MONTH          *(RTC_BASE_ADDR + &H38)
#define RTC_YEAR           *(RTC_BASE_ADDR + &H3C)
#define RTC_CISS           *(RTC_BASE_ADDR + &H40)

#define RTC_GPREG0        *(RTC_BASE_ADDR + &H44)
#define RTC_GPREG1        *(RTC_BASE_ADDR + &H48)
#define RTC_GPREG2        *(RTC_BASE_ADDR + &H4C)
#define RTC_GPREG3        *(RTC_BASE_ADDR + &H50)
#define RTC_GPREG4        *(RTC_BASE_ADDR + &H54)
#define RTC_AUX		      *(RTC_BASE_ADDR + &H5C)

#define RTC_ALSEC          *(RTC_BASE_ADDR + &H60)
#define RTC_ALMIN          *(RTC_BASE_ADDR + &H64)
#define RTC_ALHOUR         *(RTC_BASE_ADDR + &H68)
#define RTC_ALDOM          *(RTC_BASE_ADDR + &H6C)
#define RTC_ALDOW          *(RTC_BASE_ADDR + &H70)
#define RTC_ALDOY          *(RTC_BASE_ADDR + &H74)
#define RTC_ALMON          *(RTC_BASE_ADDR + &H78)
#define RTC_ALYEAR         *(RTC_BASE_ADDR + &H7C)


/* A/D Converter 0 (AD0) */
#define AD0_BASE_ADDR		&H40034000
#define AD_ADCR          *(AD0_BASE_ADDR + &H00)
#define AD_ADGDR         *(AD0_BASE_ADDR + &H04)
#define AD_ADINTEN       *(AD0_BASE_ADDR + &H0C)
#define AD_ADDR0         *(AD0_BASE_ADDR + &H10)
#define AD_ADDR1         *(AD0_BASE_ADDR + &H14)
#define AD_ADDR2         *(AD0_BASE_ADDR + &H18)
#define AD_ADDR3         *(AD0_BASE_ADDR + &H1C)
#define AD_ADDR4         *(AD0_BASE_ADDR + &H20)
#define AD_ADDR5         *(AD0_BASE_ADDR + &H24)
#define AD_ADDR6         *(AD0_BASE_ADDR + &H28)
#define AD_ADDR7         *(AD0_BASE_ADDR + &H2C)
#define AD_ADSTAT        *(AD0_BASE_ADDR + &H30)
#define AD_ADTRIM        *(AD0_BASE_ADDR + &H34)


/* D/A Converter */
#define DAC_BASE_ADDR		&H4008C000
#define DACR           *(DAC_BASE_ADDR + &H00)
#define DACCTRL        *(DAC_BASE_ADDR + &H04)
#define DACCNTVAL      *(DAC_BASE_ADDR + &H08)


/* Watchdog */
#define WDG_BASE_ADDR		&H40000000
#define WD_WDMOD          *(WDG_BASE_ADDR + &H00)
#define WD_WDTC           *(WDG_BASE_ADDR + &H04)
#define WD_WDFEED         *(WDG_BASE_ADDR + &H08)
#define WD_WDTV           *(WDG_BASE_ADDR + &H0C)
#define WD_WDCLKSEL       *(WDG_BASE_ADDR + &H10)


/* CAN CONTROLLERS AND ACCEPTANCE FILTER */
#define CAN_ACCEPT_BASE_ADDR		&H4003C000
#define CAN_AFMR 	*(CAN_ACCEPT_BASE_ADDR + &H00)  	
#define CAN_SFF_SA 	*(CAN_ACCEPT_BASE_ADDR + &H04)  	
#define CAN_SFF_GRP_SA 	*(CAN_ACCEPT_BASE_ADDR + &H08)
#define CAN_EFF_SA 	*(CAN_ACCEPT_BASE_ADDR + &H0C)
#define CAN_EFF_GRP_SA 	*(CAN_ACCEPT_BASE_ADDR + &H10)  	
#define CAN_EOT 	*(CAN_ACCEPT_BASE_ADDR + &H14)
#define CAN_LUT_ERR_ADR *(CAN_ACCEPT_BASE_ADDR + &H18)  	
#define CAN_LUT_ERR 	*(CAN_ACCEPT_BASE_ADDR + &H1C)

#define CAN_CENTRAL_BASE_ADDR		&H40040000  	
#define CAN_TX_SR 	*(CAN_CENTRAL_BASE_ADDR + &H00)  	
#define CAN_RX_SR 	*(CAN_CENTRAL_BASE_ADDR + &H04)  	
#define CAN_MSR 	*(CAN_CENTRAL_BASE_ADDR + &H08)

#define CAN1_BASE_ADDR		&H40044000
#define CAN1MOD 	*(CAN1_BASE_ADDR + &H00)  	
#define CAN1CMR 	*(CAN1_BASE_ADDR + &H04)  	
#define CAN1GSR 	*(CAN1_BASE_ADDR + &H08)  	
#define CAN1ICR 	*(CAN1_BASE_ADDR + &H0C)  	
#define CAN1IER 	*(CAN1_BASE_ADDR + &H10)
#define CAN1BTR 	*(CAN1_BASE_ADDR + &H14)  	
#define CAN1EWL 	*(CAN1_BASE_ADDR + &H18)  	
#define CAN1SR 		*(CAN1_BASE_ADDR + &H1C)  	
#define CAN1RFS 	*(CAN1_BASE_ADDR + &H20)  	
#define CAN1RID 	*(CAN1_BASE_ADDR + &H24)
#define CAN1RDA 	*(CAN1_BASE_ADDR + &H28)  	
#define CAN1RDB 	*(CAN1_BASE_ADDR + &H2C)
  	
#define CAN1TFI1 	*(CAN1_BASE_ADDR + &H30)  	
#define CAN1TID1 	*(CAN1_BASE_ADDR + &H34)  	
#define CAN1TDA1 	*(CAN1_BASE_ADDR + &H38)
#define CAN1TDB1 	*(CAN1_BASE_ADDR + &H3C)  	
#define CAN1TFI2 	*(CAN1_BASE_ADDR + &H40)  	
#define CAN1TID2 	*(CAN1_BASE_ADDR + &H44)  	
#define CAN1TDA2 	*(CAN1_BASE_ADDR + &H48)  	
#define CAN1TDB2 	*(CAN1_BASE_ADDR + &H4C)
#define CAN1TFI3 	*(CAN1_BASE_ADDR + &H50)  	
#define CAN1TID3 	*(CAN1_BASE_ADDR + &H54)  	
#define CAN1TDA3 	*(CAN1_BASE_ADDR + &H58)  	
#define CAN1TDB3 	*(CAN1_BASE_ADDR + &H5C)

#define CAN2_BASE_ADDR		&H40048000
#define CAN2MOD 	*(CAN2_BASE_ADDR + &H00)  	
#define CAN2CMR 	*(CAN2_BASE_ADDR + &H04)  	
#define CAN2GSR 	*(CAN2_BASE_ADDR + &H08)  	
#define CAN2ICR 	*(CAN2_BASE_ADDR + &H0C)  	
#define CAN2IER 	*(CAN2_BASE_ADDR + &H10)
#define CAN2BTR 	*(CAN2_BASE_ADDR + &H14)  	
#define CAN2EWL 	*(CAN2_BASE_ADDR + &H18)  	
#define CAN2SR 		*(CAN2_BASE_ADDR + &H1C)  	
#define CAN2RFS 	*(CAN2_BASE_ADDR + &H20)  	
#define CAN2RID 	*(CAN2_BASE_ADDR + &H24)
#define CAN2RDA 	*(CAN2_BASE_ADDR + &H28)  	
#define CAN2RDB 	*(CAN2_BASE_ADDR + &H2C)
  	
#define CAN2TFI1 	*(CAN2_BASE_ADDR + &H30)  	
#define CAN2TID1 	*(CAN2_BASE_ADDR + &H34)  	
#define CAN2TDA1 	*(CAN2_BASE_ADDR + &H38)
#define CAN2TDB1 	*(CAN2_BASE_ADDR + &H3C)  	
#define CAN2TFI2 	*(CAN2_BASE_ADDR + &H40)  	
#define CAN2TID2 	*(CAN2_BASE_ADDR + &H44)  	
#define CAN2TDA2 	*(CAN2_BASE_ADDR + &H48)  	
#define CAN2TDB2 	*(CAN2_BASE_ADDR + &H4C)
#define CAN2TFI3 	*(CAN2_BASE_ADDR + &H50)  	
#define CAN2TID3 	*(CAN2_BASE_ADDR + &H54)  	
#define CAN2TDA3 	*(CAN2_BASE_ADDR + &H58)  	
#define CAN2TDB3 	*(CAN2_BASE_ADDR + &H5C)


/* I2S Interface Controller (I2S) */
#define I2S_BASE_ADDR		&H400A8000
#define I2S_DAO        *(I2S_BASE_ADDR + &H00)
#define I2S_DAI        *(I2S_BASE_ADDR + &H04)
#define I2S_TX_FIFO    *(I2S_BASE_ADDR + &H08)
#define I2S_RX_FIFO    *(I2S_BASE_ADDR + &H0C)
#define I2S_STATE      *(I2S_BASE_ADDR + &H10)
#define I2S_DMA1       *(I2S_BASE_ADDR + &H14)
#define I2S_DMA2       *(I2S_BASE_ADDR + &H18)
#define I2S_IRQ        *(I2S_BASE_ADDR + &H1C)
#define I2S_TXRATE     *(I2S_BASE_ADDR + &H20)
#define I2S_RXRATE     *(I2S_BASE_ADDR + &H24)

#define I2S_TXBITRATE  *(I2S_BASE_ADDR + &H28)
#define I2S_RXBITRATE  *(I2S_BASE_ADDR + &H2C)
#define I2S_TXMODE     *(I2S_BASE_ADDR + &H30)
#define I2S_RXMODE     *(I2S_BASE_ADDR + &H34)


///* USB Controller */
#define USB_INT_BASE_ADDR	&H400FC1C0
#define USB_BASE_ADDR		&H5000C200		/* USB Base Address */

#define USB_INT_STAT    *(USB_INT_BASE_ADDR + &H00)
//GET THESE IF YOU EVER WANT TO USE USB, MAY BE CLOSE
///* USB Device Interrupt Registers */
//#define DEV_INT_STAT    *(USB_BASE_ADDR + &H00)
//#define DEV_INT_EN      *(USB_BASE_ADDR + &H04)
//#define DEV_INT_CLR     *(USB_BASE_ADDR + &H08)
//#define DEV_INT_SET     *(USB_BASE_ADDR + &H0C)
//#define DEV_INT_PRIO    *(USB_BASE_ADDR + &H2C)

///* USB Device Endpoint Interrupt Registers */
//#define EP_INT_STAT     *(USB_BASE_ADDR + &H30)
//#define EP_INT_EN       *(USB_BASE_ADDR + &H34)
//#define EP_INT_CLR      *(USB_BASE_ADDR + &H38)
//#define EP_INT_SET      *(USB_BASE_ADDR + &H3C)
//#define EP_INT_PRIO     *(USB_BASE_ADDR + &H40)

///* USB Device Endpoint Realization Registers */
//#define REALIZE_EP      *(USB_BASE_ADDR + &H44)
//#define EP_INDEX        *(USB_BASE_ADDR + &H48)
//#define MAXPACKET_SIZE  *(USB_BASE_ADDR + &H4C)

///* USB Device Command Reagisters */
//#define USB_CMD_CODE        *(USB_BASE_ADDR + &H10)
//#define USB_CMD_DATA        *(USB_BASE_ADDR + &H14)

///* USB Device Data Transfer Registers */
//#define USB_RX_DATA         *(USB_BASE_ADDR + &H18)
//#define USB_TX_DATA         *(USB_BASE_ADDR + &H1C)
//#define USB_RX_PLENGTH      *(USB_BASE_ADDR + &H20)
//#define USB_TX_PLENGTH      *(USB_BASE_ADDR + &H24)
//#define USB_CTRL        *(USB_BASE_ADDR + &H28)

///* USB Device DMA Registers */
//#define DMA_REQ_STAT        *(USB_BASE_ADDR + &H50)
//#define DMA_REQ_CLR         *(USB_BASE_ADDR + &H54)
//#define DMA_REQ_SET         *(USB_BASE_ADDR + &H58)
//#define UDCA_HEAD           *(USB_BASE_ADDR + &H80)
//#define EP_DMA_STAT         *(USB_BASE_ADDR + &H84)
//#define EP_DMA_EN           *(USB_BASE_ADDR + &H88)
//#define EP_DMA_DIS          *(USB_BASE_ADDR + &H8C)
//#define DMA_INT_STAT        *(USB_BASE_ADDR + &H90)
//#define DMA_INT_EN          *(USB_BASE_ADDR + &H94)
//#define EOT_INT_STAT        *(USB_BASE_ADDR + &HA0)
//#define EOT_INT_CLR         *(USB_BASE_ADDR + &HA4)
//#define EOT_INT_SET         *(USB_BASE_ADDR + &HA8)
//#define NDD_REQ_INT_STAT    *(USB_BASE_ADDR + &HAC)
//#define NDD_REQ_INT_CLR     *(USB_BASE_ADDR + &HB0)
//#define NDD_REQ_INT_SET     *(USB_BASE_ADDR + &HB4)
//#define SYS_ERR_INT_STAT    *(USB_BASE_ADDR + &HB8)
//#define SYS_ERR_INT_CLR     *(USB_BASE_ADDR + &HBC)
//#define SYS_ERR_INT_SET     *(USB_BASE_ADDR + &HC0)


///* USB Host Controller */
//#define USBHC_BASE_ADDR		&HFFE0C000
//#define HC_REVISION         *(USBHC_BASE_ADDR + &H00)
//#define HC_CONTROL          *(USBHC_BASE_ADDR + &H04)
//#define HC_CMD_STAT         *(USBHC_BASE_ADDR + &H08)
//#define HC_INT_STAT         *(USBHC_BASE_ADDR + &H0C)
//#define HC_INT_EN           *(USBHC_BASE_ADDR + &H10)
//#define HC_INT_DIS          *(USBHC_BASE_ADDR + &H14)
//#define HC_HCCA             *(USBHC_BASE_ADDR + &H18)
//#define HC_PERIOD_CUR_ED    *(USBHC_BASE_ADDR + &H1C)
//#define HC_CTRL_HEAD_ED     *(USBHC_BASE_ADDR + &H20)
//#define HC_CTRL_CUR_ED      *(USBHC_BASE_ADDR + &H24)
//#define HC_BULK_HEAD_ED     *(USBHC_BASE_ADDR + &H28)
//#define HC_BULK_CUR_ED      *(USBHC_BASE_ADDR + &H2C)
//#define HC_DONE_HEAD        *(USBHC_BASE_ADDR + &H30)
//#define HC_FM_INTERVAL      *(USBHC_BASE_ADDR + &H34)
//#define HC_FM_REMAINING     *(USBHC_BASE_ADDR + &H38)
//#define HC_FM_NUMBER        *(USBHC_BASE_ADDR + &H3C)
//#define HC_PERIOD_START     *(USBHC_BASE_ADDR + &H40)
//#define HC_LS_THRHLD        *(USBHC_BASE_ADDR + &H44)
//#define HC_RH_DESCA         *(USBHC_BASE_ADDR + &H48)
//#define HC_RH_DESCB         *(USBHC_BASE_ADDR + &H4C)
//#define HC_RH_STAT          *(USBHC_BASE_ADDR + &H50)
//#define HC_RH_PORT_STAT1    *(USBHC_BASE_ADDR + &H54)
//#define HC_RH_PORT_STAT2    *(USBHC_BASE_ADDR + &H58)

///* USB OTG Controller */
//#define USBOTG_BASE_ADDR	&HFFE0C100
//#define OTG_INT_STAT        *(USBOTG_BASE_ADDR + &H00)
//#define OTG_INT_EN          *(USBOTG_BASE_ADDR + &H04)
//#define OTG_INT_SET         *(USBOTG_BASE_ADDR + &H08)
//#define OTG_INT_CLR         *(USBOTG_BASE_ADDR + &H0C)
//#define OTG_STAT_CTRL       *(USBOTG_BASE_ADDR + &H10)
//#define OTG_TIMER           *(USBOTG_BASE_ADDR + &H14)

//#define USBOTG_I2C_BASE_ADDR	&HFFE0C300
//#define OTG_I2C_RX          *(USBOTG_I2C_BASE_ADDR + &H00)
//#define OTG_I2C_TX          *(USBOTG_I2C_BASE_ADDR + &H00)
//#define OTG_I2C_STS         *(USBOTG_I2C_BASE_ADDR + &H04)
//#define OTG_I2C_CTL         *(USBOTG_I2C_BASE_ADDR + &H08)
//#define OTG_I2C_CLKHI       *(USBOTG_I2C_BASE_ADDR + &H0C)
//#define OTG_I2C_CLKLO       *(USBOTG_I2C_BASE_ADDR + &H10)

//#define USBOTG_CLK_BASE_ADDR	&HFFE0CFF0
//#define OTG_CLK_CTRL        *(USBOTG_CLK_BASE_ADDR + &H04)
//#define OTG_CLK_STAT        *(USBOTG_CLK_BASE_ADDR + &H08)


///* Ethernet MAC (32 bit data bus) -- all registers are RW unless indicated in parentheses */
#define MAC_BASE_ADDR		&H50000000 /* AHB Peripheral # 0 */
#define MAC_MAC1            *(MAC_BASE_ADDR + &H000) /* MAC config reg 1 */
#define MAC_MAC2            *(MAC_BASE_ADDR + &H004) /* MAC config reg 2 */
#define MAC_IPGT            *(MAC_BASE_ADDR + &H008) /* b2b InterPacketGap reg */
#define MAC_IPGR            *(MAC_BASE_ADDR + &H00C) /* non b2b InterPacketGap reg */
#define MAC_CLRT            *(MAC_BASE_ADDR + &H010) /* CoLlision window/ReTry reg */
#define MAC_MAXF            *(MAC_BASE_ADDR + &H014) /* MAXimum Frame reg */
#define MAC_SUPP            *(MAC_BASE_ADDR + &H018) /* PHY SUPPort reg */
#define MAC_TEST            *(MAC_BASE_ADDR + &H01C) /* TEST reg */
#define MAC_MCFG            *(MAC_BASE_ADDR + &H020) /* MII Mgmt ConFiG reg */
#define MAC_MCMD            *(MAC_BASE_ADDR + &H024) /* MII Mgmt CoMmanD reg */
#define MAC_MADR            *(MAC_BASE_ADDR + &H028) /* MII Mgmt ADdRess reg */
#define MAC_MWTD            *(MAC_BASE_ADDR + &H02C) /* MII Mgmt WriTe Data reg (WO) */
#define MAC_MRDD            *(MAC_BASE_ADDR + &H030) /* MII Mgmt ReaD Data reg (RO) */
#define MAC_MIND            *(MAC_BASE_ADDR + &H034) /* MII Mgmt INDicators reg (RO) */

#define MAC_SA0             *(MAC_BASE_ADDR + &H040) /* Station Address 0 reg */
#define MAC_SA1             *(MAC_BASE_ADDR + &H044) /* Station Address 1 reg */
#define MAC_SA2             *(MAC_BASE_ADDR + &H048) /* Station Address 2 reg */

#define MAC_COMMAND         *(MAC_BASE_ADDR + &H100) /* Command reg */
#define MAC_STATUS          *(MAC_BASE_ADDR + &H104) /* Status reg (RO) */
#define MAC_RXDESCRIPTOR    *(MAC_BASE_ADDR + &H108) /* Rx descriptor base address reg */
#define MAC_RXSTATUS        *(MAC_BASE_ADDR + &H10C) /* Rx status base address reg */
#define MAC_RXDESCRIPTORNUM *(MAC_BASE_ADDR + &H110) /* Rx number of descriptors reg */
#define MAC_RXPRODUCEINDEX  *(MAC_BASE_ADDR + &H114) /* Rx produce index reg (RO) */
#define MAC_RXCONSUMEINDEX  *(MAC_BASE_ADDR + &H118) /* Rx consume index reg */
#define MAC_TXDESCRIPTOR    *(MAC_BASE_ADDR + &H11C) /* Tx descriptor base address reg */
#define MAC_TXSTATUS        *(MAC_BASE_ADDR + &H120) /* Tx status base address reg */
#define MAC_TXDESCRIPTORNUM *(MAC_BASE_ADDR + &H124) /* Tx number of descriptors reg */
#define MAC_TXPRODUCEINDEX  *(MAC_BASE_ADDR + &H128) /* Tx produce index reg */
#define MAC_TXCONSUMEINDEX  *(MAC_BASE_ADDR + &H12C) /* Tx consume index reg (RO) */

#define MAC_TSV0            *(MAC_BASE_ADDR + &H158) /* Tx status vector 0 reg (RO) */
#define MAC_TSV1            *(MAC_BASE_ADDR + &H15C) /* Tx status vector 1 reg (RO) */
#define MAC_RSV             *(MAC_BASE_ADDR + &H160) /* Rx status vector reg (RO) */

#define MAC_FLOWCONTROLCNT  *(MAC_BASE_ADDR + &H170) /* Flow control counter reg */
#define MAC_FLOWCONTROLSTS  *(MAC_BASE_ADDR + &H174) /* Flow control status reg */

#define MAC_RXFILTERCTRL    *(MAC_BASE_ADDR + &H200) /* Rx filter ctrl reg */
#define MAC_RXFILTERWOLSTS  *(MAC_BASE_ADDR + &H204) /* Rx filter WoL status reg (RO) */
#define MAC_RXFILTERWOLCLR  *(MAC_BASE_ADDR + &H208) /* Rx filter WoL clear reg (WO) */

#define MAC_HASHFILTERL     *(MAC_BASE_ADDR + &H210) /* Hash filter LSBs reg */
#define MAC_HASHFILTERH     *(MAC_BASE_ADDR + &H214) /* Hash filter MSBs reg */

#define MAC_INTSTATUS       *(MAC_BASE_ADDR + &HFE0) /* Interrupt status reg (RO) */
#define MAC_INTENABLE       *(MAC_BASE_ADDR + &HFE4) /* Interrupt enable reg  */
#define MAC_INTCLEAR        *(MAC_BASE_ADDR + &HFE8) /* Interrupt clear reg (WO) */
#define MAC_INTSET          *(MAC_BASE_ADDR + &HFEC) /* Interrupt set reg (WO) */

#define MAC_POWERDOWN       *(MAC_BASE_ADDR + &HFF4) /* Power-down reg */


/* MOTOCON (sometimes referred to by the name PWM3) */
#define PWM3_BASE_ADDR &H400B8000
#define pwm3con        *(PWM3_BASE_ADDR + 0)
#define MCCON          *(PWM3_BASE_ADDR + 0)
#define pwm3con_set    *(PWM3_BASE_ADDR + &H4)
#define MCCON_SET      *(PWM3_BASE_ADDR + &H4)
#define pwm3con_clr    *(PWM3_BASE_ADDR + &H8)
#define MCCON_CLR      *(PWM3_BASE_ADDR + &H8)
#define capturecon     *(PWM3_BASE_ADDR + &Hc)
#define MCCAPCON       *(PWM3_BASE_ADDR + &Hc)
#define capturecon_set *(PWM3_BASE_ADDR + &H10)
#define MCCAPCON_SET   *(PWM3_BASE_ADDR + &H10)
#define capturecon_clr *(PWM3_BASE_ADDR + &H14)
#define MCCAPCON_CLR   *(PWM3_BASE_ADDR + &H14)
#define pwm3_tc0       *(PWM3_BASE_ADDR + &H18)
#define MCTIM0         *(PWM3_BASE_ADDR + &H18)
#define pwm3_tc1       *(PWM3_BASE_ADDR + &H1c)
#define MCTIM1         *(PWM3_BASE_ADDR + &H1c)
#define pwm3_tc2       *(PWM3_BASE_ADDR + &H20)
#define MCTIM2         *(PWM3_BASE_ADDR + &H20)
#define pwm3_pr0       *(PWM3_BASE_ADDR + &H24)
#define MCPER0         *(PWM3_BASE_ADDR + &H24)
#define pwm3_pr1       *(PWM3_BASE_ADDR + &H28)
#define MCPER1         *(PWM3_BASE_ADDR + &H28)
#define pwm3_pr2       *(PWM3_BASE_ADDR + &H2c)
#define MCPER2         *(PWM3_BASE_ADDR + &H2c)
#define pwm3_pw0       *(PWM3_BASE_ADDR + &H30)
#define MCPW0          *(PWM3_BASE_ADDR + &H30)
#define pwm3_pw1       *(PWM3_BASE_ADDR + &H34)
#define MCPW1          *(PWM3_BASE_ADDR + &H34)
#define pwm3_pw2       *(PWM3_BASE_ADDR + &H38)
#define MCPW2          *(PWM3_BASE_ADDR + &H38)
#define pwm3_dtr       *(PWM3_BASE_ADDR + &H3c)
#define MCDEADTIME     *(PWM3_BASE_ADDR + &H3c)
#define curcom         *(PWM3_BASE_ADDR + &H40)
#define MCCCP          *(PWM3_BASE_ADDR + &H40)
#define cap0           *(PWM3_BASE_ADDR + &H44)
#define MCCR0          *(PWM3_BASE_ADDR + &H44)
#define cap1           *(PWM3_BASE_ADDR + &H48)
#define MCCR1          *(PWM3_BASE_ADDR + &H48)
#define cap2           *(PWM3_BASE_ADDR + &H4c)
#define MCCR2            *(PWM3_BASE_ADDR + &H4c)
#define pwm3inten        *(PWM3_BASE_ADDR + &H50)
#define MCINTEN          *(PWM3_BASE_ADDR + &H50)
#define pwm3inten_set    *(PWM3_BASE_ADDR + &H54)
#define MCINTEN_SET      *(PWM3_BASE_ADDR + &H54)
#define pwm3inten_clr    *(PWM3_BASE_ADDR + &H58)
#define MCINTEN_CLR      *(PWM3_BASE_ADDR + &H58)
#define countcon       *(PWM3_BASE_ADDR + &H5c)
#define MCCNTCON       *(PWM3_BASE_ADDR + &H5c)
#define countcon_set   *(PWM3_BASE_ADDR + &H60)
#define MCCNTCON_SET   *(PWM3_BASE_ADDR + &H60)
#define countcon_clr   *(PWM3_BASE_ADDR + &H64)
#define MCCNTCON_CLR   *(PWM3_BASE_ADDR + &H64)
#define pwm3intflags     *(PWM3_BASE_ADDR + &H68)
#define MCINTFLAGS       *(PWM3_BASE_ADDR + &H68)
#define pwm3intflags_set *(PWM3_BASE_ADDR + &H6c)
#define MCINTFLAGS_SET   *(PWM3_BASE_ADDR + &H6c)
#define pwm3intflags_clr *(PWM3_BASE_ADDR + &H70)
#define MCINTFLAGS_CLR   *(PWM3_BASE_ADDR + &H70)
// PWMCON reg equates
#define DCMODE   &H80000000
#define ACMODE   &H40000000
#define INVBDC   &H20000000
#define SSM2     &H00200000
#define DISUP2   &H00100000
#define PWMDTE2  &H00080000
#define POLA2    &H00040000
#define TYPE2    &H00020000
#define RUN2     &H00010000
#define SSM1     &H00002000
#define DISUP1   &H00001000
#define PWMDTE1  &H00000800
#define POLA1    &H00000400
#define TYPE1    &H00000200
#define RUN1     &H00000100
#define SSM0     &H00000020
#define DISUP0   &H00000010
#define PWMDTE0  &H00000008
#define POLA0    &H00000004
#define TYPE0    &H00000002
#define RUN0     &H00000001
// CAPTURECON reg equates
#define CAP0_CAP0R      &H00000001
#define CAP0_CAP0F      &H00000002
#define CAP0_CAP1R      &H00000004
#define CAP0_CAP1F      &H00000008
#define CAP0_CAP2R      &H00000010
#define CAP0_CAP2F      &H00000020
#define CAP1_CAP0R      &H00000040
#define CAP1_CAP0F      &H00000080
#define CAP1_CAP1R      &H00000100
#define CAP1_CAP1F      &H00000200
#define CAP1_CAP2R      &H00000400
#define CAP1_CAP2F      &H00000800
#define CAP2_CAP0R      &H00001000
#define CAP2_CAP0F      &H00002000
#define CAP2_CAP1R      &H00004000
#define CAP2_CAP1F      &H00008000
#define CAP2_CAP2R      &H00010000
#define CAP2_CAP2F      &H00020000
#define RST_TC0_ON_CAP0 &H00040000
#define RST_TC1_ON_CAP1 &H00080000
#define RST_TC2_ON_CAP2 &H00100000
#define HNFDTE0         &H00200000
#define HNFDTE1         &H00400000
#define HNFDTE2         &H00800000
// COUNTCON reg equates
#define CNT0_CAP0R &H00000001
#define CNT0_CAP0F &H00000002
#define CNT0_CAP1R &H00000004
#define CNT0_CAP1F &H00000008
#define CNT0_CAP2R &H00000010
#define CNT0_CAP2F &H00000020
#define CNT1_CAP0R &H00000040
#define CNT1_CAP0F &H00000080
#define CNT1_CAP1R &H00000100
#define CNT1_CAP1F &H00000200
#define CNT1_CAP2R &H00000400
#define CNT1_CAP2F &H00000800
#define CNT2_CAP0R &H00001000
#define CNT2_CAP0F &H00002000
#define CNT2_CAP1R &H00004000
#define CNT2_CAP1F &H00008000
#define CNT2_CAP2R &H00010000
#define CNT2_CAP2F &H00020000
#define COUNTMODE0 &H20000000
#define COUNTMODE1 &H40000000
#define COUNTMODE2 &H80000000
// Interrupt reg equates
#define INTENPER0 &H00000001
#define INTENPW0  &H00000002
#define INTENCAP0 &H00000004
#define INTENPER1 &H00000010
#define INTENPW1  &H00000020
#define INTENCAP1 &H00000040
#define INTENPER2 &H00000100
#define INTENPW2  &H00000200
#define INTENCAP2 &H00000400
#define INTENFES  &H00008000
#define PER0INT   &H00000001
#define PW0INT    &H00000002
#define CAP0INT   &H00000004
#define PER1INT   &H00000010
#define PW1INT    &H00000020
#define CAP1INT   &H00000040
#define PER2INT   &H00000100
#define PW2INT    &H00000200
#define CAP2INT   &H00000400
#define FESINT    &H00008000

#define CAPTURE2 &H00010000 // For pinsel3
#define CAPTURE1 &H00004000 // For pinsel3
#define CAPTURE0 &H00000100 // For pinsel3
#define PWM0A    &H00000040 // For pinsel3
#define PWM0B    &H00001000 // For pinsel3
#define PWM1A    &H00040000 // For pinsel3
#define PWM1B    &H00100000 // For pinsel3
#define PWM2A    &H01000000 // For pinsel3
#define PWM2B    &H04000000 // For pinsel3
#define FES_N    &H00000400 // For pinsel3

#define motocon_vector *&H000000B8
#define motocon_interrupt &H40000000
#define motocon_pclk_enable &H20000

// quadrature encoder interface
#define QEI_BASE_ADDR   &H400BC000 /* APB2 Peripheral # 15 */
#define QEICON      *(QEI_BASE_ADDR + &H000)
#define QEISTAT     *(QEI_BASE_ADDR + &H004)
#define QEICONF     *(QEI_BASE_ADDR + &H008)
#define QEIPOS      *(QEI_BASE_ADDR + &H00C)
#define QEIMAXPOS   *(QEI_BASE_ADDR + &H010)
#define CMPOS0      *(QEI_BASE_ADDR + &H014)
#define CMPOS1      *(QEI_BASE_ADDR + &H018)
#define CMPOS2      *(QEI_BASE_ADDR + &H01C)
#define INXCNT      *(QEI_BASE_ADDR + &H020)
#define INXCMP      *(QEI_BASE_ADDR + &H024)
#define QEILOAD     *(QEI_BASE_ADDR + &H028)
#define QEITIME     *(QEI_BASE_ADDR + &H02C)
#define QEIVEL      *(QEI_BASE_ADDR + &H030)
#define QEICAP      *(QEI_BASE_ADDR + &H034)
#define VELCOMP     *(QEI_BASE_ADDR + &H038)
#define FILTER      *(QEI_BASE_ADDR + &H03C)
#define QEIIEC      *(QEI_BASE_ADDR + &HFD8)
#define QEIIES      *(QEI_BASE_ADDR + &HFDC)
#define QEIINTSTAT  *(QEI_BASE_ADDR + &HFE0)
#define QEIIE       *(QEI_BASE_ADDR + &HFE4)
#define QEICLR      *(QEI_BASE_ADDR + &HFE8)
#define QEISET      *(QEI_BASE_ADDR + &HFEC)
#define MODID       *(QEI_BASE_ADDR + &HFFC)

#define qei_vector *&H000000BC
#define qei_interrupt &H80000000
#define qei_pclk_enable &H40000

/* General Purpose DMA */
#define DMAC_BASE_ADDR        (&H50004000)
#define DMACIntStatus         *(DMAC_BASE_ADDR + &H000)
#define DMACIntTCStatus       *(DMAC_BASE_ADDR + &H004)
#define DMACIntTCClr          *(DMAC_BASE_ADDR + &H008)
#define DMACIntErrStatus      *(DMAC_BASE_ADDR + &H00C)
#define DMACIntErrClr         *(DMAC_BASE_ADDR + &H010)
#define DMACRawIntTCStatus    *(DMAC_BASE_ADDR + &H014)
#define DMACRawIntErrorStatus *(DMAC_BASE_ADDR + &H018)
#define DMACEnbldChns         *(DMAC_BASE_ADDR + &H01C)
#define DMACSoftBReq          *(DMAC_BASE_ADDR + &H020)
#define DMACSoftSReq          *(DMAC_BASE_ADDR + &H024)
#define DMACSoftLBReq         *(DMAC_BASE_ADDR + &H028)
#define DMACSoftLSReq         *(DMAC_BASE_ADDR + &H02C)
#define DMACConfig            *(DMAC_BASE_ADDR + &H030)
#define DMACSync              *(DMAC_BASE_ADDR + &H034)
#define DMACC0SrcAddr         *(DMAC_BASE_ADDR + &H100)
#define DMACC0DestAddr        *(DMAC_BASE_ADDR + &H104)
#define DMACC0LLIReg          *(DMAC_BASE_ADDR + &H108)
#define DMACC0Control         *(DMAC_BASE_ADDR + &H10C)
#define DMACC0Config          *(DMAC_BASE_ADDR + &H110)
#define DMACC1SrcAddr         *(DMAC_BASE_ADDR + &H120)
#define DMACC1DestAddr        *(DMAC_BASE_ADDR + &H124)
#define DMACC1LLIReg          *(DMAC_BASE_ADDR + &H128)
#define DMACC1Control         *(DMAC_BASE_ADDR + &H12C)
#define DMACC1Config          *(DMAC_BASE_ADDR + &H130)
/* Channel 2 */
#define DMACC2SrcAddr         *(DMAC_BASE_ADDR + &H140)
#define DMACC2DestAddr        *(DMAC_BASE_ADDR + &H144)
#define DMACC2LLIReg          *(DMAC_BASE_ADDR + &H148)
#define DMACC2Control         *(DMAC_BASE_ADDR + &H14C)
#define DMACC2Config          *(DMAC_BASE_ADDR + &H150)
/* Channel 3 */
#define DMACC3SrcAddr         *(DMAC_BASE_ADDR + &H160)
#define DMACC3DestAddr        *(DMAC_BASE_ADDR + &H164)
#define DMACC3LLIReg          *(DMAC_BASE_ADDR + &H168)
#define DMACC3Control         *(DMAC_BASE_ADDR + &H16C)
#define DMACC3Config          *(DMAC_BASE_ADDR + &H170)
/* Channel 4 */
#define DMACC4SrcAddr         *(DMAC_BASE_ADDR + &H180)
#define DMACC4DestAddr        *(DMAC_BASE_ADDR + &H184)
#define DMACC4LLIReg          *(DMAC_BASE_ADDR + &H188)
#define DMACC4Control         *(DMAC_BASE_ADDR + &H18C)
#define DMACC4Config          *(DMAC_BASE_ADDR + &H190)
/* Channel 5 */
#define DMACC5SrcAddr         *(DMAC_BASE_ADDR + &H1A0)
#define DMACC5DestAddr        *(DMAC_BASE_ADDR + &H1A4)
#define DMACC5LLIReg          *(DMAC_BASE_ADDR + &H1A8)
#define DMACC5Control         *(DMAC_BASE_ADDR + &H1AC)
#define DMACC5Config          *(DMAC_BASE_ADDR + &H1B0)
/* Channel 6 */
#define DMACC6SrcAddr         *(DMAC_BASE_ADDR + &H1C0)
#define DMACC6DestAddr        *(DMAC_BASE_ADDR + &H1C4)
#define DMACC6LLIReg          *(DMAC_BASE_ADDR + &H1C8)
#define DMACC6Control         *(DMAC_BASE_ADDR + &H1CC)
#define DMACC6Config          *(DMAC_BASE_ADDR + &H1D0)
/* Channel 7 */
#define DMACC7SrcAddr         *(DMAC_BASE_ADDR + &H1E0)
#define DMACC7DestAddr        *(DMAC_BASE_ADDR + &H1E4)
#define DMACC7LLIReg          *(DMAC_BASE_ADDR + &H1E8)
#define DMACC7Control         *(DMAC_BASE_ADDR + &H1EC)
#define DMACC7Config          *(DMAC_BASE_ADDR + &H1F0)

#define DMACTCR               *(DMAC_BASE_ADDR + &H500)
#define DMACITOP1             *(DMAC_BASE_ADDR + &H504)
#define DMACITOP2             *(DMAC_BASE_ADDR + &H508)
#define DMACITOP3             *(DMAC_BASE_ADDR + &H50C)
#define DMACPeriphId0         *(DMAC_BASE_ADDR + &HFE0)
#define DMACPeriphId1         *(DMAC_BASE_ADDR + &HFE4)
#define DMACPeriphId2         *(DMAC_BASE_ADDR + &HFE8)
#define DMACPeriphId3         *(DMAC_BASE_ADDR + &HFEC)
#define DMACPCellId0          *(DMAC_BASE_ADDR + &HFF0)
#define DMACPCellId1          *(DMAC_BASE_ADDR + &HFF4)
#define DMACPCellId2          *(DMAC_BASE_ADDR + &HFF8)
#define DMACPCellId3          *(DMAC_BASE_ADDR + &HFFC)

// definitions for peripheral assignments -- bte

#define DMA_SSP0_TX    0
#define DMA_SSP0_RX    1
#define DMA_SSP1_TX    2
#define DMA_SSP1_RX    3

#define DMA_ADC        4
#define DMA_DAC        7

#define DMA_I2S0       5
#define DMA_I2S1       6

#define DMA_UART0_TX   8
#define DMA_UART0_RX   9
#define DMA_UART1_TX   10
#define DMA_UART1_RX   11
#define DMA_UART2_TX   12
#define DMA_UART2_RX   13
#define DMA_UART3_TX   14
#define DMA_UART3_RX   15

#endif  // __LPC23xx_H

