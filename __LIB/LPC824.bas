
'  pointers to bases

' Base addresses
#define FLASH_BASE        *0x00000000
#define RAM_BASE          *0x10000000
#define ROM_BASE          *0x1FFF0000
#define APB0_BASE         *0x40000000
#define AHB_BASE          *0x50000000

' APB0 peripherals
#define WWDT_BASE         *0x40000000
#define MRT_BASE          *0x40004000
#define WKT_BASE          *0x40008000
#define SWM_BASE          *0x4000C000
#define ADC_BASE          *0x4001C000  ' Available only on LPC82x
#define PMU_BASE          *0x40020000
#define CMP_BASE          *0x40024000
#define DMATIRGMUX_BASE   *0x40028000  ' Available only on LPC82x
#define INMUX_BASE        *0x4002C000  ' Available only on LPC82x

#define FMC_BASE          *0x40040000
#define IOCON_BASE        *0x40044000
#define SYSCTL_BASE       *0x40048000
#define I2C0_BASE         *0x40050000
#define I2C1_BASE         *0x40054000  ' Available only on LPC82x
#define SPI0_BASE         *0x40058000
#define SPI1_BASE         *0x4005C000
#define USART0_BASE       *0x40064000
#define USART1_BASE       *0x40068000
#define USART2_BASE       *0x4006C000
#define I2C2_BASE         *0x40070000  ' Available only on LPC82x
#define I2C3_BASE         *0x40074000  ' Available only on LPC82x

' AHB peripherals
#define CRC_BASE          *0x50000000
#define SCT_BASE          *0x50004000
#define DMA_BASE          *0x50008000  ' Available only on LPC82x

#define GPIO_PORT_BASE    *0xA0000000
#define PIN_INT_BASE      *0xA0004000

''''''''''''''''''''''''''''


#define FLASH_BASE_ADDR		0x00000000
#define RAM_BASE_ADDR		0x10000000
#define ROM_BASE_ADDR		0x1FFF0000
#define APB0_BASE_ADDR		0x40000000
#define AHB_BASE_ADDR		0x50000000

' APB0 peripherals
#define WWDT_BASE_ADDR		0x40000000
#define MRT_BASE_ADDR		0x40004000
#define WKT_BASE_ADDR		0x40008000
#define SWM_BASE_ADDR		0x4000C000
#define ADC_BASE_ADDR		0x4001C000  ' Available only on LPC82x
#define PMU_BASE_ADDR		0x40020000
#define CMP_BASE_ADDR		0x40024000
#define DMATIRGMUX_BASE_ADDR		0x40028000  ' Available only on LPC82x
#define INMUX_BASE_ADDR		0x4002C000  ' Available only on LPC82x

#define FMC_BASE_ADDR		0x40040000
#define IOCON_BASE_ADDR		0x40044000

#define SYSCTL_BASE_ADDR		0x40048000
#define SYSCON_SYSMEMREMAP		*(SYSCTL_BASE_ADDR + 0x000) ' System memory remap (R/W)
#define SYSCON_PRESETCTRL		*(SYSCTL_BASE_ADDR + 0x004) ' Peripheral reset control (R/W)
#define SYSCON_SYSPLLCTRL		*(SYSCTL_BASE_ADDR + 0x008) ' System PLL control (R/W)
#define SYSCON_SYSPLLSTAT		*(SYSCTL_BASE_ADDR + 0x00C) ' System PLL status (R/W )
#define SYSCON_SYSOSCCTRL		*(SYSCTL_BASE_ADDR + 0x020) ' System oscillator control (R/W)
#define SYSCON_WDTOSCCTRL		*(SYSCTL_BASE_ADDR + 0x024) ' Watchdog oscillator control (R/W)
#define SYSCON_IRCCTRL 			*(SYSCTL_BASE_ADDR + 0x028) ' IRC Control Register (Available only in LPC82X)
#define SYSCON_SYSRSTSTAT		*(SYSCTL_BASE_ADDR + 0x030) ' System reset status Register (R/W )
#define SYSCON_SYSPLLCLKSEL		*(SYSCTL_BASE_ADDR + 0x040) ' System PLL clock source select (R/W)
#define SYSCON_SYSPLLCLKUEN		*(SYSCTL_BASE_ADDR + 0x044) ' System PLL clock source update enable (R/W)
#define SYSCON_MAINCLKSEL		*(SYSCTL_BASE_ADDR + 0x070) ' Main clock source select (R/W)
#define SYSCON_MAINCLKUEN		*(SYSCTL_BASE_ADDR + 0x074) ' Main clock source update enable (R/W)
#define SYSCON_SYSAHBCLKDIV		*(SYSCTL_BASE_ADDR + 0x078) ' System AHB clock divider (R/W)
#define SYSCON_SYSAHBCLKCTRL	*(SYSCTL_BASE_ADDR + 0x080) ' System AHB clock control (R/W)
#define SYSCON_UARTCLKDIV		*(SYSCTL_BASE_ADDR + 0x094) ' UART clock divider (R/W)
#define SYSCON_CLKOUTSEL		*(SYSCTL_BASE_ADDR + 0x0E0) ' CLKOUT clock source select (R/W)
#define SYSCON_CLKOUTUEN		*(SYSCTL_BASE_ADDR + 0x0E4) ' CLKOUT clock source update enable (R/W)
#define SYSCON_CLKOUTDIV		*(SYSCTL_BASE_ADDR + 0x0E8) ' CLKOUT clock divider (R/W)
#define SYSCON_UARTFRGDIV		*(SYSCTL_BASE_ADDR + 0x0F0) ' UART fractional divider SUB(R/W)
#define SYSCON_UARTFRGMULT		*(SYSCTL_BASE_ADDR + 0x0F4) ' UART fractional divider ADD(R/W)
#define SYSCON_EXTTRACECMD		*(SYSCTL_BASE_ADDR + 0x0FC) ' External trace buffer command register
#define SYSCON_PIOPORCAP0		*(SYSCTL_BASE_ADDR + 0x100) ' POR captured PIO status 0 (R/ )
#define SYSCON_IOCONCLKDIV[7]	*(SYSCTL_BASE_ADDR + 0x134) ' Peripheral clock x to the IOCON block for programmable glitch filter
#define SYSCON_BODCTRL			*(SYSCTL_BASE_ADDR + 0x150) ' BOD control (R/W)
#define SYSCON_SYSTCKCAL		*(SYSCTL_BASE_ADDR + 0x154) ' System tick counter calibration (R/W)
#define SYSCON_IRQLATENCY		*(SYSCTL_BASE_ADDR + 0x170) ' IRQ delay
#define SYSCON_NMISRC			*(SYSCTL_BASE_ADDR + 0x174) ' NMI Source Control
#define SYSCON_PINTSEL[8]		*(SYSCTL_BASE_ADDR + 0x178) ' GPIO Pin Interrupt Select register 0
#define SYSCON_STARTERP0		*(SYSCTL_BASE_ADDR + 0x204) ' Start logic signal enable Register 0 (R/W)
#define SYSCON_STARTERP1		*(SYSCTL_BASE_ADDR + 0x214) ' Start logic signal enable Register 0 (R/W)
#define SYSCON_PDSLEEPCFG		*(SYSCTL_BASE_ADDR + 0x230) ' Power-down states in Deep-sleep mode (R/W)
#define SYSCON_PDAWAKECFG		*(SYSCTL_BASE_ADDR + 0x234) ' Power-down states after wake-up (R/W)
#define SYSCON_PDRUNCFG			*(SYSCTL_BASE_ADDR + 0x238) ' Power-down configuration Register (R/W)
#define SYSCON_DEVICEID			*(SYSCTL_BASE_ADDR + 0x3F8) ' Device ID (R/ )

'  System reset status values
#define SYSCTL_RST_POR    			(1<<0)	' POR reset status
#define SYSCTL_RST_EXTRST 			(1<<1)	' External reset status
#define SYSCTL_RST_WDT    			(1<<2)	' Watchdog reset status
#define SYSCTL_RST_BOD    			(1<<3)	' Brown-out detect reset status
#define SYSCTL_RST_SYSRST 			(1<<4)	' software system reset status

'  Peripheral interrupt wakeup events values
#define SYSCTL_WAKEUP_SPI0TINT    	(1<<0)	' SPI0 interrupt wake-up
#define SYSCTL_WAKEUP_SPI1INT     	(1<<1)	' SPI0 interrupt wake-up
#define SYSCTL_WAKEUP_USART0INT   	(1<<3)	' USART0 interrupt wake-up
#define SYSCTL_WAKEUP_USART1INT   	(1<<4)	' USART1 interrupt wake-up
#define SYSCTL_WAKEUP_USART2INT   	(1<<5)	' USART2 interrupt wake-up
#define SYSCTL_WAKEUP_I2C0INT     	(1<<8)	' I2C0 interrupt wake-up
#define SYSCTL_WAKEUP_I2C1INT     	(1<<7)	' I2C1 interrupt wake-up [Available only on LPC82X]
#define SYSCTL_WAKEUP_I2C2INT     	(1<<21)	' I2C2 interrupt wake-up [Available only on LPC82X]
#define SYSCTL_WAKEUP_I2C3INT     	(1<<22)	' I2C3 interrupt wake-up [Available only on LPC82X]
#define SYSCTL_WAKEUP_WWDTINT     	(1<<12)	' WWDT interrupt wake-up
#define SYSCTL_WAKEUP_BODINT      	(1<<13)	' Brown Out Detect (BOD) interrupt wake-up
#define SYSCTL_WAKEUP_WKTINT      	(1<<15)	' Self wake-up timer interrupt wake-up
#define SYSCTL_WAKEUP_I2CINT      	SYSCTL_WAKEUP_I2C0INT ' Same as #SYSCTL_WAKEUP_I2CINT

'  Deep sleep setup values
#define SYSCTL_DEEPSLP_BOD_PD    	(1<<3)	' BOD power-down control in Deep-sleep mode, powered down
#define SYSCTL_DEEPSLP_WDTOSC_PD 	(1<<6)	' Watchdog oscillator power control in Deep-sleep, powered down

'  Deep sleep to wakeup and power state setup values
#define SYSCTL_SLPWAKE_IRCOUT_PD 	(1<<0)	' IRC oscillator output wake-up configuration
#define SYSCTL_SLPWAKE_IRC_PD    	(1<<1)	' IRC oscillator power-down wake-up configuration
#define SYSCTL_SLPWAKE_FLASH_PD  	(1<<2)	' Flash wake-up configuration
#define SYSCTL_SLPWAKE_BOD_PD    	(1<<3)	' BOD wake-up configuration
#define SYSCTL_SLPWAKE_ADC_PD    	(1<<4)	' ADC wake-up configuration [Available only on LPC82x]
#define SYSCTL_SLPWAKE_SYSOSC_PD 	(1<<5)	' System oscillator wake-up configuration
#define SYSCTL_SLPWAKE_WDTOSC_PD 	(1<<6)	' Watchdog oscillator wake-up configuration
#define SYSCTL_SLPWAKE_SYSPLL_PD 	(1<<7)	' System PLL wake-up configuration
#define SYSCTL_SLPWAKE_ACMP_PD   	(1<<15)	' Analog comparator wake-up configuration

'  Non-Maskable Interrupt Enable/Disable value
#define SYSCTL_NMISRC_ENABLE		(1<<31)	' Enable the Non-Maskable Interrupt (NMI) source

'  Reset Alias 
#define RESET_I2C    RESET_I2C0

#define I2C0_BASE_ADDR			0x40050000
#define I2C1_BASE_ADDR			0x40054000  ' Available only on LPC82x
#define SPI0_BASE_ADDR			0x40058000
#define SPI1_BASE_ADDR			0x4005C000
#define USART0_BASE_ADDR		0x40064000
#define USART1_BASE_ADDR		0x40068000
#define USART2_BASE_ADDR		0x4006C000
#define I2C2_BASE_ADDR			0x40070000  ' Available only on LPC82x
#define I2C3_BASE_ADDR			0x40074000  ' Available only on LPC82x

' AHB peripherals
#define CRC_BASE_ADDR			0x50000000
#define SCT_BASE_ADDR			0x50004000
#define DMA_BASE_ADDR			0x50008000  ' Available only on LPC82x

#define GPIO_PORT_BASE_ADDR		0xA0000000
#define PIN_INT_BASE_ADDR		0xA0004000

' Pointer to ROM API function address
#define ROM_API_BASE_LOC_ADDR	0x1FFF1FF8

' Pointer to ROM IAP entry functions
#define IAP_ENTRY_LOCATION_ADDR	0X1FFF1FF1

' Internal oscillator frequency
#define SYSCTL_IRC_FREQ     (12000000)
#define MAX_CLOCK_FREQ		(30000000)

' Clock name alias
#define SYSCTL_CLOCK_I2C       SYSCTL_CLOCK_I2C0
#define SYSCTL_CLOCK_ACMP     SYSCTL_CLOCK_ACOMP


'  @brief IOCON Register bit definitions
#define NUM_IOCON_PIO  (29)

' Pin Mode mask
#define PIN_MODE_MASK           (0x3<<3)
#define PIN_MODE_BITNUM         (3)

' Pin Hysteresis mask
#define PIN_HYS_MASK            (0x1<<5)
#define PIN_HYS_BITNUM          (5)

' Pin invert input mask
#define PIN_INV_MASK            (0x1<<6)
#define PIN_INV_BITNUM          (6)

' Pin open drain mode mask
#define PIN_OD_MASK             (0x1<<10)
#define PIN_OD_BITNUM           (10)

' Pin digital filter sample mode mask
#define PIN_SMODE_MASK          (0x3<<11)
#define PIN_SMODE_BITNUM        (11)

' Pin clock divider mask
#define PIN_CLKDIV_MASK         (0x7<<13)
#define PIN_CLKDIV_BITNUM       (13)

' Pin I2C mode mask - valid for PIO10 & PIO11 only
#define PIN_I2CMODE_MASK        (0x3<<8)
#define PIN_I2CMODE_BITNUM      (8)

'  switch matrix reserved pins
#define SWM_PINENABLE0_RESERVED  (Not (0x1ffffff))

' Flash signature start and busy status bit
#define FMC_FLASHSIG_BUSY	(1<<31)

'  LPC8xx Pin Interrupt and Pattern match engine register bit fields and macros
'  PININT interrupt control register
#define PININT_PMCTRL_PMATCH_SEL (1<<0) 
#define PININT_PMCTRL_RXEV_ENA   (1<<1) 

' PININT Bit slice source register bits
#define PININT_SRC_BITSOURCE_START  8
#define PININT_SRC_BITSOURCE_MASK   7

' PININT Bit slice configuration register bits
#define PININT_SRC_BITCFG_START  8
#define PININT_SRC_BITCFG_MASK   7

'  LPC8xx Pin Interrupt channel values
#define PININTCH0         (1<<0)
#define PININTCH1         (1<<1)
#define PININTCH2         (1<<2)
#define PININTCH3         (1<<3)
#define PININTCH4         (1<<4)
#define PININTCH5         (1<<5)
#define PININTCH6         (1<<6)
#define PININTCH7         (1<<7)
#define PININTCH(x)      (1<<(x))

' PMU PCON register bit fields & masks
#define PMU_PCON_PM_SLEEP			(0x0)		' ARM WFI enter sleep mode 
#define PMU_PCON_PM_DEEPSLEEP		(0x1)		' ARM WFI enter Deep-sleep mode 
#define PMU_PCON_PM_POWERDOWN		(0x2)		' ARM WFI enter Power-down mode 
#define PMU_PCON_PM_DEEPPOWERDOWN	(0x3)		' ARM WFI enter Deep Power-down mode 
#define PMU_PCON_NODPD				(1<<3)	' Disable deep power-down mode 
#define PMU_PCON_SLEEPFLAG			(1<<8)	' Sleep mode flag 
#define PMU_PCON_DPDFLAG			(1<<11)	' Deep power-down flag 

' PMU DPDCTRL register bit fields & masks
#define PMU_DPDCTRL_WAKEUPPHYS      (1<<0)	' Enable wake-up pin hysteresis 
#define PMU_DPDCTRL_WAKEPAD         (1<<1)	' Disable the Wake-up 
#define PMU_DPDCTRL_LPOSCEN         (1<<2)	' Enable the low-power oscillator (10 khz self wk) 
#define PMU_DPDCTRL_LPOSCDPDEN      (1<<3)	' Enable the low-power oscillator in deep power-down

' EDGECLR interrupt clear bit, write 1, then 0 
#define ACMP_EDGECLR_BIT     (1<<20)
#define ACMP_EDGESEL_MASK    (0x3<<3)
#define ACMP_COMPVPSEL_MASK  (0x7<<8)
#define ACMP_COMPVMSEL_MASK  (0x7<<11)
#define ACMP_HYSTERESIS_MASK (0x3<<25)
#define ACMP_LADSEL_MASK     (0x1F<<1)
#define ACMP_LADREF_MASK     (0x1<<6)

' @brief CRC MODE register description
#define CRC_MODE_POLY_BITMASK   ((0x03))	' CRC polynomial Bit mask 
#define CRC_MODE_POLY_CCITT     (0x00)		' Select CRC-CCITT polynomial 
#define CRC_MODE_POLY_CRC16     (0x01)		' Select CRC-16 polynomial 
#define CRC_MODE_POLY_CRC32     (0x02)		' Select CRC-32 polynomial 
#define CRC_MODE_WRDATA_BITMASK (0x03<<2)	' CRC WR_Data Config Bit mask 
#define CRC_MODE_WRDATA_BIT_RVS (1<<2)	' Select Bit order reverse for WR_DATA (per byte) 
#define CRC_MODE_WRDATA_CMPL    (1<<3)	' Select One's complement for WR_DATA 
#define CRC_MODE_SUM_BITMASK    (0x03<<4)	' CRC Sum Config Bit mask 
#define CRC_MODE_SUM_BIT_RVS    (1<<4)	' Select Bit order reverse for CRC_SUM 
#define CRC_MODE_SUM_CMPL       (1<<5)	' Select One's complement for CRC_SUM 

#define MODE_CFG_CCITT          (0x00)	' Pre-defined mode word for default CCITT setup 
#define MODE_CFG_CRC16          (0x15)	' Pre-defined mode word for default CRC16 setup 
#define MODE_CFG_CRC32          (0x36)	' Pre-defined mode word for default CRC32 setup 

#define CRC_SEED_CCITT          (0x0000FFFF)' Initial seed value for CCITT mode 
#define CRC_SEED_CRC16          (0x00000000)' Initial seed value for CRC16 mode 
#define CRC_SEED_CRC32          (0xFFFFFFFF)' Initial seed value for CRC32 mode 


' @brief LPC8xx MRT chip configuration
#define MRT_CHANNELS_NUM      (4)
#define MRT_NO_IDLE_CHANNEL   (0x40)


' @brief MRT register bit fields & masks
' MRT Time interval register bit fields 
#define MRT_INTVAL_IVALUE        (0x7FFFFFFF)	' Maximum interval load value and mask 
#define MRT_INTVAL_LOAD          (0x80000000)	' Force immediate load of timer interval register bit 

' MRT Control register bit fields & masks 
#define MRT_CTRL_INTEN_MASK      (0x01)
#define MRT_CTRL_MODE_MASK       (0x06)

' MRT Status register bit fields & masks 
#define MRT_STAT_INTFLAG         (0x01)
#define MRT_STAT_RUNNING         (0x02)

' Pointer to individual MR register blocks
#define MRT_CH0         ((MRT_CH_T *) &MRT->CHANNEL[0])
#define MRT_CH1         ((MRT_CH_T *) &MRT->CHANNEL[1])
#define MRT_CH2         ((MRT_CH_T *) &MRT->CHANNEL[2])
#define MRT_CH3         ((MRT_CH_T *) &MRT->CHANNEL[3])
#define MRT_CH(x)      ((MRT_CH_T *) &MRT->CHANNEL[(x)])
 
 
' Global interrupt flag register interrupt mask/clear values 
#define MRT0_INTFLAG        (1)
#define MRT1_INTFLAG        (2)
#define MRT2_INTFLAG        (4)
#define MRT3_INTFLAG        (8)
#define MRTn_INTFLAG(x)    (1<<(x))


' @brief UART CFG register definitions
#define UART_CFG_ENABLE         (0x01<<0)
#define UART_CFG_DATALEN_7      (0x00<<2)		' UART 7 bit length mode 
#define UART_CFG_DATALEN_8      (0x01<<2)		' UART 8 bit length mode 
#define UART_CFG_DATALEN_9      (0x02<<2)		' UART 9 bit length mode 
#define UART_CFG_PARITY_NONE    (0x00<<4)		' No parity 
#define UART_CFG_PARITY_EVEN    (0x02<<4)		' Even parity 
#define UART_CFG_PARITY_ODD     (0x03<<4)		' Odd parity 
#define UART_CFG_STOPLEN_1      (0x00<<6)		' UART One Stop Bit Select 
#define UART_CFG_STOPLEN_2      (0x01<<6)		' UART Two Stop Bits Select 
#define UART_CFG_CTSEN          (0x01<<9)		' CTS enable bit 
#define UART_CFG_SYNCEN         (0x01<<11)	' Synchronous mode enable bit 
#define UART_CFG_CLKPOL         (0x01<<12)	' Un_RXD rising edge sample enable bit 
#define UART_CFG_SYNCMST        (0x01<<14)	' Select master mode (synchronous mode) enable bit 
#define UART_CFG_LOOP           (0x01<<15)	' Loopback mode enable bit 

#define UART_CFG_OETA           (0x01<<18)    ' Output Enable Turnaround time for RS485 
#define UART_CFG_AUTOADDR       (0x01<<19)    ' Automatic address matching enable 
#define UART_CFG_OESEL          (0x01<<20)    ' Output enable select 
#define UART_CFG_OEPOL          (0x01<<21)    ' Output enable polarity 
#define UART_CFG_RXPOL          (0x01<<22)    ' Receive data polarity 
#define UART_CFG_TXPOL          (0x01<<22)    ' Transmit data polarity 
//#define UART_CFG_RESERVED       ((1<<1)|(1<<7)|(1<<8)|(1<<10)|(1<<13)|(3<<16)|(0xffu<<24))

' @brief UART CTRL register definitions
#define UART_CTRL_TXBRKEN       (0x01<<1)		' Continuous break enable bit 
#define UART_CTRL_ADDRDET       (0x01<<2)		' Address detect mode enable bit 
#define UART_CTRL_TXDIS         (0x01<<6)		' Transmit disable bit 
#define UART_CTRL_CC            (0x01<<8)		' Continuous Clock mode enable bit 
#define UART_CTRL_CLRCC         (0x01<<9)		' Clear Continuous Clock bit 
#define UART_CTRL_AUTOBAUD      (1<<16)       ' Enable UART Autobaud 
#define UART_CTRL_RESERVED      (0xFFFEFCB9)

' @brief UART STAT register definitions
#define UART_STAT_RXRDY         (0x01<<0)			' Receiver ready 
#define UART_STAT_RXIDLE        (0x01<<1)			' Receiver idle 
#define UART_STAT_TXRDY         (0x01<<2)			' Transmitter ready for data 
#define UART_STAT_TXIDLE        (0x01<<3)			' Transmitter idle 
#define UART_STAT_CTS           (0x01<<4)			' Status of CTS signal 
#define UART_STAT_DELTACTS      (0x01<<5)			' Change in CTS state 
#define UART_STAT_TXDISINT      (0x01<<6)			' Transmitter disabled 
#define UART_STAT_OVERRUNINT    (0x01<<8)			' Overrun Error interrupt flag. 
#define UART_STAT_RXBRK         (0x01<<10)		' Received break 
#define UART_STAT_DELTARXBRK    (0x01<<11)		' Change in receive break detection 
#define UART_STAT_START         (0x01<<12)		' Start detected 
#define UART_STAT_FRM_ERRINT    (0x01<<13)		' Framing Error interrupt flag 
#define UART_STAT_PAR_ERRINT    (0x01<<14)		' Parity Error interrupt flag 
#define UART_STAT_RXNOISEINT    (0x01<<15)		' Received Noise interrupt flag 
#define UART_STAT_ABERR         (0x01<<16)        ' Auto baud error 
// #define UART_STAT_RESERVED      ((1<<7)|(1<<9)|(0xFFFEU<<16))

' @brief UART INTENSET/INTENCLR register definitions
#define UART_INTEN_RXRDY        (0x01<<0)			' Receive Ready interrupt 
#define UART_INTEN_TXRDY        (0x01<<2)			' Transmit Ready interrupt 
#define UART_INTEN_DELTACTS     (0x01<<5)			' Change in CTS state interrupt 
#define UART_INTEN_TXDIS        (0x01<<6)			' Transmitter disable interrupt 
#define UART_INTEN_OVERRUN      (0x01<<8)			' Overrun error interrupt 
#define UART_INTEN_DELTARXBRK   (0x01<<11)		' Change in receiver break detection interrupt 
#define UART_INTEN_START        (0x01<<12)		' Start detect interrupt 
#define UART_INTEN_FRAMERR      (0x01<<13)		' Frame error interrupt 
#define UART_INTEN_PARITYERR    (0x01<<14)		' Parity error interrupt 
#define UART_INTEN_RXNOISE      (0x01<<15)		' Received noise interrupt 
#define UART_INTEN_TXIDLE       (0x01<<3)         ' TX Idle enable/clear 
#define UART_INTEN_ABERR        (0x01<<16)        ' Auto baud error 
//#define UART_INTEN_RESERVED     ((1<<1)|(1<<4)|(1<<7)|(3<<9)|(0xfffeu<<16))
//#define UART_INTSTAT_RESERVED   ((1<<1)|(1<<4)|(1<<7)|(3<<9)|(0xfffeu<<16))


' WKT Control register bit fields & masks
#define WKT_CTRL_CLKSEL        ((1<<0))	' Select the self wake-up timer clock source 
#define WKT_CTRL_ALARMFLAG     ((1<<1))	' Wake-up or alarm timer flag 
#define WKT_CTRL_CLEARCTR      ((1<<2))	' Clears the self wake-up timer 

' WDT oscillator frequency value 
#define WDT_OSC     (LPC8XX_IRC_FREQ)

' @brief Watchdog Mode register definitions
' Watchdog Mode Bitmask 
#define WWDT_WDMOD_BITMASK          (0x1F)
' WWDT interrupt enable bit 
#define WWDT_WDMOD_WDEN             ((1<<0))
' WWDT interrupt enable bit 
#define WWDT_WDMOD_WDRESET          ((1<<1))
' WWDT time out flag bit 
#define WWDT_WDMOD_WDTOF            ((1<<2))
' WDT Time Out flag bit 
#define WWDT_WDMOD_WDINT            ((1<<3))




' @brief SCT Module configuration
#define CONFIG_SCT_nEV   (8)			' Number of events 
#define CONFIG_SCT_nRG   (8)			' Number of match/compare registers 
#define CONFIG_SCT_nOU   (6)			' Number of outputs 


' @brief Macro defines for SCT configuration register
#define SCT_CONFIG_16BIT_COUNTER        0x00000000				' Operate as 2 16-bit counters 
#define SCT_CONFIG_32BIT_COUNTER        0x00000001				' Operate as 1 32-bit counter 

#define SCT_CONFIG_CLKMODE_BUSCLK       (0x0<<1)				' Bus clock 
#define SCT_CONFIG_CLKMODE_SCTCLK       (0x1<<1)				' SCT clock 
#define SCT_CONFIG_CLKMODE_INCLK        (0x2<<1)				' Input clock selected in CLKSEL field 
#define SCT_CONFIG_CLKMODE_INEDGECLK    (0x3<<1)				' Input clock edge selected in CLKSEL field 

#define SCT_CONFIG_NORELOAD_U           (0x1<<7)				' Prevent match register reload 
#define SCT_CONFIG_NORELOAD_L           (0x1<<7)				' Prevent lower match register reload 
#define SCT_CONFIG_NORELOAD_H           (0x1<<8)				' Prevent upper match register reload 

#define SCT_CONFIG_AUTOLIMIT_U          (0x1<<17)				' Limits counter(unified) based on MATCH0 
#define SCT_CONFIG_AUTOLIMIT_L          (0x1<<17)				' Limits counter(L) based on MATCH0 
#define SCT_CONFIG_AUTOLIMIT_H          (0x1<<18)				' Limits counter(L) based on MATCH0 

' @brief Macro defines for SCT control register
#define COUNTUP_TO_LIMIT_THEN_CLEAR_TO_ZERO     0				' Direction for low or unified counter 
#define COUNTUP_TO LIMIT_THEN_COUNTDOWN_TO_ZERO 1

#define SCT_CTRL_STOP_L                 (1<<1)				' Stop low counter 
#define SCT_CTRL_HALT_L                 (1<<2)				' Halt low counter 
#define SCT_CTRL_CLRCTR_L               (1<<3)				' Clear low or unified counter 
#define SCT_CTRL_BIDIR_L(x)             (((x) & 0x01)<<4)		' Bidirectional bit 
#define SCT_CTRL_PRE_L(x)               (((x) & 0xFF)<<5)		' Prescale clock for low or unified counter 

#define COUNTUP_TO_LIMIT_THEN_CLEAR_TO_ZERO     0				' Direction for high counter 
#define COUNTUP_TO LIMIT_THEN_COUNTDOWN_TO_ZERO 1
#define SCT_CTRL_STOP_H                 (1<<17)				' Stop high counter 
#define SCT_CTRL_HALT_H                 (1<<18)				' Halt high counter 
#define SCT_CTRL_CLRCTR_H               (1<<19)				' Clear high counter 
#define SCT_CTRL_BIDIR_H(x)             (((x) & 0x01)<<20)
#define SCT_CTRL_PRE_H(x)               (((x) & 0xFF)<<21)	' Prescale clock for high counter 

' @brief Macro defines for SCT Conflict resolution register
#define SCT_RES_NOCHANGE                (0)
#define SCT_RES_SET_OUTPUT              (1)
#define SCT_RES_CLEAR_OUTPUT            (2)
#define SCT_RES_TOGGLE_OUTPUT           (3)

' I2CM_8XX_STATUS_TYPES I2C master transfer status types
#define I2CM_STATUS_OK              0x00		' Requested Request was executed successfully. 
#define I2CM_STATUS_ERROR           0x01		' Unknown error condition. 
#define I2CM_STATUS_NAK_ADR         0x02		' No acknowledgement received from slave during address phase. 
#define I2CM_STATUS_BUS_ERROR       0x03		' I2C bus error 
#define I2CM_STATUS_NAK_DAT			0x04		' No acknowledgement received from slave during address phase. 
#define I2CM_STATUS_ARBLOST         0x05		' Arbitration lost. 
#define I2CM_STATUS_BUSY            0xFF		' I2C transmistter is busy. 

'
 * Macro defines for SPI Status register
 

' Clear RXOV Flag 
#define SPI_STAT_CLR_RXOV       ((1<<2))
' Clear TXUR Flag 
#define SPI_STAT_CLR_TXUR       ((1<<3))
' Clear SSA Flag 
#define SPI_STAT_CLR_SSA        ((1<<4))
' Clear SSD Flag 
#define SPI_STAT_CLR_SSD        ((1<<5))


' Maximum sample rate in Hz (12-bit conversions) 
#define ADC_MAX_SAMPLE_RATE 30000000

' @brief ADC register support bitfields and mask
' ADC Control register bit fields 
#define ADC_CR_CLKDIV_MASK      (0xFF<<0)				' Mask for Clock divider value 
#define ADC_CR_CLKDIV_BITPOS    (0)						' Bit position for Clock divider value 
#define ADC_CR_ASYNMODE         (1<<8)				' Asynchronous mode enable bit 
#define ADC_CR_MODE10BIT        (1<<9)				' 10-bit mode enable bit 
#define ADC_CR_LPWRMODEBIT      (1<<10)				' Low power mode enable bit 
#define ADC_CR_CALMODEBIT       (1<<30)				' Self calibration cycle enable bit 
#define ADC_CR_BITACC(n)        ((((n) & 0x1)<<9))	' 12-bit or 10-bit ADC accuracy 
#define ADC_CR_CLKDIV(n)        ((((n) & 0xFF)<<0))	' The APB clock (PCLK) is divided by (this value plus one) to produce the clock for the A/D 
#define ADC_SAMPLE_RATE_CONFIG_MASK (ADC_CR_CLKDIV(0xFF) | ADC_CR_BITACC(0x01))

' ADC Sequence Control register bit fields 
#define ADC_SEQ_CTRL_CHANSEL(n)   (1<<(n))			' Channel select macro 
#define ADC_SEQ_CTRL_CHANSEL_MASK (0xFFF)				' Channel select mask 

' ADC hardware trigger sources in SEQ_CTRL 
#define ADC_SEQ_CTRL_HWTRIG_ARM_TXEV     (0<<12)		' HW trigger input - ARM TXEV 
#define ADC_SEQ_CTRL_HWTRIG_CT32B0_MAT0  (1<<12)		' HW trigger input - Match output 0 of CT32B0 
#define ADC_SEQ_CTRL_HWTRIG_CT32B0_MAT1  (2<<12)		' HW trigger input - Match output 1 of CT32B1 or SCT_OUT0 
#define ADC_SEQ_CTRL_HWTRIG_SCT_OUT0     (2<<12)		' HW trigger input - Match output 1 of CT32B1 or SCT_OUT0 
#define ADC_SEQ_CTRL_HWTRIG_CT16B0_MAT0  (3<<12)		' HW trigger input - Match output 0 of CT16B0 
#define ADC_SEQ_CTRL_HWTRIG_CT16B0_MAT1  (4<<12)		' HW trigger input - Match output 1 of CT16B1 or SCT_OUT1 
#define ADC_SEQ_CTRL_HWTRIG_SCT_OUT1     (4<<12)		' HW trigger input - Match output 1 of CT16B1 or SCT_OUT1 
#define ADC_SEQ_CTRL_HWTRIG_CT16B0_CAP0  (5<<12)		' HW trigger input - Capture input 0 of CT16B0 
#define ADC_SEQ_CTRL_HWTRIG_CT16B1_CAP0  (6<<12)		' HW trigger input - Capture input 0 of CT16B1 
#define ADC_SEQ_CTRL_HWTRIG_CT32B0_CAP0  (7<<12)		' HW trigger input - Capture input 0 of CT32B1 
#define ADC_SEQ_CTRL_HWTRIG_MASK         (0x3F<<12)	' HW trigger input bitfield mask 

' SEQ_CTRL register bit fields 
#define ADC_SEQ_CTRL_HWTRIG_POLPOS       (1<<18)		' HW trigger polarity - positive edge 
#define ADC_SEQ_CTRL_HWTRIG_SYNCBYPASS   (1<<19)		' HW trigger bypass synchronisation 
#define ADC_SEQ_CTRL_START               (1<<26)		' Start conversion enable bit 
#define ADC_SEQ_CTRL_BURST               (1<<27)		' Repeated conversion enable bit 
#define ADC_SEQ_CTRL_SINGLESTEP          (1<<28)		' Single step enable bit 
#define ADC_SEQ_CTRL_LOWPRIO             (1<<29)		' High priority enable bit (regardless of name) 
#define ADC_SEQ_CTRL_MODE_EOS            (1<<30)		' Mode End of sequence enable bit 
#define ADC_SEQ_CTRL_SEQ_ENA             (1<<31)	' Sequence enable bit 

' ADC global data register bit fields 
#define ADC_SEQ_GDAT_RESULT_MASK         (0xFFF<<4)	' Result value mask 
#define ADC_SEQ_GDAT_RESULT_BITPOS       (4)			' Result start bit position 
#define ADC_SEQ_GDAT_THCMPRANGE_MASK     (0x3<<16)	' Comparion range mask 
#define ADC_SEQ_GDAT_THCMPRANGE_BITPOS   (16)			' Comparison range bit position 
#define ADC_SEQ_GDAT_THCMPCROSS_MASK     (0x3<<18)	' Comparion cross mask 
#define ADC_SEQ_GDAT_THCMPCROSS_BITPOS   (18)			' Comparison cross bit position 
#define ADC_SEQ_GDAT_CHAN_MASK           (0xF<<26)	' Channel number mask 
#define ADC_SEQ_GDAT_CHAN_BITPOS         (26)			' Channel number bit position 
#define ADC_SEQ_GDAT_OVERRUN             (1<<30)		' Overrun bit 
#define ADC_SEQ_GDAT_DATAVALID           (1<<31)	' Data valid bit 

' ADC Data register bit fields 
#define ADC_DR_RESULT(n)           ((((n) >> 4) & 0xFFF))	' Macro for getting the ADC data value 
#define ADC_DR_THCMPRANGE_MASK     (0x3<<16)			' Comparion range mask 
#define ADC_DR_THCMPRANGE_BITPOS   (16)					' Comparison range bit position 
#define ADC_DR_THCMPRANGE(n)       (((n) >> ADC_DR_THCMPRANGE_BITPOS) & 0x3)
#define ADC_DR_THCMPCROSS_MASK     (0x3<<18)			' Comparion cross mask 
#define ADC_DR_THCMPCROSS_BITPOS   (18)					' Comparison cross bit position 
#define ADC_DR_THCMPCROSS(n)       (((n) >> ADC_DR_THCMPCROSS_BITPOS) & 0x3)
#define ADC_DR_CHAN_MASK           (0xF<<26)			' Channel number mask 
#define ADC_DR_CHAN_BITPOS         (26)					' Channel number bit position 
#define ADC_DR_CHANNEL(n)          (((n) >> ADC_DR_CHAN_BITPOS) & 0xF)	' Channel number bit position 
#define ADC_DR_OVERRUN             (1<<30)			' Overrun bit 
#define ADC_DR_DATAVALID           (1<<31)			' Data valid bit 
#define ADC_DR_DONE(n)             (((n) >> 31))

' ADC low/high Threshold register bit fields 
#define ADC_THR_VAL_MASK            (0xFFF<<4)		' Threshold value bit mask 
#define ADC_THR_VAL_POS             (4)					' Threshold value bit position 

' ADC Threshold select register bit fields 
#define ADC_THRSEL_CHAN_SEL_THR1(n) (1<<(n))			' Select THR1 register for channel n 

' ADC Interrupt Enable register bit fields 
#define ADC_INTEN_SEQA_ENABLE       (1<<0)			' Sequence A Interrupt enable bit 
#define ADC_INTEN_SEQB_ENABLE       (1<<1)			' Sequence B Interrupt enable bit 
#define ADC_INTEN_SEQN_ENABLE(seq)  (1<<(seq))		' Sequence A/B Interrupt enable bit 
#define ADC_INTEN_OVRRUN_ENABLE     (1<<2)			' Overrun Interrupt enable bit 
#define ADC_INTEN_CMP_DISBALE       (0)					' Disable comparison interrupt value 
#define ADC_INTEN_CMP_OUTSIDETH     (1)					' Outside threshold interrupt value 
#define ADC_INTEN_CMP_CROSSTH       (2)					' Crossing threshold interrupt value 
#define ADC_INTEN_CMP_MASK          (3)					' Comparison interrupt value mask 
#define ADC_INTEN_CMP_ENABLE(isel, ch) (((isel) & ADC_INTEN_CMP_MASK)<<((2 * (ch)) + 3))	' Interrupt selection for channel 

' ADC Flags register bit fields 
#define ADC_FLAGS_THCMP_MASK(ch)    (1<<(ch))		' Threshold comparison status for channel 
#define ADC_FLAGS_OVRRUN_MASK(ch)   (1<<(12 + (ch)))	' Overrun status for channel 
#define ADC_FLAGS_SEQA_OVRRUN_MASK  (1<<24)			' Seq A Overrun status 
#define ADC_FLAGS_SEQB_OVRRUN_MASK  (1<<25)			' Seq B Overrun status 
#define ADC_FLAGS_SEQN_OVRRUN_MASK(seq) (1<<(24 + (seq)))	' Seq A/B Overrun status 
#define ADC_FLAGS_SEQA_INT_MASK     (1<<28)			' Seq A Interrupt status 
#define ADC_FLAGS_SEQB_INT_MASK     (1<<29)			' Seq B Interrupt status 
#define ADC_FLAGS_SEQN_INT_MASK(seq) (1<<(28 + (seq)))' Seq A/B Interrupt status 
#define ADC_FLAGS_THCMP_INT_MASK    (1<<30)			' Threshold comparison Interrupt status 
#define ADC_FLAGS_OVRRUN_INT_MASK   (1<<31)			' Overrun Interrupt status 

' ADC Trim register bit fields 
#define ADC_TRIM_VRANGE_HIGHV       (0<<5)			' Voltage range bit - High volatge (2.7V to 3.6V) 
#define ADC_TRIM_VRANGE_LOWV        (1<<5)			' Voltage range bit - Low volatge (1.8V to 2.7V) 



' On LPC82x, Max DMA channel is 18 
#define MAX_DMA_CHANNEL			(DMA_CH17 + 1)

' DMA interrupt status bits (common) 
#define DMA_INTSTAT_ACTIVEINT       0x2		' Summarizes whether any enabled interrupts are pending 
#define DMA_INTSTAT_ACTIVEERRINT    0x4		' Summarizes whether any error interrupts are pending 

' Support macro for DMA_CHDESC_T 
#define DMA_ADDR(addr)      ((addr))

' Support definitions for setting the configuration of a DMA channel. You
'   will need to get more information on these options from the User manual. 
#define DMA_CFG_PERIPHREQEN     (1<<0)	' Enables Peripheral DMA requests 
#define DMA_CFG_HWTRIGEN        (1<<1)	' Use hardware triggering via imput mux 
#define DMA_CFG_TRIGPOL_LOW     (0<<4)	' Hardware trigger is active low or falling edge 
#define DMA_CFG_TRIGPOL_HIGH    (1<<4)	' Hardware trigger is active high or rising edge 
#define DMA_CFG_TRIGTYPE_EDGE   (0<<5)	' Hardware trigger is edge triggered 
#define DMA_CFG_TRIGTYPE_LEVEL  (1<<5)	' Hardware trigger is level triggered 
#define DMA_CFG_TRIGBURST_SNGL  (0<<6)	' Single transfer. Hardware trigger causes a single transfer 
#define DMA_CFG_TRIGBURST_BURST (1<<6)	' Burst transfer (see UM) 
#define DMA_CFG_BURSTPOWER_1    (0<<8)	' Set DMA burst size to 1 transfer 
#define DMA_CFG_BURSTPOWER_2    (1<<8)	' Set DMA burst size to 2 transfers 
#define DMA_CFG_BURSTPOWER_4    (2<<8)	' Set DMA burst size to 4 transfers 
#define DMA_CFG_BURSTPOWER_8    (3<<8)	' Set DMA burst size to 8 transfers 
#define DMA_CFG_BURSTPOWER_16   (4<<8)	' Set DMA burst size to 16 transfers 
#define DMA_CFG_BURSTPOWER_32   (5<<8)	' Set DMA burst size to 32 transfers 
#define DMA_CFG_BURSTPOWER_64   (6<<8)	' Set DMA burst size to 64 transfers 
#define DMA_CFG_BURSTPOWER_128  (7<<8)	' Set DMA burst size to 128 transfers 
#define DMA_CFG_BURSTPOWER_256  (8<<8)	' Set DMA burst size to 256 transfers 
#define DMA_CFG_BURSTPOWER_512  (9<<8)	' Set DMA burst size to 512 transfers 
#define DMA_CFG_BURSTPOWER_1024 (10<<8)	' Set DMA burst size to 1024 transfers 
#define DMA_CFG_BURSTPOWER(n)   ((n)<<8)	' Set DMA burst size to 2^n transfers, max n=10 
#define DMA_CFG_SRCBURSTWRAP    (1<<14)	' Source burst wrapping is enabled for this DMA channel 
#define DMA_CFG_DSTBURSTWRAP    (1<<15)	' Destination burst wrapping is enabled for this DMA channel 
#define DMA_CFG_CHPRIORITY(p)   ((p)<<16)	' Sets DMA channel priority, min 0 (highest), max 3 (lowest) 

' DMA channel control and status register definitions 
#define DMA_CTLSTAT_VALIDPENDING    (1<<0)	' Valid pending flag for this channel 
#define DMA_CTLSTAT_TRIG            (1<<2)	' Trigger flag. Indicates that the trigger for this channel is currently set 

' DMA channel transfer configuration registers definitions 
#define DMA_XFERCFG_CFGVALID        (1<<0)	' Configuration Valid flag 
#define DMA_XFERCFG_RELOAD          (1<<1)	' Indicates whether the channels control structure will be reloaded when the current descriptor is exhausted 
#define DMA_XFERCFG_SWTRIG          (1<<2)	' Software Trigger 
#define DMA_XFERCFG_CLRTRIG         (1<<3)	' Clear Trigger 
#define DMA_XFERCFG_SETINTA         (1<<4)	' Set Interrupt flag A for this channel to fire when descriptor is complete 
#define DMA_XFERCFG_SETINTB         (1<<5)	' Set Interrupt flag B for this channel to fire when descriptor is complete 
#define DMA_XFERCFG_WIDTH_8         (0<<8)	' 8-bit transfers are performed 
#define DMA_XFERCFG_WIDTH_16        (1<<8)	' 16-bit transfers are performed 
#define DMA_XFERCFG_WIDTH_32        (2<<8)	' 32-bit transfers are performed 
#define DMA_XFERCFG_SRCINC_0        (0<<12)	' DMA source address is not incremented after a transfer 
#define DMA_XFERCFG_SRCINC_1        (1<<12)	' DMA source address is incremented by 1 (width) after a transfer 
#define DMA_XFERCFG_SRCINC_2        (2<<12)	' DMA source address is incremented by 2 (width) after a transfer 
#define DMA_XFERCFG_SRCINC_4        (3<<12)	' DMA source address is incremented by 4 (width) after a transfer 
#define DMA_XFERCFG_DSTINC_0        (0<<14)	' DMA destination address is not incremented after a transfer 
#define DMA_XFERCFG_DSTINC_1        (1<<14)	' DMA destination address is incremented by 1 (width) after a transfer 
#define DMA_XFERCFG_DSTINC_2        (2<<14)	' DMA destination address is incremented by 2 (width) after a transfer 
#define DMA_XFERCFG_DSTINC_4        (3<<14)	' DMA destination address is incremented by 4 (width) after a transfer 
#define DMA_XFERCFG_XFERCOUNT(n)    ((n - 1)<<16)	' DMA transfer count in 'transfers', between (0)1 and (1023)1024 



