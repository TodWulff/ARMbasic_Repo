#ifndef __LPC8xx_H
#define __LPC8xx_H


#define PSV_ISR          *&H10000038 ' 14: The PendSV handler
#define SYSTICK_ISR      *&H1000003C ' 15: The SysTick handler
#define WDT_ISR          *&H10000040 ' 16:  Watchdog Timer Interrupt
#define TIMER0_ISR       *&H10000044 ' 17:  Timer0 Interrupt
#define TIMER1_ISR       *&H10000048 ' 18:  Timer1 Interrupt
#define TIMER2_ISR       *&H1000004C ' 19:  Timer2 Interrupt
#define TIMER3_ISR       *&H10000050 ' 20:  Timer3 Interrupt
#define UART0_ISR        *&H10000054 ' 21:  UART0 Interrupt
#define UART1_ISR        *&H10000058 ' 22:  UART1 Interrupt
#define UART2_ISR        *&H1000005C ' 23:  UART2 Interrupt
#define UART3_ISR        *&H10000060 ' 24:  UART3 Interrupt
#define PWM1_ISR         *&H10000064 ' 25:  PWM1 Interrupt
#define I2C0_ISR         *&H10000068 ' 26:  I2C0 Interrupt
#define I2C1_ISR         *&H1000006C ' 27:  I2C1 Interrupt
#define I2C2_ISR         *&H10000070 ' 28:  I2C2 Interrupt
'Reserved                *&H10000074   29:
#define SSP0_ISR         *&H10000078 ' 30:  SSP0 Interrupt
#define SSP1_ISR         *&H1000007C ' 31:  SSP1 Interrupt
#define PLL0_ISR         *&H10000080 ' 32:  PLL0 Lock (Main PLL) Interrupt
#define RTC_ISR          *&H10000084 ' 33:  Real Time Clock Interrupt
#define EINT0_ISR        *&H10000088 ' 34:  External Interrupt 0 Interrupt
#define EINT1_ISR        *&H1000008C ' 35:  External Interrupt 1 Interrupt
#define EINT2_ISR        *&H10000090 ' 36:  External Interrupt 2 Interrupt
#define EINT3_ISR        *&H10000094 ' 37:  External Interrupt 3 Interrupt
#define ADC_ISR          *&H10000098 ' 38:  A/D Converter Interrupt
#define BOD_ISR          *&H1000009C ' 39:  Brown-Out Detect Interrupt
#define USB_ISR          *&H100000A0 ' 40:  USB Interrupt
#define CAN_ISR          *&H100000A4 ' 41:  CAN Interrupt
#define DMA_ISR          *&H100000A8 ' 42:  General Purpose DMA Interrupt
#define I2S_ISR          *&H100000AC ' 43:  I2S Interrupt
#define ENET_ISR         *&H100000B0 ' 44:  Ethernet Interrupt
#define MCI_ISR          *&H100000B4 ' 45:  SD/MMC card I/F Interrupt
#define MCPWM_ISR        *&H100000B8 ' 46:  Motor Control PWM Interrupt
#define QEI_ISR          *&H100000BC ' 47:  Quadrature Encoder Interface Interrupt
#define PLL1_ISR         *&H100000C0 ' 48:  PLL1 Lock (USB PLL) Interrupt
#define USBActivity_ISR  *&H100000C4 ' 49:  USB Activity interrupt
#define CANActivity_ISR  *&H100000C8 ' 50:  CAN Activity interrupt
#define UART4_ISR        *&H100000CC ' 51:  UART4 Interrupt
#define SSP2_ISR         *&H100000D0 ' 52:  SSP2 Interrupt
#define LCD_ISR          *&H100000D4 ' 53:  LCD Interrupt
#define GPIO_ISR         *&H100000D8 ' 54:  GPIO Interrupt
#define PWM0_ISR         *&H100000DC ' 55:  PWM0
#define EEPROM_ISR       *&H100000E0 ' 56:  EEPROM
#define CMP0_ISR         *&H100000E4 ' 57:  CMP0
#define CMP1_ISR         *&H100000E8 ' 58:  CMP1


' Nested Vectored Interrupt Controller (NVIC).
#define NVIC_ISER0  *&HE000E100 ' Interrupt Set Enable Registers
#define NVIC_ISER1  *&HE000E104
#define NVIC_ICER0  *&HE000E180 ' Interrupt Clear Enable Registers
#define NVIC_ICER1  *&HE000E184
#define NVIC_ISPR0  *&HE000E200 ' Interrupt Set Pending Registers
#define NVIC_ISPR1  *&HE000E204
#define NVIC_ICPR0  *&HE000E280 ' Interrupt Clear Pending Registers
#define NVIC_ICPR1  *&HE000E284
#define NVIC_IABR0  *&HE000E300 ' Interrupt Active bit Registers
#define NVIC_IABR1  *&HE000E304
#define NVIC_IP0    *&HE000E400 ' Interrupt Priority Registers
#define NVIC_IP1    *&HE000E404
#define NVIC_IP2    *&HE000E408
#define NVIC_IP3    *&HE000E40C
#define NVIC_IP4    *&HE000E410
#define NVIC_IP5    *&HE000E414
#define NVIC_IP6    *&HE000E418
#define NVIC_IP7    *&HE000E41C
#define NVIC_IP8    *&HE000E420
#define NVIC_IP9    *&HE000E424
#define NVIC_STIR   *&HE000EF00 ' Software Trigger Interrupt Register

' aka  The name convention below is from previous LPC2000 family MCUs
#define VICIntEnable0   *&HE000E100 ' Interrupt Set Enable Registers
#define VICIntEnable1   *&HE000E104
#define VICIntEnClear0  *&HE000E180 ' Interrupt Clear Enable Registers
#define VICIntEnClear1  *&HE000E184
#define VICIntSetPend0  *&HE000E200 ' Interrupt Set Pending Registers
#define VICIntSetPend1  *&HE000E204
#define VICIntClrPend0  *&HE000E280 ' Interrupt Clear Pending Registers
#define VICIntClrPend1  *&HE000E284
#define VICIntActive0   *&HE000E300 ' Interrupt Active bit Registers
#define VICIntActive1   *&HE000E304
#define VICVectCntl0    *&HE000E400 ' Interrupt Priority Registers
#define VICVectCntl1    *&HE000E404
#define VICVectCntl2    *&HE000E408
#define VICVectCntl3    *&HE000E40C
#define VICVectCntl4    *&HE000E410
#define VICVectCntl5    *&HE000E414
#define VICVectCntl6    *&HE000E418
#define VICVectCntl7    *&HE000E41C
#define VICVectCntl8    *&HE000E420
#define VICVectCntl9    *&HE000E424
#define VICSTIR         *&HE000EF00 ' Software Trigger Interrupt Register

#define VICIntEnable   *&HE000E100 ' Interrupt Set Enable Registers
#define VICIntEnClear  *&HE000E180 ' Interrupt Clear Enable Registers
#define VICIntSetPend  *&HE000E200 ' Interrupt Set Pending Registers
#define VICIntClrPend  *&HE000E280 ' Interrupt Clear Pending Registers
#define VICIntActive   *&HE000E300 ' Interrupt Active bit Registers


' System Control Block (SCB).
#define SCB_CPUID  *&HE000ED00 ' CPUID Base Register
#define SCB_ICSR   *&HE000ED04 ' Interrupt Control and State Register
#define SCB_VTOR   *&HE000ED08 ' Vector Table Offset Register
#define SCB_AIRCR  *&HE000ED0C ' Application Interrupt and Reset Control Register
#define SCB_SCR    *&HE000ED10 ' System Control Register
#define SCB_CCR    *&HE000ED14 ' Configuration Control Register 
#define SCB_SHP0   *&HE000ED18 ' System Handlers Priority Registers
#define SCB_SHP1   *&HE000ED1C  
#define SCB_SHP2   *&HE000ED20  
#define SCB_SHCSR  *&HE000ED24 ' System Handler Control and State Register
#define SCB_CFSR   *&HE000ED28 ' Configurable Fault Status Register
#define SCB_HFSR   *&HE000ED2C ' HardFault Status Register 
#define SCB_DFSR   *&HE000ED30 ' Debug Fault Status Register 
#define SCB_MMFAR  *&HE000ED34 ' MemManage Fault Address Register 
#define SCB_BFAR   *&HE000ED38 ' BusFault Address Register 
#define SCB_AFSR   *&HE000ED3C ' Auxiliary Fault Status Register


' System Timer (SysTick).
#define ST_CTRL  *&HE000E010 ' SysTick Control and Status Register
#define ST_RELOAD  *&HE000E014 ' SysTick Reload Value Register
#define ST_VAL   *&HE000E018 ' SysTick Current Value Register
#define ST_CALIB *&HE000E01C ' SysTick Calibration Register


'------------- General Purpose Direct Memory Access (GPDMA) -----------------
' Common Registers
#define DMA_IntStat       *&H20080000
#define DMA_IntTCStat     *&H20080004
#define DMA_IntTCClear    *&H20080008
#define DMA_IntErrStat    *&H2008000C
#define DMA_IntErrClr     *&H20080010
#define DMA_RawIntTCStat  *&H20080014
#define DMA_RawIntErrStat *&H20080018
#define DMA_EnbldChns     *&H2008001C
#define DMA_SoftBReq      *&H20080020
#define DMA_SoftSReq      *&H20080024
#define DMA_SoftLBReq     *&H20080028
#define DMA_SoftLSReq     *&H2008002C
#define DMA_Config        *&H20080030
#define DMA_Sync          *&H20080034

' Channel Registers
#define DMA0_CSrcAddr   *&H20080100
#define DMA0_CDestAddr  *&H20080104
#define DMA0_CLLI       *&H20080108
#define DMA0_CControl   *&H2008010C
#define DMA0_CConfig    *&H20080110

#define DMA1_CSrcAddr   *&H20080120
#define DMA1_CDestAddr  *&H20080124
#define DMA1_CLLI       *&H20080128
#define DMA1_CControl   *&H2008012C
#define DMA1_CConfig    *&H20080130

#define DMA2_CSrcAddr   *&H20080140
#define DMA2_CDestAddr  *&H20080144
#define DMA2_CLLI       *&H20080148
#define DMA2_CControl   *&H2008014C
#define DMA2_CConfig    *&H20080150

#define DMA3_CSrcAddr   *&H20080160
#define DMA3_CDestAddr  *&H20080164
#define DMA3_CLLI       *&H20080168
#define DMA3_CControl   *&H2008016C
#define DMA3_CConfig    *&H20080170

#define DMA4_CSrcAddr   *&H20080180
#define DMA4_CDestAddr  *&H20080184
#define DMA4_CLLI       *&H20080188
#define DMA4_CControl   *&H2008018C
#define DMA4_CConfig    *&H20080190

#define DMA5_CSrcAddr   *&H200801A0
#define DMA5_CDestAddr  *&H200801A4
#define DMA5_CLLI       *&H200801A8
#define DMA5_CControl   *&H200801AC
#define DMA5_CConfig    *&H200801B0

#define DMA6_CSrcAddr   *&H200801C0
#define DMA6_CDestAddr  *&H200801C4
#define DMA6_CLLI       *&H200801C8
#define DMA6_CControl   *&H200801CC
#define DMA6_CConfig    *&H200801D0

#define DMA7_CSrcAddr   *&H200801E0
#define DMA7_CDestAddr  *&H200801E4
#define DMA7_CLLI       *&H200801E8
#define DMA7_CControl   *&H200801EC
#define DMA7_CConfig    *&H200801F0


'------------- System Control (SC) ------------------------------------------
#define SC_FLASHCFG      *&H400FC000 ' Flash Accelerator Configuration Register
#define SC_PLL0CON       *&H400FC080 ' PLL0 Control Register
#define SC_PLL0CFG       *&H400FC084 ' PLL0 Configuration Register
#define SC_PLL0STAT      *&H400FC088 ' PLL0 Status Register
#define SC_PLL0FEED      *&H400FC08C ' PLL0 Feed Register
#define SC_PLL1CON       *&H400FC0A0 ' PLL1 Control Register
#define SC_PLL1CFG       *&H400FC0A4 ' PLL1 Configuration Register
#define SC_PLL1STAT      *&H400FC0A8 ' PLL1 Status Register
#define SC_PLL1FEED      *&H400FC0AC ' PLL1 Feed Register
#define SC_PCON          *&H400FC0C0 ' Power Control Register
#define SC_PCONP         *&H400FC0C4 ' Power Control for Peripherals Register
#define SC_PCONP1        *&H400FC0C8 ' Power Control for Peripherals Register
#define SC_EMCCLKSEL     *&H400FC100 ' External Memory Controller Clock Selection Register
#define SC_CCLKSEL       *&H400FC104 ' CPU Clock Selection Register
#define SC_USBCLKSEL     *&H400FC108 ' USB Clock Selection Register
#define SC_CLKSRCSEL     *&H400FC10C ' Clock Source Select Register
#define SC_CANSLEEPCLR   *&H400FC110 ' CAN Sleep Clear Register
#define SC_CANWAKEFLAGS  *&H400FC114 ' CAN Wake-up Flags Register
#define SC_EXTINT        *&H400FC140 ' External Interrupt Flag Register
#define SC_EXTMODE       *&H400FC148 ' External Interrupt Mode Register
#define SC_EXTPOLAR      *&H400FC14C ' External Interrupt Polarity Register
#define SC_RSID          *&H400FC180 ' Reset Source Identification Register
#define SC_SCS           *&H400FC1A0 ' System Controls and Status Register
#define SC_IRCTRIM       *&H400FC1A4 ' Clock Dividers
#define SC_PCLKSEL       *&H400FC1A8 ' Peripheral Clock Selection Register
#define SC_PBOOST        *&H400FC1B0 ' Power Boost control register    
#define SC_SPIFICLKSEL   *&H400FC1B4
#define SC_LCD_CFG       *&H400FC1B8 ' LCD Configuration and clocking control Register
#define SC_USBIntSt      *&H400FC1C0 ' USB Interrupt Status Register
#define SC_DMAREQSEL     *&H400FC1C4 ' DMA Request Select Register
#define SC_CLKOUTCFG     *&H400FC1C8 ' Clock Output Configuration Register
#define SC_RSTCON0       *&H400FC1CC ' RESET Control0 Register
#define SC_RSTCON1       *&H400FC1D0 ' RESET Control1 Register
#define SC_EMCDLYCTL     *&H400FC1DC ' SDRAM programmable delays
#define SC_EMCCAL        *&H400FC1E0 ' Calibration of programmable delays

' aka, SC used to be SCB in previous LPC2000 family MCUs
#define SCB_FLASHCFG      *&H400FC000 ' Flash Accelerator Configuration Register
#define SCB_PLL0CON       *&H400FC080 ' PLL0 Control Register
#define SCB_PLL0CFG       *&H400FC084 ' PLL0 Configuration Register
#define SCB_PLL0STAT      *&H400FC088 ' PLL0 Status Register
#define SCB_PLL0FEED      *&H400FC08C ' PLL0 Feed Register
#define SCB_PLL1CON       *&H400FC0A0 ' PLL1 Control Register
#define SCB_PLL1CFG       *&H400FC0A4 ' PLL1 Configuration Register
#define SCB_PLL1STAT      *&H400FC0A8 ' PLL1 Status Register
#define SCB_PLL1FEED      *&H400FC0AC ' PLL1 Feed Register
#define SCB_PCON          *&H400FC0C0 ' Power Control Register
#define SCB_PCONP         *&H400FC0C4 ' Power Control for Peripherals Register
#define SCB_PCONP1        *&H400FC0C8 ' Power Control for Peripherals Register
#define SCB_EMCCLKSEL     *&H400FC100 ' External Memory Controller Clock Selection Register
#define SCB_CCLKSEL       *&H400FC104 ' CPU Clock Selection Register
#define SCB_USBCLKSEL     *&H400FC108 ' USB Clock Selection Register
#define SCB_CLKSRCSEL     *&H400FC10C ' Clock Source Select Register
#define SCB_CANSLEEPCLR   *&H400FC110 ' CAN Sleep Clear Register
#define SCB_CANWAKEFLAGS  *&H400FC114 ' CAN Wake-up Flags Register
#define SCB_EXTINT        *&H400FC140 ' External Interrupt Flag Register
#define SCB_EXTMODE       *&H400FC148 ' External Interrupt Mode Register
#define SCB_EXTPOLAR      *&H400FC14C ' External Interrupt Polarity Register
#define SCB_RSID          *&H400FC180 ' Reset Source Identification Register
#define SCB_SCS           *&H400FC1A0 ' System Controls and Status Register
#define SCB_IRCTRIM       *&H400FC1A4 ' Clock Dividers
#define SCB_PCLKSEL       *&H400FC1A8 ' Peripheral Clock Selection Register
#define SCB_PBOOST        *&H400FC1B0 ' Power Boost control register    
#define SCB_SPIFICLKSEL   *&H400FC1B4
#define SCB_LCD_CFG       *&H400FC1B8 ' LCD Configuration and clocking control Register
#define SCB_USBIntSt      *&H400FC1C0 ' USB Interrupt Status Register
#define SCB_DMAREQSEL     *&H400FC1C4 ' DMA Request Select Register
#define SCB_CLKOUTCFG     *&H400FC1C8 ' Clock Output Configuration Register
#define SCB_RSTCON0       *&H400FC1CC ' RESET Control0 Register
#define SCB_RSTCON1       *&H400FC1D0 ' RESET Control1 Register
#define SCB_EMCDLYCTL     *&H400FC1DC ' SDRAM programmable delays
#define SCB_EMCCAL        *&H400FC1E0 ' Calibration of programmable delays


'------------- General Purpose Input/Output (GPIO) --------------------------
#define GPIO0_DIR           *&H20098000
#define GPIO0_MASK          *&H20098010
#define GPIO0_PIN           *&H20098014
#define GPIO0_SET           *&H20098018
#define GPIO0_CLR           *&H2009801C

#define GPIO1_DIR           *&H20098020
#define GPIO1_MASK          *&H20098030
#define GPIO1_PIN           *&H20098034
#define GPIO1_SET           *&H20098038
#define GPIO1_CLR           *&H2009803C

#define GPIO2_DIR           *&H20098040
#define GPIO2_MASK          *&H20098050
#define GPIO2_PIN           *&H20098054
#define GPIO2_SET           *&H20098058
#define GPIO2_CLR           *&H2009805C

#define GPIO3_DIR           *&H20098060
#define GPIO3_MASK          *&H20098070
#define GPIO3_PIN           *&H20098074
#define GPIO3_SET           *&H20098078
#define GPIO3_CLR           *&H2009807C

#define GPIO4_DIR           *&H20098080
#define GPIO4_MASK          *&H20098090
#define GPIO4_PIN           *&H20098094
#define GPIO4_SET           *&H20098098
#define GPIO4_CLR           *&H2009809C

#define GPIO5_DIR           *&H200980A0
#define GPIO5_MASK          *&H200980B0
#define GPIO5_PIN           *&H200980B4
#define GPIO5_SET           *&H200980B8
#define GPIO5_CLR           *&H200980BC

#define GPIO_INT_STAT   GPIOINT_IntStatus   *&H40028080

#define GPIO0_INT_STAT_R *&H40028084
#define GPIO0_INT_STAT_F *&H40028088
#define GPIO0_INT_CLR    *&H4002808C
#define GPIO0_INT_EN_R   *&H40028090
#define GPIO0_INT_EN_F   *&H40028094

#define GPIO2_INT_STAT_R *&H400280A4
#define GPIO2_INT_STAT_F *&H400280A8
#define GPIO2_INT_CLR    *&H400280AC
#define GPIO2_INT_EN_R   *&H400280B0
#define GPIO2_INT_EN_F   *&H400280B4


'------------- External Memory Controller (EMC) -----------------------------
#define EMC_Control            *&H2009C000
#define EMC_Status             *&H2009C004
#define EMC_Config             *&H2009C008
#define EMC_DynamicControl     *&H2009C020
#define EMC_DynamicRefresh     *&H2009C024
#define EMC_DynamicReadConfig  *&H2009C028
#define EMC_DynamicRP          *&H2009C030
#define EMC_DynamicRAS         *&H2009C034
#define EMC_DynamicSREX        *&H2009C038
#define EMC_DynamicAPR         *&H2009C03C
#define EMC_DynamicDAL         *&H2009C040
#define EMC_DynamicWR          *&H2009C044
#define EMC_DynamicRC          *&H2009C048
#define EMC_DynamicRFC         *&H2009C04C
#define EMC_DynamicXSR         *&H2009C050
#define EMC_DynamicRRD         *&H2009C054
#define EMC_DynamicMRD         *&H2009C058
#define EMC_StaticExtendedWait *&H2009C080
#define EMC_DynamicConfig0     *&H2009C100
#define EMC_DynamicRasCas0     *&H2009C104
#define EMC_DynamicConfig1     *&H2009C120
#define EMC_DynamicRasCas1     *&H2009C124
#define EMC_DynamicConfig2     *&H2009C140
#define EMC_DynamicRasCas2     *&H2009C144
#define EMC_DynamicConfig3     *&H2009C160
#define EMC_DynamicRasCas3     *&H2009C164
#define EMC_StaticConfig0      *&H2009C200
#define EMC_StaticWaitWen0     *&H2009C204
#define EMC_StaticWaitOen0     *&H2009C208
#define EMC_StaticWaitRd0      *&H2009C20C
#define EMC_StaticWaitPage0    *&H2009C210
#define EMC_StaticWaitWr0      *&H2009C214
#define EMC_StaticWaitTurn0    *&H2009C218
#define EMC_StaticConfig1      *&H2009C220
#define EMC_StaticWaitWen1     *&H2009C224
#define EMC_StaticWaitOen1     *&H2009C228
#define EMC_StaticWaitRd1      *&H2009C22C
#define EMC_StaticWaitPage1    *&H2009C230
#define EMC_StaticWaitWr1      *&H2009C234
#define EMC_StaticWaitTurn1    *&H2009C238
#define EMC_StaticConfig2      *&H2009C240
#define EMC_StaticWaitWen2     *&H2009C244
#define EMC_StaticWaitOen2     *&H2009C248
#define EMC_StaticWaitRd2      *&H2009C24C
#define EMC_StaticWaitPage2    *&H2009C250
#define EMC_StaticWaitWr2      *&H2009C254
#define EMC_StaticWaitTurn2    *&H2009C258
#define EMC_StaticConfig3      *&H2009C260
#define EMC_StaticWaitWen3     *&H2009C264
#define EMC_StaticWaitOen3     *&H2009C268
#define EMC_StaticWaitRd3      *&H2009C26C
#define EMC_StaticWaitPage3    *&H2009C270
#define EMC_StaticWaitWr3      *&H2009C274
#define EMC_StaticWaitTurn3    *&H2009C278


'------------- Watchdog Timer (WDT) -----------------------------------------
#define WD_WDMOD   *&H40000000
#define WD_WDTC    *&H40000004
#define WD_WDFEED  *&H40000008
#define WD_WDTV    *&H4000000C
#define WD_WARNINT *&H40000014
#define WD_WINDOW  *&H40000018


'------------- Timer (TIM) --------------------------------------------------
#define T0_IR    *&H40004000 ' Interrupt Register (R/W)
#define T0_TCR   *&H40004004 ' Timer Control Register (R/W)
#define T0_TC    *&H40004008 ' Timer Counter Register (R/W)
#define T0_PR    *&H4000400C ' Prescale Register (R/W)
#define T0_PC    *&H40004010 ' Prescale Counter Register (R/W)
#define T0_MCR   *&H40004014 ' Match Control Register (R/W)
#define T0_MR0   *&H40004018 ' Match Register 0 (R/W)
#define T0_MR1   *&H4000401C ' Match Register 1 (R/W)
#define T0_MR2   *&H40004020 ' Match Register 2 (R/W)
#define T0_MR3   *&H40004024 ' Match Register 3 (R/W)
#define T0_CCR   *&H40004028 ' Capture Control Register (R/W)
#define T0_CR0   *&H4000402C ' Capture Register 0 (R/ )
#define T0_CR1   *&H40004030 ' Capture Register 1 (R/ )
#define T0_EMR   *&H4000403C ' External Match Register (R/W)
#define T0_CTCR  *&H40004070 ' Count Control Register (R/W)

#define T1_IR    *&H40008000 ' Interrupt Register (R/W)
#define T1_TCR   *&H40008004 ' Timer Control Register (R/W)
#define T1_TC    *&H40008008 ' Timer Counter Register (R/W)
#define T1_PR    *&H4000800C ' Prescale Register (R/W)
#define T1_PC    *&H40008010 ' Prescale Counter Register (R/W)
#define T1_MCR   *&H40008014 ' Match Control Register (R/W)
#define T1_MR0   *&H40008018 ' Match Register 0 (R/W)
#define T1_MR1   *&H4000801C ' Match Register 1 (R/W)
#define T1_MR2   *&H40008020 ' Match Register 2 (R/W)
#define T1_MR3   *&H40008024 ' Match Register 3 (R/W)
#define T1_CCR   *&H40008028 ' Capture Control Register (R/W)
#define T1_CR0   *&H4000802C ' Capture Register 0 (R/ )
#define T1_CR1   *&H40008030 ' Capture Register 1 (R/ )
#define T1_EMR   *&H4000803C ' External Match Register (R/W)
#define T1_CTCR  *&H40008070 ' Count Control Register (R/W)

#define T2_IR    *&H40090000 ' Interrupt Register (R/W)
#define T2_TCR   *&H40090004 ' Timer Control Register (R/W)
#define T2_TC    *&H40090008 ' Timer Counter Register (R/W)
#define T2_PR    *&H4009000C ' Prescale Register (R/W)
#define T2_PC    *&H40090010 ' Prescale Counter Register (R/W)
#define T2_MCR   *&H40090014 ' Match Control Register (R/W)
#define T2_MR0   *&H40090018 ' Match Register 0 (R/W)
#define T2_MR1   *&H4009001C ' Match Register 1 (R/W)
#define T2_MR2   *&H40090020 ' Match Register 2 (R/W)
#define T2_MR3   *&H40090024 ' Match Register 3 (R/W)
#define T2_CCR   *&H40090028 ' Capture Control Register (R/W)
#define T2_CR0   *&H4009002C ' Capture Register 0 (R/ )
#define T2_CR1   *&H40090030 ' Capture Register 1 (R/ )
#define T2_EMR   *&H4009003C ' External Match Register (R/W)
#define T2_CTCR  *&H40090070 ' Count Control Register (R/W)

#define T3_IR    *&H40094000 ' Interrupt Register (R/W)
#define T3_TCR   *&H40094004 ' Timer Control Register (R/W)
#define T3_TC    *&H40094008 ' Timer Counter Register (R/W)
#define T3_PR    *&H4009400C ' Prescale Register (R/W)
#define T3_PC    *&H40094010 ' Prescale Counter Register (R/W)
#define T3_MCR   *&H40094014 ' Match Control Register (R/W)
#define T3_MR0   *&H40094018 ' Match Register 0 (R/W)
#define T3_MR1   *&H4009401C ' Match Register 1 (R/W)
#define T3_MR2   *&H40094020 ' Match Register 2 (R/W)
#define T3_MR3   *&H40094024 ' Match Register 3 (R/W)
#define T3_CCR   *&H40094028 ' Capture Control Register (R/W)
#define T3_CR0   *&H4009402C ' Capture Register 0 (R/ )
#define T3_CR1   *&H40094030 ' Capture Register 1 (R/ )
#define T3_EMR   *&H4009403C ' External Match Register (R/W)
#define T3_CTCR  *&H40094070 ' Count Control Register (R/W)


'------------- Pulse-Width Modulation (PWM) ---------------------------------
#define PWM0_IR    *&H40014000 ' Interrupt Register (R/W)
#define PWM0_TCR   *&H40014004 ' Timer Control Register (R/W)
#define PWM0_TC    *&H40014008 ' Timer Counter Register (R/W)
#define PWM0_PR    *&H4001400C ' Prescale Register (R/W)
#define PWM0_PC    *&H40014010 ' Prescale Counter Register (R/W)
#define PWM0_MCR   *&H40014014 ' Match Control Register (R/W)
#define PWM0_MR0   *&H40014018 ' Match Register 0 (R/W)
#define PWM0_MR1   *&H4001401C ' Match Register 1 (R/W)
#define PWM0_MR2   *&H40014020 ' Match Register 2 (R/W)
#define PWM0_MR3   *&H40014024 ' Match Register 3 (R/W)
#define PWM0_CCR   *&H40014028 ' Capture Control Register (R/W)
#define PWM0_CR0   *&H4001402C ' Capture Register 0 (R/ )
#define PWM0_CR1   *&H40014030 ' Capture Register 1 (R/ )
#define PWM0_CR2   *&H40014034 ' Capture Register 2 (R/ )
#define PWM0_CR3   *&H40014038 ' Capture Register 3 (R/ )
#define PWM0_MR4   *&H40014040 ' Match Register 4 (R/W)
#define PWM0_MR5   *&H40014044 ' Match Register 5 (R/W)
#define PWM0_MR6   *&H40014048 ' Match Register 6 (R/W)
#define PWM0_PCR   *&H4001404C ' PWM Control Register (R/W)
#define PWM0_LER   *&H40014050 ' Load Enable Register (R/W)
#define PWM0_CTCR  *&H40014070 ' Counter Control Register (R/W)

#define PWM1_IR    *&H40018000 ' Interrupt Register (R/W)
#define PWM1_TCR   *&H40018004 ' Timer Control Register (R/W)
#define PWM1_TC    *&H40018008 ' Timer Counter Register (R/W)
#define PWM1_PR    *&H4001800C ' Prescale Register (R/W)
#define PWM1_PC    *&H40018010 ' Prescale Counter Register (R/W)
#define PWM1_MCR   *&H40018014 ' Match Control Register (R/W)
#define PWM1_MR0   *&H40018018 ' Match Register 0 (R/W)
#define PWM1_MR1   *&H4001801C ' Match Register 1 (R/W)
#define PWM1_MR2   *&H40018020 ' Match Register 2 (R/W)
#define PWM1_MR3   *&H40018024 ' Match Register 3 (R/W)
#define PWM1_CCR   *&H40018028 ' Capture Control Register (R/W)
#define PWM1_CR0   *&H4001802C ' Capture Register 0 (R/ )
#define PWM1_CR1   *&H40018030 ' Capture Register 1 (R/ )
#define PWM1_CR2   *&H40018034 ' Capture Register 2 (R/ )
#define PWM1_CR3   *&H40018038 ' Capture Register 3 (R/ )
#define PWM1_MR4   *&H40018040 ' Match Register 4 (R/W)
#define PWM1_MR5   *&H40018044 ' Match Register 5 (R/W)
#define PWM1_MR6   *&H40018048 ' Match Register 6 (R/W)
#define PWM1_PCR   *&H4001804C ' PWM Control Register (R/W)
#define PWM1_LER   *&H40018050 ' Load Enable Register (R/W)
#define PWM1_CTCR  *&H40018070 ' Counter Control Register (R/W)


'------------- Universal Asynchronous Receiver Transmitter (UARTx) -----------
' There are three types of UARTs on the chip:
'(1) UART0,UART2, and UART3 are the standard UART.
'(2) UART1 is the standard with modem capability.
'(3) USART(UART4) is the sync/async UART with smart card capability.
'More details can be found on the Users Manual.

#define UART0_RBR        *&H4000C000
#define UART0_THR        *&H4000C000
#define UART0_DLL        *&H4000C000
#define UART0_DLM        *&H4000C004
#define UART0_IER        *&H4000C004
#define UART0_IIR        *&H4000C008
#define UART0_FCR        *&H4000C008
#define UART0_LCR        *&H4000C00C
#define UART0_LSR        *&H4000C014
#define UART0_SCR        *&H4000C01C
#define UART0_ACR        *&H4000C020
#define UART0_ICR        *&H4000C024
#define UART0_FDR        *&H4000C028
#define UART0_TER        *&H4000C030
#define UART0_RS485CTRL  *&H4000C04C
#define UART0_ADRMATCH   *&H4000C050
#define UART0_RS485DLY   *&H4000C054
#define UART0_FIFOLVL    *&H4000C058

#define UART2_RBR        *&H40098000
#define UART2_THR        *&H40098000
#define UART2_DLL        *&H40098000
#define UART2_DLM        *&H40098004
#define UART2_IER        *&H40098004
#define UART2_IIR        *&H40098008
#define UART2_FCR        *&H40098008
#define UART2_LCR        *&H4009800C
#define UART2_LSR        *&H40098014
#define UART2_SCR        *&H4009801C
#define UART2_ACR        *&H40098020
#define UART2_ICR        *&H40098024
#define UART2_FDR        *&H40098028
#define UART2_TER        *&H40098030
#define UART2_RS485CTRL  *&H4009804C
#define UART2_ADRMATCH   *&H40098050
#define UART2_RS485DLY   *&H40098054
#define UART2_FIFOLVL    *&H40098058

#define UART3_RBR        *&H4009C000
#define UART3_THR        *&H4009C000
#define UART3_DLL        *&H4009C000
#define UART3_DLM        *&H4009C004
#define UART3_IER        *&H4009C004
#define UART3_IIR        *&H4009C008
#define UART3_FCR        *&H4009C008
#define UART3_LCR        *&H4009C00C
#define UART3_LSR        *&H4009C014
#define UART3_SCR        *&H4009C01C
#define UART3_ACR        *&H4009C020
#define UART3_ICR        *&H4009C024
#define UART3_FDR        *&H4009C028
#define UART3_TER        *&H4009C030
#define UART3_RS485CTRL  *&H4009C04C
#define UART3_ADRMATCH   *&H4009C050
#define UART3_RS485DLY   *&H4009C054
#define UART3_FIFOLVL    *&H4009C058

#define UART1_RBR        *&H40010000
#define UART1_THR        *&H40010000
#define UART1_DLL        *&H40010000
#define UART1_DLM        *&H40010004
#define UART1_IER        *&H40010004
#define UART1_IIR        *&H40010008
#define UART1_FCR        *&H40010008
#define UART1_LCR        *&H4001000C
#define UART1_LSR        *&H40010014
#define UART1_MSR        *&H40010018
#define UART1_SCR        *&H4001001C
#define UART1_ACR        *&H40010020
#define UART1_FDR        *&H40010028
#define UART1_TER        *&H40010030
#define UART1_RS485CTRL  *&H4001004C
#define UART1_ADRMATCH   *&H40010050
#define UART1_RS485DLY   *&H40010054
#define UART1_FIFOLVL    *&H40010058
#define UART1_MCR        *&H40010010

#define UART4_RBR          *&H400A4000 ' Receiver Buffer  Register (R/ )
#define UART4_THR          *&H400A4000 ' Transmit Holding Register ( /W)
#define UART4_DLL          *&H400A4000 ' Divisor Latch LSB (R/W)
#define UART4_DLM          *&H400A4004 ' Divisor Latch MSB (R/W)
#define UART4_IER          *&H400A4004 ' Interrupt Enable Register (R/W)
#define UART4_IIR          *&H400A4008 ' Interrupt ID Register (R/ )
#define UART4_FCR          *&H400A4008 ' FIFO Control Register ( /W)
#define UART4_LCR          *&H400A400C ' Line Control Register (R/W)
#define UART4_MCR          *&H400A4010 ' Modem control Register (R/W)
#define UART4_LSR          *&H400A4014 ' Line Status Register (R/ )
#define UART4_MSR          *&H400A4018 ' Modem status Register (R/ )
#define UART4_SCR          *&H400A401C ' Scratch Pad Register (R/W)
#define UART4_ACR          *&H400A4020 ' Auto-baud Control Register (R/W)
#define UART4_ICR          *&H400A4024 ' irDA Control Register (R/W)
#define UART4_FDR          *&H400A4028 ' Fractional Divider Register (R/W)
#define UART4_OSR          *&H400A402C ' Over sampling Register (R/W)
#define UART4_POP          *&H400A4030 ' NHP Pop Register (W)
#define UART4_MODE         *&H400A4034 ' NHP Mode selection Register (W)
#define UART4_HDEN         *&H400A4040 ' Half duplex Enable Register (R/W)
#define UART4_SCI_CTRL     *&H400A4048 ' Smart card Interface Control Register (R/W)
#define UART4_RS485CTRL    *&H400A404C ' RS-485/EIA-485 Control Register (R/W)
#define UART4_ADRMATCH     *&H400A4050 ' RS-485/EIA-485 address match Register (R/W)
#define UART4_RS485DLY     *&H400A4054 ' RS-485/EIA-485 direction control delay Register (R/W)
#define UART4_SYNCCTRL     *&H400A4058 ' Synchronous Mode Control Register (R/W )
#define UART4_TER          *&H400A405C ' Transmit Enable Register (R/W)
#define UART4_CFG          *&H400A4FD4 ' Configuration Register (R)
#define UART4_INTCE        *&H400A4FD8 ' Interrupt Clear Enable Register (W)
#define UART4_INTSE        *&H400A4FDC ' Interrupt Set Enable Register (W)
#define UART4_INTS         *&H400A4FE0 ' Interrupt Status Register (R)
#define UART4_INTE         *&H400A4FE4 ' Interrupt Enable Register (R)
#define UART4_INTCS        *&H400A4FE8 ' Interrupt Clear Status Register (W)
#define UART4_INTSS        *&H400A4FEC ' Interrupt Set Status Register (W)
#define UART4_MID          *&H400A4FFC ' Module Identification Register (R)


'------------- Inter-Integrated Circuit (I2C) -------------------------------
#define I2C0_CONSET      *&H4001C000 ' I2C Control Set Register (R/W)
#define I2C0_STAT        *&H4001C004 ' I2C Status Register (R/ )
#define I2C0_DAT         *&H4001C008 ' I2C Data Register (R/W)
#define I2C0_ADR0        *&H4001C00C ' I2C Slave Address Register 0 (R/W)
#define I2C0_SCLH        *&H4001C010 ' SCH Duty Cycle Register High Half Word (R/W)
#define I2C0_SCLL        *&H4001C014 ' SCL Duty Cycle Register Low Half Word (R/W)
#define I2C0_CONCLR      *&H4001C018 ' I2C Control Clear Register ( /W)
#define I2C0_MMCTRL      *&H4001C01C ' Monitor mode control register (R/W)
#define I2C0_ADR1        *&H4001C020 ' I2C Slave Address Register 1 (R/W)
#define I2C0_ADR2        *&H4001C024 ' I2C Slave Address Register 2 (R/W)
#define I2C0_ADR3        *&H4001C028 ' I2C Slave Address Register 3 (R/W)
#define I2C0_DATA_BUFFER *&H4001C02C ' Data buffer register ( /W)
#define I2C0_MASK0       *&H4001C030 ' I2C Slave address mask register 0 (R/W)
#define I2C0_MASK1       *&H4001C034 ' I2C Slave address mask register 1 (R/W)
#define I2C0_MASK2       *&H4001C038 ' I2C Slave address mask register 2 (R/W)
#define I2C0_MASK3       *&H4001C03C ' I2C Slave address mask register 3 (R/W)

#define I2C1_CONSET      *&H4005C000 ' I2C Control Set Register (R/W)
#define I2C1_STAT        *&H4005C004 ' I2C Status Register (R/ )
#define I2C1_DAT         *&H4005C008 ' I2C Data Register (R/W)
#define I2C1_ADR0        *&H4005C00C ' I2C Slave Address Register 0 (R/W)
#define I2C1_SCLH        *&H4005C010 ' SCH Duty Cycle Register High Half Word (R/W)
#define I2C1_SCLL        *&H4005C014 ' SCL Duty Cycle Register Low Half Word (R/W)
#define I2C1_CONCLR      *&H4005C018 ' I2C Control Clear Register ( /W)
#define I2C1_MMCTRL      *&H4005C01C ' Monitor mode control register (R/W)
#define I2C1_ADR1        *&H4005C020 ' I2C Slave Address Register 1 (R/W)
#define I2C1_ADR2        *&H4005C024 ' I2C Slave Address Register 2 (R/W)
#define I2C1_ADR3        *&H4005C028 ' I2C Slave Address Register 3 (R/W)
#define I2C1_DATA_BUFFER *&H4005C02C ' Data buffer register ( /W)
#define I2C1_MASK0       *&H4005C030 ' I2C Slave address mask register 0 (R/W)
#define I2C1_MASK1       *&H4005C034 ' I2C Slave address mask register 1 (R/W)
#define I2C1_MASK2       *&H4005C038 ' I2C Slave address mask register 2 (R/W)
#define I2C1_MASK3       *&H4005C03C ' I2C Slave address mask register 3 (R/W)

#define I2C2_CONSET      *&H400A0000 ' I2C Control Set Register (R/W)
#define I2C2_STAT        *&H400A0004 ' I2C Status Register (R/ )
#define I2C2_DAT         *&H400A0008 ' I2C Data Register (R/W)
#define I2C2_ADR0        *&H400A000C ' I2C Slave Address Register 0 (R/W)
#define I2C2_SCLH        *&H400A0010 ' SCH Duty Cycle Register High Half Word (R/W)
#define I2C2_SCLL        *&H400A0014 ' SCL Duty Cycle Register Low Half Word (R/W)
#define I2C2_CONCLR      *&H400A0018 ' I2C Control Clear Register ( /W)
#define I2C2_MMCTRL      *&H400A001C ' Monitor mode control register (R/W)
#define I2C2_ADR1        *&H400A0020 ' I2C Slave Address Register 1 (R/W)
#define I2C2_ADR2        *&H400A0024 ' I2C Slave Address Register 2 (R/W)
#define I2C2_ADR3        *&H400A0028 ' I2C Slave Address Register 3 (R/W)
#define I2C2_DATA_BUFFER *&H400A002C ' Data buffer register ( /W)
#define I2C2_MASK0       *&H400A0030 ' I2C Slave address mask register 0 (R/W)
#define I2C2_MASK1       *&H400A0034 ' I2C Slave address mask register 1 (R/W)
#define I2C2_MASK2       *&H400A0038 ' I2C Slave address mask register 2 (R/W)
#define I2C2_MASK3       *&H400A003C ' I2C Slave address mask register 3 (R/W)


'------------- Real-Time Clock (RTC) ----------------------------------------
#define RTC_ILR           *&H40024000
#define RTC_CCR           *&H40024008
#define RTC_CIIR          *&H4002400C
#define RTC_AMR           *&H40024010
#define RTC_CTIME0        *&H40024014
#define RTC_CTIME1        *&H40024018
#define RTC_CTIME2        *&H4002401C
#define RTC_SEC           *&H40024020
#define RTC_MIN           *&H40024024
#define RTC_HOUR          *&H40024028
#define RTC_DOM           *&H4002402C
#define RTC_DAY           RTC_DOM
#define RTC_DOW           *&H40024030
#define RTC_DOY           *&H40024034
#define RTC_MONTH         *&H40024038
#define RTC_YEAR          *&H4002403C
#define RTC_CALIBRATION   *&H40024040
#define RTC_GPREG0        *&H40024044
#define RTC_GPREG1        *&H40024048
#define RTC_GPREG2        *&H4002404C
#define RTC_GPREG3        *&H40024050
#define RTC_GPREG4        *&H40024054
#define RTC_RTC_AUXEN     *&H40024058
#define RTC_RTC_AUX       *&H4002405C
#define RTC_ALSEC         *&H40024060
#define RTC_ALMIN         *&H40024064
#define RTC_ALHOUR        *&H40024068
#define RTC_ALDOM         *&H4002406C
#define RTC_ALDOW         *&H40024070
#define RTC_ALDOY         *&H40024074
#define RTC_ALMON         *&H40024078
#define RTC_ALYEAR        *&H4002407C
#define RTC_ERSTATUS      *&H40024080
#define RTC_ERCONTROL     *&H40024084
#define RTC_ERCOUNTERS    *&H40024088
#define RTC_ERFIRSTSTAMP0 *&H40024090
#define RTC_ERFIRSTSTAMP1 *&H40024094
#define RTC_ERFIRSTSTAMP2 *&H40024098
#define RTC_ERLASTSTAMP0  *&H400240A0
#define RTC_ERLASTSTAMP1  *&H400240A4
#define RTC_ERLASTSTAMP2  *&H400240A8


'------------- Pin Connect Block (PINCON) -----------------------------------
#define IOCON_P0_0    *&H4002C000
#define IOCON_P0_1    *&H4002C004
#define IOCON_P0_2    *&H4002C008
#define IOCON_P0_3    *&H4002C00C
#define IOCON_P0_4    *&H4002C010
#define IOCON_P0_5    *&H4002C014
#define IOCON_P0_6    *&H4002C018
#define IOCON_P0_7    *&H4002C01C

#define IOCON_P0_8    *&H4002C020
#define IOCON_P0_9    *&H4002C024
#define IOCON_P0_10   *&H4002C028
#define IOCON_P0_11   *&H4002C02C
#define IOCON_P0_12   *&H4002C030
#define IOCON_P0_13   *&H4002C034
#define IOCON_P0_14   *&H4002C038
#define IOCON_P0_15   *&H4002C03C

#define IOCON_P0_16   *&H4002C040
#define IOCON_P0_17   *&H4002C044
#define IOCON_P0_18   *&H4002C048
#define IOCON_P0_19   *&H4002C04C
#define IOCON_P0_20   *&H4002C050
#define IOCON_P0_21   *&H4002C054
#define IOCON_P0_22   *&H4002C058
#define IOCON_P0_23   *&H4002C05C

#define IOCON_P0_24   *&H4002C060
#define IOCON_P0_25   *&H4002C064
#define IOCON_P0_26   *&H4002C068
#define IOCON_P0_27   *&H4002C06C
#define IOCON_P0_28   *&H4002C070
#define IOCON_P0_29   *&H4002C074
#define IOCON_P0_30   *&H4002C078
#define IOCON_P0_31   *&H4002C07C

#define IOCON_P1_0    *&H4002C080
#define IOCON_P1_1    *&H4002C084
#define IOCON_P1_2    *&H4002C088
#define IOCON_P1_3    *&H4002C08C
#define IOCON_P1_4    *&H4002C090
#define IOCON_P1_5    *&H4002C094
#define IOCON_P1_6    *&H4002C098
#define IOCON_P1_7    *&H4002C09C

#define IOCON_P1_8    *&H4002C0A0
#define IOCON_P1_9    *&H4002C0A4
#define IOCON_P1_10   *&H4002C0A8
#define IOCON_P1_11   *&H4002C0AC
#define IOCON_P1_12   *&H4002C0B0
#define IOCON_P1_13   *&H4002C0B4
#define IOCON_P1_14   *&H4002C0B8
#define IOCON_P1_15   *&H4002C0BC

#define IOCON_P1_16   *&H4002C0C0
#define IOCON_P1_17   *&H4002C0C4
#define IOCON_P1_18   *&H4002C0C8
#define IOCON_P1_19   *&H4002C0CC
#define IOCON_P1_20   *&H4002C0D0
#define IOCON_P1_21   *&H4002C0D4
#define IOCON_P1_22   *&H4002C0D8
#define IOCON_P1_23   *&H4002C0DC

#define IOCON_P1_24   *&H4002C0E0
#define IOCON_P1_25   *&H4002C0E4
#define IOCON_P1_26   *&H4002C0E8
#define IOCON_P1_27   *&H4002C0EC
#define IOCON_P1_28   *&H4002C0F0
#define IOCON_P1_29   *&H4002C0F4
#define IOCON_P1_30   *&H4002C0F8
#define IOCON_P1_31   *&H4002C0FC

#define IOCON_P2_0    *&H4002C100
#define IOCON_P2_1    *&H4002C104
#define IOCON_P2_2    *&H4002C108
#define IOCON_P2_3    *&H4002C10C
#define IOCON_P2_4    *&H4002C110
#define IOCON_P2_5    *&H4002C114
#define IOCON_P2_6    *&H4002C118
#define IOCON_P2_7    *&H4002C11C

#define IOCON_P2_8    *&H4002C120
#define IOCON_P2_9    *&H4002C124
#define IOCON_P2_10   *&H4002C128
#define IOCON_P2_11   *&H4002C12C
#define IOCON_P2_12   *&H4002C130
#define IOCON_P2_13   *&H4002C134
#define IOCON_P2_14   *&H4002C138
#define IOCON_P2_15   *&H4002C13C

#define IOCON_P2_16   *&H4002C140
#define IOCON_P2_17   *&H4002C144
#define IOCON_P2_18   *&H4002C148
#define IOCON_P2_19   *&H4002C14C
#define IOCON_P2_20   *&H4002C150
#define IOCON_P2_21   *&H4002C154
#define IOCON_P2_22   *&H4002C158
#define IOCON_P2_23   *&H4002C15C

#define IOCON_P2_24   *&H4002C160
#define IOCON_P2_25   *&H4002C164
#define IOCON_P2_26   *&H4002C168
#define IOCON_P2_27   *&H4002C16C
#define IOCON_P2_28   *&H4002C170
#define IOCON_P2_29   *&H4002C174
#define IOCON_P2_30   *&H4002C178
#define IOCON_P2_31   *&H4002C17C

#define IOCON_P3_0    *&H4002C180
#define IOCON_P3_1    *&H4002C184
#define IOCON_P3_2    *&H4002C188
#define IOCON_P3_3    *&H4002C18C
#define IOCON_P3_4    *&H4002C190
#define IOCON_P3_5    *&H4002C194
#define IOCON_P3_6    *&H4002C198
#define IOCON_P3_7    *&H4002C19C

#define IOCON_P3_8    *&H4002C1A0
#define IOCON_P3_9    *&H4002C1A4
#define IOCON_P3_10   *&H4002C1A8
#define IOCON_P3_11   *&H4002C1AC
#define IOCON_P3_12   *&H4002C1B0
#define IOCON_P3_13   *&H4002C1B4
#define IOCON_P3_14   *&H4002C1B8
#define IOCON_P3_15   *&H4002C1BC

#define IOCON_P3_16   *&H4002C1C0
#define IOCON_P3_17   *&H4002C1C4
#define IOCON_P3_18   *&H4002C1C8
#define IOCON_P3_19   *&H4002C1CC
#define IOCON_P3_20   *&H4002C1D0
#define IOCON_P3_21   *&H4002C1D4
#define IOCON_P3_22   *&H4002C1D8
#define IOCON_P3_23   *&H4002C1DC

#define IOCON_P3_24   *&H4002C1E0
#define IOCON_P3_25   *&H4002C1E4
#define IOCON_P3_26   *&H4002C1E8
#define IOCON_P3_27   *&H4002C1EC
#define IOCON_P3_28   *&H4002C1F0
#define IOCON_P3_29   *&H4002C1F4
#define IOCON_P3_30   *&H4002C1F8
#define IOCON_P3_31   *&H4002C1FC

#define IOCON_P4_0    *&H4002C200
#define IOCON_P4_1    *&H4002C204
#define IOCON_P4_2    *&H4002C208
#define IOCON_P4_3    *&H4002C20C
#define IOCON_P4_4    *&H4002C210
#define IOCON_P4_5    *&H4002C214
#define IOCON_P4_6    *&H4002C218
#define IOCON_P4_7    *&H4002C21C

#define IOCON_P4_8    *&H4002C220
#define IOCON_P4_9    *&H4002C224
#define IOCON_P4_10   *&H4002C228
#define IOCON_P4_11   *&H4002C22C
#define IOCON_P4_12   *&H4002C230
#define IOCON_P4_13   *&H4002C234
#define IOCON_P4_14   *&H4002C238
#define IOCON_P4_15   *&H4002C23C

#define IOCON_P4_16   *&H4002C240
#define IOCON_P4_17   *&H4002C244
#define IOCON_P4_18   *&H4002C248
#define IOCON_P4_19   *&H4002C24C
#define IOCON_P4_20   *&H4002C250
#define IOCON_P4_21   *&H4002C254
#define IOCON_P4_22   *&H4002C258
#define IOCON_P4_23   *&H4002C25C

#define IOCON_P4_24   *&H4002C260
#define IOCON_P4_25   *&H4002C264
#define IOCON_P4_26   *&H4002C268
#define IOCON_P4_27   *&H4002C26C
#define IOCON_P4_28   *&H4002C270
#define IOCON_P4_29   *&H4002C274
#define IOCON_P4_30   *&H4002C278
#define IOCON_P4_31   *&H4002C27C

#define IOCON_P5_0    *&H4002C280
#define IOCON_P5_1    *&H4002C284
#define IOCON_P5_2    *&H4002C288
#define IOCON_P5_3    *&H4002C28C
#define IOCON_P5_4    *&H4002C290


'------------- Synchronous Serial Communication (SSP) -----------------------
#define SSP0_CR0    *&H40088000 ' Control Register 0 (R/W)
#define SSP0_CR1    *&H40088004 ' Control Register 1 (R/W)
#define SSP0_DR     *&H40088008 ' Data Register (R/W)
#define SSP0_SR     *&H4008800C ' Status Registe (R/ )
#define SSP0_CPSR   *&H40088010 ' Clock Prescale Register (R/W)
#define SSP0_IMSC   *&H40088014 ' Interrupt Mask Set and Clear Register (R/W)
#define SSP0_RIS    *&H40088018 ' Raw Interrupt Status Register (R/W)
#define SSP0_MIS    *&H4008801C ' Masked Interrupt Status Register (R/W)
#define SSP0_ICR    *&H40088020 ' SSPICR Interrupt Clear Register (R/W)
#define SSP0_DMACR  *&H40088024

#define SSP1_CR0    *&H40030000 ' Control Register 0 (R/W)
#define SSP1_CR1    *&H40030004 ' Control Register 1 (R/W)
#define SSP1_DR     *&H40030008 ' Data Register (R/W)
#define SSP1_SR     *&H4003000C ' Status Registe (R/ )
#define SSP1_CPSR   *&H40030010 ' Clock Prescale Register (R/W)
#define SSP1_IMSC   *&H40030014 ' Interrupt Mask Set and Clear Register (R/W)
#define SSP1_RIS    *&H40030018 ' Raw Interrupt Status Register (R/W)
#define SSP1_MIS    *&H4003001C ' Masked Interrupt Status Register (R/W)
#define SSP1_ICR    *&H40030020 ' SSPICR Interrupt Clear Register (R/W)
#define SSP1_DMACR  *&H40030024

#define SSP2_CR0    *&H400AC000 ' Control Register 0 (R/W)
#define SSP2_CR1    *&H400AC004 ' Control Register 1 (R/W)
#define SSP2_DR     *&H400AC008 ' Data Register (R/W)
#define SSP2_SR     *&H400AC00C ' Status Registe (R/ )
#define SSP2_CPSR   *&H400AC010 ' Clock Prescale Register (R/W)
#define SSP2_IMSC   *&H400AC014 ' Interrupt Mask Set and Clear Register (R/W)
#define SSP2_RIS    *&H400AC018 ' Raw Interrupt Status Register (R/W)
#define SSP2_MIS    *&H400AC01C ' Masked Interrupt Status Register (R/W)
#define SSP2_ICR    *&H400AC020 ' SSPICR Interrupt Clear Register (R/W)
#define SSP2_DMACR  *&H400AC024


'------------- Analog-to-Digital Converter (ADC) ----------------------------
#define ADC_CR      *&H40034000 ' A/D Control Register (R/W)
#define ADC_GDR     *&H40034004 ' A/D Global Data Register (R/W)
#define ADC_INTEN   *&H4003400C ' A/D Interrupt Enable Register (R/W)
#define ADC_DR0     *&H40034010 ' A/D Channels 0..7 Data Register (R/W)
#define ADC_DR1     *&H40034014
#define ADC_DR2     *&H40034018
#define ADC_DR3     *&H4003401C
#define ADC_DR4     *&H40034020
#define ADC_DR5     *&H40034024
#define ADC_DR6     *&H40034028
#define ADC_DR7     *&H4003402C
#define ADC_STAT    *&H40034030 ' A/D Status Register (R/ )
#define ADC_ADTRM   *&H40034034


'------------- Controller Area Network (CAN) --------------------------------
#define CANAF_RAM_mask *&H40038000 ' ID Masks integer[512]

' Acceptance FilRegisters
#define CANAF_AFMR        *&H4003C000 ' Acceptance Filter Register
#define CANAF_SFF_sa      *&H4003C004 ' Standard Frame Individual Start Address Register
#define CANAF_SFF_GRP_sa  *&H4003C008 ' Standard Frame Group Start Address Register
#define CANAF_EFF_sa      *&H4003C00C ' Extended Frame Start Address Register
#define CANAF_EFF_GRP_sa  *&H4003C010 ' Extended Frame Group Start Address Register
#define CANAF_ENDofTable  *&H4003C014 ' End of AF Tables register
#define CANAF_LUTerrAd    *&H4003C018 ' LUT Error Address register
#define CANAF_LUTerr      *&H4003C01C ' LUT Error Register
#define CANAF_FCANIE      *&H4003C020 ' CAN Central Transmit Status Register
#define CANAF_FCANIC0     *&H4003C024 ' FullCAN Interrupt and Capture registers 0
#define CANAF_FCANIC1     *&H4003C028 ' FullCAN Interrupt and Capture registers 1

' Central Registers
#define CANCR_TxSR        *&H40040000
#define CANCR_RxSR        *&H40040004
#define CANCR_MSR         *&H40040008

' CAN Controller Registers
#define CAN1_MOD  *&H40044000 ' Controls the operating mode of the CAN Controller
#define CAN1_CMR  *&H40044004 ' Command bits that affect the state
#define CAN1_GSR  *&H40044008 ' Global Controller Status and Error Counters
#define CAN1_ICR  *&H4004400C ' Interrupt status, Arbitration Lost Capture, Error Code Capture
#define CAN1_IER  *&H40044010 ' Interrupt Enable Register
#define CAN1_BTR  *&H40044014 ' Bus Timing Register
#define CAN1_EWL  *&H40044018 ' Error Warning Limit
#define CAN1_SR   *&H4004401C ' Status Register
#define CAN1_RFS  *&H40044020 ' Receive frame status
#define CAN1_RID  *&H40044024 ' Received Identifier
#define CAN1_RDA  *&H40044028 ' Received data bytes 1-4
#define CAN1_RDB  *&H4004402C ' Received data bytes 5-8
#define CAN1_TFI1 *&H40044030 ' Transmit frame info (Tx Buffer 1)
#define CAN1_TID1 *&H40044034 ' Transmit Identifier (Tx Buffer 1)
#define CAN1_TDA1 *&H40044038 ' Transmit data bytes 1-4 (Tx Buffer 1)
#define CAN1_TDB1 *&H4004403C ' Transmit data bytes 5-8 (Tx Buffer 1)
#define CAN1_TFI2 *&H40044040 ' Transmit frame info (Tx Buffer 2)
#define CAN1_TID2 *&H40044044 ' Transmit Identifier (Tx Buffer 2)
#define CAN1_TDA2 *&H40044048 ' Transmit data bytes 1-4 (Tx Buffer 2)
#define CAN1_TDB2 *&H4004404C ' Transmit data bytes 5-8 (Tx Buffer 2)
#define CAN1_TFI3 *&H40044050 ' Transmit frame info (Tx Buffer 3)
#define CAN1_TID3 *&H40044054 ' Transmit Identifier (Tx Buffer 3)
#define CAN1_TDA3 *&H40044058 ' Transmit data bytes 1-4 (Tx Buffer 3)
#define CAN1_TDB3 *&H4004405C ' Transmit data bytes 5-8 (Tx Buffer 3)

#define CAN2_MOD  *&H40048000 ' Controls the operating mode of the CAN Controller
#define CAN2_CMR  *&H40048004 ' Command bits that affect the state
#define CAN2_GSR  *&H40048008 ' Global Controller Status and Error Counters
#define CAN2_ICR  *&H4004800C ' Interrupt status, Arbitration Lost Capture, Error Code Capture
#define CAN2_IER  *&H40048010 ' Interrupt Enable Register
#define CAN2_BTR  *&H40048014 ' Bus Timing Register
#define CAN2_EWL  *&H40048018 ' Error Warning Limit
#define CAN2_SR   *&H4004801C ' Status Register
#define CAN2_RFS  *&H40048020 ' Receive frame status
#define CAN2_RID  *&H40048024 ' Received Identifier
#define CAN2_RDA  *&H40048028 ' Received data bytes 1-4
#define CAN2_RDB  *&H4004802C ' Received data bytes 5-8
#define CAN2_TFI1 *&H40048030 ' Transmit frame info (Tx Buffer 1)
#define CAN2_TID1 *&H40048034 ' Transmit Identifier (Tx Buffer 1)
#define CAN2_TDA1 *&H40048038 ' Transmit data bytes 1-4 (Tx Buffer 1)
#define CAN2_TDB1 *&H4004803C ' Transmit data bytes 5-8 (Tx Buffer 1)
#define CAN2_TFI2 *&H40048040 ' Transmit frame info (Tx Buffer 2)
#define CAN2_TID2 *&H40048044 ' Transmit Identifier (Tx Buffer 2)
#define CAN2_TDA2 *&H40048048 ' Transmit data bytes 1-4 (Tx Buffer 2)
#define CAN2_TDB2 *&H4004804C ' Transmit data bytes 5-8 (Tx Buffer 2)
#define CAN2_TFI3 *&H40048050 ' Transmit frame info (Tx Buffer 3)
#define CAN2_TID3 *&H40048054 ' Transmit Identifier (Tx Buffer 3)
#define CAN2_TDA3 *&H40048058 ' Transmit data bytes 1-4 (Tx Buffer 3)
#define CAN2_TDB3 *&H4004805C ' Transmit data bytes 5-8 (Tx Buffer 3)


'------------- Digital-to-Analog Converter (DAC) ----------------------------
#define DAC_CR     *&H4008C000
#define DAC_CTRL   *&H4008C004
#define DAC_CNTVAL *&H4008C008


'------------- Inter IC Sound (I2S) -----------------------------------------
#define I2S_DAO         *&H400A8000
#define I2S_DAI         *&H400A8004
#define I2S_TXFIFO      *&H400A8008
#define I2S_RXFIFO      *&H400A800C
#define I2S_STATE       *&H400A8010
#define I2S_DMA1        *&H400A8014
#define I2S_DMA2        *&H400A8018
#define I2S_IRQ         *&H400A801C
#define I2S_TXRATE      *&H400A8020
#define I2S_RXRATE      *&H400A8024
#define I2S_TXBITRATE   *&H400A8028
#define I2S_RXBITRATE   *&H400A802C
#define I2S_TXMODE      *&H400A8030
#define I2S_RXMODE      *&H400A8034


'------------- SD/MMC card Interface (MCI)-----------------------------------
#define MCI_POWER     *&H400C0000
#define MCI_CLOCK     *&H400C0004
#define MCI_ARGUMENT  *&H400C0008
#define MCI_COMMAND   *&H400C000C
#define MCI_RESP_CMD  *&H400C0010
#define MCI_RESP0     *&H400C0014
#define MCI_RESP1     *&H400C0018
#define MCI_RESP2     *&H400C001C
#define MCI_RESP3     *&H400C0020
#define MCI_DATATMR   *&H400C0024
#define MCI_DATALEN   *&H400C0028
#define MCI_DATACTRL  *&H400C002C
#define MCI_DATACNT   *&H400C0030
#define MCI_STATUS    *&H400C0034
#define MCI_CLEAR     *&H400C0038
#define MCI_MASK0     *&H400C003C
#define MCI_FIFOCNT   *&H400C0048
#define MCI_FIFO0     *&H400C0080
#define MCI_FIFO1     *&H400C0084
#define MCI_FIFO2     *&H400C0088
#define MCI_FIFO3     *&H400C008C
#define MCI_FIFO4     *&H400C0090
#define MCI_FIFO5     *&H400C0094
#define MCI_FIFO6     *&H400C0098
#define MCI_FIFO7     *&H400C009C
#define MCI_FIFO8     *&H400C00A0
#define MCI_FIFO9     *&H400C00A4
#define MCI_FIFO10    *&H400C00A8
#define MCI_FIFO11    *&H400C00AC
#define MCI_FIFO12    *&H400C00B0
#define MCI_FIFO13    *&H400C00B4
#define MCI_FIFO14    *&H400C00B8
#define MCI_FIFO15    *&H400C00BC


'------------- EEPROM Controller (EEPROM) -----------------------------------
#define EEPROM_CMD            *&H00200080
#define EEPROM_ADDR           *&H00200084
#define EEPROM_WDATA          *&H00200088
#define EEPROM_RDATA          *&H0020008C
#define EEPROM_WSTATE         *&H00200090
#define EEPROM_CLKDIV         *&H00200094
#define EEPROM_PWRDWN         *&H00200098
#define EEPROM_INT_CLR_ENABLE *&H00200FD8
#define EEPROM_INT_SET_ENABLE *&H00200FDC
#define EEPROM_INT_STATUS     *&H00200FE0
#define EEPROM_INT_ENABLE     *&H00200FE4
#define EEPROM_INT_CLR_STATUS *&H00200FE8
#define EEPROM_INT_SET_STATUS *&H00200FEC


'------------- COMPARATOR ----------------------------------------------------
#define COMPARATOR_CTRL  *&H40020000 ' Comparator block control register
#define COMPARATOR_CTRL0 *&H40020004 ' Comparator 0 control register
#define COMPARATOR_CTRL1 *&H40020008 ' Comparator 1 control register


#endif

