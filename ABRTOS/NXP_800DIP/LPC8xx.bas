#ifndef __LPC8xx_H
#define __LPC8xx_H

'VIC Vector Table
#define PSV_ISR 		*&H10000038 ' 14: The PendSV handler
#define SYSTICK_ISR 	*&H1000003C ' 15: The SysTick handler
#define SPI0_ISR        *&H10000040 ' 16: SPI0 controller
#define SPI1_ISR        *&H10000044 ' 17: SPI1 controller
' 18: Reserved
#define UART0_ISR       *&H1000004C ' 19: UART0
#define UART1_ISR       *&H10000050 ' 20: UART1
#define UART2_ISR       *&H10000054 ' 21: UART2
' 22-23: Reserved
#define I2C_ISR         *&H10000060 ' 24: I2C controller
#define SCT_ISR         *&H10000064 ' 25: Smart Counter Timer
#define MRT_ISR         *&H10000068 ' 26: Multi-Rate Timer
#define CMP_ISR         *&H1000006C ' 27: Comparator
#define WDT_ISR         *&H10000070 ' 28: Watch Dog Timer
#define BOD_ISR         *&H10000074 ' 29: Brown Out Detect
' 30: Reserved
#define WKT_ISR         *&H1000007C ' 31: Wakeup timer
' 32-39: Reserved
#define PININT0_ISR     *&H100000A0 ' 40: PIO INT0
#define PININT1_ISR     *&H100000A4 ' 41: PIO INT1
#define PININT2_ISR     *&H100000A8 ' 42: PIO INT2
#define PININT3_ISR     *&H100000AC ' 43: PIO INT3
#define PININT4_ISR     *&H100000B0 ' 44: PIO INT4
#define PININT5_ISR     *&H100000B4 ' 45: PIO INT5
#define PININT6_ISR     *&H100000B8 ' 46: PIO INT6
#define PININT7_ISR     *&H100000BC ' 47: PIO INT7


' Vectored Interrupt Controller (VIC)
#define VICIntEnable  *&HE000E100 'Set Enable
#define VICIntEnClear *&HE000E180 'Clr Enable
#define VICIntSetPend *&HE000E200 'Set Pending
#define VICIntClrPend *&HE000E280 'Clr Pending

' The name convention below is from previous LPC2000 family MCUs, in LPC8xx, these registers are known as VICVectPriority(x).
#define VICVectCntl0 *&HE000E400 'Priority0
#define VICVectCntl1 *&HE000E404 'Priority1
#define VICVectCntl2 *&HE000E408 'Priority2
#define VICVectCntl3 *&HE000E40C 'Priority3
#define VICVectCntl4 *&HE000E410 'Priority4
#define VICVectCntl5 *&HE000E414 'Priority5
#define VICVectCntl6 *&HE000E418 'Priority6
#define VICVectCntl7 *&HE000E41C 'Priority7

' System Control Block(SCB)
#define CPUID *&HE000ED00 'CPUID Base Register
#define ICSR  *&HE000ED04 'Interrupt Control and State Register
 ' Vector Table Offset Register (VTOR) NOT PRESENT
#define AIRCR *&HE000ED0C 'Application Interrupt and Reset Control Register
#define SCR   *&HE000ED10 'System Control Register
#define CCR   *&HE000ED14 'Configuration Control Register
#define SHP0  *&HE000ED1C 'System Handlers Priority Register[0]
#define SHP1  *&HE000ED20 'System Handlers Priority Register[1]
#define SHCSR *&HE000ED24 'System Handler Control and State Register

'  Sys Tick Timer
#define ST_CTRL   *&HE000E010 'SysTick Control and Status Register
#define ST_RELOAD *&HE000E014 'SysTick Reload Value Register
#define ST_CURR   *&HE000E018 'SysTick Current Value Register
#define ST_CALIB  *&HE000E01C 'SysTick Calibration Register

'------------- System Control (SYSCON) --------------------------------------
#define SYSCON_SYSMEMREMAP     *&H40048000 ' System memory remap (R/W)
#define SYSCON_PRESETCTRL      *&H40048004 ' Peripheral reset control (R/W)
#define SYSCON_SYSPLLCTRL      *&H40048008 ' System PLL control (R/W)
#define SYSCON_SYSPLLSTAT      *&H4004800C ' System PLL status (R/W )
#define SYSCON_SYSOSCCTRL      *&H40048020 ' System oscillator control (R/W)
#define SYSCON_WDTOSCCTRL      *&H40048024 ' Watchdog oscillator control (R/W)
#define SYSCON_SYSRSTSTAT      *&H40048030 ' System reset status Register (R/W )
#define SYSCON_SYSPLLCLKSEL    *&H40048040 ' System PLL clock source select (R/W)
#define SYSCON_SYSPLLCLKUEN    *&H40048044 ' System PLL clock source update enable (R/W)
#define SYSCON_MAINCLKSEL      *&H40048070 ' Main clock source select (R/W)
#define SYSCON_MAINCLKUEN      *&H40048074 ' Main clock source update enable (R/W)
#define SYSCON_SYSAHBCLKDIV    *&H40048078 ' System AHB clock divider (R/W)
#define SYSCON_SYSAHBCLKCTRL   *&H40048080 ' System AHB clock control (R/W)
#define SYSCON_UARTCLKDIV      *&H40048094 ' UART clock divider (R/W)
#define SYSCON_CLKOUTSEL       *&H400480E0 ' CLKOUT clock source select (R/W)
#define SYSCON_CLKOUTUEN       *&H400480E4 ' CLKOUT clock source update enable (R/W)
#define SYSCON_CLKOUTDIV       *&H400480E8 ' CLKOUT clock divider (R/W)
#define SYSCON_UARTFRGDIV      *&H400480F0 ' UART fractional divider SUB(R/W)
#define SYSCON_UARTFRGMULT     *&H400480F4 ' UART fractional divider ADD(R/W)
#define SYSCON_EXTTRACECMD     *&H400480FC ' External trace buffer command register
#define SYSCON_PIOPORCAP0      *&H40048100 ' POR captured PIO status 0 (R/ )
#define SYSCON_IOCONCLKDIV0    *&H40048134 ' Peripheral clock x to the IOCON block for programmable glitch filter
#define SYSCON_IOCONCLKDIV1    *&H40048138 ' 
#define SYSCON_IOCONCLKDIV2    *&H4004813C ' 
#define SYSCON_IOCONCLKDIV3    *&H40048140 ' 
#define SYSCON_IOCONCLKDIV4    *&H40048144 ' 
#define SYSCON_IOCONCLKDIV5    *&H40048148 ' 
#define SYSCON_IOCONCLKDIV6    *&H4004814C ' 
#define SYSCON_BODCTRL         *&H40048150 ' BOD control (R/W)
#define SYSCON_SYSTCKCAL       *&H40048154 ' System tick counter calibration (R/W)
#define SYSCON_IRQLATENCY      *&H40048170 ' IRQ delay
#define SYSCON_NMISRC          *&H40048174 ' NMI Source Control
#define SYSCON_PINTSEL0        *&H40048178 ' GPIO Pin Interrupt Select register 0
#define SYSCON_PINTSEL1        *&H4004817C ' GPIO Pin Interrupt Select register 1
#define SYSCON_PINTSEL2        *&H40048180 ' GPIO Pin Interrupt Select register 2
#define SYSCON_PINTSEL3        *&H40048184 ' GPIO Pin Interrupt Select register 3
#define SYSCON_PINTSEL4        *&H40048188 ' GPIO Pin Interrupt Select register 4
#define SYSCON_PINTSEL5        *&H4004818C ' GPIO Pin Interrupt Select register 5
#define SYSCON_PINTSEL6        *&H40048190 ' GPIO Pin Interrupt Select register 6
#define SYSCON_PINTSEL7        *&H40048194 ' GPIO Pin Interrupt Select register 7
#define SYSCON_STARTERP0       *&H40048204 ' Start logic signal enable Register 0 (R/W)
#define SYSCON_STARTERP1       *&H40048214 ' Start logic signal enable Register 0 (R/W)
#define SYSCON_PDSLEEPCFG      *&H40048230 ' Power-down states in Deep-sleep mode (R/W)
#define SYSCON_PDAWAKECFG      *&H40048234 ' Power-down states after wake-up (R/W)
#define SYSCON_PDRUNCFG        *&H40048238 ' Power-down configuration Register (R/W)
#define SYSCON_DEVICE_ID       *&H400483F4 ' Device ID (R/ )

'------------- Pin Connect Block (IOCON) --------------------------------
#define IOCON_PIO0_17  *&H40044000 ' pin PIO0_17
#define IOCON_PIO0_13  *&H40044004 ' pin PIO0_13
#define IOCON_PIO0_12  *&H40044008 ' pin PIO0_12
#define IOCON_PIO0_5   *&H4004400C ' pin PIO0_5
#define IOCON_PIO0_4   *&H40044010 ' pin PIO0_4
#define IOCON_PIO0_3   *&H40044014 ' pin PIO0_3
#define IOCON_PIO0_2   *&H40044018 ' pin PIO0_2
#define IOCON_PIO0_11  *&H4004401C ' pin PIO0_11
#define IOCON_PIO0_10  *&H40044020 ' pin PIO0_10
#define IOCON_PIO0_16  *&H40044024 ' pin PIO0_16
#define IOCON_PIO0_15  *&H40044028 ' pin PIO0_15
#define IOCON_PIO0_1   *&H4004402C ' pin PIO0_1
#define IOCON_PIO0_9   *&H40044034 ' pin PIO0_9
#define IOCON_PIO0_8   *&H40044038 ' pin PIO0_8
#define IOCON_PIO0_7   *&H4004403C ' pin PIO0_7
#define IOCON_PIO0_6   *&H40044040 ' pin PIO0_6
#define IOCON_PIO0_0   *&H40044044 ' pin PIO0_0
#define IOCON_PIO0_14  *&H40044048 ' pin PIO0_14

'------------- Flash Control Block (FLASHCTRL) --------------------------------
#define FLASHCTRL_LASHCFG  *&H40040010 ' Flash configuration register
#define FLASHCTRL_MSSTART  *&H40040020 ' Signature start address register
#define FLASHCTRL_MSSTOP   *&H40040024 ' Signature stop-address register
#define FLASHCTRL_MSW0	   *&H4004002C ' Signature Generator

'------------- Power Management Unit (PMU) --------------------------
#define PMU_PCON     *&H40020000 ' Power control Register (R/W)
#define PMU_GPREG0   *&H40020004 ' General purpose Register 0 (R/W)
#define PMU_GPREG1   *&H40020008 ' General purpose Register 1 (R/W)
#define PMU_GPREG2   *&H4002000C ' General purpose Register 2 (R/W)
#define PMU_GPREG3   *&H40020010 ' General purpose Register 3 (R/W)
#define PMU_DPDCTRL  *&H40020014 ' Deep power-down control register (R/W)

'------------- Switch Matrix Port --------------------------
#define SWM_PINASSIGN0  *&H4000C000
#define SWM_PINASSIGN1  *&H4000C004
#define SWM_PINASSIGN2  *&H4000C008
#define SWM_PINASSIGN3  *&H4000C00C
#define SWM_PINASSIGN4  *&H4000C010
#define SWM_PINASSIGN5  *&H4000C014
#define SWM_PINASSIGN6  *&H4000C018
#define SWM_PINASSIGN7  *&H4000C01C
#define SWM_PINASSIGN8  *&H4000C020
#define SWM_PINENABLE0  *&H4000C1C0

'------------- GPIO Port --------------------------
#define GPIO_B00    *&HA0000000 ' Byte pin registers
#define GPIO_B01    *&HA0000001
#define GPIO_B02    *&HA0000002
#define GPIO_B03    *&HA0000003
#define GPIO_B04    *&HA0000004
#define GPIO_B05    *&HA0000005
#define GPIO_B06    *&HA0000006
#define GPIO_B07    *&HA0000007
#define GPIO_B08    *&HA0000008
#define GPIO_B09    *&HA0000009
#define GPIO_B010   *&HA000000A
#define GPIO_B011   *&HA000000B
#define GPIO_B012   *&HA000000C
#define GPIO_B013   *&HA000000D
#define GPIO_B014   *&HA000000E
#define GPIO_B015   *&HA000000F
#define GPIO_B016   *&HA0000010
#define GPIO_B017   *&HA0000011
#define GPIO_W00    *&HA0001000 ' Word pin registers
#define GPIO_W01    *&HA0001004
#define GPIO_W02    *&HA0001008
#define GPIO_W03    *&HA000100C
#define GPIO_W04    *&HA0001010
#define GPIO_W05    *&HA0001014
#define GPIO_W06    *&HA0001018
#define GPIO_W07    *&HA000101C
#define GPIO_W08    *&HA0001020
#define GPIO_W09    *&HA0001024
#define GPIO_W010   *&HA0001028
#define GPIO_W011   *&HA000102C
#define GPIO_W012   *&HA0001030
#define GPIO_W013   *&HA0001034
#define GPIO_W014   *&HA0001038
#define GPIO_W015   *&HA000103C
#define GPIO_W016   *&HA0001040
#define GPIO_W017   *&HA0001044
#define GPIO_DIR0   *&HA0002000
#define GPIO_MASK0  *&HA0002080
#define GPIO_PIN0   *&HA0002100
#define GPIO_MPIN0  *&HA0002180
#define GPIO_SET0   *&HA0002200
#define GPIO_CLR0   *&HA0002280
#define GPIO_NOT0   *&HA0002300


#define FIO0PIN		GPIO_PIN0		' consistent names with other LPC devices
#define FIO0DIR		GPIO_DIR0
#define FIO0SET		GPIO_SET0
#define FIO0CLR		GPIO_CLR0

'------------- Pin Interrupt Port --------------------------
#define PIN_INT_ISEL    *&HA0004000' Pin Interrupt Mode register
#define PIN_INT_IENR    *&HA0004004' Pin Interrupt Enable (Rising) register
#define PIN_INT_SIENR   *&HA0004008' Set Pin Interrupt Enable (Rising) register
#define PIN_INT_CIENR   *&HA000400C' Clear Pin Interrupt Enable (Rising) register
#define PIN_INT_IENF    *&HA0004010' Pin Interrupt Enable Falling Edge / Active Level register
#define PIN_INT_SIENF   *&HA0004014' Set Pin Interrupt Enable Falling Edge / Active Level register
#define PIN_INT_CIENF   *&HA0004018' Clear Pin Interrupt Enable Falling Edge / Active Level address
#define PIN_INT_RISE    *&HA000401C' Pin Interrupt Rising Edge register
#define PIN_INT_FALL    *&HA0004020' Pin Interrupt Falling Edge register
#define PIN_INT_IST     *&HA0004024' Pin Interrupt Status register
#define PIN_INT_PMCTRL  *&HA0004028' GPIO pattern match interrupt control register
#define PIN_INT_PMSRC   *&HA000402C' GPIO pattern match interrupt bit-slice source register
#define PIN_INT_PMCFG   *&HA0004030' GPIO pattern match interrupt bit slice configuration register

'------------- CRC Engine (CRC) -----------------------------------------
#define CRC_MODE		   *&H50000000
#define CRC_SEED		   *&H50000004
#define CRC_SUM			   *&H50000008
#define CRC_WR_DATA_DWORD  *&H50000008
#define CRC_WR_DATA_WORD   *&H50000008
#define CRC_WR_DATA_BYTE   *&H50000008

'------------- Comparator (CMP) --------------------------------------------------
#define CMP_CTRL  *&H40024000 ' Comparator control register
#define CMP_LAD   *&H40024004 ' Voltage ladder register

'------------- Wakeup Timer (WKT) --------------------------------------------------
#define WKT_CTRL   *&H40008000 ' Alarm/Wakeup Timer Control register
#define WKT_COUNT  *&H4000800C ' Alarm/Wakeup TImer counter register

'------------- Multi-Rate Timer (MRT) --------------------------------------------------
#define MRT_Channel0_INTVAL      *&H40004000
#define MRT_Channel0_TIMER       *&H40004010
#define MRT_Channel0_CTRL        *&H40004008
#define MRT_Channel0_STAT        *&H4000400C
#define MRT_Channel1_INTVAL      *&H40004010
#define MRT_Channel1_TIMER       *&H40004020
#define MRT_Channel1_CTRL        *&H40004018
#define MRT_Channel1_STAT        *&H4000401C
#define MRT_Channel2_INTVAL      *&H40004020
#define MRT_Channel2_TIMER       *&H40004030
#define MRT_Channel2_CTRL        *&H40004028
#define MRT_Channel2_STAT        *&H4000402C
#define MRT_Channel3_INTVAL      *&H40004030
#define MRT_Channel3_TIMER       *&H40004040
#define MRT_Channel3_CTRL        *&H40004038
#define MRT_Channel3_STAT        *&H4000403C
#define MRT_IDLE_CH 	   *&H40004044
#define MRT_IRQ_FLAG 	   *&H40004048

'------------- Universal Asynchronous Receiver Transmitter 0 (USART0) -----------
#define USART0_CFG			 *&H40064000
#define USART0_CTRL		 *&H40064004
#define USART0_STAT		 *&H40064008
#define USART0_INTENSET	 *&H4006400C
#define USART0_INTENCLR	 *&H40064010
#define USART0_RXDATA		 *&H40064014
#define USART0_RXDATA_STAT	 *&H40064018
#define USART0_TXDATA		 *&H4006401C
#define USART0_BRG			 *&H40064020
#define USART0_INTSTAT		 *&H40064024

'------------- Universal Asynchronous Receiver Transmitter 1 (USART1) -----------
#define USART1_CFG			 *&H40068000
#define USART1_CTRL		 *&H40068004
#define USART1_STAT		 *&H40068008
#define USART1_INTENSET	 *&H4006800C
#define USART1_INTENCLR	 *&H40068010
#define USART1_RXDATA		 *&H40068014
#define USART1_RXDATA_STAT	 *&H40068018
#define USART1_TXDATA		 *&H4006801C
#define USART1_BRG			 *&H40068020
#define USART1_INTSTAT		 *&H40068024

'------------- Universal Asynchronous Receiver Transmitter 2 (USART2) -----------
#define USART2_CFG			 *&H4006C000
#define USART2_CTRL		 *&H4006C004
#define USART2_STAT		 *&H4006C008
#define USART2_INTENSET	 *&H4006C00C
#define USART2_INTENCLR	 *&H4006C010
#define USART2_RXDATA		 *&H4006C014
#define USART2_RXDATA_STAT	 *&H4006C018
#define USART2_TXDATA		 *&H4006C01C
#define USART2_BRG			 *&H4006C020
#define USART2_INTSTAT		 *&H4006C024

'------------- Synchronous Serial Interface Controller 0 (SPI0) -----------------------
#define SPI0_CFG	   	   *&H40058000
#define SPI0_DLY		   *&H40058004
#define SPI0_STAT	   *&H40058008
#define SPI0_INTENSET   *&H4005800C
#define SPI0_INTENCLR   *&H40058010
#define SPI0_RXDAT	   *&H40058014
#define SPI0_TXDATCTL   *&H40058018
#define SPI0_TXDAT	   *&H4005801C
#define SPI0_TXCTRL	   *&H40058020
#define SPI0_DIV		   *&H40058024
#define SPI0_INTSTAT	   *&H40058028

'------------- Synchronous Serial Interface Controller 1 (SPI1) -----------------------
#define SPI1_CFG	   	   *&H4005C000
#define SPI1_DLY		   *&H4005C004
#define SPI1_STAT	   *&H4005C008
#define SPI1_INTENSET   *&H4005C00C
#define SPI1_INTENCLR   *&H4005C010
#define SPI1_RXDAT	   *&H4005C014
#define SPI1_TXDATCTL   *&H4005C018
#define SPI1_TXDAT	   *&H4005C01C
#define SPI1_TXCTRL	   *&H4005C020
#define SPI1_DIV		   *&H4005C024
#define SPI1_INTSTAT	   *&H4005C028

'------------- Inter-Integrated Circuit (I2C) -------------------------------
#define I2C_CFG	  	  *&H40050000
#define I2C_STAT	  *&H40050004
#define I2C_INTENSET  *&H40050008
#define I2C_INTENCLR  *&H4005000C
#define I2C_TIMEOUT   *&H40050010
#define I2C_DIV		  *&H40050014
#define I2C_INTSTAT	  *&H40050018
#define I2C_MSTCTL	  *&H40050020
#define I2C_MSTTIME	  *&H40050024
#define I2C_MSTDAT	  *&H40050028
#define I2C_SLVCTL	  *&H40050040
#define I2C_SLVDAT	  *&H40050044
#define I2C_SLVADR0	  *&H40050048
#define I2C_SLVADR1	  *&H4005004C
#define I2C_SLVADR2   *&H40050050
#define I2C_SLVADR3	  *&H40050054
#define I2C_SLVQUAL0  *&H40050058
#define I2C_MONRXDAT  *&H40050080

'------------- Watchdog Timer (WWDT) -----------------------------------------
'original
'#define WWDT_MOD      *&H40000000' mode register (R/W)
'#define WWDT_TC       *&H40000004' timer constant register (R/W)
'#define WWDT_FEED     *&H40000008' feed sequence register (W)
'#define WWDT_TV       *&H4000000C' timer value register (R)
'#define WWDT_WARNINT  *&H40000014' timer warning int. register (R/W)
'#define WWDT_WINDOW   *&H40000018' timer window value register (R/W)

'------------- Watchdog Timer (WWDT) -----------------------------------------
'for testing purposes
#define WD_WDT_MOD      *&H40000000 ' mode register (R/W)
#define WD_WDT_TC       *&H40000004 ' timer constant register (R/W)
#define WD_WDT_FEED     *&H40000008 ' feed sequence register (W)
#define WD_WDT_TV       *&H4000000C ' timer value register (R)
#define WD_WDT_WARNINT  *&H40000014 ' timer warning int. register (R/W)
#define WD_WDT_WINDOW   *&H40000018 ' timer window value register (R/W)


'------------- State Configurable Timer (SCT) --------------------------------------------------
#define SCT_CONFIG        *&H50004000 ' 0x000 Configuration Register
#define SCT_CTRL_U        *&H50004004 ' 0x004 Control Register
#define SCT_CTRL_L        *&H50004004 ' 0x004 low control register
#define SCT_CTRL_H        *&H50004006 ' 0x006 high control register
#define SCT_LIMIT_L       *&H50004008 ' 0x008 limit register for counter L
#define SCT_LIMIT_H       *&H5000400A ' 0x00A limit register for counter H
#define SCT_HALT_L        *&H5000400C ' 0x00C halt register for counter L
#define SCT_HALT_H        *&H5000400E ' 0x00E halt register for counter H
#define SCT_STOP_L        *&H50004010 ' 0x010 stop register for counter L
#define SCT_STOP_H        *&H50004012 ' 0x012 stop register for counter H
#define SCT_START_L       *&H50004014 ' 0x014 start register for counter L
#define SCT_START_H       *&H50004016 ' 0x016 start register for counter H
#define SCT_COUNT_U       *&H50004040 ' 0x040 counter register
#define SCT_COUNT_L       *&H50004040 ' 0x040 counter register for counter L
#define SCT_COUNT_H       *&H50004042 ' 0x042 counter register for counter H
#define SCT_STATE_L       *&H50004044 ' 0x044 state register for counter L
#define SCT_STATE_H       *&H50004046 ' 0x046 state register for counter H
#define SCT_INPUT         *&H50004048 ' 0x048 input register
#define SCT_REGMODE_L     *&H5000404C ' 0x04C match - capture registers mode register L
#define SCT_REGMODE_H     *&H5000404E ' 0x04E match - capture registers mode register H
#define SCT_OUTPUT        *&H50004050 ' 0x050 output register
#define SCT_OUTPUTDIRCTRL *&H50004054 ' 0x054 Output counter direction Control Register
#define SCT_RES           *&H50004058 ' 0x058 conflict resolution register
#define SCT_EVEN          *&H500040F0 ' 0x0F0 event enable register
#define SCT_EVFLAG        *&H500040F4 ' 0x0F4 event flag register
#define SCT_CONEN         *&H500040F8 ' 0x0F8 conflict enable register
#define SCT_CONFLAG       *&H500040FC ' 0x0FC conflict flag register
#define SCT_MATCH0_U     *&H50004100 ' SCTMATCH[0].U  Unified 32-bit register
#define SCT_MATCH0_L     *&H50004100 ' SCTMATCH[0].L  Access to L value
#define SCT_MATCH0_H     *&H50004102 ' SCTMATCH[0].H  Access to H value
#define SCT_MATCH1_U 	 *&H50004104
#define SCT_MATCH1_L 	 *&H50004104
#define SCT_MATCH1_H 	 *&H50004106
#define SCT_MATCH2_U 	 *&H50004108
#define SCT_MATCH2_L 	 *&H50004108
#define SCT_MATCH2_H 	 *&H5000410A
#define SCT_MATCH3_U 	 *&H5000410C
#define SCT_MATCH3_L 	 *&H5000410C
#define SCT_MATCH3_H 	 *&H5000410E
#define SCT_MATCH4_U 	 *&H50004110
#define SCT_MATCH4_L 	 *&H50004110
#define SCT_MATCH4_H 	 *&H50004112
#define SCT_CAP0_U       *&H50004100 ' SCTCAP[0].U  Unified 32-bit register
#define SCT_CAP0_L       *&H50004100 ' SCTCAP[0].L  Access to L value
#define SCT_CAP0_H       *&H50004102 ' SCTCAP[0].H  Access to H value
#define SCT_CAP1_U		 *&H50004104
#define SCT_CAP1_L		 *&H50004104
#define SCT_CAP1_H		 *&H50004106
#define SCT_CAP2_U		 *&H50004108
#define SCT_CAP2_L		 *&H50004108
#define SCT_CAP2_H		 *&H5000410A
#define SCT_CAP3_U		 *&H5000410C
#define SCT_CAP3_L		 *&H5000410C
#define SCT_CAP3_H		 *&H5000410E
#define SCT_CAP4_U		 *&H50004110
#define SCT_CAP4_L		 *&H50004110
#define SCT_CAP4_H		 *&H50004112
#define SCT_MATCH_L0     *&H50004180 ' Match Value L counter  
#define SCT_CAP_L0       *&H50004180 ' Capture Value L counter
#define SCT_MATCH_H0     *&H500041C0 ' Match Value H counter  
#define SCT_CAP_H0       *&H500041C0 ' Capture Value H counter
#define SCT_MATCH_L1	 *&H50004182
#define SCT_CAP_L1  	 *&H50004182
#define SCT_MATCH_H1	 *&H500041C2
#define SCT_CAP_H1  	 *&H500041C2
#define SCT_MATCH_L2	 *&H50004184
#define SCT_CAP_L2  	 *&H50004184
#define SCT_MATCH_H2	 *&H500041C4
#define SCT_CAP_H2  	 *&H500041C4
#define SCT_MATCH_L3	 *&H50004186
#define SCT_CAP_L3  	 *&H50004186
#define SCT_MATCH_H3	 *&H500041C6
#define SCT_CAP_H3  	 *&H500041C6
#define SCT_MATCH_L4	 *&H50004188
#define SCT_CAP_L4  	 *&H50004188
#define SCT_MATCH_H4	 *&H500041C8
#define SCT_CAP_H4  	 *&H500041C8
#define SCT_MATCHREL0_U  *&H50004200 ' SCTMATCHREL[0].U  Unified 32-bit register
#define SCT_MATCHREL0_L  *&H50004200 ' SCTMATCHREL[0].L  Access to L value
#define SCT_MATCHREL0_H  *&H50004202 ' SCTMATCHREL[0].H  Access to H value
#define SCT_MATCHREL1_U  *&H50004204
#define SCT_MATCHREL1_L  *&H50004204
#define SCT_MATCHREL1_H  *&H50004206
#define SCT_MATCHREL2_U  *&H50004208
#define SCT_MATCHREL2_L  *&H50004208
#define SCT_MATCHREL2_H  *&H5000420A
#define SCT_MATCHREL3_U  *&H5000420C
#define SCT_MATCHREL3_L  *&H5000420C
#define SCT_MATCHREL3_H  *&H5000420E
#define SCT_MATCHREL4_U  *&H50004210
#define SCT_MATCHREL4_L  *&H50004210
#define SCT_MATCHREL4_H  *&H50004212
#define SCT_CAPCTRL0_U   *&H50004200  ' SCTCAPCTRL[0].U  Unified 32-bit register
#define SCT_CAPCTRL0_L   *&H50004200  ' SCTCAPCTRL[0].L  Access to L value
#define SCT_CAPCTRL0_H   *&H50004202  ' SCTCAPCTRL[0].H  Access to H value
#define SCT_CAPCTRL1_U	 *&H50004204
#define SCT_CAPCTRL1_L	 *&H50004204
#define SCT_CAPCTRL1_H	 *&H50004206
#define SCT_CAPCTRL2_U	 *&H50004208
#define SCT_CAPCTRL2_L	 *&H50004208
#define SCT_CAPCTRL2_H	 *&H5000420A
#define SCT_CAPCTRL3_U	 *&H5000420C
#define SCT_CAPCTRL3_L	 *&H5000420C
#define SCT_CAPCTRL3_H	 *&H5000420E
#define SCT_CAPCTRL4_U	 *&H50004210
#define SCT_CAPCTRL4_L	 *&H50004210
#define SCT_CAPCTRL4_H	 *&H50004212
#define SCT_MATCHREL_L0  *&H50004280 ' Match Reload Value L counter
#define SCT_CAPCTRL_L0   *&H50004280 ' Capture Control Value L counter
#define SCT_MATCHREL_H0  *&H500042C0 ' Match Reload Value H counter
#define SCT_CAPCTRL_H0   *&H500042C0 ' Capture Control Value H counter
#define SCT_MATCHREL_L1	 *&H50004282
#define SCT_CAPCTRL_L1   *&H50004282
#define SCT_MATCHREL_H1	 *&H500042C2
#define SCT_CAPCTRL_H1   *&H500042C2
#define SCT_MATCHREL_L2	 *&H50004284
#define SCT_CAPCTRL_L2   *&H50004284
#define SCT_MATCHREL_H2	 *&H500042C4
#define SCT_CAPCTRL_H2   *&H500042C4
#define SCT_MATCHREL_L3	 *&H50004286
#define SCT_CAPCTRL_L3   *&H50004286
#define SCT_MATCHREL_H3	 *&H500042C6
#define SCT_CAPCTRL_H3   *&H500042C6
#define SCT_MATCHREL_L4	 *&H50004288
#define SCT_CAPCTRL_L4   *&H50004288
#define SCT_MATCHREL_H4	 *&H500042C8
#define SCT_CAPCTRL_H4   *&H500042C8
#define SCT_EVENT0_STATE *&H50004300 ' Event State Register
#define SCT_EVENT0_CTRL  *&H50004304 ' Event Control Register
#define SCT_EVENT1_STATE *&H50004308
#define SCT_EVENT1_CTRL  *&H5000430C
#define SCT_EVENT2_STATE *&H50004310
#define SCT_EVENT2_CTRL  *&H50004314
#define SCT_EVENT3_STATE *&H50004318
#define SCT_EVENT3_CTRL  *&H5000431C
#define SCT_EVENT4_STATE *&H50004320
#define SCT_EVENT4_CTRL  *&H50004324
#define SCT_EVENT5_STATE *&H50004328
#define SCT_EVENT5_CTRL  *&H5000432C
#define SCT_OUT0_SET	 *&H50004500 ' Output n Set Register
#define SCT_OUT0_CLR	 *&H50004504 ' Output n Clear Register
#define SCT_OUT1_SET     *&H50004508
#define SCT_OUT1_CLR     *&H5000450C
#define SCT_OUT2_SET     *&H50004510
#define SCT_OUT2_CLR     *&H50004514
#define SCT_OUT3_SET     *&H50004518
#define SCT_OUT3_CLR     *&H5000451C
#endif
