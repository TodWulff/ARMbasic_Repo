'*****************************************************************************************************
' * @file     LPC540xx.bas -- derived from LPC540xx.h
' *
' * @status   EXPERIMENTAL
' *
' * @brief    CMSIS Cortex-M4 Core Peripheral Access Layer Header File for
' *           default LPC540xx Device Series
' *
' * @date     10. June 2018
' *
' ******************************************************************************************************

#ifndef __LPC540XX_A_H__
#define __LPC540XX_A_H__


'******  LPC540XX Specific Interrupt Numbers *******************************************************
#define WDTBOD_IRQn         0     ' WWDT                                             
#define DMA_IRQn            1     ' DMA                                              
#define GINT0_IRQn          2     ' GINT0                                            
#define GINT1_IRQn          3     ' GINT1                                            
#define PIN_INT0_IRQn       4     ' PININT0                                          
#define PIN_INT1_IRQn       5     ' PININT1                                          
#define PIN_INT2_IRQn       6     ' PININT2                                          
#define PIN_INT3_IRQn       7     ' PININT3                                          
#define UTICK_IRQn          8     ' Micro-tick Timer interrupt                       
#define MRT_IRQn            9     ' Multi-rate timer interrupt                       
#define TIMER0_IRQn         10    ' TIMER0 aka CT32B0                                            
#define TIMER1_IRQn         11    ' TIMER1 aka CT32B1                                            
#define SCT0_IRQn           12    ' SCT                                              
#define TIMER3_IRQn         13    ' TIMER3 aka CT32B3                                            
#define FLEXCOMM0_IRQn      14    ' FLEXCOMM0                                        
#define FLEXCOMM1_IRQn      15    ' FLEXCOMM1                                        
#define FLEXCOMM2_IRQn      16    ' FLEXCOMM2                                        
#define FLEXCOMM3_IRQn      17    ' FLEXCOMM3                                        
#define FLEXCOMM4_IRQn      18    ' FLEXCOMM4                                        
#define FLEXCOMM5_IRQn      19    ' FLEXCOMM5                                        
#define FLEXCOMM6_IRQn      20    ' FLEXCOMM6                                        
#define FLEXCOMM7_IRQn      21    ' FLEXCOMM7                                        
#define ADC_SEQA_IRQn       22    ' ADC0 sequence A completion                       
#define ADC_SEQB_IRQn       23    ' ADC0 sequence B completion                       
#define ADC_THCMP_IRQn      24    ' ADC0 threshold compare and error                 
#define DMIC_IRQn           25    ' Digital Mic                                      
#define HWVAD_IRQn          26    ' Hardware Voice acitivity detect                  
#define USB0ACT_IRQn        27    ' USB Activity                                     
#define USB0_IRQn           28    ' USB                                              
#define RTC_IRQn            29    ' RTC alarm and wake-up interrupts                 
#define FLEXCOMM10_IRQn     30    ' FLEXCOMM10                                       
#define Reserved1_IRQn      31    '                                                  
#define PIN_INT4_IRQn       32    ' External Interrupt 4                             
#define PIN_INT5_IRQn       33    ' External Interrupt 5                             
#define PIN_INT6_IRQn       34    ' External Interrupt 6                             
#define PIN_INT7_IRQn       35    ' External Interrupt 7                             
#define TIMER2_IRQn         36    ' TIMER2 aka CT32B2                                            
#define TIMER4_IRQn         37    ' TIMER4 aka CT32B4                                            
#define RITIMER_IRQn        38    ' OSTIMER Interrupt                                
#define SPIFI_IRQn          39    ' SPI Flash interface                              
#define FLEXCOMM8_IRQn      40    ' FLEXCOMM8 interrupt                              
#define FLEXCOMM9_IRQn      41    ' FLEXCOMM9 interrupt                              
#define SDIO_IRQn           42    ' SDIO Interrupt                                   
#define CAN0_0_IRQn         43    ' CAN0 Interrupt0                                  
#define CAN0_1_IRQn         44    ' CAN0 Interrupt1                                  
#define CAN1_0_IRQn         43    ' CAN1 Interrupt0                                  
#define CAN1_1_IRQn         44    ' CAN1 Interrupt1                                  
#define USB1_IRQn           47    ' USB1 Interrupt                                   
#define USB1ACT_IRQn        48    ' USB1 Activity interrupt                          
#define ETH_IRQn            49    ' Ethernet Interrupt handler                       
#define ETH_PMT_IRQn        50    ' FIXME: What is this (?)                          
#define ETH_MACLP_IRQn      51    ' FIXME: Check what this is!                       
#define Reserved2_IRQn      52    '                                                  
#define LCD_IRQn            53    ' LCD Controller Interrupt                         
#define SHA_IRQn            54    ' Hash engine interrupt                            
#define SMARTCARD0_IRQn     55    ' Smart card-0 interrupt                           
#define SMARTCARD1_IRQn     56    ' Smart card-1 interrupt                           

' VIC Vector Table
#define Reset_ISR             *&H00000004  ' 1  Reset Vector, invoked on Power up and warm reset 
#define NonMaskableInt_ISR    *&H00000008  ' 2  Non maskable Interrupt, cannot be stopped or preempted 
#define HardFault_ISR         *&H0000000C  ' 3  Hard Fault, all classes of Fault 
#define MemoryManagement_ISR  *&H00000010  ' 4  Memory Management, MPU mismatch, including Access Violation and No Match 
#define BusFault_ISR          *&H00000014  ' 5  Bus Fault, Pre-Fetch-, Memory Access Fault, other address/memory related Fault 
#define UsageFault_ISR        *&H00000018  ' 6  Usage Fault, i.e. Undef Instruction, Illegal State Transition 
#define SVCall_ISR            *&H0000002C  ' 11  System Service Call via SVC instruction 
#define DebugMonitor_ISR      *&H00000030  ' 12  Debug Monitor                    
#define PendSV_ISR            *&H00000038  ' 14  Pendable request for system service 
#define SysTick_ISR           *&H0000003C  ' 15  System Tick Timer                
#define WDTBOD_ISR            *&H00000040   ' 0  WWDT                                             
#define DMA_ISR               *&H00000044   ' 1  DMA                                              
#define GINT0_ISR             *&H00000048   ' 2  GINT0                                            
#define GINT1_ISR             *&H0000004C   ' 3  GINT1                                            
#define PIN_INT0_ISR          *&H00000050   ' 4  PININT0                                          
#define PIN_INT1_ISR          *&H00000054   ' 5  PININT1                                          
#define PIN_INT2_ISR          *&H00000058   ' 6  PININT2                                          
#define PIN_INT3_ISR          *&H0000005C   ' 7  PININT3                                          
#define UTICK_ISR             *&H00000060   ' 8  Micro-tick Timer interrupt                       
#define MRT_ISR               *&H00000064   ' 9  Multi-rate timer interrupt                       
#define TIMER0_ISR            *&H00000068   ' 10 TIMER0                                            
#define TIMER1_ISR            *&H0000006C   ' 11 TIMER1                                            
#define SCT0_ISR              *&H00000070   ' 12 SCT                                              
#define TIMER3_ISR            *&H00000074   ' 13 TIMER3                                            
#define FLEXCOMM0_ISR         *&H00000078   ' 14 FLEXCOMM0                                        
#define FLEXCOMM1_ISR         *&H0000007C   ' 15 FLEXCOMM1                                        
#define FLEXCOMM2_ISR         *&H00000080   ' 16 FLEXCOMM2                                        
#define FLEXCOMM3_ISR         *&H00000084   ' 17 FLEXCOMM3                                        
#define FLEXCOMM4_ISR         *&H00000088   ' 18 FLEXCOMM4                                        
#define FLEXCOMM5_ISR         *&H0000008C   ' 19 FLEXCOMM5                                        
#define FLEXCOMM6_ISR         *&H00000090   ' 20 FLEXCOMM6                                        
#define FLEXCOMM7_ISR         *&H00000094   ' 21 FLEXCOMM7                                        
#define ADC_SEQA_ISR          *&H00000098   ' 22 ADC0 sequence A completion                       
#define ADC_SEQB_ISR          *&H0000009C   ' 23 ADC0 sequence B completion                       
#define ADC_THCMP_ISR         *&H000000A0   ' 24 ADC0 threshold compare and error                 
#define DMIC_ISR              *&H000000A4   ' 25 Digital Mic                                      
#define HWVAD_ISR             *&H000000A8   ' 26 Hardware Voice acitivity detect                  
#define USB0ACT_ISR           *&H000000AC   ' 27 USB Activity                                     
#define USB0_ISR              *&H000000B0   ' 28 USB                                              
#define RTC_ISR               *&H000000B4   ' 29 RTC alarm and wake-up interrupts                 
#define FLEXCOMM10_ISR        *&H000000B8   ' 30 FLEXCOMM10                                       
#define Reserved1_ISR         *&H000000BC   ' 31                                                  
#define PIN_INT4_ISR          *&H000000C0   ' 32 External Interrupt 4                             
#define PIN_INT5_ISR          *&H000000C4   ' 33 External Interrupt 5                             
#define PIN_INT6_ISR          *&H000000C8   ' 34 External Interrupt 6                             
#define PIN_INT7_ISR          *&H000000CC   ' 35 External Interrupt 7                             
#define TIMER2_ISR            *&H000000D0   ' 36 TIMER2                                            
#define TIMER4_ISR            *&H000000D4   ' 37 TIMER4                                            
#define RITIMER_ISR           *&H000000D8   ' 38 OSTIMER Interrupt                                
#define SPIFI_ISR             *&H000000DC   ' 39 SPI Flash interface                              
#define FLEXCOMM8_ISR         *&H000000E0   ' 40 FLEXCOMM8 interrupt                              
#define FLEXCOMM9_ISR         *&H000000E4   ' 41 FLEXCOMM9 interrupt                              
#define SDIO_ISR              *&H000000E8   ' 42 SDIO Interrupt                                   
#define CAN0_0_ISR            *&H000000EC   ' 43 CAN0 Interrupt0                                  
#define CAN0_1_ISR            *&H000000F0   ' 44 CAN0 Interrupt1                                  
#define CAN1_0_ISR            *&H000000F4   ' 43 CAN1 Interrupt0                                  
#define CAN1_1_ISR            *&H000000F8   ' 44 CAN1 Interrupt1                                  
#define USB1_ISR              *&H000000FC   ' 47 USB1 Interrupt                                   
#define USB1ACT_ISR           *&H00000100   ' 48 USB1 Activity interrupt                          
#define ETH_ISR               *&H00000104   ' 49 Ethernet Interrupt handler                       
#define ETH_PMT_ISR           *&H00000108   ' 50 FIXME: What is this (?)                          
#define ETH_MACLP_ISR         *&H0000010C   ' 51 FIXME: Check what this is!                       
#define Reserved2_ISR         *&H00000110   ' 52                                                  
#define LCD_ISR               *&H00000114   ' 53 LCD Controller Interrupt                         
#define SHA_ISR               *&H00000118   ' 54 Hash engine interrupt                            
#define SMARTCARD0_ISR        *&H0000011C   ' 55 Smart card-0 interrupt                           
#define SMARTCARD1_ISR        *&H00000120   ' 56 Smart card-1 interrupt                           


' Configuration of the Cortex-M4 Processor and Core Peripherals
#define __CM4_REV                 0x0001    ' Cortex-M4 Core Revision                         
#define __MPU_PRESENT             1         ' MPU present or not                              
#define __NVIC_PRIO_BITS          3         ' Number of Bits used for Priority Levels         
#define __Vendor_SysTickConfig    0         ' Set to 1 if different SysTick Config is used    
#define __FPU_PRESENT             1


' Nested Vectored Interrupt Controller (NVIC)
#define NVIC_ISER0    *&HE000E100   ' Interrupt Set Enable Register
#define NVIC_ISER1    *&HE000E104   ' Interrupt Set Enable Register
#define NVIC_ICER0    *&HE000E180   ' Interrupt Clear Enable Register
#define NVIC_ICER1    *&HE000E184   ' Interrupt Clear Enable Register
#define NVIC_ISPR0    *&HE000E200   ' Interrupt Set Pending Register
#define NVIC_ISPR1    *&HE000E204   ' Interrupt Set Pending Register
#define NVIC_ICPR0    *&HE000E280   ' Interrupt Clear Pending Register
#define NVIC_ICPR1    *&HE000E284   ' Interrupt Clear Pending Register
#define NVIC_IABR0    *&HE000E300   ' Interrupt Active bit Register
#define NVIC_IABR1    *&HE000E304   ' Interrupt Active bit Register
#define NVIC_IP0      *&HE000E400   ' Interrupt Priority Register 
#define NVIC_IP1      *&HE000E401   ' Interrupt Priority Register 
#define NVIC_IP2      *&HE000E402   ' Interrupt Priority Register 
#define NVIC_IP3      *&HE000E403   ' Interrupt Priority Register 
#define NVIC_IP4      *&HE000E404   ' Interrupt Priority Register 
#define NVIC_IP5      *&HE000E405   ' Interrupt Priority Register 
#define NVIC_IP6      *&HE000E406   ' Interrupt Priority Register 
#define NVIC_IP7      *&HE000E407   ' Interrupt Priority Register 
#define NVIC_IP8      *&HE000E408   ' Interrupt Priority Register 
#define NVIC_IP9      *&HE000E409   ' Interrupt Priority Register 
#define NVIC_IP10     *&HE000E40A   ' Interrupt Priority Register 
#define NVIC_IP11     *&HE000E40B   ' Interrupt Priority Register 
#define NVIC_IP12     *&HE000E40C   ' Interrupt Priority Register 
#define NVIC_IP13     *&HE000E40D   ' Interrupt Priority Register 
#define NVIC_IP14     *&HE000E40E   ' Interrupt Priority Register 
#define NVIC_STIR     *&HE000EF00   ' Software Trigger Interrupt Register     


' System Control Block (SCB) 
#define SCB_CPUID     *&HE000ED00   ' CPUID Base Register                                   
#define SCB_ICSR      *&HE000ED04   ' Interrupt Control and State Register                  
#define SCB_VTOR      *&HE000ED08   ' Vector Table Offset Register                          
#define SCB_AIRCR     *&HE000ED0C   ' Application Interrupt and Reset Control Register      
#define SCB_SCR       *&HE000ED10   ' System Control Register                               
#define SCB_CCR       *&HE000ED14   ' Configuration Control Register                        
#define SCB_SHP0      *&HE000ED18   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP1      *&HE000ED19   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP2      *&HE000ED1A   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP3      *&HE000ED1B   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP4      *&HE000ED1C   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP5      *&HE000ED1D   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP6      *&HE000ED1E   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP7      *&HE000ED1F   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP8      *&HE000ED20   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP9      *&HE000ED21   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP10     *&HE000ED22   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHP11     *&HE000ED23   ' System Handlers Priority Registers (4-7, 8-11, 12-15) 
#define SCB_SHCSR     *&HE000ED24   ' System Handler Control and State Register             
#define SCB_CFSR      *&HE000ED28   ' Configurable Fault Status Register                    
#define SCB_HFSR      *&HE000ED2C   ' HardFault Status Register                             
#define SCB_DFSR      *&HE000ED30   ' Debug Fault Status Register                           
#define SCB_MMFAR     *&HE000ED34   ' MemManage Fault Address Register                      
#define SCB_BFAR      *&HE000ED38   ' BusFault Address Register                             
#define SCB_AFSR      *&HE000ED3C   ' Auxiliary Fault Status Register                       
#define SCB_PFR0      *&HE000ED40   ' Processor Feature Register                            
#define SCB_PFR1      *&HE000ED44   ' Processor Feature Register                            
#define SCB_DFR       *&HE000ED48   ' Debug Feature Register                                
#define SCB_ADR       *&HE000ED4C   ' Auxiliary Feature Register                            
#define SCB_MMFR0     *&HE000ED50   ' Memory Model Feature Register                         
#define SCB_MMFR1     *&HE000ED54   ' Memory Model Feature Register                         
#define SCB_MMFR2     *&HE000ED58   ' Memory Model Feature Register                         
#define SCB_MMFR3     *&HE000ED5C   ' Memory Model Feature Register                         
#define SCB_ISAR0     *&HE000ED60   ' Instruction Set Attributes Register                   
#define SCB_ISAR1     *&HE000ED64   ' Instruction Set Attributes Register                   
#define SCB_ISAR2     *&HE000ED68   ' Instruction Set Attributes Register                   
#define SCB_ISAR3     *&HE000ED6C   ' Instruction Set Attributes Register                   
#define SCB_ISAR4     *&HE000ED70   ' Instruction Set Attributes Register                   
#define SCB_CPACR     *&HE000ED88   ' Coprocessor Access Control Register                   


' System reset status values
#define SYSCON_RST_POR    (1 << 0)    ' POR reset status
#define SYSCON_RST_EXTRST (1 << 1)    ' External reset status
#define SYSCON_RST_WDT    (1 << 2)    ' Watchdog reset status
#define SYSCON_RST_BOD    (1 << 3)    ' Brown-out detect reset status
#define SYSCON_RST_SYSRST (1 << 4)    ' software system reset status

' SYSCON Main system configuration register block structure
#define SYSCON_AHBMATPRIO           *&H40000010   ' AHB Martix priority register
#define SYSCON_SYSTCKCAL            *&H40000040   ' System Tick Calibration register
#define SYSCON_NMISRC               *&H40000048   ' NMI Source select register
#define SYSCON_ASYNCAPBCTRL         *&H4000004C   ' Asynch APB chiplet control register
#define SYSCON_PIOPORCAP0           *&H400000C0   ' Power on Reset port capture register
#define SYSCON_PIOPORCAP1           *&H400000C4   ' Power on Reset port capture register
#define SYSCON_PIORESCAP0           *&H400000D0   ' Reset portcapture register
#define SYSCON_PIORESCAP1           *&H400000D4   ' Reset portcapture register
#define SYSCON_PRESETCTRL0          *&H40000100   ' Peripheral  Reset control
#define SYSCON_PRESETCTRL1          *&H40000104   ' Peripheral  Reset control
#define SYSCON_PRESETCTRL2          *&H40000108   ' Peripheral  Reset control
#define SYSCON_PRESETCTRLSET0       *&H40000120   ' Peripheral Reset Control set
#define SYSCON_PRESETCTRLSET1       *&H40000124   ' Peripheral Reset Control set
#define SYSCON_PRESETCTRLSET2       *&H40000128   ' Peripheral Reset Control set
#define SYSCON_PRESETCTRLCLR0       *&H40000140   ' Peripheral Reset Control set
#define SYSCON_PRESETCTRLCLR1       *&H40000144   ' Peripheral Reset Control set
#define SYSCON_PRESETCTRLCLR2       *&H40000148   ' Peripheral Reset Control set
#define SYSCON_SYSRSTSTAT           *&H400001F0   ' System Reset Stat register
#define SYSCON_AHBCLKCTRL0          *&H40000200   ' AHB Peripheral Clk Enable register
#define SYSCON_AHBCLKCTRL1          *&H40000204   ' AHB Peripheral Clk Enable register
#define SYSCON_AHBCLKCTRL2          *&H40000208   ' AHB Peripheral Clk Enable register
#define SYSCON_AHBCLKCTRLSET0       *&H40000220   ' AHB Peripheral Clk Enable Set register
#define SYSCON_AHBCLKCTRLSET1       *&H40000224   ' AHB Peripheral Clk Enable Set register
#define SYSCON_AHBCLKCTRLSET2       *&H40000228   ' AHB Peripheral Clk Enable Set register
#define SYSCON_AHBCLKCTRLCLR0       *&H40000240   ' AHB Peripheral Clk Enable Clr register
#define SYSCON_AHBCLKCTRLCLR1       *&H40000244   ' AHB Peripheral Clk Enable Clr register
#define SYSCON_AHBCLKCTRLCLR2       *&H40000248   ' AHB Peripheral Clk Enable Clr register
#define SYSCON_STICKCLKSEL          *&H4000027C   ' SysTick Clk sel Source register
#define SYSCON_MAINCLKSELA          *&H40000280   ' Main Clk sel Source Sel A register
#define SYSCON_MAINCLKSELB          *&H40000284   ' Main Clk sel Source Sel B register
#define SYSCON_CLKOUTSELA           *&H40000288   ' Clk Out Sel Source B register
#define SYSCON_SYSPLLCLKSEL         *&H40000290   ' System PLL Clk Selregister
#define SYSCON_AUDPLLCLKSEL         *&H40000298   ' Audio PLL Clk Selregister
#define SYSCON_SPIFICLKSEL          *&H400002A0   ' SPIFI clock selection register
#define SYSCON_ADCCLKSEL            *&H400002A4   ' ADC Async Clk Sel register
#define SYSCON_USB0CLKSEL           *&H400002A8   ' USB0 Clk Sel register
#define SYSCON_USB1CLKSEL           *&H400002AC   ' USB1 Clock select register
#define SYSCON_FXCOMCLKSEL0         *&H400002B0  ' FlexCOM CLK sel register
#define SYSCON_FXCOMCLKSEL1         *&H400002B4  ' FlexCOM CLK sel register
#define SYSCON_FXCOMCLKSEL2         *&H400002B8  ' FlexCOM CLK sel register
#define SYSCON_FXCOMCLKSEL3         *&H400002BC  ' FlexCOM CLK sel register
#define SYSCON_FXCOMCLKSEL4         *&H400002C0  ' FlexCOM CLK sel register
#define SYSCON_FXCOMCLKSEL5         *&H400002C4  ' FlexCOM CLK sel register
#define SYSCON_FXCOMCLKSEL6         *&H400002C8  ' FlexCOM CLK sel register
#define SYSCON_FXCOMCLKSEL7         *&H400002CC  ' FlexCOM CLK sel register
#define SYSCON_FXCOMCLKSEL8         *&H400002D0  ' FlexCOM CLK sel register
#define SYSCON_FXCOMCLKSEL9         *&H400002D4  ' FlexCOM CLK sel register
#define SYSCON_FXCOMCLKSEL10        *&H400002D8   ' FlexCOM CLK sel register
#define SYSCON_MCLKCLKSEL           *&H400002E0   ' MCLK Clock select register
#define SYSCON_FRGCLKSEL            *&H400002E8   ' FRG Clock select register
#define SYSCON_DMICCLKSEL           *&H400002EC   ' DMIC Clock select register
#define SYSCON_SCTCLKSEL            *&H400002F0   ' SCT Clock select register
#define SYSCON_LCDCLKSEL            *&H400002F4   ' LCD Controller clock select register
#define SYSCON_SDIOCLKSEL           *&H400002F8   ' SDIO Clock select register
#define SYSCON_SYSTICKCLKDIV        *&H40000300   ' Systick Clock divider register
#define SYSCON_ARMTRCLKDIV          *&H40000304   ' ARM Trace Clock divider register
#define SYSCON_CAN0CLKDIV           *&H40000308   ' CAN0 Clock divider register
#define SYSCON_CAN1CLKDIV           *&H4000030C   ' CAN1 Clock divider register
#define SYSCON_SC0CLKDIV            *&H40000310   ' Smart Card 0 Clock divider register
#define SYSCON_SC1CLKDIV            *&H40000314   ' Smart Card 1 Clock divider register
#define SYSCON_AHBCLKDIV            *&H40000380   ' AHB Clock divider
#define SYSCON_CLKOUTDIV            *&H40000384   ' CLKOUT divider
#define SYSCON_FROHFCLKDIV          *&H40000388   ' FRO HF Clock divider
#define SYSCON_SPIFICLKDIV          *&H40000390   ' SPIFI clock divider register
#define SYSCON_ADCCLKDIV            *&H40000394   ' ADC Clock divider register
#define SYSCON_USB0CLKDIV           *&H40000398   ' USB 0 Clock divider register
#define SYSCON_USB1CLKDIV           *&H4000039C   ' USB 1 Clock divider register
#define SYSCON_FRGCTRL              *&H400003A0   ' Fraction Rate Generator Ctrl register
#define SYSCON_DMICCLKDIV           *&H400003A8   ' DMIC Clock divider register
#define SYSCON_MCLKDIV              *&H400003AC   ' I2S MClock divider register
#define SYSCON_LCDCLKDIV            *&H400003B0   ' LCD Controller Clock divide
#define SYSCON_SCTCLKDIV            *&H400003B4   ' SCT/PWM Clock divide
#define SYSCON_EMCCLKDIV            *&H400003B8   ' EMC Clock divide
#define SYSCON_SDIOCLKDIV           *&H400003BC   ' SDIO Clock Divide
#define SYSCON_RESERVED_FLASHCFG    *&H40000400   ' 546xx, not 540xx Flash wait state configuration register
#define SYSCON_USB0CLKCTRL          *&H4000040C   ' USB Clock control register
#define SYSCON_USB0CLKSTAT          *&H40000410   ' USB Clock Status register
#define SYSCON_FREQMECTRL           *&H40000418   ' Frequency measure register
#define SYSCON_MCLKIO               *&H40000420   ' MCLK Input Output register
#define SYSCON_USB1CLKCTRL          *&H40000424   ' USB1 Clock Control register
#define SYSCON_USB1CLKSTAT          *&H40000428   ' USB1 Clock Status register
#define SYSCON_EMCSYSCTRL           *&H40000444   ' EMC System Control register
#define SYSCON_EMCDLYCTRL           *&H40000448   ' EMC Clock Delay Control register
#define SYSCON_EMCDLYCAL            *&H4000044C   ' EMC Clock Delay Chain Calibration register
#define SYSCON_ETHPHYSEL            *&H40000450   ' Ethernet Phy Selection register
#define SYSCON_ETHSBDCTRL           *&H40000454   ' Ethernet SBD Flow Control register
#define SYSCON_SDIOCLKCTRL          *&H40000460   ' SDIO Clock Control register
#define SYSCON_FROCTRL              *&H40000500   ' FRO oscillator control register
#define SYSCON_SYSOSCCTRL           *&H40000504   ' System oscillator control register
#define SYSCON_WDTOSCCTRL           *&H40000508   ' Watchdog Oscillator control
#define SYSCON_RTCOSCCTRL           *&H4000050C   ' RTC Oscillator control register
#define SYSCON_USBPLLCTRL           *&H4000051C   ' USB PLL control register
#define SYSCON_USBPLLSTAT           *&H40000520   ' USB PLL status register
#define SYSCON_SYSPLLCTRL           *&H40000580   ' System PLL control register
#define SYSCON_SYSPLLSTAT           *&H40000584   ' System PLL status register
#define SYSCON_SYSPLLNDEC           *&H40000588   ' System PLL N-DEC register
#define SYSCON_SYSPLLPDEC           *&H4000058C   ' System PLL P-DEC register
#define SYSCON_SYSPLLMDEC           *&H40000590
#define SYSCON_AUDPLLCTRL           *&H400005A0   ' Audio PLL control register
#define SYSCON_AUDPLLSTAT           *&H400005A4   ' Audio PLL status register
#define SYSCON_AUDPLLNDEC           *&H400005A8   ' Audio PLL N-DEC register
#define SYSCON_AUDPLLPDEC           *&H400005AC   ' Audio PLL P-DEC register
#define SYSCON_AUDPLLMDEC           *&H400005B0   ' Audio PLL M-DEC register
#define SYSCON_AUDPLLFRAC           *&H400005B4   ' Audio PLL Fractional divider control register
#define SYSCON_PDRUNCFG0            *&H40000610   ' Power Down configuration registers
#define SYSCON_PDRUNCFG1            *&H40000614   ' Power Down configuration registers
#define SYSCON_PDRUNCFGSET0         *&H40000620   ' Power down configuartion set register
#define SYSCON_PDRUNCFGSET1         *&H40000624   ' Power down configuartion set register
#define SYSCON_PDRUNCFGCLR0         *&H40000630   ' Power down configuartion clear register
#define SYSCON_PDRUNCFGCLR1         *&H40000634   ' Power down configuartion clear register
#define SYSCON_STARTERP0            *&H40000680   ' Start logic wakeup enable register
#define SYSCON_STARTERP1            *&H40000684   ' Start logic wakeup enable register
#define SYSCON_STARTERPSET0         *&H400006A0   ' Start logic wakeup enable set register
#define SYSCON_STARTERPSET1         *&H400006A4   ' Start logic wakeup enable set register
#define SYSCON_STARTERPCLR0         *&H400006C0   ' Start logic wakeup enable clear register
#define SYSCON_STARTERPCLR1         *&H400006C4   ' Start logic wakeup enable clear register
#define SYSCON_HWWAKE               *&H40000780   ' Special Hardware Wake register
#define SYSCON_JTAGIDCODE           *&H40000FF4   ' JTAG ID Code register
#define SYSCON_DEVICE_ID0           *&H40000FF8   ' Device ID Registers
#define SYSCON_DEVICE_ID1           *&H40000FFC   ' Device ID Registers


' Asynchronous system configuration register block structure
#define ASYNC_SYSCON_AYSNCPRESETCTRL     *&H40040000    ' peripheral reset register
#define ASYNC_SYSCON_ASYNCPRESETCTRLSET  *&H40040004    ' peripheral reset Set register
#define ASYNC_SYSCON_ASYNCPRESETCTRLCLR  *&H40040008    ' peripheral reset Clr register
#define ASYNC_SYSCON_ASYNCAPBCLKCTRL     *&H40040010    ' clk enable register
#define ASYNC_SYSCON_ASYNCAPBCLKCTRLSET  *&H40040014    ' clk enable Set register
#define ASYNC_SYSCON_ASYNCAPBCLKCTRLCLR  *&H40040018    ' clk enable Clr register
#define LPC_ASYNC_SYSCON_ASYNCAPBCLKSELA     *&H40040020    ' clk source mux A register


#define SYSCON_PDRUNCFG_PD_SRAM0         (1 << 14)        ' SRAM0
#define SYSCON_PDRUNCFG_PD_SRAM1         (1 << 15)        ' SRAM1
#define SYSCON_PDRUNCFG_PD_USB_RAM       (1 << 16)        ' USB RAM

#define SYSCON_FROCTRL_MASK            ((1 << 15) | (0xF << 26))  ' MASK for reserved bits in FROCTRL register
#define SYSCON_FROCTRL_WRTRIM          (1UL << 31)   ' Enable Writes to FROCTRL register
#define SYSCON_FROCTRL_HSPDCLK         (1UL << 30)   ' High speed clock (FROHF) enable bit
#define SYSCON_FROCTRL_USBMODCHG       (1UL << 25)   ' When set Trim value is pending to be set by SOF from USB
#define SYSCON_FROCTRL_USBCLKADJ       (1UL << 24)   ' Automatically adjust FRO trim value based on SOF from USB
#define SYSCON_FROCTRL_SEL96MHZ        (1UL << 14)   ' When set FROHF will be 96MHz else FROHF will be 48MHz


'GPIO port register block structure
' GET THESE
#define GPIO_B(x)    *(&H4008C000+x)      ' // Byte pin registers port 0/1 */
#define GPIO_B0(x)   *(&H4008C000+x)      ' // Byte pin registers port 0 pins PIO0_0 to PIO0_31 */
#define GPIO_B1(x)   *(&H4008C020+x)      ' // Byte pin registers port 1 */
#define GPIO_W(x)    *(&H4008D000+(x<<2)) ' // Word pin registers port 0/1 */
#define GPIO_W0(x)   *(&H4008D000+(x<<2)) ' // Word pin registers port 0 */
#define GPIO_W1(x)   *(&H4008D080+(x<<2)) ' // Word pin registers port 1 */
#define GPIO_DIR(x)	 *(&H4008E000+(x<<2)) ' // Direction registers port n 
#define GPIO_MASK(x) *(&H4008E080+(x<<2)) ' // Mask register port n 
#define GPIO_PIN(x)	 *(&H4008E100+(x<<2)) ' // Portpin register port n 
#define GPIO_MPIN(x) *(&H4008E180+(x<<2)) ' // Masked port register port n 
#define GPIO_SET(x)	 *(&H4008E200+(x<<2)) ' // Write: Set register for port n Read: output bits for port n
#define GPIO_CLR(x)	 *(&H4008E280+(x<<2)) ' // Clear port n 
#define GPIO_NOT(x)	 *(&H4008E300+(x<<2)) ' // Toggle port n 

#define GPIO0_DIR    *&H4008E000     ' Direction registers port n
#define GPIO0_MASK   *&H4008E080     ' Mask register port n
#define GPIO0_PIN    *&H4008E100     ' Portpin register port n
#define GPIO0_MPIN   *&H4008E180     ' Masked port register port n
#define GPIO0_SET    *&H4008E200     ' Write: Set register for port n Read: output bits for port n
#define GPIO0_CLR    *&H4008E280     ' Clear port n
#define GPIO0_NOT    *&H4008E300     ' Toggle port n

#define GPIO1_DIR    *&H4008E004     ' Direction registers port n
#define GPIO1_MASK   *&H4008E084     ' Mask register port n
#define GPIO1_PIN    *&H4008E104     ' Portpin register port n
#define GPIO1_MPIN   *&H4008E184     ' Masked port register port n
#define GPIO1_SET    *&H4008E204     ' Write: Set register for port n Read: output bits for port n
#define GPIO1_CLR    *&H4008E284     ' Clear port n
#define GPIO1_NOT    *&H4008E304     ' Toggle port n


'External Memory Controller(EMC) register block structure
#define EMC_CONTROL              *&H40081000       ' Controls operation of the memory controller.
#define EMC_STATUS               *&H40081004       ' Provides EMC status information.
#define EMC_CONFIG               *&H40081008       ' Configures operation of the memory controller.
#define EMC_DYNAMICCONTROL       *&H40081020       ' Controls dynamic memory operation.
#define EMC_DYNAMICREFRESH       *&H40081024       ' Configures dynamic memory refresh operation.
#define EMC_DYNAMICREADCONFIG    *&H40081028       ' Configures the dynamic memory read strategy.
#define EMC_DYNAMICRP            *&H40081030       ' Selects the precharge command period.
#define EMC_DYNAMICRAS           *&H40081034       ' Selects the active to precharge command period.
#define EMC_DYNAMICSREX          *&H40081038       ' Selects the self-refresh exit time.
#define EMC_DYNAMICAPR           *&H4008103C       ' Selects the last-data-out to active command time.
#define EMC_DYNAMICDAL           *&H40081040       ' Selects the data-in to active command time.
#define EMC_DYNAMICWR            *&H40081044       ' Selects the write recovery time.
#define EMC_DYNAMICRC            *&H40081048       ' Selects the active to active command period.
#define EMC_DYNAMICRFC           *&H4008104C       ' Selects the auto-refresh period.
#define EMC_DYNAMICXSR           *&H40081050       ' Selects the exit self-refresh to active command time.
#define EMC_DYNAMICRRD           *&H40081054       ' Selects the active bank A to active bank B latency.
#define EMC_DYNAMICMRD           *&H40081058       ' Selects the load mode register to active command time.
#define EMC_STATICEXTENDEDWAIT   *&H40081080       ' Selects time for long static memory read and write transfers.
#define EMC_DYNAMICCONFIG0       *&H40081100       ' Selects the configuration information for dynamic memory chip select n.
#define EMC_DYNAMICRASCAS0       *&H40081104       ' Selects the RAS and CAS latencies for dynamic memory chip select n.
#define EMC_DYNAMICCONFIG1       *&H40081120       ' Selects the configuration information for dynamic memory chip select n.
#define EMC_DYNAMICRASCAS1       *&H40081124       ' Selects the RAS and CAS latencies for dynamic memory chip select n.
#define EMC_DYNAMICCONFIG2       *&H40081140       ' Selects the configuration information for dynamic memory chip select n.
#define EMC_DYNAMICRASCAS2       *&H40081144       ' Selects the RAS and CAS latencies for dynamic memory chip select n.
#define EMC_DYNAMICCONFIG3       *&H40081160       ' Selects the configuration information for dynamic memory chip select n.
#define EMC_DYNAMICRASCAS3       *&H40081164       ' Selects the RAS and CAS latencies for dynamic memory chip select n.
#define EMC_STATICCONFIG0        *&H40081200       ' Selects the memory configuration for static chip select n.
#define EMC_STATICWAITWEN0       *&H40081204       ' Selects the delay from chip select n to write enable.
#define EMC_STATICWAITOEN0       *&H40081208       ' Selects the delay from chip select n or address change, whichever is later, to output enable.
#define EMC_STATICWAITRD0        *&H4008120C       ' Selects the delay from chip select n to a read access.
#define EMC_STATICWAITPAG0       *&H40081210       ' Selects the delay for asynchronous page mode sequential accesses for chip select n.
#define EMC_STATICWAITWR0        *&H40081214       ' Selects the delay from chip select n to a write access.
#define EMC_STATICWAITTURN0      *&H40081218       ' Selects bus turnaround cycles
#define EMC_STATICCONFIG1        *&H40081220       ' Selects the memory configuration for static chip select n.
#define EMC_STATICWAITWEN1       *&H40081224       ' Selects the delay from chip select n to write enable.
#define EMC_STATICWAITOEN1       *&H40081228       ' Selects the delay from chip select n or address change, whichever is later, to output enable.
#define EMC_STATICWAITRD1        *&H4008122C       ' Selects the delay from chip select n to a read access.
#define EMC_STATICWAITPAG1       *&H40081230       ' Selects the delay for asynchronous page mode sequential accesses for chip select n.
#define EMC_STATICWAITWR1        *&H40081234       ' Selects the delay from chip select n to a write access.
#define EMC_STATICWAITTURN1      *&H40081238       ' Selects bus turnaround cycles
#define EMC_STATICCONFIG2        *&H40081240       ' Selects the memory configuration for static chip select n.
#define EMC_STATICWAITWEN2       *&H40081244       ' Selects the delay from chip select n to write enable.
#define EMC_STATICWAITOEN2       *&H40081248       ' Selects the delay from chip select n or address change, whichever is later, to output enable.
#define EMC_STATICWAITRD2        *&H4008124C       ' Selects the delay from chip select n to a read access.
#define EMC_STATICWAITPAG2       *&H40081250       ' Selects the delay for asynchronous page mode sequential accesses for chip select n.
#define EMC_STATICWAITWR2        *&H40081254       ' Selects the delay from chip select n to a write access.
#define EMC_STATICWAITTURN2      *&H40081258       ' Selects bus turnaround cycles
#define EMC_STATICCONFIG3        *&H40081260       ' Selects the memory configuration for static chip select n.
#define EMC_STATICWAITWEN3       *&H40081264       ' Selects the delay from chip select n to write enable.
#define EMC_STATICWAITOEN3       *&H40081268       ' Selects the delay from chip select n or address change, whichever is later, to output enable.
#define EMC_STATICWAITRD3        *&H4008126C       ' Selects the delay from chip select n to a read access.
#define EMC_STATICWAITPAG3       *&H40081270       ' Selects the delay for asynchronous page mode sequential accesses for chip select n.
#define EMC_STATICWAITWR3        *&H40081274       ' Selects the delay from chip select n to a write access.
#define EMC_STATICWAITTURN3      *&H40081278       ' Selects bus turnaround cycles


' IO Configuration Unit register block structure
#define IOCON_PIO0_0    *&H40001000
#define IOCON_PIO0_1    *&H40001004
#define IOCON_PIO0_2    *&H40001008
#define IOCON_PIO0_3    *&H4000100C
#define IOCON_PIO0_4    *&H40001010
#define IOCON_PIO0_5    *&H40001014
#define IOCON_PIO0_6    *&H40001018
#define IOCON_PIO0_7    *&H4000101C
#define IOCON_PIO0_8    *&H40001020
#define IOCON_PIO0_9    *&H40001024
#define IOCON_PIO0_10   *&H40001028
#define IOCON_PIO0_11   *&H4000102C
#define IOCON_PIO0_12   *&H40001030
#define IOCON_PIO0_13   *&H40001034
#define IOCON_PIO0_14   *&H40001038
#define IOCON_PIO0_15   *&H4000103C
#define IOCON_PIO0_16   *&H40001040
#define IOCON_PIO0_17   *&H40001044
#define IOCON_PIO0_18   *&H40001048
#define IOCON_PIO0_19   *&H4000104C
#define IOCON_PIO0_20   *&H40001050
#define IOCON_PIO0_21   *&H40001054
#define IOCON_PIO0_22   *&H40001058
#define IOCON_PIO0_23   *&H4000105C
#define IOCON_PIO0_24   *&H40001060
#define IOCON_PIO0_25   *&H40001064
#define IOCON_PIO0_26   *&H40001068
#define IOCON_PIO0_27   *&H4000106C
#define IOCON_PIO0_28   *&H40001070
#define IOCON_PIO0_29   *&H40001074
#define IOCON_PIO0_30   *&H40001078
#define IOCON_PIO0_31   *&H4000107C
#define IOCON_PIO1_0    *&H40001080
#define IOCON_PIO1_1    *&H40001084
#define IOCON_PIO1_2    *&H40001088
#define IOCON_PIO1_3    *&H4000108C
#define IOCON_PIO1_4    *&H40001090
#define IOCON_PIO1_5    *&H40001094
#define IOCON_PIO1_6    *&H40001098
#define IOCON_PIO1_7    *&H4000109C
#define IOCON_PIO1_8    *&H400010A0
#define IOCON_PIO1_9    *&H400010A4
#define IOCON_PIO1_10   *&H400010A8
#define IOCON_PIO1_11   *&H400010AC
#define IOCON_PIO1_12   *&H400010B0
#define IOCON_PIO1_13   *&H400010B4
#define IOCON_PIO1_14   *&H400010B8
#define IOCON_PIO1_15   *&H400010BC
#define IOCON_PIO1_16   *&H400010C0
#define IOCON_PIO1_17   *&H400010C4
#define IOCON_PIO1_18   *&H400010C8
#define IOCON_PIO1_19   *&H400010CC
#define IOCON_PIO1_20   *&H400010D0
#define IOCON_PIO1_21   *&H400010D4
#define IOCON_PIO1_22   *&H400010D8
#define IOCON_PIO1_23   *&H400010DC
#define IOCON_PIO1_24   *&H400010E0
#define IOCON_PIO1_25   *&H400010E4
#define IOCON_PIO1_26   *&H400010E8
#define IOCON_PIO1_27   *&H400010EC
#define IOCON_PIO1_28   *&H400010F0
#define IOCON_PIO1_29   *&H400010F4
#define IOCON_PIO1_30   *&H400010F8
#define IOCON_PIO1_31   *&H400010FC
  

'IOCON function and mode selection definitions
'See the User Manual for specific modes and functions supported by the various LPC15XX pins.

#define IOCON_FUNC0             0x0               ' Selects pin function 0
#define IOCON_FUNC1             0x1               ' Selects pin function 1
#define IOCON_FUNC2             0x2               ' Selects pin function 2
#define IOCON_FUNC3             0x3               ' Selects pin function 3
#define IOCON_FUNC4             0x4               ' Selects pin function 4
#define IOCON_FUNC5             0x5               ' Selects pin function 5
#define IOCON_FUNC6             0x6               ' Selects pin function 6
#define IOCON_FUNC7             0x7               ' Selects pin function 7
#define IOCON_FUNC8             0x8               ' Selects pin function 8
#define IOCON_FUNC9             0x9               ' Selects pin function 9
#define IOCON_FUNC10            0xA               ' Selects pin function 10
#define IOCON_FUNC11            0xB               ' Selects pin function 11
#define IOCON_FUNC12            0xC               ' Selects pin function 12
#define IOCON_FUNC13            0xD               ' Selects pin function 13
#define IOCON_FUNC14            0xE               ' Selects pin function 14
#define IOCON_FUNC15            0xF               ' Selects pin function 15
#define IOCON_MODE_INACT        (0x0 << 4)        ' No addition pin function
#define IOCON_MODE_PULLDOWN     (0x1 << 4)        ' Selects pull-down function
#define IOCON_MODE_PULLUP       (0x2 << 4)        ' Selects pull-up function
#define IOCON_MODE_REPEATER     (0x3 << 4)        ' Selects pin repeater function
#define IOCON_HYS_EN            (0x1 << 6)        ' Enables hysteresis
#define IOCON_GPIO_MODE         (0x1 << 6)        ' GPIO Mode
#define IOCON_I2C_SLEW          (0x1 << 6)        ' I2C Slew Rate Control
#define IOCON_INV_EN            (0x1 << 7)        ' Enables invert function on input
#define IOCON_ANALOG_EN         (0x0 << 8)        ' Enables analog function by setting 0 to bit 7
#define IOCON_DIGITAL_EN        (0x1 << 8)        ' Enables digital function by setting 1 to bit 7(default)
#define IOCON_STDI2C_EN         (0x1 << 9)        ' I2C standard mode/fast-mode
#define IOCON_FASTI2C_EN        (0x3 << 9)        ' I2C Fast-mode Plus and high-speed slave
#define IOCON_INPFILT_OFF       (0x1 << 9)        ' Input filter Off for GPIO pins
#define IOCON_INPFILT_ON        (0x0 << 9)        ' Input filter On for GPIO pins
#define IOCON_HIGH_SPEED_EN     (0x1 << 10)       ' High speed enable
#define IOCON_OPENDRAIN_EN      (0x1 << 11)       ' Enables open-drain function
#define IOCON_S_MODE_0CLK       (0x0 << 12)       ' Bypass input filter
#define IOCON_S_MODE_1CLK       (0x1 << 12)       ' Input pulses shorter than 1 filter clock are rejected
#define IOCON_S_MODE_2CLK       (0x2 << 12)       ' Input pulses shorter than 2 filter clock2 are rejected
#define IOCON_S_MODE_3CLK       (0x3 << 12)       ' Input pulses shorter than 3 filter clock2 are rejected
#define IOCON_S_MODE(clks)      ((clks) << 12)    ' Select clocks for digital input filter mode
#define IOCON_CLKDIV(div)       ((div) << 14)     ' Select peripheral clock divider for input filter sampling clock, 2^n, n=0-6


'32-bit Standard timer register block structure
#define TIMER0_IR    *&H40008000         ' Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending.
#define TIMER0_TCR   *&H40008004         ' Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR.
#define TIMER0_TC    *&H40008008         ' Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR.
#define TIMER0_PR    *&H4000800C         ' Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC.
#define TIMER0_PC    *&H40008010         ' Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface.
#define TIMER0_MCR   *&H40008014         ' Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs.
#define TIMER0_MR0   *&H40008018         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER0_MR1   *&H4000801C         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER0_MR2   *&H40008020         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER0_MR3   *&H40008024         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER0_CCR   *&H40008028         ' Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place.
#define TIMER0_CR0   *&H4000802C         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER0_CR1   *&H40008030         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER0_CR2   *&H40008034         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER0_CR3   *&H40008038         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER0_EMR   *&H4000803C         ' External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively).
#define TIMER0_CTCR  *&H40008070         ' Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting.
#define TIMER0_PWMC  *&H40008074
#define TIMER0_MSR0  *&H40008078         ' Match Shadow Register added LPC540xx
#define TIMER0_MSR1  *&H4000807C
#define TIMER0_MSR2  *&H40008080
#define TIMER0_MSR3  *&H40008084

#define TIMER1_IR    *&H40009000         ' Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending.
#define TIMER1_TCR   *&H40009004         ' Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR.
#define TIMER1_TC    *&H40009008         ' Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR.
#define TIMER1_PR    *&H4000900C         ' Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC.
#define TIMER1_PC    *&H40009010         ' Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface.
#define TIMER1_MCR   *&H40009014         ' Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs.
#define TIMER1_MR0   *&H40009018         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER1_MR1   *&H4000901C         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER1_MR2   *&H40009020         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER1_MR3   *&H40009024         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER1_CCR   *&H40009028         ' Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place.
#define TIMER1_CR0   *&H4000902C         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER1_CR1   *&H40009030         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER1_CR2   *&H40009034         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER1_CR3   *&H40009038         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER1_EMR   *&H4000903C         ' External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively).
#define TIMER1_CTCR  *&H40009070         ' Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting.
#define TIMER1_PWMC  *&H40009074
#define TIMER1_MSR0  *&H40009078         ' Match Shadow Register added LPC540xx
#define TIMER1_MSR1  *&H4000907C
#define TIMER1_MSR2  *&H40009080
#define TIMER1_MSR3  *&H40009084

#define TIMER2_IR    *&H40028000         ' Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending.
#define TIMER2_TCR   *&H40028004         ' Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR.
#define TIMER2_TC    *&H40028008         ' Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR.
#define TIMER2_PR    *&H4002800C         ' Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC.
#define TIMER2_PC    *&H40028010         ' Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface.
#define TIMER2_MCR   *&H40028014         ' Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs.
#define TIMER2_MR0   *&H40028018         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER2_MR1   *&H4002801C         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER2_MR2   *&H40028020         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER2_MR3   *&H40028024         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER2_CCR   *&H40028028         ' Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place.
#define TIMER2_CR0   *&H4002802C         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER2_CR1   *&H40028030         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER2_CR2   *&H40028034         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER2_CR3   *&H40028038         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER2_EMR   *&H4002803C         ' External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively).
#define TIMER2_CTCR  *&H40028070         ' Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting.
#define TIMER2_PWMC  *&H40028074
#define TIMER2_MSR0  *&H40028078         ' Match Shadow Register added LPC540xx
#define TIMER2_MSR1  *&H4002807C
#define TIMER2_MSR2  *&H40028080
#define TIMER2_MSR3  *&H40028084

#define TIMER3_IR    *&H40048000         ' Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending.
#define TIMER3_TCR   *&H40048004         ' Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR.
#define TIMER3_TC    *&H40048008         ' Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR.
#define TIMER3_PR    *&H4004800C         ' Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC.
#define TIMER3_PC    *&H40048010         ' Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface.
#define TIMER3_MCR   *&H40048014         ' Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs.
#define TIMER3_MR0   *&H40048018         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER3_MR1   *&H4004801C         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER3_MR2   *&H40048020         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER3_MR3   *&H40048024         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER3_CCR   *&H40048028         ' Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place.
#define TIMER3_CR0   *&H4004802C         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER3_CR1   *&H40048030         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER3_CR2   *&H40048034         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER3_CR3   *&H40048038         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER3_EMR   *&H4004803C         ' External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively).
#define TIMER3_CTCR  *&H40048070         ' Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting.
#define TIMER3_PWMC  *&H40048074
#define TIMER3_MSR0  *&H40048078         ' Match Shadow Register added LPC540xx
#define TIMER3_MSR1  *&H4004807C
#define TIMER3_MSR2  *&H40048080
#define TIMER3_MSR3  *&H40048084

#define TIMER4_IR    *&H40049000         ' Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending.
#define TIMER4_TCR   *&H40049004         ' Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR.
#define TIMER4_TC    *&H40049008         ' Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR.
#define TIMER4_PR    *&H4004900C         ' Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC.
#define TIMER4_PC    *&H40049010         ' Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface.
#define TIMER4_MCR   *&H40049014         ' Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs.
#define TIMER4_MR0   *&H40049018         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER4_MR1   *&H4004901C         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER4_MR2   *&H40049020         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER4_MR3   *&H40049024         ' Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC.
#define TIMER4_CCR   *&H40049028         ' Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place.
#define TIMER4_CR0   *&H4004902C         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER4_CR1   *&H40049030         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER4_CR2   *&H40049034         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER4_CR3   *&H40049038         ' Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input.
#define TIMER4_EMR   *&H4004903C         ' External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively).
#define TIMER4_CTCR  *&H40049070         ' Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting.
#define TIMER4_PWMC  *&H40049074
#define TIMER4_MSR0  *&H40049078         ' Match Shadow Register added LPC540xx
#define TIMER4_MSR1  *&H4004907C
#define TIMER4_MSR2  *&H40049080
#define TIMER4_MSR3  *&H40049084


' SPI Flash Interface (SPIFI)
#define SPIFI_CTRL    *&H40080000    ' Control register
#define SPIFI_CMD     *&H40080004    ' Command register
#define SPIFI_ADDR    *&H40080008    ' Address register
#define SPIFI_DATINTM *&H4008000C    ' Intermediate data register
#define SPIFI_CLIMIT  *&H40080010    ' Address and intermediate data register
#define SPIFI_DAT     *&H40080014    ' Data register   
#define SPIFI_MEMCMD  *&H40080018    ' Memory command register
#define SPIFI_STAT    *&H4008001C    ' Status register 


'ADC register block structure
#define ADC_CTRL        *&H400A0000
#define ADC_INSEL       *&H400A0004
#define ADC_SEQ_CTRL0   *&H400A0008
#define ADC_SEQ_CTRL1   *&H400A000C
#define ADC_SEQ_GDAT0   *&H400A0010
#define ADC_SEQ_GDAT1   *&H400A0014
#define ADC_DAT0        *&H400A0020
#define ADC_DAT1        *&H400A0024
#define ADC_DAT2        *&H400A0028
#define ADC_DAT3        *&H400A002C
#define ADC_DAT4        *&H400A0030
#define ADC_DAT5        *&H400A0034
#define ADC_DAT6        *&H400A0038
#define ADC_DAT7        *&H400A003C
#define ADC_DAT8        *&H400A0040
#define ADC_DAT9        *&H400A0044
#define ADC_DAT10       *&H400A0048
#define ADC_DAT11       *&H400A004C
#define ADC_THR_LOW0    *&H400A0050
#define ADC_THR_LOW1    *&H400A0054
#define ADC_THR_HIGH0   *&H400A0058
#define ADC_THR_HIGH1   *&H400A005C
#define ADC_CHAN_THRSEL *&H400A0060
#define ADC_INTEN       *&H400A0064
#define ADC_FLAGS       *&H400A0068
#define ADC_STARTUP     *&H400A006C
#define ADC_CALIBR      *&H400A0070


'SD/MMC & SDIO register block structure
#define SDMMC_CTRL       *&H4009B000  ' Control. 0 30.6.1
#define SDMMC_PWREN      *&H4009B004  ' Power enable. 0 30.6.2
#define SDMMC_CLKDIV     *&H4009B008  ' Clock divider. 0 30.6.3
#define SDMMC_RSRV1      *&H4009B00C  ' 
#define SDMMC_CLKENA     *&H4009B010  ' Clock enable. 0 30.6.4
#define SDMMC_TMOUT      *&H4009B014  ' Time-out. 0xFFFF FF40 30.6.5
#define SDMMC_CTYPE      *&H4009B018  ' Card type. 0 30.6.6
#define SDMMC_BLKSIZ     *&H4009B01C  ' Block size. 0x200 30.6.7
#define SDMMC_BYTCNT     *&H4009B020  ' Byte count. 0x200 30.6.8
#define SDMMC_INTMASK    *&H4009B024  ' Interrupt mask. 0 30.6.9
#define SDMMC_CMDARG     *&H4009B028  ' Command argument. 0 30.6.10
#define SDMMC_CMD        *&H4009B02C  ' Command. 0 30.6.11
#define SDMMC_RESP0      *&H4009B030  ' Response 0. 0 30.6.12
#define SDMMC_RESP1      *&H4009B034  ' Response 1. 0 30.6.13
#define SDMMC_RESP2      *&H4009B038  ' Response 2. 0 30.6.14
#define SDMMC_RESP3      *&H4009B03C  ' Response 3. 0 30.6.15
#define SDMMC_MINTSTS    *&H4009B040  ' Masked interrupt status. 0 30.6.16
#define SDMMC_RINTSTS    *&H4009B044  ' Raw interrupt status. 0 30.6.17
#define SDMMC_STATUS     *&H4009B048  ' Status. 0x406 30.6.18
#define SDMMC_FIFOTH     *&H4009B04C  ' FIFO threshold watermark. 0x0F80 0000 30.6.19
#define SDMMC_CDETECT    *&H4009B050  ' Card detect. 0 30.6.20
#define SDMMC_WRTPRT     *&H4009B054  ' Write protect. 0 30.6.21
#define SDMMC_RSRV2      *&H4009B058  '
#define SDMMC_TCBCNT     *&H4009B05C  ' Transferred CIU card byte count. 0 30.6.22
#define SDMMC_TBBCNT     *&H4009B060  ' Transferred host to BIU-FIFO byte count. 0 30.6.23
#define SDMMC_DEBNCE     *&H4009B064  ' Debounce count. 0xFFFFFF 30.6.24
#define SDMMC_RST_N      *&H4009B068  ' Hardware reset. 0x1 30.6.25
#define SDMMC_RSRV3      *&H4009B06C  '
#define SDMMC_BMOD       *&H4009B070  ' Bus mode. 0 30.6.26
#define SDMMC_PLDMND     *&H4009B074  ' Poll demand. 0 30.6.27
#define SDMMC_DBADDR     *&H4009B078  ' Descriptor list base address. 0 30.6.28
#define SDMMC_IDSTS      *&H4009B07C  ' Internal DMAC status. 0 30.6.29
#define SDMMC_IDINTEN    *&H4009B080  ' Internal DMAC interrupt enable. 0 30.6.30
#define SDMMC_DSCADDR    *&H4009B084  ' Current host descriptor address. 0 30.6.31
#define SDMMC_BUFADDR    *&H4009B088  ' Current buffer descriptor address. 0 30.6.32
#define SDMMC_RSRV4      *&H4009B08C  '
#define SDMMC_CARDTHRCTL *&H4009B090  ' Card threshold control. Controls whether the host controller initiates transfers depending on the FIFO level.0 30.6.33
#define SDMMC_BACKENDPWR *&H4009B094  ' Power control. 0 30.6.34


'CRC register block structure
#define CRC_MODE     *&H40095000    ' CRC Mode Register
#define CRC_SEED     *&H40095004    ' CRC SEED Register
#define CRC_SUM      *&H40095008    ' CRC Checksum Register.
#define CRC_WRDATA32 *&H40095008    ' CRC Data Register: write size 32-bit*/
#define CRC_WRDATA16 *&H40095008    ' CRC Data Register: write size 16-bit*/
#define CRC_WRDATA8  *&H40095008    ' CRC Data Register: write size 8-bit*/


'State Configurable Timer register block structure
#define SCT_CONFIG           *&H40085000  ' Configuration Register
#define SCT_CTRL_U           *&H40085004  ' Control Register
#define SCT_LIMIT_L          *&H40085008  ' limit register for counter L
#define SCT_LIMIT_H          *&H4008500A  ' limit register for counter H
#define SCT_HALT_L           *&H4008500C  ' halt register for counter L
#define SCT_HALT_H           *&H4008500E  ' halt register for counter H
#define SCT_STOP_L           *&H40085010  ' stop register for counter L
#define SCT_STOP_H           *&H40085012  ' stop register for counter H
#define SCT_START_L          *&H40085014  ' start register for counter L
#define SCT_START_H          *&H40085016  ' start register for counter H
#define SCT_COUNT_U          *&H40085040  ' counter register
#define SCT_STATE_L          *&H40085044  ' state register for counter L
#define SCT_STATE_H          *&H40085046  ' state register for counter H
#define SCT_INPUT            *&H40085048  ' input register
#define SCT_REGMODE_L        *&H4008504C  ' match - capture registers mode register L
#define SCT_REGMODE_H        *&H4008504E  ' match - capture registers mode register H
#define SCT_OUTPUT           *&H40085050  ' output register
#define SCT_OUTPUTDIRCTRL    *&H40085054  ' output counter direction Control Register
#define SCT_RES              *&H40085058  ' conflict resolution register
#define SCT_DMA0REQUEST      *&H4008505C  ' DMA0 Request Register
#define SCT_DMA1REQUEST      *&H40085060  ' DMA1 Request Register
#define SCT_EVEN             *&H400850F0  ' event enable register
#define SCT_EVFLAG           *&H400850F4  ' event flag register
#define SCT_CONEN            *&H400850F8  ' conflict enable register
#define SCT_CONFLAG          *&H400850FC  ' conflict flag register
#define SCT_MATCH0_U         *&H40085100  ' ... Match  value
#define SCT_MATCH1_U         *&H40085104
#define SCT_MATCH2_U         *&H40085108
#define SCT_MATCH3_U         *&H4008510C
#define SCT_MATCH4_U         *&H40085110
#define SCT_MATCH5_U         *&H40085114
#define SCT_MATCH6_U         *&H40085118
#define SCT_MATCH7_U         *&H4008511C
#define SCT_MATCH8_U         *&H40085120
#define SCT_MATCH9_U         *&H40085124
#define SCT_MATCH10_U        *&H40085128
#define SCT_MATCH11_U        *&H4008512C
#define SCT_MATCH12_U        *&H40085130
#define SCT_CAP0_U           *&H40085100  ' ... Capture value
#define SCT_CAP1_U           *&H40085104
#define SCT_CAP2_U           *&H40085108
#define SCT_CAP3_U           *&H4008510C
#define SCT_CAP4_U           *&H40085110
#define SCT_CAP5_U           *&H40085114
#define SCT_CAP6_U           *&H40085118
#define SCT_CAP7_U           *&H4008511C
#define SCT_CAP8_U           *&H40085120
#define SCT_CAP9_U           *&H40085124
#define SCT_CAP10_U          *&H40085128
#define SCT_CAP11_U          *&H4008512C
#define SCT_CAP12_U          *&H40085130
#define SCT_MATCHREL0_U      *&H40085200  ' Match Reload
#define SCT_MATCHREL1_U      *&H40085204
#define SCT_MATCHREL2_U      *&H40085208
#define SCT_MATCHREL3_U      *&H4008520C
#define SCT_MATCHREL4_U      *&H40085210
#define SCT_MATCHREL5_U      *&H40085214
#define SCT_MATCHREL6_U      *&H40085218
#define SCT_MATCHREL7_U      *&H4008521C
#define SCT_MATCHREL8_U      *&H40085220
#define SCT_MATCHREL9_U      *&H40085224
#define SCT_MATCHREL10_U     *&H40085228
#define SCT_MATCHREL11_U     *&H4008522C
#define SCT_MATCHREL12_U     *&H40085230
#define SCT_CAPCTRL0_U       *&H40085200  ' Capture Control value
#define SCT_CAPCTRL1_U       *&H40085204
#define SCT_CAPCTRL2_U       *&H40085208
#define SCT_CAPCTRL3_U       *&H4008520C
#define SCT_CAPCTRL4_U       *&H40085210
#define SCT_CAPCTRL5_U       *&H40085214
#define SCT_CAPCTRL6_U       *&H40085218
#define SCT_CAPCTRL7_U       *&H4008521C
#define SCT_CAPCTRL8_U       *&H40085220
#define SCT_CAPCTRL9_U       *&H40085224
#define SCT_CAPCTRL10_U      *&H40085228
#define SCT_CAPCTRL11_U      *&H4008522C
#define SCT_CAPCTRL12_U      *&H40085230
#define SCT_EVENT0_STATE     *&H40085300  ' Event State Register
#define SCT_EVENT1_STATE     *&H40085308
#define SCT_EVENT2_STATE     *&H40085310
#define SCT_EVENT3_STATE     *&H40085318
#define SCT_EVENT4_STATE     *&H40085320
#define SCT_EVENT5_STATE     *&H40085328
#define SCT_EVENT6_STATE     *&H40085330
#define SCT_EVENT7_STATE     *&H40085338
#define SCT_EVENT8_STATE     *&H40085340
#define SCT_EVENT9_STATE     *&H40085348
#define SCT_EVENT10_STATE    *&H40085350
#define SCT_EVENT11_STATE    *&H40085358
#define SCT_EVENT12_STATE    *&H40085360
#define SCT_EVENT0_CTRL      *&H40085304  ' Event Control Register
#define SCT_EVENT1_CTRL      *&H4008530C
#define SCT_EVENT2_CTRL      *&H40085314
#define SCT_EVENT3_CTRL      *&H4008531C
#define SCT_EVENT4_CTRL      *&H40085324
#define SCT_EVENT5_CTRL      *&H4008532C
#define SCT_EVENT6_CTRL      *&H40085334
#define SCT_EVENT7_CTRL      *&H4008533C
#define SCT_EVENT8_CTRL      *&H40085344
#define SCT_EVENT9_CTRL      *&H4008534C
#define SCT_EVENT10_CTRL     *&H40085354
#define SCT_EVENT11_CTRL     *&H4008535C
#define SCT_EVENT12_CTRL     *&H40085364
#define SCT_OUT0_SET         *&H40085500  ' Output n Set Register
#define SCT_OUT1_SET         *&H40085508
#define SCT_OUT2_SET         *&H40085510
#define SCT_OUT3_SET         *&H40085518
#define SCT_OUT4_SET         *&H40085520
#define SCT_OUT5_SET         *&H40085528
#define SCT_OUT6_SET         *&H40085530
#define SCT_OUT7_SET         *&H40085538
#define SCT_OUT0_CLR         *&H40085504  ' Output n Clear Register
#define SCT_OUT1_CLR         *&H4008550C
#define SCT_OUT2_CLR         *&H40085514
#define SCT_OUT3_CLR         *&H4008551C
#define SCT_OUT4_CLR         *&H40085524
#define SCT_OUT5_CLR         *&H4008552C
#define SCT_OUT6_CLR         *&H40085534
#define SCT_OUT7_CLR         *&H4008553C
#define SCT_MODULECONTENT    *&H400857FC  ' 0x7FC Module Content


'GPIO grouped interrupt register block structure
#define GINT_CTRL        *&H40002000     ' GPIO grouped interrupt control register
#define GINT_PORT_POL0   *&H40002020     ' GPIO grouped interrupt port polarity register
#define GINT_PORT_POL1   *&H40002024     ' GPIO grouped interrupt port polarity register
#define GINT_PORT_POL2   *&H40002028     ' GPIO grouped interrupt port polarity register
#define GINT_PORT_POL3   *&H4000202C     ' GPIO grouped interrupt port polarity register
#define GINT_PORT_POL4   *&H40002030     ' GPIO grouped interrupt port polarity register
#define GINT_PORT_POL5   *&H40002034     ' GPIO grouped interrupt port polarity register
#define GINT_PORT_POL6   *&H40002038     ' GPIO grouped interrupt port polarity register
#define GINT_PORT_POL7   *&H4000203C     ' GPIO grouped interrupt port polarity register
#define GINT_PORT_ENA0   *&H40002040     ' GPIO grouped interrupt port m enable register
#define GINT_PORT_ENA1   *&H40002044     ' GPIO grouped interrupt port m enable register
#define GINT_PORT_ENA2   *&H40002048     ' GPIO grouped interrupt port m enable register
#define GINT_PORT_ENA3   *&H4000204C     ' GPIO grouped interrupt port m enable register
#define GINT_PORT_ENA4   *&H40002050     ' GPIO grouped interrupt port m enable register
#define GINT_PORT_ENA5   *&H40002054     ' GPIO grouped interrupt port m enable register
#define GINT_PORT_ENA6   *&H40002058     ' GPIO grouped interrupt port m enable register
#define GINT_PORT_ENA7   *&H4000205C     ' GPIO grouped interrupt port m enable register


' Pin Interrupt and Pattern Match register block structure
#define PININT_ISEL   *&H40004000   ' Pin Interrupt Mode register
#define PININT_IENR   *&H40004004   ' Pin Interrupt Enable (Rising) register
#define PININT_SIENR  *&H40004008   ' Set Pin Interrupt Enable (Rising) register
#define PININT_CIENR  *&H4000400C   ' Clear Pin Interrupt Enable (Rising) register
#define PININT_IENF   *&H40004010   ' Pin Interrupt Enable Falling Edge / Active Level register
#define PININT_SIENF  *&H40004014   ' Set Pin Interrupt Enable Falling Edge / Active Level register
#define PININT_CIENF  *&H40004018   ' Clear Pin Interrupt Enable Falling Edge / Active Level address
#define PININT_RISE   *&H4000401C   ' Pin Interrupt Rising Edge register
#define PININT_FALL   *&H40004020   ' Pin Interrupt Falling Edge register
#define PININT_IST    *&H40004024   ' Pin Interrupt Status register
#define PININT_PMCTRL *&H40004028   ' GPIO pattern match interrupt control register         
#define PININT_PMSRC  *&H4000402C   ' GPIO pattern match interrupt bit-slice source register
#define PININT_PMCFG  *&H40004030   ' GPIO pattern match interrupt bit slice configuration register


' Micro Tick register block structure
#define UTICK_CTRL   *&H4000E000    ' UTick Control register
#define UTICK_STATUS *&H4000E004    ' UTick Status register
#define UTICK_CFG    *&H4000E008
#define UTICK_CAPCLR *&H4000E00C
#define UTICK_CAP0   *&H4000E010
#define UTICK_CAP1   *&H4000E014
#define UTICK_CAP2   *&H4000E018
#define UTICK_CAP3   *&H4000E01C


' Windowed Watchdog register block structure
#define WWDT_MOD     *&H4000C000  ' Watchdog mode register. This register contains the basic mode and status of the Watchdog Timer.
#define WWDT_TC      *&H4000C004  ' Watchdog timer constant register. This register determines the time-out value.
#define WWDT_FEED    *&H4000C008  ' Watchdog feed sequence register. Writing 0xAA followed by 0x55 to this register reloads the Watchdog timer with the value contained in WDTC.
#define WWDT_TV      *&H4000C00C  ' Watchdog timer value register. This register reads out the current value of the Watchdog timer.
#define WWDT_WARNINT *&H4000C014  ' Watchdog warning interrupt register. This register contains the Watchdog warning interrupt compare value.
#define WWDT_WINDOW  *&H4000C018  ' Watchdog timer window register. This register contains the Watchdog window value.


' Real Time clock register block structure
#define RTC_CTRL  *&H4002C000  ' RTC control register
#define RTC_MATCH *&H4002C004  ' PRTC match (alarm) register
#define RTC_COUNT *&H4002C008  ' RTC counter register
#define RTC_WAKE  *&H4002C00C  ' RTC high-resolution/wake-up timer control register


' Input Mux Register Block Structure
#define INMUX_PINTSEL0            *&H400050C0    ' Pin interrupt select registers
#define INMUX_PINTSEL1            *&H400050C4    ' Pin interrupt select registers
#define INMUX_PINTSEL2            *&H400050C8    ' Pin interrupt select registers
#define INMUX_PINTSEL3            *&H400050CC    ' Pin interrupt select registers
#define INMUX_PINTSEL4            *&H400050D0    ' Pin interrupt select registers
#define INMUX_PINTSEL5            *&H400050D4    ' Pin interrupt select registers
#define INMUX_PINTSEL6            *&H400050D8    ' Pin interrupt select registers
#define INMUX_PINTSEL7            *&H400050DC    ' Pin interrupt select registers
#define INMUX_DMA_ITRIG_INMUX0    *&H400050E0   ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX1    *&H400050E4   ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX2    *&H400050E8   ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX3    *&H400050EC   ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX4    *&H400050F0   ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX5    *&H400050F4   ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX6    *&H400050F8   ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX7    *&H400050FC   ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX8    *&H40005100   ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX9    *&H40005104   ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX10   *&H40005108    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX11   *&H4000510C    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX12   *&H40005110    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX13   *&H40005114    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX14   *&H40005118    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX15   *&H4000511C    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX16   *&H40005120    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX17   *&H40005124    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX18   *&H40005128    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX19   *&H4000512C    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX20   *&H40005130    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_ITRIG_INMUX20   *&H40005130    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_OTRIG_INMUX0    *&H40005160    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_OTRIG_INMUX1    *&H40005164    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_OTRIG_INMUX2    *&H40005168    ' Input mux register for DMA trigger inputs
#define INMUX_DMA_OTRIG_INMUX3    *&H4000516C    ' Input mux register for DMA trigger inputs
#define INMUX_FREQMEAS_REF        *&H40005180    ' Clock selection for frequency measurement ref clock
#define INMUX_FREQMEAS_TARGET     *&H40005184    ' Clock selection for frequency measurement target clock


'MRT register block structure
#define MRT_CHANNEL0_INTVAL  *&H4000D000    ' Timer interval register
#define MRT_CHANNEL0_TIMER   *&H4000D004    ' Timer register
#define MRT_CHANNEL0_CTRL    *&H4000D008    ' Timer control register
#define MRT_CHANNEL0_STAT    *&H4000D00C    ' Timer status register
#define MRT_CHANNEL1_INTVAL  *&H4000D010    ' Timer interval register
#define MRT_CHANNEL1_TIMER   *&H4000D014    ' Timer register
#define MRT_CHANNEL1_CTRL    *&H4000D018    ' Timer control register
#define MRT_CHANNEL1_STAT    *&H4000D01C    ' Timer status register
#define MRT_CHANNEL2_INTVAL  *&H4000D020    ' Timer interval register
#define MRT_CHANNEL2_TIMER   *&H4000D024    ' Timer register
#define MRT_CHANNEL2_CTRL    *&H4000D028    ' Timer control register
#define MRT_CHANNEL2_STAT    *&H4000D02C    ' Timer status register
#define MRT_CHANNEL3_INTVAL  *&H4000D030    ' Timer interval register
#define MRT_CHANNEL3_TIMER   *&H4000D034    ' Timer register
#define MRT_CHANNEL3_CTRL    *&H4000D038    ' Timer control register
#define MRT_CHANNEL3_STAT    *&H4000D03C    ' Timer status register
#define MRT_MODCFG           *&H4000D0F0
#define MRT_IDLE_CH          *&H4000D0F4
#define MRT_IRQ_FLAG         *&H4000D0F8


'DMA Controller register block structure
#define DMA_CTRL                   *&H40082000 ' DMA control register
#define DMA_INTSTAT                *&H40082004 ' DMA Interrupt status register
#define DMA_SRAMBASE               *&H40082008 ' DMA SRAM address of the channel configuration table
#define DMA_DMACOMMON0_ENABLESET   *&H40082020 ' DMA Channel Enable read and Set for all DMA channels
#define DMA_DMACOMMON0_ENABLECLR   *&H40082028 ' DMA Channel Enable Clear for all DMA channels
#define DMA_DMACOMMON0_ACTIVE      *&H40082030 ' DMA Channel Active status for all DMA channels
#define DMA_DMACOMMON0_BUSY        *&H40082038 ' DMA Channel Busy status for all DMA channels
#define DMA_DMACOMMON0_ERRINT      *&H40082040 ' DMA Error Interrupt status for all DMA channels
#define DMA_DMACOMMON0_INTENSET    *&H40082048 ' DMA Interrupt Enable read and Set for all DMA channels
#define DMA_DMACOMMON0_INTENCLR    *&H40082050 ' DMA Interrupt Enable Clear for all DMA channels
#define DMA_DMACOMMON0_INTA        *&H40082058 ' DMA Interrupt A status for all DMA channels
#define DMA_DMACOMMON0_INTB        *&H40082060 ' DMA Interrupt B status for all DMA channels
#define DMA_DMACOMMON0_SETVALID    *&H40082068 ' DMA Set ValidPending control bits for all DMA channels
#define DMA_DMACOMMON0_SETTRIG     *&H40082070 ' DMA Set Trigger control bits for all DMA channels
#define DMA_DMACOMMON0_ABORT       *&H40082078 ' DMA Channel Abort control for all DMA channels
#define DMA_DMACH0_CFG             *&H40082400 ' DMA Configuration register
#define DMA_DMACH0_CTLSTAT         *&H40082404 ' DMA Control and status register
#define DMA_DMACH0_XFERCFG         *&H40082408 ' DMA Transfer configuration register
#define DMA_DMACH1_CFG             *&H40082410 ' DMA Configuration register
#define DMA_DMACH1_CTLSTAT         *&H40082414 ' DMA Control and status register
#define DMA_DMACH1_XFERCFG         *&H40082418 ' DMA Transfer configuration register
#define DMA_DMACH2_CFG             *&H40082420 ' DMA Configuration register
#define DMA_DMACH2_CTLSTAT         *&H40082424 ' DMA Control and status register
#define DMA_DMACH2_XFERCFG         *&H40082428 ' DMA Transfer configuration register
#define DMA_DMACH3_CFG             *&H40082430 ' DMA Configuration register
#define DMA_DMACH3_CTLSTAT         *&H40082434 ' DMA Control and status register
#define DMA_DMACH3_XFERCFG         *&H40082438 ' DMA Transfer configuration register
#define DMA_DMACH4_CFG             *&H40082440 ' DMA Configuration register
#define DMA_DMACH4_CTLSTAT         *&H40082444 ' DMA Control and status register
#define DMA_DMACH4_XFERCFG         *&H40082448 ' DMA Transfer configuration register
#define DMA_DMACH5_CFG             *&H40082450 ' DMA Configuration register
#define DMA_DMACH5_CTLSTAT         *&H40082454 ' DMA Control and status register
#define DMA_DMACH5_XFERCFG         *&H40082458 ' DMA Transfer configuration register
#define DMA_DMACH6_CFG             *&H40082460 ' DMA Configuration register
#define DMA_DMACH6_CTLSTAT         *&H40082464 ' DMA Control and status register
#define DMA_DMACH6_XFERCFG         *&H40082468 ' DMA Transfer configuration register
#define DMA_DMACH7_CFG             *&H40082470 ' DMA Configuration register
#define DMA_DMACH7_CTLSTAT         *&H40082474 ' DMA Control and status register
#define DMA_DMACH7_XFERCFG         *&H40082478 ' DMA Transfer configuration register
#define DMA_DMACH8_CFG             *&H40082480 ' DMA Configuration register
#define DMA_DMACH8_CTLSTAT         *&H40082484 ' DMA Control and status register
#define DMA_DMACH8_XFERCFG         *&H40082488 ' DMA Transfer configuration register
#define DMA_DMACH9_CFG             *&H40082490 ' DMA Configuration register
#define DMA_DMACH9_CTLSTAT         *&H40082494 ' DMA Control and status register
#define DMA_DMACH9_XFERCFG         *&H40082498 ' DMA Transfer configuration register
#define DMA_DMACH10_CFG            *&H400824A0 ' DMA Configuration register
#define DMA_DMACH10_CTLSTAT        *&H400824A4 ' DMA Control and status register
#define DMA_DMACH10_XFERCFG        *&H400824A8 ' DMA Transfer configuration register
#define DMA_DMACH11_CFG            *&H400824B0 ' DMA Configuration register
#define DMA_DMACH11_CTLSTAT        *&H400824B4 ' DMA Control and status register
#define DMA_DMACH11_XFERCFG        *&H400824B8 ' DMA Transfer configuration register
#define DMA_DMACH12_CFG            *&H400824C0 ' DMA Configuration register
#define DMA_DMACH12_CTLSTAT        *&H400824C4 ' DMA Control and status register
#define DMA_DMACH12_XFERCFG        *&H400824C8 ' DMA Transfer configuration register
#define DMA_DMACH13_CFG            *&H400824D0 ' DMA Configuration register
#define DMA_DMACH13_CTLSTAT        *&H400824D4 ' DMA Control and status register
#define DMA_DMACH13_XFERCFG        *&H400824D8 ' DMA Transfer configuration register
#define DMA_DMACH14_CFG            *&H400824E0 ' DMA Configuration register
#define DMA_DMACH14_CTLSTAT        *&H400824E4 ' DMA Control and status register
#define DMA_DMACH14_XFERCFG        *&H400824E8 ' DMA Transfer configuration register
#define DMA_DMACH15_CFG            *&H400824F0 ' DMA Configuration register
#define DMA_DMACH15_CTLSTAT        *&H400824F4 ' DMA Control and status register
#define DMA_DMACH15_XFERCFG        *&H400824F8 ' DMA Transfer configuration register
#define DMA_DMACH16_CFG            *&H40082500 ' DMA Configuration register
#define DMA_DMACH16_CTLSTAT        *&H40082504 ' DMA Control and status register
#define DMA_DMACH16_XFERCFG        *&H40082508 ' DMA Transfer configuration register
#define DMA_DMACH17_CFG            *&H40082510 ' DMA Configuration register
#define DMA_DMACH17_CTLSTAT        *&H40082514 ' DMA Control and status register
#define DMA_DMACH17_XFERCFG        *&H40082518 ' DMA Transfer configuration register
#define DMA_DMACH18_CFG            *&H40082520 ' DMA Configuration register
#define DMA_DMACH18_CTLSTAT        *&H40082524 ' DMA Control and status register
#define DMA_DMACH18_XFERCFG        *&H40082528 ' DMA Transfer configuration register
#define DMA_DMACH19_CFG            *&H40082530 ' DMA Configuration register
#define DMA_DMACH19_CTLSTAT        *&H40082534 ' DMA Control and status register
#define DMA_DMACH19_XFERCFG        *&H40082538 ' DMA Transfer configuration register
#define DMA_DMACH20_CFG            *&H40082540 ' DMA Configuration register
#define DMA_DMACH20_CTLSTAT        *&H40082544 ' DMA Control and status register
#define DMA_DMACH20_XFERCFG        *&H40082548 ' DMA Transfer configuration register
#define DMA_DMACH21_CFG            *&H40082550 ' DMA Configuration register
#define DMA_DMACH21_CTLSTAT        *&H40082554 ' DMA Control and status register
#define DMA_DMACH21_XFERCFG        *&H40082558 ' DMA Transfer configuration register
#define DMA_DMACH22_CFG            *&H40082560 ' DMA Configuration register
#define DMA_DMACH22_CTLSTAT        *&H40082564 ' DMA Control and status register
#define DMA_DMACH22_XFERCFG        *&H40082568 ' DMA Transfer configuration register
#define DMA_DMACH23_CFG            *&H40082570 ' DMA Configuration register
#define DMA_DMACH23_CTLSTAT        *&H40082574 ' DMA Control and status register
#define DMA_DMACH23_XFERCFG        *&H40082578 ' DMA Transfer configuration register
#define DMA_DMACH24_CFG            *&H40082580 ' DMA Configuration register
#define DMA_DMACH24_CTLSTAT        *&H40082584 ' DMA Control and status register
#define DMA_DMACH24_XFERCFG        *&H40082588 ' DMA Transfer configuration register
#define DMA_DMACH25_CFG            *&H40082590 ' DMA Configuration register
#define DMA_DMACH25_CTLSTAT        *&H40082594 ' DMA Control and status register
#define DMA_DMACH25_XFERCFG        *&H40082598 ' DMA Transfer configuration register
#define DMA_DMACH26_CFG            *&H400825A0 ' DMA Configuration register
#define DMA_DMACH26_CTLSTAT        *&H400825A4 ' DMA Control and status register
#define DMA_DMACH26_XFERCFG        *&H400825A8 ' DMA Transfer configuration register
#define DMA_DMACH27_CFG            *&H400825B0 ' DMA Configuration register
#define DMA_DMACH27_CTLSTAT        *&H400825B4 ' DMA Control and status register
#define DMA_DMACH27_XFERCFG        *&H400825B8 ' DMA Transfer configuration register
#define DMA_DMACH28_CFG            *&H400825C0 ' DMA Configuration register
#define DMA_DMACH28_CTLSTAT        *&H400825C4 ' DMA Control and status register
#define DMA_DMACH28_XFERCFG        *&H400825C8 ' DMA Transfer configuration register
#define DMA_DMACH29_CFG            *&H400825D0 ' DMA Configuration register
#define DMA_DMACH29_CTLSTAT        *&H400825D4 ' DMA Control and status register
#define DMA_DMACH29_XFERCFG        *&H400825D8 ' DMA Transfer configuration register
#define DMA_DMACH30_CFG            *&H400825E0 ' DMA Configuration register
#define DMA_DMACH30_CTLSTAT        *&H400825E4 ' DMA Control and status register
#define DMA_DMACH30_XFERCFG        *&H400825E8 ' DMA Transfer configuration register
#define DMA_DMACH31_CFG            *&H400825F0 ' DMA Configuration register
#define DMA_DMACH31_CTLSTAT        *&H400825F4 ' DMA Control and status register
#define DMA_DMACH31_XFERCFG        *&H400825F8 ' DMA Transfer configuration register


'USB device register block structure
#define USB0_DEVCMDSTAT    *&H40084000 ' USB Device Command/Status register
#define USB0_INFO          *&H40084004 ' USB Info register     
#define USB0_EPLISTSTART   *&H40084008 ' USB EP Command/Status List start address
#define USB0_DATABUFSTART  *&H4008400C ' USB Data buffer start address
#define USB0_LPM           *&H40084010 ' Link Power Management register
#define USB0_EPSKIP        *&H40084014 ' USB Endpoint skip     
#define USB0_EPINUSE       *&H40084018 ' USB Endpoint Buffer in use
#define USB0_EPBUFCFG      *&H4008401C ' USB Endpoint Buffer Configuration register
#define USB0_INTSTAT       *&H40084020 ' USB interrupt status register
#define USB0_INTEN         *&H40084024 ' USB interrupt enable register
#define USB0_INTSETSTAT    *&H40084028 ' USB set interrupt status register
#define USB0_INTROUTING    *&H4008402C ' USB interrupt routing register
#define USB0_EPTOGGLE      *&H40084034 ' USB Endpoint toggle register

#define USB1_DEVCMDSTAT    *&H40094000 ' USB Device Command/Status register
#define USB1_INFO          *&H40094004 ' USB Info register     
#define USB1_EPLISTSTART   *&H40094008 ' USB EP Command/Status List start address
#define USB1_DATABUFSTART  *&H4009400C ' USB Data buffer start address
#define USB1_LPM           *&H40094010 ' Link Power Management register
#define USB1_EPSKIP        *&H40094014 ' USB Endpoint skip     
#define USB1_EPINUSE       *&H40094018 ' USB Endpoint Buffer in use
#define USB1_EPBUFCFG      *&H4009401C ' USB Endpoint Buffer Configuration register
#define USB1_INTSTAT       *&H40094020 ' USB interrupt status register
#define USB1_INTEN         *&H40094024 ' USB interrupt enable register
#define USB1_INTSETSTAT    *&H40094028 ' USB set interrupt status register
#define USB1_INTROUTING    *&H4009402C ' USB interrupt routing register
#define USB1_EPTOGGLE      *&H40094034 ' USB Endpoint toggle register


' USB0 Host Registers
#define USBH0_Revision          *&H400A2000     
#define USBH0_Control           *&H400A2004
#define USBH0_CommandStatus     *&H400A2008
#define USBH0_InterruptStatus   *&H400A200C
#define USBH0_InterruptEnable   *&H400A2010
#define USBH0_InterruptDisable  *&H400A2014
#define USBH0_HCCA              *&H400A2018
#define USBH0_PeriodCurrentED   *&H400A201C
#define USBH0_ControlHeadED     *&H400A2020
#define USBH0_ControlCurrentED  *&H400A2024
#define USBH0_BulkHeadED        *&H400A2028
#define USBH0_BulkCurrentED     *&H400A202C
#define USBH0_DoneHead          *&H400A2030
#define USBH0_FmInterval        *&H400A2034
#define USBH0_FmRemaining       *&H400A2038
#define USBH0_FmNumber          *&H400A203C
#define USBH0_PeriodicStart     *&H400A2040
#define USBH0_LSTreshold        *&H400A2044
#define USBH0_RhDescriptorA     *&H400A2048
#define USBH0_RhDescriptorB     *&H400A204C
#define USBH0_RhStatus          *&H400A2050
#define USBH0_RhPortStatus1     *&H400A2054
#define USBH0_RhPortStatus2     *&H400A2058
#define USBH0_PORT_MODE         *&H400A205C
#define USBH0_Module_ID         *&H400A20FC


' USB1 Host Registers
#define USBH1_CAPLENGTH_CHIPID  *&H400A3000 ' This register contains the offset value towards the start of the operational register space and the version number of the IP block
#define USBH1_HCSPARAMS         *&H400A3004 ' Host Controller Structural Parameters
#define USBH1_HCCPARAMS         *&H400A3008 ' Host Controller Capability Parameters
#define USBH1_FLADJ_FRINDEX     *&H400A300C ' Frame Length Adjustment
#define USBH1_ATL_PTD_BASE      *&H400A3010 ' Memory base address where ATL PTD0 is stored
#define USBH1_ISO_PTD_BASE      *&H400A3014 ' Memory base address where ISO PTD0 is stored
#define USBH1_INT_PTD_BASE      *&H400A3018 ' Memory base address where INT PTD0 is stored
#define USBH1_DATA_PLD_BASE     *&H400A301C ' Memory base address that indicates the start of the data payload buffers
#define USBH1_USBCMD            *&H400A3020 ' USB Command register
#define USBH1_USBSTS            *&H400A3024 ' USB Interrupt Status register
#define USBH1_USBINTR           *&H400A3028 ' USB Interrupt Enable register
#define USBH1_PORTSC1           *&H400A302C ' Port Status and Control register
#define USBH1_ATL_PTD_DONE      *&H400A3030 ' Done map for each ATL PTD
#define USBH1_ATL_PTD_SKIP      *&H400A3034 ' Skip map for each ATL PTD
#define USBH1_ISO_PTD_DONE      *&H400A3038 ' Done map for each ISO PTD
#define USBH1_ISO_PTD_SKIP      *&H400A303C ' Skip map for each ISO PTD
#define USBH1_INT_PTD_DONE      *&H400A3040 ' Done map for each INT PTD
#define USBH1_INT_PTD_SKIP      *&H400A3044 ' Skip map for each INT PTD
#define USBH1_LAST_PTD          *&H400A3048 ' Marks the last PTD in the list for ISO, INT and ATL
#define USBH1_UTMI_ULPI_DBG     *&H400A304C ' Register to read/write registers in the attached USB PHY
#define USBH1_PORT_MODE         *&H400A3050


' Repetitive Interrupt Timer register block structure
#define RITIMER_COMPVAL   *&H4002D000   ' Compare register 
#define RITIMER_MASK      *&H4002D004   ' Mask register 
#define RITIMER_CTRL      *&H4002D008   ' Control register 
#define RITIMER_COUNTER   *&H4002D00C   ' 32-bit counter 
#define RITIMER_COMPVAL_H *&H4002D010   ' Compare register, upper 16-bits 
#define RITIMER_MASK_H    *&H4002D014   ' Compare register, upper 16-bits 
#define RITIMER_COUNTER_H *&H4002D01C   ' Counter register, upper 16-bits 

'UART Registers
#define UART0_CFG             *&H40086000  ' Offset: 0x000 Configuration register 
#define UART0_CTL             *&H40086004  ' Offset: 0x004 Control register
#define UART0_STAT            *&H40086008  ' Offset: 0x008 Status register
#define UART0_INTENSET        *&H4008600C  ' Offset: 0x00C Interrupt Enable Read and Set register
#define UART0_INTENCLR        *&H40086010  ' Offset: 0x010 Interrupt Enable Clear register @cond
#define UART0_BRG             *&H40086020  ' Offset: 0x020 Baud Rate Generator register
#define UART0_INTSTAT         *&H40086024  ' Offset: 0x024 Interrupt Status register
#define UART0_OSR             *&H40086028  ' Offset: 0x028 Oversampling register
#define UART0_ADDR            *&H4008602C  ' Offset: 0x02C Address register (for automatic address matching) @cond
#define UART0_FIFOCFG         *&H40086E00  ' Offset: 0xE00 FIFO Configuration register
#define UART0_FIFOSTAT        *&H40086E04  ' Offset: 0xE04 FIFO Status register
#define UART0_FIFOTRIG        *&H40086E08  ' Offset: 0xE08 FIFO Trigger level register @cond
#define UART0_FIFOINTENSET    *&H40086E10  ' Offset: 0xE10 FIFO Interrupt enable SET register
#define UART0_FIFOINTENCLR    *&H40086E14  ' Offset: 0xE14 FIFO Interrupt enable CLEAR register
#define UART0_FIFOINTSTAT     *&H40086E18  ' Offset: 0xE18 FIFO Interrupt Status register @cond
#define UART0_FIFOWR          *&H40086E20  ' Offset: 0xE20 FIFO Data write register @cond
#define UART0_FIFORD          *&H40086E30  ' Offset: 0xE30 FIFO Data read register @cond
#define UART0_FIFORDNOPOP     *&H40086E40  ' Offset: 0xE40 FIFO Data peek (read without popping out of queue) register @cond
#define UART0_PSELID          *&H40086FF8  ' Offset: 0xFF8 Peripheral select/identification register NOT DOCUMENTED
#define UART0_PID             *&H40086FFC  ' Offset: 0xFFC Module identification register

#define UART1_CFG             *&H40087000  ' Offset: 0x000 Configuration register 
#define UART1_CTL             *&H40087004  ' Offset: 0x004 Control register
#define UART1_STAT            *&H40087008  ' Offset: 0x008 Status register
#define UART1_INTENSET        *&H4008700C  ' Offset: 0x00C Interrupt Enable Read and Set register
#define UART1_INTENCLR        *&H40087010  ' Offset: 0x010 Interrupt Enable Clear register @cond
#define UART1_BRG             *&H40087020  ' Offset: 0x020 Baud Rate Generator register
#define UART1_INTSTAT         *&H40087024  ' Offset: 0x024 Interrupt Status register
#define UART1_OSR             *&H40087028  ' Offset: 0x028 Oversampling register
#define UART1_ADDR            *&H4008702C  ' Offset: 0x02C Address register (for automatic address matching) @cond
#define UART1_FIFOCFG         *&H40087E00  ' Offset: 0xE00 FIFO Configuration register
#define UART1_FIFOSTAT        *&H40087E04  ' Offset: 0xE04 FIFO Status register
#define UART1_FIFOTRIG        *&H40087E08  ' Offset: 0xE08 FIFO Trigger level register @cond
#define UART1_FIFOINTENSET    *&H40087E10  ' Offset: 0xE10 FIFO Interrupt enable SET register
#define UART1_FIFOINTENCLR    *&H40087E14  ' Offset: 0xE14 FIFO Interrupt enable CLEAR register
#define UART1_FIFOINTSTAT     *&H40087E18  ' Offset: 0xE18 FIFO Interrupt Status register @cond
#define UART1_FIFOWR          *&H40087E20  ' Offset: 0xE20 FIFO Data write register @cond
#define UART1_FIFORD          *&H40087E30  ' Offset: 0xE30 FIFO Data read register @cond
#define UART1_FIFORDNOPOP     *&H40087E40  ' Offset: 0xE40 FIFO Data peek (read without popping out of queue) register @cond
#define UART1_PSELID          *&H40087FF8  ' Offset: 0xFF8 Peripheral select/identification register NOT DOCUMENTED
#define UART1_PID             *&H40087FFC  ' Offset: 0xFFC Module identification register

#define UART2_CFG             *&H40088000  ' Offset: 0x000 Configuration register 
#define UART2_CTL             *&H40088004  ' Offset: 0x004 Control register
#define UART2_STAT            *&H40088008  ' Offset: 0x008 Status register
#define UART2_INTENSET        *&H4008800C  ' Offset: 0x00C Interrupt Enable Read and Set register
#define UART2_INTENCLR        *&H40088010  ' Offset: 0x010 Interrupt Enable Clear register @cond
#define UART2_BRG             *&H40088020  ' Offset: 0x020 Baud Rate Generator register
#define UART2_INTSTAT         *&H40088024  ' Offset: 0x024 Interrupt Status register
#define UART2_OSR             *&H40088028  ' Offset: 0x028 Oversampling register
#define UART2_ADDR            *&H4008802C  ' Offset: 0x02C Address register (for automatic address matching) @cond
#define UART2_FIFOCFG         *&H40088E00  ' Offset: 0xE00 FIFO Configuration register
#define UART2_FIFOSTAT        *&H40088E04  ' Offset: 0xE04 FIFO Status register
#define UART2_FIFOTRIG        *&H40088E08  ' Offset: 0xE08 FIFO Trigger level register @cond
#define UART2_FIFOINTENSET    *&H40088E10  ' Offset: 0xE10 FIFO Interrupt enable SET register
#define UART2_FIFOINTENCLR    *&H40088E14  ' Offset: 0xE14 FIFO Interrupt enable CLEAR register
#define UART2_FIFOINTSTAT     *&H40088E18  ' Offset: 0xE18 FIFO Interrupt Status register @cond
#define UART2_FIFOWR          *&H40088E20  ' Offset: 0xE20 FIFO Data write register @cond
#define UART2_FIFORD          *&H40088E30  ' Offset: 0xE30 FIFO Data read register @cond
#define UART2_FIFORDNOPOP     *&H40088E40  ' Offset: 0xE40 FIFO Data peek (read without popping out of queue) register @cond
#define UART2_PSELID          *&H40088FF8  ' Offset: 0xFF8 Peripheral select/identification register NOT DOCUMENTED
#define UART2_PID             *&H40088FFC  ' Offset: 0xFFC Module identification register

#define UART3_CFG             *&H40089000  ' Offset: 0x000 Configuration register 
#define UART3_CTL             *&H40089004  ' Offset: 0x004 Control register
#define UART3_STAT            *&H40089008  ' Offset: 0x008 Status register
#define UART3_INTENSET        *&H4008900C  ' Offset: 0x00C Interrupt Enable Read and Set register
#define UART3_INTENCLR        *&H40089010  ' Offset: 0x010 Interrupt Enable Clear register @cond
#define UART3_BRG             *&H40089020  ' Offset: 0x020 Baud Rate Generator register
#define UART3_INTSTAT         *&H40089024  ' Offset: 0x024 Interrupt Status register
#define UART3_OSR             *&H40089028  ' Offset: 0x028 Oversampling register
#define UART3_ADDR            *&H4008902C  ' Offset: 0x02C Address register (for automatic address matching) @cond
#define UART3_FIFOCFG         *&H40089E00  ' Offset: 0xE00 FIFO Configuration register
#define UART3_FIFOSTAT        *&H40089E04  ' Offset: 0xE04 FIFO Status register
#define UART3_FIFOTRIG        *&H40089E08  ' Offset: 0xE08 FIFO Trigger level register @cond
#define UART3_FIFOINTENSET    *&H40089E10  ' Offset: 0xE10 FIFO Interrupt enable SET register
#define UART3_FIFOINTENCLR    *&H40089E14  ' Offset: 0xE14 FIFO Interrupt enable CLEAR register
#define UART3_FIFOINTSTAT     *&H40089E18  ' Offset: 0xE18 FIFO Interrupt Status register @cond
#define UART3_FIFOWR          *&H40089E20  ' Offset: 0xE20 FIFO Data write register @cond
#define UART3_FIFORD          *&H40089E30  ' Offset: 0xE30 FIFO Data read register @cond
#define UART3_FIFORDNOPOP     *&H40089E40  ' Offset: 0xE40 FIFO Data peek (read without popping out of queue) register @cond
#define UART3_PSELID          *&H40089FF8  ' Offset: 0xFF8 Peripheral select/identification register NOT DOCUMENTED
#define UART3_PID             *&H40089FFC  ' Offset: 0xFFC Module identification register



' LPC540XX Peripheral addresses and register set declarations

'Main memory addresses
#define LPC_SRAMX_BASE             &H00000000
#define LPC_SRAM0_BASE             &H20000000
#define LPC_SRAM1_BASE             &H20010000
#define LPC_SRAM2_BASE             &H20018000
#define LPC_SRAM3_BASE             &H20020000
#define LPC_USB_SRAM_BASE          &H40100000
#define LPC_USB_SRAM_SIZE          &H00002000
#define LPC_ROM_BASE               &H03000000

'APB0 peripheral group addresses
#define LPC_SYSCON_BASE            &H40000000
#define LPC_IOCON_BASE             &H40001000
#define LPC_GPIO_GROUPINT0_BASE    &H40002000
#define LPC_GPIO_GROUPINT1_BASE    &H40003000
#define LPC_PIN_INT_BASE           &H40004000
#define LPC_INMUX_BASE             &H40005000
#define LPC_TIMER0_BASE            &H40008000
#define LPC_TIMER1_BASE            &H40009000
#define LPC_WWDT_BASE              &H4000C000
#define LPC_MRT_BASE               &H4000D000
#define LPC_UTICK_BASE             &H4000E000
'reserved                          &H40014000
#define LPC_OTP_BASE               &H40015000

'APB1 peripheral group address
'reserved                          &H40020000
#define LPC_TIMER2_BASE            &H40028000
#define LPC_RTC_BASE               &H4002C000
#define LPC_RITIMER_BASE           &H4002D000
'reserved                          &H40034000
#define LPC_SMARTCARD0             &H40036000
#define LPC_SMARTCARD1             &H40037000
#define LPC_RNG                    &H4003A000

'Asynchronous APB peripheral group addresses
#define LPC_ASYNC_SYSCON_BASE      &H40040000
#define LPC_TIMER3_BASE            &H40048000
#define LPC_TIMER4_BASE            &H40049000

'AHB Peripherals base address
#define LPC_SPIFI_BASE             &H40080000
#define LPC_EMC_BASE               &H40081000
#define LPC_DMA_BASE               &H40082000
#define LPC_LCD_BASE               &H40083000
#define LPC_USB0_BASE              &H40084000
#define LPC_SCT_BASE               &H40085000
#define LPC_FLEXCOMM0_BASE         &H40086000 ' aka UART0
#define LPC_FLEXCOMM1_BASE         &H40087000 ' aka UART1
#define LPC_FLEXCOMM2_BASE         &H40088000 ' aka UART2
#define LPC_FLEXCOMM3_BASE         &H40089000 ' aka UART3
#define LPC_FLEXCOMM4_BASE         &H4008A000
#define LPC_GPIO_PORT_BASE         &H4008C000
#define LPC_DMIC_BASE              &H40090000
#define LPC_USB1_BASE              &H40094000
#define LPC_CRC_BASE               &H40095000
#define LPC_FLEXCOMM5_BASE         &H40096000
#define LPC_FLEXCOMM6_BASE         &H40097000
#define LPC_FLEXCOMM7_BASE         &H40098000
#define LPC_FLEXCOMM8_BASE         &H40099000
#define LPC_FLEXCOMM9_BASE         &H4009A000
#define LPC_SDIO_BASE              &H4009B000
'reserved                          &H4009C000
#define LPC_CAN0_BASE              &H4009D000
#define LPC_CAN1_BASE              &H4009E000
#define LPC_FLEXCOMM10_BASE        &H4009F000 
#define LPC_ADC_BASE               &H400A0000
'reserved                          &H400A1000
#define LPC_USB0_HOST_BASE         &H400A2000
#define LPC_USB1_HOST_BASE         &H400A3000
#define LPC_HASH_BASE              &H400A4000

' Main memory register access 
'#define LPC_GPIO           ((LPC_GPIO_T            *) LPC_GPIO_PORT_BASE)
'#define LPC_DMA            ((LPC_DMA_T             *) LPC_DMA_BASE)
'#define LPC_EMC            ((LPC_EMC_T             *) LPC_EMC_BASE)
'#define LPC_CRC            ((LPC_CRC_T             *) LPC_CRC_BASE)
'#define LPC_SDIO           ((LPC_SDMMC_T           *) LPC_SDIO_BASE) ' not on LCD-54005
'#define LPC_SCT            ((LPC_SCT_T             *) LPC_SCT_BASE)
'#define LPC_ADC            ((LPC_ADC_T             *) LPC_ADC_BASE)
'#define LPC_DMIC           ((LPC_DMIC_T            *) LPC_DMIC_BASE)
'#define LPC_USB0           ((LPC_USB_T             *) LPC_USB0_BASE)
'#define LPC_USB1           ((LPC_USB_T             *) LPC_USB1_BASE)
'#define LPC_USBH0          ((LPC_USBH0_T           *) LPC_USB0_HOST_BASE)
'#define LPC_USBH1          ((LPC_USBH1_T           *) LPC_USB1_HOST_BASE)

' APB0 peripheral group register access 
'#define LPC_SYSCON         ((LPC_SYSCON_T          *) LPC_SYSCON_BASE)
'#define LPC_SYSCTL         ((LPC_SYSCON_T          *) LPC_SYSCON_BASE)
'#define LPC_TIMER2         ((LPC_TIMER_T           *) LPC_TIMER2_BASE)
'#define LPC_TIMER3         ((LPC_TIMER_T           *) LPC_TIMER3_BASE)
'#define LPC_TIMER4         ((LPC_TIMER_T           *) LPC_TIMER4_BASE)
'#define LPC_GINT           ((LPC_GPIOGROUPINT_T    *) LPC_GPIO_GROUPINT0_BASE)
'#define LPC_PININT         ((LPC_PIN_INT_T         *) LPC_PIN_INT_BASE)
'#define LPC_IOCON          ((LPC_IOCON_T           *) LPC_IOCON_BASE)
'#define LPC_UTICK          ((LPC_UTICK_T           *) LPC_UTICK_BASE)
'#define LPC_WWDT           ((LPC_WWDT_T            *) LPC_WWDT_BASE)
'#define LPC_RTC            ((LPC_RTC_T             *) LPC_RTC_BASE)
'#define LPC_SDMMC          LPC_SDIO ' not on LCD-54005
'#define LPC_SPIFI          ((LPC_SPIFI_Type          *) LPC_SPIFI_BASE)

' APB1 peripheral group register access 
'#define LPC_ASYNC_SYSCON   ((LPC_ASYNC_SYSCON_T    *) LPC_ASYNC_SYSCON_BASE)
'#define LPC_TIMER0         ((LPC_TIMER_T           *) LPC_TIMER0_BASE)
'#define LPC_TIMER1         ((LPC_TIMER_T           *) LPC_TIMER1_BASE)
'#define LPC_INMUX          ((LPC_INMUX_T           *) LPC_INMUX_BASE)
'#define LPC_MRT            ((LPC_MRT_T             *) LPC_MRT_BASE)
'#define LPC_RITIMER        ((LPC_RITIMER_T         *) LPC_RITIMER_BASE)

'#define LPC_UART0         ((LPC_USART_T *) LPC_FLEXCOMM0_BASE)
'#define LPC_UART1         ((LPC_USART_T *) LPC_FLEXCOMM1_BASE)
'#define LPC_UART2         ((LPC_USART_T *) LPC_FLEXCOMM2_BASE)
'#define LPC_UART3         ((LPC_USART_T *) LPC_FLEXCOMM3_BASE)

#endif ' __CMSIS_540XX_H_





'NOTE: FCx is FLEXCOMMx, FLEXCOMM is used as UART. So PIO0_30 FC0_TXD is UART0_TXD

' FUNC=0          FUNC=1              FUNC=2              FUNC=3             FUNC=4            FUNC=5             FUNC=6            FUNC=7            FUNC=8       FUNC=9
'PIO0_0          CAN1_RD             FC3_SCK             CTIMER0_MAT0       SCT0_GPI0         PDM0_CLK           -----------       -----------       -----------  ----------
'PIO0_1          CAN1_TD             FC3_CTS_SDA_SSEL0   CTIMER0_CAP0       SCT0_GPI1         PDM0_DATA          -----------       -----------       -----------  ----------
'PIO0_2          FC3_TXD_SCL_MISO    CTIMER0_CAP1        SCT0_OUT0          SCT0_GPI2         -----------        EMC_D[0]          -----------       -----------  ----------
'PIO0_3          FC3_RXD_SDA_MOSI    CTIMER0_MAT1        SCT0_OUT1          SCT0_GPI3         -----------        EMC_D[1]          -----------       -----------  ----------
'PIO0_4          CAN0_RD             FC4_SCK             CTIMER3_CAP0       SCT0_GPI4         -----------        EMC_D[2]          ENET_MDC          -----------  ----------
'PIO0_5          CAN0_TD             FC4_RXD_SDA_MOSI    CTIMER3_MAT0       SCT0_GPI5         -----------        EMC_D[3]          ENET_MDIO         -----------  ----------
'PIO0_6          FC3_SCK             CTIMER3_CAP1        CTIMER4_MAT0       SCT0_GPI6         -----------        EMC_D[4]          ENET_RX_DV        -----------  ----------
'PIO0_7          FC3_RTS_SCL_SSEL1   SD_CLK              FC5_SCK            FC1_SCK           PDM1_CLK           EMC_D[5]          ENET_RX_CLK       -----------  ----------
'PIO0_8          FC3_SSEL3           SD_CMD              FC5_RXD_SDA_MOSI   SWO               PDM1_DATA          EMC_D[6]          -----------       -----------  ----------
'PIO0_9          FC3_SSEL2           SD_POW_EN           FC5_TXD_SCL_MISO   -----------       SCI1_IO            EMC_D[7]          -----------       -----------  ----------
'PIO0_10/ADC0_0  FC6_SCK             CTIMER2_CAP2        CTIMER2_MAT0       FC1_TXD_SCL_MISO   -----------       SWO               -----------
'PIO0_11/ADC0_1  FC6_RXD_SDA_MOSI_D  CTIMER2_MAT2        FREQME_GPIO_CLK_A  -----------        -----------       SWCLK             -----------
'PIO0_12/ADC0_2  FC3_TXD_SCL_MISO    -----------         FREQME_GPIO_CLK_B  SCT0_GPI7          -----------       SWDIO             -----------
'PIO0_13         FC1_CTS_SDA_SSEL0   UTICK_CAP0          CTIMER0_CAP0       SCT0_GPI0         -----------        -----------       ENET_RXD0         -----------  ----------
'PIO0_14         FC1_RTS_SCL_SSEL1   UTICK_CAP1          CTIMER0_CAP1       SCT0_GPI1         -----------        -----------       ENET_RXD1         -----------  ----------
'PIO0_15/ADC0_3  FC6_CTS_SDA_SSEL0   UTICK_CAP2          CTIMER4_CAP0       SCT0_OUT2          -----------       EMC_WEN           ENET_TX_EN
'PIO0_16/ADC0_4  FC4_TXD_SCL_MISO    CLKOUT              CTIMER1_CAP0       -----------        -----------       EMC_CSN[0]        ENET_TXD0
'PIO0_17         FC4_SSEL2           SD_CARD_DET_N       SCT0_GPI7          SCT0_OUT0         -----------        EMC_OEN           ENET_TXD1         -----------  ----------
'PIO0_18         FC4_CTS_SDA_SSEL0   SD_WR_PRT           CTIMER1_MAT0       SCT0_OUT1         SCI1_SCLK          EMC_A[0]          -----------       -----------  ----------
'PIO0_19         FC4_RTS_SCL_SSEL1   UTICK_CAP0          CTIMER0_MAT2       SCT0_OUT2         -----------        EMC_A[1]          FC7_TXD_SCL_MISO  -----------  ----------
'PIO0_20         FC3_CTS_SDA_SSEL0   CTIMER1_MAT1        CTIMER3_CAP3       SCT0_GPI2         SCI0_IO            EMC_A[2]          FC7_RXD_SDA_MOSI  -----------  ----------
'PIO0_21         FC3_RTS_SCL_SSEL1   UTICK_CAP3          CTIMER3_MAT3       SCT0_GPI3         SCI0_SCLK          EMC_A[3]          FC7_SCK           -----------  ----------
'PIO0_22         FC6_TXD_SCL_MISO    UTICK_CAP1          CTIMER3_CAP3       SCT0_OUT3         -----------        -----------       USB0_VBUS         -----------  ----------
'PIO0_23/ADC0_11 MCLK                CTIMER1_MAT2        CTIMER3_MAT3       SCT0_OUT4         FC0_CTS_SDA_SSEL0  SPIFI_CSN         -----------
'PIO0_24         FC0_RXD_SDA_MOSI    SD_D[0]             CTIMER2_CAP0       SCT0_GPI0         -----------        SPIFI_IO0         -----------       -----------  ----------
'PIO0_25         FC0_TXD_SCL_MISO    SD_D[1]             CTIMER2_CAP1       SCT0_GPI1         -----------        SPIFI_IO1         -----------       -----------  ----------
'PIO0_26         FC2_RXD_SDA_MOSI    CLKOUT              CTIMER3_CAP2       SCT0_OUT5         PDM0_CLK           SPIFI_CLK         USB0_IDVALUE      FC0_SCK      FC10_SSEL0
'PIO0_27         FC2_TXD_SCL_MISO    -----------         CTIMER3_MAT2       SCT0_OUT6         PDM0_DATA          SPIFI_IO3         -----------       -----------  ----------
'PIO0_28         FC0_SCK             -----------         CTIMER2_CAP3       SCT0_OUT7         TRACEDATA[3]       SPIFI_IO2         USB0_OVERCURRENTN -----------  ----------
'PIO0_29         FC0_RXD_SDA_MOSI    -----------         CTIMER2_MAT3       SCT0_OUT8         TRACEDATA[2]       -----------       -----------       -----------  ----------
'PIO0_30         FC0_TXD_SCL_MISO    -----------         CTIMER0_MAT0       SCT0_OUT9         TRACEDATA[1]       -----------       -----------       -----------  ----------
'PIO0_31/ADC0_5  FC0_CTS_SDA_SSEL0   SD_D[2]             CTIMER0_MAT1       SCT0_OUT3          TRACEDATA[0]      -----------       -----------

'PIO1_0/ADC0_6   FC0_RTS_SCL_SSEL1   SD_D[3]             CTIMER0_CAP2       SCT0_GPI4          TRACECLK          -----------       -----------
'PIO1_1          FC3_RXD_SDA_MOSI    -----------         CTIMER0_CAP3       SCT0_GPI5         -----------        FC10_MOSI_DATA    USB1_OVERCURRENTN -----------
'PIO1_2          CAN0_TD             -----------         CTIMER0_MAT3       SCT0_GPI6         PDM1_CLK           FC10_MISO         USB1_PORTPWRN     -----------  ----------
'PIO1_3          CAN0_RD             -----------         -----------        SCT0_OUT4         PDM1_DATA          -----------       USB0_PORTPWRN     FC10_SCK     ----------
'PIO1_4          FC0_SCK             SD_D[0]             CTIMER2_MAT1       SCT0_OUT0         FREQME_GPIO_CLK_A  EMC_D[11]         -----------       -----------  ----------
'PIO1_5          FC0_RXD_SDA_MOSI    SD_D[2]             CTIMER2_MAT0       SCT0_GPI0         -----------        EMC_A[4]          -----------       -----------  ----------
'PIO1_6          FC0_TXD_SCL_MISO    SD_D[3]             CTIMER2_MAT1       SCT0_GPI3         -----------        EMC_A[5]          -----------       -----------  ----------
'PIO1_7          FC0_RTS_SCL_SSEL1   SD_D[1]             CTIMER2_MAT2       SCT0_GPI4         -----------        EMC_A[6]          -----------       -----------  ----------
'PIO1_8          FC0_CTS_SDA_SSEL0   SD_CLK              -----------        SCT0_OUT1         FC4_SSEL2          EMC_A[7]          -----------       -----------  ----------
'PIO1_9          ENET_TXD0           FC1_SCK             CTIMER1_CAP0       SCT0_OUT2         FC4_CTS_SDA_SSEL0  EMC_CASN          -----------       -----------  ----------
'PIO1_10         ENET_TXD1           FC1_RXD_SDA_MOSI    CTIMER1_MAT0       SCT0_OUT3         -----------        EMC_RASN          -----------       -----------  ----------
'PIO1_11         ENET_TX_EN          FC1_TXD_SCL_MISO    CTIMER1_CAP1       USB0_VBUS         -----------        EMC_CLK[0]        -----------       -----------  ----------
'PIO1_12         ENET_RXD0           FC6_SCK             CTIMER1_MAT1       USB0_PORTPWRN     -----------        EMC_DYCSN[0]      -----------       -----------  ----------
'PIO1_13         ENET_RXD1           FC6_RXD_SDA_MOSI_D  CTIMER1_CAP2       USB0_OVERCURRENTN USB0_FRAME         EMC_DQM[0]        -----------       -----------  ----------
'PIO1_14         ENET_RX_DV          UTICK_CAP2          CTIMER1_MAT2       FC5_CTS_SDA_SSEL0 USB0_LEDN          EMC_DQM[1]        -----------       -----------  ----------
'PIO1_15         ENET_RX_CLK         UTICK_CAP3          CTIMER1_CAP3       FC5_RTS_SCL_SSEL1 FC4_RTS_SCL_SSEL1  EMC_CKE[0]        -----------       -----------  ----------
'PIO1_16         ENET_MDC            FC6_TXD_SCL_MISO_WS CTIMER1_MAT3       SD_CMD            -----------        EMC_A[10]         -----------       -----------  ----------
'PIO1_17         ENET_MDIO           FC8_RXD_SDA_MOSI    -----------        SCT0_OUT4         CAN1_TD            EMC_BLSN[0]       -----------       -----------  ----------
'PIO1_18         -----------         FC8_TXD_SCL_MISO    -----------        SCT0_OUT5         CAN1_RD            EMC_BLSN[1]       -----------       -----------  ----------
'PIO1_19         FC8_SCK             SCT0_OUT7           CTIMER3_MAT1       SCT0_GPI7         FC4_SCK            EMC_D[8]          -----------       -----------  ----------
'PIO1_20         FC7_RTS_SCL_SSEL1   -----------         CTIMER3_CAP2       -----------       FC4_TXD_SCL_MISO   EMC_D[9]          -----------       -----------  ----------
'PIO1_21         FC7_CTS_SDA_SSEL0   -----------         CTIMER3_MAT2       -----------       FC4_RXD_SDA_MOSI   EMC_D[10]         -----------       -----------  ----------
'PIO1_22         FC8_RTS_SCL_SSEL1   SD_CMD              CTIMER2_MAT3       SCT0_GPI5         FC4_SSEL3          EMC_CKE[1]        -----------       -----------  ----------
'PIO1_23         FC2_SCK             SCT0_OUT0           -----------        ENET_MDIO         FC3_SSEL2          EMC_A[11]         -----------       -----------  ----------
'PIO1_24         FC2_RXD_SDA_MOSI    SCT0_OUT1           -----------        -----------       FC3_SSEL3          EMC_A[12]         -----------       -----------  ----------
'PIO1_25         FC2_TXD_SCL_MISO    SCT0_OUT2           -----------        UTICK_CAP0        -----------        EMC_A[13]         -----------       -----------  ----------
'PIO1_26         FC2_CTS_SDA_SSEL0   SCT0_OUT3           CTIMER0_CAP3       UTICK_CAP1        -----------        EMC_A[8]          -----------       -----------  ----------
'PIO1_27         FC2_RTS_SCL_SSEL1   SD_D[4]             CTIMER0_MAT3       CLKOUT            -----------        EMC_A[9]          -----------       -----------  ----------
'PIO1_28         FC7_SCK             SD_D[5]             CTIMER0_CAP2       -----------       -----------        EMC_D[12]         -----------       -----------  ----------
'PIO1_29         FC7_RXD_SDA_MOSI_D  SD_D[6]             SCT0_GPI6          USB1_PORTPWRN     USB1_FRAME         EMC_D[13]         -----------       -----------  ----------
'PIO1_30         FC7_TXD_SCL_MISO_WS SD_D[7]             SCT0_GPI7          USB1_OVERCURRENTN USB1_LEDN          EMC_D[14]         -----------       -----------  ----------
'PIO1_31         MCLK                -----------         CT0_MAT2           SCT0_OUT6         FC8_CTS_SDA_SSEL0  EMC_D[15]         -----------       -----------  ----------
