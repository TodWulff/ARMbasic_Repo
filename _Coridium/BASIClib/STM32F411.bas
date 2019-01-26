
#ifndef __STM32F411_H__
#define __STM32F411_H__

' -------------------------  Interrupt Number Definition  ------------------------ 
'*****  Interrupt Numbers *********************************************************************
#define WWDG_IRQn                   0      '  Window WatchDog Interrupt                                         
#define PVD_IRQn                    1      '  PVD through EXTI Line detection Interrupt                         
#define TAMP_STAMP_IRQn             2      '  Tamper and TimeStamp interrupts through the EXTI line             
#define RTC_WKUP_IRQn               3      '  RTC Wakeup interrupt through the EXTI line                        
#define FLASH_IRQn                  4      '  FLASH global Interrupt                                            
#define RCC_IRQn                    5      '  RCC global Interrupt                                              
#define EXTI0_IRQn                  6      '  EXTI Line0 Interrupt                                              
#define EXTI1_IRQn                  7      '  EXTI Line1 Interrupt                                              
#define EXTI2_IRQn                  8      '  EXTI Line2 Interrupt                                              
#define EXTI3_IRQn                  9      '  EXTI Line3 Interrupt                                              
#define EXTI4_IRQn                  10     '  EXTI Line4 Interrupt                                              
#define DMA1_Stream0_IRQn           11     '  DMA1 Stream 0 global Interrupt                                    
#define DMA1_Stream1_IRQn           12     '  DMA1 Stream 1 global Interrupt                                    
#define DMA1_Stream2_IRQn           13     '  DMA1 Stream 2 global Interrupt                                    
#define DMA1_Stream3_IRQn           14     '  DMA1 Stream 3 global Interrupt                                    
#define DMA1_Stream4_IRQn           15     '  DMA1 Stream 4 global Interrupt                                    
#define DMA1_Stream5_IRQn           16     '  DMA1 Stream 5 global Interrupt                                    
#define DMA1_Stream6_IRQn           17     '  DMA1 Stream 6 global Interrupt                                    
#define ADC_IRQn                    18     '  ADC1, ADC2 and ADC3 global Interrupts                             
#define EXTI9_5_IRQn                23     '  External Line[9:5] Interrupts                                     
#define TIM1_BRK_TIM9_IRQn          24     '  TIM1 Break interrupt and TIM9 global interrupt                    
#define TIM1_UP_TIM10_IRQn          25     '  TIM1 Update Interrupt and TIM10 global interrupt                  
#define TIM1_TRG_COM_TIM11_IRQn     26     '  TIM1 Trigger and Commutation Interrupt and TIM11 global interrupt 
#define TIM1_CC_IRQn                27     '  TIM1 Capture Compare Interrupt                                    
#define TIM2_IRQn                   28     '  TIM2 global Interrupt                                             
#define TIM3_IRQn                   29     '  TIM3 global Interrupt                                             
#define TIM4_IRQn                   30     '  TIM4 global Interrupt                                             
#define I2C1_EV_IRQn                31     '  I2C1 Event Interrupt                                              
#define I2C1_ER_IRQn                32     '  I2C1 Error Interrupt                                              
#define I2C2_EV_IRQn                33     '  I2C2 Event Interrupt                                              
#define I2C2_ER_IRQn                34     '  I2C2 Error Interrupt                                                
#define SPI1_IRQn                   35     '  SPI1 global Interrupt                                             
#define SPI2_IRQn                   36     '  SPI2 global Interrupt                                             
#define USART1_IRQn                 37     '  USART1 global Interrupt                                           
#define USART2_IRQn                 38     '  USART2 global Interrupt                                           
#define EXTI15_10_IRQn              40     '  External Line[15:10] Interrupts                                   
#define RTC_Alarm_IRQn              41     '  RTC Alarm (A and B) through EXTI Line Interrupt                   
#define OTG_FS_WKUP_IRQn            42     '  USB OTG FS Wakeup through EXTI line interrupt                       
#define DMA1_Stream7_IRQn           47     '  DMA1 Stream7 Interrupt                                            
#define SDIO_IRQn                   49     '  SDIO global Interrupt                                             
#define TIM5_IRQn                   50     '  TIM5 global Interrupt                                             
#define SPI3_IRQn                   51     '  SPI3 global Interrupt                                             
#define DMA2_Stream0_IRQn           56     '  DMA2 Stream 0 global Interrupt                                    
#define DMA2_Stream1_IRQn           57     '  DMA2 Stream 1 global Interrupt                                    
#define DMA2_Stream2_IRQn           58     '  DMA2 Stream 2 global Interrupt                                    
#define DMA2_Stream3_IRQn           59     '  DMA2 Stream 3 global Interrupt                                    
#define DMA2_Stream4_IRQn           60     '  DMA2 Stream 4 global Interrupt                                    
#define OTG_FS_IRQn                 67     '  USB OTG FS global Interrupt                                       
#define DMA2_Stream5_IRQn           68     '  DMA2 Stream 5 global interrupt                                    
#define DMA2_Stream6_IRQn           69     '  DMA2 Stream 6 global interrupt                                    
#define DMA2_Stream7_IRQn           70     '  DMA2 Stream 7 global interrupt                                    
#define USART6_IRQn                 71     '  USART6 global interrupt                                           
#define I2C3_EV_IRQn                72     '  I2C3 event interrupt                                              
#define I2C3_ER_IRQn                73     '  I2C3 error interrupt                                              
#define FPU_IRQn                    81     '  FPU global interrupt                                              
#define SPI4_IRQn                   84     '  SPI4 global Interrupt                                             
#define SPI5_IRQn                   85     '  SPI5 global Interrupt                                             

'*****  Interrupt Service Routine Addresses *********************************************************************
#define WWDG_ISR                    *&H20000038     ' 14: Window WatchDog Interrupt                                         
#define PVD_ISR                     *&H2000003C     ' 15: PVD through EXTI Line detection Interrupt                         
#define TAMP_STAMP_ISR              *&H20000040     ' 16: Tamper and TimeStamp interrupts through the EXTI line             
#define RTC_WKUP_ISR                *&H20000044     ' 17: RTC Wakeup interrupt through the EXTI line                        
#define FLASH_ISR                   *&H20000048     ' 18: FLASH global Interrupt                                            
#define RCC_ISR                     *&H2000004C     ' 19: RCC global Interrupt                                              
#define EXTI0_ISR                   *&H20000050     ' 20: EXTI Line0 Interrupt                                              
#define EXTI1_ISR                   *&H20000054     ' 21: EXTI Line1 Interrupt                                              
#define EXTI2_ISR                   *&H20000058     ' 22: EXTI Line2 Interrupt                                              
#define EXTI3_ISR                   *&H2000005C     ' 23: EXTI Line3 Interrupt                                              
#define EXTI4_ISR                   *&H20000060     ' 24: EXTI Line4 Interrupt                                              
#define DMA1_Stream0_ISR            *&H20000064     ' 25: DMA1 Stream 0 global Interrupt                                    
#define DMA1_Stream1_ISR            *&H20000068     ' 26: DMA1 Stream 1 global Interrupt                                    
#define DMA1_Stream2_ISR            *&H2000006C     ' 27: DMA1 Stream 2 global Interrupt                                    
#define DMA1_Stream3_ISR            *&H20000070     ' 28: DMA1 Stream 3 global Interrupt                                    
#define DMA1_Stream4_ISR            *&H20000074     ' 29: DMA1 Stream 4 global Interrupt                                    
#define DMA1_Stream5_ISR            *&H20000078     ' 30: DMA1 Stream 5 global Interrupt                                    
#define DMA1_Stream6_ISR            *&H2000007C     ' 31: DMA1 Stream 6 global Interrupt                                    
#define ADC_ISR                     *&H20000080     ' 32: ADC1, ADC2 and ADC3 global Interrupts                             
#define EXTI9_5_ISR                 *&H20000094     ' 37: External Line[9:5] Interrupts                                     
#define TIM1_BRK_TIM9_ISR           *&H20000098     ' 38: TIM1 Break interrupt and TIM9 global interrupt                    
#define TIM1_UP_TIM10_ISR           *&H2000009C     ' 39: TIM1 Update Interrupt and TIM10 global interrupt                  
#define TIM1_TRG_COM_TIM11_ISR      *&H200000A0     ' 40: TIM1 Trigger and Commutation Interrupt and TIM11 global interrupt 
#define TIM1_CC_ISR                 *&H200000A4     ' 41: TIM1 Capture Compare Interrupt                                    
#define TIM2_ISR                    *&H200000A8     ' 42: TIM2 global Interrupt                                             
#define TIM3_ISR                    *&H200000AC     ' 43: TIM3 global Interrupt                                             
#define TIM4_ISR                    *&H200000B0     ' 44: TIM4 global Interrupt                                             
#define I2C1_EV_ISR                 *&H200000B4     ' 45: I2C1 Event Interrupt                                              
#define I2C1_ER_ISR                 *&H200000B8     ' 46: I2C1 Error Interrupt                                              
#define I2C2_EV_ISR                 *&H200000BC     ' 47: I2C2 Event Interrupt                                              
#define I2C2_ER_ISR                 *&H200000C0     ' 48: I2C2 Error Interrupt                                                
#define SPI1_ISR                    *&H200000C4     ' 49: SPI1 global Interrupt                                             
#define SPI2_ISR                    *&H200000C8     ' 50: SPI2 global Interrupt                                             
#define USART1_ISR                  *&H200000CC     ' 51: USART1 global Interrupt                                           
#define USART2_ISR                  *&H200000D0     ' 52: USART2 global Interrupt                                           
#define EXTI15_10_ISR               *&H200000D8     ' 54: External Line[15:10] Interrupts                                   
#define RTC_Alarm_ISR               *&H200000DC     ' 55: RTC Alarm (A and B) through EXTI Line Interrupt                   
#define OTG_FS_WKUP_ISR             *&H200000E0     ' 56: USB OTG FS Wakeup through EXTI line interrupt                       
#define DMA1_Stream7_ISR            *&H200000F4     ' 61: DMA1 Stream7 Interrupt                                            
#define SDIO_ISR                    *&H200000FC     ' 63: SDIO global Interrupt                                             
#define TIM5_ISR                    *&H20000100     ' 64: TIM5 global Interrupt                                             
#define SPI3_ISR                    *&H20000104     ' 65: SPI3 global Interrupt                                             
#define DMA2_Stream0_ISR            *&H20000118     ' 70: DMA2 Stream 0 global Interrupt                                    
#define DMA2_Stream1_ISR            *&H2000011C     ' 71: DMA2 Stream 1 global Interrupt                                    
#define DMA2_Stream2_ISR            *&H20000120     ' 72: DMA2 Stream 2 global Interrupt                                    
#define DMA2_Stream3_ISR            *&H20000124     ' 73: DMA2 Stream 3 global Interrupt                                    
#define DMA2_Stream4_ISR            *&H20000128     ' 74: DMA2 Stream 4 global Interrupt                                    
#define OTG_FS_ISR                  *&H20000144     ' 81: USB OTG FS global Interrupt                                       
#define DMA2_Stream5_ISR            *&H20000148     ' 82: DMA2 Stream 5 global interrupt                                    
#define DMA2_Stream6_ISR            *&H2000014C     ' 83: DMA2 Stream 6 global interrupt                                    
#define DMA2_Stream7_ISR            *&H20000150     ' 84: DMA2 Stream 7 global interrupt                                    
#define USART6_ISR                  *&H20000154     ' 85: USART6 global interrupt                                           
#define I2C3_EV_ISR                 *&H20000158     ' 86: I2C3 event interrupt                                              
#define I2C3_ER_ISR                 *&H2000015C     ' 87: I2C3 error interrupt                                              
#define FPU_ISR                     *&H2000017C     ' 95: FPU global interrupt                                              
#define SPI4_ISR                    *&H20000188     ' 98: SPI4 global Interrupt                                             
#define SPI5_ISR                    *&H2000018C     ' 99: SPI5 global Interrupt                                             

' ADC1
#define ADC1_SR    *&H40012000  '  ADC status register,                         Address offset: 0x00 
#define ADC1_CR1   *&H40012004  '  ADC control register 1,                      Address offset: 0x04       
#define ADC1_CR2   *&H40012008  '  ADC control register 2,                      Address offset: 0x08 
#define ADC1_SMPR1 *&H4001200C  '  ADC sample time register 1,                  Address offset: 0x0C 
#define ADC1_SMPR2 *&H40012010  '  ADC sample time register 2,                  Address offset: 0x10 
#define ADC1_JOFR1 *&H40012014  '  ADC injected channel data offset register 1, Address offset: 0x14 
#define ADC1_JOFR2 *&H40012018  '  ADC injected channel data offset register 2, Address offset: 0x18 
#define ADC1_JOFR3 *&H4001201C  '  ADC injected channel data offset register 3, Address offset: 0x1C 
#define ADC1_JOFR4 *&H40012020  '  ADC injected channel data offset register 4, Address offset: 0x20 
#define ADC1_HTR   *&H40012024  '  ADC watchdog higher threshold register,      Address offset: 0x24 
#define ADC1_LTR   *&H40012028  '  ADC watchdog lower threshold register,       Address offset: 0x28 
#define ADC1_SQR1  *&H4001202C  '  ADC regular sequence register 1,             Address offset: 0x2C 
#define ADC1_SQR2  *&H40012030  '  ADC regular sequence register 2,             Address offset: 0x30 
#define ADC1_SQR3  *&H40012034  '  ADC regular sequence register 3,             Address offset: 0x34 
#define ADC1_JSQR  *&H40012038  '  ADC injected sequence register,              Address offset: 0x38
#define ADC1_JDR1  *&H4001203C  '  ADC injected data register 1,                Address offset: 0x3C 
#define ADC1_JDR2  *&H40012040  '  ADC injected data register 2,                Address offset: 0x40 
#define ADC1_JDR3  *&H40012044  '  ADC injected data register 3,                Address offset: 0x44 
#define ADC1_JDR4  *&H40012048  '  ADC injected data register 4,                Address offset: 0x48 
#define ADC1_DR    *&H4001204C  '  ADC regular data register,                   Address offset: 0x4C 

' ADC Common
#define ADC_CSR    *&H40012300  '  ADC Common status register,                  Address offset: ADC1 base address + 0x300 
#define ADC_CCR    *&H40012304  '  ADC common control register,                 Address offset: ADC1 base address + 0x304 
#define ADC_CDR    *&H40012308  '  ADC common regular data register for dual
                                '  AND triple modes,                            Address offset: ADC1 base address + 0x308 
' CRC calculation unit 
#define CRC_DR     *&H40023000  '  CRC Data register,             Address offset: 0x00 
#define CRC_IDR    *&H40023004  '  CRC Independent data register, Address offset: 0x04 
#define CRC_CR     *&H40023008  '  CRC Control register,          Address offset: 0x08 

' Debug MCU
#define DBGMCU_IDCODE *&HE0042000  '  MCU device ID code,               Address offset: 0x00 
#define DBGMCU_CR     *&HE0042004  '  Debug MCU configuration register, Address offset: 0x04 
#define DBGMCU_APB1FZ *&HE0042008  '  Debug MCU APB1 freeze register,   Address offset: 0x08 
#define DBGMCU_APB2FZ *&HE004200C  '  Debug MCU APB2 freeze register,   Address offset: 0x0C 

' DMA Controller
#define DMA1_LISR     *&H40026000 '  DMA low interrupt status register,      Address offset: 0x00 
#define DMA1_HISR     *&H40026004 '  DMA high interrupt status register,     Address offset: 0x04 
#define DMA1_LIFCR    *&H40026008 '  DMA low interrupt flag clear register,  Address offset: 0x08 
#define DMA1_HIFCR    *&H4002600C '  DMA high interrupt flag clear register, Address offset: 0x0C 
#define DMA2_LISR     *&H40026400
#define DMA2_HISR     *&H40026404
#define DMA2_LIFCR    *&H40026408
#define DMA2_HIFCR    *&H4002640C


#define DMA1_Stream0_CR   *&H40026010 '  DMA stream x configuration register      
#define DMA1_Stream0_NDTR *&H40026014 '  DMA stream x number of data register     
#define DMA1_Stream0_PAR  *&H40026018 '  DMA stream x peripheral address register 
#define DMA1_Stream0_M0AR *&H4002601C '  DMA stream x memory 0 address register   
#define DMA1_Stream0_M1AR *&H40026020 '  DMA stream x memory 1 address register   
#define DMA1_Stream0_FCR  *&H40026024 '  DMA stream x FIFO control register     
#define DMA1_Stream1_CR   *&H40026028
#define DMA1_Stream1_NDTR *&H4002602C
#define DMA1_Stream1_PAR  *&H40026030
#define DMA1_Stream1_M0AR *&H40026034
#define DMA1_Stream1_M1AR *&H40026038
#define DMA1_Stream1_FCR  *&H4002603C
#define DMA1_Stream2_CR   *&H40026040
#define DMA1_Stream2_NDTR *&H40026044
#define DMA1_Stream2_PAR  *&H40026048
#define DMA1_Stream2_M0AR *&H4002604C
#define DMA1_Stream2_M1AR *&H40026050
#define DMA1_Stream2_FCR  *&H40026054
#define DMA1_Stream3_CR   *&H40026058
#define DMA1_Stream3_NDTR *&H4002605C
#define DMA1_Stream3_PAR  *&H40026060
#define DMA1_Stream3_M0AR *&H40026064
#define DMA1_Stream3_M1AR *&H40026068
#define DMA1_Stream3_FCR  *&H4002606C
#define DMA1_Stream4_CR   *&H40026070
#define DMA1_Stream4_NDTR *&H40026074
#define DMA1_Stream4_PAR  *&H40026078
#define DMA1_Stream4_M0AR *&H4002607C
#define DMA1_Stream4_M1AR *&H40026080
#define DMA1_Stream4_FCR  *&H40026084
#define DMA1_Stream5_CR   *&H40026088
#define DMA1_Stream5_NDTR *&H4002608C
#define DMA1_Stream5_PAR  *&H40026090
#define DMA1_Stream5_M0AR *&H40026094
#define DMA1_Stream5_M1AR *&H40026098
#define DMA1_Stream5_FCR  *&H4002609C
#define DMA1_Stream6_CR   *&H400260A0
#define DMA1_Stream6_NDTR *&H400260A4
#define DMA1_Stream6_PAR  *&H400260A8
#define DMA1_Stream6_M0AR *&H400260AC
#define DMA1_Stream6_M1AR *&H400260B0
#define DMA1_Stream6_FCR  *&H400260B4
#define DMA1_Stream7_CR   *&H400260B8
#define DMA1_Stream7_NDTR *&H400260BC
#define DMA1_Stream7_PAR  *&H400260C0
#define DMA1_Stream7_M0AR *&H400260C4
#define DMA1_Stream7_M1AR *&H400260C8
#define DMA1_Stream7_FCR  *&H400260CC
#define DMA2_Stream0_CR   *&H40026410
#define DMA2_Stream0_NDTR *&H40026414
#define DMA2_Stream0_PAR  *&H40026418
#define DMA2_Stream0_M0AR *&H4002641C
#define DMA2_Stream0_M1AR *&H40026420
#define DMA2_Stream0_FCR  *&H40026424
#define DMA2_Stream1_CR   *&H40026428
#define DMA2_Stream1_NDTR *&H4002642C
#define DMA2_Stream1_PAR  *&H40026430
#define DMA2_Stream1_M0AR *&H40026434
#define DMA2_Stream1_M1AR *&H40026438
#define DMA2_Stream1_FCR  *&H4002643C
#define DMA2_Stream2_CR   *&H40026440
#define DMA2_Stream2_NDTR *&H40026444
#define DMA2_Stream2_PAR  *&H40026448
#define DMA2_Stream2_M0AR *&H4002644C
#define DMA2_Stream2_M1AR *&H40026450
#define DMA2_Stream2_FCR  *&H40026454
#define DMA2_Stream3_CR   *&H40026458
#define DMA2_Stream3_NDTR *&H4002645C
#define DMA2_Stream3_PAR  *&H40026460
#define DMA2_Stream3_M0AR *&H40026464
#define DMA2_Stream3_M1AR *&H40026468
#define DMA2_Stream3_FCR  *&H4002646C
#define DMA2_Stream4_CR   *&H40026470
#define DMA2_Stream4_NDTR *&H40026474
#define DMA2_Stream4_PAR  *&H40026478
#define DMA2_Stream4_M0AR *&H4002647C
#define DMA2_Stream4_M1AR *&H40026480
#define DMA2_Stream4_FCR  *&H40026484
#define DMA2_Stream5_CR   *&H40026488
#define DMA2_Stream5_NDTR *&H4002648C
#define DMA2_Stream5_PAR  *&H40026490
#define DMA2_Stream5_M0AR *&H40026494
#define DMA2_Stream5_M1AR *&H40026498
#define DMA2_Stream5_FCR  *&H4002649C
#define DMA2_Stream6_CR   *&H400264A0
#define DMA2_Stream6_NDTR *&H400264A4
#define DMA2_Stream6_PAR  *&H400264A8
#define DMA2_Stream6_M0AR *&H400264AC
#define DMA2_Stream6_M1AR *&H400264B0
#define DMA2_Stream6_FCR  *&H400264B4
#define DMA2_Stream7_CR   *&H400264B8
#define DMA2_Stream7_NDTR *&H400264BC
#define DMA2_Stream7_PAR  *&H400264C0
#define DMA2_Stream7_M0AR *&H400264C4
#define DMA2_Stream7_M1AR *&H400264C8
#define DMA2_Stream7_FCR  *&H400264CC

' External Interrupt/Event Controller
#define EXTI_IMR   *&H40013C00  '  EXTI Interrupt mask register,            Address offset: 0x00 
#define EXTI_EMR   *&H40013C04  '  EXTI Event mask register,                Address offset: 0x04 
#define EXTI_RTSR  *&H40013C08  '  EXTI Rising trigger selection register,  Address offset: 0x08 
#define EXTI_FTSR  *&H40013C0C  '  EXTI Falling trigger selection register, Address offset: 0x0C 
#define EXTI_SWIER *&H40013C10  '  EXTI Software interrupt event register,  Address offset: 0x10 
#define EXTI_PR    *&H40013C14  '  EXTI Pending register,                   Address offset: 0x14 

' FLASH Registers
#define FLASH_ACR     *&H40023C00 '  FLASH access control register,   Address offset: 0x00 
#define FLASH_KEYR    *&H40023C04 '  FLASH key register,              Address offset: 0x04 
#define FLASH_OPTKEYR *&H40023C08 '  FLASH option key register,       Address offset: 0x08 
#define FLASH_SR      *&H40023C0C '  FLASH status register,           Address offset: 0x0C 
#define FLASH_CR      *&H40023C10 '  FLASH control register,          Address offset: 0x10 
#define FLASH_OPTCR   *&H40023C14 '  FLASH option control register ,  Address offset: 0x14 
#define FLASH_OPTCR1  *&H40023C18 '  FLASH option control register 1, Address offset: 0x18 

' General Purpose I/O
#define GPIOA_MODER   *&H40020000  '  GPIO port mode register,               Address offset: 0x00      
#define GPIOA_OTYPER  *&H40020004  '  GPIO port output type register,        Address offset: 0x04      
#define GPIOA_OSPEEDR *&H40020008  '  GPIO port output speed register,       Address offset: 0x08      
#define GPIOA_PUPDR   *&H4002000C  '  GPIO port pull-up/pull-down register,  Address offset: 0x0C      
#define GPIOA_IDR     *&H40020010  '  GPIO port input data register,         Address offset: 0x10      
#define GPIOA_ODR     *&H40020014  '  GPIO port output data register,        Address offset: 0x14      
#define GPIOA_BSRR    *&H40020018  '  GPIO port bit set/reset register,      Address offset: 0x18      
#define GPIOA_LCKR    *&H4002001C  '  GPIO port configuration lock register, Address offset: 0x1C      
#define GPIOA_AFR0    *&H40020020  '  GPIO alternate function registers,     Address offset: 0x20-0x24 
#define GPIOA_AFR1    *&H40020024

#define GPIOB_MODER   *&H40020400
#define GPIOB_OTYPER  *&H40020404
#define GPIOB_OSPEEDR *&H40020408
#define GPIOB_PUPDR   *&H4002040C
#define GPIOB_IDR     *&H40020410
#define GPIOB_ODR     *&H40020414
#define GPIOB_BSRR    *&H40020418
#define GPIOB_LCKR    *&H4002041C
#define GPIOB_AFR0    *&H40020420
#define GPIOB_AFR1    *&H40020424

#define GPIOC_MODER   *&H40020800
#define GPIOC_OTYPER  *&H40020804
#define GPIOC_OSPEEDR *&H40020808
#define GPIOC_PUPDR   *&H4002080C
#define GPIOC_IDR     *&H40020810
#define GPIOC_ODR     *&H40020814
#define GPIOC_BSRR    *&H40020818
#define GPIOC_LCKR    *&H4002081C
#define GPIOC_AFR0    *&H40020820
#define GPIOC_AFR1    *&H40020824

#define GPIOD_MODER   *&H40020C00
#define GPIOD_OTYPER  *&H40020C04
#define GPIOD_OSPEEDR *&H40020C08
#define GPIOD_PUPDR   *&H40020C0C
#define GPIOD_IDR     *&H40020C10
#define GPIOD_ODR     *&H40020C14
#define GPIOD_BSRR    *&H40020C18
#define GPIOD_LCKR    *&H40020C1C
#define GPIOD_AFR0    *&H40020C20
#define GPIOD_AFR1    *&H40020C24

' System configuration controller
#define SYSCFG_MEMRMP    *&H40013800    '  SYSCFG memory remap register,                      Address offset: 0x00      
#define SYSCFG_PMC       *&H40013804    '  SYSCFG peripheral mode configuration register,     Address offset: 0x04      
#define SYSCFG_EXTICR0   *&H40013808    '  SYSCFG external interrupt configuration registers, Address offset: 0x08-0x14 
#define SYSCFG_EXTICR1   *&H4001380C
#define SYSCFG_EXTICR2   *&H40013810
#define SYSCFG_EXTICR3   *&H40013814
#define SYSCFG_CMPCR     *&H40013820    '  SYSCFG Compensation cell control register,         Address offset: 0x20    

' Inter-integrated Circuit Interface
#define I2C1_CR1   *&H40005400      '  I2C Control register 1,     Address offset: 0x00 
#define I2C1_CR2   *&H40005404      '  I2C Control register 2,     Address offset: 0x04 
#define I2C1_OAR1  *&H40005408      '  I2C Own address register 1, Address offset: 0x08 
#define I2C1_OAR2  *&H4000540C      '  I2C Own address register 2, Address offset: 0x0C 
#define I2C1_DR    *&H40005410      '  I2C Data register,          Address offset: 0x10 
#define I2C1_SR1   *&H40005414      '  I2C Status register 1,      Address offset: 0x14 
#define I2C1_SR2   *&H40005418      '  I2C Status register 2,      Address offset: 0x18 
#define I2C1_CCR   *&H4000541C      '  I2C Clock control register, Address offset: 0x1C 
#define I2C1_TRISE *&H40005420      '  I2C TRISE register,         Address offset: 0x20 
#define I2C1_FLTR  *&H40005424      '  I2C FLTR register,          Address offset: 0x24 

#define I2C2_CR1   *&H40005800
#define I2C2_CR2   *&H40005804
#define I2C2_OAR1  *&H40005808
#define I2C2_OAR2  *&H4000580C
#define I2C2_DR    *&H40005810
#define I2C2_SR1   *&H40005814
#define I2C2_SR2   *&H40005818
#define I2C2_CCR   *&H4000581C
#define I2C2_TRISE *&H40005820
#define I2C2_FLTR  *&H40005824
#define I2C3_CR1   *&H40005C00

#define I2C3_CR2   *&H40005C04
#define I2C3_OAR1  *&H40005C08
#define I2C3_OAR2  *&H40005C0C
#define I2C3_DR    *&H40005C10
#define I2C3_SR1   *&H40005C14
#define I2C3_SR2   *&H40005C18
#define I2C3_CCR   *&H40005C1C
#define I2C3_TRISE *&H40005C20
#define I2C3_FLTR  *&H40005C24

' Independent WATCHDOG
#define IWDG_KR  *&H40003000  '  IWDG Key register,       Address offset: 0x00 
#define IWDG_PR  *&H40003004  '  IWDG Prescaler register, Address offset: 0x04 
#define IWDG_RLR *&H40003008  '  IWDG Reload register,    Address offset: 0x08 
#define IWDG_SR  *&H4000300C  '  IWDG Status register,    Address offset: 0x0C 

' Power Control
#define PWR_CR  *&H40007000  '  PWR power control register,        Address offset: 0x00 
#define PWR_CSR *&H40007004  '  PWR power control/status register, Address offset: 0x04 

' Reset and Clock Control
#define RCC_CR         *&H40023800    '  RCC clock control register,                                  Address offset: 0x00 
#define RCC_PLLCFGR    *&H40023804    '  RCC PLL configuration register,                              Address offset: 0x04 
#define RCC_CFGR       *&H40023808    '  RCC clock configuration register,                            Address offset: 0x08 
#define RCC_CIR        *&H4002380C    '  RCC clock interrupt register,                                Address offset: 0x0C 
#define RCC_AHB1RSTR   *&H40023810    '  RCC AHB1 peripheral reset register,                          Address offset: 0x10 
#define RCC_AHB2RSTR   *&H40023814    '  RCC AHB2 peripheral reset register,                          Address offset: 0x14 
#define RCC_AHB3RSTR   *&H40023818    '  RCC AHB3 peripheral reset register,                          Address offset: 0x18 
#define RCC_APB1RSTR   *&H40023820    '  RCC APB1 peripheral reset register,                          Address offset: 0x20 
#define RCC_APB2RSTR   *&H40023824    '  RCC APB2 peripheral reset register,                          Address offset: 0x24 
#define RCC_AHB1ENR    *&H40023830    '  RCC AHB1 peripheral clock register,                          Address offset: 0x30 
#define RCC_AHB2ENR    *&H40023834    '  RCC AHB2 peripheral clock register,                          Address offset: 0x34 
#define RCC_AHB3ENR    *&H40023838    '  RCC AHB3 peripheral clock register,                          Address offset: 0x38 
#define RCC_APB1ENR    *&H40023840    '  RCC APB1 peripheral clock enable register,                   Address offset: 0x40 
#define RCC_APB2ENR    *&H40023844    '  RCC APB2 peripheral clock enable register,                   Address offset: 0x44 
#define RCC_AHB1LPENR  *&H40023850    '  RCC AHB1 peripheral clock enable in low power mode register, Address offset: 0x50 
#define RCC_AHB2LPENR  *&H40023854    '  RCC AHB2 peripheral clock enable in low power mode register, Address offset: 0x54 
#define RCC_AHB3LPENR  *&H40023858    '  RCC AHB3 peripheral clock enable in low power mode register, Address offset: 0x58 
#define RCC_APB1LPENR  *&H40023860    '  RCC APB1 peripheral clock enable in low power mode register, Address offset: 0x60 
#define RCC_APB2LPENR  *&H40023864    '  RCC APB2 peripheral clock enable in low power mode register, Address offset: 0x64 
#define RCC_BDCR       *&H40023870    '  RCC Backup domain control register,                          Address offset: 0x70 
#define RCC_CSR        *&H40023874    '  RCC clock control & status register,                         Address offset: 0x74 
#define RCC_SSCGR      *&H40023880    '  RCC spread spectrum clock generation register,               Address offset: 0x80 
#define RCC_PLLI2SCFGR *&H40023884    '  RCC PLLI2S configuration register,                           Address offset: 0x84 

' Real-Time Clock
#define RTC_TR       *&H40002800  '  RTC time register,                                        Address offset: 0x00 
#define RTC_DR       *&H40002804  '  RTC date register,                                        Address offset: 0x04 
#define RTC_CR       *&H40002808  '  RTC control register,                                     Address offset: 0x08 
#define RTC_ISR      *&H4000280C  '  RTC initialization and status register,                   Address offset: 0x0C 
#define RTC_PRER     *&H40002810  '  RTC prescaler register,                                   Address offset: 0x10 
#define RTC_WUTR     *&H40002814  '  RTC wakeup timer register,                                Address offset: 0x14 
#define RTC_CALIBR   *&H40002818  '  RTC calibration register,                                 Address offset: 0x18 
#define RTC_ALRMAR   *&H4000281C  '  RTC alarm A register,                                     Address offset: 0x1C 
#define RTC_ALRMBR   *&H40002820  '  RTC alarm B register,                                     Address offset: 0x20 
#define RTC_WPR      *&H40002824  '  RTC write protection register,                            Address offset: 0x24 
#define RTC_SSR      *&H40002828  '  RTC sub second register,                                  Address offset: 0x28 
#define RTC_SHIFTR   *&H4000282C  '  RTC shift control register,                               Address offset: 0x2C 
#define RTC_TSTR     *&H40002830  '  RTC time stamp time register,                             Address offset: 0x30 
#define RTC_TSDR     *&H40002834  '  RTC time stamp date register,                             Address offset: 0x34 
#define RTC_TSSSR    *&H40002838  '  RTC time-stamp sub second register,                       Address offset: 0x38 
#define RTC_CALR     *&H4000283C  '  RTC calibration register,                                 Address offset: 0x3C 
#define RTC_TAFCR    *&H40002840  '  RTC tamper and alternate function configuration register, Address offset: 0x40 
#define RTC_ALRMASSR *&H40002844  '  RTC alarm A sub second register,                          Address offset: 0x44 
#define RTC_ALRMBSSR *&H40002848  '  RTC alarm B sub second register,                          Address offset: 0x48 
#define RTC_BKP0R    *&H40002850  '  RTC backup register 1,                                    Address offset: 0x50 
#define RTC_BKP1R    *&H40002854  '  RTC backup register 1,                                    Address offset: 0x54 
#define RTC_BKP2R    *&H40002858  '  RTC backup register 2,                                    Address offset: 0x58 
#define RTC_BKP3R    *&H4000285C  '  RTC backup register 3,                                    Address offset: 0x5C 
#define RTC_BKP4R    *&H40002860  '  RTC backup register 4,                                    Address offset: 0x60 
#define RTC_BKP5R    *&H40002864  '  RTC backup register 5,                                    Address offset: 0x64 
#define RTC_BKP6R    *&H40002868  '  RTC backup register 6,                                    Address offset: 0x68 
#define RTC_BKP7R    *&H4000286C  '  RTC backup register 7,                                    Address offset: 0x6C 
#define RTC_BKP8R    *&H40002870  '  RTC backup register 8,                                    Address offset: 0x70 
#define RTC_BKP9R    *&H40002874  '  RTC backup register 9,                                    Address offset: 0x74 
#define RTC_BKP10R   *&H40002878  '  RTC backup register 10,                                   Address offset: 0x78 
#define RTC_BKP11R   *&H4000287C  '  RTC backup register 11,                                   Address offset: 0x7C 
#define RTC_BKP12R   *&H40002880  '  RTC backup register 12,                                   Address offset: 0x80 
#define RTC_BKP13R   *&H40002884  '  RTC backup register 13,                                   Address offset: 0x84 
#define RTC_BKP14R   *&H40002888  '  RTC backup register 14,                                   Address offset: 0x88 
#define RTC_BKP15R   *&H4000288C  '  RTC backup register 15,                                   Address offset: 0x8C 
#define RTC_BKP16R   *&H40002890  '  RTC backup register 16,                                   Address offset: 0x90 
#define RTC_BKP17R   *&H40002894  '  RTC backup register 17,                                   Address offset: 0x94 
#define RTC_BKP18R   *&H40002898  '  RTC backup register 18,                                   Address offset: 0x98 
#define RTC_BKP19R   *&H4000289C  '  RTC backup register 19,                                   Address offset: 0x9C 

' SD host Interface
#define SDIO_POWER   *&H40012C00  '  SDIO power control register,    Address offset: 0x00 
#define SDIO_CLKCR   *&H40012C04  '  SDI clock control register,     Address offset: 0x04 
#define SDIO_ARG     *&H40012C08  '  SDIO argument register,         Address offset: 0x08 
#define SDIO_CMD     *&H40012C0C  '  SDIO command register,          Address offset: 0x0C 
#define SDIO_RESPCMD *&H40012C10  '  SDIO command response register, Address offset: 0x10 
#define SDIO_RESP1   *&H40012C14  '  SDIO response 1 register,       Address offset: 0x14 
#define SDIO_RESP2   *&H40012C18  '  SDIO response 2 register,       Address offset: 0x18 
#define SDIO_RESP3   *&H40012C1C  '  SDIO response 3 register,       Address offset: 0x1C 
#define SDIO_RESP4   *&H40012C20  '  SDIO response 4 register,       Address offset: 0x20 
#define SDIO_DTIMER  *&H40012C24  '  SDIO data timer register,       Address offset: 0x24 
#define SDIO_DLEN    *&H40012C28  '  SDIO data length register,      Address offset: 0x28 
#define SDIO_DCTRL   *&H40012C2C  '  SDIO data control register,     Address offset: 0x2C 
#define SDIO_DCOUNT  *&H40012C30  '  SDIO data counter register,     Address offset: 0x30 
#define SDIO_STA     *&H40012C34  '  SDIO status register,           Address offset: 0x34 
#define SDIO_ICR     *&H40012C38  '  SDIO interrupt clear register,  Address offset: 0x38 
#define SDIO_MASK    *&H40012C3C  '  SDIO mask register,             Address offset: 0x3C 
#define SDIO_FIFOCNT *&H40012C48  '  SDIO FIFO counter register,     Address offset: 0x48 
#define SDIO_FIFO    *&H40012C80  '  SDIO data FIFO register,        Address offset: 0x80 

' Serial Peripheral Interface
#define SPI1_CR1     *&H40013000    '  SPI control register 1 (not used in I2S mode),      Address offset: 0x00 
#define SPI1_CR2     *&H40013004    '  SPI control register 2,                             Address offset: 0x04 
#define SPI1_SR      *&H40013008    '  SPI status register,                                Address offset: 0x08 
#define SPI1_DR      *&H4001300C    '  SPI data register,                                  Address offset: 0x0C 
#define SPI1_CRCPR   *&H40013010    '  SPI CRC polynomial register (not used in I2S mode), Address offset: 0x10 
#define SPI1_RXCRCR  *&H40013014    '  SPI RX CRC register (not used in I2S mode),         Address offset: 0x14 
#define SPI1_TXCRCR  *&H40013018    '  SPI TX CRC register (not used in I2S mode),         Address offset: 0x18 
#define SPI1_I2SCFGR *&H4001301C    '  SPI_I2S configuration register,                     Address offset: 0x1C 
#define SPI1_I2SPR   *&H40013020    '  SPI_I2S prescaler register,                         Address offset: 0x20 

#define SPI2_CR1     *&H40003800
#define SPI2_CR2     *&H40003804
#define SPI2_SR      *&H40003808
#define SPI2_DR      *&H4000380C
#define SPI2_CRCPR   *&H40003810
#define SPI2_RXCRCR  *&H40003814
#define SPI2_TXCRCR  *&H40003818
#define SPI2_I2SCFGR *&H4000381C
#define SPI2_I2SPR   *&H40003820

#define SPI3_CR1     *&H40003C00
#define SPI3_CR2     *&H40003C04
#define SPI3_SR      *&H40003C08
#define SPI3_DR      *&H40003C0C
#define SPI3_CRCPR   *&H40003C10
#define SPI3_RXCRCR  *&H40003C14
#define SPI3_TXCRCR  *&H40003C18
#define SPI3_I2SCFGR *&H40003C1C
#define SPI3_I2SPR   *&H40003C20

#define SPI4_CR1     *&H40013400
#define SPI4_CR2     *&H40013404
#define SPI4_SR      *&H40013408
#define SPI4_DR      *&H4001340C
#define SPI4_CRCPR   *&H40013410
#define SPI4_RXCRCR  *&H40013414
#define SPI4_TXCRCR  *&H40013418
#define SPI4_I2SCFGR *&H4001341C
#define SPI4_I2SPR   *&H40013420

' TIM
#define TIM1_CR1   *&H40010000    '  TIM control register 1,              Address offset: 0x00 
#define TIM1_CR2   *&H40010004    '  TIM control register 2,              Address offset: 0x04 
#define TIM1_SMCR  *&H40010008    '  TIM slave mode control register,     Address offset: 0x08 
#define TIM1_DIER  *&H4001000C    '  TIM DMA/interrupt enable register,   Address offset: 0x0C 
#define TIM1_SR    *&H40010010    '  TIM status register,                 Address offset: 0x10 
#define TIM1_EGR   *&H40010014    '  TIM event generation register,       Address offset: 0x14 
#define TIM1_CCMR1 *&H40010018    '  TIM capture/compare mode register 1, Address offset: 0x18 
#define TIM1_CCMR2 *&H4001001C    '  TIM capture/compare mode register 2, Address offset: 0x1C 
#define TIM1_CCER  *&H40010020    '  TIM capture/compare enable register, Address offset: 0x20 
#define TIM1_CNT   *&H40010024    '  TIM counter register,                Address offset: 0x24 
#define TIM1_PSC   *&H40010028    '  TIM prescaler,                       Address offset: 0x28 
#define TIM1_ARR   *&H4001002C    '  TIM auto-reload register,            Address offset: 0x2C 
#define TIM1_RCR   *&H40010030    '  TIM repetition counter register,     Address offset: 0x30 
#define TIM1_CCR1  *&H40010034    '  TIM capture/compare register 1,      Address offset: 0x34 
#define TIM1_CCR2  *&H40010038    '  TIM capture/compare register 2,      Address offset: 0x38 
#define TIM1_CCR3  *&H4001003C    '  TIM capture/compare register 3,      Address offset: 0x3C 
#define TIM1_CCR4  *&H40010040    '  TIM capture/compare register 4,      Address offset: 0x40 
#define TIM1_BDTR  *&H40010044    '  TIM break and dead-time register,    Address offset: 0x44 
#define TIM1_DCR   *&H40010048    '  TIM DMA control register,            Address offset: 0x48 
#define TIM1_DMAR  *&H4001004C    '  TIM DMA address for full transfer,   Address offset: 0x4C 
#define TIM1_OR    *&H40010050    '  TIM option register,                 Address offset: 0x50 

#define TIM2_CR1   *&H40000000
#define TIM2_CR2   *&H40000004
#define TIM2_SMCR  *&H40000008
#define TIM2_DIER  *&H4000000C
#define TIM2_SR    *&H40000010
#define TIM2_EGR   *&H40000014
#define TIM2_CCMR1 *&H40000018
#define TIM2_CCMR2 *&H4000001C
#define TIM2_CCER  *&H40000020
#define TIM2_CNT   *&H40000024
#define TIM2_PSC   *&H40000028
#define TIM2_ARR   *&H4000002C
#define TIM2_RCR   *&H40000030
#define TIM2_CCR1  *&H40000034
#define TIM2_CCR2  *&H40000038
#define TIM2_CCR3  *&H4000003C
#define TIM2_CCR4  *&H40000040
#define TIM2_BDTR  *&H40000044
#define TIM2_DCR   *&H40000048
#define TIM2_DMAR  *&H4000004C
#define TIM2_OR    *&H40000050

#define TIM3_CR1   *&H40000400
#define TIM3_CR2   *&H40000404
#define TIM3_SMCR  *&H40000408
#define TIM3_DIER  *&H4000040C
#define TIM3_SR    *&H40000410
#define TIM3_EGR   *&H40000414
#define TIM3_CCMR1 *&H40000418
#define TIM3_CCMR2 *&H4000041C
#define TIM3_CCER  *&H40000420
#define TIM3_CNT   *&H40000424
#define TIM3_PSC   *&H40000428
#define TIM3_ARR   *&H4000042C
#define TIM3_RCR   *&H40000430
#define TIM3_CCR1  *&H40000434
#define TIM3_CCR2  *&H40000438
#define TIM3_CCR3  *&H4000043C
#define TIM3_CCR4  *&H40000440
#define TIM3_BDTR  *&H40000444
#define TIM3_DCR   *&H40000448
#define TIM3_DMAR  *&H4000044C
#define TIM3_OR    *&H40000450

#define TIM4_CR1   *&H40000800
#define TIM4_CR2   *&H40000804
#define TIM4_SMCR  *&H40000808
#define TIM4_DIER  *&H4000080C
#define TIM4_SR    *&H40000810
#define TIM4_EGR   *&H40000814
#define TIM4_CCMR1 *&H40000818
#define TIM4_CCMR2 *&H4000081C
#define TIM4_CCER  *&H40000820
#define TIM4_CNT   *&H40000824
#define TIM4_PSC   *&H40000828
#define TIM4_ARR   *&H4000082C
#define TIM4_RCR   *&H40000830
#define TIM4_CCR1  *&H40000834
#define TIM4_CCR2  *&H40000838
#define TIM4_CCR3  *&H4000083C
#define TIM4_CCR4  *&H40000840
#define TIM4_BDTR  *&H40000844
#define TIM4_DCR   *&H40000848
#define TIM4_DMAR  *&H4000084C
#define TIM4_OR    *&H40000850

#define TIM5_CR1   *&H40000C00
#define TIM5_CR2   *&H40000C04
#define TIM5_SMCR  *&H40000C08
#define TIM5_DIER  *&H40000C0C
#define TIM5_SR    *&H40000C10
#define TIM5_EGR   *&H40000C14
#define TIM5_CCMR1 *&H40000C18
#define TIM5_CCMR2 *&H40000C1C
#define TIM5_CCER  *&H40000C20
#define TIM5_CNT   *&H40000C24
#define TIM5_PSC   *&H40000C28
#define TIM5_ARR   *&H40000C2C
#define TIM5_RCR   *&H40000C30
#define TIM5_CCR1  *&H40000C34
#define TIM5_CCR2  *&H40000C38
#define TIM5_CCR3  *&H40000C3C
#define TIM5_CCR4  *&H40000C40
#define TIM5_BDTR  *&H40000C44
#define TIM5_DCR   *&H40000C48
#define TIM5_DMAR  *&H40000C4C
#define TIM5_OR    *&H40000C50

#define TIM9_CR1   *&H40014000
#define TIM9_CR2   *&H40014004
#define TIM9_SMCR  *&H40014008
#define TIM9_DIER  *&H4001400C
#define TIM9_SR    *&H40014010
#define TIM9_EGR   *&H40014014
#define TIM9_CCMR1 *&H40014018
#define TIM9_CCMR2 *&H4001401C
#define TIM9_CCER  *&H40014020
#define TIM9_CNT   *&H40014024
#define TIM9_PSC   *&H40014028
#define TIM9_ARR   *&H4001402C
#define TIM9_RCR   *&H40014030
#define TIM9_CCR1  *&H40014034
#define TIM9_CCR2  *&H40014038
#define TIM9_CCR3  *&H4001403C
#define TIM9_CCR4  *&H40014040
#define TIM9_BDTR  *&H40014044
#define TIM9_DCR   *&H40014048
#define TIM9_DMAR  *&H4001404C
#define TIM9_OR    *&H40014050

#define TIM10_CR1   *&H40014400
#define TIM10_CR2   *&H40014404
#define TIM10_SMCR  *&H40014408
#define TIM10_DIER  *&H4001440C
#define TIM10_SR    *&H40014410
#define TIM10_EGR   *&H40014414
#define TIM10_CCMR1 *&H40014418
#define TIM10_CCMR2 *&H4001441C
#define TIM10_CCER  *&H40014420
#define TIM10_CNT   *&H40014424
#define TIM10_PSC   *&H40014428
#define TIM10_ARR   *&H4001442C
#define TIM10_RCR   *&H40014430
#define TIM10_CCR1  *&H40014434
#define TIM10_CCR2  *&H40014438
#define TIM10_CCR3  *&H4001443C
#define TIM10_CCR4  *&H40014440
#define TIM10_BDTR  *&H40014444
#define TIM10_DCR   *&H40014448
#define TIM10_DMAR  *&H4001444C
#define TIM10_OR    *&H40014450

#define TIM11_CR1   *&H40014800
#define TIM11_CR2   *&H40014804
#define TIM11_SMCR  *&H40014808
#define TIM11_DIER  *&H4001480C
#define TIM11_SR    *&H40014810
#define TIM11_EGR   *&H40014814
#define TIM11_CCMR1 *&H40014818
#define TIM11_CCMR2 *&H4001481C
#define TIM11_CCER  *&H40014820
#define TIM11_CNT   *&H40014824
#define TIM11_PSC   *&H40014828
#define TIM11_ARR   *&H4001482C
#define TIM11_RCR   *&H40014830
#define TIM11_CCR1  *&H40014834
#define TIM11_CCR2  *&H40014838
#define TIM11_CCR3  *&H4001483C
#define TIM11_CCR4  *&H40014840
#define TIM11_BDTR  *&H40014844
#define TIM11_DCR   *&H40014848
#define TIM11_DMAR  *&H4001484C
#define TIM11_OR    *&H40014850

' Universal Synchronous Asynchronous Receiver Transmitter
#define UART1_SR   *&H40011000  '  USART Status register,                   Address offset: 0x00 
#define UART1_DR   *&H40011004  '  USART Data register,                     Address offset: 0x04 
#define UART1_BRR  *&H40011008  '  USART Baud rate register,                Address offset: 0x08 
#define UART1_CR1  *&H4001100C  '  USART Control register 1,                Address offset: 0x0C 
#define UART1_CR2  *&H40011010  '  USART Control register 2,                Address offset: 0x10 
#define UART1_CR3  *&H40011014  '  USART Control register 3,                Address offset: 0x14 
#define UART1_GTPR *&H40011018  '  USART Guard time and prescaler register, Address offset: 0x18 

#define UART2_SR   *&H40004400
#define UART2_DR   *&H40004404
#define UART2_BRR  *&H40004408
#define UART2_CR1  *&H4000440C
#define UART2_CR2  *&H40004410
#define UART2_CR3  *&H40004414
#define UART2_GTPR *&H40004418

#define UART6_SR   *&H40011400
#define UART6_DR   *&H40011404
#define UART6_BRR  *&H40011408
#define UART6_CR1  *&H4001140C
#define UART6_CR2  *&H40011410
#define UART6_CR3  *&H40011414
#define UART6_GTPR *&H40011418

' Window WATCHDOG
#define WWDG_CR  *&H40002C00  '  WWDG Control register,       Address offset: 0x00 
#define WWDG_CFR *&H40002C04  '  WWDG Configuration register, Address offset: 0x04 
#define WWDG_SR  *&H40002C08  '  WWDG Status register,        Address offset: 0x08 

' __USB_OTG_Core_register  
#define USB_OTG_FS_GOTGCTL            *&H50000000  '   USB_OTG Control and Status Register    Address offset : 0x00      
#define USB_OTG_FS_GOTGINT            *&H50000004  '   USB_OTG Interrupt Register             Address offset : 0x04      
#define USB_OTG_FS_GAHBCFG            *&H50000008  '   Core AHB Configuration Register        Address offset : 0x08      
#define USB_OTG_FS_GUSBCFG            *&H5000000C  '   Core USB Configuration Register        Address offset : 0x0C      
#define USB_OTG_FS_GRSTCTL            *&H50000010  '   Core Reset Register                    Address offset : 0x10      
#define USB_OTG_FS_GINTSTS            *&H50000014  '   Core Interrupt Register                Address offset : 0x14      
#define USB_OTG_FS_GINTMSK            *&H50000018  '   Core Interrupt Mask Register           Address offset : 0x18      
#define USB_OTG_FS_GRXSTSR            *&H5000001C  '   Receive Sts Q Read Register            Address offset : 0x1C      
#define USB_OTG_FS_GRXSTSP            *&H50000020  '   Receive Sts Q Read & POP Register      Address offset : 0x20      
#define USB_OTG_FS_GRXFSIZ            *&H50000024  ' Receive FIFO Size Register                Address offset : 0x24      
#define USB_OTG_FS_DIEPTXF0_HNPTXFSIZ *&H50000028  '   EP0 / Non Periodic Tx FIFO Size Register Address offset : 0x28    
#define USB_OTG_FS_HNPTXSTS           *&H5000002C  '   Non Periodic Tx FIFO/Queue Sts reg     Address offset : 0x2C      
#define USB_OTG_FS_GCCFG              *&H50000038  '   General Purpose IO Register            Address offset : 0x38      
#define USB_OTG_FS_CID                *&H5000003C  '  User ID Register                          Address offset : 0x3C      
#define USB_OTG_FS_HPTXFSIZ           *&H50000100  '  Host Periodic Tx FIFO Size Reg            Address offset : 0x100 
#define USB_OTG_FS_DIEPTXF0         *&H50000104  '  dev Periodic Transmit FIFO 
#define USB_OTG_FS_DIEPTXF1         *&H50000108
#define USB_OTG_FS_DIEPTXF2         *&H5000010C
#define USB_OTG_FS_DIEPTXF3         *&H50000110
#define USB_OTG_FS_DIEPTXF4         *&H50000114
#define USB_OTG_FS_DIEPTXF5         *&H50000118
#define USB_OTG_FS_DIEPTXF6         *&H5000011C
#define USB_OTG_FS_DIEPTXF7         *&H50000120
#define USB_OTG_FS_DIEPTXF8         *&H50000124
#define USB_OTG_FS_DIEPTXF9         *&H50000128
#define USB_OTG_FS_DIEPTXF10        *&H5000012C
#define USB_OTG_FS_DIEPTXF11        *&H50000130
#define USB_OTG_FS_DIEPTXF12        *&H50000134
#define USB_OTG_FS_DIEPTXF13        *&H50000138
#define USB_OTG_FS_DIEPTXF14        *&H5000013C
#define USB_OTG_FS_DIEPTXF15        *&H50000140

' NOTE there are no USB OTG registers defined in the original STM32F411.h

' core_cm4.h
' Nested Vectored Interrupt Controller, Table 3-4 and ARMv7 ref, appendix B3.4 (page 750) - 32 bit registers
sub NVIC_ENABLE_IRQ(n as integer)
	dim reg as integer

	' not sure whats going on here, we need times 4 because we byte address where C addresses as uint32
	reg = &HE000E100 + ((n >> 5) << 2)
	*reg = (1  <<  (n and 31))

end sub

'#define NVIC_ENABLE_IRQ(n)    *(&HE000E100 + (n >> 5) = (1 << (n and 31)))
'#define NVIC_DISABLE_IRQ(n)   *(&HE000E180 + (n >> 5) = (1 << (n and 31)))
'#define NVIC_SET_PENDING(n)   *(&HE000E200 + (n >> 5) = (1 << (n and 31)))
'#define NVIC_CLEAR_PENDING(n) *(&HE000E280 + (n >> 5) = (1 << (n and 31)))

#define NVIC_ISER0           *&HE000E100
#define NVIC_ISER1           *&HE000E104
#define NVIC_ICER0           *&HE000E180
#define NVIC_ICER1           *&HE000E184

' System Control Space (SCS), ARMv7 ref manual, B3.2, page 708 - 32 bit registers
#define SCB_CPUID              *&HE000ED00 ' CPUID Base Register
#define SCB_ICSR               *&HE000ED04 ' Interrupt Control and State
#define SCB_ICSR_PENDSTSET     *&H04000000
#define SCB_VTOR               *&HE000ED08 ' Vector Table Offset
#define SCB_AIRCR              *&HE000ED0C ' Application Interrupt and Reset Control
#define SCB_SCR                *&HE000ED10 ' System Control Register
#define SCB_CCR                *&HE000ED14 ' Configuration and Control
#define SCB_SHPR1              *&HE000ED18 ' System Handler Priority Register 1
#define SCB_SHPR2              *&HE000ED1C ' System Handler Priority Register 2
#define SCB_SHPR3              *&HE000ED20 ' System Handler Priority Register 3
#define SCB_SHCSR              *&HE000ED24 ' System Handler Control and State
#define SCB_CFSR               *&HE000ED28 ' Configurable Fault Status Register
#define SCB_HFSR               *&HE000ED2C ' HardFault Status
#define SCB_DFSR               *&HE000ED30 ' Debug Fault Status
#define SCB_MMFAR              *&HE000ED34 ' MemManage Fault Address

#define SYST_CSR               *&HE000E010 ' SysTick Control and Status
#define SYST_CSR_COUNTFLAG     *&H00010000
#define SYST_CSR_CLKSOURCE     *&H00000004
#define SYST_CSR_TICKINT       *&H00000002
#define SYST_CSR_ENABLE        *&H00000001
#define SYST_RVR               *&HE000E014 ' SysTick Reload Value Register
#define SYST_CVR               *&HE000E018 ' SysTick Current Value Register
#define SYST_CALIB             *&HE000E01C ' SysTick Calibration Value


#define ARM_DEMCR              *&HE000EDFC ' Debug Exception and Monitor Control
#define ARM_DEMCR_TRCENA       (1 shl  24)        ' Enable debugging and monitoring blocks
#define ARM_DWT_CTRL           *&HE0001000 ' DWT control register
#define ARM_DWT_CTRL_CYCCNTENA (1 shl  0)                ' Enable cycle count
#define ARM_DWT_CYCCNT         *&HE0001004 ' Cycle count register


'****************************************************************************
'                         Peripheral Registers_Bits_Definition

'****************************************************************************
'                                                                          
'                        Analog to Digital Converter                       
'                                                                          
'****************************************************************************
'*******************  Bit definition for ADC_SR register  *******************
#define  ADC_SR_AWD                          (&H00000001)       ' Analog watchdog flag 
#define  ADC_SR_EOC                          (&H00000002)       ' End of conversion 
#define  ADC_SR_JEOC                         (&H00000004)       ' Injected channel end of conversion 
#define  ADC_SR_JSTRT                        (&H00000008)       ' Injected channel Start flag 
#define  ADC_SR_STRT                         (&H00000010)       ' Regular channel Start flag 
#define  ADC_SR_OVR                          (&H00000020)       ' Overrun flag 

'******************  Bit definition for ADC_CR1 register  *******************
#define  ADC_CR1_AWDCH                       (&H0000001F)        ' AWDCH[4:0] bits (Analog watchdog channel select bits) 
#define  ADC_CR1_AWDCH_0                     (&H00000001)        ' Bit 0 
#define  ADC_CR1_AWDCH_1                     (&H00000002)        ' Bit 1 
#define  ADC_CR1_AWDCH_2                     (&H00000004)        ' Bit 2 
#define  ADC_CR1_AWDCH_3                     (&H00000008)        ' Bit 3 
#define  ADC_CR1_AWDCH_4                     (&H00000010)        ' Bit 4 
#define  ADC_CR1_EOCIE                       (&H00000020)        ' Interrupt enable for EOC 
#define  ADC_CR1_AWDIE                       (&H00000040)        ' AAnalog Watchdog interrupt enable 
#define  ADC_CR1_JEOCIE                      (&H00000080)        ' Interrupt enable for injected channels 
#define  ADC_CR1_SCAN                        (&H00000100)        ' Scan mode 
#define  ADC_CR1_AWDSGL                      (&H00000200)        ' Enable the watchdog on a single channel in scan mode 
#define  ADC_CR1_JAUTO                       (&H00000400)        ' Automatic injected group conversion 
#define  ADC_CR1_DISCEN                      (&H00000800)        ' Discontinuous mode on regular channels 
#define  ADC_CR1_JDISCEN                     (&H00001000)        ' Discontinuous mode on injected channels 
#define  ADC_CR1_DISCNUM                     (&H0000E000)        ' DISCNUM[2:0] bits (Discontinuous mode channel count) 
#define  ADC_CR1_DISCNUM_0                   (&H00002000)        ' Bit 0 
#define  ADC_CR1_DISCNUM_1                   (&H00004000)        ' Bit 1 
#define  ADC_CR1_DISCNUM_2                   (&H00008000)        ' Bit 2 
#define  ADC_CR1_JAWDEN                      (&H00400000)        ' Analog watchdog enable on injected channels 
#define  ADC_CR1_AWDEN                       (&H00800000)        ' Analog watchdog enable on regular channels 
#define  ADC_CR1_RES                         (&H03000000)        ' RES[2:0] bits (Resolution) 
#define  ADC_CR1_RES_0                       (&H01000000)        ' Bit 0 
#define  ADC_CR1_RES_1                       (&H02000000)        ' Bit 1 
#define  ADC_CR1_OVRIE                       (&H04000000)         ' overrun interrupt enable 
  
'******************  Bit definition for ADC_CR2 register  *******************
#define  ADC_CR2_ADON                        (&H00000001)        ' A/D Converter ON / OFF 
#define  ADC_CR2_CONT                        (&H00000002)        ' Continuous Conversion 
#define  ADC_CR2_DMA                         (&H00000100)        ' Direct Memory access mode 
#define  ADC_CR2_DDS                         (&H00000200)        ' DMA disable selection (Single ADC) 
#define  ADC_CR2_EOCS                        (&H00000400)        ' End of conversion selection 
#define  ADC_CR2_ALIGN                       (&H00000800)        ' Data Alignment 
#define  ADC_CR2_JEXTSEL                     (&H000F0000)        ' JEXTSEL[3:0] bits (External event select for injected group) 
#define  ADC_CR2_JEXTSEL_0                   (&H00010000)        ' Bit 0 
#define  ADC_CR2_JEXTSEL_1                   (&H00020000)        ' Bit 1 
#define  ADC_CR2_JEXTSEL_2                   (&H00040000)        ' Bit 2 
#define  ADC_CR2_JEXTSEL_3                   (&H00080000)        ' Bit 3 
#define  ADC_CR2_JEXTEN                      (&H00300000)        ' JEXTEN[1:0] bits (External Trigger Conversion mode for injected channelsp) 
#define  ADC_CR2_JEXTEN_0                    (&H00100000)        ' Bit 0 
#define  ADC_CR2_JEXTEN_1                    (&H00200000)        ' Bit 1 
#define  ADC_CR2_JSWSTART                    (&H00400000)        ' Start Conversion of injected channels 
#define  ADC_CR2_EXTSEL                      (&H0F000000)        ' EXTSEL[3:0] bits (External Event Select for regular group) 
#define  ADC_CR2_EXTSEL_0                    (&H01000000)        ' Bit 0 
#define  ADC_CR2_EXTSEL_1                    (&H02000000)        ' Bit 1 
#define  ADC_CR2_EXTSEL_2                    (&H04000000)        ' Bit 2 
#define  ADC_CR2_EXTSEL_3                    (&H08000000)        ' Bit 3 
#define  ADC_CR2_EXTEN                       (&H30000000)        ' EXTEN[1:0] bits (External Trigger Conversion mode for regular channelsp) 
#define  ADC_CR2_EXTEN_0                     (&H10000000)        ' Bit 0 
#define  ADC_CR2_EXTEN_1                     (&H20000000)        ' Bit 1 
#define  ADC_CR2_SWSTART                     (&H40000000)        ' Start Conversion of regular channels 

'*****************  Bit definition for ADC_SMPR1 register  ******************
#define  ADC_SMPR1_SMP10                     (&H00000007)        ' SMP10[2:0] bits (Channel 10 Sample time selection) 
#define  ADC_SMPR1_SMP10_0                   (&H00000001)        ' Bit 0 
#define  ADC_SMPR1_SMP10_1                   (&H00000002)        ' Bit 1 
#define  ADC_SMPR1_SMP10_2                   (&H00000004)        ' Bit 2 
#define  ADC_SMPR1_SMP11                     (&H00000038)        ' SMP11[2:0] bits (Channel 11 Sample time selection) 
#define  ADC_SMPR1_SMP11_0                   (&H00000008)        ' Bit 0 
#define  ADC_SMPR1_SMP11_1                   (&H00000010)        ' Bit 1 
#define  ADC_SMPR1_SMP11_2                   (&H00000020)        ' Bit 2 
#define  ADC_SMPR1_SMP12                     (&H000001C0)        ' SMP12[2:0] bits (Channel 12 Sample time selection) 
#define  ADC_SMPR1_SMP12_0                   (&H00000040)        ' Bit 0 
#define  ADC_SMPR1_SMP12_1                   (&H00000080)        ' Bit 1 
#define  ADC_SMPR1_SMP12_2                   (&H00000100)        ' Bit 2 
#define  ADC_SMPR1_SMP13                     (&H00000E00)        ' SMP13[2:0] bits (Channel 13 Sample time selection) 
#define  ADC_SMPR1_SMP13_0                   (&H00000200)        ' Bit 0 
#define  ADC_SMPR1_SMP13_1                   (&H00000400)        ' Bit 1 
#define  ADC_SMPR1_SMP13_2                   (&H00000800)        ' Bit 2 
#define  ADC_SMPR1_SMP14                     (&H00007000)        ' SMP14[2:0] bits (Channel 14 Sample time selection) 
#define  ADC_SMPR1_SMP14_0                   (&H00001000)        ' Bit 0 
#define  ADC_SMPR1_SMP14_1                   (&H00002000)        ' Bit 1 
#define  ADC_SMPR1_SMP14_2                   (&H00004000)        ' Bit 2 
#define  ADC_SMPR1_SMP15                     (&H00038000)        ' SMP15[2:0] bits (Channel 15 Sample time selection) 
#define  ADC_SMPR1_SMP15_0                   (&H00008000)        ' Bit 0 
#define  ADC_SMPR1_SMP15_1                   (&H00010000)        ' Bit 1 
#define  ADC_SMPR1_SMP15_2                   (&H00020000)        ' Bit 2 
#define  ADC_SMPR1_SMP16                     (&H001C0000)        ' SMP16[2:0] bits (Channel 16 Sample time selection) 
#define  ADC_SMPR1_SMP16_0                   (&H00040000)        ' Bit 0 
#define  ADC_SMPR1_SMP16_1                   (&H00080000)        ' Bit 1 
#define  ADC_SMPR1_SMP16_2                   (&H00100000)        ' Bit 2 
#define  ADC_SMPR1_SMP17                     (&H00E00000)        ' SMP17[2:0] bits (Channel 17 Sample time selection) 
#define  ADC_SMPR1_SMP17_0                   (&H00200000)        ' Bit 0 
#define  ADC_SMPR1_SMP17_1                   (&H00400000)        ' Bit 1 
#define  ADC_SMPR1_SMP17_2                   (&H00800000)        ' Bit 2 
#define  ADC_SMPR1_SMP18                     (&H07000000)        ' SMP18[2:0] bits (Channel 18 Sample time selection) 
#define  ADC_SMPR1_SMP18_0                   (&H01000000)        ' Bit 0 
#define  ADC_SMPR1_SMP18_1                   (&H02000000)        ' Bit 1 
#define  ADC_SMPR1_SMP18_2                   (&H04000000)        ' Bit 2 

'*****************  Bit definition for ADC_SMPR2 register  ******************
#define  ADC_SMPR2_SMP0                      (&H00000007)        ' SMP0[2:0] bits (Channel 0 Sample time selection) 
#define  ADC_SMPR2_SMP0_0                    (&H00000001)        ' Bit 0 
#define  ADC_SMPR2_SMP0_1                    (&H00000002)        ' Bit 1 
#define  ADC_SMPR2_SMP0_2                    (&H00000004)        ' Bit 2 
#define  ADC_SMPR2_SMP1                      (&H00000038)        ' SMP1[2:0] bits (Channel 1 Sample time selection) 
#define  ADC_SMPR2_SMP1_0                    (&H00000008)        ' Bit 0 
#define  ADC_SMPR2_SMP1_1                    (&H00000010)        ' Bit 1 
#define  ADC_SMPR2_SMP1_2                    (&H00000020)        ' Bit 2 
#define  ADC_SMPR2_SMP2                      (&H000001C0)        ' SMP2[2:0] bits (Channel 2 Sample time selection) 
#define  ADC_SMPR2_SMP2_0                    (&H00000040)        ' Bit 0 
#define  ADC_SMPR2_SMP2_1                    (&H00000080)        ' Bit 1 
#define  ADC_SMPR2_SMP2_2                    (&H00000100)        ' Bit 2 
#define  ADC_SMPR2_SMP3                      (&H00000E00)        ' SMP3[2:0] bits (Channel 3 Sample time selection) 
#define  ADC_SMPR2_SMP3_0                    (&H00000200)        ' Bit 0 
#define  ADC_SMPR2_SMP3_1                    (&H00000400)        ' Bit 1 
#define  ADC_SMPR2_SMP3_2                    (&H00000800)        ' Bit 2 
#define  ADC_SMPR2_SMP4                      (&H00007000)        ' SMP4[2:0] bits (Channel 4 Sample time selection) 
#define  ADC_SMPR2_SMP4_0                    (&H00001000)        ' Bit 0 
#define  ADC_SMPR2_SMP4_1                    (&H00002000)        ' Bit 1 
#define  ADC_SMPR2_SMP4_2                    (&H00004000)        ' Bit 2 
#define  ADC_SMPR2_SMP5                      (&H00038000)        ' SMP5[2:0] bits (Channel 5 Sample time selection) 
#define  ADC_SMPR2_SMP5_0                    (&H00008000)        ' Bit 0 
#define  ADC_SMPR2_SMP5_1                    (&H00010000)        ' Bit 1 
#define  ADC_SMPR2_SMP5_2                    (&H00020000)        ' Bit 2 
#define  ADC_SMPR2_SMP6                      (&H001C0000)        ' SMP6[2:0] bits (Channel 6 Sample time selection) 
#define  ADC_SMPR2_SMP6_0                    (&H00040000)        ' Bit 0 
#define  ADC_SMPR2_SMP6_1                    (&H00080000)        ' Bit 1 
#define  ADC_SMPR2_SMP6_2                    (&H00100000)        ' Bit 2 
#define  ADC_SMPR2_SMP7                      (&H00E00000)        ' SMP7[2:0] bits (Channel 7 Sample time selection) 
#define  ADC_SMPR2_SMP7_0                    (&H00200000)        ' Bit 0 
#define  ADC_SMPR2_SMP7_1                    (&H00400000)        ' Bit 1 
#define  ADC_SMPR2_SMP7_2                    (&H00800000)        ' Bit 2 
#define  ADC_SMPR2_SMP8                      (&H07000000)        ' SMP8[2:0] bits (Channel 8 Sample time selection) 
#define  ADC_SMPR2_SMP8_0                    (&H01000000)        ' Bit 0 
#define  ADC_SMPR2_SMP8_1                    (&H02000000)        ' Bit 1 
#define  ADC_SMPR2_SMP8_2                    (&H04000000)        ' Bit 2 
#define  ADC_SMPR2_SMP9                      (&H38000000)        ' SMP9[2:0] bits (Channel 9 Sample time selection) 
#define  ADC_SMPR2_SMP9_0                    (&H08000000)        ' Bit 0 
#define  ADC_SMPR2_SMP9_1                    (&H10000000)        ' Bit 1 
#define  ADC_SMPR2_SMP9_2                    (&H20000000)        ' Bit 2 

'*****************  Bit definition for ADC_JOFR1 register  ******************
#define  ADC_JOFR1_JOFFSET1                  (&H0FFF)            ' Data offset for injected channel 1 

'*****************  Bit definition for ADC_JOFR2 register  ******************
#define  ADC_JOFR2_JOFFSET2                  (&H0FFF)            ' Data offset for injected channel 2 

'*****************  Bit definition for ADC_JOFR3 register  ******************
#define  ADC_JOFR3_JOFFSET3                  (&H0FFF)            ' Data offset for injected channel 3 

'*****************  Bit definition for ADC_JOFR4 register  ******************
#define  ADC_JOFR4_JOFFSET4                  (&H0FFF)            ' Data offset for injected channel 4 

'******************  Bit definition for ADC_HTR register  *******************
#define  ADC_HTR_HT                          (&H0FFF)            ' Analog watchdog high threshold 

'******************  Bit definition for ADC_LTR register  *******************
#define  ADC_LTR_LT                          (&H0FFF)            ' Analog watchdog low threshold 

'******************  Bit definition for ADC_SQR1 register  ******************
#define  ADC_SQR1_SQ13                       (&H0000001F)        ' SQ13[4:0] bits (13th conversion in regular sequence) 
#define  ADC_SQR1_SQ13_0                     (&H00000001)        ' Bit 0 
#define  ADC_SQR1_SQ13_1                     (&H00000002)        ' Bit 1 
#define  ADC_SQR1_SQ13_2                     (&H00000004)        ' Bit 2 
#define  ADC_SQR1_SQ13_3                     (&H00000008)        ' Bit 3 
#define  ADC_SQR1_SQ13_4                     (&H00000010)        ' Bit 4 
#define  ADC_SQR1_SQ14                       (&H000003E0)        ' SQ14[4:0] bits (14th conversion in regular sequence) 
#define  ADC_SQR1_SQ14_0                     (&H00000020)        ' Bit 0 
#define  ADC_SQR1_SQ14_1                     (&H00000040)        ' Bit 1 
#define  ADC_SQR1_SQ14_2                     (&H00000080)        ' Bit 2 
#define  ADC_SQR1_SQ14_3                     (&H00000100)        ' Bit 3 
#define  ADC_SQR1_SQ14_4                     (&H00000200)        ' Bit 4 
#define  ADC_SQR1_SQ15                       (&H00007C00)        ' SQ15[4:0] bits (15th conversion in regular sequence) 
#define  ADC_SQR1_SQ15_0                     (&H00000400)        ' Bit 0 
#define  ADC_SQR1_SQ15_1                     (&H00000800)        ' Bit 1 
#define  ADC_SQR1_SQ15_2                     (&H00001000)        ' Bit 2 
#define  ADC_SQR1_SQ15_3                     (&H00002000)        ' Bit 3 
#define  ADC_SQR1_SQ15_4                     (&H00004000)        ' Bit 4 
#define  ADC_SQR1_SQ16                       (&H000F8000)        ' SQ16[4:0] bits (16th conversion in regular sequence) 
#define  ADC_SQR1_SQ16_0                     (&H00008000)        ' Bit 0 
#define  ADC_SQR1_SQ16_1                     (&H00010000)        ' Bit 1 
#define  ADC_SQR1_SQ16_2                     (&H00020000)        ' Bit 2 
#define  ADC_SQR1_SQ16_3                     (&H00040000)        ' Bit 3 
#define  ADC_SQR1_SQ16_4                     (&H00080000)        ' Bit 4 
#define  ADC_SQR1_L                          (&H00F00000)        ' L[3:0] bits (Regular channel sequence length) 
#define  ADC_SQR1_L_0                        (&H00100000)        ' Bit 0 
#define  ADC_SQR1_L_1                        (&H00200000)        ' Bit 1 
#define  ADC_SQR1_L_2                        (&H00400000)        ' Bit 2 
#define  ADC_SQR1_L_3                        (&H00800000)        ' Bit 3 

'******************  Bit definition for ADC_SQR2 register  ******************
#define  ADC_SQR2_SQ7                        (&H0000001F)        ' SQ7[4:0] bits (7th conversion in regular sequence) 
#define  ADC_SQR2_SQ7_0                      (&H00000001)        ' Bit 0 
#define  ADC_SQR2_SQ7_1                      (&H00000002)        ' Bit 1 
#define  ADC_SQR2_SQ7_2                      (&H00000004)        ' Bit 2 
#define  ADC_SQR2_SQ7_3                      (&H00000008)        ' Bit 3 
#define  ADC_SQR2_SQ7_4                      (&H00000010)        ' Bit 4 
#define  ADC_SQR2_SQ8                        (&H000003E0)        ' SQ8[4:0] bits (8th conversion in regular sequence) 
#define  ADC_SQR2_SQ8_0                      (&H00000020)        ' Bit 0 
#define  ADC_SQR2_SQ8_1                      (&H00000040)        ' Bit 1 
#define  ADC_SQR2_SQ8_2                      (&H00000080)        ' Bit 2 
#define  ADC_SQR2_SQ8_3                      (&H00000100)        ' Bit 3 
#define  ADC_SQR2_SQ8_4                      (&H00000200)        ' Bit 4 
#define  ADC_SQR2_SQ9                        (&H00007C00)        ' SQ9[4:0] bits (9th conversion in regular sequence) 
#define  ADC_SQR2_SQ9_0                      (&H00000400)        ' Bit 0 
#define  ADC_SQR2_SQ9_1                      (&H00000800)        ' Bit 1 
#define  ADC_SQR2_SQ9_2                      (&H00001000)        ' Bit 2 
#define  ADC_SQR2_SQ9_3                      (&H00002000)        ' Bit 3 
#define  ADC_SQR2_SQ9_4                      (&H00004000)        ' Bit 4 
#define  ADC_SQR2_SQ10                       (&H000F8000)        ' SQ10[4:0] bits (10th conversion in regular sequence) 
#define  ADC_SQR2_SQ10_0                     (&H00008000)        ' Bit 0 
#define  ADC_SQR2_SQ10_1                     (&H00010000)        ' Bit 1 
#define  ADC_SQR2_SQ10_2                     (&H00020000)        ' Bit 2 
#define  ADC_SQR2_SQ10_3                     (&H00040000)        ' Bit 3 
#define  ADC_SQR2_SQ10_4                     (&H00080000)        ' Bit 4 
#define  ADC_SQR2_SQ11                       (&H01F00000)        ' SQ11[4:0] bits (11th conversion in regular sequence) 
#define  ADC_SQR2_SQ11_0                     (&H00100000)        ' Bit 0 
#define  ADC_SQR2_SQ11_1                     (&H00200000)        ' Bit 1 
#define  ADC_SQR2_SQ11_2                     (&H00400000)        ' Bit 2 
#define  ADC_SQR2_SQ11_3                     (&H00800000)        ' Bit 3 
#define  ADC_SQR2_SQ11_4                     (&H01000000)        ' Bit 4 
#define  ADC_SQR2_SQ12                       (&H3E000000)        ' SQ12[4:0] bits (12th conversion in regular sequence) 
#define  ADC_SQR2_SQ12_0                     (&H02000000)        ' Bit 0 
#define  ADC_SQR2_SQ12_1                     (&H04000000)        ' Bit 1 
#define  ADC_SQR2_SQ12_2                     (&H08000000)        ' Bit 2 
#define  ADC_SQR2_SQ12_3                     (&H10000000)        ' Bit 3 
#define  ADC_SQR2_SQ12_4                     (&H20000000)        ' Bit 4 

'******************  Bit definition for ADC_SQR3 register  ******************
#define  ADC_SQR3_SQ1                        (&H0000001F)        ' SQ1[4:0] bits (1st conversion in regular sequence) 
#define  ADC_SQR3_SQ1_0                      (&H00000001)        ' Bit 0 
#define  ADC_SQR3_SQ1_1                      (&H00000002)        ' Bit 1 
#define  ADC_SQR3_SQ1_2                      (&H00000004)        ' Bit 2 
#define  ADC_SQR3_SQ1_3                      (&H00000008)        ' Bit 3 
#define  ADC_SQR3_SQ1_4                      (&H00000010)        ' Bit 4 
#define  ADC_SQR3_SQ2                        (&H000003E0)        ' SQ2[4:0] bits (2nd conversion in regular sequence) 
#define  ADC_SQR3_SQ2_0                      (&H00000020)        ' Bit 0 
#define  ADC_SQR3_SQ2_1                      (&H00000040)        ' Bit 1 
#define  ADC_SQR3_SQ2_2                      (&H00000080)        ' Bit 2 
#define  ADC_SQR3_SQ2_3                      (&H00000100)        ' Bit 3 
#define  ADC_SQR3_SQ2_4                      (&H00000200)        ' Bit 4 
#define  ADC_SQR3_SQ3                        (&H00007C00)        ' SQ3[4:0] bits (3rd conversion in regular sequence) 
#define  ADC_SQR3_SQ3_0                      (&H00000400)        ' Bit 0 
#define  ADC_SQR3_SQ3_1                      (&H00000800)        ' Bit 1 
#define  ADC_SQR3_SQ3_2                      (&H00001000)        ' Bit 2 
#define  ADC_SQR3_SQ3_3                      (&H00002000)        ' Bit 3 
#define  ADC_SQR3_SQ3_4                      (&H00004000)        ' Bit 4 
#define  ADC_SQR3_SQ4                        (&H000F8000)        ' SQ4[4:0] bits (4th conversion in regular sequence) 
#define  ADC_SQR3_SQ4_0                      (&H00008000)        ' Bit 0 
#define  ADC_SQR3_SQ4_1                      (&H00010000)        ' Bit 1 
#define  ADC_SQR3_SQ4_2                      (&H00020000)        ' Bit 2 
#define  ADC_SQR3_SQ4_3                      (&H00040000)        ' Bit 3 
#define  ADC_SQR3_SQ4_4                      (&H00080000)        ' Bit 4 
#define  ADC_SQR3_SQ5                        (&H01F00000)        ' SQ5[4:0] bits (5th conversion in regular sequence) 
#define  ADC_SQR3_SQ5_0                      (&H00100000)        ' Bit 0 
#define  ADC_SQR3_SQ5_1                      (&H00200000)        ' Bit 1 
#define  ADC_SQR3_SQ5_2                      (&H00400000)        ' Bit 2 
#define  ADC_SQR3_SQ5_3                      (&H00800000)        ' Bit 3 
#define  ADC_SQR3_SQ5_4                      (&H01000000)        ' Bit 4 
#define  ADC_SQR3_SQ6                        (&H3E000000)        ' SQ6[4:0] bits (6th conversion in regular sequence) 
#define  ADC_SQR3_SQ6_0                      (&H02000000)        ' Bit 0 
#define  ADC_SQR3_SQ6_1                      (&H04000000)        ' Bit 1 
#define  ADC_SQR3_SQ6_2                      (&H08000000)        ' Bit 2 
#define  ADC_SQR3_SQ6_3                      (&H10000000)        ' Bit 3 
#define  ADC_SQR3_SQ6_4                      (&H20000000)        ' Bit 4 

'******************  Bit definition for ADC_JSQR register  ******************
#define  ADC_JSQR_JSQ1                       (&H0000001F)        ' JSQ1[4:0] bits (1st conversion in injected sequence)   
#define  ADC_JSQR_JSQ1_0                     (&H00000001)        ' Bit 0 
#define  ADC_JSQR_JSQ1_1                     (&H00000002)        ' Bit 1 
#define  ADC_JSQR_JSQ1_2                     (&H00000004)        ' Bit 2 
#define  ADC_JSQR_JSQ1_3                     (&H00000008)        ' Bit 3 
#define  ADC_JSQR_JSQ1_4                     (&H00000010)        ' Bit 4 
#define  ADC_JSQR_JSQ2                       (&H000003E0)        ' JSQ2[4:0] bits (2nd conversion in injected sequence) 
#define  ADC_JSQR_JSQ2_0                     (&H00000020)        ' Bit 0 
#define  ADC_JSQR_JSQ2_1                     (&H00000040)        ' Bit 1 
#define  ADC_JSQR_JSQ2_2                     (&H00000080)        ' Bit 2 
#define  ADC_JSQR_JSQ2_3                     (&H00000100)        ' Bit 3 
#define  ADC_JSQR_JSQ2_4                     (&H00000200)        ' Bit 4 
#define  ADC_JSQR_JSQ3                       (&H00007C00)        ' JSQ3[4:0] bits (3rd conversion in injected sequence) 
#define  ADC_JSQR_JSQ3_0                     (&H00000400)        ' Bit 0 
#define  ADC_JSQR_JSQ3_1                     (&H00000800)        ' Bit 1 
#define  ADC_JSQR_JSQ3_2                     (&H00001000)        ' Bit 2 
#define  ADC_JSQR_JSQ3_3                     (&H00002000)        ' Bit 3 
#define  ADC_JSQR_JSQ3_4                     (&H00004000)        ' Bit 4 
#define  ADC_JSQR_JSQ4                       (&H000F8000)        ' JSQ4[4:0] bits (4th conversion in injected sequence) 
#define  ADC_JSQR_JSQ4_0                     (&H00008000)        ' Bit 0 
#define  ADC_JSQR_JSQ4_1                     (&H00010000)        ' Bit 1 
#define  ADC_JSQR_JSQ4_2                     (&H00020000)        ' Bit 2 
#define  ADC_JSQR_JSQ4_3                     (&H00040000)        ' Bit 3 
#define  ADC_JSQR_JSQ4_4                     (&H00080000)        ' Bit 4 
#define  ADC_JSQR_JL                         (&H00300000)        ' JL[1:0] bits (Injected Sequence length) 
#define  ADC_JSQR_JL_0                       (&H00100000)        ' Bit 0 
#define  ADC_JSQR_JL_1                       (&H00200000)        ' Bit 1 

'******************  Bit definition for ADC_JDR1 register  ******************
#define  ADC_JDR1_JDATA                      (&HFFFF)            ' Injected data 

'******************  Bit definition for ADC_JDR2 register  ******************
#define  ADC_JDR2_JDATA                      (&HFFFF)            ' Injected data 

'******************  Bit definition for ADC_JDR3 register  ******************
#define  ADC_JDR3_JDATA                      (&HFFFF)            ' Injected data 

'******************  Bit definition for ADC_JDR4 register  ******************
#define  ADC_JDR4_JDATA                      (&HFFFF)            ' Injected data 

'*******************  Bit definition for ADC_DR register  *******************
#define  ADC_DR_DATA                         (&H0000FFFF)        ' Regular data 
#define  ADC_DR_ADC2DATA                     (&HFFFF0000)        ' ADC2 data 

'******************  Bit definition for ADC_CSR register  *******************
#define  ADC_CSR_AWD1                        (&H00000001)        ' ADC1 Analog watchdog flag 
#define  ADC_CSR_EOC1                        (&H00000002)        ' ADC1 End of conversion 
#define  ADC_CSR_JEOC1                       (&H00000004)        ' ADC1 Injected channel end of conversion 
#define  ADC_CSR_JSTRT1                      (&H00000008)        ' ADC1 Injected channel Start flag 
#define  ADC_CSR_STRT1                       (&H00000010)        ' ADC1 Regular channel Start flag 
#define  ADC_CSR_DOVR1                       (&H00000020)        ' ADC1 DMA overrun  flag 
#define  ADC_CSR_AWD2                        (&H00000100)        ' ADC2 Analog watchdog flag 
#define  ADC_CSR_EOC2                        (&H00000200)        ' ADC2 End of conversion 
#define  ADC_CSR_JEOC2                       (&H00000400)        ' ADC2 Injected channel end of conversion 
#define  ADC_CSR_JSTRT2                      (&H00000800)        ' ADC2 Injected channel Start flag 
#define  ADC_CSR_STRT2                       (&H00001000)        ' ADC2 Regular channel Start flag 
#define  ADC_CSR_DOVR2                       (&H00002000)        ' ADC2 DMA overrun  flag 
#define  ADC_CSR_AWD3                        (&H00010000)        ' ADC3 Analog watchdog flag 
#define  ADC_CSR_EOC3                        (&H00020000)        ' ADC3 End of conversion 
#define  ADC_CSR_JEOC3                       (&H00040000)        ' ADC3 Injected channel end of conversion 
#define  ADC_CSR_JSTRT3                      (&H00080000)        ' ADC3 Injected channel Start flag 
#define  ADC_CSR_STRT3                       (&H00100000)        ' ADC3 Regular channel Start flag 
#define  ADC_CSR_DOVR3                       (&H00200000)        ' ADC3 DMA overrun  flag 

'******************  Bit definition for ADC_CCR register  *******************
#define  ADC_CCR_MULTI                       (&H0000001F)        ' MULTI[4:0] bits (Multi-ADC mode selection)   
#define  ADC_CCR_MULTI_0                     (&H00000001)        ' Bit 0 
#define  ADC_CCR_MULTI_1                     (&H00000002)        ' Bit 1 
#define  ADC_CCR_MULTI_2                     (&H00000004)        ' Bit 2 
#define  ADC_CCR_MULTI_3                     (&H00000008)        ' Bit 3 
#define  ADC_CCR_MULTI_4                     (&H00000010)        ' Bit 4 
#define  ADC_CCR_DELAY                       (&H00000F00)        ' DELAY[3:0] bits (Delay between 2 sampling phases)   
#define  ADC_CCR_DELAY_0                     (&H00000100)        ' Bit 0 
#define  ADC_CCR_DELAY_1                     (&H00000200)        ' Bit 1 
#define  ADC_CCR_DELAY_2                     (&H00000400)        ' Bit 2 
#define  ADC_CCR_DELAY_3                     (&H00000800)        ' Bit 3 
#define  ADC_CCR_DDS                         (&H00002000)        ' DMA disable selection (Multi-ADC mode) 
#define  ADC_CCR_DMA                         (&H0000C000)        ' DMA[1:0] bits (Direct Memory Access mode for multimode)   
#define  ADC_CCR_DMA_0                       (&H00004000)        ' Bit 0 
#define  ADC_CCR_DMA_1                       (&H00008000)        ' Bit 1 
#define  ADC_CCR_ADCPRE                      (&H00030000)        ' ADCPRE[1:0] bits (ADC prescaler)   
#define  ADC_CCR_ADCPRE_0                    (&H00010000)        ' Bit 0 
#define  ADC_CCR_ADCPRE_1                    (&H00020000)        ' Bit 1 
#define  ADC_CCR_VBATE                       (&H00400000)        ' VBAT Enable 
#define  ADC_CCR_TSVREFE                     (&H00800000)        ' Temperature Sensor and VREFINT Enable 

'******************  Bit definition for ADC_CDR register  *******************
#define  ADC_CDR_DATA1                      (&H0000FFFF)         ' 1st data of a pair of regular conversions 
#define  ADC_CDR_DATA2                      (&HFFFF0000)         ' 2nd data of a pair of regular conversions 

'****************************************************************************
'                                                                          
'                          CRC calculation unit                            
'                                                                          
'****************************************************************************
'******************  Bit definition for CRC_DR register  ********************
#define  CRC_DR_DR                           (&HFFFFFFFF) '  Data register bits 


'******************  Bit definition for CRC_IDR register  *******************
#define  CRC_IDR_IDR                         (&HFF)        '  General-purpose 8-bit data register bits 


'*******************  Bit definition for CRC_CR register  *******************
#define  CRC_CR_RESET                        (&H01)        '  RESET bit 

'****************************************************************************
'                                                                          
'                                 Debug MCU                                
'                                                                          
'****************************************************************************

'****************************************************************************
'                                                                          
'                             DMA Controller                               
'                                                                          
'****************************************************************************
'*******************  Bits definition for DMA_SxCR register  **************** 
#define DMA_SxCR_CHSEL                       (&H0E000000)
#define DMA_SxCR_CHSEL_0                     (&H02000000)
#define DMA_SxCR_CHSEL_1                     (&H04000000)
#define DMA_SxCR_CHSEL_2                     (&H08000000) 
#define DMA_SxCR_MBURST                      (&H01800000)
#define DMA_SxCR_MBURST_0                    (&H00800000)
#define DMA_SxCR_MBURST_1                    (&H01000000)
#define DMA_SxCR_PBURST                      (&H00600000)
#define DMA_SxCR_PBURST_0                    (&H00200000)
#define DMA_SxCR_PBURST_1                    (&H00400000)
#define DMA_SxCR_ACK                         (&H00100000)
#define DMA_SxCR_CT                          (&H00080000)  
#define DMA_SxCR_DBM                         (&H00040000)
#define DMA_SxCR_PL                          (&H00030000)
#define DMA_SxCR_PL_0                        (&H00010000)
#define DMA_SxCR_PL_1                        (&H00020000)
#define DMA_SxCR_PINCOS                      (&H00008000)
#define DMA_SxCR_MSIZE                       (&H00006000)
#define DMA_SxCR_MSIZE_0                     (&H00002000)
#define DMA_SxCR_MSIZE_1                     (&H00004000)
#define DMA_SxCR_PSIZE                       (&H00001800)
#define DMA_SxCR_PSIZE_0                     (&H00000800)
#define DMA_SxCR_PSIZE_1                     (&H00001000)
#define DMA_SxCR_MINC                        (&H00000400)
#define DMA_SxCR_PINC                        (&H00000200)
#define DMA_SxCR_CIRC                        (&H00000100)
#define DMA_SxCR_DIR                         (&H000000C0)
#define DMA_SxCR_DIR_0                       (&H00000040)
#define DMA_SxCR_DIR_1                       (&H00000080)
#define DMA_SxCR_PFCTRL                      (&H00000020)
#define DMA_SxCR_TCIE                        (&H00000010)
#define DMA_SxCR_HTIE                        (&H00000008)
#define DMA_SxCR_TEIE                        (&H00000004)
#define DMA_SxCR_DMEIE                       (&H00000002)
#define DMA_SxCR_EN                          (&H00000001)

'*******************  Bits definition for DMA_SxCNDTR register  *************
#define DMA_SxNDT                            (&H0000FFFF)
#define DMA_SxNDT_0                          (&H00000001)
#define DMA_SxNDT_1                          (&H00000002)
#define DMA_SxNDT_2                          (&H00000004)
#define DMA_SxNDT_3                          (&H00000008)
#define DMA_SxNDT_4                          (&H00000010)
#define DMA_SxNDT_5                          (&H00000020)
#define DMA_SxNDT_6                          (&H00000040)
#define DMA_SxNDT_7                          (&H00000080)
#define DMA_SxNDT_8                          (&H00000100)
#define DMA_SxNDT_9                          (&H00000200)
#define DMA_SxNDT_10                         (&H00000400)
#define DMA_SxNDT_11                         (&H00000800)
#define DMA_SxNDT_12                         (&H00001000)
#define DMA_SxNDT_13                         (&H00002000)
#define DMA_SxNDT_14                         (&H00004000)
#define DMA_SxNDT_15                         (&H00008000)

'*******************  Bits definition for DMA_SxFCR register  *************** 
#define DMA_SxFCR_FEIE                       (&H00000080)
#define DMA_SxFCR_FS                         (&H00000038)
#define DMA_SxFCR_FS_0                       (&H00000008)
#define DMA_SxFCR_FS_1                       (&H00000010)
#define DMA_SxFCR_FS_2                       (&H00000020)
#define DMA_SxFCR_DMDIS                      (&H00000004)
#define DMA_SxFCR_FTH                        (&H00000003)
#define DMA_SxFCR_FTH_0                      (&H00000001)
#define DMA_SxFCR_FTH_1                      (&H00000002)

'*******************  Bits definition for DMA_LISR register  **************** 
#define DMA_LISR_TCIF3                       (&H08000000)
#define DMA_LISR_HTIF3                       (&H04000000)
#define DMA_LISR_TEIF3                       (&H02000000)
#define DMA_LISR_DMEIF3                      (&H01000000)
#define DMA_LISR_FEIF3                       (&H00400000)
#define DMA_LISR_TCIF2                       (&H00200000)
#define DMA_LISR_HTIF2                       (&H00100000)
#define DMA_LISR_TEIF2                       (&H00080000)
#define DMA_LISR_DMEIF2                      (&H00040000)
#define DMA_LISR_FEIF2                       (&H00010000)
#define DMA_LISR_TCIF1                       (&H00000800)
#define DMA_LISR_HTIF1                       (&H00000400)
#define DMA_LISR_TEIF1                       (&H00000200)
#define DMA_LISR_DMEIF1                      (&H00000100)
#define DMA_LISR_FEIF1                       (&H00000040)
#define DMA_LISR_TCIF0                       (&H00000020)
#define DMA_LISR_HTIF0                       (&H00000010)
#define DMA_LISR_TEIF0                       (&H00000008)
#define DMA_LISR_DMEIF0                      (&H00000004)
#define DMA_LISR_FEIF0                       (&H00000001)

'*******************  Bits definition for DMA_HISR register  **************** 
#define DMA_HISR_TCIF7                       (&H08000000)
#define DMA_HISR_HTIF7                       (&H04000000)
#define DMA_HISR_TEIF7                       (&H02000000)
#define DMA_HISR_DMEIF7                      (&H01000000)
#define DMA_HISR_FEIF7                       (&H00400000)
#define DMA_HISR_TCIF6                       (&H00200000)
#define DMA_HISR_HTIF6                       (&H00100000)
#define DMA_HISR_TEIF6                       (&H00080000)
#define DMA_HISR_DMEIF6                      (&H00040000)
#define DMA_HISR_FEIF6                       (&H00010000)
#define DMA_HISR_TCIF5                       (&H00000800)
#define DMA_HISR_HTIF5                       (&H00000400)
#define DMA_HISR_TEIF5                       (&H00000200)
#define DMA_HISR_DMEIF5                      (&H00000100)
#define DMA_HISR_FEIF5                       (&H00000040)
#define DMA_HISR_TCIF4                       (&H00000020)
#define DMA_HISR_HTIF4                       (&H00000010)
#define DMA_HISR_TEIF4                       (&H00000008)
#define DMA_HISR_DMEIF4                      (&H00000004)
#define DMA_HISR_FEIF4                       (&H00000001)

'*******************  Bits definition for DMA_LIFCR register  *************** 
#define DMA_LIFCR_CTCIF3                     (&H08000000)
#define DMA_LIFCR_CHTIF3                     (&H04000000)
#define DMA_LIFCR_CTEIF3                     (&H02000000)
#define DMA_LIFCR_CDMEIF3                    (&H01000000)
#define DMA_LIFCR_CFEIF3                     (&H00400000)
#define DMA_LIFCR_CTCIF2                     (&H00200000)
#define DMA_LIFCR_CHTIF2                     (&H00100000)
#define DMA_LIFCR_CTEIF2                     (&H00080000)
#define DMA_LIFCR_CDMEIF2                    (&H00040000)
#define DMA_LIFCR_CFEIF2                     (&H00010000)
#define DMA_LIFCR_CTCIF1                     (&H00000800)
#define DMA_LIFCR_CHTIF1                     (&H00000400)
#define DMA_LIFCR_CTEIF1                     (&H00000200)
#define DMA_LIFCR_CDMEIF1                    (&H00000100)
#define DMA_LIFCR_CFEIF1                     (&H00000040)
#define DMA_LIFCR_CTCIF0                     (&H00000020)
#define DMA_LIFCR_CHTIF0                     (&H00000010)
#define DMA_LIFCR_CTEIF0                     (&H00000008)
#define DMA_LIFCR_CDMEIF0                    (&H00000004)
#define DMA_LIFCR_CFEIF0                     (&H00000001)

'*******************  Bits definition for DMA_HIFCR  register  *************** 
#define DMA_HIFCR_CTCIF7                     (&H08000000)
#define DMA_HIFCR_CHTIF7                     (&H04000000)
#define DMA_HIFCR_CTEIF7                     (&H02000000)
#define DMA_HIFCR_CDMEIF7                    (&H01000000)
#define DMA_HIFCR_CFEIF7                     (&H00400000)
#define DMA_HIFCR_CTCIF6                     (&H00200000)
#define DMA_HIFCR_CHTIF6                     (&H00100000)
#define DMA_HIFCR_CTEIF6                     (&H00080000)
#define DMA_HIFCR_CDMEIF6                    (&H00040000)
#define DMA_HIFCR_CFEIF6                     (&H00010000)
#define DMA_HIFCR_CTCIF5                     (&H00000800)
#define DMA_HIFCR_CHTIF5                     (&H00000400)
#define DMA_HIFCR_CTEIF5                     (&H00000200)
#define DMA_HIFCR_CDMEIF5                    (&H00000100)
#define DMA_HIFCR_CFEIF5                     (&H00000040)
#define DMA_HIFCR_CTCIF4                     (&H00000020)
#define DMA_HIFCR_CHTIF4                     (&H00000010)
#define DMA_HIFCR_CTEIF4                     (&H00000008)
#define DMA_HIFCR_CDMEIF4                    (&H00000004)
#define DMA_HIFCR_CFEIF4                     (&H00000001)


'****************************************************************************
'                                                                          
'                    External Interrupt/Event Controller                   
'                                                                          
'****************************************************************************
'******************  Bit definition for EXTI_IMR register  ******************
#define  EXTI_IMR_MR0                        (&H00000001)        '  Interrupt Mask on line 0 
#define  EXTI_IMR_MR1                        (&H00000002)        '  Interrupt Mask on line 1 
#define  EXTI_IMR_MR2                        (&H00000004)        '  Interrupt Mask on line 2 
#define  EXTI_IMR_MR3                        (&H00000008)        '  Interrupt Mask on line 3 
#define  EXTI_IMR_MR4                        (&H00000010)        '  Interrupt Mask on line 4 
#define  EXTI_IMR_MR5                        (&H00000020)        '  Interrupt Mask on line 5 
#define  EXTI_IMR_MR6                        (&H00000040)        '  Interrupt Mask on line 6 
#define  EXTI_IMR_MR7                        (&H00000080)        '  Interrupt Mask on line 7 
#define  EXTI_IMR_MR8                        (&H00000100)        '  Interrupt Mask on line 8 
#define  EXTI_IMR_MR9                        (&H00000200)        '  Interrupt Mask on line 9 
#define  EXTI_IMR_MR10                       (&H00000400)        '  Interrupt Mask on line 10 
#define  EXTI_IMR_MR11                       (&H00000800)        '  Interrupt Mask on line 11 
#define  EXTI_IMR_MR12                       (&H00001000)        '  Interrupt Mask on line 12 
#define  EXTI_IMR_MR13                       (&H00002000)        '  Interrupt Mask on line 13 
#define  EXTI_IMR_MR14                       (&H00004000)        '  Interrupt Mask on line 14 
#define  EXTI_IMR_MR15                       (&H00008000)        '  Interrupt Mask on line 15 
#define  EXTI_IMR_MR16                       (&H00010000)        '  Interrupt Mask on line 16 
#define  EXTI_IMR_MR17                       (&H00020000)        '  Interrupt Mask on line 17 
#define  EXTI_IMR_MR18                       (&H00040000)        '  Interrupt Mask on line 18 
#define  EXTI_IMR_MR19                       (&H00080000)        '  Interrupt Mask on line 19 
#define  EXTI_IMR_MR20                       (&H00100000)        '  Interrupt Mask on line 20 
#define  EXTI_IMR_MR21                       (&H00200000)        '  Interrupt Mask on line 21 
#define  EXTI_IMR_MR22                       (&H00400000)        '  Interrupt Mask on line 22 

'******************  Bit definition for EXTI_EMR register  ******************
#define  EXTI_EMR_MR0                        (&H00000001)        '  Event Mask on line 0 
#define  EXTI_EMR_MR1                        (&H00000002)        '  Event Mask on line 1 
#define  EXTI_EMR_MR2                        (&H00000004)        '  Event Mask on line 2 
#define  EXTI_EMR_MR3                        (&H00000008)        '  Event Mask on line 3 
#define  EXTI_EMR_MR4                        (&H00000010)        '  Event Mask on line 4 
#define  EXTI_EMR_MR5                        (&H00000020)        '  Event Mask on line 5 
#define  EXTI_EMR_MR6                        (&H00000040)        '  Event Mask on line 6 
#define  EXTI_EMR_MR7                        (&H00000080)        '  Event Mask on line 7 
#define  EXTI_EMR_MR8                        (&H00000100)        '  Event Mask on line 8 
#define  EXTI_EMR_MR9                        (&H00000200)        '  Event Mask on line 9 
#define  EXTI_EMR_MR10                       (&H00000400)        '  Event Mask on line 10 
#define  EXTI_EMR_MR11                       (&H00000800)        '  Event Mask on line 11 
#define  EXTI_EMR_MR12                       (&H00001000)        '  Event Mask on line 12 
#define  EXTI_EMR_MR13                       (&H00002000)        '  Event Mask on line 13 
#define  EXTI_EMR_MR14                       (&H00004000)        '  Event Mask on line 14 
#define  EXTI_EMR_MR15                       (&H00008000)        '  Event Mask on line 15 
#define  EXTI_EMR_MR16                       (&H00010000)        '  Event Mask on line 16 
#define  EXTI_EMR_MR17                       (&H00020000)        '  Event Mask on line 17 
#define  EXTI_EMR_MR18                       (&H00040000)        '  Event Mask on line 18 
#define  EXTI_EMR_MR19                       (&H00080000)        '  Event Mask on line 19 
#define  EXTI_EMR_MR20                       (&H00100000)        '  Event Mask on line 20 
#define  EXTI_EMR_MR21                       (&H00200000)        '  Event Mask on line 21 
#define  EXTI_EMR_MR22                       (&H00400000)        '  Event Mask on line 22 

'*****************  Bit definition for EXTI_RTSR register  ******************
#define  EXTI_RTSR_TR0                       (&H00000001)        '  Rising trigger event configuration bit of line 0 
#define  EXTI_RTSR_TR1                       (&H00000002)        '  Rising trigger event configuration bit of line 1 
#define  EXTI_RTSR_TR2                       (&H00000004)        '  Rising trigger event configuration bit of line 2 
#define  EXTI_RTSR_TR3                       (&H00000008)        '  Rising trigger event configuration bit of line 3 
#define  EXTI_RTSR_TR4                       (&H00000010)        '  Rising trigger event configuration bit of line 4 
#define  EXTI_RTSR_TR5                       (&H00000020)        '  Rising trigger event configuration bit of line 5 
#define  EXTI_RTSR_TR6                       (&H00000040)        '  Rising trigger event configuration bit of line 6 
#define  EXTI_RTSR_TR7                       (&H00000080)        '  Rising trigger event configuration bit of line 7 
#define  EXTI_RTSR_TR8                       (&H00000100)        '  Rising trigger event configuration bit of line 8 
#define  EXTI_RTSR_TR9                       (&H00000200)        '  Rising trigger event configuration bit of line 9 
#define  EXTI_RTSR_TR10                      (&H00000400)        '  Rising trigger event configuration bit of line 10 
#define  EXTI_RTSR_TR11                      (&H00000800)        '  Rising trigger event configuration bit of line 11 
#define  EXTI_RTSR_TR12                      (&H00001000)        '  Rising trigger event configuration bit of line 12 
#define  EXTI_RTSR_TR13                      (&H00002000)        '  Rising trigger event configuration bit of line 13 
#define  EXTI_RTSR_TR14                      (&H00004000)        '  Rising trigger event configuration bit of line 14 
#define  EXTI_RTSR_TR15                      (&H00008000)        '  Rising trigger event configuration bit of line 15 
#define  EXTI_RTSR_TR16                      (&H00010000)        '  Rising trigger event configuration bit of line 16 
#define  EXTI_RTSR_TR17                      (&H00020000)        '  Rising trigger event configuration bit of line 17 
#define  EXTI_RTSR_TR18                      (&H00040000)        '  Rising trigger event configuration bit of line 18 
#define  EXTI_RTSR_TR19                      (&H00080000)        '  Rising trigger event configuration bit of line 19 
#define  EXTI_RTSR_TR20                      (&H00100000)        '  Rising trigger event configuration bit of line 20 
#define  EXTI_RTSR_TR21                      (&H00200000)        '  Rising trigger event configuration bit of line 21 
#define  EXTI_RTSR_TR22                      (&H00400000)        '  Rising trigger event configuration bit of line 22 

'*****************  Bit definition for EXTI_FTSR register  ******************
#define  EXTI_FTSR_TR0                       (&H00000001)        '  Falling trigger event configuration bit of line 0 
#define  EXTI_FTSR_TR1                       (&H00000002)        '  Falling trigger event configuration bit of line 1 
#define  EXTI_FTSR_TR2                       (&H00000004)        '  Falling trigger event configuration bit of line 2 
#define  EXTI_FTSR_TR3                       (&H00000008)        '  Falling trigger event configuration bit of line 3 
#define  EXTI_FTSR_TR4                       (&H00000010)        '  Falling trigger event configuration bit of line 4 
#define  EXTI_FTSR_TR5                       (&H00000020)        '  Falling trigger event configuration bit of line 5 
#define  EXTI_FTSR_TR6                       (&H00000040)        '  Falling trigger event configuration bit of line 6 
#define  EXTI_FTSR_TR7                       (&H00000080)        '  Falling trigger event configuration bit of line 7 
#define  EXTI_FTSR_TR8                       (&H00000100)        '  Falling trigger event configuration bit of line 8 
#define  EXTI_FTSR_TR9                       (&H00000200)        '  Falling trigger event configuration bit of line 9 
#define  EXTI_FTSR_TR10                      (&H00000400)        '  Falling trigger event configuration bit of line 10 
#define  EXTI_FTSR_TR11                      (&H00000800)        '  Falling trigger event configuration bit of line 11 
#define  EXTI_FTSR_TR12                      (&H00001000)        '  Falling trigger event configuration bit of line 12 
#define  EXTI_FTSR_TR13                      (&H00002000)        '  Falling trigger event configuration bit of line 13 
#define  EXTI_FTSR_TR14                      (&H00004000)        '  Falling trigger event configuration bit of line 14 
#define  EXTI_FTSR_TR15                      (&H00008000)        '  Falling trigger event configuration bit of line 15 
#define  EXTI_FTSR_TR16                      (&H00010000)        '  Falling trigger event configuration bit of line 16 
#define  EXTI_FTSR_TR17                      (&H00020000)        '  Falling trigger event configuration bit of line 17 
#define  EXTI_FTSR_TR18                      (&H00040000)        '  Falling trigger event configuration bit of line 18 
#define  EXTI_FTSR_TR19                      (&H00080000)        '  Falling trigger event configuration bit of line 19 
#define  EXTI_FTSR_TR20                      (&H00100000)        '  Falling trigger event configuration bit of line 20 
#define  EXTI_FTSR_TR21                      (&H00200000)        '  Falling trigger event configuration bit of line 21 
#define  EXTI_FTSR_TR22                      (&H00400000)        '  Falling trigger event configuration bit of line 22 

'*****************  Bit definition for EXTI_SWIER register  *****************
#define  EXTI_SWIER_SWIER0                   (&H00000001)        '  Software Interrupt on line 0 
#define  EXTI_SWIER_SWIER1                   (&H00000002)        '  Software Interrupt on line 1 
#define  EXTI_SWIER_SWIER2                   (&H00000004)        '  Software Interrupt on line 2 
#define  EXTI_SWIER_SWIER3                   (&H00000008)        '  Software Interrupt on line 3 
#define  EXTI_SWIER_SWIER4                   (&H00000010)        '  Software Interrupt on line 4 
#define  EXTI_SWIER_SWIER5                   (&H00000020)        '  Software Interrupt on line 5 
#define  EXTI_SWIER_SWIER6                   (&H00000040)        '  Software Interrupt on line 6 
#define  EXTI_SWIER_SWIER7                   (&H00000080)        '  Software Interrupt on line 7 
#define  EXTI_SWIER_SWIER8                   (&H00000100)        '  Software Interrupt on line 8 
#define  EXTI_SWIER_SWIER9                   (&H00000200)        '  Software Interrupt on line 9 
#define  EXTI_SWIER_SWIER10                  (&H00000400)        '  Software Interrupt on line 10 
#define  EXTI_SWIER_SWIER11                  (&H00000800)        '  Software Interrupt on line 11 
#define  EXTI_SWIER_SWIER12                  (&H00001000)        '  Software Interrupt on line 12 
#define  EXTI_SWIER_SWIER13                  (&H00002000)        '  Software Interrupt on line 13 
#define  EXTI_SWIER_SWIER14                  (&H00004000)        '  Software Interrupt on line 14 
#define  EXTI_SWIER_SWIER15                  (&H00008000)        '  Software Interrupt on line 15 
#define  EXTI_SWIER_SWIER16                  (&H00010000)        '  Software Interrupt on line 16 
#define  EXTI_SWIER_SWIER17                  (&H00020000)        '  Software Interrupt on line 17 
#define  EXTI_SWIER_SWIER18                  (&H00040000)        '  Software Interrupt on line 18 
#define  EXTI_SWIER_SWIER19                  (&H00080000)        '  Software Interrupt on line 19 
#define  EXTI_SWIER_SWIER20                  (&H00100000)        '  Software Interrupt on line 20 
#define  EXTI_SWIER_SWIER21                  (&H00200000)        '  Software Interrupt on line 21 
#define  EXTI_SWIER_SWIER22                  (&H00400000)        '  Software Interrupt on line 22 

'******************  Bit definition for EXTI_PR register  *******************
#define  EXTI_PR_PR0                         (&H00000001)        '  Pending bit for line 0 
#define  EXTI_PR_PR1                         (&H00000002)        '  Pending bit for line 1 
#define  EXTI_PR_PR2                         (&H00000004)        '  Pending bit for line 2 
#define  EXTI_PR_PR3                         (&H00000008)        '  Pending bit for line 3 
#define  EXTI_PR_PR4                         (&H00000010)        '  Pending bit for line 4 
#define  EXTI_PR_PR5                         (&H00000020)        '  Pending bit for line 5 
#define  EXTI_PR_PR6                         (&H00000040)        '  Pending bit for line 6 
#define  EXTI_PR_PR7                         (&H00000080)        '  Pending bit for line 7 
#define  EXTI_PR_PR8                         (&H00000100)        '  Pending bit for line 8 
#define  EXTI_PR_PR9                         (&H00000200)        '  Pending bit for line 9 
#define  EXTI_PR_PR10                        (&H00000400)        '  Pending bit for line 10 
#define  EXTI_PR_PR11                        (&H00000800)        '  Pending bit for line 11 
#define  EXTI_PR_PR12                        (&H00001000)        '  Pending bit for line 12 
#define  EXTI_PR_PR13                        (&H00002000)        '  Pending bit for line 13 
#define  EXTI_PR_PR14                        (&H00004000)        '  Pending bit for line 14 
#define  EXTI_PR_PR15                        (&H00008000)        '  Pending bit for line 15 
#define  EXTI_PR_PR16                        (&H00010000)        '  Pending bit for line 16 
#define  EXTI_PR_PR17                        (&H00020000)        '  Pending bit for line 17 
#define  EXTI_PR_PR18                        (&H00040000)        '  Pending bit for line 18 
#define  EXTI_PR_PR19                        (&H00080000)        '  Pending bit for line 19 
#define  EXTI_PR_PR20                        (&H00100000)        '  Pending bit for line 20 
#define  EXTI_PR_PR21                        (&H00200000)        '  Pending bit for line 21 
#define  EXTI_PR_PR22                        (&H00400000)        '  Pending bit for line 22 

'****************************************************************************
'                                                                          
'                                    FLASH                                 
'                                                                          
'****************************************************************************
'******************  Bits definition for FLASH_ACR register  ****************
#define FLASH_ACR_LATENCY                    (&H0000000F)
#define FLASH_ACR_LATENCY_0WS                (&H00000000)
#define FLASH_ACR_LATENCY_1WS                (&H00000001)
#define FLASH_ACR_LATENCY_2WS                (&H00000002)
#define FLASH_ACR_LATENCY_3WS                (&H00000003)
#define FLASH_ACR_LATENCY_4WS                (&H00000004)
#define FLASH_ACR_LATENCY_5WS                (&H00000005)
#define FLASH_ACR_LATENCY_6WS                (&H00000006)
#define FLASH_ACR_LATENCY_7WS                (&H00000007)

#define FLASH_ACR_PRFTEN                     (&H00000100)
#define FLASH_ACR_ICEN                       (&H00000200)
#define FLASH_ACR_DCEN                       (&H00000400)
#define FLASH_ACR_ICRST                      (&H00000800)
#define FLASH_ACR_DCRST                      (&H00001000)
#define FLASH_ACR_BYTE0_ADDRESS              (&H40023C00)
#define FLASH_ACR_BYTE2_ADDRESS              (&H40023C03)

'******************  Bits definition for FLASH_SR register  *****************
#define FLASH_SR_EOP                         (&H00000001)
#define FLASH_SR_SOP                         (&H00000002)
#define FLASH_SR_WRPERR                      (&H00000010)
#define FLASH_SR_PGAERR                      (&H00000020)
#define FLASH_SR_PGPERR                      (&H00000040)
#define FLASH_SR_PGSERR                      (&H00000080)
#define FLASH_SR_BSY                         (&H00010000)

'******************  Bits definition for FLASH_CR register  *****************
#define FLASH_CR_PG                          (&H00000001)
#define FLASH_CR_SER                         (&H00000002)
#define FLASH_CR_MER                         (&H00000004)
#define FLASH_CR_SNB                         (&H000000F8)
#define FLASH_CR_SNB_0                       (&H00000008)
#define FLASH_CR_SNB_1                       (&H00000010)
#define FLASH_CR_SNB_2                       (&H00000020)
#define FLASH_CR_SNB_3                       (&H00000040)
#define FLASH_CR_SNB_4                       (&H00000080)
#define FLASH_CR_PSIZE                       (&H00000300)
#define FLASH_CR_PSIZE_0                     (&H00000100)
#define FLASH_CR_PSIZE_1                     (&H00000200)
#define FLASH_CR_STRT                        (&H00010000)
#define FLASH_CR_EOPIE                       (&H01000000)
#define FLASH_CR_LOCK                        (&H80000000)

'******************  Bits definition for FLASH_OPTCR register  **************
#define FLASH_OPTCR_OPTLOCK                 (&H00000001)
#define FLASH_OPTCR_OPTSTRT                 (&H00000002)
#define FLASH_OPTCR_BOR_LEV_0               (&H00000004)
#define FLASH_OPTCR_BOR_LEV_1               (&H00000008)
#define FLASH_OPTCR_BOR_LEV                 (&H0000000C)

#define FLASH_OPTCR_WDG_SW                  (&H00000020)
#define FLASH_OPTCR_nRST_STOP               (&H00000040)
#define FLASH_OPTCR_nRST_STDBY              (&H00000080)
#define FLASH_OPTCR_RDP                     (&H0000FF00)
#define FLASH_OPTCR_RDP_0                   (&H00000100)
#define FLASH_OPTCR_RDP_1                   (&H00000200)
#define FLASH_OPTCR_RDP_2                   (&H00000400)
#define FLASH_OPTCR_RDP_3                   (&H00000800)
#define FLASH_OPTCR_RDP_4                   (&H00001000)
#define FLASH_OPTCR_RDP_5                   (&H00002000)
#define FLASH_OPTCR_RDP_6                   (&H00004000)
#define FLASH_OPTCR_RDP_7                   (&H00008000)
#define FLASH_OPTCR_nWRP                    (&H0FFF0000)
#define FLASH_OPTCR_nWRP_0                  (&H00010000)
#define FLASH_OPTCR_nWRP_1                  (&H00020000)
#define FLASH_OPTCR_nWRP_2                  (&H00040000)
#define FLASH_OPTCR_nWRP_3                  (&H00080000)
#define FLASH_OPTCR_nWRP_4                  (&H00100000)
#define FLASH_OPTCR_nWRP_5                  (&H00200000)
#define FLASH_OPTCR_nWRP_6                  (&H00400000)
#define FLASH_OPTCR_nWRP_7                  (&H00800000)
#define FLASH_OPTCR_nWRP_8                  (&H01000000)
#define FLASH_OPTCR_nWRP_9                  (&H02000000)
#define FLASH_OPTCR_nWRP_10                 (&H04000000)
#define FLASH_OPTCR_nWRP_11                 (&H08000000)
                                             
'*****************  Bits definition for FLASH_OPTCR1 register  **************
#define FLASH_OPTCR1_nWRP                    (&H0FFF0000)
#define FLASH_OPTCR1_nWRP_0                  (&H00010000)
#define FLASH_OPTCR1_nWRP_1                  (&H00020000)
#define FLASH_OPTCR1_nWRP_2                  (&H00040000)
#define FLASH_OPTCR1_nWRP_3                  (&H00080000)
#define FLASH_OPTCR1_nWRP_4                  (&H00100000)
#define FLASH_OPTCR1_nWRP_5                  (&H00200000)
#define FLASH_OPTCR1_nWRP_6                  (&H00400000)
#define FLASH_OPTCR1_nWRP_7                  (&H00800000)
#define FLASH_OPTCR1_nWRP_8                  (&H01000000)
#define FLASH_OPTCR1_nWRP_9                  (&H02000000)
#define FLASH_OPTCR1_nWRP_10                 (&H04000000)
#define FLASH_OPTCR1_nWRP_11                 (&H08000000)

'****************************************************************************
'                                                                          
'                            General Purpose I/O                           
'                                                                          
'****************************************************************************
'*****************  Bits definition for GPIO_MODER register  ****************
#define GPIO_MODER_MODER0                    (&H00000003)
#define GPIO_MODER_MODER0_0                  (&H00000001)
#define GPIO_MODER_MODER0_1                  (&H00000002)

#define GPIO_MODER_MODER1                    (&H0000000C)
#define GPIO_MODER_MODER1_0                  (&H00000004)
#define GPIO_MODER_MODER1_1                  (&H00000008)

#define GPIO_MODER_MODER2                    (&H00000030)
#define GPIO_MODER_MODER2_0                  (&H00000010)
#define GPIO_MODER_MODER2_1                  (&H00000020)

#define GPIO_MODER_MODER3                    (&H000000C0)
#define GPIO_MODER_MODER3_0                  (&H00000040)
#define GPIO_MODER_MODER3_1                  (&H00000080)

#define GPIO_MODER_MODER4                    (&H00000300)
#define GPIO_MODER_MODER4_0                  (&H00000100)
#define GPIO_MODER_MODER4_1                  (&H00000200)

#define GPIO_MODER_MODER5                    (&H00000C00)
#define GPIO_MODER_MODER5_0                  (&H00000400)
#define GPIO_MODER_MODER5_1                  (&H00000800)

#define GPIO_MODER_MODER6                    (&H00003000)
#define GPIO_MODER_MODER6_0                  (&H00001000)
#define GPIO_MODER_MODER6_1                  (&H00002000)

#define GPIO_MODER_MODER7                    (&H0000C000)
#define GPIO_MODER_MODER7_0                  (&H00004000)
#define GPIO_MODER_MODER7_1                  (&H00008000)

#define GPIO_MODER_MODER8                    (&H00030000)
#define GPIO_MODER_MODER8_0                  (&H00010000)
#define GPIO_MODER_MODER8_1                  (&H00020000)

#define GPIO_MODER_MODER9                    (&H000C0000)
#define GPIO_MODER_MODER9_0                  (&H00040000)
#define GPIO_MODER_MODER9_1                  (&H00080000)

#define GPIO_MODER_MODER10                   (&H00300000)
#define GPIO_MODER_MODER10_0                 (&H00100000)
#define GPIO_MODER_MODER10_1                 (&H00200000)

#define GPIO_MODER_MODER11                   (&H00C00000)
#define GPIO_MODER_MODER11_0                 (&H00400000)
#define GPIO_MODER_MODER11_1                 (&H00800000)

#define GPIO_MODER_MODER12                   (&H03000000)
#define GPIO_MODER_MODER12_0                 (&H01000000)
#define GPIO_MODER_MODER12_1                 (&H02000000)

#define GPIO_MODER_MODER13                   (&H0C000000)
#define GPIO_MODER_MODER13_0                 (&H04000000)
#define GPIO_MODER_MODER13_1                 (&H08000000)

#define GPIO_MODER_MODER14                   (&H30000000)
#define GPIO_MODER_MODER14_0                 (&H10000000)
#define GPIO_MODER_MODER14_1                 (&H20000000)

#define GPIO_MODER_MODER15                   (&HC0000000)
#define GPIO_MODER_MODER15_0                 (&H40000000)
#define GPIO_MODER_MODER15_1                 (&H80000000)

'*****************  Bits definition for GPIO_OTYPER register  ***************
#define GPIO_OTYPER_OT_0                     (&H00000001)
#define GPIO_OTYPER_OT_1                     (&H00000002)
#define GPIO_OTYPER_OT_2                     (&H00000004)
#define GPIO_OTYPER_OT_3                     (&H00000008)
#define GPIO_OTYPER_OT_4                     (&H00000010)
#define GPIO_OTYPER_OT_5                     (&H00000020)
#define GPIO_OTYPER_OT_6                     (&H00000040)
#define GPIO_OTYPER_OT_7                     (&H00000080)
#define GPIO_OTYPER_OT_8                     (&H00000100)
#define GPIO_OTYPER_OT_9                     (&H00000200)
#define GPIO_OTYPER_OT_10                    (&H00000400)
#define GPIO_OTYPER_OT_11                    (&H00000800)
#define GPIO_OTYPER_OT_12                    (&H00001000)
#define GPIO_OTYPER_OT_13                    (&H00002000)
#define GPIO_OTYPER_OT_14                    (&H00004000)
#define GPIO_OTYPER_OT_15                    (&H00008000)

'*****************  Bits definition for GPIO_OSPEEDR register  **************
#define GPIO_OSPEEDER_OSPEEDR0               (&H00000003)
#define GPIO_OSPEEDER_OSPEEDR0_0             (&H00000001)
#define GPIO_OSPEEDER_OSPEEDR0_1             (&H00000002)

#define GPIO_OSPEEDER_OSPEEDR1               (&H0000000C)
#define GPIO_OSPEEDER_OSPEEDR1_0             (&H00000004)
#define GPIO_OSPEEDER_OSPEEDR1_1             (&H00000008)

#define GPIO_OSPEEDER_OSPEEDR2               (&H00000030)
#define GPIO_OSPEEDER_OSPEEDR2_0             (&H00000010)
#define GPIO_OSPEEDER_OSPEEDR2_1             (&H00000020)

#define GPIO_OSPEEDER_OSPEEDR3               (&H000000C0)
#define GPIO_OSPEEDER_OSPEEDR3_0             (&H00000040)
#define GPIO_OSPEEDER_OSPEEDR3_1             (&H00000080)

#define GPIO_OSPEEDER_OSPEEDR4               (&H00000300)
#define GPIO_OSPEEDER_OSPEEDR4_0             (&H00000100)
#define GPIO_OSPEEDER_OSPEEDR4_1             (&H00000200)

#define GPIO_OSPEEDER_OSPEEDR5               (&H00000C00)
#define GPIO_OSPEEDER_OSPEEDR5_0             (&H00000400)
#define GPIO_OSPEEDER_OSPEEDR5_1             (&H00000800)

#define GPIO_OSPEEDER_OSPEEDR6               (&H00003000)
#define GPIO_OSPEEDER_OSPEEDR6_0             (&H00001000)
#define GPIO_OSPEEDER_OSPEEDR6_1             (&H00002000)

#define GPIO_OSPEEDER_OSPEEDR7               (&H0000C000)
#define GPIO_OSPEEDER_OSPEEDR7_0             (&H00004000)
#define GPIO_OSPEEDER_OSPEEDR7_1             (&H00008000)

#define GPIO_OSPEEDER_OSPEEDR8               (&H00030000)
#define GPIO_OSPEEDER_OSPEEDR8_0             (&H00010000)
#define GPIO_OSPEEDER_OSPEEDR8_1             (&H00020000)

#define GPIO_OSPEEDER_OSPEEDR9               (&H000C0000)
#define GPIO_OSPEEDER_OSPEEDR9_0             (&H00040000)
#define GPIO_OSPEEDER_OSPEEDR9_1             (&H00080000)

#define GPIO_OSPEEDER_OSPEEDR10              (&H00300000)
#define GPIO_OSPEEDER_OSPEEDR10_0            (&H00100000)
#define GPIO_OSPEEDER_OSPEEDR10_1            (&H00200000)

#define GPIO_OSPEEDER_OSPEEDR11              (&H00C00000)
#define GPIO_OSPEEDER_OSPEEDR11_0            (&H00400000)
#define GPIO_OSPEEDER_OSPEEDR11_1            (&H00800000)

#define GPIO_OSPEEDER_OSPEEDR12              (&H03000000)
#define GPIO_OSPEEDER_OSPEEDR12_0            (&H01000000)
#define GPIO_OSPEEDER_OSPEEDR12_1            (&H02000000)

#define GPIO_OSPEEDER_OSPEEDR13              (&H0C000000)
#define GPIO_OSPEEDER_OSPEEDR13_0            (&H04000000)
#define GPIO_OSPEEDER_OSPEEDR13_1            (&H08000000)

#define GPIO_OSPEEDER_OSPEEDR14              (&H30000000)
#define GPIO_OSPEEDER_OSPEEDR14_0            (&H10000000)
#define GPIO_OSPEEDER_OSPEEDR14_1            (&H20000000)

#define GPIO_OSPEEDER_OSPEEDR15              (&HC0000000)
#define GPIO_OSPEEDER_OSPEEDR15_0            (&H40000000)
#define GPIO_OSPEEDER_OSPEEDR15_1            (&H80000000)

'*****************  Bits definition for GPIO_PUPDR register  ****************
#define GPIO_PUPDR_PUPDR0                    (&H00000003)
#define GPIO_PUPDR_PUPDR0_0                  (&H00000001)
#define GPIO_PUPDR_PUPDR0_1                  (&H00000002)

#define GPIO_PUPDR_PUPDR1                    (&H0000000C)
#define GPIO_PUPDR_PUPDR1_0                  (&H00000004)
#define GPIO_PUPDR_PUPDR1_1                  (&H00000008)

#define GPIO_PUPDR_PUPDR2                    (&H00000030)
#define GPIO_PUPDR_PUPDR2_0                  (&H00000010)
#define GPIO_PUPDR_PUPDR2_1                  (&H00000020)

#define GPIO_PUPDR_PUPDR3                    (&H000000C0)
#define GPIO_PUPDR_PUPDR3_0                  (&H00000040)
#define GPIO_PUPDR_PUPDR3_1                  (&H00000080)

#define GPIO_PUPDR_PUPDR4                    (&H00000300)
#define GPIO_PUPDR_PUPDR4_0                  (&H00000100)
#define GPIO_PUPDR_PUPDR4_1                  (&H00000200)

#define GPIO_PUPDR_PUPDR5                    (&H00000C00)
#define GPIO_PUPDR_PUPDR5_0                  (&H00000400)
#define GPIO_PUPDR_PUPDR5_1                  (&H00000800)

#define GPIO_PUPDR_PUPDR6                    (&H00003000)
#define GPIO_PUPDR_PUPDR6_0                  (&H00001000)
#define GPIO_PUPDR_PUPDR6_1                  (&H00002000)

#define GPIO_PUPDR_PUPDR7                    (&H0000C000)
#define GPIO_PUPDR_PUPDR7_0                  (&H00004000)
#define GPIO_PUPDR_PUPDR7_1                  (&H00008000)

#define GPIO_PUPDR_PUPDR8                    (&H00030000)
#define GPIO_PUPDR_PUPDR8_0                  (&H00010000)
#define GPIO_PUPDR_PUPDR8_1                  (&H00020000)

#define GPIO_PUPDR_PUPDR9                    (&H000C0000)
#define GPIO_PUPDR_PUPDR9_0                  (&H00040000)
#define GPIO_PUPDR_PUPDR9_1                  (&H00080000)

#define GPIO_PUPDR_PUPDR10                   (&H00300000)
#define GPIO_PUPDR_PUPDR10_0                 (&H00100000)
#define GPIO_PUPDR_PUPDR10_1                 (&H00200000)

#define GPIO_PUPDR_PUPDR11                   (&H00C00000)
#define GPIO_PUPDR_PUPDR11_0                 (&H00400000)
#define GPIO_PUPDR_PUPDR11_1                 (&H00800000)

#define GPIO_PUPDR_PUPDR12                   (&H03000000)
#define GPIO_PUPDR_PUPDR12_0                 (&H01000000)
#define GPIO_PUPDR_PUPDR12_1                 (&H02000000)

#define GPIO_PUPDR_PUPDR13                   (&H0C000000)
#define GPIO_PUPDR_PUPDR13_0                 (&H04000000)
#define GPIO_PUPDR_PUPDR13_1                 (&H08000000)

#define GPIO_PUPDR_PUPDR14                   (&H30000000)
#define GPIO_PUPDR_PUPDR14_0                 (&H10000000)
#define GPIO_PUPDR_PUPDR14_1                 (&H20000000)

#define GPIO_PUPDR_PUPDR15                   (&HC0000000)
#define GPIO_PUPDR_PUPDR15_0                 (&H40000000)
#define GPIO_PUPDR_PUPDR15_1                 (&H80000000)

'*****************  Bits definition for GPIO_IDR register  ******************
#define GPIO_IDR_IDR_0                       (&H00000001)
#define GPIO_IDR_IDR_1                       (&H00000002)
#define GPIO_IDR_IDR_2                       (&H00000004)
#define GPIO_IDR_IDR_3                       (&H00000008)
#define GPIO_IDR_IDR_4                       (&H00000010)
#define GPIO_IDR_IDR_5                       (&H00000020)
#define GPIO_IDR_IDR_6                       (&H00000040)
#define GPIO_IDR_IDR_7                       (&H00000080)
#define GPIO_IDR_IDR_8                       (&H00000100)
#define GPIO_IDR_IDR_9                       (&H00000200)
#define GPIO_IDR_IDR_10                      (&H00000400)
#define GPIO_IDR_IDR_11                      (&H00000800)
#define GPIO_IDR_IDR_12                      (&H00001000)
#define GPIO_IDR_IDR_13                      (&H00002000)
#define GPIO_IDR_IDR_14                      (&H00004000)
#define GPIO_IDR_IDR_15                      (&H00008000)
' Old GPIO_IDR register bits definition, maintained for legacy purpose 
#define GPIO_OTYPER_IDR_0                    GPIO_IDR_IDR_0
#define GPIO_OTYPER_IDR_1                    GPIO_IDR_IDR_1
#define GPIO_OTYPER_IDR_2                    GPIO_IDR_IDR_2
#define GPIO_OTYPER_IDR_3                    GPIO_IDR_IDR_3
#define GPIO_OTYPER_IDR_4                    GPIO_IDR_IDR_4
#define GPIO_OTYPER_IDR_5                    GPIO_IDR_IDR_5
#define GPIO_OTYPER_IDR_6                    GPIO_IDR_IDR_6
#define GPIO_OTYPER_IDR_7                    GPIO_IDR_IDR_7
#define GPIO_OTYPER_IDR_8                    GPIO_IDR_IDR_8
#define GPIO_OTYPER_IDR_9                    GPIO_IDR_IDR_9
#define GPIO_OTYPER_IDR_10                   GPIO_IDR_IDR_10
#define GPIO_OTYPER_IDR_11                   GPIO_IDR_IDR_11
#define GPIO_OTYPER_IDR_12                   GPIO_IDR_IDR_12
#define GPIO_OTYPER_IDR_13                   GPIO_IDR_IDR_13
#define GPIO_OTYPER_IDR_14                   GPIO_IDR_IDR_14
#define GPIO_OTYPER_IDR_15                   GPIO_IDR_IDR_15

'*****************  Bits definition for GPIO_ODR register  ******************
#define GPIO_ODR_ODR_0                       (&H00000001)
#define GPIO_ODR_ODR_1                       (&H00000002)
#define GPIO_ODR_ODR_2                       (&H00000004)
#define GPIO_ODR_ODR_3                       (&H00000008)
#define GPIO_ODR_ODR_4                       (&H00000010)
#define GPIO_ODR_ODR_5                       (&H00000020)
#define GPIO_ODR_ODR_6                       (&H00000040)
#define GPIO_ODR_ODR_7                       (&H00000080)
#define GPIO_ODR_ODR_8                       (&H00000100)
#define GPIO_ODR_ODR_9                       (&H00000200)
#define GPIO_ODR_ODR_10                      (&H00000400)
#define GPIO_ODR_ODR_11                      (&H00000800)
#define GPIO_ODR_ODR_12                      (&H00001000)
#define GPIO_ODR_ODR_13                      (&H00002000)
#define GPIO_ODR_ODR_14                      (&H00004000)
#define GPIO_ODR_ODR_15                      (&H00008000)
' Old GPIO_ODR register bits definition, maintained for legacy purpose 
#define GPIO_OTYPER_ODR_0                    GPIO_ODR_ODR_0
#define GPIO_OTYPER_ODR_1                    GPIO_ODR_ODR_1
#define GPIO_OTYPER_ODR_2                    GPIO_ODR_ODR_2
#define GPIO_OTYPER_ODR_3                    GPIO_ODR_ODR_3
#define GPIO_OTYPER_ODR_4                    GPIO_ODR_ODR_4
#define GPIO_OTYPER_ODR_5                    GPIO_ODR_ODR_5
#define GPIO_OTYPER_ODR_6                    GPIO_ODR_ODR_6
#define GPIO_OTYPER_ODR_7                    GPIO_ODR_ODR_7
#define GPIO_OTYPER_ODR_8                    GPIO_ODR_ODR_8
#define GPIO_OTYPER_ODR_9                    GPIO_ODR_ODR_9
#define GPIO_OTYPER_ODR_10                   GPIO_ODR_ODR_10
#define GPIO_OTYPER_ODR_11                   GPIO_ODR_ODR_11
#define GPIO_OTYPER_ODR_12                   GPIO_ODR_ODR_12
#define GPIO_OTYPER_ODR_13                   GPIO_ODR_ODR_13
#define GPIO_OTYPER_ODR_14                   GPIO_ODR_ODR_14
#define GPIO_OTYPER_ODR_15                   GPIO_ODR_ODR_15

'*****************  Bits definition for GPIO_BSRR register  *****************
#define GPIO_BSRR_BS_0                       (&H00000001)
#define GPIO_BSRR_BS_1                       (&H00000002)
#define GPIO_BSRR_BS_2                       (&H00000004)
#define GPIO_BSRR_BS_3                       (&H00000008)
#define GPIO_BSRR_BS_4                       (&H00000010)
#define GPIO_BSRR_BS_5                       (&H00000020)
#define GPIO_BSRR_BS_6                       (&H00000040)
#define GPIO_BSRR_BS_7                       (&H00000080)
#define GPIO_BSRR_BS_8                       (&H00000100)
#define GPIO_BSRR_BS_9                       (&H00000200)
#define GPIO_BSRR_BS_10                      (&H00000400)
#define GPIO_BSRR_BS_11                      (&H00000800)
#define GPIO_BSRR_BS_12                      (&H00001000)
#define GPIO_BSRR_BS_13                      (&H00002000)
#define GPIO_BSRR_BS_14                      (&H00004000)
#define GPIO_BSRR_BS_15                      (&H00008000)
#define GPIO_BSRR_BR_0                       (&H00010000)
#define GPIO_BSRR_BR_1                       (&H00020000)
#define GPIO_BSRR_BR_2                       (&H00040000)
#define GPIO_BSRR_BR_3                       (&H00080000)
#define GPIO_BSRR_BR_4                       (&H00100000)
#define GPIO_BSRR_BR_5                       (&H00200000)
#define GPIO_BSRR_BR_6                       (&H00400000)
#define GPIO_BSRR_BR_7                       (&H00800000)
#define GPIO_BSRR_BR_8                       (&H01000000)
#define GPIO_BSRR_BR_9                       (&H02000000)
#define GPIO_BSRR_BR_10                      (&H04000000)
#define GPIO_BSRR_BR_11                      (&H08000000)
#define GPIO_BSRR_BR_12                      (&H10000000)
#define GPIO_BSRR_BR_13                      (&H20000000)
#define GPIO_BSRR_BR_14                      (&H40000000)
#define GPIO_BSRR_BR_15                      (&H80000000)

'***************** Bit definition for GPIO_LCKR register ********************
#define GPIO_LCKR_LCK0                       (&H00000001)
#define GPIO_LCKR_LCK1                       (&H00000002)
#define GPIO_LCKR_LCK2                       (&H00000004)
#define GPIO_LCKR_LCK3                       (&H00000008)
#define GPIO_LCKR_LCK4                       (&H00000010)
#define GPIO_LCKR_LCK5                       (&H00000020)
#define GPIO_LCKR_LCK6                       (&H00000040)
#define GPIO_LCKR_LCK7                       (&H00000080)
#define GPIO_LCKR_LCK8                       (&H00000100)
#define GPIO_LCKR_LCK9                       (&H00000200)
#define GPIO_LCKR_LCK10                      (&H00000400)
#define GPIO_LCKR_LCK11                      (&H00000800)
#define GPIO_LCKR_LCK12                      (&H00001000)
#define GPIO_LCKR_LCK13                      (&H00002000)
#define GPIO_LCKR_LCK14                      (&H00004000)
#define GPIO_LCKR_LCK15                      (&H00008000)
#define GPIO_LCKR_LCKK                       (&H00010000)

'****************************************************************************
'                                                                          
'                      Inter-integrated Circuit Interface                  
'                                                                          
'****************************************************************************
'******************  Bit definition for I2C_CR1 register  *******************
#define  I2C_CR1_PE                          (&H00000001)     ' Peripheral Enable                             
#define  I2C_CR1_SMBUS                       (&H00000002)     ' SMBus Mode                                    
#define  I2C_CR1_SMBTYPE                     (&H00000008)     ' SMBus Type                                    
#define  I2C_CR1_ENARP                       (&H00000010)     ' ARP Enable                                    
#define  I2C_CR1_ENPEC                       (&H00000020)     ' PEC Enable                                    
#define  I2C_CR1_ENGC                        (&H00000040)     ' General Call Enable                           
#define  I2C_CR1_NOSTRETCH                   (&H00000080)     ' Clock Stretching Disable (Slave mode)  
#define  I2C_CR1_START                       (&H00000100)     ' Start Generation                              
#define  I2C_CR1_STOP                        (&H00000200)     ' Stop Generation                               
#define  I2C_CR1_ACK                         (&H00000400)     ' Acknowledge Enable                            
#define  I2C_CR1_POS                         (&H00000800)     ' Acknowledge/PEC Position (for data reception) 
#define  I2C_CR1_PEC                         (&H00001000)     ' Packet Error Checking                         
#define  I2C_CR1_ALERT                       (&H00002000)     ' SMBus Alert                                   
#define  I2C_CR1_SWRST                       (&H00008000)     ' Software Reset                                

'******************  Bit definition for I2C_CR2 register  *******************
#define  I2C_CR2_FREQ                        (&H0000003F)     ' FREQ[5:0] bits (Peripheral Clock Frequency)   
#define  I2C_CR2_FREQ_0                      (&H00000001)     ' Bit 0 
#define  I2C_CR2_FREQ_1                      (&H00000002)     ' Bit 1 
#define  I2C_CR2_FREQ_2                      (&H00000004)     ' Bit 2 
#define  I2C_CR2_FREQ_3                      (&H00000008)     ' Bit 3 
#define  I2C_CR2_FREQ_4                      (&H00000010)     ' Bit 4 
#define  I2C_CR2_FREQ_5                      (&H00000020)     ' Bit 5 

#define  I2C_CR2_ITERREN                     (&H00000100)     ' Error Interrupt Enable  
#define  I2C_CR2_ITEVTEN                     (&H00000200)     ' Event Interrupt Enable  
#define  I2C_CR2_ITBUFEN                     (&H00000400)     ' Buffer Interrupt Enable 
#define  I2C_CR2_DMAEN                       (&H00000800)     ' DMA Requests Enable     
#define  I2C_CR2_LAST                        (&H00001000)     ' DMA Last Transfer       

'******************  Bit definition for I2C_OAR1 register  ******************
#define  I2C_OAR1_ADD1_7                     (&H000000FE)     ' Interface Address 
#define  I2C_OAR1_ADD8_9                     (&H00000300)     ' Interface Address 

#define  I2C_OAR1_ADD0                       (&H00000001)     ' Bit 0 
#define  I2C_OAR1_ADD1                       (&H00000002)     ' Bit 1 
#define  I2C_OAR1_ADD2                       (&H00000004)     ' Bit 2 
#define  I2C_OAR1_ADD3                       (&H00000008)     ' Bit 3 
#define  I2C_OAR1_ADD4                       (&H00000010)     ' Bit 4 
#define  I2C_OAR1_ADD5                       (&H00000020)     ' Bit 5 
#define  I2C_OAR1_ADD6                       (&H00000040)     ' Bit 6 
#define  I2C_OAR1_ADD7                       (&H00000080)     ' Bit 7 
#define  I2C_OAR1_ADD8                       (&H00000100)     ' Bit 8 
#define  I2C_OAR1_ADD9                       (&H00000200)     ' Bit 9 

#define  I2C_OAR1_ADDMODE                    (&H00008000)     ' Addressing Mode (Slave mode) 

'******************  Bit definition for I2C_OAR2 register  ******************
#define  I2C_OAR2_ENDUAL                     (&H00000001)        ' Dual addressing mode enable 
#define  I2C_OAR2_ADD2                       (&H000000FE)        ' Interface address           

'*******************  Bit definition for I2C_DR register  *******************
#define  I2C_DR_DR                           (&H000000FF)        ' 8-bit Data Register         

'******************  Bit definition for I2C_SR1 register  *******************
#define  I2C_SR1_SB                          (&H00000001)     ' Start Bit (Master mode)                  
#define  I2C_SR1_ADDR                        (&H00000002)     ' Address sent (master mode)/matched (slave mode) 
#define  I2C_SR1_BTF                         (&H00000004)     ' Byte Transfer Finished                          
#define  I2C_SR1_ADD10                       (&H00000008)     ' 10-bit header sent (Master mode)         
#define  I2C_SR1_STOPF                       (&H00000010)     ' Stop detection (Slave mode)              
#define  I2C_SR1_RXNE                        (&H00000040)     ' Data Register not Empty (receivers)      
#define  I2C_SR1_TXE                         (&H00000080)     ' Data Register Empty (transmitters)       
#define  I2C_SR1_BERR                        (&H00000100)     ' Bus Error                                       
#define  I2C_SR1_ARLO                        (&H00000200)     ' Arbitration Lost (master mode)           
#define  I2C_SR1_AF                          (&H00000400)     ' Acknowledge Failure                             
#define  I2C_SR1_OVR                         (&H00000800)     ' Overrun/Underrun                                
#define  I2C_SR1_PECERR                      (&H00001000)     ' PEC Error in reception                          
#define  I2C_SR1_TIMEOUT                     (&H00004000)     ' Timeout or Tlow Error                           
#define  I2C_SR1_SMBALERT                    (&H00008000)     ' SMBus Alert                                     

'******************  Bit definition for I2C_SR2 register  *******************
#define  I2C_SR2_MSL                         (&H00000001)     ' Master/Slave                              
#define  I2C_SR2_BUSY                        (&H00000002)     ' Bus Busy                                  
#define  I2C_SR2_TRA                         (&H00000004)     ' Transmitter/Receiver                      
#define  I2C_SR2_GENCALL                     (&H00000010)     ' General Call Address (Slave mode)  
#define  I2C_SR2_SMBDEFAULT                  (&H00000020)     ' SMBus Device Default Address (Slave mode) 
#define  I2C_SR2_SMBHOST                     (&H00000040)     ' SMBus Host Header (Slave mode)     
#define  I2C_SR2_DUALF                       (&H00000080)     ' Dual Flag (Slave mode)             
#define  I2C_SR2_PEC                         (&H0000FF00)     ' Packet Error Checking Register            

'******************  Bit definition for I2C_CCR register  *******************
#define  I2C_CCR_CCR                         (&H00000FFF)     ' Clock Control Register in Fast/Standard mode (Master mode) 
#define  I2C_CCR_DUTY                        (&H00004000)     ' Fast Mode Duty Cycle                                       
#define  I2C_CCR_FS                          (&H00008000)     ' I2C Master Mode Selection                                  

'*****************  Bit definition for I2C_TRISE register  ******************
#define  I2C_TRISE_TRISE                     (&H0000003F)     ' Maximum Rise Time in Fast/Standard mode (Master mode) 

'*****************  Bit definition for I2C_FLTR register  ******************
#define  I2C_FLTR_DNF                        (&H0000000F)     ' Digital Noise Filter 
#define  I2C_FLTR_ANOFF                      (&H00000010)     ' Analog Noise Filter OFF 

'****************************************************************************
'                                                                            
'                           Independent WATCHDOG                             
'                                                                            
'****************************************************************************
'******************  Bit definition for IWDG_KR register  *******************
#define  IWDG_KR_KEY                         (&HFFFF)            ' Key value (write only, read 0000h)  

'******************  Bit definition for IWDG_PR register  *******************
#define  IWDG_PR_PR                          (&H07)               ' PR[2:0] (Prescaler divider)         
#define  IWDG_PR_PR_0                        (&H01)               ' Bit 0 
#define  IWDG_PR_PR_1                        (&H02)               ' Bit 1 
#define  IWDG_PR_PR_2                        (&H04)               ' Bit 2 

'******************  Bit definition for IWDG_RLR register  ******************
#define  IWDG_RLR_RL                         (&H0FFF)            ' Watchdog counter reload value        

'******************  Bit definition for IWDG_SR register  *******************
#define  IWDG_SR_PVU                         (&H01)               ' Watchdog prescaler value update      
#define  IWDG_SR_RVU                         (&H02)               ' Watchdog counter reload value update 


'****************************************************************************
'                                                                            
'                             Power Control                                  
'                                                                            
'****************************************************************************
'*******************  Bit definition for PWR_CR register  *******************
#define  PWR_CR_LPDS                         (&H00000001)     '  Low-Power Deepsleep                 
#define  PWR_CR_PDDS                         (&H00000002)     '  Power Down Deepsleep                
#define  PWR_CR_CWUF                         (&H00000004)     '  Clear Wakeup Flag                   
#define  PWR_CR_CSBF                         (&H00000008)     '  Clear Standby Flag                  
#define  PWR_CR_PVDE                         (&H00000010)     '  Power Voltage Detector Enable       

#define  PWR_CR_PLS                          (&H000000E0)     '  PLS[2:0] bits (PVD Level Selection) 
#define  PWR_CR_PLS_0                        (&H00000020)     '  Bit 0 
#define  PWR_CR_PLS_1                        (&H00000040)     '  Bit 1 
#define  PWR_CR_PLS_2                        (&H00000080)     '  Bit 2 

'  PVD level configuration 
#define  PWR_CR_PLS_LEV0                     (&H00000000)     '  PVD level 0 
#define  PWR_CR_PLS_LEV1                     (&H00000020)     '  PVD level 1 
#define  PWR_CR_PLS_LEV2                     (&H00000040)     '  PVD level 2 
#define  PWR_CR_PLS_LEV3                     (&H00000060)     '  PVD level 3 
#define  PWR_CR_PLS_LEV4                     (&H00000080)     '  PVD level 4 
#define  PWR_CR_PLS_LEV5                     (&H000000A0)     '  PVD level 5 
#define  PWR_CR_PLS_LEV6                     (&H000000C0)     '  PVD level 6 
#define  PWR_CR_PLS_LEV7                     (&H000000E0)     '  PVD level 7 

#define  PWR_CR_DBP                          (&H00000100)     '  Disable Backup Domain write protection                     
#define  PWR_CR_FPDS                         (&H00000200)     '  Flash power down in Stop mode                              
#define  PWR_CR_LPLVDS                       (&H00000400)     '  Low Power Regulator Low Voltage in Deep Sleep mode         
#define  PWR_CR_MRLVDS                       (&H00000800)     '  Main Regulator Low Voltage in Deep Sleep mode              
#define  PWR_CR_ADCDC1                       (&H00002000)     '  Refer to AN4073 on how to use this bit                     

#define  PWR_CR_VOS                          (&H0000C000)     '  VOS[1:0] bits (Regulator voltage scaling output selection) 
#define  PWR_CR_VOS_0                        (&H00004000)     '  Bit 0 
#define  PWR_CR_VOS_1                        (&H00008000)     '  Bit 1 

#define  PWR_CR_FMSSR                        (&H00100000)     '  Flash Memory Sleep System Run        
#define  PWR_CR_FISSR                        (&H00200000)     '  Flash Interface Stop while System Run 
' Legacy define 
#define  PWR_CR_PMODE                        PWR_CR_VOS

'******************  Bit definition for PWR_CSR register  *******************
#define  PWR_CSR_WUF                         (&H00000001)     '  Wakeup Flag                                      
#define  PWR_CSR_SBF                         (&H00000002)     '  Standby Flag                                     
#define  PWR_CSR_PVDO                        (&H00000004)     '  PVD Output                                       
#define  PWR_CSR_BRR                         (&H00000008)     '  Backup regulator ready                           
#define  PWR_CSR_EWUP                        (&H00000100)     '  Enable WKUP pin                                  
#define  PWR_CSR_BRE                         (&H00000200)     '  Backup regulator enable                          
#define  PWR_CSR_VOSRDY                      (&H00004000)     '  Regulator voltage scaling output selection ready 

' Legacy define 
#define  PWR_CSR_REGRDY                      PWR_CSR_VOSRDY

'****************************************************************************
'                                                                            
'                         Reset and Clock Control                            
'                                                                            
'****************************************************************************
'*******************  Bit definition for RCC_CR register  *******************
#define  RCC_CR_HSION                        (&H00000001)
#define  RCC_CR_HSIRDY                       (&H00000002)

#define  RCC_CR_HSITRIM                      (&H000000F8)
#define  RCC_CR_HSITRIM_0                    (&H00000008)' Bit 0 
#define  RCC_CR_HSITRIM_1                    (&H00000010)' Bit 1 
#define  RCC_CR_HSITRIM_2                    (&H00000020)' Bit 2 
#define  RCC_CR_HSITRIM_3                    (&H00000040)' Bit 3 
#define  RCC_CR_HSITRIM_4                    (&H00000080)' Bit 4 

#define  RCC_CR_HSICAL                       (&H0000FF00)
#define  RCC_CR_HSICAL_0                     (&H00000100)' Bit 0 
#define  RCC_CR_HSICAL_1                     (&H00000200)' Bit 1 
#define  RCC_CR_HSICAL_2                     (&H00000400)' Bit 2 
#define  RCC_CR_HSICAL_3                     (&H00000800)' Bit 3 
#define  RCC_CR_HSICAL_4                     (&H00001000)' Bit 4 
#define  RCC_CR_HSICAL_5                     (&H00002000)' Bit 5 
#define  RCC_CR_HSICAL_6                     (&H00004000)' Bit 6 
#define  RCC_CR_HSICAL_7                     (&H00008000)' Bit 7 

#define  RCC_CR_HSEON                        (&H00010000)
#define  RCC_CR_HSERDY                       (&H00020000)
#define  RCC_CR_HSEBYP                       (&H00040000)
#define  RCC_CR_CSSON                        (&H00080000)
#define  RCC_CR_PLLON                        (&H01000000)
#define  RCC_CR_PLLRDY                       (&H02000000)
#define  RCC_CR_PLLI2SON                     (&H04000000)
#define  RCC_CR_PLLI2SRDY                    (&H08000000)

'*******************  Bit definition for RCC_PLLCFGR register  **************
#define  RCC_PLLCFGR_PLLM                    (&H0000003F)
#define  RCC_PLLCFGR_PLLM_0                  (&H00000001)
#define  RCC_PLLCFGR_PLLM_1                  (&H00000002)
#define  RCC_PLLCFGR_PLLM_2                  (&H00000004)
#define  RCC_PLLCFGR_PLLM_3                  (&H00000008)
#define  RCC_PLLCFGR_PLLM_4                  (&H00000010)
#define  RCC_PLLCFGR_PLLM_5                  (&H00000020)

#define  RCC_PLLCFGR_PLLN                     (&H00007FC0)
#define  RCC_PLLCFGR_PLLN_0                   (&H00000040)
#define  RCC_PLLCFGR_PLLN_1                   (&H00000080)
#define  RCC_PLLCFGR_PLLN_2                   (&H00000100)
#define  RCC_PLLCFGR_PLLN_3                   (&H00000200)
#define  RCC_PLLCFGR_PLLN_4                   (&H00000400)
#define  RCC_PLLCFGR_PLLN_5                   (&H00000800)
#define  RCC_PLLCFGR_PLLN_6                   (&H00001000)
#define  RCC_PLLCFGR_PLLN_7                   (&H00002000)
#define  RCC_PLLCFGR_PLLN_8                   (&H00004000)

#define  RCC_PLLCFGR_PLLP                    (&H00030000)
#define  RCC_PLLCFGR_PLLP_0                  (&H00010000)
#define  RCC_PLLCFGR_PLLP_1                  (&H00020000)

#define  RCC_PLLCFGR_PLLSRC                  (&H00400000)
#define  RCC_PLLCFGR_PLLSRC_HSE              (&H00400000)
#define  RCC_PLLCFGR_PLLSRC_HSI              (&H00000000)

#define  RCC_PLLCFGR_PLLQ                    (&H0F000000)
#define  RCC_PLLCFGR_PLLQ_0                  (&H01000000)
#define  RCC_PLLCFGR_PLLQ_1                  (&H02000000)
#define  RCC_PLLCFGR_PLLQ_2                  (&H04000000)
#define  RCC_PLLCFGR_PLLQ_3                  (&H08000000)

'*******************  Bit definition for RCC_CFGR register  *****************
'  SW configuration 
#define  RCC_CFGR_SW                         (&H00000003)        '  SW[1:0] bits (System clock Switch) 
#define  RCC_CFGR_SW_0                       (&H00000001)        '  Bit 0 
#define  RCC_CFGR_SW_1                       (&H00000002)        '  Bit 1 

#define  RCC_CFGR_SW_HSI                     (&H00000000)        '  HSI selected as system clock 
#define  RCC_CFGR_SW_HSE                     (&H00000001)        '  HSE selected as system clock 
#define  RCC_CFGR_SW_PLL                     (&H00000002)        '  PLL selected as system clock 

'  SWS configuration 
#define  RCC_CFGR_SWS                        (&H0000000C)        '  SWS[1:0] bits (System Clock Switch Status) 
#define  RCC_CFGR_SWS_0                      (&H00000004)        '  Bit 0 
#define  RCC_CFGR_SWS_1                      (&H00000008)        '  Bit 1 

#define  RCC_CFGR_SWS_HSI                    (&H00000000)        '  HSI oscillator used as system clock 
#define  RCC_CFGR_SWS_HSE                    (&H00000004)        '  HSE oscillator used as system clock 
#define  RCC_CFGR_SWS_PLL                    (&H00000008)        '  PLL used as system clock 

'  HPRE configuration 
#define  RCC_CFGR_HPRE                       (&H000000F0)        '  HPRE[3:0] bits (AHB prescaler) 
#define  RCC_CFGR_HPRE_0                     (&H00000010)        '  Bit 0 
#define  RCC_CFGR_HPRE_1                     (&H00000020)        '  Bit 1 
#define  RCC_CFGR_HPRE_2                     (&H00000040)        '  Bit 2 
#define  RCC_CFGR_HPRE_3                     (&H00000080)        '  Bit 3 

#define  RCC_CFGR_HPRE_DIV1                  (&H00000000)        '  SYSCLK not divided 
#define  RCC_CFGR_HPRE_DIV2                  (&H00000080)        '  SYSCLK divided by 2 
#define  RCC_CFGR_HPRE_DIV4                  (&H00000090)        '  SYSCLK divided by 4 
#define  RCC_CFGR_HPRE_DIV8                  (&H000000A0)        '  SYSCLK divided by 8 
#define  RCC_CFGR_HPRE_DIV16                 (&H000000B0)        '  SYSCLK divided by 16 
#define  RCC_CFGR_HPRE_DIV64                 (&H000000C0)        '  SYSCLK divided by 64 
#define  RCC_CFGR_HPRE_DIV128                (&H000000D0)        '  SYSCLK divided by 128 
#define  RCC_CFGR_HPRE_DIV256                (&H000000E0)        '  SYSCLK divided by 256 
#define  RCC_CFGR_HPRE_DIV512                (&H000000F0)        '  SYSCLK divided by 512 

'  PPRE1 configuration 
#define  RCC_CFGR_PPRE1                      (&H00001C00)        '  PRE1[2:0] bits (APB1 prescaler) 
#define  RCC_CFGR_PPRE1_0                    (&H00000400)        '  Bit 0 
#define  RCC_CFGR_PPRE1_1                    (&H00000800)        '  Bit 1 
#define  RCC_CFGR_PPRE1_2                    (&H00001000)        '  Bit 2 

#define  RCC_CFGR_PPRE1_DIV1                 (&H00000000)        '  HCLK not divided 
#define  RCC_CFGR_PPRE1_DIV2                 (&H00001000)        '  HCLK divided by 2 
#define  RCC_CFGR_PPRE1_DIV4                 (&H00001400)        '  HCLK divided by 4 
#define  RCC_CFGR_PPRE1_DIV8                 (&H00001800)        '  HCLK divided by 8 
#define  RCC_CFGR_PPRE1_DIV16                (&H00001C00)        '  HCLK divided by 16 

'  PPRE2 configuration 
#define  RCC_CFGR_PPRE2                      (&H0000E000)        '  PRE2[2:0] bits (APB2 prescaler) 
#define  RCC_CFGR_PPRE2_0                    (&H00002000)        '  Bit 0 
#define  RCC_CFGR_PPRE2_1                    (&H00004000)        '  Bit 1 
#define  RCC_CFGR_PPRE2_2                    (&H00008000)        '  Bit 2 

#define  RCC_CFGR_PPRE2_DIV1                 (&H00000000)        '  HCLK not divided 
#define  RCC_CFGR_PPRE2_DIV2                 (&H00008000)        '  HCLK divided by 2 
#define  RCC_CFGR_PPRE2_DIV4                 (&H0000A000)        '  HCLK divided by 4 
#define  RCC_CFGR_PPRE2_DIV8                 (&H0000C000)        '  HCLK divided by 8 
#define  RCC_CFGR_PPRE2_DIV16                (&H0000E000)        '  HCLK divided by 16 

'  RTCPRE configuration 
#define  RCC_CFGR_RTCPRE                     (&H001F0000)
#define  RCC_CFGR_RTCPRE_0                   (&H00010000)
#define  RCC_CFGR_RTCPRE_1                   (&H00020000)
#define  RCC_CFGR_RTCPRE_2                   (&H00040000)
#define  RCC_CFGR_RTCPRE_3                   (&H00080000)
#define  RCC_CFGR_RTCPRE_4                   (&H00100000)

'  MCO1 configuration 
#define  RCC_CFGR_MCO1                       (&H00600000)
#define  RCC_CFGR_MCO1_0                     (&H00200000)
#define  RCC_CFGR_MCO1_1                     (&H00400000)

#define  RCC_CFGR_I2SSRC                     (&H00800000)

#define  RCC_CFGR_MCO1PRE                    (&H07000000)
#define  RCC_CFGR_MCO1PRE_0                  (&H01000000)
#define  RCC_CFGR_MCO1PRE_1                  (&H02000000)
#define  RCC_CFGR_MCO1PRE_2                  (&H04000000)

#define  RCC_CFGR_MCO2PRE                    (&H38000000)
#define  RCC_CFGR_MCO2PRE_0                  (&H08000000)
#define  RCC_CFGR_MCO2PRE_1                  (&H10000000)
#define  RCC_CFGR_MCO2PRE_2                  (&H20000000)

#define  RCC_CFGR_MCO2                       (&HC0000000)
#define  RCC_CFGR_MCO2_0                     (&H40000000)
#define  RCC_CFGR_MCO2_1                     (&H80000000)

'*******************  Bit definition for RCC_CIR register  ******************
#define  RCC_CIR_LSIRDYF                     (&H00000001)
#define  RCC_CIR_LSERDYF                     (&H00000002)
#define  RCC_CIR_HSIRDYF                     (&H00000004)
#define  RCC_CIR_HSERDYF                     (&H00000008)
#define  RCC_CIR_PLLRDYF                     (&H00000010)
#define  RCC_CIR_PLLI2SRDYF                  (&H00000020)

#define  RCC_CIR_CSSF                        (&H00000080)
#define  RCC_CIR_LSIRDYIE                    (&H00000100)
#define  RCC_CIR_LSERDYIE                    (&H00000200)
#define  RCC_CIR_HSIRDYIE                    (&H00000400)
#define  RCC_CIR_HSERDYIE                    (&H00000800)
#define  RCC_CIR_PLLRDYIE                    (&H00001000)
#define  RCC_CIR_PLLI2SRDYIE                 (&H00002000)

#define  RCC_CIR_LSIRDYC                     (&H00010000)
#define  RCC_CIR_LSERDYC                     (&H00020000)
#define  RCC_CIR_HSIRDYC                     (&H00040000)
#define  RCC_CIR_HSERDYC                     (&H00080000)
#define  RCC_CIR_PLLRDYC                     (&H00100000)
#define  RCC_CIR_PLLI2SRDYC                  (&H00200000)

#define  RCC_CIR_CSSC                        (&H00800000)

'*******************  Bit definition for RCC_AHB1RSTR register  *************
#define  RCC_AHB1RSTR_GPIOARST               (&H00000001)
#define  RCC_AHB1RSTR_GPIOBRST               (&H00000002)
#define  RCC_AHB1RSTR_GPIOCRST               (&H00000004)
#define  RCC_AHB1RSTR_GPIODRST               (&H00000008)
#define  RCC_AHB1RSTR_GPIOERST               (&H00000010)
#define  RCC_AHB1RSTR_GPIOHRST               (&H00000080)
#define  RCC_AHB1RSTR_CRCRST                 (&H00001000)
#define  RCC_AHB1RSTR_DMA1RST                (&H00200000)
#define  RCC_AHB1RSTR_DMA2RST                (&H00400000)

'*******************  Bit definition for RCC_AHB2RSTR register  *************
#define  RCC_AHB2RSTR_OTGFSRST               (&H00000080)

'*******************  Bit definition for RCC_AHB3RSTR register  *************

'*******************  Bit definition for RCC_APB1RSTR register  *************
#define  RCC_APB1RSTR_TIM2RST                (&H00000001)
#define  RCC_APB1RSTR_TIM3RST                (&H00000002)
#define  RCC_APB1RSTR_TIM4RST                (&H00000004)
#define  RCC_APB1RSTR_TIM5RST                (&H00000008)
#define  RCC_APB1RSTR_WWDGRST                (&H00000800)
#define  RCC_APB1RSTR_SPI2RST                (&H00004000)
#define  RCC_APB1RSTR_SPI3RST                (&H00008000)
#define  RCC_APB1RSTR_USART2RST              (&H00020000)
#define  RCC_APB1RSTR_I2C1RST                (&H00200000)
#define  RCC_APB1RSTR_I2C2RST                (&H00400000)
#define  RCC_APB1RSTR_I2C3RST                (&H00800000)
#define  RCC_APB1RSTR_PWRRST                 (&H10000000)

'*******************  Bit definition for RCC_APB2RSTR register  *************
#define  RCC_APB2RSTR_TIM1RST                (&H00000001)
#define  RCC_APB2RSTR_USART1RST              (&H00000010)
#define  RCC_APB2RSTR_USART6RST              (&H00000020)
#define  RCC_APB2RSTR_ADCRST                 (&H00000100)
#define  RCC_APB2RSTR_SDIORST                (&H00000800)
#define  RCC_APB2RSTR_SPI1RST                (&H00001000)
#define  RCC_APB2RSTR_SPI4RST                (&H00002000)
#define  RCC_APB2RSTR_SYSCFGRST              (&H00004000)
#define  RCC_APB2RSTR_TIM9RST                (&H00010000)
#define  RCC_APB2RSTR_TIM10RST               (&H00020000)
#define  RCC_APB2RSTR_TIM11RST               (&H00040000)
#define  RCC_APB2RSTR_SPI5RST                (&H00100000)

' Old SPI1RST bit definition, maintained for legacy purpose 
#define  RCC_APB2RSTR_SPI1                   RCC_APB2RSTR_SPI1RST

'*******************  Bit definition for RCC_AHB1ENR register  **************
#define  RCC_AHB1ENR_GPIOAEN                 (&H00000001)
#define  RCC_AHB1ENR_GPIOBEN                 (&H00000002)
#define  RCC_AHB1ENR_GPIOCEN                 (&H00000004)
#define  RCC_AHB1ENR_GPIODEN                 (&H00000008)
#define  RCC_AHB1ENR_GPIOEEN                 (&H00000010)
#define  RCC_AHB1ENR_GPIOHEN                 (&H00000080)
#define  RCC_AHB1ENR_CRCEN                   (&H00001000)
#define  RCC_AHB1ENR_BKPSRAMEN               (&H00040000)
#define  RCC_AHB1ENR_CCMDATARAMEN            (&H00100000)
#define  RCC_AHB1ENR_DMA1EN                  (&H00200000)
#define  RCC_AHB1ENR_DMA2EN                  (&H00400000)

'*******************  Bit definition for RCC_AHB2ENR register  **************
#define  RCC_AHB2ENR_OTGFSEN                 (&H00000080)

'*******************  Bit definition for RCC_AHB3ENR register  **************

'*******************  Bit definition for RCC_APB1ENR register  **************
#define  RCC_APB1ENR_TIM2EN                  (&H00000001)
#define  RCC_APB1ENR_TIM3EN                  (&H00000002)
#define  RCC_APB1ENR_TIM4EN                  (&H00000004)
#define  RCC_APB1ENR_TIM5EN                  (&H00000008)
#define  RCC_APB1ENR_WWDGEN                  (&H00000800)
#define  RCC_APB1ENR_SPI2EN                  (&H00004000)
#define  RCC_APB1ENR_SPI3EN                  (&H00008000)
#define  RCC_APB1ENR_USART2EN                (&H00020000)
#define  RCC_APB1ENR_I2C1EN                  (&H00200000)
#define  RCC_APB1ENR_I2C2EN                  (&H00400000)
#define  RCC_APB1ENR_I2C3EN                  (&H00800000)
#define  RCC_APB1ENR_PWREN                   (&H10000000)

'*******************  Bit definition for RCC_APB2ENR register  **************
#define  RCC_APB2ENR_TIM1EN                  (&H00000001)
#define  RCC_APB2ENR_USART1EN                (&H00000010)
#define  RCC_APB2ENR_USART6EN                (&H00000020)
#define  RCC_APB2ENR_ADC1EN                  (&H00000100)
#define  RCC_APB2ENR_SDIOEN                  (&H00000800)
#define  RCC_APB2ENR_SPI1EN                  (&H00001000)
#define  RCC_APB2ENR_SPI4EN                  (&H00002000)
#define  RCC_APB2ENR_SYSCFGEN                (&H00004000)
#define  RCC_APB2ENR_TIM9EN                  (&H00010000)
#define  RCC_APB2ENR_TIM10EN                 (&H00020000)
#define  RCC_APB2ENR_TIM11EN                 (&H00040000)
#define  RCC_APB2ENR_SPI5EN                  (&H00100000)

'*******************  Bit definition for RCC_AHB1LPENR register  ************
#define  RCC_AHB1LPENR_GPIOALPEN             (&H00000001)
#define  RCC_AHB1LPENR_GPIOBLPEN             (&H00000002)
#define  RCC_AHB1LPENR_GPIOCLPEN             (&H00000004)
#define  RCC_AHB1LPENR_GPIODLPEN             (&H00000008)
#define  RCC_AHB1LPENR_GPIOELPEN             (&H00000010)
#define  RCC_AHB1LPENR_GPIOHLPEN             (&H00000080)
#define  RCC_AHB1LPENR_CRCLPEN               (&H00001000)
#define  RCC_AHB1LPENR_FLITFLPEN             (&H00008000)
#define  RCC_AHB1LPENR_SRAM1LPEN             (&H00010000)
#define  RCC_AHB1LPENR_SRAM2LPEN             (&H00020000)
#define  RCC_AHB1LPENR_BKPSRAMLPEN           (&H00040000)
#define  RCC_AHB1LPENR_DMA1LPEN              (&H00200000)
#define  RCC_AHB1LPENR_DMA2LPEN              (&H00400000)

'*******************  Bit definition for RCC_AHB2LPENR register  ************
#define  RCC_AHB2LPENR_OTGFSLPEN             (&H00000080)

'*******************  Bit definition for RCC_AHB3LPENR register  ************

'*******************  Bit definition for RCC_APB1LPENR register  ************
#define  RCC_APB1LPENR_TIM2LPEN              (&H00000001)
#define  RCC_APB1LPENR_TIM3LPEN              (&H00000002)
#define  RCC_APB1LPENR_TIM4LPEN              (&H00000004)
#define  RCC_APB1LPENR_TIM5LPEN              (&H00000008)
#define  RCC_APB1LPENR_WWDGLPEN              (&H00000800)
#define  RCC_APB1LPENR_SPI2LPEN              (&H00004000)
#define  RCC_APB1LPENR_SPI3LPEN              (&H00008000)
#define  RCC_APB1LPENR_USART2LPEN            (&H00020000)
#define  RCC_APB1LPENR_I2C1LPEN              (&H00200000)
#define  RCC_APB1LPENR_I2C2LPEN              (&H00400000)
#define  RCC_APB1LPENR_I2C3LPEN              (&H00800000)
#define  RCC_APB1LPENR_PWRLPEN               (&H10000000)
#define  RCC_APB1LPENR_DACLPEN               (&H20000000)

'*******************  Bit definition for RCC_APB2LPENR register  ************
#define  RCC_APB2LPENR_TIM1LPEN              (&H00000001)
#define  RCC_APB2LPENR_USART1LPEN            (&H00000010)
#define  RCC_APB2LPENR_USART6LPEN            (&H00000020)
#define  RCC_APB2LPENR_ADC1LPEN              (&H00000100)
#define  RCC_APB2LPENR_SDIOLPEN              (&H00000800)
#define  RCC_APB2LPENR_SPI1LPEN              (&H00001000)
#define  RCC_APB2LPENR_SPI4LPEN              (&H00002000)
#define  RCC_APB2LPENR_SYSCFGLPEN            (&H00004000)
#define  RCC_APB2LPENR_TIM9LPEN              (&H00010000)
#define  RCC_APB2LPENR_TIM10LPEN             (&H00020000)
#define  RCC_APB2LPENR_TIM11LPEN             (&H00040000)
#define  RCC_APB2LPENR_SPI5LPEN              (&H00100000)

'*******************  Bit definition for RCC_BDCR register  *****************
#define  RCC_BDCR_LSEON                      (&H00000001)
#define  RCC_BDCR_LSERDY                     (&H00000002)
#define  RCC_BDCR_LSEBYP                     (&H00000004)
#define  RCC_BDCR_LSEMOD                     (&H00000008)

#define  RCC_BDCR_RTCSEL                    (&H00000300)
#define  RCC_BDCR_RTCSEL_0                  (&H00000100)
#define  RCC_BDCR_RTCSEL_1                  (&H00000200)

#define  RCC_BDCR_RTCEN                      (&H00008000)
#define  RCC_BDCR_BDRST                      (&H00010000)

'*******************  Bit definition for RCC_CSR register  ******************
#define  RCC_CSR_LSION                       (&H00000001)
#define  RCC_CSR_LSIRDY                      (&H00000002)
#define  RCC_CSR_RMVF                        (&H01000000)
#define  RCC_CSR_BORRSTF                     (&H02000000)
#define  RCC_CSR_PADRSTF                     (&H04000000)
#define  RCC_CSR_PORRSTF                     (&H08000000)
#define  RCC_CSR_SFTRSTF                     (&H10000000)
#define  RCC_CSR_WDGRSTF                     (&H20000000)
#define  RCC_CSR_WWDGRSTF                    (&H40000000)
#define  RCC_CSR_LPWRRSTF                    (&H80000000)

'*******************  Bit definition for RCC_SSCGR register  ****************
#define  RCC_SSCGR_MODPER                    (&H00001FFF)
#define  RCC_SSCGR_INCSTEP                   (&H0FFFE000)
#define  RCC_SSCGR_SPREADSEL                 (&H40000000)
#define  RCC_SSCGR_SSCGEN                    (&H80000000)

'*******************  Bit definition for RCC_PLLI2SCFGR register  ***********
#define  RCC_PLLI2SCFGR_PLLI2SM              (&H0000003F)
#define  RCC_PLLI2SCFGR_PLLI2SM_0            (&H00000001)
#define  RCC_PLLI2SCFGR_PLLI2SM_1            (&H00000002)
#define  RCC_PLLI2SCFGR_PLLI2SM_2            (&H00000004)
#define  RCC_PLLI2SCFGR_PLLI2SM_3            (&H00000008)
#define  RCC_PLLI2SCFGR_PLLI2SM_4            (&H00000010)
#define  RCC_PLLI2SCFGR_PLLI2SM_5            (&H00000020)

#define  RCC_PLLI2SCFGR_PLLI2SN              (&H00007FC0)
#define  RCC_PLLI2SCFGR_PLLI2SN_0            (&H00000040)
#define  RCC_PLLI2SCFGR_PLLI2SN_1            (&H00000080)
#define  RCC_PLLI2SCFGR_PLLI2SN_2            (&H00000100)
#define  RCC_PLLI2SCFGR_PLLI2SN_3            (&H00000200)
#define  RCC_PLLI2SCFGR_PLLI2SN_4            (&H00000400)
#define  RCC_PLLI2SCFGR_PLLI2SN_5            (&H00000800)
#define  RCC_PLLI2SCFGR_PLLI2SN_6            (&H00001000)
#define  RCC_PLLI2SCFGR_PLLI2SN_7            (&H00002000)
#define  RCC_PLLI2SCFGR_PLLI2SN_8            (&H00004000)

#define  RCC_PLLI2SCFGR_PLLI2SR              (&H70000000)
#define  RCC_PLLI2SCFGR_PLLI2SR_0            (&H10000000)
#define  RCC_PLLI2SCFGR_PLLI2SR_1            (&H20000000)
#define  RCC_PLLI2SCFGR_PLLI2SR_2            (&H40000000)


'****************************************************************************
'                                                                            
'                           Real-Time Clock (RTC)                            
'                                                                            
'****************************************************************************
'*******************  Bits definition for RTC_TR register  ******************
#define RTC_TR_PM                            (&H00400000)
#define RTC_TR_HT                            (&H00300000)
#define RTC_TR_HT_0                          (&H00100000)
#define RTC_TR_HT_1                          (&H00200000)
#define RTC_TR_HU                            (&H000F0000)
#define RTC_TR_HU_0                          (&H00010000)
#define RTC_TR_HU_1                          (&H00020000)
#define RTC_TR_HU_2                          (&H00040000)
#define RTC_TR_HU_3                          (&H00080000)
#define RTC_TR_MNT                           (&H00007000)
#define RTC_TR_MNT_0                         (&H00001000)
#define RTC_TR_MNT_1                         (&H00002000)
#define RTC_TR_MNT_2                         (&H00004000)
#define RTC_TR_MNU                           (&H00000F00)
#define RTC_TR_MNU_0                         (&H00000100)
#define RTC_TR_MNU_1                         (&H00000200)
#define RTC_TR_MNU_2                         (&H00000400)
#define RTC_TR_MNU_3                         (&H00000800)
#define RTC_TR_ST                            (&H00000070)
#define RTC_TR_ST_0                          (&H00000010)
#define RTC_TR_ST_1                          (&H00000020)
#define RTC_TR_ST_2                          (&H00000040)
#define RTC_TR_SU                            (&H0000000F)
#define RTC_TR_SU_0                          (&H00000001)
#define RTC_TR_SU_1                          (&H00000002)
#define RTC_TR_SU_2                          (&H00000004)
#define RTC_TR_SU_3                          (&H00000008)

'*******************  Bits definition for RTC_DR register  ******************
#define RTC_DR_YT                            (&H00F00000)
#define RTC_DR_YT_0                          (&H00100000)
#define RTC_DR_YT_1                          (&H00200000)
#define RTC_DR_YT_2                          (&H00400000)
#define RTC_DR_YT_3                          (&H00800000)
#define RTC_DR_YU                            (&H000F0000)
#define RTC_DR_YU_0                          (&H00010000)
#define RTC_DR_YU_1                          (&H00020000)
#define RTC_DR_YU_2                          (&H00040000)
#define RTC_DR_YU_3                          (&H00080000)
#define RTC_DR_WDU                           (&H0000E000)
#define RTC_DR_WDU_0                         (&H00002000)
#define RTC_DR_WDU_1                         (&H00004000)
#define RTC_DR_WDU_2                         (&H00008000)
#define RTC_DR_MT                            (&H00001000)
#define RTC_DR_MU                            (&H00000F00)
#define RTC_DR_MU_0                          (&H00000100)
#define RTC_DR_MU_1                          (&H00000200)
#define RTC_DR_MU_2                          (&H00000400)
#define RTC_DR_MU_3                          (&H00000800)
#define RTC_DR_DT                            (&H00000030)
#define RTC_DR_DT_0                          (&H00000010)
#define RTC_DR_DT_1                          (&H00000020)
#define RTC_DR_DU                            (&H0000000F)
#define RTC_DR_DU_0                          (&H00000001)
#define RTC_DR_DU_1                          (&H00000002)
#define RTC_DR_DU_2                          (&H00000004)
#define RTC_DR_DU_3                          (&H00000008)

'*******************  Bits definition for RTC_CR register  ******************
#define RTC_CR_COE                           (&H00800000)
#define RTC_CR_OSEL                          (&H00600000)
#define RTC_CR_OSEL_0                        (&H00200000)
#define RTC_CR_OSEL_1                        (&H00400000)
#define RTC_CR_POL                           (&H00100000)
#define RTC_CR_COSEL                         (&H00080000)
#define RTC_CR_BCK                           (&H00040000)
#define RTC_CR_SUB1H                         (&H00020000)
#define RTC_CR_ADD1H                         (&H00010000)
#define RTC_CR_TSIE                          (&H00008000)
#define RTC_CR_WUTIE                         (&H00004000)
#define RTC_CR_ALRBIE                        (&H00002000)
#define RTC_CR_ALRAIE                        (&H00001000)
#define RTC_CR_TSE                           (&H00000800)
#define RTC_CR_WUTE                          (&H00000400)
#define RTC_CR_ALRBE                         (&H00000200)
#define RTC_CR_ALRAE                         (&H00000100)
#define RTC_CR_DCE                           (&H00000080)
#define RTC_CR_FMT                           (&H00000040)
#define RTC_CR_BYPSHAD                       (&H00000020)
#define RTC_CR_REFCKON                       (&H00000010)
#define RTC_CR_TSEDGE                        (&H00000008)
#define RTC_CR_WUCKSEL                       (&H00000007)
#define RTC_CR_WUCKSEL_0                     (&H00000001)
#define RTC_CR_WUCKSEL_1                     (&H00000002)
#define RTC_CR_WUCKSEL_2                     (&H00000004)

'*******************  Bits definition for RTC_ISR register  *****************
#define RTC_ISR_RECALPF                      (&H00010000)
#define RTC_ISR_TAMP1F                       (&H00002000)
#define RTC_ISR_TAMP2F                       (&H00004000)
#define RTC_ISR_TSOVF                        (&H00001000)
#define RTC_ISR_TSF                          (&H00000800)
#define RTC_ISR_WUTF                         (&H00000400)
#define RTC_ISR_ALRBF                        (&H00000200)
#define RTC_ISR_ALRAF                        (&H00000100)
#define RTC_ISR_INIT                         (&H00000080)
#define RTC_ISR_INITF                        (&H00000040)
#define RTC_ISR_RSF                          (&H00000020)
#define RTC_ISR_INITS                        (&H00000010)
#define RTC_ISR_SHPF                         (&H00000008)
#define RTC_ISR_WUTWF                        (&H00000004)
#define RTC_ISR_ALRBWF                       (&H00000002)
#define RTC_ISR_ALRAWF                       (&H00000001)

'*******************  Bits definition for RTC_PRER register  ****************
#define RTC_PRER_PREDIV_A                    (&H007F0000)
#define RTC_PRER_PREDIV_S                    (&H00007FFF)

'*******************  Bits definition for RTC_WUTR register  ****************
#define RTC_WUTR_WUT                         (&H0000FFFF)

'*******************  Bits definition for RTC_CALIBR register  **************
#define RTC_CALIBR_DCS                       (&H00000080)
#define RTC_CALIBR_DC                        (&H0000001F)

'*******************  Bits definition for RTC_ALRMAR register  **************
#define RTC_ALRMAR_MSK4                      (&H80000000)
#define RTC_ALRMAR_WDSEL                     (&H40000000)
#define RTC_ALRMAR_DT                        (&H30000000)
#define RTC_ALRMAR_DT_0                      (&H10000000)
#define RTC_ALRMAR_DT_1                      (&H20000000)
#define RTC_ALRMAR_DU                        (&H0F000000)
#define RTC_ALRMAR_DU_0                      (&H01000000)
#define RTC_ALRMAR_DU_1                      (&H02000000)
#define RTC_ALRMAR_DU_2                      (&H04000000)
#define RTC_ALRMAR_DU_3                      (&H08000000)
#define RTC_ALRMAR_MSK3                      (&H00800000)
#define RTC_ALRMAR_PM                        (&H00400000)
#define RTC_ALRMAR_HT                        (&H00300000)
#define RTC_ALRMAR_HT_0                      (&H00100000)
#define RTC_ALRMAR_HT_1                      (&H00200000)
#define RTC_ALRMAR_HU                        (&H000F0000)
#define RTC_ALRMAR_HU_0                      (&H00010000)
#define RTC_ALRMAR_HU_1                      (&H00020000)
#define RTC_ALRMAR_HU_2                      (&H00040000)
#define RTC_ALRMAR_HU_3                      (&H00080000)
#define RTC_ALRMAR_MSK2                      (&H00008000)
#define RTC_ALRMAR_MNT                       (&H00007000)
#define RTC_ALRMAR_MNT_0                     (&H00001000)
#define RTC_ALRMAR_MNT_1                     (&H00002000)
#define RTC_ALRMAR_MNT_2                     (&H00004000)
#define RTC_ALRMAR_MNU                       (&H00000F00)
#define RTC_ALRMAR_MNU_0                     (&H00000100)
#define RTC_ALRMAR_MNU_1                     (&H00000200)
#define RTC_ALRMAR_MNU_2                     (&H00000400)
#define RTC_ALRMAR_MNU_3                     (&H00000800)
#define RTC_ALRMAR_MSK1                      (&H00000080)
#define RTC_ALRMAR_ST                        (&H00000070)
#define RTC_ALRMAR_ST_0                      (&H00000010)
#define RTC_ALRMAR_ST_1                      (&H00000020)
#define RTC_ALRMAR_ST_2                      (&H00000040)
#define RTC_ALRMAR_SU                        (&H0000000F)
#define RTC_ALRMAR_SU_0                      (&H00000001)
#define RTC_ALRMAR_SU_1                      (&H00000002)
#define RTC_ALRMAR_SU_2                      (&H00000004)
#define RTC_ALRMAR_SU_3                      (&H00000008)

'*******************  Bits definition for RTC_ALRMBR register  **************
#define RTC_ALRMBR_MSK4                      (&H80000000)
#define RTC_ALRMBR_WDSEL                     (&H40000000)
#define RTC_ALRMBR_DT                        (&H30000000)
#define RTC_ALRMBR_DT_0                      (&H10000000)
#define RTC_ALRMBR_DT_1                      (&H20000000)
#define RTC_ALRMBR_DU                        (&H0F000000)
#define RTC_ALRMBR_DU_0                      (&H01000000)
#define RTC_ALRMBR_DU_1                      (&H02000000)
#define RTC_ALRMBR_DU_2                      (&H04000000)
#define RTC_ALRMBR_DU_3                      (&H08000000)
#define RTC_ALRMBR_MSK3                      (&H00800000)
#define RTC_ALRMBR_PM                        (&H00400000)
#define RTC_ALRMBR_HT                        (&H00300000)
#define RTC_ALRMBR_HT_0                      (&H00100000)
#define RTC_ALRMBR_HT_1                      (&H00200000)
#define RTC_ALRMBR_HU                        (&H000F0000)
#define RTC_ALRMBR_HU_0                      (&H00010000)
#define RTC_ALRMBR_HU_1                      (&H00020000)
#define RTC_ALRMBR_HU_2                      (&H00040000)
#define RTC_ALRMBR_HU_3                      (&H00080000)
#define RTC_ALRMBR_MSK2                      (&H00008000)
#define RTC_ALRMBR_MNT                       (&H00007000)
#define RTC_ALRMBR_MNT_0                     (&H00001000)
#define RTC_ALRMBR_MNT_1                     (&H00002000)
#define RTC_ALRMBR_MNT_2                     (&H00004000)
#define RTC_ALRMBR_MNU                       (&H00000F00)
#define RTC_ALRMBR_MNU_0                     (&H00000100)
#define RTC_ALRMBR_MNU_1                     (&H00000200)
#define RTC_ALRMBR_MNU_2                     (&H00000400)
#define RTC_ALRMBR_MNU_3                     (&H00000800)
#define RTC_ALRMBR_MSK1                      (&H00000080)
#define RTC_ALRMBR_ST                        (&H00000070)
#define RTC_ALRMBR_ST_0                      (&H00000010)
#define RTC_ALRMBR_ST_1                      (&H00000020)
#define RTC_ALRMBR_ST_2                      (&H00000040)
#define RTC_ALRMBR_SU                        (&H0000000F)
#define RTC_ALRMBR_SU_0                      (&H00000001)
#define RTC_ALRMBR_SU_1                      (&H00000002)
#define RTC_ALRMBR_SU_2                      (&H00000004)
#define RTC_ALRMBR_SU_3                      (&H00000008)

'*******************  Bits definition for RTC_WPR register  *****************
#define RTC_WPR_KEY                          (&H000000FF)

'*******************  Bits definition for RTC_SSR register  *****************
#define RTC_SSR_SS                           (&H0000FFFF)

'*******************  Bits definition for RTC_SHIFTR register  **************
#define RTC_SHIFTR_SUBFS                     (&H00007FFF)
#define RTC_SHIFTR_ADD1S                     (&H80000000)

'*******************  Bits definition for RTC_TSTR register  ****************
#define RTC_TSTR_PM                          (&H00400000)
#define RTC_TSTR_HT                          (&H00300000)
#define RTC_TSTR_HT_0                        (&H00100000)
#define RTC_TSTR_HT_1                        (&H00200000)
#define RTC_TSTR_HU                          (&H000F0000)
#define RTC_TSTR_HU_0                        (&H00010000)
#define RTC_TSTR_HU_1                        (&H00020000)
#define RTC_TSTR_HU_2                        (&H00040000)
#define RTC_TSTR_HU_3                        (&H00080000)
#define RTC_TSTR_MNT                         (&H00007000)
#define RTC_TSTR_MNT_0                       (&H00001000)
#define RTC_TSTR_MNT_1                       (&H00002000)
#define RTC_TSTR_MNT_2                       (&H00004000)
#define RTC_TSTR_MNU                         (&H00000F00)
#define RTC_TSTR_MNU_0                       (&H00000100)
#define RTC_TSTR_MNU_1                       (&H00000200)
#define RTC_TSTR_MNU_2                       (&H00000400)
#define RTC_TSTR_MNU_3                       (&H00000800)
#define RTC_TSTR_ST                          (&H00000070)
#define RTC_TSTR_ST_0                        (&H00000010)
#define RTC_TSTR_ST_1                        (&H00000020)
#define RTC_TSTR_ST_2                        (&H00000040)
#define RTC_TSTR_SU                          (&H0000000F)
#define RTC_TSTR_SU_0                        (&H00000001)
#define RTC_TSTR_SU_1                        (&H00000002)
#define RTC_TSTR_SU_2                        (&H00000004)
#define RTC_TSTR_SU_3                        (&H00000008)

'*******************  Bits definition for RTC_TSDR register  ****************
#define RTC_TSDR_WDU                         (&H0000E000)
#define RTC_TSDR_WDU_0                       (&H00002000)
#define RTC_TSDR_WDU_1                       (&H00004000)
#define RTC_TSDR_WDU_2                       (&H00008000)
#define RTC_TSDR_MT                          (&H00001000)
#define RTC_TSDR_MU                          (&H00000F00)
#define RTC_TSDR_MU_0                        (&H00000100)
#define RTC_TSDR_MU_1                        (&H00000200)
#define RTC_TSDR_MU_2                        (&H00000400)
#define RTC_TSDR_MU_3                        (&H00000800)
#define RTC_TSDR_DT                          (&H00000030)
#define RTC_TSDR_DT_0                        (&H00000010)
#define RTC_TSDR_DT_1                        (&H00000020)
#define RTC_TSDR_DU                          (&H0000000F)
#define RTC_TSDR_DU_0                        (&H00000001)
#define RTC_TSDR_DU_1                        (&H00000002)
#define RTC_TSDR_DU_2                        (&H00000004)
#define RTC_TSDR_DU_3                        (&H00000008)

'*******************  Bits definition for RTC_TSSSR register  ***************
#define RTC_TSSSR_SS                         (&H0000FFFF)

'*******************  Bits definition for RTC_CAL register  ****************
#define RTC_CALR_CALP                        (&H00008000)
#define RTC_CALR_CALW8                       (&H00004000)
#define RTC_CALR_CALW16                      (&H00002000)
#define RTC_CALR_CALM                        (&H000001FF)
#define RTC_CALR_CALM_0                      (&H00000001)
#define RTC_CALR_CALM_1                      (&H00000002)
#define RTC_CALR_CALM_2                      (&H00000004)
#define RTC_CALR_CALM_3                      (&H00000008)
#define RTC_CALR_CALM_4                      (&H00000010)
#define RTC_CALR_CALM_5                      (&H00000020)
#define RTC_CALR_CALM_6                      (&H00000040)
#define RTC_CALR_CALM_7                      (&H00000080)
#define RTC_CALR_CALM_8                      (&H00000100)

'*******************  Bits definition for RTC_TAFCR register  ***************
#define RTC_TAFCR_ALARMOUTTYPE               (&H00040000)
#define RTC_TAFCR_TSINSEL                    (&H00020000)
#define RTC_TAFCR_TAMPINSEL                  (&H00010000)
#define RTC_TAFCR_TAMPPUDIS                  (&H00008000)
#define RTC_TAFCR_TAMPPRCH                   (&H00006000)
#define RTC_TAFCR_TAMPPRCH_0                 (&H00002000)
#define RTC_TAFCR_TAMPPRCH_1                 (&H00004000)
#define RTC_TAFCR_TAMPFLT                    (&H00001800)
#define RTC_TAFCR_TAMPFLT_0                  (&H00000800)
#define RTC_TAFCR_TAMPFLT_1                  (&H00001000)
#define RTC_TAFCR_TAMPFREQ                   (&H00000700)
#define RTC_TAFCR_TAMPFREQ_0                 (&H00000100)
#define RTC_TAFCR_TAMPFREQ_1                 (&H00000200)
#define RTC_TAFCR_TAMPFREQ_2                 (&H00000400)
#define RTC_TAFCR_TAMPTS                     (&H00000080)
#define RTC_TAFCR_TAMP2TRG                   (&H00000010)
#define RTC_TAFCR_TAMP2E                     (&H00000008)
#define RTC_TAFCR_TAMPIE                     (&H00000004)
#define RTC_TAFCR_TAMP1TRG                   (&H00000002)
#define RTC_TAFCR_TAMP1E                     (&H00000001)

'*******************  Bits definition for RTC_ALRMASSR register  ************
#define RTC_ALRMASSR_MASKSS                  (&H0F000000)
#define RTC_ALRMASSR_MASKSS_0                (&H01000000)
#define RTC_ALRMASSR_MASKSS_1                (&H02000000)
#define RTC_ALRMASSR_MASKSS_2                (&H04000000)
#define RTC_ALRMASSR_MASKSS_3                (&H08000000)
#define RTC_ALRMASSR_SS                      (&H00007FFF)

'*******************  Bits definition for RTC_ALRMBSSR register  ************
#define RTC_ALRMBSSR_MASKSS                  (&H0F000000)
#define RTC_ALRMBSSR_MASKSS_0                (&H01000000)
#define RTC_ALRMBSSR_MASKSS_1                (&H02000000)
#define RTC_ALRMBSSR_MASKSS_2                (&H04000000)
#define RTC_ALRMBSSR_MASKSS_3                (&H08000000)
#define RTC_ALRMBSSR_SS                      (&H00007FFF)

'****************************************************************************
'                                                                            
'                          SD host Interface                                 
'                                                                            
'****************************************************************************
'*****************  Bit definition for SDIO_POWER register  *****************
#define  SDIO_POWER_PWRCTRL                  (&H03)               ' PWRCTRL[1:0] bits (Power supply control bits) 
#define  SDIO_POWER_PWRCTRL_0                (&H01)               ' Bit 0 
#define  SDIO_POWER_PWRCTRL_1                (&H02)               ' Bit 1 

'*****************  Bit definition for SDIO_CLKCR register  *****************
#define  SDIO_CLKCR_CLKDIV                   (&H00FF)            ' Clock divide factor             
#define  SDIO_CLKCR_CLKEN                    (&H0100)            ' Clock enable bit                
#define  SDIO_CLKCR_PWRSAV                   (&H0200)            ' Power saving configuration bit  
#define  SDIO_CLKCR_BYPASS                   (&H0400)            ' Clock divider bypass enable bit 

#define  SDIO_CLKCR_WIDBUS                   (&H1800)            ' WIDBUS[1:0] bits (Wide bus mode enable bit) 
#define  SDIO_CLKCR_WIDBUS_0                 (&H0800)            ' Bit 0 
#define  SDIO_CLKCR_WIDBUS_1                 (&H1000)            ' Bit 1 

#define  SDIO_CLKCR_NEGEDGE                  (&H2000)            ' SDIO_CK dephasing selection bit 
#define  SDIO_CLKCR_HWFC_EN                  (&H4000)            ' HW Flow Control enable          

'******************  Bit definition for SDIO_ARG register  ******************
#define  SDIO_ARG_CMDARG                     (&HFFFFFFFF)            ' Command argument 

'******************  Bit definition for SDIO_CMD register  ******************
#define  SDIO_CMD_CMDINDEX                   (&H003F)            ' Command Index                               

#define  SDIO_CMD_WAITRESP                   (&H00C0)            ' WAITRESP[1:0] bits (Wait for response bits) 
#define  SDIO_CMD_WAITRESP_0                 (&H0040)            '  Bit 0 
#define  SDIO_CMD_WAITRESP_1                 (&H0080)            '  Bit 1 

#define  SDIO_CMD_WAITINT                    (&H0100)            ' CPSM Waits for Interrupt Request                               
#define  SDIO_CMD_WAITPEND                   (&H0200)            ' CPSM Waits for ends of data transfer (CmdPend internal signal) 
#define  SDIO_CMD_CPSMEN                     (&H0400)            ' Command path state machine (CPSM) Enable bit                   
#define  SDIO_CMD_SDIOSUSPEND                (&H0800)            ' SD I/O suspend command                                         
#define  SDIO_CMD_ENCMDCOMPL                 (&H1000)            ' Enable CMD completion                                          
#define  SDIO_CMD_NIEN                       (&H2000)            ' Not Interrupt Enable 
#define  SDIO_CMD_CEATACMD                   (&H4000)            ' CE-ATA command       

'****************  Bit definition for SDIO_RESPCMD register  ****************
#define  SDIO_RESPCMD_RESPCMD                (&H3F)               ' Response command index 

'*****************  Bit definition for SDIO_RESP0 register  *****************
#define  SDIO_RESP0_CARDSTATUS0              (&HFFFFFFFF)        ' Card Status 

'*****************  Bit definition for SDIO_RESP1 register  *****************
#define  SDIO_RESP1_CARDSTATUS1              (&HFFFFFFFF)        ' Card Status 

'*****************  Bit definition for SDIO_RESP2 register  *****************
#define  SDIO_RESP2_CARDSTATUS2              (&HFFFFFFFF)        ' Card Status 

'*****************  Bit definition for SDIO_RESP3 register  *****************
#define  SDIO_RESP3_CARDSTATUS3              (&HFFFFFFFF)        ' Card Status 

'*****************  Bit definition for SDIO_RESP4 register  *****************
#define  SDIO_RESP4_CARDSTATUS4              (&HFFFFFFFF)        ' Card Status 

'*****************  Bit definition for SDIO_DTIMER register  ****************
#define  SDIO_DTIMER_DATATIME                (&HFFFFFFFF)        ' Data timeout period. 

'*****************  Bit definition for SDIO_DLEN register  ******************
#define  SDIO_DLEN_DATALENGTH                (&H01FFFFFF)        ' Data length value    

'*****************  Bit definition for SDIO_DCTRL register  *****************
#define  SDIO_DCTRL_DTEN                     (&H0001)            ' Data transfer enabled bit         
#define  SDIO_DCTRL_DTDIR                    (&H0002)            ' Data transfer direction selection 
#define  SDIO_DCTRL_DTMODE                   (&H0004)            ' Data transfer mode selection      
#define  SDIO_DCTRL_DMAEN                    (&H0008)            ' DMA enabled bit                   

#define  SDIO_DCTRL_DBLOCKSIZE               (&H00F0)            ' DBLOCKSIZE[3:0] bits (Data block size) 
#define  SDIO_DCTRL_DBLOCKSIZE_0             (&H0010)            ' Bit 0 
#define  SDIO_DCTRL_DBLOCKSIZE_1             (&H0020)            ' Bit 1 
#define  SDIO_DCTRL_DBLOCKSIZE_2             (&H0040)            ' Bit 2 
#define  SDIO_DCTRL_DBLOCKSIZE_3             (&H0080)            ' Bit 3 

#define  SDIO_DCTRL_RWSTART                  (&H0100)            ' Read wait start         
#define  SDIO_DCTRL_RWSTOP                   (&H0200)            ' Read wait stop          
#define  SDIO_DCTRL_RWMOD                    (&H0400)            ' Read wait mode          
#define  SDIO_DCTRL_SDIOEN                   (&H0800)            ' SD I/O enable functions 

'*****************  Bit definition for SDIO_DCOUNT register  ****************
#define  SDIO_DCOUNT_DATACOUNT               (&H01FFFFFF)        ' Data count value 

'*****************  Bit definition for SDIO_STA register  *******************
#define  SDIO_STA_CCRCFAIL                   (&H00000001)        ' Command response received (CRC check failed)  
#define  SDIO_STA_DCRCFAIL                   (&H00000002)        ' Data block sent/received (CRC check failed)   
#define  SDIO_STA_CTIMEOUT                   (&H00000004)        ' Command response timeout                      
#define  SDIO_STA_DTIMEOUT                   (&H00000008)        ' Data timeout                                  
#define  SDIO_STA_TXUNDERR                   (&H00000010)        ' Transmit FIFO underrun error                  
#define  SDIO_STA_RXOVERR                    (&H00000020)        ' Received FIFO overrun error                   
#define  SDIO_STA_CMDREND                    (&H00000040)        ' Command response received (CRC check passed)  
#define  SDIO_STA_CMDSENT                    (&H00000080)        ' Command sent (no response required)           
#define  SDIO_STA_DATAEND                    (&H00000100)        ' Data end (data counter, SDIDCOUNT, is zero)   
#define  SDIO_STA_STBITERR                   (&H00000200)        ' Start bit not detected on all data signals in wide bus mode 
#define  SDIO_STA_DBCKEND                    (&H00000400)        ' Data block sent/received (CRC check passed)   
#define  SDIO_STA_CMDACT                     (&H00000800)        ' Command transfer in progress                  
#define  SDIO_STA_TXACT                      (&H00001000)        ' Data transmit in progress                     
#define  SDIO_STA_RXACT                      (&H00002000)        ' Data receive in progress                      
#define  SDIO_STA_TXFIFOHE                   (&H00004000)        ' Transmit FIFO Half Empty: at least 8 words can be written into the FIFO 
#define  SDIO_STA_RXFIFOHF                   (&H00008000)        ' Receive FIFO Half Full: there are at least 8 words in the FIFO 
#define  SDIO_STA_TXFIFOF                    (&H00010000)        ' Transmit FIFO full                            
#define  SDIO_STA_RXFIFOF                    (&H00020000)        ' Receive FIFO full                             
#define  SDIO_STA_TXFIFOE                    (&H00040000)        ' Transmit FIFO empty                           
#define  SDIO_STA_RXFIFOE                    (&H00080000)        ' Receive FIFO empty                            
#define  SDIO_STA_TXDAVL                     (&H00100000)        ' Data available in transmit FIFO               
#define  SDIO_STA_RXDAVL                     (&H00200000)        ' Data available in receive FIFO                
#define  SDIO_STA_SDIOIT                     (&H00400000)        ' SDIO interrupt received                       
#define  SDIO_STA_CEATAEND                   (&H00800000)        ' CE-ATA command completion signal received for CMD61 

'******************  Bit definition for SDIO_ICR register  ******************
#define  SDIO_ICR_CCRCFAILC                  (&H00000001)        ' CCRCFAIL flag clear bit 
#define  SDIO_ICR_DCRCFAILC                  (&H00000002)        ' DCRCFAIL flag clear bit 
#define  SDIO_ICR_CTIMEOUTC                  (&H00000004)        ' CTIMEOUT flag clear bit 
#define  SDIO_ICR_DTIMEOUTC                  (&H00000008)        ' DTIMEOUT flag clear bit 
#define  SDIO_ICR_TXUNDERRC                  (&H00000010)        ' TXUNDERR flag clear bit 
#define  SDIO_ICR_RXOVERRC                   (&H00000020)        ' RXOVERR flag clear bit  
#define  SDIO_ICR_CMDRENDC                   (&H00000040)        ' CMDREND flag clear bit  
#define  SDIO_ICR_CMDSENTC                   (&H00000080)        ' CMDSENT flag clear bit  
#define  SDIO_ICR_DATAENDC                   (&H00000100)        ' DATAEND flag clear bit  
#define  SDIO_ICR_STBITERRC                  (&H00000200)        ' STBITERR flag clear bit 
#define  SDIO_ICR_DBCKENDC                   (&H00000400)        ' DBCKEND flag clear bit  
#define  SDIO_ICR_SDIOITC                    (&H00400000)        ' SDIOIT flag clear bit   
#define  SDIO_ICR_CEATAENDC                  (&H00800000)        ' CEATAEND flag clear bit 

'*****************  Bit definition for SDIO_MASK register  ******************
#define  SDIO_MASK_CCRCFAILIE                (&H00000001)        ' Command CRC Fail Interrupt Enable          
#define  SDIO_MASK_DCRCFAILIE                (&H00000002)        ' Data CRC Fail Interrupt Enable             
#define  SDIO_MASK_CTIMEOUTIE                (&H00000004)        ' Command TimeOut Interrupt Enable           
#define  SDIO_MASK_DTIMEOUTIE                (&H00000008)        ' Data TimeOut Interrupt Enable              
#define  SDIO_MASK_TXUNDERRIE                (&H00000010)        ' Tx FIFO UnderRun Error Interrupt Enable    
#define  SDIO_MASK_RXOVERRIE                 (&H00000020)        ' Rx FIFO OverRun Error Interrupt Enable     
#define  SDIO_MASK_CMDRENDIE                 (&H00000040)        ' Command Response Received Interrupt Enable 
#define  SDIO_MASK_CMDSENTIE                 (&H00000080)        ' Command Sent Interrupt Enable              
#define  SDIO_MASK_DATAENDIE                 (&H00000100)        ' Data End Interrupt Enable                  
#define  SDIO_MASK_STBITERRIE                (&H00000200)        ' Start Bit Error Interrupt Enable           
#define  SDIO_MASK_DBCKENDIE                 (&H00000400)        ' Data Block End Interrupt Enable            
#define  SDIO_MASK_CMDACTIE                  (&H00000800)        ' CCommand Acting Interrupt Enable           
#define  SDIO_MASK_TXACTIE                   (&H00001000)        ' Data Transmit Acting Interrupt Enable      
#define  SDIO_MASK_RXACTIE                   (&H00002000)        ' Data receive acting interrupt enabled      
#define  SDIO_MASK_TXFIFOHEIE                (&H00004000)        ' Tx FIFO Half Empty interrupt Enable        
#define  SDIO_MASK_RXFIFOHFIE                (&H00008000)        ' Rx FIFO Half Full interrupt Enable         
#define  SDIO_MASK_TXFIFOFIE                 (&H00010000)        ' Tx FIFO Full interrupt Enable              
#define  SDIO_MASK_RXFIFOFIE                 (&H00020000)        ' Rx FIFO Full interrupt Enable              
#define  SDIO_MASK_TXFIFOEIE                 (&H00040000)        ' Tx FIFO Empty interrupt Enable             
#define  SDIO_MASK_RXFIFOEIE                 (&H00080000)        ' Rx FIFO Empty interrupt Enable             
#define  SDIO_MASK_TXDAVLIE                  (&H00100000)        ' Data available in Tx FIFO interrupt Enable 
#define  SDIO_MASK_RXDAVLIE                  (&H00200000)        ' Data available in Rx FIFO interrupt Enable 
#define  SDIO_MASK_SDIOITIE                  (&H00400000)        ' SDIO Mode Interrupt Received interrupt Enable 
#define  SDIO_MASK_CEATAENDIE                (&H00800000)        ' CE-ATA command completion signal received Interrupt Enable 

'****************  Bit definition for SDIO_FIFOCNT register  ****************
#define  SDIO_FIFOCNT_FIFOCOUNT              (&H00FFFFFF)        ' Remaining number of words to be written to or read from the FIFO 

'*****************  Bit definition for SDIO_FIFO register  ******************
#define  SDIO_FIFO_FIFODATA                  (&HFFFFFFFF)        ' Receive and transmit FIFO data 

'****************************************************************************
'                                                                            
'                        Serial Peripheral Interface                         
'                                                                            
'****************************************************************************
'******************  Bit definition for SPI_CR1 register  *******************
#define  SPI_CR1_CPHA                        (&H00000001)            ' Clock Phase      
#define  SPI_CR1_CPOL                        (&H00000002)            ' Clock Polarity   
#define  SPI_CR1_MSTR                        (&H00000004)            ' Master Selection 

#define  SPI_CR1_BR                          (&H00000038)            ' BR[2:0] bits (Baud Rate Control) 
#define  SPI_CR1_BR_0                        (&H00000008)            ' Bit 0 
#define  SPI_CR1_BR_1                        (&H00000010)            ' Bit 1 
#define  SPI_CR1_BR_2                        (&H00000020)            ' Bit 2 

#define  SPI_CR1_SPE                         (&H00000040)            ' SPI Enable                          
#define  SPI_CR1_LSBFIRST                    (&H00000080)            ' Frame Format                        
#define  SPI_CR1_SSI                         (&H00000100)            ' Internal slave select               
#define  SPI_CR1_SSM                         (&H00000200)            ' Software slave management           
#define  SPI_CR1_RXONLY                      (&H00000400)            ' Receive only                        
#define  SPI_CR1_DFF                         (&H00000800)            ' Data Frame Format                   
#define  SPI_CR1_CRCNEXT                     (&H00001000)            ' Transmit CRC next                   
#define  SPI_CR1_CRCEN                       (&H00002000)            ' Hardware CRC calculation enable     
#define  SPI_CR1_BIDIOE                      (&H00004000)            ' Output enable in bidirectional mode 
#define  SPI_CR1_BIDIMODE                    (&H00008000)            ' Bidirectional data mode enable      

'******************  Bit definition for SPI_CR2 register  *******************
#define  SPI_CR2_RXDMAEN                     (&H00000001)               ' Rx Buffer DMA Enable                 
#define  SPI_CR2_TXDMAEN                     (&H00000002)               ' Tx Buffer DMA Enable                 
#define  SPI_CR2_SSOE                        (&H00000004)               ' SS Output Enable                     
#define  SPI_CR2_FRF                         (&H00000010)               ' Frame Format                         
#define  SPI_CR2_ERRIE                       (&H00000020)               ' Error Interrupt Enable               
#define  SPI_CR2_RXNEIE                      (&H00000040)               ' RX buffer Not Empty Interrupt Enable 
#define  SPI_CR2_TXEIE                       (&H00000080)               ' Tx buffer Empty Interrupt Enable     

'*******************  Bit definition for SPI_SR register  *******************
#define  SPI_SR_RXNE                         (&H00000001)               ' Receive buffer Not Empty 
#define  SPI_SR_TXE                          (&H00000002)               ' Transmit buffer Empty    
#define  SPI_SR_CHSIDE                       (&H00000004)               ' Channel side             
#define  SPI_SR_UDR                          (&H00000008)               ' Underrun flag            
#define  SPI_SR_CRCERR                       (&H00000010)               ' CRC Error flag           
#define  SPI_SR_MODF                         (&H00000020)               ' Mode fault               
#define  SPI_SR_OVR                          (&H00000040)               ' Overrun flag             
#define  SPI_SR_BSY                          (&H00000080)               ' Busy flag                
#define  SPI_SR_FRE                          (&H00000100)               ' Frame format error flag  

'*******************  Bit definition for SPI_DR register  *******************
#define  SPI_DR_DR                           (&H0000FFFF)            ' Data Register           

'******************  Bit definition for SPI_CRCPR register  *****************
#define  SPI_CRCPR_CRCPOLY                   (&H0000FFFF)            ' CRC polynomial register 

'*****************  Bit definition for SPI_RXCRCR register  *****************
#define  SPI_RXCRCR_RXCRC                    (&H0000FFFF)            ' Rx CRC Register         

'*****************  Bit definition for SPI_TXCRCR register  *****************
#define  SPI_TXCRCR_TXCRC                    (&H0000FFFF)            ' Tx CRC Register         

'*****************  Bit definition for SPI_I2SCFGR register  ****************
#define  SPI_I2SCFGR_CHLEN                   (&H00000001)            ' Channel length (number of bits per audio channel) 

#define  SPI_I2SCFGR_DATLEN                  (&H00000006)            ' DATLEN[1:0] bits (Data length to be transferred)  
#define  SPI_I2SCFGR_DATLEN_0                (&H00000002)            ' Bit 0 
#define  SPI_I2SCFGR_DATLEN_1                (&H00000004)            ' Bit 1 

#define  SPI_I2SCFGR_CKPOL                   (&H00000008)            ' steady state clock polarity               

#define  SPI_I2SCFGR_I2SSTD                  (&H00000030)            ' I2SSTD[1:0] bits (I2S standard selection) 
#define  SPI_I2SCFGR_I2SSTD_0                (&H00000010)            ' Bit 0 
#define  SPI_I2SCFGR_I2SSTD_1                (&H00000020)            ' Bit 1 

#define  SPI_I2SCFGR_PCMSYNC                 (&H00000080)            ' PCM frame synchronization                 

#define  SPI_I2SCFGR_I2SCFG                  (&H00000300)            ' I2SCFG[1:0] bits (I2S configuration mode) 
#define  SPI_I2SCFGR_I2SCFG_0                (&H00000100)            ' Bit 0 
#define  SPI_I2SCFGR_I2SCFG_1                (&H00000200)            ' Bit 1 

#define  SPI_I2SCFGR_I2SE                    (&H00000400)            ' I2S Enable         
#define  SPI_I2SCFGR_I2SMOD                  (&H00000800)            ' I2S mode selection 

'*****************  Bit definition for SPI_I2SPR register  ******************
#define  SPI_I2SPR_I2SDIV                    (&H000000FF)            ' I2S Linear prescaler         
#define  SPI_I2SPR_ODD                       (&H00000100)            ' Odd factor for the prescaler 
#define  SPI_I2SPR_MCKOE                     (&H00000200)            ' Master Clock Output Enable   

'****************************************************************************
'                                                                            
'                                 SYSCFG                                     
'                                                                            
'****************************************************************************
'*****************  Bit definition for SYSCFG_MEMRMP register  **************  
#define SYSCFG_MEMRMP_MEM_MODE          (&H00000007) '  SYSCFG_Memory Remap Config 
#define SYSCFG_MEMRMP_MEM_MODE_0        (&H00000001)
#define SYSCFG_MEMRMP_MEM_MODE_1        (&H00000002)
#define SYSCFG_MEMRMP_MEM_MODE_2        (&H00000004)

'*****************  Bit definition for SYSCFG_PMC register  *****************
#define SYSCFG_PMC_ADC1DC2              (&H00010000) '  Refer to AN4073 on how to use this bit  

'****************  Bit definition for SYSCFG_EXTICR1 register  **************
#define SYSCFG_EXTICR1_EXTI0            (&H000F) ' EXTI 0 configuration 
#define SYSCFG_EXTICR1_EXTI1            (&H00F0) ' EXTI 1 configuration 
#define SYSCFG_EXTICR1_EXTI2            (&H0F00) ' EXTI 2 configuration 
#define SYSCFG_EXTICR1_EXTI3            (&HF000) ' EXTI 3 configuration 

'   EXTI0 configuration  
#define SYSCFG_EXTICR1_EXTI0_PA         (&H0000) ' PA[0] pin 
#define SYSCFG_EXTICR1_EXTI0_PB         (&H0001) ' PB[0] pin 
#define SYSCFG_EXTICR1_EXTI0_PC         (&H0002) ' PC[0] pin 
#define SYSCFG_EXTICR1_EXTI0_PD         (&H0003) ' PD[0] pin 
#define SYSCFG_EXTICR1_EXTI0_PE         (&H0004) ' PE[0] pin 
#define SYSCFG_EXTICR1_EXTI0_PH         (&H0007) ' PH[0] pin 

'   EXTI1 configuration  
#define SYSCFG_EXTICR1_EXTI1_PA         (&H0000) ' PA[1] pin 
#define SYSCFG_EXTICR1_EXTI1_PB         (&H0010) ' PB[1] pin 
#define SYSCFG_EXTICR1_EXTI1_PC         (&H0020) ' PC[1] pin 
#define SYSCFG_EXTICR1_EXTI1_PD         (&H0030) ' PD[1] pin 
#define SYSCFG_EXTICR1_EXTI1_PE         (&H0040) ' PE[1] pin 
#define SYSCFG_EXTICR1_EXTI1_PH         (&H0070) ' PH[1] pin 

'   EXTI2 configuration  
#define SYSCFG_EXTICR1_EXTI2_PA         (&H0000) ' PA[2] pin 
#define SYSCFG_EXTICR1_EXTI2_PB         (&H0100) ' PB[2] pin 
#define SYSCFG_EXTICR1_EXTI2_PC         (&H0200) ' PC[2] pin 
#define SYSCFG_EXTICR1_EXTI2_PD         (&H0300) ' PD[2] pin 
#define SYSCFG_EXTICR1_EXTI2_PE         (&H0400) ' PE[2] pin 
#define SYSCFG_EXTICR1_EXTI2_PH         (&H0700) ' PH[2] pin 

'   EXTI3 configuration  
#define SYSCFG_EXTICR1_EXTI3_PA         (&H0000) ' PA[3] pin 
#define SYSCFG_EXTICR1_EXTI3_PB         (&H1000) ' PB[3] pin 
#define SYSCFG_EXTICR1_EXTI3_PC         (&H2000) ' PC[3] pin 
#define SYSCFG_EXTICR1_EXTI3_PD         (&H3000) ' PD[3] pin 
#define SYSCFG_EXTICR1_EXTI3_PE         (&H4000) ' PE[3] pin 
#define SYSCFG_EXTICR1_EXTI3_PH         (&H7000) ' PH[3] pin 

'****************  Bit definition for SYSCFG_EXTICR2 register  **************
#define SYSCFG_EXTICR2_EXTI4            (&H000F) ' EXTI 4 configuration 
#define SYSCFG_EXTICR2_EXTI5            (&H00F0) ' EXTI 5 configuration 
#define SYSCFG_EXTICR2_EXTI6            (&H0F00) ' EXTI 6 configuration 
#define SYSCFG_EXTICR2_EXTI7            (&HF000) ' EXTI 7 configuration 
'   EXTI4 configuration  
#define SYSCFG_EXTICR2_EXTI4_PA         (&H0000) ' PA[4] pin 
#define SYSCFG_EXTICR2_EXTI4_PB         (&H0001) ' PB[4] pin 
#define SYSCFG_EXTICR2_EXTI4_PC         (&H0002) ' PC[4] pin 
#define SYSCFG_EXTICR2_EXTI4_PD         (&H0003) ' PD[4] pin 
#define SYSCFG_EXTICR2_EXTI4_PE         (&H0004) ' PE[4] pin 
#define SYSCFG_EXTICR2_EXTI4_PH         (&H0007) ' PH[4] pin 

'   EXTI5 configuration  
#define SYSCFG_EXTICR2_EXTI5_PA         (&H0000) ' PA[5] pin 
#define SYSCFG_EXTICR2_EXTI5_PB         (&H0010) ' PB[5] pin 
#define SYSCFG_EXTICR2_EXTI5_PC         (&H0020) ' PC[5] pin 
#define SYSCFG_EXTICR2_EXTI5_PD         (&H0030) ' PD[5] pin 
#define SYSCFG_EXTICR2_EXTI5_PE         (&H0040) ' PE[5] pin 
#define SYSCFG_EXTICR2_EXTI5_PH         (&H0070) ' PH[5] pin 

'   EXTI6 configuration  
#define SYSCFG_EXTICR2_EXTI6_PA         (&H0000) ' PA[6] pin 
#define SYSCFG_EXTICR2_EXTI6_PB         (&H0100) ' PB[6] pin 
#define SYSCFG_EXTICR2_EXTI6_PC         (&H0200) ' PC[6] pin 
#define SYSCFG_EXTICR2_EXTI6_PD         (&H0300) ' PD[6] pin 
#define SYSCFG_EXTICR2_EXTI6_PE         (&H0400) ' PE[6] pin 
#define SYSCFG_EXTICR2_EXTI6_PH         (&H0700) ' PH[6] pin 

'   EXTI7 configuration  
#define SYSCFG_EXTICR2_EXTI7_PA         (&H0000) ' PA[7] pin 
#define SYSCFG_EXTICR2_EXTI7_PB         (&H1000) ' PB[7] pin 
#define SYSCFG_EXTICR2_EXTI7_PC         (&H2000) ' PC[7] pin 
#define SYSCFG_EXTICR2_EXTI7_PD         (&H3000) ' PD[7] pin 
#define SYSCFG_EXTICR2_EXTI7_PE         (&H4000) ' PE[7] pin 
#define SYSCFG_EXTICR2_EXTI7_PH         (&H7000) ' PH[7] pin 


'****************  Bit definition for SYSCFG_EXTICR3 register  **************
#define SYSCFG_EXTICR3_EXTI8            (&H000F) ' EXTI 8 configuration 
#define SYSCFG_EXTICR3_EXTI9            (&H00F0) ' EXTI 9 configuration 
#define SYSCFG_EXTICR3_EXTI10           (&H0F00) ' EXTI 10 configuration 
#define SYSCFG_EXTICR3_EXTI11           (&HF000) ' EXTI 11 configuration 
           
'   EXTI8 configuration  
#define SYSCFG_EXTICR3_EXTI8_PA         (&H0000) ' PA[8] pin 
#define SYSCFG_EXTICR3_EXTI8_PB         (&H0001) ' PB[8] pin 
#define SYSCFG_EXTICR3_EXTI8_PC         (&H0002) ' PC[8] pin 
#define SYSCFG_EXTICR3_EXTI8_PD         (&H0003) ' PD[8] pin 
#define SYSCFG_EXTICR3_EXTI8_PE         (&H0004) ' PE[8] pin 
#define SYSCFG_EXTICR3_EXTI8_PH         (&H0007) ' PH[8] pin 

'   EXTI9 configuration  
#define SYSCFG_EXTICR3_EXTI9_PA         (&H0000) ' PA[9] pin 
#define SYSCFG_EXTICR3_EXTI9_PB         (&H0010) ' PB[9] pin 
#define SYSCFG_EXTICR3_EXTI9_PC         (&H0020) ' PC[9] pin 
#define SYSCFG_EXTICR3_EXTI9_PD         (&H0030) ' PD[9] pin 
#define SYSCFG_EXTICR3_EXTI9_PE         (&H0040) ' PE[9] pin 
#define SYSCFG_EXTICR3_EXTI9_PH         (&H0070) ' PH[9] pin 

'   EXTI10 configuration  
#define SYSCFG_EXTICR3_EXTI10_PA        (&H0000) ' PA[10] pin 
#define SYSCFG_EXTICR3_EXTI10_PB        (&H0100) ' PB[10] pin 
#define SYSCFG_EXTICR3_EXTI10_PC        (&H0200) ' PC[10] pin 
#define SYSCFG_EXTICR3_EXTI10_PD        (&H0300) ' PD[10] pin 
#define SYSCFG_EXTICR3_EXTI10_PE        (&H0400) ' PE[10] pin 
#define SYSCFG_EXTICR3_EXTI10_PH        (&H0700) ' PH[10] pin 

'   EXTI11 configuration  
#define SYSCFG_EXTICR3_EXTI11_PA        (&H0000) ' PA[11] pin 
#define SYSCFG_EXTICR3_EXTI11_PB        (&H1000) ' PB[11] pin 
#define SYSCFG_EXTICR3_EXTI11_PC        (&H2000) ' PC[11] pin 
#define SYSCFG_EXTICR3_EXTI11_PD        (&H3000) ' PD[11] pin 
#define SYSCFG_EXTICR3_EXTI11_PE        (&H4000) ' PE[11] pin 
#define SYSCFG_EXTICR3_EXTI11_PH        (&H7000) ' PH[11] pin 

'****************  Bit definition for SYSCFG_EXTICR4 register  **************
#define SYSCFG_EXTICR4_EXTI12           (&H000F) ' EXTI 12 configuration 
#define SYSCFG_EXTICR4_EXTI13           (&H00F0) ' EXTI 13 configuration 
#define SYSCFG_EXTICR4_EXTI14           (&H0F00) ' EXTI 14 configuration 
#define SYSCFG_EXTICR4_EXTI15           (&HF000) ' EXTI 15 configuration 
'   EXTI12 configuration  
#define SYSCFG_EXTICR4_EXTI12_PA        (&H0000) ' PA[12] pin 
#define SYSCFG_EXTICR4_EXTI12_PB        (&H0001) ' PB[12] pin 
#define SYSCFG_EXTICR4_EXTI12_PC        (&H0002) ' PC[12] pin 
#define SYSCFG_EXTICR4_EXTI12_PD        (&H0003) ' PD[12] pin 
#define SYSCFG_EXTICR4_EXTI12_PE        (&H0004) ' PE[12] pin 
#define SYSCFG_EXTICR4_EXTI12_PH        (&H0007) ' PH[12] pin 

'   EXTI13 configuration  
#define SYSCFG_EXTICR4_EXTI13_PA        (&H0000) ' PA[13] pin 
#define SYSCFG_EXTICR4_EXTI13_PB        (&H0010) ' PB[13] pin 
#define SYSCFG_EXTICR4_EXTI13_PC        (&H0020) ' PC[13] pin 
#define SYSCFG_EXTICR4_EXTI13_PD        (&H0030) ' PD[13] pin 
#define SYSCFG_EXTICR4_EXTI13_PE        (&H0040) ' PE[13] pin 
#define SYSCFG_EXTICR4_EXTI13_PH        (&H0070) ' PH[13] pin 

'   EXTI14 configuration  
#define SYSCFG_EXTICR4_EXTI14_PA        (&H0000) ' PA[14] pin 
#define SYSCFG_EXTICR4_EXTI14_PB        (&H0100) ' PB[14] pin 
#define SYSCFG_EXTICR4_EXTI14_PC        (&H0200) ' PC[14] pin 
#define SYSCFG_EXTICR4_EXTI14_PD        (&H0300) ' PD[14] pin 
#define SYSCFG_EXTICR4_EXTI14_PE        (&H0400) ' PE[14] pin 
#define SYSCFG_EXTICR4_EXTI14_PH        (&H0700) ' PH[14] pin 

'   EXTI15 configuration  
#define SYSCFG_EXTICR4_EXTI15_PA        (&H0000) ' PA[15] pin 
#define SYSCFG_EXTICR4_EXTI15_PB        (&H1000) ' PB[15] pin 
#define SYSCFG_EXTICR4_EXTI15_PC        (&H2000) ' PC[15] pin 
#define SYSCFG_EXTICR4_EXTI15_PD        (&H3000) ' PD[15] pin 
#define SYSCFG_EXTICR4_EXTI15_PE        (&H4000) ' PE[15] pin 
#define SYSCFG_EXTICR4_EXTI15_PH        (&H7000) ' PH[15] pin 

'*****************  Bit definition for SYSCFG_CMPCR register  ***************  
#define SYSCFG_CMPCR_CMP_PD             (&H00000001) ' Compensation cell ready flag 
#define SYSCFG_CMPCR_READY              (&H00000100) ' Compensation cell power-down 

'****************************************************************************
'                                                                            
'                                    TIM                                     
'                                                                            
'****************************************************************************
'******************  Bit definition for TIM_CR1 register  *******************
#define  TIM_CR1_CEN                         (&H0001)            ' Counter enable        
#define  TIM_CR1_UDIS                        (&H0002)            ' Update disable        
#define  TIM_CR1_URS                         (&H0004)            ' Update request source 
#define  TIM_CR1_OPM                         (&H0008)            ' One pulse mode        
#define  TIM_CR1_DIR                         (&H0010)            ' Direction             

#define  TIM_CR1_CMS                         (&H0060)            ' CMS[1:0] bits (Center-aligned mode selection) 
#define  TIM_CR1_CMS_0                       (&H0020)            ' Bit 0 
#define  TIM_CR1_CMS_1                       (&H0040)            ' Bit 1 

#define  TIM_CR1_ARPE                        (&H0080)            ' Auto-reload preload enable     

#define  TIM_CR1_CKD                         (&H0300)            ' CKD[1:0] bits (clock division) 
#define  TIM_CR1_CKD_0                       (&H0100)            ' Bit 0 
#define  TIM_CR1_CKD_1                       (&H0200)            ' Bit 1 

'******************  Bit definition for TIM_CR2 register  *******************
#define  TIM_CR2_CCPC                        (&H0001)            ' Capture/Compare Preloaded Control        
#define  TIM_CR2_CCUS                        (&H0004)            ' Capture/Compare Control Update Selection 
#define  TIM_CR2_CCDS                        (&H0008)            ' Capture/Compare DMA Selection            

#define  TIM_CR2_MMS                         (&H0070)            ' MMS[2:0] bits (Master Mode Selection) 
#define  TIM_CR2_MMS_0                       (&H0010)            ' Bit 0 
#define  TIM_CR2_MMS_1                       (&H0020)            ' Bit 1 
#define  TIM_CR2_MMS_2                       (&H0040)            ' Bit 2 

#define  TIM_CR2_TI1S                        (&H0080)            ' TI1 Selection 
#define  TIM_CR2_OIS1                        (&H0100)            ' Output Idle state 1 (OC1 output)  
#define  TIM_CR2_OIS1N                       (&H0200)            ' Output Idle state 1 (OC1N output) 
#define  TIM_CR2_OIS2                        (&H0400)            ' Output Idle state 2 (OC2 output)  
#define  TIM_CR2_OIS2N                       (&H0800)            ' Output Idle state 2 (OC2N output) 
#define  TIM_CR2_OIS3                        (&H1000)            ' Output Idle state 3 (OC3 output)  
#define  TIM_CR2_OIS3N                       (&H2000)            ' Output Idle state 3 (OC3N output) 
#define  TIM_CR2_OIS4                        (&H4000)            ' Output Idle state 4 (OC4 output)  

'******************  Bit definition for TIM_SMCR register  ******************
#define  TIM_SMCR_SMS                        (&H0007)            ' SMS[2:0] bits (Slave mode selection)    
#define  TIM_SMCR_SMS_0                      (&H0001)            ' Bit 0 
#define  TIM_SMCR_SMS_1                      (&H0002)            ' Bit 1 
#define  TIM_SMCR_SMS_2                      (&H0004)            ' Bit 2 

#define  TIM_SMCR_TS                         (&H0070)            ' TS[2:0] bits (Trigger selection)        
#define  TIM_SMCR_TS_0                       (&H0010)            ' Bit 0 
#define  TIM_SMCR_TS_1                       (&H0020)            ' Bit 1 
#define  TIM_SMCR_TS_2                       (&H0040)            ' Bit 2 

#define  TIM_SMCR_MSM                        (&H0080)            ' Master/slave mode                       

#define  TIM_SMCR_ETF                        (&H0F00)            ' ETF[3:0] bits (External trigger filter) 
#define  TIM_SMCR_ETF_0                      (&H0100)            ' Bit 0 
#define  TIM_SMCR_ETF_1                      (&H0200)            ' Bit 1 
#define  TIM_SMCR_ETF_2                      (&H0400)            ' Bit 2 
#define  TIM_SMCR_ETF_3                      (&H0800)            ' Bit 3 

#define  TIM_SMCR_ETPS                       (&H3000)            ' ETPS[1:0] bits (External trigger prescaler) 
#define  TIM_SMCR_ETPS_0                     (&H1000)            ' Bit 0 
#define  TIM_SMCR_ETPS_1                     (&H2000)            ' Bit 1 

#define  TIM_SMCR_ECE                        (&H4000)            ' External clock enable     
#define  TIM_SMCR_ETP                        (&H8000)            ' External trigger polarity 

'******************  Bit definition for TIM_DIER register  ******************
#define  TIM_DIER_UIE                        (&H0001)            ' Update interrupt enable 
#define  TIM_DIER_CC1IE                      (&H0002)            ' Capture/Compare 1 interrupt enable   
#define  TIM_DIER_CC2IE                      (&H0004)            ' Capture/Compare 2 interrupt enable   
#define  TIM_DIER_CC3IE                      (&H0008)            ' Capture/Compare 3 interrupt enable   
#define  TIM_DIER_CC4IE                      (&H0010)            ' Capture/Compare 4 interrupt enable   
#define  TIM_DIER_COMIE                      (&H0020)            ' COM interrupt enable                 
#define  TIM_DIER_TIE                        (&H0040)            ' Trigger interrupt enable             
#define  TIM_DIER_BIE                        (&H0080)            ' Break interrupt enable               
#define  TIM_DIER_UDE                        (&H0100)            ' Update DMA request enable            
#define  TIM_DIER_CC1DE                      (&H0200)            ' Capture/Compare 1 DMA request enable 
#define  TIM_DIER_CC2DE                      (&H0400)            ' Capture/Compare 2 DMA request enable 
#define  TIM_DIER_CC3DE                      (&H0800)            ' Capture/Compare 3 DMA request enable 
#define  TIM_DIER_CC4DE                      (&H1000)            ' Capture/Compare 4 DMA request enable 
#define  TIM_DIER_COMDE                      (&H2000)            ' COM DMA request enable               
#define  TIM_DIER_TDE                        (&H4000)            ' Trigger DMA request enable           

'*******************  Bit definition for TIM_SR register  *******************
#define  TIM_SR_UIF                          (&H0001)            ' Update interrupt Flag              
#define  TIM_SR_CC1IF                        (&H0002)            ' Capture/Compare 1 interrupt Flag   
#define  TIM_SR_CC2IF                        (&H0004)            ' Capture/Compare 2 interrupt Flag   
#define  TIM_SR_CC3IF                        (&H0008)            ' Capture/Compare 3 interrupt Flag   
#define  TIM_SR_CC4IF                        (&H0010)            ' Capture/Compare 4 interrupt Flag   
#define  TIM_SR_COMIF                        (&H0020)            ' COM interrupt Flag                 
#define  TIM_SR_TIF                          (&H0040)            ' Trigger interrupt Flag             
#define  TIM_SR_BIF                          (&H0080)            ' Break interrupt Flag               
#define  TIM_SR_CC1OF                        (&H0200)            ' Capture/Compare 1 Overcapture Flag 
#define  TIM_SR_CC2OF                        (&H0400)            ' Capture/Compare 2 Overcapture Flag 
#define  TIM_SR_CC3OF                        (&H0800)            ' Capture/Compare 3 Overcapture Flag 
#define  TIM_SR_CC4OF                        (&H1000)            ' Capture/Compare 4 Overcapture Flag 

'******************  Bit definition for TIM_EGR register  *******************
#define  TIM_EGR_UG                          (&H01)               ' Update Generation                         
#define  TIM_EGR_CC1G                        (&H02)               ' Capture/Compare 1 Generation              
#define  TIM_EGR_CC2G                        (&H04)               ' Capture/Compare 2 Generation              
#define  TIM_EGR_CC3G                        (&H08)               ' Capture/Compare 3 Generation              
#define  TIM_EGR_CC4G                        (&H10)               ' Capture/Compare 4 Generation              
#define  TIM_EGR_COMG                        (&H20)               ' Capture/Compare Control Update Generation 
#define  TIM_EGR_TG                          (&H40)               ' Trigger Generation                        
#define  TIM_EGR_BG                          (&H80)               ' Break Generation                          

'*****************  Bit definition for TIM_CCMR1 register  ******************
#define  TIM_CCMR1_CC1S                      (&H0003)            ' CC1S[1:0] bits (Capture/Compare 1 Selection) 
#define  TIM_CCMR1_CC1S_0                    (&H0001)            ' Bit 0 
#define  TIM_CCMR1_CC1S_1                    (&H0002)            ' Bit 1 

#define  TIM_CCMR1_OC1FE                     (&H0004)            ' Output Compare 1 Fast enable                 
#define  TIM_CCMR1_OC1PE                     (&H0008)            ' Output Compare 1 Preload enable              

#define  TIM_CCMR1_OC1M                      (&H0070)            ' OC1M[2:0] bits (Output Compare 1 Mode)       
#define  TIM_CCMR1_OC1M_0                    (&H0010)            ' Bit 0 
#define  TIM_CCMR1_OC1M_1                    (&H0020)            ' Bit 1 
#define  TIM_CCMR1_OC1M_2                    (&H0040)            ' Bit 2 

#define  TIM_CCMR1_OC1CE                     (&H0080)            ' Output Compare 1Clear Enable                 

#define  TIM_CCMR1_CC2S                      (&H0300)            ' CC2S[1:0] bits (Capture/Compare 2 Selection) 
#define  TIM_CCMR1_CC2S_0                    (&H0100)            ' Bit 0 
#define  TIM_CCMR1_CC2S_1                    (&H0200)            ' Bit 1 

#define  TIM_CCMR1_OC2FE                     (&H0400)            ' Output Compare 2 Fast enable                 
#define  TIM_CCMR1_OC2PE                     (&H0800)            ' Output Compare 2 Preload enable              

#define  TIM_CCMR1_OC2M                      (&H7000)            ' OC2M[2:0] bits (Output Compare 2 Mode)       
#define  TIM_CCMR1_OC2M_0                    (&H1000)            ' Bit 0 
#define  TIM_CCMR1_OC2M_1                    (&H2000)            ' Bit 1 
#define  TIM_CCMR1_OC2M_2                    (&H4000)            ' Bit 2 

#define  TIM_CCMR1_OC2CE                     (&H8000)            ' Output Compare 2 Clear Enable 

'----------------------------------------------------------------------------

#define  TIM_CCMR1_IC1PSC                    (&H000C)            ' IC1PSC[1:0] bits (Input Capture 1 Prescaler) 
#define  TIM_CCMR1_IC1PSC_0                  (&H0004)            ' Bit 0 
#define  TIM_CCMR1_IC1PSC_1                  (&H0008)            ' Bit 1 

#define  TIM_CCMR1_IC1F                      (&H00F0)            ' IC1F[3:0] bits (Input Capture 1 Filter)      
#define  TIM_CCMR1_IC1F_0                    (&H0010)            ' Bit 0 
#define  TIM_CCMR1_IC1F_1                    (&H0020)            ' Bit 1 
#define  TIM_CCMR1_IC1F_2                    (&H0040)            ' Bit 2 
#define  TIM_CCMR1_IC1F_3                    (&H0080)            ' Bit 3 

#define  TIM_CCMR1_IC2PSC                    (&H0C00)            ' IC2PSC[1:0] bits (Input Capture 2 Prescaler)  
#define  TIM_CCMR1_IC2PSC_0                  (&H0400)            ' Bit 0 
#define  TIM_CCMR1_IC2PSC_1                  (&H0800)            ' Bit 1 

#define  TIM_CCMR1_IC2F                      (&HF000)            ' IC2F[3:0] bits (Input Capture 2 Filter)       
#define  TIM_CCMR1_IC2F_0                    (&H1000)            ' Bit 0 
#define  TIM_CCMR1_IC2F_1                    (&H2000)            ' Bit 1 
#define  TIM_CCMR1_IC2F_2                    (&H4000)            ' Bit 2 
#define  TIM_CCMR1_IC2F_3                    (&H8000)            ' Bit 3 

'*****************  Bit definition for TIM_CCMR2 register  ******************
#define  TIM_CCMR2_CC3S                      (&H0003)            ' CC3S[1:0] bits (Capture/Compare 3 Selection)  
#define  TIM_CCMR2_CC3S_0                    (&H0001)            ' Bit 0 
#define  TIM_CCMR2_CC3S_1                    (&H0002)            ' Bit 1 

#define  TIM_CCMR2_OC3FE                     (&H0004)            ' Output Compare 3 Fast enable           
#define  TIM_CCMR2_OC3PE                     (&H0008)            ' Output Compare 3 Preload enable        

#define  TIM_CCMR2_OC3M                      (&H0070)            ' OC3M[2:0] bits (Output Compare 3 Mode) 
#define  TIM_CCMR2_OC3M_0                    (&H0010)            ' Bit 0 
#define  TIM_CCMR2_OC3M_1                    (&H0020)            ' Bit 1 
#define  TIM_CCMR2_OC3M_2                    (&H0040)            ' Bit 2 

#define  TIM_CCMR2_OC3CE                     (&H0080)            ' Output Compare 3 Clear Enable 

#define  TIM_CCMR2_CC4S                      (&H0300)            ' CC4S[1:0] bits (Capture/Compare 4 Selection) 
#define  TIM_CCMR2_CC4S_0                    (&H0100)            ' Bit 0 
#define  TIM_CCMR2_CC4S_1                    (&H0200)            ' Bit 1 

#define  TIM_CCMR2_OC4FE                     (&H0400)            ' Output Compare 4 Fast enable    
#define  TIM_CCMR2_OC4PE                     (&H0800)            ' Output Compare 4 Preload enable 

#define  TIM_CCMR2_OC4M                      (&H7000)            ' OC4M[2:0] bits (Output Compare 4 Mode) 
#define  TIM_CCMR2_OC4M_0                    (&H1000)            ' Bit 0 
#define  TIM_CCMR2_OC4M_1                    (&H2000)            ' Bit 1 
#define  TIM_CCMR2_OC4M_2                    (&H4000)            ' Bit 2 

#define  TIM_CCMR2_OC4CE                     (&H8000)            ' Output Compare 4 Clear Enable 

'----------------------------------------------------------------------------

#define  TIM_CCMR2_IC3PSC                    (&H000C)            ' IC3PSC[1:0] bits (Input Capture 3 Prescaler) 
#define  TIM_CCMR2_IC3PSC_0                  (&H0004)            ' Bit 0 
#define  TIM_CCMR2_IC3PSC_1                  (&H0008)            ' Bit 1 

#define  TIM_CCMR2_IC3F                      (&H00F0)            ' IC3F[3:0] bits (Input Capture 3 Filter) 
#define  TIM_CCMR2_IC3F_0                    (&H0010)            ' Bit 0 
#define  TIM_CCMR2_IC3F_1                    (&H0020)            ' Bit 1 
#define  TIM_CCMR2_IC3F_2                    (&H0040)            ' Bit 2 
#define  TIM_CCMR2_IC3F_3                    (&H0080)            ' Bit 3 

#define  TIM_CCMR2_IC4PSC                    (&H0C00)            ' IC4PSC[1:0] bits (Input Capture 4 Prescaler) 
#define  TIM_CCMR2_IC4PSC_0                  (&H0400)            ' Bit 0 
#define  TIM_CCMR2_IC4PSC_1                  (&H0800)            ' Bit 1 

#define  TIM_CCMR2_IC4F                      (&HF000)            ' IC4F[3:0] bits (Input Capture 4 Filter) 
#define  TIM_CCMR2_IC4F_0                    (&H1000)            ' Bit 0 
#define  TIM_CCMR2_IC4F_1                    (&H2000)            ' Bit 1 
#define  TIM_CCMR2_IC4F_2                    (&H4000)            ' Bit 2 
#define  TIM_CCMR2_IC4F_3                    (&H8000)            ' Bit 3 

'******************  Bit definition for TIM_CCER register  ******************
#define  TIM_CCER_CC1E                       (&H0001)            ' Capture/Compare 1 output enable                 
#define  TIM_CCER_CC1P                       (&H0002)            ' Capture/Compare 1 output Polarity               
#define  TIM_CCER_CC1NE                      (&H0004)            ' Capture/Compare 1 Complementary output enable   
#define  TIM_CCER_CC1NP                      (&H0008)            ' Capture/Compare 1 Complementary output Polarity 
#define  TIM_CCER_CC2E                       (&H0010)            ' Capture/Compare 2 output enable                 
#define  TIM_CCER_CC2P                       (&H0020)            ' Capture/Compare 2 output Polarity               
#define  TIM_CCER_CC2NE                      (&H0040)            ' Capture/Compare 2 Complementary output enable   
#define  TIM_CCER_CC2NP                      (&H0080)            ' Capture/Compare 2 Complementary output Polarity 
#define  TIM_CCER_CC3E                       (&H0100)            ' Capture/Compare 3 output enable                 
#define  TIM_CCER_CC3P                       (&H0200)            ' Capture/Compare 3 output Polarity               
#define  TIM_CCER_CC3NE                      (&H0400)            ' Capture/Compare 3 Complementary output enable   
#define  TIM_CCER_CC3NP                      (&H0800)            ' Capture/Compare 3 Complementary output Polarity 
#define  TIM_CCER_CC4E                       (&H1000)            ' Capture/Compare 4 output enable                 
#define  TIM_CCER_CC4P                       (&H2000)            ' Capture/Compare 4 output Polarity               
#define  TIM_CCER_CC4NP                      (&H8000)            ' Capture/Compare 4 Complementary output Polarity 

'******************  Bit definition for TIM_CNT register  *******************
#define  TIM_CNT_CNT                         (&HFFFF)            ' Counter Value            

'******************  Bit definition for TIM_PSC register  *******************
#define  TIM_PSC_PSC                         (&HFFFF)            ' Prescaler Value          

'******************  Bit definition for TIM_ARR register  *******************
#define  TIM_ARR_ARR                         (&HFFFF)            ' actual auto-reload Value 

'******************  Bit definition for TIM_RCR register  *******************
#define  TIM_RCR_REP                         (&HFF)               ' Repetition Counter Value 

'******************  Bit definition for TIM_CCR1 register  ******************
#define  TIM_CCR1_CCR1                       (&HFFFF)            ' Capture/Compare 1 Value  

'******************  Bit definition for TIM_CCR2 register  ******************
#define  TIM_CCR2_CCR2                       (&HFFFF)            ' Capture/Compare 2 Value  

'******************  Bit definition for TIM_CCR3 register  ******************
#define  TIM_CCR3_CCR3                       (&HFFFF)            ' Capture/Compare 3 Value  

'******************  Bit definition for TIM_CCR4 register  ******************
#define  TIM_CCR4_CCR4                       (&HFFFF)            ' Capture/Compare 4 Value  

'******************  Bit definition for TIM_BDTR register  ******************
#define  TIM_BDTR_DTG                        (&H00FF)            ' DTG[0:7] bits (Dead-Time Generator set-up) 
#define  TIM_BDTR_DTG_0                      (&H0001)            ' Bit 0 
#define  TIM_BDTR_DTG_1                      (&H0002)            ' Bit 1 
#define  TIM_BDTR_DTG_2                      (&H0004)            ' Bit 2 
#define  TIM_BDTR_DTG_3                      (&H0008)            ' Bit 3 
#define  TIM_BDTR_DTG_4                      (&H0010)            ' Bit 4 
#define  TIM_BDTR_DTG_5                      (&H0020)            ' Bit 5 
#define  TIM_BDTR_DTG_6                      (&H0040)            ' Bit 6 
#define  TIM_BDTR_DTG_7                      (&H0080)            ' Bit 7 

#define  TIM_BDTR_LOCK                       (&H0300)            ' LOCK[1:0] bits (Lock Configuration) 
#define  TIM_BDTR_LOCK_0                     (&H0100)            ' Bit 0 
#define  TIM_BDTR_LOCK_1                     (&H0200)            ' Bit 1 

#define  TIM_BDTR_OSSI                       (&H0400)            ' Off-State Selection for Idle mode 
#define  TIM_BDTR_OSSR                       (&H0800)            ' Off-State Selection for Run mode  
#define  TIM_BDTR_BKE                        (&H1000)            ' Break enable                      
#define  TIM_BDTR_BKP                        (&H2000)            ' Break Polarity                    
#define  TIM_BDTR_AOE                        (&H4000)            ' Automatic Output enable           
#define  TIM_BDTR_MOE                        (&H8000)            ' Main Output enable                

'******************  Bit definition for TIM_DCR register  *******************
#define  TIM_DCR_DBA                         (&H001F)            ' DBA[4:0] bits (DMA Base Address) 
#define  TIM_DCR_DBA_0                       (&H0001)            ' Bit 0 
#define  TIM_DCR_DBA_1                       (&H0002)            ' Bit 1 
#define  TIM_DCR_DBA_2                       (&H0004)            ' Bit 2 
#define  TIM_DCR_DBA_3                       (&H0008)            ' Bit 3 
#define  TIM_DCR_DBA_4                       (&H0010)            ' Bit 4 

#define  TIM_DCR_DBL                         (&H1F00)            ' DBL[4:0] bits (DMA Burst Length) 
#define  TIM_DCR_DBL_0                       (&H0100)            ' Bit 0 
#define  TIM_DCR_DBL_1                       (&H0200)            ' Bit 1 
#define  TIM_DCR_DBL_2                       (&H0400)            ' Bit 2 
#define  TIM_DCR_DBL_3                       (&H0800)            ' Bit 3 
#define  TIM_DCR_DBL_4                       (&H1000)            ' Bit 4 

'******************  Bit definition for TIM_DMAR register  ******************
#define  TIM_DMAR_DMAB                       (&HFFFF)            ' DMA register for burst accesses                    

'******************  Bit definition for TIM_OR register  ********************
#define TIM_OR_TI4_RMP                       (&H00C0)            ' TI4_RMP[1:0] bits (TIM5 Input 4 remap)             
#define TIM_OR_TI4_RMP_0                     (&H0040)            ' Bit 0 
#define TIM_OR_TI4_RMP_1                     (&H0080)            ' Bit 1 
#define TIM_OR_ITR1_RMP                      (&H0C00)            ' ITR1_RMP[1:0] bits (TIM2 Internal trigger 1 remap) 
#define TIM_OR_ITR1_RMP_0                    (&H0400)            ' Bit 0 
#define TIM_OR_ITR1_RMP_1                    (&H0800)            ' Bit 1 


'****************************************************************************
'                                                                            
'         Universal Synchronous Asynchronous Receiver Transmitter            
'                                                                            
'****************************************************************************
'******************  Bit definition for USART_SR register  ******************
#define  USART_SR_PE                         (&H0001)            ' Parity Error                 
#define  USART_SR_FE                         (&H0002)            ' Framing Error                
#define  USART_SR_NE                         (&H0004)            ' Noise Error Flag             
#define  USART_SR_ORE                        (&H0008)            ' OverRun Error                
#define  USART_SR_IDLE                       (&H0010)            ' IDLE line detected           
#define  USART_SR_RXNE                       (&H0020)            ' Read Data Register Not Empty 
#define  USART_SR_TC                         (&H0040)            ' Transmission Complete        
#define  USART_SR_TXE                        (&H0080)            ' Transmit Data Register Empty 
#define  USART_SR_LBD                        (&H0100)            ' LIN Break Detection Flag     
#define  USART_SR_CTS                        (&H0200)            ' CTS Flag                     

'******************  Bit definition for USART_DR register  ******************
#define  USART_DR_DR                         (&H01FF)            ' Data value 

'*****************  Bit definition for USART_BRR register  ******************
#define  USART_BRR_DIV_Fraction              (&H000F)            ' Fraction of USARTDIV 
#define  USART_BRR_DIV_Mantissa              (&HFFF0)            ' Mantissa of USARTDIV 

'*****************  Bit definition for USART_CR1 register  ******************
#define  USART_CR1_SBK                       (&H0001)            ' Send Break                             
#define  USART_CR1_RWU                       (&H0002)            ' Receiver wakeup                        
#define  USART_CR1_RE                        (&H0004)            ' Receiver Enable                        
#define  USART_CR1_TE                        (&H0008)            ' Transmitter Enable                     
#define  USART_CR1_IDLEIE                    (&H0010)            ' IDLE Interrupt Enable                  
#define  USART_CR1_RXNEIE                    (&H0020)            ' RXNE Interrupt Enable                  
#define  USART_CR1_TCIE                      (&H0040)            ' Transmission Complete Interrupt Enable 
#define  USART_CR1_TXEIE                     (&H0080)            ' PE Interrupt Enable                    
#define  USART_CR1_PEIE                      (&H0100)            ' PE Interrupt Enable                    
#define  USART_CR1_PS                        (&H0200)            ' Parity Selection                       
#define  USART_CR1_PCE                       (&H0400)            ' Parity Control Enable                  
#define  USART_CR1_WAKE                      (&H0800)            ' Wakeup method                          
#define  USART_CR1_M                         (&H1000)            ' Word length                            
#define  USART_CR1_UE                        (&H2000)            ' USART Enable                           
#define  USART_CR1_OVER8                     (&H8000)            ' USART Oversampling by 8 enable         

'*****************  Bit definition for USART_CR2 register  ******************
#define  USART_CR2_ADD                       (&H000F)            ' Address of the USART node            
#define  USART_CR2_LBDL                      (&H0020)            ' LIN Break Detection Length           
#define  USART_CR2_LBDIE                     (&H0040)            ' LIN Break Detection Interrupt Enable 
#define  USART_CR2_LBCL                      (&H0100)            ' Last Bit Clock pulse                 
#define  USART_CR2_CPHA                      (&H0200)            ' Clock Phase                          
#define  USART_CR2_CPOL                      (&H0400)            ' Clock Polarity                       
#define  USART_CR2_CLKEN                     (&H0800)            ' Clock Enable                         

#define  USART_CR2_STOP                      (&H3000)            ' STOP[1:0] bits (STOP bits) 
#define  USART_CR2_STOP_0                    (&H1000)            ' Bit 0 
#define  USART_CR2_STOP_1                    (&H2000)            ' Bit 1 

#define  USART_CR2_LINEN                     (&H4000)            ' LIN mode enable 

'*****************  Bit definition for USART_CR3 register  ******************
#define  USART_CR3_EIE                       (&H0001)            ' Error Interrupt Enable      
#define  USART_CR3_IREN                      (&H0002)            ' IrDA mode Enable            
#define  USART_CR3_IRLP                      (&H0004)            ' IrDA Low-Power              
#define  USART_CR3_HDSEL                     (&H0008)            ' Half-Duplex Selection       
#define  USART_CR3_NACK                      (&H0010)            ' Smartcard NACK enable       
#define  USART_CR3_SCEN                      (&H0020)            ' Smartcard mode enable       
#define  USART_CR3_DMAR                      (&H0040)            ' DMA Enable Receiver         
#define  USART_CR3_DMAT                      (&H0080)            ' DMA Enable Transmitter      
#define  USART_CR3_RTSE                      (&H0100)            ' RTS Enable                  
#define  USART_CR3_CTSE                      (&H0200)            ' CTS Enable                  
#define  USART_CR3_CTSIE                     (&H0400)            ' CTS Interrupt Enable        
#define  USART_CR3_ONEBIT                    (&H0800)            ' USART One bit method enable 

'*****************  Bit definition for USART_GTPR register  *****************
#define  USART_GTPR_PSC                      (&H00FF)            ' PSC[7:0] bits (Prescaler value) 
#define  USART_GTPR_PSC_0                    (&H0001)            ' Bit 0 
#define  USART_GTPR_PSC_1                    (&H0002)            ' Bit 1 
#define  USART_GTPR_PSC_2                    (&H0004)            ' Bit 2 
#define  USART_GTPR_PSC_3                    (&H0008)            ' Bit 3 
#define  USART_GTPR_PSC_4                    (&H0010)            ' Bit 4 
#define  USART_GTPR_PSC_5                    (&H0020)            ' Bit 5 
#define  USART_GTPR_PSC_6                    (&H0040)            ' Bit 6 
#define  USART_GTPR_PSC_7                    (&H0080)            ' Bit 7 

#define  USART_GTPR_GT                       (&HFF00)            ' Guard time value 

'****************************************************************************
'                                                                            
'                            Window WATCHDOG                                 
'                                                                            
'****************************************************************************
'******************  Bit definition for WWDG_CR register  *******************
#define  WWDG_CR_T                           (&H7F)               ' T[6:0] bits (7-Bit counter (MSB to LSB)) 
#define  WWDG_CR_T0                          (&H01)               ' Bit 0 
#define  WWDG_CR_T1                          (&H02)               ' Bit 1 
#define  WWDG_CR_T2                          (&H04)               ' Bit 2 
#define  WWDG_CR_T3                          (&H08)               ' Bit 3 
#define  WWDG_CR_T4                          (&H10)               ' Bit 4 
#define  WWDG_CR_T5                          (&H20)               ' Bit 5 
#define  WWDG_CR_T6                          (&H40)               ' Bit 6 

#define  WWDG_CR_WDGA                        (&H80)               ' Activation bit 

'******************  Bit definition for WWDG_CFR register  ******************
#define  WWDG_CFR_W                          (&H007F)            ' W[6:0] bits (7-bit window value) 
#define  WWDG_CFR_W0                         (&H0001)            ' Bit 0 
#define  WWDG_CFR_W1                         (&H0002)            ' Bit 1 
#define  WWDG_CFR_W2                         (&H0004)            ' Bit 2 
#define  WWDG_CFR_W3                         (&H0008)            ' Bit 3 
#define  WWDG_CFR_W4                         (&H0010)            ' Bit 4 
#define  WWDG_CFR_W5                         (&H0020)            ' Bit 5 
#define  WWDG_CFR_W6                         (&H0040)            ' Bit 6 

#define  WWDG_CFR_WDGTB                      (&H0180)            ' WDGTB[1:0] bits (Timer Base) 
#define  WWDG_CFR_WDGTB0                     (&H0080)            ' Bit 0 
#define  WWDG_CFR_WDGTB1                     (&H0100)            ' Bit 1 

#define  WWDG_CFR_EWI                        (&H0200)            ' Early Wakeup Interrupt 

'******************  Bit definition for WWDG_SR register  *******************
#define  WWDG_SR_EWIF                        (&H01)               ' Early Wakeup Interrupt Flag 


'****************************************************************************
'                                                                            
'                                DBG                                         
'                                                                            
'****************************************************************************
'*******************  Bit definition for DBGMCU_IDCODE register  ************
#define  DBGMCU_IDCODE_DEV_ID                (&H00000FFF)
#define  DBGMCU_IDCODE_REV_ID                (&HFFFF0000)

'*******************  Bit definition for DBGMCU_CR register  ****************
#define  DBGMCU_CR_DBG_SLEEP                 (&H00000001)
#define  DBGMCU_CR_DBG_STOP                  (&H00000002)
#define  DBGMCU_CR_DBG_STANDBY               (&H00000004)
#define  DBGMCU_CR_TRACE_IOEN                (&H00000020)

#define  DBGMCU_CR_TRACE_MODE                (&H000000C0)
#define  DBGMCU_CR_TRACE_MODE_0              (&H00000040)' Bit 0 
#define  DBGMCU_CR_TRACE_MODE_1              (&H00000080)' Bit 1 

'*******************  Bit definition for DBGMCU_APB1_FZ register  ***********
#define  DBGMCU_APB1_FZ_DBG_TIM2_STOP            (&H00000001)
#define  DBGMCU_APB1_FZ_DBG_TIM3_STOP            (&H00000002)
#define  DBGMCU_APB1_FZ_DBG_TIM4_STOP            (&H00000004)
#define  DBGMCU_APB1_FZ_DBG_TIM5_STOP            (&H00000008)
#define  DBGMCU_APB1_FZ_DBG_TIM6_STOP            (&H00000010)
#define  DBGMCU_APB1_FZ_DBG_TIM7_STOP            (&H00000020)
#define  DBGMCU_APB1_FZ_DBG_TIM12_STOP           (&H00000040)
#define  DBGMCU_APB1_FZ_DBG_TIM13_STOP           (&H00000080)
#define  DBGMCU_APB1_FZ_DBG_TIM14_STOP           (&H00000100)
#define  DBGMCU_APB1_FZ_DBG_RTC_STOP             (&H00000400)
#define  DBGMCU_APB1_FZ_DBG_WWDG_STOP            (&H00000800)
#define  DBGMCU_APB1_FZ_DBG_IWDG_STOP            (&H00001000)
#define  DBGMCU_APB1_FZ_DBG_I2C1_SMBUS_TIMEOUT   (&H00200000)
#define  DBGMCU_APB1_FZ_DBG_I2C2_SMBUS_TIMEOUT   (&H00400000)
#define  DBGMCU_APB1_FZ_DBG_I2C3_SMBUS_TIMEOUT   (&H00800000)
#define  DBGMCU_APB1_FZ_DBG_CAN1_STOP            (&H02000000)
#define  DBGMCU_APB1_FZ_DBG_CAN2_STOP            (&H04000000)
' Old IWDGSTOP bit definition, maintained for legacy purpose 
#define  DBGMCU_APB1_FZ_DBG_IWDEG_STOP           DBGMCU_APB1_FZ_DBG_IWDG_STOP

'*******************  Bit definition for DBGMCU_APB2_FZ register  ***********
#define  DBGMCU_APB2_FZ_DBG_TIM1_STOP        (&H00000001)
#define  DBGMCU_APB2_FZ_DBG_TIM8_STOP        (&H00000002)
#define  DBGMCU_APB2_FZ_DBG_TIM9_STOP        (&H00010000)
#define  DBGMCU_APB2_FZ_DBG_TIM10_STOP       (&H00020000)
#define  DBGMCU_APB2_FZ_DBG_TIM11_STOP       (&H00040000)

'****************************************************************************
'                                                                            
'                                       USB_OTG			                        
'                                                                            
'****************************************************************************
'*******************  Bit definition forUSB_OTG_GOTGCTL register  *******************
#define USB_OTG_GOTGCTL_SRQSCS                  (&H00000001)            '  Session request success 
#define USB_OTG_GOTGCTL_SRQ                     (&H00000002)            '  Session request 
#define USB_OTG_GOTGCTL_HNGSCS                  (&H00000100)            '  Host negotiation success 
#define USB_OTG_GOTGCTL_HNPRQ                   (&H00000200)            '  HNP request 
#define USB_OTG_GOTGCTL_HSHNPEN                 (&H00000400)            '  Host set HNP enable 
#define USB_OTG_GOTGCTL_DHNPEN                  (&H00000800)            '  Device HNP enabled 
#define USB_OTG_GOTGCTL_CIDSTS                  (&H00010000)            '  Connector ID status 
#define USB_OTG_GOTGCTL_DBCT                    (&H00020000)            '  Long/short debounce time 
#define USB_OTG_GOTGCTL_ASVLD                   (&H00040000)            '  A-session valid 
#define USB_OTG_GOTGCTL_BSVLD                   (&H00080000)            '  B-session valid 

'*******************  Bit definition forUSB_OTG_HCFG register  *******************

#define USB_OTG_HCFG_FSLSPCS                 (&H00000003)            '  FS/LS PHY clock select 
#define USB_OTG_HCFG_FSLSPCS_0               (&H00000001)            ' Bit 0 
#define USB_OTG_HCFG_FSLSPCS_1               (&H00000002)            ' Bit 1 
#define USB_OTG_HCFG_FSLSS                   (&H00000004)            '  FS- and LS-only support 

'*******************  Bit definition forUSB_OTG_DCFG register  *******************

#define USB_OTG_DCFG_DSPD                    (&H00000003)            '  Device speed 
#define USB_OTG_DCFG_DSPD_0                  (&H00000001)            ' Bit 0 
#define USB_OTG_DCFG_DSPD_1                  (&H00000002)            ' Bit 1 
#define USB_OTG_DCFG_NZLSOHSK                (&H00000004)            '  Nonzero-length status OUT handshake 

#define USB_OTG_DCFG_DAD                     (&H000007F0)            '  Device address 
#define USB_OTG_DCFG_DAD_0                   (&H00000010)            ' Bit 0 
#define USB_OTG_DCFG_DAD_1                   (&H00000020)            ' Bit 1 
#define USB_OTG_DCFG_DAD_2                   (&H00000040)            ' Bit 2 
#define USB_OTG_DCFG_DAD_3                   (&H00000080)            ' Bit 3 
#define USB_OTG_DCFG_DAD_4                   (&H00000100)            ' Bit 4 
#define USB_OTG_DCFG_DAD_5                   (&H00000200)            ' Bit 5 
#define USB_OTG_DCFG_DAD_6                   (&H00000400)            ' Bit 6 

#define USB_OTG_DCFG_PFIVL                   (&H00001800)            '  Periodic (micro)frame interval 
#define USB_OTG_DCFG_PFIVL_0                 (&H00000800)            ' Bit 0 
#define USB_OTG_DCFG_PFIVL_1                 (&H00001000)            ' Bit 1 

#define USB_OTG_DCFG_PERSCHIVL               (&H03000000)            '  Periodic scheduling interval 
#define USB_OTG_DCFG_PERSCHIVL_0             (&H01000000)            ' Bit 0 
#define USB_OTG_DCFG_PERSCHIVL_1             (&H02000000)            ' Bit 1 

'*******************  Bit definition forUSB_OTG_PCGCR register  *******************
#define USB_OTG_PCGCR_STPPCLK                 (&H00000001)            '  Stop PHY clock 
#define USB_OTG_PCGCR_GATEHCLK                (&H00000002)            '  Gate HCLK 
#define USB_OTG_PCGCR_PHYSUSP                 (&H00000010)            '  PHY suspended 

'*******************  Bit definition forUSB_OTG_GOTGINT register  *******************
#define USB_OTG_GOTGINT_SEDET                   (&H00000004)            '  Session end detected 
#define USB_OTG_GOTGINT_SRSSCHG                 (&H00000100)            '  Session request success status change 
#define USB_OTG_GOTGINT_HNSSCHG                 (&H00000200)            '  Host negotiation success status change 
#define USB_OTG_GOTGINT_HNGDET                  (&H00020000)            '  Host negotiation detected 
#define USB_OTG_GOTGINT_ADTOCHG                 (&H00040000)            '  A-device timeout change 
#define USB_OTG_GOTGINT_DBCDNE                  (&H00080000)            '  Debounce done 

'*******************  Bit definition forUSB_OTG_DCTL register  *******************
#define USB_OTG_DCTL_RWUSIG                  (&H00000001)            '  Remote wakeup signaling 
#define USB_OTG_DCTL_SDIS                    (&H00000002)            '  Soft disconnect 
#define USB_OTG_DCTL_GINSTS                  (&H00000004)            '  Global IN NAK status 
#define USB_OTG_DCTL_GONSTS                  (&H00000008)            '  Global OUT NAK status 

#define USB_OTG_DCTL_TCTL                    (&H00000070)            '  Test control 
#define USB_OTG_DCTL_TCTL_0                  (&H00000010)            ' Bit 0 
#define USB_OTG_DCTL_TCTL_1                  (&H00000020)            ' Bit 1 
#define USB_OTG_DCTL_TCTL_2                  (&H00000040)            ' Bit 2 
#define USB_OTG_DCTL_SGINAK                  (&H00000080)            '  Set global IN NAK 
#define USB_OTG_DCTL_CGINAK                  (&H00000100)            '  Clear global IN NAK 
#define USB_OTG_DCTL_SGONAK                  (&H00000200)            '  Set global OUT NAK 
#define USB_OTG_DCTL_CGONAK                  (&H00000400)            '  Clear global OUT NAK 
#define USB_OTG_DCTL_POPRGDNE                (&H00000800)            '  Power-on programming done 

'*******************  Bit definition forUSB_OTG_HFIR register  *******************
#define USB_OTG_HFIR_FRIVL                   (&H0000FFFF)            '  Frame interval 

'*******************  Bit definition forUSB_OTG_HFNUM register  *******************
#define USB_OTG_HFNUM_FRNUM                   (&H0000FFFF)            '  Frame number 
#define USB_OTG_HFNUM_FTREM                   (&HFFFF0000)            '  Frame time remaining 

'*******************  Bit definition forUSB_OTG_DSTS register  *******************
#define USB_OTG_DSTS_SUSPSTS                 (&H00000001)            '  Suspend status 

#define USB_OTG_DSTS_ENUMSPD                 (&H00000006)            '  Enumerated speed 
#define USB_OTG_DSTS_ENUMSPD_0               (&H00000002)            ' Bit 0 
#define USB_OTG_DSTS_ENUMSPD_1               (&H00000004)            ' Bit 1 
#define USB_OTG_DSTS_EERR                    (&H00000008)            '  Erratic error 
#define USB_OTG_DSTS_FNSOF                   (&H003FFF00)            '  Frame number of the received SOF 

'*******************  Bit definition forUSB_OTG_GAHBCFG register  *******************
#define USB_OTG_GAHBCFG_GINT                    (&H00000001)            '  Global interrupt mask 

#define USB_OTG_GAHBCFG_HBSTLEN                 (&H0000001E)            '  Burst length/type 
#define USB_OTG_GAHBCFG_HBSTLEN_0               (&H00000002)            ' Bit 0 
#define USB_OTG_GAHBCFG_HBSTLEN_1               (&H00000004)            ' Bit 1 
#define USB_OTG_GAHBCFG_HBSTLEN_2               (&H00000008)            ' Bit 2 
#define USB_OTG_GAHBCFG_HBSTLEN_3               (&H00000010)            ' Bit 3 
#define USB_OTG_GAHBCFG_DMAEN                   (&H00000020)            '  DMA enable 
#define USB_OTG_GAHBCFG_TXFELVL                 (&H00000080)            '  TxFIFO empty level 
#define USB_OTG_GAHBCFG_PTXFELVL                (&H00000100)            '  Periodic TxFIFO empty level 

'*******************  Bit definition forUSB_OTG_GUSBCFG register  *******************

#define USB_OTG_GUSBCFG_TOCAL                   (&H00000007)            '  FS timeout calibration 
#define USB_OTG_GUSBCFG_TOCAL_0                 (&H00000001)            ' Bit 0 
#define USB_OTG_GUSBCFG_TOCAL_1                 (&H00000002)            ' Bit 1 
#define USB_OTG_GUSBCFG_TOCAL_2                 (&H00000004)            ' Bit 2 
#define USB_OTG_GUSBCFG_PHYSEL                  (&H00000040)            '  USB 2.0 high-speed ULPI PHY or USB 1.1 full-speed serial transceiver select 
#define USB_OTG_GUSBCFG_SRPCAP                  (&H00000100)            '  SRP-capable 
#define USB_OTG_GUSBCFG_HNPCAP                  (&H00000200)            '  HNP-capable 

#define USB_OTG_GUSBCFG_TRDT                    (&H00003C00)            '  USB turnaround time 
#define USB_OTG_GUSBCFG_TRDT_0                  (&H00000400)            ' Bit 0 
#define USB_OTG_GUSBCFG_TRDT_1                  (&H00000800)            ' Bit 1 
#define USB_OTG_GUSBCFG_TRDT_2                  (&H00001000)            ' Bit 2 
#define USB_OTG_GUSBCFG_TRDT_3                  (&H00002000)            ' Bit 3 
#define USB_OTG_GUSBCFG_PHYLPCS                 (&H00008000)            '  PHY Low-power clock select 
#define USB_OTG_GUSBCFG_ULPIFSLS                (&H00020000)            '  ULPI FS/LS select 
#define USB_OTG_GUSBCFG_ULPIAR                  (&H00040000)            '  ULPI Auto-resume 
#define USB_OTG_GUSBCFG_ULPICSM                 (&H00080000)            '  ULPI Clock SuspendM 
#define USB_OTG_GUSBCFG_ULPIEVBUSD              (&H00100000)            '  ULPI External VBUS Drive 
#define USB_OTG_GUSBCFG_ULPIEVBUSI              (&H00200000)            '  ULPI external VBUS indicator 
#define USB_OTG_GUSBCFG_TSDPS                   (&H00400000)            '  TermSel DLine pulsing selection 
#define USB_OTG_GUSBCFG_PCCI                    (&H00800000)            '  Indicator complement 
#define USB_OTG_GUSBCFG_PTCI                    (&H01000000)            '  Indicator pass through 
#define USB_OTG_GUSBCFG_ULPIIPD                 (&H02000000)            '  ULPI interface protect disable 
#define USB_OTG_GUSBCFG_FHMOD                   (&H20000000)            '  Forced host mode 
#define USB_OTG_GUSBCFG_FDMOD                   (&H40000000)            '  Forced peripheral mode 
#define USB_OTG_GUSBCFG_CTXPKT                  (&H80000000)            '  Corrupt Tx packet 

'*******************  Bit definition forUSB_OTG_GRSTCTL register  *******************
#define USB_OTG_GRSTCTL_CSRST                   (&H00000001)            '  Core soft reset 
#define USB_OTG_GRSTCTL_HSRST                   (&H00000002)            '  HCLK soft reset 
#define USB_OTG_GRSTCTL_FCRST                   (&H00000004)            '  Host frame counter reset 
#define USB_OTG_GRSTCTL_RXFFLSH                 (&H00000010)            '  RxFIFO flush 
#define USB_OTG_GRSTCTL_TXFFLSH                 (&H00000020)            '  TxFIFO flush 

#define USB_OTG_GRSTCTL_TXFNUM                  (&H000007C0)            '  TxFIFO number 
#define USB_OTG_GRSTCTL_TXFNUM_0                (&H00000040)            ' Bit 0 
#define USB_OTG_GRSTCTL_TXFNUM_1                (&H00000080)            ' Bit 1 
#define USB_OTG_GRSTCTL_TXFNUM_2                (&H00000100)            ' Bit 2 
#define USB_OTG_GRSTCTL_TXFNUM_3                (&H00000200)            ' Bit 3 
#define USB_OTG_GRSTCTL_TXFNUM_4                (&H00000400)            ' Bit 4 
#define USB_OTG_GRSTCTL_DMAREQ                  (&H40000000)            '  DMA request signal 
#define USB_OTG_GRSTCTL_AHBIDL                  (&H80000000)            '  AHB master idle 

'*******************  Bit definition forUSB_OTG_DIEPMSK register  *******************
#define USB_OTG_DIEPMSK_XFRCM                   (&H00000001)            '  Transfer completed interrupt mask 
#define USB_OTG_DIEPMSK_EPDM                    (&H00000002)            '  Endpoint disabled interrupt mask 
#define USB_OTG_DIEPMSK_TOM                     (&H00000008)            '  Timeout condition mask (nonisochronous endpoints) 
#define USB_OTG_DIEPMSK_ITTXFEMSK               (&H00000010)            '  IN token received when TxFIFO empty mask 
#define USB_OTG_DIEPMSK_INEPNMM                 (&H00000020)            '  IN token received with EP mismatch mask 
#define USB_OTG_DIEPMSK_INEPNEM                 (&H00000040)            '  IN endpoint NAK effective mask 
#define USB_OTG_DIEPMSK_TXFURM                  (&H00000100)            '  FIFO underrun mask 
#define USB_OTG_DIEPMSK_BIM                     (&H00000200)            '  BNA interrupt mask 

'*******************  Bit definition forUSB_OTG_HPTXSTS register  *******************
#define USB_OTG_HPTXSTS_PTXFSAVL                (&H0000FFFF)            '  Periodic transmit data FIFO space available 

#define USB_OTG_HPTXSTS_PTXQSAV                 (&H00FF0000)            '  Periodic transmit request queue space available 
#define USB_OTG_HPTXSTS_PTXQSAV_0               (&H00010000)            ' Bit 0 
#define USB_OTG_HPTXSTS_PTXQSAV_1               (&H00020000)            ' Bit 1 
#define USB_OTG_HPTXSTS_PTXQSAV_2               (&H00040000)            ' Bit 2 
#define USB_OTG_HPTXSTS_PTXQSAV_3               (&H00080000)            ' Bit 3 
#define USB_OTG_HPTXSTS_PTXQSAV_4               (&H00100000)            ' Bit 4 
#define USB_OTG_HPTXSTS_PTXQSAV_5               (&H00200000)            ' Bit 5 
#define USB_OTG_HPTXSTS_PTXQSAV_6               (&H00400000)            ' Bit 6 
#define USB_OTG_HPTXSTS_PTXQSAV_7               (&H00800000)            ' Bit 7 

#define USB_OTG_HPTXSTS_PTXQTOP                 (&HFF000000)            '  Top of the periodic transmit request queue 
#define USB_OTG_HPTXSTS_PTXQTOP_0               (&H01000000)            ' Bit 0 
#define USB_OTG_HPTXSTS_PTXQTOP_1               (&H02000000)            ' Bit 1 
#define USB_OTG_HPTXSTS_PTXQTOP_2               (&H04000000)            ' Bit 2 
#define USB_OTG_HPTXSTS_PTXQTOP_3               (&H08000000)            ' Bit 3 
#define USB_OTG_HPTXSTS_PTXQTOP_4               (&H10000000)            ' Bit 4 
#define USB_OTG_HPTXSTS_PTXQTOP_5               (&H20000000)            ' Bit 5 
#define USB_OTG_HPTXSTS_PTXQTOP_6               (&H40000000)            ' Bit 6 
#define USB_OTG_HPTXSTS_PTXQTOP_7               (&H80000000)            ' Bit 7 

'*******************  Bit definition forUSB_OTG_HAINT register  *******************
#define USB_OTG_HAINT_HAINT                   (&H0000FFFF)            '  Channel interrupts 

'*******************  Bit definition forUSB_OTG_DOEPMSK register  *******************
#define USB_OTG_DOEPMSK_XFRCM                   (&H00000001)            '  Transfer completed interrupt mask 
#define USB_OTG_DOEPMSK_EPDM                    (&H00000002)            '  Endpoint disabled interrupt mask 
#define USB_OTG_DOEPMSK_STUPM                   (&H00000008)            '  SETUP phase done mask 
#define USB_OTG_DOEPMSK_OTEPDM                  (&H00000010)            '  OUT token received when endpoint disabled mask 
#define USB_OTG_DOEPMSK_B2BSTUP                 (&H00000040)            '  Back-to-back SETUP packets received mask 
#define USB_OTG_DOEPMSK_OPEM                    (&H00000100)            '  OUT packet error mask 
#define USB_OTG_DOEPMSK_BOIM                    (&H00000200)            '  BNA interrupt mask 

'*******************  Bit definition forUSB_OTG_GINTSTS register  *******************
#define USB_OTG_GINTSTS_CMOD                    (&H00000001)            '  Current mode of operation 
#define USB_OTG_GINTSTS_MMIS                    (&H00000002)            '  Mode mismatch interrupt 
#define USB_OTG_GINTSTS_OTGINT                  (&H00000004)            '  OTG interrupt 
#define USB_OTG_GINTSTS_SOF                     (&H00000008)            '  Start of frame 
#define USB_OTG_GINTSTS_RXFLVL                  (&H00000010)            '  RxFIFO nonempty 
#define USB_OTG_GINTSTS_NPTXFE                  (&H00000020)            '  Nonperiodic TxFIFO empty 
#define USB_OTG_GINTSTS_GINAKEFF                (&H00000040)            '  Global IN nonperiodic NAK effective 
#define USB_OTG_GINTSTS_BOUTNAKEFF              (&H00000080)            '  Global OUT NAK effective 
#define USB_OTG_GINTSTS_ESUSP                   (&H00000400)            '  Early suspend 
#define USB_OTG_GINTSTS_USBSUSP                 (&H00000800)            '  USB suspend 
#define USB_OTG_GINTSTS_USBRST                  (&H00001000)            '  USB reset 
#define USB_OTG_GINTSTS_ENUMDNE                 (&H00002000)            '  Enumeration done 
#define USB_OTG_GINTSTS_ISOODRP                 (&H00004000)            '  Isochronous OUT packet dropped interrupt 
#define USB_OTG_GINTSTS_EOPF                    (&H00008000)            '  End of periodic frame interrupt 
#define USB_OTG_GINTSTS_IEPINT                  (&H00040000)            '  IN endpoint interrupt 
#define USB_OTG_GINTSTS_OEPINT                  (&H00080000)            '  OUT endpoint interrupt 
#define USB_OTG_GINTSTS_IISOIXFR                (&H00100000)            '  Incomplete isochronous IN transfer 
#define USB_OTG_GINTSTS_PXFR_INCOMPISOOUT       (&H00200000)            '  Incomplete periodic transfer 
#define USB_OTG_GINTSTS_DATAFSUSP               (&H00400000)            '  Data fetch suspended 
#define USB_OTG_GINTSTS_HPRTINT                 (&H01000000)            '  Host port interrupt 
#define USB_OTG_GINTSTS_HCINT                   (&H02000000)            '  Host channels interrupt 
#define USB_OTG_GINTSTS_PTXFE                   (&H04000000)            '  Periodic TxFIFO empty 
#define USB_OTG_GINTSTS_CIDSCHG                 (&H10000000)            '  Connector ID status change 
#define USB_OTG_GINTSTS_DISCINT                 (&H20000000)            '  Disconnect detected interrupt 
#define USB_OTG_GINTSTS_SRQINT                  (&H40000000)            '  Session request/new session detected interrupt 
#define USB_OTG_GINTSTS_WKUINT                  (&H80000000)            '  Resume/remote wakeup detected interrupt 

'*******************  Bit definition forUSB_OTG_GINTMSK register  *******************
#define USB_OTG_GINTMSK_MMISM                   (&H00000002)            '  Mode mismatch interrupt mask 
#define USB_OTG_GINTMSK_OTGINT                  (&H00000004)            '  OTG interrupt mask 
#define USB_OTG_GINTMSK_SOFM                    (&H00000008)            '  Start of frame mask 
#define USB_OTG_GINTMSK_RXFLVLM                 (&H00000010)            '  Receive FIFO nonempty mask 
#define USB_OTG_GINTMSK_NPTXFEM                 (&H00000020)            '  Nonperiodic TxFIFO empty mask 
#define USB_OTG_GINTMSK_GINAKEFFM               (&H00000040)            '  Global nonperiodic IN NAK effective mask 
#define USB_OTG_GINTMSK_GONAKEFFM               (&H00000080)            '  Global OUT NAK effective mask 
#define USB_OTG_GINTMSK_ESUSPM                  (&H00000400)            '  Early suspend mask 
#define USB_OTG_GINTMSK_USBSUSPM                (&H00000800)            '  USB suspend mask 
#define USB_OTG_GINTMSK_USBRST                  (&H00001000)            '  USB reset mask 
#define USB_OTG_GINTMSK_ENUMDNEM                (&H00002000)            '  Enumeration done mask 
#define USB_OTG_GINTMSK_ISOODRPM                (&H00004000)            '  Isochronous OUT packet dropped interrupt mask 
#define USB_OTG_GINTMSK_EOPFM                   (&H00008000)            '  End of periodic frame interrupt mask 
#define USB_OTG_GINTMSK_EPMISM                  (&H00020000)            '  Endpoint mismatch interrupt mask 
#define USB_OTG_GINTMSK_IEPINT                  (&H00040000)            '  IN endpoints interrupt mask 
#define USB_OTG_GINTMSK_OEPINT                  (&H00080000)            '  OUT endpoints interrupt mask 
#define USB_OTG_GINTMSK_IISOIXFRM               (&H00100000)            '  Incomplete isochronous IN transfer mask 
#define USB_OTG_GINTMSK_PXFRM_IISOOXFRM         (&H00200000)            '  Incomplete periodic transfer mask 
#define USB_OTG_GINTMSK_FSUSPM                  (&H00400000)            '  Data fetch suspended mask 
#define USB_OTG_GINTMSK_PRTIM                   (&H01000000)            '  Host port interrupt mask 
#define USB_OTG_GINTMSK_HCIM                    (&H02000000)            '  Host channels interrupt mask 
#define USB_OTG_GINTMSK_PTXFEM                  (&H04000000)            '  Periodic TxFIFO empty mask 
#define USB_OTG_GINTMSK_CIDSCHGM                (&H10000000)            '  Connector ID status change mask 
#define USB_OTG_GINTMSK_DISCINT                 (&H20000000)            '  Disconnect detected interrupt mask 
#define USB_OTG_GINTMSK_SRQIM                   (&H40000000)            '  Session request/new session detected interrupt mask 
#define USB_OTG_GINTMSK_WUIM                    (&H80000000)            '  Resume/remote wakeup detected interrupt mask 

'*******************  Bit definition forUSB_OTG_DAINT register  *******************
#define USB_OTG_DAINT_IEPINT                  (&H0000FFFF)            '  IN endpoint interrupt bits 
#define USB_OTG_DAINT_OEPINT                  (&HFFFF0000)            '  OUT endpoint interrupt bits 

'*******************  Bit definition forUSB_OTG_HAINTMSK register  *******************
#define USB_OTG_HAINTMSK_HAINTM                  (&H0000FFFF)            '  Channel interrupt mask 

'*******************  Bit definition for USB_OTG_GRXSTSP register  *******************
#define USB_OTG_GRXSTSP_EPNUM                    (&H0000000F)            '  IN EP interrupt mask bits 
#define USB_OTG_GRXSTSP_BCNT                     (&H00007FF0)            '  OUT EP interrupt mask bits 
#define USB_OTG_GRXSTSP_DPID                     (&H00018000)            '  OUT EP interrupt mask bits 
#define USB_OTG_GRXSTSP_PKTSTS                   (&H001E0000)            '  OUT EP interrupt mask bits 

'*******************  Bit definition forUSB_OTG_DAINTMSK register  *******************
#define USB_OTG_DAINTMSK_IEPM                    (&H0000FFFF)            '  IN EP interrupt mask bits 
#define USB_OTG_DAINTMSK_OEPM                    (&HFFFF0000)            '  OUT EP interrupt mask bits 

'*******************  Bit definition for OTG register  *******************

#define USB_OTG_CHNUM                   (&H0000000F)            '  Channel number 
#define USB_OTG_CHNUM_0                 (&H00000001)            ' Bit 0 
#define USB_OTG_CHNUM_1                 (&H00000002)            ' Bit 1 
#define USB_OTG_CHNUM_2                 (&H00000004)            ' Bit 2 
#define USB_OTG_CHNUM_3                 (&H00000008)            ' Bit 3 
#define USB_OTG_BCNT                    (&H00007FF0)            '  Byte count 

#define USB_OTG_DPID                    (&H00018000)            '  Data PID 
#define USB_OTG_DPID_0                  (&H00008000)            ' Bit 0 
#define USB_OTG_DPID_1                  (&H00010000)            ' Bit 1 

#define USB_OTG_PKTSTS                  (&H001E0000)            '  Packet status 
#define USB_OTG_PKTSTS_0                (&H00020000)            ' Bit 0 
#define USB_OTG_PKTSTS_1                (&H00040000)            ' Bit 1 
#define USB_OTG_PKTSTS_2                (&H00080000)            ' Bit 2 
#define USB_OTG_PKTSTS_3                (&H00100000)            ' Bit 3 

#define USB_OTG_EPNUM                   (&H0000000F)            '  Endpoint number 
#define USB_OTG_EPNUM_0                 (&H00000001)            ' Bit 0 
#define USB_OTG_EPNUM_1                 (&H00000002)            ' Bit 1 
#define USB_OTG_EPNUM_2                 (&H00000004)            ' Bit 2 
#define USB_OTG_EPNUM_3                 (&H00000008)            ' Bit 3 

#define USB_OTG_FRMNUM                  (&H01E00000)            '  Frame number 
#define USB_OTG_FRMNUM_0                (&H00200000)            ' Bit 0 
#define USB_OTG_FRMNUM_1                (&H00400000)            ' Bit 1 
#define USB_OTG_FRMNUM_2                (&H00800000)            ' Bit 2 
#define USB_OTG_FRMNUM_3                (&H01000000)            ' Bit 3 

'*******************  Bit definition for OTG register  *******************

#define USB_OTG_CHNUM                   (&H0000000F)            '  Channel number 
#define USB_OTG_CHNUM_0                 (&H00000001)            ' Bit 0 
#define USB_OTG_CHNUM_1                 (&H00000002)            ' Bit 1 
#define USB_OTG_CHNUM_2                 (&H00000004)            ' Bit 2 
#define USB_OTG_CHNUM_3                 (&H00000008)            ' Bit 3 
#define USB_OTG_BCNT                    (&H00007FF0)            '  Byte count 

#define USB_OTG_DPID                    (&H00018000)            '  Data PID 
#define USB_OTG_DPID_0                  (&H00008000)            ' Bit 0 
#define USB_OTG_DPID_1                  (&H00010000)            ' Bit 1 

#define USB_OTG_PKTSTS                  (&H001E0000)            '  Packet status 
#define USB_OTG_PKTSTS_0                (&H00020000)            ' Bit 0 
#define USB_OTG_PKTSTS_1                (&H00040000)            ' Bit 1 
#define USB_OTG_PKTSTS_2                (&H00080000)            ' Bit 2 
#define USB_OTG_PKTSTS_3                (&H00100000)            ' Bit 3 

#define USB_OTG_EPNUM                   (&H0000000F)            '  Endpoint number 
#define USB_OTG_EPNUM_0                 (&H00000001)            ' Bit 0 
#define USB_OTG_EPNUM_1                 (&H00000002)            ' Bit 1 
#define USB_OTG_EPNUM_2                 (&H00000004)            ' Bit 2 
#define USB_OTG_EPNUM_3                 (&H00000008)            ' Bit 3 

#define USB_OTG_FRMNUM                  (&H01E00000)            '  Frame number 
#define USB_OTG_FRMNUM_0                (&H00200000)            ' Bit 0 
#define USB_OTG_FRMNUM_1                (&H00400000)            ' Bit 1 
#define USB_OTG_FRMNUM_2                (&H00800000)            ' Bit 2 
#define USB_OTG_FRMNUM_3                (&H01000000)            ' Bit 3 

'*******************  Bit definition forUSB_OTG_GRXFSIZ register  *******************
#define USB_OTG_GRXFSIZ_RXFD                    (&H0000FFFF)            '  RxFIFO depth 

'*******************  Bit definition forUSB_OTG_DVBUSDIS register  *******************
#define USB_OTG_DVBUSDIS_VBUSDT                  (&H0000FFFF)            '  Device VBUS discharge time 

'*******************  Bit definition for OTG register  *******************
#define USB_OTG_NPTXFSA                 (&H0000FFFF)            '  Nonperiodic transmit RAM start address 
#define USB_OTG_NPTXFD                  (&HFFFF0000)            '  Nonperiodic TxFIFO depth 
#define USB_OTG_TX0FSA                  (&H0000FFFF)            '  Endpoint 0 transmit RAM start address 
#define USB_OTG_TX0FD                   (&HFFFF0000)            '  Endpoint 0 TxFIFO depth 

'*******************  Bit definition forUSB_OTG_DVBUSPULSE register  *******************
#define USB_OTG_DVBUSPULSE_DVBUSP                  (&H00000FFF)            '  Device VBUS pulsing time 

'*******************  Bit definition forUSB_OTG_GNPTXSTS register  *******************
#define USB_OTG_GNPTXSTS_NPTXFSAV                (&H0000FFFF)            '  Nonperiodic TxFIFO space available 

#define USB_OTG_GNPTXSTS_NPTQXSAV                (&H00FF0000)            '  Nonperiodic transmit request queue space available 
#define USB_OTG_GNPTXSTS_NPTQXSAV_0              (&H00010000)            ' Bit 0 
#define USB_OTG_GNPTXSTS_NPTQXSAV_1              (&H00020000)            ' Bit 1 
#define USB_OTG_GNPTXSTS_NPTQXSAV_2              (&H00040000)            ' Bit 2 
#define USB_OTG_GNPTXSTS_NPTQXSAV_3              (&H00080000)            ' Bit 3 
#define USB_OTG_GNPTXSTS_NPTQXSAV_4              (&H00100000)            ' Bit 4 
#define USB_OTG_GNPTXSTS_NPTQXSAV_5              (&H00200000)            ' Bit 5 
#define USB_OTG_GNPTXSTS_NPTQXSAV_6              (&H00400000)            ' Bit 6 
#define USB_OTG_GNPTXSTS_NPTQXSAV_7              (&H00800000)            ' Bit 7 

#define USB_OTG_GNPTXSTS_NPTXQTOP                (&H7F000000)            '  Top of the nonperiodic transmit request queue 
#define USB_OTG_GNPTXSTS_NPTXQTOP_0              (&H01000000)            ' Bit 0 
#define USB_OTG_GNPTXSTS_NPTXQTOP_1              (&H02000000)            ' Bit 1 
#define USB_OTG_GNPTXSTS_NPTXQTOP_2              (&H04000000)            ' Bit 2 
#define USB_OTG_GNPTXSTS_NPTXQTOP_3              (&H08000000)            ' Bit 3 
#define USB_OTG_GNPTXSTS_NPTXQTOP_4              (&H10000000)            ' Bit 4 
#define USB_OTG_GNPTXSTS_NPTXQTOP_5              (&H20000000)            ' Bit 5 
#define USB_OTG_GNPTXSTS_NPTXQTOP_6              (&H40000000)            ' Bit 6 

'*******************  Bit definition forUSB_OTG_DTHRCTL register  *******************
#define USB_OTG_DTHRCTL_NONISOTHREN             (&H00000001)            '  Nonisochronous IN endpoints threshold enable 
#define USB_OTG_DTHRCTL_ISOTHREN                (&H00000002)            '  ISO IN endpoint threshold enable 

#define USB_OTG_DTHRCTL_TXTHRLEN                (&H000007FC)            '  Transmit threshold length 
#define USB_OTG_DTHRCTL_TXTHRLEN_0              (&H00000004)            ' Bit 0 
#define USB_OTG_DTHRCTL_TXTHRLEN_1              (&H00000008)            ' Bit 1 
#define USB_OTG_DTHRCTL_TXTHRLEN_2              (&H00000010)            ' Bit 2 
#define USB_OTG_DTHRCTL_TXTHRLEN_3              (&H00000020)            ' Bit 3 
#define USB_OTG_DTHRCTL_TXTHRLEN_4              (&H00000040)            ' Bit 4 
#define USB_OTG_DTHRCTL_TXTHRLEN_5              (&H00000080)            ' Bit 5 
#define USB_OTG_DTHRCTL_TXTHRLEN_6              (&H00000100)            ' Bit 6 
#define USB_OTG_DTHRCTL_TXTHRLEN_7              (&H00000200)            ' Bit 7 
#define USB_OTG_DTHRCTL_TXTHRLEN_8              (&H00000400)            ' Bit 8 
#define USB_OTG_DTHRCTL_RXTHREN                 (&H00010000)            '  Receive threshold enable 

#define USB_OTG_DTHRCTL_RXTHRLEN                (&H03FE0000)            '  Receive threshold length 
#define USB_OTG_DTHRCTL_RXTHRLEN_0              (&H00020000)            ' Bit 0 
#define USB_OTG_DTHRCTL_RXTHRLEN_1              (&H00040000)            ' Bit 1 
#define USB_OTG_DTHRCTL_RXTHRLEN_2              (&H00080000)            ' Bit 2 
#define USB_OTG_DTHRCTL_RXTHRLEN_3              (&H00100000)            ' Bit 3 
#define USB_OTG_DTHRCTL_RXTHRLEN_4              (&H00200000)            ' Bit 4 
#define USB_OTG_DTHRCTL_RXTHRLEN_5              (&H00400000)            ' Bit 5 
#define USB_OTG_DTHRCTL_RXTHRLEN_6              (&H00800000)            ' Bit 6 
#define USB_OTG_DTHRCTL_RXTHRLEN_7              (&H01000000)            ' Bit 7 
#define USB_OTG_DTHRCTL_RXTHRLEN_8              (&H02000000)            ' Bit 8 
#define USB_OTG_DTHRCTL_ARPEN                   (&H08000000)            '  Arbiter parking enable 

'*******************  Bit definition forUSB_OTG_DIEPEMPMSK register  *******************
#define USB_OTG_DIEPEMPMSK_INEPTXFEM               (&H0000FFFF)            '  IN EP Tx FIFO empty interrupt mask bits 

'*******************  Bit definition forUSB_OTG_DEACHINT register  *******************
#define USB_OTG_DEACHINT_IEP1INT                 (&H00000002)            '  IN endpoint 1interrupt bit 
#define USB_OTG_DEACHINT_OEP1INT                 (&H00020000)            '  OUT endpoint 1 interrupt bit 

'*******************  Bit definition forUSB_OTG_GCCFG register  *******************
#define USB_OTG_GCCFG_PWRDWN                  (&H00010000)            '  Power down 
#define USB_OTG_GCCFG_I2CPADEN                (&H00020000)            '  Enable I2C bus connection for the external I2C PHY interface 
#define USB_OTG_GCCFG_VBUSASEN                (&H00040000)            '  Enable the VBUS sensing device 
#define USB_OTG_GCCFG_VBUSBSEN                (&H00080000)            '  Enable the VBUS sensing device 
#define USB_OTG_GCCFG_SOFOUTEN                (&H00100000)            '  SOF output enable 
#define USB_OTG_GCCFG_NOVBUSSENS              (&H00200000)            '  VBUS sensing disable option 

'*******************  Bit definition forUSB_OTG_DEACHINTMSK register  *******************
#define USB_OTG_DEACHINTMSK_IEP1INTM                (&H00000002)            '  IN Endpoint 1 interrupt mask bit 
#define USB_OTG_DEACHINTMSK_OEP1INTM                (&H00020000)            '  OUT Endpoint 1 interrupt mask bit 

'*******************  Bit definition forUSB_OTG_CID register  *******************
#define USB_OTG_CID_PRODUCT_ID              (&HFFFFFFFF)            '  Product ID field 

'*******************  Bit definition forUSB_OTG_DIEPEACHMSK1 register  *******************
#define USB_OTG_DIEPEACHMSK1_XFRCM                   (&H00000001)            '  Transfer completed interrupt mask 
#define USB_OTG_DIEPEACHMSK1_EPDM                    (&H00000002)            '  Endpoint disabled interrupt mask 
#define USB_OTG_DIEPEACHMSK1_TOM                     (&H00000008)            '  Timeout condition mask (nonisochronous endpoints) 
#define USB_OTG_DIEPEACHMSK1_ITTXFEMSK               (&H00000010)            '  IN token received when TxFIFO empty mask 
#define USB_OTG_DIEPEACHMSK1_INEPNMM                 (&H00000020)            '  IN token received with EP mismatch mask 
#define USB_OTG_DIEPEACHMSK1_INEPNEM                 (&H00000040)            '  IN endpoint NAK effective mask 
#define USB_OTG_DIEPEACHMSK1_TXFURM                  (&H00000100)            '  FIFO underrun mask 
#define USB_OTG_DIEPEACHMSK1_BIM                     (&H00000200)            '  BNA interrupt mask 
#define USB_OTG_DIEPEACHMSK1_NAKM                    (&H00002000)            '  NAK interrupt mask 

'*******************  Bit definition forUSB_OTG_HPRT register  *******************
#define USB_OTG_HPRT_PCSTS                   (&H00000001)            '  Port connect status 
#define USB_OTG_HPRT_PCDET                   (&H00000002)            '  Port connect detected 
#define USB_OTG_HPRT_PENA                    (&H00000004)            '  Port enable 
#define USB_OTG_HPRT_PENCHNG                 (&H00000008)            '  Port enable/disable change 
#define USB_OTG_HPRT_POCA                    (&H00000010)            '  Port overcurrent active 
#define USB_OTG_HPRT_POCCHNG                 (&H00000020)            '  Port overcurrent change 
#define USB_OTG_HPRT_PRES                    (&H00000040)            '  Port resume 
#define USB_OTG_HPRT_PSUSP                   (&H00000080)            '  Port suspend 
#define USB_OTG_HPRT_PRST                    (&H00000100)            '  Port reset 

#define USB_OTG_HPRT_PLSTS                   (&H00000C00)            '  Port line status 
#define USB_OTG_HPRT_PLSTS_0                 (&H00000400)            ' Bit 0 
#define USB_OTG_HPRT_PLSTS_1                 (&H00000800)            ' Bit 1 
#define USB_OTG_HPRT_PPWR                    (&H00001000)            '  Port power 

#define USB_OTG_HPRT_PTCTL                   (&H0001E000)            '  Port test control 
#define USB_OTG_HPRT_PTCTL_0                 (&H00002000)            ' Bit 0 
#define USB_OTG_HPRT_PTCTL_1                 (&H00004000)            ' Bit 1 
#define USB_OTG_HPRT_PTCTL_2                 (&H00008000)            ' Bit 2 
#define USB_OTG_HPRT_PTCTL_3                 (&H00010000)            ' Bit 3 

#define USB_OTG_HPRT_PSPD                    (&H00060000)            '  Port speed 
#define USB_OTG_HPRT_PSPD_0                  (&H00020000)            ' Bit 0 
#define USB_OTG_HPRT_PSPD_1                  (&H00040000)            ' Bit 1 

'*******************  Bit definition forUSB_OTG_DOEPEACHMSK1 register  *******************
#define USB_OTG_DOEPEACHMSK1_XFRCM                   (&H00000001)            '  Transfer completed interrupt mask 
#define USB_OTG_DOEPEACHMSK1_EPDM                    (&H00000002)            '  Endpoint disabled interrupt mask 
#define USB_OTG_DOEPEACHMSK1_TOM                     (&H00000008)            '  Timeout condition mask 
#define USB_OTG_DOEPEACHMSK1_ITTXFEMSK               (&H00000010)            '  IN token received when TxFIFO empty mask 
#define USB_OTG_DOEPEACHMSK1_INEPNMM                 (&H00000020)            '  IN token received with EP mismatch mask 
#define USB_OTG_DOEPEACHMSK1_INEPNEM                 (&H00000040)            '  IN endpoint NAK effective mask 
#define USB_OTG_DOEPEACHMSK1_TXFURM                  (&H00000100)            '  OUT packet error mask 
#define USB_OTG_DOEPEACHMSK1_BIM                     (&H00000200)            '  BNA interrupt mask 
#define USB_OTG_DOEPEACHMSK1_BERRM                   (&H00001000)            '  Bubble error interrupt mask 
#define USB_OTG_DOEPEACHMSK1_NAKM                    (&H00002000)            '  NAK interrupt mask 
#define USB_OTG_DOEPEACHMSK1_NYETM                   (&H00004000)            '  NYET interrupt mask 

'*******************  Bit definition forUSB_OTG_HPTXFSIZ register  *******************
#define USB_OTG_HPTXFSIZ_PTXSA                   (&H0000FFFF)            '  Host periodic TxFIFO start address 
#define USB_OTG_HPTXFSIZ_PTXFD                   (&HFFFF0000)            '  Host periodic TxFIFO depth 

'*******************  Bit definition forUSB_OTG_DIEPCTL register  *******************
#define USB_OTG_DIEPCTL_MPSIZ                   (&H000007FF)            '  Maximum packet size 
#define USB_OTG_DIEPCTL_USBAEP                  (&H00008000)            '  USB active endpoint 
#define USB_OTG_DIEPCTL_EONUM_DPID              (&H00010000)            '  Even/odd frame 
#define USB_OTG_DIEPCTL_NAKSTS                  (&H00020000)            '  NAK status 

#define USB_OTG_DIEPCTL_EPTYP                   (&H000C0000)            '  Endpoint type 
#define USB_OTG_DIEPCTL_EPTYP_0                 (&H00040000)            ' Bit 0 
#define USB_OTG_DIEPCTL_EPTYP_1                 (&H00080000)            ' Bit 1 
#define USB_OTG_DIEPCTL_STALL                   (&H00200000)            '  STALL handshake 

#define USB_OTG_DIEPCTL_TXFNUM                  (&H03C00000)            '  TxFIFO number 
#define USB_OTG_DIEPCTL_TXFNUM_0                (&H00400000)            ' Bit 0 
#define USB_OTG_DIEPCTL_TXFNUM_1                (&H00800000)            ' Bit 1 
#define USB_OTG_DIEPCTL_TXFNUM_2                (&H01000000)            ' Bit 2 
#define USB_OTG_DIEPCTL_TXFNUM_3                (&H02000000)            ' Bit 3 
#define USB_OTG_DIEPCTL_CNAK                    (&H04000000)            '  Clear NAK 
#define USB_OTG_DIEPCTL_SNAK                    (&H08000000)            '  Set NAK 
#define USB_OTG_DIEPCTL_SD0PID_SEVNFRM          (&H10000000)            '  Set DATA0 PID 
#define USB_OTG_DIEPCTL_SODDFRM                 (&H20000000)            '  Set odd frame 
#define USB_OTG_DIEPCTL_EPDIS                   (&H40000000)            '  Endpoint disable 
#define USB_OTG_DIEPCTL_EPENA                   (&H80000000)            '  Endpoint enable 

'*******************  Bit definition forUSB_OTG_HCCHAR register  *******************
#define USB_OTG_HCCHAR_MPSIZ                   (&H000007FF)            '  Maximum packet size 

#define USB_OTG_HCCHAR_EPNUM                   (&H00007800)            '  Endpoint number 
#define USB_OTG_HCCHAR_EPNUM_0                 (&H00000800)            ' Bit 0 
#define USB_OTG_HCCHAR_EPNUM_1                 (&H00001000)            ' Bit 1 
#define USB_OTG_HCCHAR_EPNUM_2                 (&H00002000)            ' Bit 2 
#define USB_OTG_HCCHAR_EPNUM_3                 (&H00004000)            ' Bit 3 
#define USB_OTG_HCCHAR_EPDIR                   (&H00008000)            '  Endpoint direction 
#define USB_OTG_HCCHAR_LSDEV                   (&H00020000)            '  Low-speed device 

#define USB_OTG_HCCHAR_EPTYP                   (&H000C0000)            '  Endpoint type 
#define USB_OTG_HCCHAR_EPTYP_0                 (&H00040000)            ' Bit 0 
#define USB_OTG_HCCHAR_EPTYP_1                 (&H00080000)            ' Bit 1 

#define USB_OTG_HCCHAR_MC                      (&H00300000)            '  Multi Count (MC) / Error Count (EC) 
#define USB_OTG_HCCHAR_MC_0                    (&H00100000)            ' Bit 0 
#define USB_OTG_HCCHAR_MC_1                    (&H00200000)            ' Bit 1 

#define USB_OTG_HCCHAR_DAD                     (&H1FC00000)            '  Device address 
#define USB_OTG_HCCHAR_DAD_0                   (&H00400000)            ' Bit 0 
#define USB_OTG_HCCHAR_DAD_1                   (&H00800000)            ' Bit 1 
#define USB_OTG_HCCHAR_DAD_2                   (&H01000000)            ' Bit 2 
#define USB_OTG_HCCHAR_DAD_3                   (&H02000000)            ' Bit 3 
#define USB_OTG_HCCHAR_DAD_4                   (&H04000000)            ' Bit 4 
#define USB_OTG_HCCHAR_DAD_5                   (&H08000000)            ' Bit 5 
#define USB_OTG_HCCHAR_DAD_6                   (&H10000000)            ' Bit 6 
#define USB_OTG_HCCHAR_ODDFRM                  (&H20000000)            '  Odd frame 
#define USB_OTG_HCCHAR_CHDIS                   (&H40000000)            '  Channel disable 
#define USB_OTG_HCCHAR_CHENA                   (&H80000000)            '  Channel enable 

'*******************  Bit definition forUSB_OTG_HCSPLT register  *******************

#define USB_OTG_HCSPLT_PRTADDR                 (&H0000007F)            '  Port address 
#define USB_OTG_HCSPLT_PRTADDR_0               (&H00000001)            ' Bit 0 
#define USB_OTG_HCSPLT_PRTADDR_1               (&H00000002)            ' Bit 1 
#define USB_OTG_HCSPLT_PRTADDR_2               (&H00000004)            ' Bit 2 
#define USB_OTG_HCSPLT_PRTADDR_3               (&H00000008)            ' Bit 3 
#define USB_OTG_HCSPLT_PRTADDR_4               (&H00000010)            ' Bit 4 
#define USB_OTG_HCSPLT_PRTADDR_5               (&H00000020)            ' Bit 5 
#define USB_OTG_HCSPLT_PRTADDR_6               (&H00000040)            ' Bit 6 

#define USB_OTG_HCSPLT_HUBADDR                 (&H00003F80)            '  Hub address 
#define USB_OTG_HCSPLT_HUBADDR_0               (&H00000080)            ' Bit 0 
#define USB_OTG_HCSPLT_HUBADDR_1               (&H00000100)            ' Bit 1 
#define USB_OTG_HCSPLT_HUBADDR_2               (&H00000200)            ' Bit 2 
#define USB_OTG_HCSPLT_HUBADDR_3               (&H00000400)            ' Bit 3 
#define USB_OTG_HCSPLT_HUBADDR_4               (&H00000800)            ' Bit 4 
#define USB_OTG_HCSPLT_HUBADDR_5               (&H00001000)            ' Bit 5 
#define USB_OTG_HCSPLT_HUBADDR_6               (&H00002000)            ' Bit 6 

#define USB_OTG_HCSPLT_XACTPOS                 (&H0000C000)            '  XACTPOS 
#define USB_OTG_HCSPLT_XACTPOS_0               (&H00004000)            ' Bit 0 
#define USB_OTG_HCSPLT_XACTPOS_1               (&H00008000)            ' Bit 1 
#define USB_OTG_HCSPLT_COMPLSPLT               (&H00010000)            '  Do complete split 
#define USB_OTG_HCSPLT_SPLITEN                 (&H80000000)            '  Split enable 

'*******************  Bit definition forUSB_OTG_HCINT register  *******************
#define USB_OTG_HCINT_XFRC                    (&H00000001)            '  Transfer completed 
#define USB_OTG_HCINT_CHH                     (&H00000002)            '  Channel halted 
#define USB_OTG_HCINT_AHBERR                  (&H00000004)            '  AHB error 
#define USB_OTG_HCINT_STALL                   (&H00000008)            '  STALL response received interrupt 
#define USB_OTG_HCINT_NAK                     (&H00000010)            '  NAK response received interrupt 
#define USB_OTG_HCINT_ACK                     (&H00000020)            '  ACK response received/transmitted interrupt 
#define USB_OTG_HCINT_NYET                    (&H00000040)            '  Response received interrupt 
#define USB_OTG_HCINT_TXERR                   (&H00000080)            '  Transaction error 
#define USB_OTG_HCINT_BBERR                   (&H00000100)            '  Babble error 
#define USB_OTG_HCINT_FRMOR                   (&H00000200)            '  Frame overrun 
#define USB_OTG_HCINT_DTERR                   (&H00000400)            '  Data toggle error 

'*******************  Bit definition forUSB_OTG_DIEPINT register  *******************
#define USB_OTG_DIEPINT_XFRC                    (&H00000001)            '  Transfer completed interrupt 
#define USB_OTG_DIEPINT_EPDISD                  (&H00000002)            '  Endpoint disabled interrupt 
#define USB_OTG_DIEPINT_TOC                     (&H00000008)            '  Timeout condition 
#define USB_OTG_DIEPINT_ITTXFE                  (&H00000010)            '  IN token received when TxFIFO is empty 
#define USB_OTG_DIEPINT_INEPNE                  (&H00000040)            '  IN endpoint NAK effective 
#define USB_OTG_DIEPINT_TXFE                    (&H00000080)            '  Transmit FIFO empty 
#define USB_OTG_DIEPINT_TXFIFOUDRN              (&H00000100)            '  Transmit Fifo Underrun 
#define USB_OTG_DIEPINT_BNA                     (&H00000200)            '  Buffer not available interrupt 
#define USB_OTG_DIEPINT_PKTDRPSTS               (&H00000800)            '  Packet dropped status 
#define USB_OTG_DIEPINT_BERR                    (&H00001000)            '  Babble error interrupt 
#define USB_OTG_DIEPINT_NAK                     (&H00002000)            '  NAK interrupt 

'*******************  Bit definition forUSB_OTG_HCINTMSK register  *******************
#define USB_OTG_HCINTMSK_XFRCM                   (&H00000001)            '  Transfer completed mask 
#define USB_OTG_HCINTMSK_CHHM                    (&H00000002)            '  Channel halted mask 
#define USB_OTG_HCINTMSK_AHBERR                  (&H00000004)            '  AHB error 
#define USB_OTG_HCINTMSK_STALLM                  (&H00000008)            '  STALL response received interrupt mask 
#define USB_OTG_HCINTMSK_NAKM                    (&H00000010)            '  NAK response received interrupt mask 
#define USB_OTG_HCINTMSK_ACKM                    (&H00000020)            '  ACK response received/transmitted interrupt mask 
#define USB_OTG_HCINTMSK_NYET                    (&H00000040)            '  response received interrupt mask 
#define USB_OTG_HCINTMSK_TXERRM                  (&H00000080)            '  Transaction error mask 
#define USB_OTG_HCINTMSK_BBERRM                  (&H00000100)            '  Babble error mask 
#define USB_OTG_HCINTMSK_FRMORM                  (&H00000200)            '  Frame overrun mask 
#define USB_OTG_HCINTMSK_DTERRM                  (&H00000400)            '  Data toggle error mask 

'*******************  Bit definition for USB_OTG_DIEPTSIZ register  *******************

#define USB_OTG_DIEPTSIZ_XFRSIZ                  (&H0007FFFF)            '  Transfer size 
#define USB_OTG_DIEPTSIZ_PKTCNT                  (&H1FF80000)            '  Packet count 
#define USB_OTG_DIEPTSIZ_MULCNT                  (&H60000000)            '  Packet count 
'*******************  Bit definition forUSB_OTG_HCTSIZ register  *******************
#define USB_OTG_HCTSIZ_XFRSIZ                    (&H0007FFFF)            '  Transfer size 
#define USB_OTG_HCTSIZ_PKTCNT                    (&H1FF80000)            '  Packet count 
#define USB_OTG_HCTSIZ_DOPING                    (&H80000000)            '  Do PING 
#define USB_OTG_HCTSIZ_DPID                      (&H60000000)            '  Data PID 
#define USB_OTG_HCTSIZ_DPID_0                    (&H20000000)            ' Bit 0 
#define USB_OTG_HCTSIZ_DPID_1                    (&H40000000)            ' Bit 1 

'*******************  Bit definition forUSB_OTG_DIEPDMA register  *******************
#define USB_OTG_DIEPDMA_DMAADDR                  (&HFFFFFFFF)            '  DMA address 

'*******************  Bit definition forUSB_OTG_HCDMA register  *******************
#define USB_OTG_HCDMA_DMAADDR                    (&HFFFFFFFF)            '  DMA address 

'*******************  Bit definition forUSB_OTG_DTXFSTS register  *******************
#define USB_OTG_DTXFSTS_INEPTFSAV                (&H0000FFFF)            '  IN endpoint TxFIFO space avail 

'*******************  Bit definition forUSB_OTG_DIEPTXF register  *******************
#define USB_OTG_DIEPTXF_INEPTXSA                 (&H0000FFFF)            '  IN endpoint FIFOx transmit RAM start address 
#define USB_OTG_DIEPTXF_INEPTXFD                 (&HFFFF0000)            '  IN endpoint TxFIFO depth 

'*******************  Bit definition forUSB_OTG_DOEPCTL register  *******************

#define USB_OTG_DOEPCTL_MPSIZ                     (&H000007FF)            '  Maximum packet size           ' Bit 1 
#define USB_OTG_DOEPCTL_USBAEP                    (&H00008000)            '  USB active endpoint 
#define USB_OTG_DOEPCTL_NAKSTS                    (&H00020000)            '  NAK status 
#define USB_OTG_DOEPCTL_SD0PID_SEVNFRM            (&H10000000)            '  Set DATA0 PID 
#define USB_OTG_DOEPCTL_SODDFRM                   (&H20000000)            '  Set odd frame 
#define USB_OTG_DOEPCTL_EPTYP                     (&H000C0000)            '  Endpoint type 
#define USB_OTG_DOEPCTL_EPTYP_0                   (&H00040000)            ' Bit 0 
#define USB_OTG_DOEPCTL_EPTYP_1                   (&H00080000)            ' Bit 1 
#define USB_OTG_DOEPCTL_SNPM                      (&H00100000)            '  Snoop mode 
#define USB_OTG_DOEPCTL_STALL                     (&H00200000)            '  STALL handshake 
#define USB_OTG_DOEPCTL_CNAK                      (&H04000000)            '  Clear NAK 
#define USB_OTG_DOEPCTL_SNAK                      (&H08000000)            '  Set NAK 
#define USB_OTG_DOEPCTL_EPDIS                     (&H40000000)            '  Endpoint disable 
#define USB_OTG_DOEPCTL_EPENA                     (&H80000000)            '  Endpoint enable 

'*******************  Bit definition forUSB_OTG_DOEPINT register  *******************
#define USB_OTG_DOEPINT_XFRC                    (&H00000001)            '  Transfer completed interrupt 
#define USB_OTG_DOEPINT_EPDISD                  (&H00000002)            '  Endpoint disabled interrupt 
#define USB_OTG_DOEPINT_STUP                    (&H00000008)            '  SETUP phase done 
#define USB_OTG_DOEPINT_OTEPDIS                 (&H00000010)            '  OUT token received when endpoint disabled 
#define USB_OTG_DOEPINT_B2BSTUP                 (&H00000040)            '  Back-to-back SETUP packets received 
#define USB_OTG_DOEPINT_NYET                    (&H00004000)            '  NYET interrupt 

'*******************  Bit definition forUSB_OTG_DOEPTSIZ register  *******************

#define USB_OTG_DOEPTSIZ_XFRSIZ                  (&H0007FFFF)            '  Transfer size 
#define USB_OTG_DOEPTSIZ_PKTCNT                  (&H1FF80000)            '  Packet count 

#define USB_OTG_DOEPTSIZ_STUPCNT                 (&H60000000)            '  SETUP packet count 
#define USB_OTG_DOEPTSIZ_STUPCNT_0               (&H20000000)            ' Bit 0 
#define USB_OTG_DOEPTSIZ_STUPCNT_1               (&H40000000)            ' Bit 1 

'*******************  Bit definition for PCGCCTL register  *******************
#define USB_OTG_PCGCCTL_STOPCLK                 (&H00000001)            '  SETUP packet count 
#define USB_OTG_PCGCCTL_GATECLK                 (&H00000002)            ' Bit 0 
#define USB_OTG_PCGCCTL_PHYSUSP                 (&H00000010)            ' Bit 1 

'***************************** USB Exported Constants ***********************
#define USB_OTG_FS_HOST_MAX_CHANNEL_NBR                8
#define USB_OTG_FS_MAX_IN_ENDPOINTS                    4    ' Including EP0 
#define USB_OTG_FS_MAX_OUT_ENDPOINTS                   4    ' Including EP0 
#define USB_OTG_FS_TOTAL_FIFO_SIZE                     1280 ' in Bytes 


'   AF 0 selection  
#define GPIO_AF_RTC_50Hz      (&H00)  ' RTC_50Hz Alternate Function mapping 
#define GPIO_AF_MCO           (&H00)  ' MCO (MCO1 and MCO2) Alternate Function mapping 
#define GPIO_AF_TAMPER        (&H00)  ' TAMPER (TAMPER_1 and TAMPER_2) Alternate Function mapping 
#define GPIO_AF_SWJ           (&H00)  ' SWJ (SWD and JTAG) Alternate Function mapping 
#define GPIO_AF_TRACE         (&H00)  ' TRACE Alternate Function mapping 

'   AF 1 selection  
#define GPIO_AF_TIM1          (&H01)  ' TIM1 Alternate Function mapping 
#define GPIO_AF_TIM2          (&H01)  ' TIM2 Alternate Function mapping 

'   AF 2 selection  
#define GPIO_AF_TIM3          (&H02)  ' TIM3 Alternate Function mapping 
#define GPIO_AF_TIM4          (&H02)  ' TIM4 Alternate Function mapping 
#define GPIO_AF_TIM5          (&H02)  ' TIM5 Alternate Function mapping 

'   AF 3 selection  
#define GPIO_AF_TIM8          (&H03)  ' TIM8 Alternate Function mapping 
#define GPIO_AF_TIM9          (&H03)  ' TIM9 Alternate Function mapping 
#define GPIO_AF_TIM10         (&H03)  ' TIM10 Alternate Function mapping 
#define GPIO_AF_TIM11         (&H03)  ' TIM11 Alternate Function mapping 

'   AF 4 selection  
#define GPIO_AF_I2C1          (&H04)  ' I2C1 Alternate Function mapping 
#define GPIO_AF_I2C2          (&H04)  ' I2C2 Alternate Function mapping 
#define GPIO_AF_I2C3          (&H04)  ' I2C3 Alternate Function mapping 

'   AF 5 selection  
#define GPIO_AF_SPI1          (&H05)  ' SPI1 Alternate Function mapping 
#define GPIO_AF_SPI2          (&H05)  ' SPI2/I2S2 Alternate Function mapping 

'   AF 6 selection  
#define GPIO_AF_SPI3          (&H06)  ' SPI3/I2S3 Alternate Function mapping 
#define GPIO_AF_SPI4          (&H06)  ' SPI4 Alternate Function mapping 
#define GPIO_AF_SPI5          (&H06)  ' SPI5 Alternate Function mapping 

'   AF 7 selection  
#define GPIO_AF_USART1        (&H07)  ' USART1 Alternate Function mapping 
#define GPIO_AF_USART2        (&H07)  ' USART2 Alternate Function mapping 
#define GPIO_AF_USART3        (&H07)  ' USART3 Alternate Function mapping 
#define GPIO_AF_I2S3ext       (&H07)  ' I2S3ext Alternate Function mapping 

'   AF 8 selection  
#define GPIO_AF_UART4         (&H08)  ' UART4 Alternate Function mapping 
#define GPIO_AF_UART5         (&H08)  ' UART5 Alternate Function mapping 
#define GPIO_AF_USART6        (&H08)  ' USART6 Alternate Function mapping 

'   AF 9 selection 
#define GPIO_AF_CAN1          (&H09)  ' CAN1 Alternate Function mapping 
#define GPIO_AF_CAN2          (&H09)  ' CAN2 Alternate Function mapping 
#define GPIO_AF_TIM12         (&H09)  ' TIM12 Alternate Function mapping 
#define GPIO_AF_TIM13         (&H09)  ' TIM13 Alternate Function mapping 
#define GPIO_AF_TIM14         (&H09)  ' TIM14 Alternate Function mapping 

'   AF 10 selection  
#define GPIO_AF_OTG_FS         (&HA)  ' OTG_FS Alternate Function mapping 
#define GPIO_AF_OTG_HS         (&HA)  ' OTG_HS Alternate Function mapping 

'   AF 11 selection  
#define GPIO_AF_ETH             (&H0B)  ' ETHERNET Alternate Function mapping 

'   AF 12 selection  
#define GPIO_AF_FSMC            (&HC)  ' FSMC Alternate Function mapping 
#define GPIO_AF_OTG_HS_FS       (&HC)  ' OTG HS configured in FS, Alternate Function mapping 
#define GPIO_AF_SDIO            (&HC)  ' SDIO Alternate Function mapping 

'   AF 13 selection  
#define GPIO_AF_DCMI          (&H0D)  ' DCMI Alternate Function mapping 

'   AF 15 selection  
#define GPIO_AF_EVENTOUT      (&H0F)  ' EVENTOUT Alternate Function mapping 

#endif
