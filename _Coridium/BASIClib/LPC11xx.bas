#ifndef __LPC11xx_H
#define __LPC11xx_H

'VIC Vector Table
#define PSV_ISR 		*&H10000038 ' 14: The PendSV handler
#define SYSTICK_ISR 	*&H1000003C ' 15: The SysTick handler
#define WU0_0_ISR  		*&H10000040 ' 16: : Wakeup PIO0.0 
#define WU0_1_ISR  		*&H10000044 ' 17: : Wakeup PIO0.1 
#define WU0_2_ISR  		*&H10000048 ' 18: : Wakeup PIO0.2 
#define WU0_3_ISR  		*&H1000004C ' 19: : Wakeup PIO0.3 
#define WU0_4_ISR  		*&H10000050 ' 20: : Wakeup PIO0.4 
#define WU0_5_ISR  		*&H10000054 ' 21: : Wakeup PIO0.5 
#define WU0_6_ISR  		*&H10000058 ' 22: : Wakeup PIO0.6 
#define WU0_7_ISR  		*&H1000005C ' 23: : Wakeup PIO0.7 
#define WU0_8_ISR  		*&H10000060 ' 24: : Wakeup PIO0.8 
#define WU0_9_ISR  		*&H10000064 ' 25: : Wakeup PIO0.9 
#define WU0_10_ISR  	*&H10000068 ' 26: : Wakeup PIO0.10
#define WU0_11_ISR  	*&H1000006C ' 27: : Wakeup PIO0.11
#define WU1_0_ISR  		*&H10000070 ' 28: : Wakeup PIO1.0 
#define CAN_ISR 		*&H10000074 ' 29: : CAN           
#define SSP1_ISR 		*&H10000078 ' 30: : SSP1          
#define I2C_ISR 		*&H1000007C ' 31: : I2C           
#define TIMER2_ISR 		*&H10000080 ' 32: : Timer0 NOTE: swapped Timers 0-1 with 2-3
#define TIMER3_ISR		*&H10000084 ' 33: : Timer1        
#define TIMER0_ISR 		*&H10000088 ' 34: : Timer2        
#define TIMER1_ISR 		*&H1000008C ' 35: : Timer3        
#define SSP0_ISR 		*&H10000090 ' 36: : SSP0           
#define UART0_ISR 		*&H10000094 ' 37: : UART0         
' 38: : Reserved
' 39: : Reserved
#define USB_ISR 		*&H100000A0 ' 40: : ADC           
#define ADC_ISR  		*&H100000A4 ' 41: : Watchdog Timer
#define BOD_ISR 		*&H100000A8 ' 42: : BrownOut      
' 43: : Reserved
#define GPIO3_ISR 		*&H100000B0 ' 44: : GPIO3         
#define GPIO2_ISR 		*&H100000B4 ' 45: : GPIO2         
#define GPIO1_ISR 		*&H100000B8 ' 46: : GPIO1         
#define GPIO0_ISR 		*&H100000BC ' 47: : GPIO0         
' 48: : Reserved


' Vectored Interrupt Controller (VIC)
#define VIC_BASE_ADDR	&HE000E000

#define VICIntEnable   *(VIC_BASE_ADDR + &H100) 'Set Enable
#define VICIntEnClear  *(VIC_BASE_ADDR + &H180)	'Clr Enable
#define VICIntSetPend  *(VIC_BASE_ADDR + &H200) 'Set Pending
#define VICIntClrPend  *(VIC_BASE_ADDR + &H280) 'Clr Pending

' The name convention below is from previous LPC2000 family MCUs, in LPC11xx, these registers are known as "VICVectPriority(x)".
#define VICVectCntl0   *(VIC_BASE_ADDR + &H400) 'Priority0
#define VICVectCntl1   *(VIC_BASE_ADDR + &H404) 'Priority1
#define VICVectCntl2   *(VIC_BASE_ADDR + &H408) 'Priority2
#define VICVectCntl3   *(VIC_BASE_ADDR + &H40C) 'Priority3
#define VICVectCntl4   *(VIC_BASE_ADDR + &H410) 'Priority4
#define VICVectCntl5   *(VIC_BASE_ADDR + &H414) 'Priority5
#define VICVectCntl6   *(VIC_BASE_ADDR + &H418) 'Priority6
#define VICVectCntl7   *(VIC_BASE_ADDR + &H41C) 'Priority7

' System Control Block(SCB)
#define SCB_CPUID  		*(&HE000ED00) 'CPUID
#define SCB_ICSR   		*(&HE000ED04) 'Interrupt Control and State Register
#define SCB_AIRCR  		*(&HE000ED0C) 'Application Interrupt and Reset Control Register
#define SCB_SCR	   		*(&HE000ED10) 'System Control Register
#define SCB_CCR	   		*(&HE000ED14) 'Configuration and Control Register
#define SCB_SHPR2  		*(&HE000ED1C) 'System Handler Priority Register 2
#define SCB_SHPR3  		*(&HE000ED20) 'System Handler Priority Register 3

' Sys Tick Timer
#define ST_BASE_ADDR		&HE000E000
#define ST_CTRL         *(ST_BASE_ADDR + &H10)' Control and Status Register
#define ST_RELOAD       *(ST_BASE_ADDR + &H14)' Reload Value Register
#define ST_CURR         *(ST_BASE_ADDR + &H18)' Current Value Register
#define ST_CALIB        *(ST_BASE_ADDR + &H1C)' Calibration Value Register


'------------- System Control (SYSCON) --------------------------------------
#define SYSCON_SYSMEMREMAP     *&H40048000	   '0x000 System memory remap (R/W)
#define SYSCON_PRESETCTRL      *&H40048004	   '0x004 Peripheral reset control (R/W)
#define SYSCON_SYSPLLCTRL      *&H40048008	   '0x008 System PLL control (R/W)
#define SYSCON_SYSPLLSTAT      *&H4004800C	   '0x00C System PLL status (R/ )
#define SYSCON_SYSOSCCTRL      *&H40048020	   '0x020 System oscillator control (R/W)
#define SYSCON_WDTOSCCTRL      *&H40048024	   '0x024 Watchdog oscillator control (R/W)
#define SYSCON_IRCCTRL         *&H40048028	   '0x028 IRC control (R/W)
#define SYSCON_SYSRESSTAT      *&H40048030	   '0x030 System reset status Register (R/ )
#define SYSCON_SYSPLLCLKSEL    *&H40048040	   '0x040 System PLL clock source select (R/W)	
#define SYSCON_SYSPLLCLKUEN    *&H40048044	   '0x044 System PLL clock source update enable (R/W)
#define SYSCON_MAINCLKSEL      *&H40048070	   '0x070 Main clock source select (R/W)
#define SYSCON_MAINCLKUEN      *&H40048074	   '0x074 Main clock source update enable (R/W)
#define SYSCON_SYSAHBCLKDIV    *&H40048078	   '0x078 System AHB clock divider (R/W)
#define SYSCON_SYSAHBCLKCTRL   *&H40048080	   '0x080 System AHB clock control (R/W)
#define SYSCON_SSP0CLKDIV      *&H40048094	   '0x094 SSP0 clock divider (R/W)          
#define SYSCON_UARTCLKDIV      *&H40048098	   '0x098 UART clock divider (R/W)
#define SYSCON_SSP1CLKDIV      *&H4004809C	   '0x09C SSP1 clock divider (R/W)          
#define SYSCON_SYSTICKCLKDIV   *&H400480B0	   '0x0B0 SYSTICK clock divider (R/W)          
#define SYSCON_WDTCLKSEL       *&H400480D0	   '0x0D0 WDT clock source select (R/W)
#define SYSCON_WDTCLKUEN       *&H400480D4	   '0x0D4 WDT clock source update enable (R/W)
#define SYSCON_WDTCLKDIV       *&H400480D8	   '0x0D8 WDT clock divider (R/W)
#define SYSCON_CLKOUTCLKSEL    *&H400480E0	   '0x0E0 CLKOUT clock source select (R/W)
#define SYSCON_CLKOUTUEN       *&H400480E4	   '0x0E4 CLKOUT clock source update enable (R/W)
#define SYSCON_CLKOUTDIV       *&H400480E8	   '0x0E8 CLKOUT clock divider (R/W)       
#define SYSCON_PIOPORCAP0      *&H40048100	   '0x100 POR captured PIO status 0 (R/ )           
#define SYSCON_PIOPORCAP1      *&H40048104	   '0x104 POR captured PIO status 1 (R/ )   
#define SYSCON_BODCTRL         *&H40048150	   '0x150 BOD control (R/W)
#define SYSCON_SYSTCKCAL       *&H40048158	   '0x158 System tick counter calibration (R/W)
#define SYSCON_MAINREGVOUT0CFG *&H40048160	   '0x160 Main Regulator Voltage 0 Configuration 
#define SYSCON_MAINREGVOUT1CFG *&H40048164	   '0x164 Main Regulator Voltage 1 Configuration
#define SYSCON_STARTAPRP0      *&H40048200	   '0x200 Start logic edge control Register 0 (R/W)     
#define SYSCON_STARTERP0       *&H40048204	   '0x204 Start logic signal enable Register 0 (R/W)      
#define SYSCON_STARTRSRP0CLR   *&H40048208	   '0x208 Start logic reset Register 0  ( /W)
#define SYSCON_STARTSRP0       *&H4004820C	   '0x20C Start logic status Register 0 (R/W)
#define SYSCON_PDSLEEPCFG      *&H40048230	   '0x230 Power-down states in Deep-sleep mode (R/W)
#define SYSCON_PDAWAKECFG      *&H40048234	   '0x234 Power-down states after wake-up (R/W)        
#define SYSCON_PDRUNCFG        *&H40048238	   '0x238 Power-down configuration Register (R/W)
#define SYSCON_VOUTCFGPROT     *&H400483D0	   '0x3D0 Voltage Output Configuration Protection Register (W)
#define SYSCON_DEVICE_ID       *&H400483F4	   '0x3F4 Device ID (R/ )

'------------- Pin Connect Block (IOCON) --------------------------------
#define IOCON_PIO2_6        *&H40044000		   '0x000 I/O configuration for pin PIO2_6 (R/W)
#define IOCON_PIO2_0        *&H40044008		   '0x008 I/O configuration for pin PIO2_0/DTR/SSEL1 (R/W)
#define IOCON_RESET_PIO0_0  *&H4004400C		   '0x00C I/O configuration for pin RESET/PIO0_0  (R/W)
#define IOCON_PIO0_1        *&H40044010		   '0x010 I/O configuration for pin PIO0_1/CLKOUT/CT32B0_MAT2 (R/W)
#define IOCON_PIO1_8        *&H40044014		   '0x014 I/O configuration for pin PIO1_8/CT16B1_CAP0 (R/W)
#define IOCON_PIO0_2        *&H4004401C		   '0x01C I/O configuration for pin PIO0_2/SSEL0/CT16B0_CAP0 (R/W)
#define IOCON_PIO2_7        *&H40044020		   '0x020 I/O configuration for pin PIO2_7 (R/W)
#define IOCON_PIO2_8        *&H40044024		   '0x024 I/O configuration for pin PIO2_8 (R/W)
#define IOCON_PIO2_1        *&H40044028		   '0x028 I/O configuration for pin PIO2_1/nDSR/SCK1 (R/W)
#define IOCON_PIO0_3        *&H4004402C		   '0x02C I/O configuration for pin PIO0_3 (R/W)
#define IOCON_PIO0_4        *&H40044030		   '0x030 I/O configuration for pin PIO0_4/SCL (R/W)
#define IOCON_PIO0_5        *&H40044034		   '0x034 I/O configuration for pin PIO0_5/SDA (R/W)
#define IOCON_PIO1_9        *&H40044038		   '0x038 I/O configuration for pin PIO1_9/CT16B1_MAT0 (R/W)
#define IOCON_PIO3_4        *&H4004403C		   '0x03C I/O configuration for pin PIO3_4 (R/W)
#define IOCON_PIO2_4        *&H40044040		   '0x040 I/O configuration for pin PIO2_4 (R/W)
#define IOCON_PIO2_5        *&H40044044		   '0x044 I/O configuration for pin PIO2_5 (R/W)
#define IOCON_PIO3_5        *&H40044048		   '0x048 I/O configuration for pin PIO3_5 (R/W)
#define IOCON_PIO0_6        *&H4004404C		   '0x04C I/O configuration for pin PIO0_6/SCK0 (R/W)
#define IOCON_PIO0_7        *&H40044050		   '0x050 I/O configuration for pin PIO0_7/nCTS (R/W)
#define IOCON_PIO2_9        *&H40044054		   '0x054 I/O configuration for pin PIO2_9 (R/W)
#define IOCON_PIO2_10       *&H40044058		   '0x058 I/O configuration for pin PIO2_10 (R/W)
#define IOCON_PIO2_2        *&H4004405C		   '0x05C I/O configuration for pin PIO2_2/DCD/MISO1 (R/W)
#define IOCON_PIO0_8        *&H40044060		   '0x060 I/O configuration for pin PIO0_8/MISO0/CT16B0_MAT0 (R/W)
#define IOCON_PIO0_9        *&H40044064		   '0x064 I/O configuration for pin PIO0_9/MOSI0/CT16B0_MAT1 (R/W)
#define IOCON_SWCLK_PIO0_10 *&H40044068		   '0x068 I/O configuration for pin SWCLK/PIO0_10/SCK0/CT16B0_MAT2 (R/W)
#define IOCON_PIO1_10       *&H4004406C		   '0x06C I/O configuration for pin PIO1_10/AD6/CT16B1_MAT1 (R/W)
#define IOCON_PIO2_11       *&H40044070		   '0x070 I/O configuration for pin PIO2_11/SCK0 (R/W)
#define IOCON_R_PIO0_11     *&H40044074		   '0x074 I/O configuration for pin TDI/PIO0_11/AD0/CT32B0_MAT3 (R/W)
#define IOCON_R_PIO1_0      *&H40044078		   '0x078 I/O configuration for pin TMS/PIO1_0/AD1/CT32B1_CAP0 (R/W)
#define IOCON_R_PIO1_1      *&H4004407C		   '0x07C I/O configuration for pin TDO/PIO1_1/AD2/CT32B1_MAT0 (R/W)
#define IOCON_R_PIO1_2      *&H40044080		   '0x080 I/O configuration for pin nTRST/PIO1_2/AD3/CT32B1_MAT1 (R/W)
#define IOCON_PIO3_0        *&H40044084		   '0x084 I/O configuration for pin PIO3_0/nDTR (R/W)
#define IOCON_PIO3_1        *&H40044088		   '0x088 I/O configuration for pin PIO3_1/nDSR (R/W)
#define IOCON_PIO2_3        *&H4004408C		   '0x08C I/O configuration for pin PIO2_3/RI/MOSI1 (R/W)
#define IOCON_SWDIO_PIO1_3  *&H40044090		   '0x090 I/O configuration for pin SWDIO/PIO1_3/AD4/CT32B1_MAT2 (R/W)
#define IOCON_PIO1_4        *&H40044094		   '0x094 I/O configuration for pin PIO1_4/AD5/CT32B1_MAT3 (R/W)
#define IOCON_PIO1_11       *&H40044098		   '0x098 I/O configuration for pin PIO1_11/AD7 (R/W)
#define IOCON_PIO3_2        *&H4004409C		   '0x09C I/O configuration for pin PIO3_2/nDCD (R/W)
#define IOCON_PIO1_5        *&H400440A0		   '0x0A0 I/O configuration for pin PIO1_5/nRTS/CT32B0_CAP0 (R/W)
#define IOCON_PIO1_6        *&H400440A4		   '0x0A4 I/O configuration for pin PIO1_6/RXD/CT32B0_MAT0 (R/W)
#define IOCON_PIO1_7        *&H400440A8		   '0x0A8 I/O configuration for pin PIO1_7/TXD/CT32B0_MAT1 (R/W)
#define IOCON_PIO3_3        *&H400440AC		   '0x0AC I/O configuration for pin PIO3_3/nRI (R/W)
#define IOCON_SCK_LOC       *&H400440B0		   '0x0B0 SCK pin location select Register (R/W)
#define IOCON_DSR_LOC       *&H400440B4		   '0x0B4 DSR pin location select Register (R/W)
#define IOCON_DCD_LOC       *&H400440B8		   '0x0B8 DCD pin location select Register (R/W)
#define IOCON_RI_LOC        *&H400440BC		   '0x0BC RI pin location Register (R/W)

'------------- Power Management Unit (PMU) --------------------------
#define PMU_PCON   *&H40038000				   '0x000 Power control Register (R/W)
#define PMU_GPREG0 *&H40038004				   '0x004 General purpose Register 0 (R/W)
#define PMU_GPREG1 *&H40038008				   '0x008 General purpose Register 1 (R/W)
#define PMU_GPREG2 *&H4003800C				   '0x00C General purpose Register 2 (R/W)
#define PMU_GPREG3 *&H40038010				   '0x010 General purpose Register 3 (R/W)
#define PMU_GPREG4 *&H40038014				   '0x014 General purpose Register 4 (R/W)

'------------- General Purpose Input/Output 0 (GPIO0) --------------------------
#define GPIO0_MASKED_ACCESS(x) *(&H50000000+x) '0x0000 to 0x3FFC Port data Register for pins PIOn_0 to PIOn_11 (R/W)
#define GPIO0_DATA             *&H50003FFC	   '0x3FFC Port data Register (R/W)
#define GPIO0_DIR              *&H50008000	   '0x8000 Data direction Register (R/W)
#define GPIO0_IS               *&H50008004	   '0x8004 Interrupt sense Register (R/W)
#define GPIO0_IBE              *&H50008008	   '0x8008 Interrupt both edges Register (R/W)
#define GPIO0_IEV              *&H5000800C	   '0x800C Interrupt event Register  (R/W)
#define GPIO0_IE               *&H50008010	   '0x8010 Interrupt mask Register (R/W)
#define GPIO0_RIS              *&H50008014	   '0x8014 Raw interrupt status Register (R/ )
#define GPIO0_MIS              *&H50008018	   '0x8018 Masked interrupt status Register (R/ )
#define GPIO0_IC               *&H5000801C	   '0x801C Interrupt clear Register (R/W)

'------------- General Purpose Input/Output 1 (GPIO1) --------------------------
#define GPIO1_MASKED_ACCESS(x) *(&H50010000+x)   '0x0000 to 0x3FFC Port data Register for pins PIOn_0 to PIOn_11 (R/W)
#define GPIO1_DATA             *&H50013FFC	   '0x3FFC Port data Register (R/W)
#define GPIO1_DIR              *&H50018000	   '0x8000 Data direction Register (R/W)
#define GPIO1_IS               *&H50018004	   '0x8004 Interrupt sense Register (R/W)
#define GPIO1_IBE              *&H50018008	   '0x8008 Interrupt both edges Register (R/W)
#define GPIO1_IEV              *&H5001800C	   '0x800C Interrupt event Register  (R/W)
#define GPIO1_IE               *&H50018010	   '0x8010 Interrupt mask Register (R/W)
#define GPIO1_RIS              *&H50018014	   '0x8014 Raw interrupt status Register (R/ )
#define GPIO1_MIS              *&H50018018	   '0x8018 Masked interrupt status Register (R/ )
#define GPIO1_IC               *&H5001801C	   '0x801C Interrupt clear Register (R/W)

'------------- General Purpose Input/Output 2 (GPIO2) --------------------------
#define GPIO2_MASKED_ACCESS(x) *(&H50020000+x) '0x0000 to 0x3FFC Port data Register for pins PIOn_0 to PIOn_11 (R/W)
#define GPIO2_DATA             *&H50023FFC	   '0x3FFC Port data Register (R/W)
#define GPIO2_DIR              *&H50028000	   '0x8000 Data direction Register (R/W)
#define GPIO2_IS               *&H50028004	   '0x8004 Interrupt sense Register (R/W)
#define GPIO2_IBE              *&H50028008	   '0x8008 Interrupt both edges Register (R/W)
#define GPIO2_IEV              *&H5002800C	   '0x800C Interrupt event Register  (R/W)
#define GPIO2_IE               *&H50028010	   '0x8010 Interrupt mask Register (R/W)
#define GPIO2_RIS              *&H50028014	   '0x8014 Raw interrupt status Register (R/ )
#define GPIO2_MIS              *&H50028018	   '0x8018 Masked interrupt status Register (R/ )
#define GPIO2_IC               *&H5002801C	   '0x801C Interrupt clear Register (R/W)

'------------- General Purpose Input/Output 3 (GPIO3) --------------------------
#define GPIO3_MASKED_ACCESS(x) *(&H50030000+x) '0x0000 to 0x3FFC Port data Register for pins PIOn_0 to PIOn_11 (R/W)
#define GPIO3_DATA             *&H50033FFC	   '0x3FFC Port data Register (R/W)
#define GPIO3_DIR              *&H50038000	   '0x8000 Data direction Register (R/W)
#define GPIO3_IS               *&H50038004	   '0x8004 Interrupt sense Register (R/W)
#define GPIO3_IBE              *&H50038008	   '0x8008 Interrupt both edges Register (R/W)
#define GPIO3_IEV              *&H5003800C	   '0x800C Interrupt event Register  (R/W)
#define GPIO3_IE               *&H50038010	   '0x8010 Interrupt mask Register (R/W)
#define GPIO3_RIS              *&H50038014	   '0x8014 Raw interrupt status Register (R/ )
#define GPIO3_MIS              *&H50038018	   '0x8018 Masked interrupt status Register (R/ )
#define GPIO3_IC               *&H5003801C	   '0x801C Interrupt clear Register (R/W)

'------------- Timer 0 (TMR0) --------------------------------------------------
#define T0_IR   *&H40014000				   '0x000 Interrupt Register (R/W)
#define T0_TCR  *&H40014004				   '0x004 Timer Control Register (R/W)
#define T0_TC   *&H40014008				   '0x008 Timer Counter Register (R/W)
#define T0_PR   *&H4001400C				   '0x00C Prescale Register (R/W)
#define T0_PC   *&H40014010				   '0x010 Prescale Counter Register (R/W)
#define T0_MCR  *&H40014014				   '0x014 Match Control Register (R/W)
#define T0_MR0  *&H40014018				   '0x018 Match Register 0 (R/W)
#define T0_MR1  *&H4001401C				   '0x01C Match Register 1 (R/W)
#define T0_MR2  *&H40014020				   '0x020 Match Register 2 (R/W)
#define T0_MR3  *&H40014024				   '0x024 Match Register 3 (R/W)
#define T0_CCR  *&H40014028				   '0x028 Capture Control Register (R/W)
#define T0_CR0  *&H4001402C				   '0x02C Capture Register 0 (R/ )
#define T0_EMR  *&H4001403C				   '0x03C External Match Register (R/W)
#define T0_CTCR *&H40014070				   '0x070 Count Control Register (R/W)
#define T0_PWMC *&H40014074				   '0x074 PWM Control Register (R/W)

'------------- Timer 1 (TMR1) --------------------------------------------------
#define T1_IR   *&H40018000				   '0x000 Interrupt Register (R/W)
#define T1_TCR  *&H40018004				   '0x004 Timer Control Register (R/W)
#define T1_TC   *&H40018008				   '0x008 Timer Counter Register (R/W)
#define T1_PR   *&H4001800C				   '0x00C Prescale Register (R/W)
#define T1_PC   *&H40018010				   '0x010 Prescale Counter Register (R/W)
#define T1_MCR  *&H40018014				   '0x014 Match Control Register (R/W)
#define T1_MR0  *&H40018018				   '0x018 Match Register 0 (R/W)
#define T1_MR1  *&H4001801C				   '0x01C Match Register 1 (R/W)
#define T1_MR2  *&H40018020				   '0x020 Match Register 2 (R/W)
#define T1_MR3  *&H40018024				   '0x024 Match Register 3 (R/W)
#define T1_CCR  *&H40018028				   '0x028 Capture Control Register (R/W)
#define T1_CR0  *&H4001802C				   '0x02C Capture Register 0 (R/ )
#define T1_EMR  *&H4001803C				   '0x03C External Match Register (R/W)
#define T1_CTCR *&H40018070				   '0x070 Count Control Register (R/W)
#define T1_PWMC *&H40018074				   '0x074 PWM Control Register (R/W)

'------------- Timer 2 (TMR2) --------------------------------------------------
#define T2_IR   *&H4000C000				   '0x000 Interrupt Register (R/W)
#define T2_TCR  *&H4000C004				   '0x004 Timer Control Register (R/W)
#define T2_TC   *&H4000C008				   '0x008 Timer Counter Register (R/W)
#define T2_PR   *&H4000C00C				   '0x00C Prescale Register (R/W)
#define T2_PC   *&H4000C010				   '0x010 Prescale Counter Register (R/W)
#define T2_MCR  *&H4000C014				   '0x014 Match Control Register (R/W)
#define T2_MR0  *&H4000C018				   '0x018 Match Register 0 (R/W)
#define T2_MR1  *&H4000C01C				   '0x01C Match Register 1 (R/W)
#define T2_MR2  *&H4000C020				   '0x020 Match Register 2 (R/W)
#define T2_MR3  *&H4000C024				   '0x024 Match Register 3 (R/W)
#define T2_CCR  *&H4000C028				   '0x028 Capture Control Register (R/W)
#define T2_CR0  *&H4000C02C				   '0x02C Capture Register 0 (R/ )
#define T2_EMR  *&H4000C03C				   '0x03C External Match Register (R/W)
#define T2_CTCR *&H4000C070				   '0x070 Count Control Register (R/W)
#define T2_PWMC *&H4000C074				   '0x074 PWM Control Register (R/W)

'------------- Timer 3 (TMR3) --------------------------------------------------
#define T3_IR   *&H40010000				   '0x000 Interrupt Register (R/W)
#define T3_TCR  *&H40010004				   '0x004 Timer Control Register (R/W)
#define T3_TC   *&H40010008				   '0x008 Timer Counter Register (R/W)
#define T3_PR   *&H4001000C				   '0x00C Prescale Register (R/W)
#define T3_PC   *&H40010010				   '0x010 Prescale Counter Register (R/W)
#define T3_MCR  *&H40010014				   '0x014 Match Control Register (R/W)
#define T3_MR0  *&H40010018				   '0x018 Match Register 0 (R/W)
#define T3_MR1  *&H4001001C				   '0x01C Match Register 1 (R/W)
#define T3_MR2  *&H40010020				   '0x020 Match Register 2 (R/W)
#define T3_MR3  *&H40010024				   '0x024 Match Register 3 (R/W)
#define T3_CCR  *&H40010028				   '0x028 Capture Control Register (R/W)
#define T3_CR0  *&H4001002C				   '0x02C Capture Register 0 (R/ )
#define T3_EMR  *&H4001003C				   '0x03C External Match Register (R/W)
#define T3_CTCR *&H40010070				   '0x070 Count Control Register (R/W)
#define T3_PWMC *&H40010074				   '0x074 PWM Control Register (R/W)

'------------- Universal Asynchronous Receiver Transmitter (UART) -----------
#define UART0_RBR       *&H40008000			   '0x000 Receiver Buffer  Register (R/ )
#define UART0_THR       *&H40008000			   '0x000 Transmit Holding Register ( /W)
#define UART0_DLL       *&H40008000			   '0x000 Divisor Latch LSB (R/W)
#define UART0_DLM       *&H40008004			   '0x004 Divisor Latch MSB (R/W)
#define UART0_IER       *&H40008004			   '0x000 Interrupt Enable Register (R/W)
#define UART0_IIR       *&H40008008			   '0x008 Interrupt ID Register (R/ )
#define UART0_FCR       *&H40008008			   '0x008 FIFO Control Register ( /W)
#define UART0_LCR       *&H4000800C			   '0x00C Line Control Register (R/W)
#define UART0_MCR       *&H40008010			   '0x010 Modem control Register (R/W)
#define UART0_LSR       *&H40008014			   '0x014 Line Status Register (R/ )
#define UART0_MSR       *&H40008018			   '0x018 Modem status Register (R/ )
#define UART0_SCR       *&H4000801C			   '0x01C Scratch Pad Register (R/W)
#define UART0_ACR       *&H40008020			   '0x020 Auto-baud Control Register (R/W)
#define UART0_FDR       *&H40008028			   '0x028 Fractional Divider Register (R/W)
#define UART0_TER       *&H40008030			   '0x030 Transmit Enable Register (R/W)
#define UART0_RS485CTRL *&H4000804C			   '0x04C RS-485/EIA-485 Control Register (R/W)
#define UART0_ADRMATCH  *&H40008050			   '0x050 RS-485/EIA-485 address match Register (R/W)
#define UART0_RS485DLY  *&H40008054			   '0x054 RS-485/EIA-485 direction control delay Register (R/W)
#define UART0_FIFOLVL   *&H40008058			   '0x058 FIFO Level Register (R/ )

'------------- Synchronous Serial Communication (SSP0) -----------------------
#define SSP0_CR0  *&H40040000				   '0x000 Control Register 0 (R/W)
#define SSP0_CR1  *&H40040004				   '0x004 Control Register 1 (R/W)
#define SSP0_DR   *&H40040008				   '0x008 Data Register (R/W)
#define SSP0_SR   *&H4004000C				   '0x00C Status Registe (R/ )
#define SSP0_CPSR *&H40040010				   '0x010 Clock Prescale Register (R/W)
#define SSP0_IMSC *&H40040014				   '0x014 Interrupt Mask Set and Clear Register (R/W)
#define SSP0_RIS  *&H40040018				   '0x018 Raw Interrupt Status Register (R/W)
#define SSP0_MIS  *&H4004001C				   '0x01C Masked Interrupt Status Register (R/W)
#define SSP0_ICR  *&H40040020				   '0x020 SSPICR Interrupt Clear Register (R/W)

'------------- Synchronous Serial Communication (SSP1) -----------------------
#define SSP1_CR0  *&H40058000				   '0x000 Control Register 0 (R/W)
#define SSP1_CR1  *&H40058004				   '0x004 Control Register 1 (R/W)
#define SSP1_DR   *&H40058008				   '0x008 Data Register (R/W)
#define SSP1_SR   *&H4005800C				   '0x00C Status Registe (R/ )
#define SSP1_CPSR *&H40058010				   '0x010 Clock Prescale Register (R/W)
#define SSP1_IMSC *&H40058014				   '0x014 Interrupt Mask Set and Clear Register (R/W)
#define SSP1_RIS  *&H40058018				   '0x018 Raw Interrupt Status Register (R/W)
#define SSP1_MIS  *&H4005801C				   '0x01C Masked Interrupt Status Register (R/W)
#define SSP1_ICR  *&H40058020				   '0x020 SSPICR Interrupt Clear Register (R/W)

'------------- Inter-Integrated Circuit (I2C) -------------------------------
#define I2C_CONSET      *&H40000000			   '0x000 I2C Control Set Register (R/W)
#define I2C_STAT        *&H40000004			   '0x004 I2C Status Register (R/ )
#define I2C_DAT         *&H40000008			   '0x008 I2C Data Register (R/W)
#define I2C_ADR0        *&H4000000C			   '0x00C I2C Slave Address Register 0 (R/W)
#define I2C_SCLH        *&H40000010			   '0x010 SCH Duty Cycle Register High Half Word (R/W)
#define I2C_SCLL        *&H40000014			   '0x014 SCL Duty Cycle Register Low Half Word (R/W)
#define I2C_CONCLR      *&H40000018			   '0x018 I2C Control Clear Register ( /W)
#define I2C_MMCTRL      *&H4000001C			   '0x01C Monitor mode control register (R/W)
#define I2C_ADR1        *&H40000020			   '0x020 I2C Slave Address Register 1 (R/W)
#define I2C_ADR2        *&H40000024			   '0x024 I2C Slave Address Register 2 (R/W)
#define I2C_ADR3        *&H40000028			   '0x028 I2C Slave Address Register 3 (R/W)
#define I2C_DATA_BUFFER *&H4000002C			   '0x02C Data buffer register ( /W)
#define I2C_MASK0       *&H40000030			   '0x030 I2C Slave address mask register 0 (R/W)
#define I2C_MASK1       *&H40000034			   '0x034 I2C Slave address mask register 1 (R/W)
#define I2C_MASK2       *&H40000038			   '0x038 I2C Slave address mask register 2 (R/W)
#define I2C_MASK3       *&H4000003C			   '0x03C I2C Slave address mask register 3 (R/W)

'------------- Watchdog Timer (WDT) -----------------------------------------
#define WDT_MOD     *&H40004000				   '0x000 Watchdog mode register (R/W)
#define WDT_TC      *&H40004004				   '0x004 Watchdog timer constant register (R/W)
#define WDT_FEED    *&H40004008				   '0x008 Watchdog feed sequence register ( /W)
#define WDT_TV      *&H4000400C				   '0x00C Watchdog timer value register (R/ )
#define WDT_WARNINT *&H40004014
#define WDT_WINDOW  *&H40004018

'------------- Analog-to-Digital Converter (ADC) ----------------------------
#define ADC_CR    *&H4001C000				   '0x000 A/D Control Register (R/W)
#define ADC_GDR   *&H4001C004				   '0x004 A/D Global Data Register (R/W)
#define ADC_INTEN *&H4001C00C				   '0x00C A/D Interrupt Enable Register (R/W)
#define ADC_DR0   *&H4001C010				   '0x010 A/D Channel 0 Data Register (R/W)
#define ADC_DR1   *&H4001C014				   '0x014 A/D Channel 1 Data Register (R/W)
#define ADC_DR2   *&H4001C018				   '0x018 A/D Channel 2 Data Register (R/W)
#define ADC_DR3   *&H4001C01C				   '0x01C A/D Channel 3 Data Register (R/W)
#define ADC_DR4   *&H4001C020				   '0x020 A/D Channel 4 Data Register (R/W)
#define ADC_DR5   *&H4001C024				   '0x024 A/D Channel 5 Data Register (R/W)
#define ADC_DR6   *&H4001C028				   '0x028 A/D Channel 6 Data Register (R/W)
#define ADC_DR7   *&H4001C02C				   '0x02C A/D Channel 7 Data Register (R/W)
#define ADC_STAT  *&H4001C030				   '0x030 A/D Status Register (R/ )

'------------- CAN Controller (CAN) ----------------------------
#define CAN_CNTL       *&H40050000
#define CAN_STAT       *&H40050004
#define CAN_EC         *&H40050008
#define CAN_BT         *&H4005000C
#define CAN_INT        *&H40050010
#define CAN_TEST       *&H40050014
#define CAN_BRPE       *&H40050018
#define CAN_IF1_CMDREQ *&H40050020
#define CAN_IF1_CMDMSK *&H40050024
#define CAN_IF1_MSK1   *&H40050028
#define CAN_IF1_MSK2   *&H4005002C
#define CAN_IF1_ARB1   *&H40050030
#define CAN_IF1_ARB2   *&H40050034
#define CAN_IF1_MCTRL  *&H40050038
#define CAN_IF1_DA1    *&H4005003C
#define CAN_IF1_DA2    *&H40050040
#define CAN_IF1_DB1    *&H40050044
#define CAN_IF1_DB2    *&H40050048
#define CAN_IF2_CMDREQ *&H40050080
#define CAN_IF2_CMDMSK *&H40050084
#define CAN_IF2_MSK1   *&H40050088
#define CAN_IF2_MSK2   *&H4005008C
#define CAN_IF2_ARB1   *&H40050090
#define CAN_IF2_ARB2   *&H40050094
#define CAN_IF2_MCTRL  *&H40050098
#define CAN_IF2_DA1    *&H4005009C
#define CAN_IF2_DA2    *&H400500A0
#define CAN_IF2_DB1    *&H400500A4
#define CAN_IF2_DB2    *&H400500A8
#define CAN_TXREQ1     *&H40050100
#define CAN_TXREQ2     *&H40050104
#define CAN_ND1        *&H40050120
#define CAN_ND2        *&H40050124
#define CAN_IR1        *&H40050140
#define CAN_IR2        *&H40050144
#define CAN_MSGV1      *&H40050160
#define CAN_MSGV2      *&H40050164
#define CAN_CLKDIV     *&H40050180

#endif  ' __LPC11xx_H

