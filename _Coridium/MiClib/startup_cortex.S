
#if defined ( __CC_ARM   ) 
	
;            AREA    RESET, DATA, READONLY
            AREA    RESET, CODE, READONLY
			
	#define _stack_end	__initial_sp
	
	IMPORT	_main_start

_vectors

	
#else 
	
// Exception Vectors

        .thumb
        .syntax unified

_vectors :
   		
#endif
	
#ifdef __CC_ARM				// without main doesn't seem to generate the initial SP in Keil -- so manually do it here
  #if defined LPC4330 || defined LPC1850
    #ifdef CORE_M0a
        DCD     0x10091ffc                  // 0  Top of Stack
    #else
        DCD     0x1001ffc0                  // 0  Top of Stack
    #endif
  #elif defined LPC4337  
        DCD     0x10007ffc                  // 0  Top of Stack
  #elif defined LPC15xx  
        DCD     0x02008ffc                  // 0  Top of Stack
  #elif defined LPC54102 || defined LPC5410x
        DCD     0x02017fdc                  // 0  Top of Stack
  #else
   #warning  NEED the real value here
        DCD     0x10007edc // 0x10001ffc                  // 0  Top of Stack
  #endif  
        DCD     _main_start	//Reset_Handler               // 1  Reset Handler
#else
        DCD     _stack_end                  // 0  Top of Stack
  #if defined LPC4337
		DCD		0x1A000000 + Reset_Handler
  #else		
        DCD     Reset_Handler               // 1  Reset Handler
  #endif
#endif
        DCD     NmiSR                       // 2  NMI Handler
        DCD     FaultISR                    // 3  Hard Fault Handler
        DCD     FaultMPU                    // 4  The MPU fault handler
        DCD     FaultBUS                    // 5  The bus fault handler
        DCD     FaultUSE                    // 6  The usage fault handler
  #if defined LPC4337
//        DCD     0xffffffff - _stack_end + 0x1A000000 + Reset_Handler + NmiSR + FaultISR + FaultMPU + FaultBUS + FaultUSE
        DCD     0xffffffff - (0x10007ffc + 0x1A000000 + 0x11b + 0x115 + 0x115 + 0x115 + 0x115 + 0x115) + 1
  #elif defined LPC54102m0
//        DCD     0xffffffff - _stack_end - Reset_Handler - NmiSR - FaultISR - FaultMPU - FaultBUS - FaultUSE  
//        DCD     ~( 0x03401fdc + 0x000040c7 + 0x000040c1 + 0x000040c1 + 0x000040c1 + 0x000040c1 + 0x000040c1 ) + 1
        DCD     ~( 0x02017FFC + 0x000040c7 + 0x000040c1 + 0x000040c1 + 0x000040c1 + 0x000040c1 + 0x000040c1 ) + 1
  #else
        DCD     0                           // 7  Reserved
  #endif
	#if	(defined LPC4330 || defined LPC1850) && (!defined __CC_ARM) 
		DCD		CopyRAMtoSPIFI				// --- use ISP to program SPIFI-- branch to here
	#else
        DCD     0                           // 8  Reserved
	#endif        
        DCD     0                           // 9  Reserved
        DCD     0                           // 10 Reserved
        DCD     IntDefaultHandler           // 11 SVCall handler
        DCD     IntDefaultHandler           // 12 Debug monitor handler
        DCD     0                           // 13 Reserved
        DCD     IntDefaultHandler           // 14 The PendSV handler
        DCD     SysTick_Handler           	// 15 The SysTick handler
	#if	(defined LPC1751) || (defined LPC1756) || (defined LPC1768)
        DCD     WDT_IRQHandler              // 16 Watchdog Timer
        DCD     TIMER0_IRQHandler           // 17 Timer0
        DCD     TIMER1_IRQHandler           // 18 Timer1
        DCD     TIMER2_IRQHandler           // 19 Timer2
        DCD     TIMER3_IRQHandler           // 20 Timer3
        DCD     UART0_IRQHandler            // 21 UART0
        DCD     UART1_IRQHandler            // 22 UART1
        DCD     UART2_IRQHandler            // 23 UART2
        DCD     UART3_IRQHandler            // 24 UART3
        DCD     PWM1_IRQHandler             // 25 PWM1
        DCD     I2C0_IRQHandler             // 26 I2C0
        DCD     I2C1_IRQHandler             // 27 I2C1
        DCD     I2C2_IRQHandler             // 28 I2C2
        DCD     SPIFI_IRQHandler            // 29 SPI
        DCD     SSP0_IRQHandler             // 30 SSP0
        DCD     SSP1_IRQHandler             // 31 SSP1
        DCD     PLL0_IRQHandler             // 32 PLL0 Lock (Main PLL)
        DCD     RTC_IRQHandler              // 33 Real Time Clock
        DCD     EINT0_IRQHandler            // 34 External Interrupt 0
        DCD     EINT1_IRQHandler            // 35 External Interrupt 1
        DCD     EINT2_IRQHandler            // 36 External Interrupt 2
        DCD     EINT3_IRQHandler            // 37 External Interrupt 3
        DCD     ADC_IRQHandler              // 38 A/D Converter
        DCD     BOD_IRQHandler              // 39 Brown-Out Detect
        DCD     USB_IRQHandler              // 40 USB
        DCD     CAN_IRQHandler              // 41 CAN
        DCD     DMA_IRQHandler              // 42 General Purpose DMA
        DCD     I2S_IRQHandler              // 43 I2S
        DCD     ENET_IRQHandler             // 44 Ethernet
        DCD     IntDefaultHandler           // 45 Repetitive Interrupt Timer
        DCD     MCPWM_IRQHandler            // 46 Motor Control PWM
        DCD     QEI_IRQHandler              // 47 Quadrature Encoder Interface
        DCD     PLL1_IRQHandler             // 48 PLL1 Lock (USB PLL)
	#elif	(defined LPC178x)
        DCD     WDT_IRQHandler              // 16 Watchdog Timer
        DCD     TIMER0_IRQHandler           // 17 Timer0
        DCD     TIMER1_IRQHandler           // 18 Timer1
        DCD     TIMER2_IRQHandler           // 19 Timer2
        DCD     TIMER3_IRQHandler           // 20 Timer3
        DCD     UART0_IRQHandler            // 21 UART0
        DCD     UART1_IRQHandler            // 22 UART1
        DCD     UART2_IRQHandler            // 23 UART2
        DCD     UART3_IRQHandler            // 24 UART3
        DCD     PWM1_IRQHandler             // 25 PWM1
        DCD     I2C0_IRQHandler             // 26 I2C0
        DCD     I2C1_IRQHandler             // 27 I2C1
        DCD     I2C2_IRQHandler             // 28 I2C2
        DCD     SPIFI_IRQHandler            // 29 
        DCD     SSP0_IRQHandler             // 30 SSP0
        DCD     SSP1_IRQHandler             // 31 SSP1
        DCD     PLL0_IRQHandler             // 32 PLL0 Lock (Main PLL)
        DCD     RTC_IRQHandler              // 33 Real Time Clock
        DCD     EINT0_IRQHandler            // 34 External Interrupt 0
        DCD     EINT1_IRQHandler            // 35 External Interrupt 1
        DCD     EINT2_IRQHandler            // 36 External Interrupt 2
        DCD     EINT3_IRQHandler            // 37 External Interrupt 3
        DCD     ADC_IRQHandler              // 38 A/D Converter
        DCD     BOD_IRQHandler              // 39 Brown-Out Detect
        DCD     USB_IRQHandler              // 40 USB
        DCD     CAN_IRQHandler              // 41 CAN
        DCD     DMA_IRQHandler              // 42 General Purpose DMA
        DCD     I2S_IRQHandler              // 43 I2S
        DCD     ENET_IRQHandler             // 44 Ethernet
        DCD     MCI_IRQHandler              // 45 SD card
        DCD     MCPWM_IRQHandler            // 46 Motor Control PWM
        DCD     QEI_IRQHandler              // 47 Quadrature Encoder Interface
        DCD     PLL1_IRQHandler             // 48 PLL1 Lock (USB PLL)
        DCD     USBActivity_IRQHandler      // 49 USB activity
        DCD     CANActivity_IRQHandler      // 50 CAN actitvity
        DCD     UART4_IRQHandler            // 51 UART4
        DCD     SSP2_IRQHandler             // 52 SSP2
	#elif	(defined LPC4074) || (defined LPC4078)
        DCD     WDT_IRQHandler              // 16  Watchdog Timer Interrupt              
        DCD     TIMER0_IRQHandler           // 17  Timer0 Interrupt                      
        DCD     TIMER1_IRQHandler           // 18  Timer1 Interrupt                      
        DCD     TIMER2_IRQHandler           // 19  Timer2 Interrupt                      
        DCD     TIMER3_IRQHandler           // 20  Timer3 Interrupt                      
        DCD     UART0_IRQHandler            // 21  UART0 Interrupt                       
        DCD     UART1_IRQHandler            // 22  UART1 Interrupt                       
        DCD     UART2_IRQHandler            // 23  UART2 Interrupt                       
        DCD     UART3_IRQHandler            // 24  UART3 Interrupt                       
        DCD     PWM1_IRQHandler             // 25  PWM1 Interrupt                        
        DCD     I2C0_IRQHandler             // 26  I2C0 Interrupt                        
        DCD     I2C1_IRQHandler             // 27  I2C1 Interrupt                        
        DCD     I2C2_IRQHandler             // 28  I2C2 Interrupt                        
        DCD     IntDefaultHandler           // 29  Reserved                              
        DCD     SSP0_IRQHandler             // 30  SSP0 Interrupt                        
        DCD     SSP1_IRQHandler             // 31  SSP1 Interrupt                        
        DCD     PLL0_IRQHandler             // 32  PLL0 Lock (Main PLL) Interrupt        
        DCD     RTC_IRQHandler              // 33  Real Time Clock Interrupt             
        DCD     EINT0_IRQHandler            // 34  External Interrupt 0 Interrupt        
        DCD     EINT1_IRQHandler            // 35  External Interrupt 1 Interrupt        
        DCD     EINT2_IRQHandler            // 36  External Interrupt 2 Interrupt        
        DCD     EINT3_IRQHandler            // 37  External Interrupt 3 Interrupt        
        DCD     ADC_IRQHandler              // 38  A/D Converter Interrupt               
        DCD     BOD_IRQHandler              // 39  Brown-Out Detect Interrupt            
        DCD     USB_IRQHandler              // 40  USB Interrupt                         
        DCD     CAN_IRQHandler              // 41  CAN Interrupt                         
        DCD     DMA_IRQHandler              // 42  General Purpose DMA Interrupt         
        DCD     I2S_IRQHandler              // 43  I2S Interrupt                         
        DCD     ENET_IRQHandler             // 44  Ethernet Interrupt                    
        DCD     MCI_IRQHandler              // 45  SD/MMC card I/F Interrupt             
        DCD     MCPWM_IRQHandler            // 46  Motor Control PWM Interrupt           
        DCD     QEI_IRQHandler              // 47  Quadrature Encoder Interface Interrupt
        DCD     PLL1_IRQHandler             // 48  PLL1 Lock (USB PLL) Interrupt         
        DCD     USBActivity_IRQHandler      // 49  USB Activity interrupt                
        DCD     CANActivity_IRQHandler      // 50  CAN Activity interrupt                
        DCD     UART4_IRQHandler            // 51  UART4 Interrupt                       
        DCD     SSP2_IRQHandler             // 52  SSP2 Interrupt                        
        DCD     LCD_IRQHandler              // 53  LCD Interrupt                         
        DCD     GPIO_IRQHandler             // 54  GPIO Interrupt                        
        DCD     PWM0_IRQHandler             // 55  PWM0                                                             */
        DCD     EEPROM_IRQHandler           // 56  EEPROM                                                           */
        DCD     CMP0_IRQHandler             // 57  CMP0                                                             */
        DCD     CMP1_IRQHandler             // 58  CMP1                                                             */
	#elif defined LPC4330 || defined LPC4337  || defined LPC1850
        DCD     DAC_IRQHandler	 		  // 16 DAC
        DCD     M0a_IRQHandler			  // 17 M0a
        DCD     DMA_IRQHandler			  // 18 DMA
        DCD     IntDefaultHandler			  // 19  e
        DCD     EEPROM_IRQHandler		//FLASH_EEPROM_IRQHandler	  // 20 FLASH
        DCD     ENET_IRQHandler			  // 21 ETH
        DCD     SDIO_IRQHandler			  // 22 SDIO
        DCD     LCD_IRQHandler			  // 23 LCD
        DCD     USB0_IRQHandler			  // 24 USB0
        DCD     USB1_IRQHandler			  // 25 USB1
        DCD     SCT_IRQHandler			  // 26 SCT
        DCD     RIT_IRQHandler			  // 27 RIT
        DCD     TIMER0_IRQHandler		      // 28 TIMER0
        DCD     TIMER1_IRQHandler		      // 29 TIMER1
        DCD     TIMER2_IRQHandler		      // 30 TIMER2
        DCD     TIMER3_IRQHandler		      // 31 TIMER3
        DCD     MCPWM_IRQHandler		      // 32 MCPW
        DCD     ADC0_IRQHandler			  // 33 ADC0
        DCD     I2C0_IRQHandler			  // 34 I2C0
        DCD     I2C1_IRQHandler			  // 35 I2C1
        DCD     SPI_IRQHandler			  // 36 SPI_
        DCD     ADC1_IRQHandler			  // 37 ADC1
        DCD     SSP0_IRQHandler			  // 38 SSP0
        DCD     SSP1_IRQHandler			  // 39 SSP1
        DCD     UART0_IRQHandler		      // 40 UART0
        DCD     UART1_IRQHandler		      // 41 UART1
        DCD     UART2_IRQHandler		      // 42 UART2
        DCD     UART3_IRQHandler		      // 43 UART3
        DCD     I2S0_IRQHandler			  // 44 I2S0
        DCD     I2S1_IRQHandler			  // 45 I2S1
        DCD     SPIFI_IRQHandler		      // 46 SPIF
        DCD     SGPIO_IRQHandler		      // 47 SGPIO
        DCD     GPIO0_IRQHandler		      // 48 GPIO0
        DCD     GPIO1_IRQHandler		      // 49 GPIO1
        DCD     GPIO2_IRQHandler		      // 50 GPIO2
        DCD     GPIO3_IRQHandler		      // 51 GPIO3
        DCD     GPIO4_IRQHandler		      // 52 GPIO4
        DCD     GPIO5_IRQHandler		      // 53 GPIO5
        DCD     GPIO6_IRQHandler		      // 54 GPIO6
        DCD     GPIO7_IRQHandler		      // 55 GPIO7
        DCD     GINT0_IRQHandler		      // 56 GINT0
        DCD     GINT1_IRQHandler		      // 57 GINT1
        DCD     EVRT_IRQHandler			  // 58 EVRT   
        DCD     CAN1_IRQHandler			  // 59 CAN1   
        DCD     IntDefaultHandler	      	  // 60           
        DCD     VADC_IRQHandler			  // 61 VADC   
        DCD     ATIMER_IRQHandler		      // 62 ATIMER
        DCD     RTC_IRQHandler			  // 63 RTC    
        DCD     IntDefaultHandler		      // 64           
        DCD     WDT_IRQHandler			  // 65 WDT    
        DCD     IntDefaultHandler			  // 66   s  
        DCD     CAN0_IRQHandler			  // 67 CAN0   
        DCD     QEI_IRQHandler			  // 68 QEI    
	#elif	(defined LPC1114)
        DCD     IntDefaultHandler           // 16 Wakeup PIO0.0 
        DCD     IntDefaultHandler           // 17 Wakeup PIO0.1 
        DCD     IntDefaultHandler           // 18 Wakeup PIO0.2 
        DCD     IntDefaultHandler           // 19 Wakeup PIO0.3 
        DCD     IntDefaultHandler           // 20 Wakeup PIO0.4 
        DCD     IntDefaultHandler           // 21 Wakeup PIO0.5 
        DCD     IntDefaultHandler           // 22 Wakeup PIO0.6 
        DCD     IntDefaultHandler           // 23 Wakeup PIO0.7 
        DCD     IntDefaultHandler           // 24 Wakeup PIO0.8 
        DCD     IntDefaultHandler           // 25 Wakeup PIO0.9 
        DCD     IntDefaultHandler           // 26 Wakeup PIO0.10
        DCD     IntDefaultHandler           // 27 Wakeup PIO0.11
        DCD     IntDefaultHandler           // 28 Wakeup PIO1.0 
        DCD     CAN_IRQHandler              // 29 CAN           
        DCD     SSP1_IRQHandler             // 30 SSP1          
        DCD     I2C0_IRQHandler             // 31 I2C           
        DCD     TIMER0_IRQHandler           // 32 Timer0        
        DCD     TIMER1_IRQHandler           // 33 Timer1        
        DCD     TIMER2_IRQHandler           // 34 Timer2        
        DCD     TIMER3_IRQHandler           // 35 Timer3        
        DCD     SSP0_IRQHandler             // 36 SSP           
        DCD     UART0_IRQHandler            // 37 UART0         
        DCD     IntDefaultHandler           // 38               
        DCD     IntDefaultHandler           // 39               
        DCD     ADC_IRQHandler              // 40 ADC           
        DCD     WDT_IRQHandler              // 41 Watchdog Timer
        DCD     BOD_IRQHandler              // 42 BrownOut      
        DCD     IntDefaultHandler           // 43               
        DCD     IntDefaultHandler           // 44 GPIO3         
        DCD     IntDefaultHandler           // 45 GPIO2         
        DCD     IntDefaultHandler           // 46 GPIO1         
        DCD     IntDefaultHandler           // 47 GPIO0         
        DCD     IntDefaultHandler           // 48 
	#elif	(defined LPC11U35) || (defined LPC11U37)
        DCD     FLEX_INT0_IRQHandler        // 16, 0   All I/O pins can be routed to below 8 interrupts.
        DCD     FLEX_INT1_IRQHandler        // 17, 1
        DCD     FLEX_INT2_IRQHandler        // 18, 2
        DCD     FLEX_INT3_IRQHandler        // 19, 3
        DCD     FLEX_INT4_IRQHandler        // 20, 4
        DCD     FLEX_INT5_IRQHandler        // 21, 5 
        DCD     FLEX_INT6_IRQHandler        // 22, 6 
        DCD     FLEX_INT7_IRQHandler        // 23, 7 
        DCD     GINT0_IRQHandler            // 24, 8   Grouped Interrupt 0                              
        DCD     GINT1_IRQHandler            // 25, 9   Grouped Interrupt 1                              
        DCD     IntDefaultHandler           // 26, 10  Reserved Interrupt                               
        DCD     IntDefaultHandler           // 27, 11
        DCD     IntDefaultHandler           // 28, 12
        DCD     IntDefaultHandler           // 29, 13
        DCD     SSP1_IRQHandler             // 30, 14  SSP1 Interrupt                                   
        DCD     I2C_IRQHandler              // 31, 15  I2C Interrupt                                    
        DCD     TIMER_16_0_IRQHandler       // 32, 16  16-bit Timer0 Interrupt                          
        DCD     TIMER_16_1_IRQHandler       // 33, 17  16-bit Timer1 Interrupt                          
        DCD     TIMER_32_0_IRQHandler       // 34, 18  32-bit Timer0 Interrupt                          
        DCD     TIMER_32_1_IRQHandler       // 35, 19  32-bit Timer1 Interrupt                          
        DCD     SSP0_IRQHandler             // 36, 20  SSP0 Interrupt                                   
        DCD     UART0_IRQHandler            // 37, 21  UART Interrupt                                   
        DCD     USB_IRQHandler              // 38, 22  USB IRQ Interrupt                                
        DCD     USB_FIQHandler              // 39, 23  USB FIQ Interrupt                                
        DCD     ADC_IRQHandler              // 40, 24  A/D Converter Interrupt                          
        DCD     WDT_IRQHandler              // 41, 25  Watchdog timer Interrupt                         
        DCD     BOD_IRQHandler              // 42, 26  Brown Out Detect(BOD) Interrupt                  
        DCD     FMC_IRQHandler              // 43, 27  Flash Memory Controller Interrupt                
        DCD     IntDefaultHandler           // 44, 28  Reserved Interrupt                               
        DCD     IntDefaultHandler           // 45, 29  Reserved Interrupt                               
        DCD     USBWakeup_IRQHandler        // 46, 30  USB wakeup Interrupt                             
        DCD     IntDefaultHandler           // 47, 31  Reserved Interrupt      
	  // vectors for getchar/putchar here  -- use these to share USB with BASIC firmware in C programs
		DCD		getchar											// ends up at 0xC0
		DCD		putchar											// 0xC4
		DCD		alt_inbit		//(int) ;						// 0xC8		
		DCD		alt_outbit		//(int pinum, int pinval) ;		// 0xCC
		DCD		alt_rddirbit	//(int pinnum) ;				// 0xD0
		DCD		alt_wrdirbit	//(int pinnum, int dirval) ;	// 0xD4
		DCD		AD				//( int );						// 0xD8
		DCD		micros			//( void ) ;                    // 0xDC
		DCD		delay_ms		//( unsigned int ms ) ;         // 0xE0
		DCD		delay_us		//( unsigned int us ) ;         // 0xE4
		
	#elif	(defined LPC11U67) || (defined LPC11U68)
        DCD     PININT0_IRQHandler        // 16, 0   All I/O pins can be routed to below 8 interrupts.
        DCD     PININT1_IRQHandler        // 17, 1
        DCD     PININT2_IRQHandler        // 18, 2
        DCD     PININT3_IRQHandler        // 19, 3
        DCD     PININT4_IRQHandler        // 20, 4
        DCD     PININT5_IRQHandler        // 21, 5 
        DCD     PININT6_IRQHandler        // 22, 6 
        DCD     PININT7_IRQHandler        // 23, 7 
        DCD     GINT0_IRQHandler            // 24, 8   Grouped Interrupt 0                              
        DCD     GINT1_IRQHandler            // 25, 9   Grouped Interrupt 1                              
        DCD     I2C1_IRQn              // 26, 10
        DCD     UART1_4_IRQn           // 27, 11
        DCD     UART2_3_IRQn           // 28, 12
        DCD     SCT0_1_IRQn            // 29, 13
        DCD     SSP1_IRQHandler             // 30, 14  SSP1 Interrupt                                   
        DCD     I2C_IRQHandler              // 31, 15  I2C Interrupt                                    
        DCD     TIMER_16_0_IRQHandler       // 32, 16  16-bit Timer0 Interrupt                          
        DCD     TIMER_16_1_IRQHandler       // 33, 17  16-bit Timer1 Interrupt                          
        DCD     TIMER_32_0_IRQHandler       // 34, 18  32-bit Timer0 Interrupt                          
        DCD     TIMER_32_1_IRQHandler       // 35, 19  32-bit Timer1 Interrupt                          
        DCD     SSP0_IRQHandler             // 36, 20  SSP0 Interrupt                                   
        DCD     UART0_IRQHandler            // 37, 21  UART Interrupt                                   
        DCD     USB_IRQHandler              // 38, 22  USB IRQ Interrupt                                
        DCD     USB_FIQHandler              // 39, 23  USB FIQ Interrupt                                
        DCD     ADC_IRQHandler              // 40, 24  A/D Converter Interrupt                          
        DCD     WDT_IRQHandler              // 41, 25  Watchdog timer Interrupt                         
        DCD     BOD_IRQHandler              // 42, 26  Brown Out Detect(BOD) Interrupt                  
        DCD     FMC_IRQHandler              // 43, 27  Flash Memory Controller Interrupt                
        DCD     DMA_IRQn             // 44, 28  Reserved Interrupt                               
        DCD     ADC_B_IRQn           // 45, 29  Reserved Interrupt                               
        DCD     USBWakeup_IRQHandler        // 46, 30  USB wakeup Interrupt                             
        DCD     IntDefaultHandler           // 47, 31  Reserved Interrupt      
	  // vectors for getchar/putchar here  -- use these to share USB with BASIC firmware in C programs
		DCD		getchar											// ends up at 0xC0
		DCD		putchar											// 0xC4
		DCD		alt_inbit		//(int) ;						// 0xC8		
		DCD		alt_outbit		//(int pinum, int pinval) ;		// 0xCC
		DCD		alt_rddirbit	//(int pinnum) ;				// 0xD0
		DCD		alt_wrdirbit	//(int pinnum, int dirval) ;	// 0xD4
		DCD		AD				//( int );						// 0xD8
		DCD		micros			//( void ) ;                    // 0xDC
		DCD		delay_ms		//( unsigned int ms ) ;         // 0xE0
		DCD		delay_us		//( unsigned int us ) ;         // 0xE4
		
	#elif (defined LPC12xx)
        DCD     IntDefaultHandler           // 16 Wakeup PIO0.0 
        DCD     IntDefaultHandler           // 17 Wakeup PIO0.1 
        DCD     IntDefaultHandler           // 18 Wakeup PIO0.2 
        DCD     IntDefaultHandler           // 19 Wakeup PIO0.3 
        DCD     IntDefaultHandler           // 20 Wakeup PIO0.4 
        DCD     IntDefaultHandler           // 21 Wakeup PIO0.5 
        DCD     IntDefaultHandler           // 22 Wakeup PIO0.6 
        DCD     IntDefaultHandler           // 23 Wakeup PIO0.7 
        DCD     IntDefaultHandler           // 24 Wakeup PIO0.8 
        DCD     IntDefaultHandler           // 25 Wakeup PIO0.9 
        DCD     IntDefaultHandler           // 26 Wakeup PIO0.10
        DCD     IntDefaultHandler           // 27 Wakeup PIO0.11
        DCD     I2C0_IRQHandler             // 28 I2C           
        DCD     TIMER0_IRQHandler           // 29 Timer0        
        DCD     TIMER1_IRQHandler           // 30 Timer1        
        DCD     TIMER2_IRQHandler           // 31 Timer2        
        DCD     TIMER3_IRQHandler           // 32 Timer3        
        DCD     SSP0_IRQHandler             // 33 SSP           
        DCD     UART0_IRQHandler			  // 34 UART0         
        DCD     UART1_IRQHandler            // 35 UART1              
        DCD     IntDefaultHandler           // 36 Comparator              
        DCD     ADC_IRQHandler              // 37 ADC           
        DCD     WDT_IRQHandler              // 38 Watchdog Timer
        DCD     BOD_IRQHandler              // 39 BrownOut      
        DCD     IntDefaultHandler           // 40 Flash              
        DCD     IntDefaultHandler           // 41 INT0         
        DCD     IntDefaultHandler           // 42 INT1         
        DCD     IntDefaultHandler           // 43 INT2         
        DCD     IntDefaultHandler           // 44 PMU/wakeup         
        DCD     IntDefaultHandler           // 45 DMA
        DCD     IntDefaultHandler           // 46 RTC
	#elif (defined LPC13xx)
        DCD     IntDefaultHandler         ; 16+ 0 Wakeup PIO0.0
        DCD     IntDefaultHandler         ; 16+ 1 Wakeup PIO0.1
        DCD     IntDefaultHandler         ; 16+ 2 Wakeup PIO0.2
        DCD     IntDefaultHandler         ; 16+ 3 Wakeup PIO0.3
        DCD     IntDefaultHandler         ; 16+ 4 Wakeup PIO0.4
        DCD     IntDefaultHandler         ; 16+ 5 Wakeup PIO0.5
        DCD     IntDefaultHandler         ; 16+ 6 Wakeup PIO0.6
        DCD     IntDefaultHandler         ; 16+ 7 Wakeup PIO0.7
        DCD     IntDefaultHandler         ; 16+ 8 Wakeup PIO0.8
        DCD     IntDefaultHandler         ; 16+ 9 Wakeup PIO0.9
        DCD     IntDefaultHandler         ; 16+10 Wakeup PIO0.10
        DCD     IntDefaultHandler         ; 16+11 Wakeup PIO0.11
        DCD     IntDefaultHandler         ; 16+12 Wakeup PIO1.0
        DCD     IntDefaultHandler         ; 16+13 Wakeup PIO1.1
        DCD     IntDefaultHandler         ; 16+14 Wakeup PIO1.2
        DCD     IntDefaultHandler         ; 16+15 Wakeup PIO1.3
        DCD     IntDefaultHandler         ; 16+16 Wakeup PIO1.4
        DCD     IntDefaultHandler         ; 16+17 Wakeup PIO1.5
        DCD     IntDefaultHandler         ; 16+18 Wakeup PIO1.6
        DCD     IntDefaultHandler         ; 16+19 Wakeup PIO1.7
        DCD     IntDefaultHandler         ; 16+20 Wakeup PIO1.8
        DCD     IntDefaultHandler         ; 16+21 Wakeup PIO1.9
        DCD     IntDefaultHandler         ; 16+22 Wakeup PIO1.10
        DCD     IntDefaultHandler         ; 16+23 Wakeup PIO1.11
        DCD     IntDefaultHandler         ; 16+24 Wakeup PIO2.0
        DCD     IntDefaultHandler         ; 16+25 Wakeup PIO2.1
        DCD     IntDefaultHandler         ; 16+26 Wakeup PIO2.2
        DCD     IntDefaultHandler         ; 16+27 Wakeup PIO2.3
        DCD     IntDefaultHandler         ; 16+28 Wakeup PIO2.4
        DCD     IntDefaultHandler         ; 16+29 Wakeup PIO2.5
        DCD     IntDefaultHandler         ; 16+30 Wakeup PIO2.6
        DCD     IntDefaultHandler         ; 16+31 Wakeup PIO2.7
        DCD     IntDefaultHandler         ; 16+32 Wakeup PIO2.8
        DCD     IntDefaultHandler         ; 16+33 Wakeup PIO2.9
        DCD     IntDefaultHandler         ; 16+34 Wakeup PIO2.10
        DCD     IntDefaultHandler         ; 16+35 Wakeup PIO2.11
        DCD     IntDefaultHandler         ; 16+36 Wakeup PIO3.0
        DCD     IntDefaultHandler         ; 16+37 Wakeup PIO3.1
        DCD     IntDefaultHandler         ; 16+38 Wakeup PIO3.2
        DCD     IntDefaultHandler         ; 16+39 Wakeup PIO3.3
        DCD     I2C0_IRQHandler           ; 16+40 I2C
        DCD     TIMER0_IRQHandler         ; 16+41 16-bit Counter-Timer 0
        DCD     TIMER1_IRQHandler         ; 16+42 16-bit Counter-Timer 1
        DCD     TIMER2_IRQHandler         ; 16+43 32-bit Counter-Timer 0
        DCD     TIMER3_IRQHandler         ; 16+44 32-bit Counter-Timer 1
        DCD     SSP0_IRQHandler           ; 16+45 SSP0
        DCD     UART0_IRQHandler		    ; 16+46 UART
        DCD     IntDefaultHandler         ; 16+47 USB IRQ
        DCD     IntDefaultHandler         ; 16+48 USB FIQ
        DCD     ADC_IRQHandler            ; 16+49 A/D Converter
        DCD     WDT_IRQHandler            ; 16+50 Watchdog Timer
        DCD     BOD_IRQHandler            ; 16+51 Brown Out Detect
        DCD     IntDefaultHandler         ; 16+52 IP2111 Flash Memory Controller
        DCD     IntDefaultHandler         ; 16+53 PIO INT3
        DCD     IntDefaultHandler         ; 16+54 PIO INT2
        DCD     IntDefaultHandler         ; 16+55 PIO INT1
        DCD     IntDefaultHandler         ; 16+56 PIO INT0
        DCD     SSP1_IRQHandler           ; 16+57 SSP1
	#elif (defined LPC802)
        DCD     SPI0_IRQHandler             // 0  16 SPI0 controller
        DCD     IntDefaultHandler           // 1  17 Reserved
        DCD     IntDefaultHandler           // 2  18 Reserved                       
        DCD     UART0_IRQHandler            // 3  19 UART0             
        DCD     UART1_IRQHandler            // 4  20 UART1            
        DCD     IntDefaultHandler           // 5  21 Reserved
        DCD     IntDefaultHandler           // 6  22 Reserved
        DCD     IntDefaultHandler           // 7  23 Reserved              
        DCD     I2C_IRQHandler              // 8  24 I2C controller                         
        DCD     IntDefaultHandler           // 9  25 Reserved                        
        DCD     MRT_IRQHandler              //10  26 Multi-Rate Timer
        DCD     CMP_IRQHandler              //11  27 Comparator
        DCD     WDT_IRQHandler              //12  28 PIO1 (011)
        DCD     BOD_IRQHandler              //13  29 Brown Out Detect                
        DCD     FLASH_IRQHandler            //14  30 Flash 
        DCD     WKT_IRQHandler              //15  31 Wakeup timer
        DCD     ADC_SEQA_IRQHandler         //16  32 ADC SEQA   
        DCD     ADC_SEQB_IRQHandler         //17  33 ADC SEQB  
        DCD     ADC_THCMP_IRQHandler        //18  34 ADC THCMP 
        DCD     ADC_OVR_IRQHandler          //19  35 ADC OVR 
        DCD     IntDefaultHandler           //20  36 Reserved 
        DCD     IntDefaultHandler           //21  37 Reserved 
        DCD     IntDefaultHandler           //22  38 Reserved 
        DCD     CT32B0_IRQHandler           //23  39 CTimer  
        DCD     PININT0_IRQHandler          //24  40 PIO INT0
        DCD     PININT1_IRQHandler          //25  41 PIO INT1
        DCD     PININT2_IRQHandler          //26  42 PIO INT2
        DCD     PININT3_IRQHandler          //27  43 PIO INT3
        DCD     PININT4_IRQHandler          //28  44 PIO INT4
        DCD     PININT5_IRQHandler          //29  45 PIO INT5
        DCD     PININT6_IRQHandler          //30  46 PIO INT6
        DCD     PININT7_IRQHandler          //31  47 PIO INT7
	#elif (defined LPC812)
        DCD     SPI0_IRQHandler             //  16 SPI0 controller
        DCD     SPI1_IRQHandler             //  17 SPI1 controller
        DCD     IntDefaultHandler           //  18 Reserved                       
        DCD     UART0_IRQHandler            //  19 UART0             
        DCD     UART1_IRQHandler            //  20 UART1            
        DCD     UART2_IRQHandler            //  21 UART2
        DCD     IntDefaultHandler           //  22 Reserved
        DCD     IntDefaultHandler           //  23 Reserved              
        DCD     I2C_IRQHandler              //  24 I2C controller                         
        DCD     SCT_IRQHandler              //  25 Smart Counter Timer                        
        DCD     MRT_IRQHandler              //  26 Multi-Rate Timer
        DCD     CMP_IRQHandler              //  27 Comparator
        DCD     WDT_IRQHandler              //  28 PIO1 (011)
        DCD     BOD_IRQHandler              //  29 Brown Out Detect                
        DCD     IntDefaultHandler           //  30 Reserved               
        DCD     WKT_IRQHandler              //  31 Wakeup timer
        DCD     IntDefaultHandler           //  32 Reserved 
        DCD     IntDefaultHandler           //  33 Reserved 
        DCD     IntDefaultHandler           //  34 Reserved 
        DCD     IntDefaultHandler           //  35 Reserved 
        DCD     IntDefaultHandler           //  36 Reserved 
        DCD     IntDefaultHandler           //  37 Reserved 
        DCD     IntDefaultHandler           //  38 Reserved 
        DCD     IntDefaultHandler           //  39 Reserved 
        DCD     PININT0_IRQHandler          //  40 PIO INT0
        DCD     PININT1_IRQHandler          //  41 PIO INT1
        DCD     PININT2_IRQHandler          //  42 PIO INT2
        DCD     PININT3_IRQHandler          //  43 PIO INT3
        DCD     PININT4_IRQHandler          //  44 PIO INT4
        DCD     PININT5_IRQHandler          //  45 PIO INT5
        DCD     PININT6_IRQHandler          //  46 PIO INT6
        DCD     PININT7_IRQHandler          //  47 PIO INT7
	#elif (defined LPC824)
        DCD     SPI0_IRQHandler             //  16 SPI0 controller
        DCD     SPI1_IRQHandler             //  17 SPI1 controller
        DCD     IntDefaultHandler           //  18 Reserved                       
        DCD     UART0_IRQHandler            //  19 UART0             
        DCD     UART1_IRQHandler            //  20 UART1            
        DCD     UART2_IRQHandler            //  21 UART2
        DCD     IntDefaultHandler           //  22 Reserved
        DCD     I2C1_IRQHandler             //  23 I2C1
        DCD     I2C_IRQHandler              //  24 I2C0 controller                         
        DCD     SCT_IRQHandler              //  25 Smart Counter Timer                        
        DCD     MRT_IRQHandler              //  26 Multi-Rate Timer
        DCD     CMP_IRQHandler              //  27 Comparator
        DCD     WDT_IRQHandler              //  28 PIO1 (011)
        DCD     BOD_IRQHandler              //  29 Brown Out Detect                
        DCD     FLASH_IRQHandler            //  30 FLASH               
        DCD     WKT_IRQHandler              //  31 Wakeup timer
        DCD     ADC_SEQA_IRQHandler           //  32 ADC sequence A completion 
        DCD     ADC_SEQB_IRQHandler           //  33 ADC sequence B completion 
        DCD     ADC_THCMP_IRQHandler           //  34 ADC threshold compare     
        DCD     ADC_OVR_IRQHandler           //  35 ADC overrun               
        DCD     DMA_IRQHandler           //  36 DMA interrupt             
        DCD     I2C2_Handler           //  37 I2C2                      
        DCD     I2C3_Handler           //  38 I2C3                      
        DCD     IntDefaultHandler           //  39 Reserved 
        DCD     PININT0_IRQHandler          //  40 PIO INT0
        DCD     PININT1_IRQHandler          //  41 PIO INT1
        DCD     PININT2_IRQHandler          //  42 PIO INT2
        DCD     PININT3_IRQHandler          //  43 PIO INT3
        DCD     PININT4_IRQHandler          //  44 PIO INT4
        DCD     PININT5_IRQHandler          //  45 PIO INT5
        DCD     PININT6_IRQHandler          //  46 PIO INT6
        DCD     PININT7_IRQHandler          //  47 PIO INT7
    #elif defined LPC15xx
    	DCD	  WDT_IRQHandler                // 0,     
		DCD	  BOD_IRQHandler                // 1,
  		DCD	  FLASH_IRQHandler              // 2,
  		DCD	  EEPROM_IRQHandler             // 3,
  		DCD	  DMA_IRQHandler                // 4,   
  		DCD	  GINT0_IRQHandler              // 5,        /*!< Grouped Interrupt 0                              */
  		DCD	  GINT1_IRQHandler              // 6,        /*!< Grouped Interrupt 1                              */	
  		DCD	  PININT0_IRQHandler           // 7,        /*!< All I/O pins can be routed to below 8 interrupts. */
  		DCD	  PININT1_IRQHandler           // 8,
  		DCD	  PININT2_IRQHandler           // 9,
  		DCD	  PININT3_IRQHandler           // 10,
  		DCD	  PININT4_IRQHandler           // 11,   
  		DCD	  PININT5_IRQHandler           // 12,        
  		DCD	  PININT6_IRQHandler           // 13,        
  		DCD	  PININT7_IRQHandler           // 14,        
  		DCD	  RIT_IRQHandler                // 15,        
  		DCD	  SCT0_IRQHandler               // 16,        
  		DCD	  SCT1_IRQHandler               // 17, 
  		DCD	  SCT2_IRQHandler               // 18,      
  		DCD	  SCT3_IRQHandler               // 19,        
		DCD	  MRT_IRQHandler                // 20,       
  		DCD	  UART0_IRQHandler              // 21,       
  		DCD	  UART1_IRQHandler              // 22,      
  		DCD	  UART2_IRQHandler              // 23,     
  		DCD	  I2C_IRQHandler                // 24,      
  		DCD	  SPI0_IRQHandler               // 25,       
  		DCD	  SPI1_IRQHandler               // 26,   
  		DCD	  CAN_IRQHandler                // 27,      
  		DCD	  USB_IRQHandler                // 28,      
  		DCD	  USB_FIQHandler                // 29,       
		DCD	  USBWakeup_IRQHandler          // 30,      
  		DCD	  ADC0_SEQA_IRQHandler          // 31,       
		DCD	  ADC0_SEQB_IRQHandler          // 32,      
		DCD	  ADC0_THCMP_IRQHandler         // 33,      
		DCD	  ADC0_OVR_IRQHandler           // 34,      
		DCD	  ADC1_SEQA_IRQHandler          // 35,      
		DCD	  ADC1_SEQB_IRQHandler          // 36,     
		DCD	  ADC1_THCMP_IRQHandler         // 37,      
		DCD	  ADC1_OVR_IRQHandler           // 38,       
		DCD	  DAC_IRQHandler                // 39,      	
		DCD	  CMP0_IRQHandler              // 40,     
		DCD	  CMP1_IRQHandler              // 41,      
		DCD	  CMP2_IRQHandler              // 42,      
		DCD	  CMP3_IRQHandler              // 43,
		DCD	  QEI_IRQHandler                // 44,      
		DCD	  RTCALARM_IRQHandler           // 45,      
		DCD	  RTCWAKE_IRQHandler            // 46   

    #elif defined MK20DX128
        DCD     DMA_CH0_IRQHandler             //    16 DMA channel 0 transfer complete
        DCD     DMA_CH1_IRQHandler             //    17 DMA channel 1 transfer complete
        DCD     DMA_CH2_IRQHandler             //    18 DMA channel 2 transfer complete
        DCD     DMA_CH3_IRQHandler             //    19 DMA channel 3 transfer complete
        DCD     DMA_ERROR_IRQHandler           //    20 DMA error interrupt channel
        DCD     UNUSED_IRQHandler              //    21 DMA --
        DCD     FLASH_CMD_IRQHandler           //    22 Flash Memory Command complete
        DCD     FLASH_ERROR_IRQHandler         //    23 Flash Read collision
        DCD     LOW_VOLTAGE_IRQHandler         //    24 Low-voltage detect/warning
        DCD     WAKEUP_IRQHandler              //    25 Low Leakage Wakeup
        DCD     WATCHDOG_IRQHandler            //    26 Both EWM and WDOG interrupt
        DCD     I2C0_IRQHandler                //    27 I2C0
        DCD     SPI0_IRQHandler                //    28 SPI0
        DCD     I2S0_TX_IRQHandler             //    29 I2S0 Transmit
        DCD     I2S0_RX_IRQHandler             //    30 I2S0 Receive
        DCD     UART0_LON_IRQHandler           //    31 UART0 CEA709.1-B (LON) status
        DCD     UART0_STATUS_IRQHandler        //    32 UART0 status
        DCD     UART0_ERROR_IRQHandler         //    33 UART0 error
        DCD     UART1_STATUS_IRQHandler        //    34 UART1 status
        DCD     UART1_ERROR_IRQHandler         //    35 UART1 error
        DCD     UART2_STATUS_IRQHandler        //    36 UART2 status
        DCD     UART2_ERROR_IRQHandler         //    37 UART2 error
        DCD     ADC0_IRQHandler                //    38 ADC0
        DCD     CMP0_IRQHandler                //    39 CMP0
        DCD     CMP1_IRQHandler                //    40 CMP1
        DCD     FTM0_IRQHandler                //    41 FTM0
        DCD     FTM1_IRQHandler                //    42 FTM1
        DCD     CMT_IRQHandler                 //    43 CMT
        DCD     RTC_ALARM_IRQHandler           //    44 RTC Alarm interrupt
        DCD     RTC_SECONDS_IRQHandler         //    45 RTC Seconds interrupt
        DCD     PIT0_IRQHandler                //    46 PIT    Channel 0
        DCD     PIT1_IRQHandler                //    47 PIT    Channel 1
        DCD     PIT2_IRQHandler                //    48 PIT    Channel 2
        DCD     PIT3_IRQHandler                //    49 PIT    Channel 3
        DCD     PDB_IRQHandler                 //    50 PDB    Programmable Delay Block
        DCD     USB_IRQHandler                 //    51 USB    OTG
        DCD     USB_CHARGE_IRQHandler          //    52 USB Charger Detect
        DCD     TSI0_IRQHandler                //    53 TSI0
        DCD     MCG_IRQHandler                 //    54 MCG
        DCD     LPTMR_IRQHandler               //    55 Low Power Timer
        DCD     PORTA_IRQHandler               //    56 Pin detect (Port A)
        DCD     PORTB_IRQHandler               //    57 Pin detect (Port B)
        DCD     PORTC_IRQHandler               //    58 Pin detect (Port C)
        DCD     PORTD_IRQHandler               //    59 Pin detect (Port D)
        DCD     PORTE_IRQHandler               //    60 Pin detect (Port E)
        DCD     SOFTWARE_IRQHandler            //    61 Software interrupt

    #elif defined MK20DX256
        DCD     DMA_CH0_IRQHandler          // 16 DMA Channel 0 Transfer Complete
        DCD     DMA_CH1_IRQHandler          // 17 DMA Channel 1 Transfer Complete
        DCD     DMA_CH2_IRQHandler          // 18 DMA Channel 2 Transfer Complete
        DCD     DMA_CH3_IRQHandler          // 19 DMA Channel 3 Transfer Complete
        DCD     DMA_CH4_IRQHandler          // 20 DMA Channel 4 Transfer Complete
        DCD     DMA_CH5_IRQHandler          // 21 DMA Channel 5 Transfer Complete
        DCD     DMA_CH6_IRQHandler          // 22 DMA Channel 6 Transfer Complete
        DCD     DMA_CH7_IRQHandler          // 23 DMA Channel 7 Transfer Complete
        DCD     DMA_CH8_IRQHandler          // 24 DMA Channel 8 Transfer Complete
        DCD     DMA_CH9_IRQHandler          // 25 DMA Channel 9 Transfer Complete
        DCD     DMA_CH10_IRQHandler         // 26 DMA Channel 10 Transfer Complete
        DCD     DMA_CH11_IRQHandler         // 27 DMA Channel 11 Transfer Complete
        DCD     DMA_CH12_IRQHandler         // 28 DMA Channel 12 Transfer Complete
        DCD     DMA_CH13_IRQHandler         // 29 DMA Channel 13 Transfer Complete
        DCD     DMA_CH14_IRQHandler         // 30 DMA Channel 14 Transfer Complete
        DCD     DMA_CH15_IRQHandler         // 31 DMA Channel 15 Transfer Complete
        DCD     DMA_ERROR_IRQHandler        // 32 DMA Error Interrupt
        DCD     MCM_IRQHandler              // 33 Normal interrupt
        DCD     FLASH_CMD_IRQHandler        // 34 Flash Memory Command Complete interrupt
        DCD     FLASH_ERROR_IRQHandler      // 35 Flash Read Collision Interrupt
        DCD     LVD_LVW_IRQHandler          // 36 Low Voltage Detect, Low Voltage Warning
        DCD     LLW_IRQHandler              // 37 Low Leakage Wakeup
        DCD     WDT_IRQHandler              // 38 WDOG Interrupt
        DCD     IntDefaultHandler           // 39 Reserved Interrupt 39
        DCD     I2C0_IRQHandler             // 40 I2C0 interrupt
        DCD     I2C1_IRQHandler             // 41 I2C1 interrupt
        DCD     SPI0_IRQHandler             // 42 SPI0 Interrupt
        DCD     SPI1_IRQHandler             // 43 SPI1 Interrupt
        DCD     IntDefaultHandler           // 44 Reserved interrupt 44
        DCD     CAN0_ORD_MESSAGE_IRQHandler // 45 CAN0 ORd Message Buffers Interrupt
        DCD     CAN0_BUS_OFF_IRQHandler     // 46 CAN0 Bus Off Interrupt
        DCD     CAN0_ERROR_IRQHandler       // 47 CAN0 Error Interrupt
        DCD     CAN0_TX_WARNING_IRQHandler  // 48 CAN0 Tx Warning Interrupt
        DCD     CAN0_RX_WARNING_IRQHandler  // 49 CAN0 Rx Warning Interrupt
        DCD     CAN0_WAKE_UP_IRQHandler     // 50 CAN0 Wake Up Interrupt
        DCD     I2S0_TX_IRQHandler          // 51 I2S0 transmit interrupt
        DCD     I2S0_RX_IRQHandler          // 52 I2S0 receive interrupt
        DCD     IntDefaultHandler           // 53 Reserved interrupt 53
        DCD     IntDefaultHandler           // 54 Reserved interrupt 54
        DCD     IntDefaultHandler           // 55 Reserved interrupt 55
        DCD     IntDefaultHandler           // 56 Reserved interrupt 56
        DCD     IntDefaultHandler           // 57 Reserved interrupt 57
        DCD     IntDefaultHandler           // 58 Reserved interrupt 58
        DCD     IntDefaultHandler           // 59 Reserved interrupt 59
        DCD     UART0_LON_IRQHandler        // 60 UART0 LON interrupt
        DCD     UART0_STATUS_IRQHandler     // 61 UART0 Receive/Transmit interrupt
        DCD     UART0_ERROR_IRQHandler      // 62 UART0 Error interrupt
        DCD     UART1_STATUS_IRQHandler     // 63 UART1 Receive/Transmit interrupt
        DCD     UART1_ERROR_IRQHandler      // 64 UART1 Error interrupt
        DCD     UART2_STATUS_IRQHandler     // 65 UART2 Receive/Transmit interrupt
        DCD     UART2_ERROR_IRQHandler      // 66 UART2 Error interrupt
        DCD     UART3_STATUS_IRQHandler     // 67 UART3 Receive/Transmit interrupt
        DCD     UART3_ERROR_IRQHandler      // 68 UART3 Error interrupt
        DCD     UART4_STATUS_IRQHandler     // 69 UART4 Receive/Transmit interrupt
        DCD     UART4_ERROR_IRQHandler      // 70 UART4 Error interrupt
        DCD     IntDefaultHandler           // 71 Reserved interrupt 71
        DCD     IntDefaultHandler           // 72 Reserved interrupt 72
        DCD     ADC0_IRQHandler             // 73 ADC0 interrupt
        DCD     ADC1_IRQHandler             // 74 ADC1 interrupt
        DCD     CMP0_IRQHandler             // 75 CMP0 interrupt
        DCD     CMP1_IRQHandler             // 76 CMP1 interrupt
        DCD     CMP2_IRQHandler             // 77 CMP2 interrupt
        DCD     FTM0_IRQHandler             // 78 FTM0 fault, overflow and channels interrupt
        DCD     FTM1_IRQHandler             // 79 FTM1 fault, overflow and channels interrupt
        DCD     FTM2_IRQHandler             // 80 FTM2 fault, overflow and channels interrupt
        DCD     CMT_IRQHandler              // 81 CMT interrupt
        DCD     RTC_ALARM_IRQHandler        // 82 RTC interrupt
        DCD     RTC_SECONDS_IRQHandler      // 83 RTC seconds interrupt
        DCD     PIT0_IRQHandler             // 84 PIT timer channel 0 interrupt
        DCD     PIT1_IRQHandler             // 85 PIT timer channel 1 interrupt
        DCD     PIT2_IRQHandler             // 86 PIT timer channel 2 interrupt
        DCD     PIT3_IRQHandler             // 87 PIT timer channel 3 interrupt
        DCD     PDB_IRQHandler              // 88 PDB Interrupt
        DCD     USB_IRQHandler              // 89 USB interrupt
        DCD     USBDCD_IRQHandler           // 90 USBDCD Interrupt
        DCD     IntDefaultHandler           // 91 Reserved interrupt 91
        DCD     IntDefaultHandler           // 92 Reserved interrupt 92
        DCD     IntDefaultHandler           // 93 Reserved interrupt 93
        DCD     IntDefaultHandler           // 94 Reserved interrupt 94
        DCD     IntDefaultHandler           // 95 Reserved interrupt 95
        DCD     IntDefaultHandler           // 96 Reserved interrupt 96
        DCD     DAC0_IRQHandler             // 97 DAC0 interrupt
        DCD     IntDefaultHandler           // 98 Reserved interrupt 98
        DCD     TSI0_IRQHandler             // 99 TSI0 Interrupt
        DCD     MCG_IRQHandler              // 100MCG Interrupt
        DCD     LPTMR_IRQHandler            // 101LPTimer interrupt
        DCD     IntDefaultHandler           // 102Reserved interrupt 102
        DCD     PORTA_IRQHandler            // 103Port A interrupt
        DCD     PORTB_IRQHandler            // 104Port B interrupt
        DCD     PORTC_IRQHandler            // 105Port C interrupt
        DCD     PORTD_IRQHandler            // 106Port D interrupt
        DCD     PORTE_IRQHandler            // 107Port E interrupt
        DCD     IntDefaultHandler           // 108Reserved interrupt 108
        DCD     IntDefaultHandler           // 109Reserved interrupt 109
        DCD     SOFTWARE_IRQHandler         // 110Software interrupt

	#elif	(defined STM32F411)
		DCD     WWDG_IRQHandler                   // Window WatchDog                                                      
		DCD     PVD_IRQHandler                    // PVD through EXTI Line detection                         
		DCD     TAMP_STAMP_IRQHandler             // Tamper and TimeStamps through the EXTI line             
		DCD     RTC_WKUP_IRQHandler               // RTC Wakeup through the EXTI line                       
		DCD     FLASH_IRQHandler                  // FLASH                                                                  
		DCD     RCC_IRQHandler                    // RCC                                                                      
		DCD     EXTI0_IRQHandler                  // EXTI Line0                                           
		DCD     EXTI1_IRQHandler                  // EXTI Line1                                             
		DCD     EXTI2_IRQHandler                  // EXTI Line2                                             
		DCD     EXTI3_IRQHandler                  // EXTI Line3                                             
		DCD     EXTI4_IRQHandler                  // EXTI Line4                                             
		DCD     DMA1_Stream0_IRQHandler           // DMA1 Stream 0                                  
		DCD     DMA1_Stream1_IRQHandler           // DMA1 Stream 1                                   
		DCD     DMA1_Stream2_IRQHandler           // DMA1 Stream 2                                   
		DCD     DMA1_Stream3_IRQHandler           // DMA1 Stream 3                                   
		DCD     DMA1_Stream4_IRQHandler           // DMA1 Stream 4                                   
		DCD     DMA1_Stream5_IRQHandler           // DMA1 Stream 5                                   
		DCD     DMA1_Stream6_IRQHandler           // DMA1 Stream 6                                   
		DCD     ADC_IRQHandler                    // ADC1, ADC2 and ADC3s                            
		DCD     0               				  // Reserved                                               
		DCD     0              					  // Reserved                                               
		DCD     0                                 // Reserved                                               
		DCD     0                                 // Reserved                                               
		DCD     EXTI9_5_IRQHandler                // External Line[9:5]s                                    
		DCD     TIM1_BRK_TIM9_IRQHandler          // TIM1 Break and TIM9                   
		DCD     TIM1_UP_TIM10_IRQHandler          // TIM1 Update and TIM10                 
		DCD     TIM1_TRG_COM_TIM11_IRQHandler     // TIM1 Trigger and Commutation and TIM11 
		DCD     TIM1_CC_IRQHandler                // TIM1 Capture Compare                                   
		DCD     TIM2_IRQHandler                   // TIM2                                            
		DCD     TIM3_IRQHandler                   // TIM3                                            
		DCD     TIM4_IRQHandler                   // TIM4                                            
		DCD     I2C1_EV_IRQHandler                // I2C1 Event                                             
		DCD     I2C1_ER_IRQHandler                // I2C1 Error                                             
		DCD     I2C2_EV_IRQHandler                // I2C2 Event                                             
		DCD     I2C2_ER_IRQHandler                // I2C2 Error                                               
		DCD     SPI1_IRQHandler                   // SPI1                                            
		DCD     SPI2_IRQHandler                   // SPI2                                            
		DCD     USART1_IRQHandler                 // USART1                                          
		DCD     USART2_IRQHandler                 // USART2                                          
		DCD     0               				  // Reserved                                          
		DCD     EXTI15_10_IRQHandler              // External Line[15:10]s                                  
		DCD     RTC_Alarm_IRQHandler              // RTC Alarm (A and B) through EXTI Line                  
		DCD     OTG_FS_WKUP_IRQHandler            // USB OTG FS Wakeup through EXTI line                        
		DCD     0                                 // Reserved     				           
		DCD     0                                 // Reserved       			           
		DCD     0                                 // Reserved 					  
		DCD     0                                 // Reserved                                               
		DCD     DMA1_Stream7_IRQHandler           // DMA1 Stream7                                           
		DCD     0                                 // Reserved                                        
		DCD     SDIO_IRQHandler                   // SDIO                                            
		DCD     TIM5_IRQHandler                   // TIM5                                            
		DCD     SPI3_IRQHandler                   // SPI3                                            
		DCD     0                                 // Reserved                                        
		DCD     0                                 // Reserved                                        
		DCD     0                                 // Reserved                                        
		DCD     0                                 // Reserved                     
		DCD     DMA2_Stream0_IRQHandler           // DMA2 Stream 0                                   
		DCD     DMA2_Stream1_IRQHandler           // DMA2 Stream 1                                   
		DCD     DMA2_Stream2_IRQHandler           // DMA2 Stream 2                                   
		DCD     DMA2_Stream3_IRQHandler           // DMA2 Stream 3                                   
		DCD     DMA2_Stream4_IRQHandler           // DMA2 Stream 4                                   
		DCD     0                    			  // Reserved                                        
		DCD     0              					  // Reserved                                          
		DCD     0              					  // Reserved                                               
		DCD     0             					  // Reserved                                               
		DCD     0              					  // Reserved                                               
		DCD     0              					  // Reserved                                               
		DCD     OTG_FS_IRQHandler                 // USB OTG FS                                      
		DCD     DMA2_Stream5_IRQHandler           // DMA2 Stream 5                                   
		DCD     DMA2_Stream6_IRQHandler           // DMA2 Stream 6                                   
		DCD     DMA2_Stream7_IRQHandler           // DMA2 Stream 7                                   
		DCD     USART6_IRQHandler                 // USART6                                           
		DCD     I2C3_EV_IRQHandler                // I2C3 event                                             
		DCD     I2C3_ER_IRQHandler                // I2C3 error                                             
		DCD     0                                 // Reserved                                        
		DCD     0                                 // Reserved                                        
		DCD     0                                 // Reserved                                              
		DCD     0                                 // Reserved                                        
		DCD     0                                 // Reserved                                        
		DCD     0                                 // Reserved                                        
		DCD     0                                 // Reserved                     
		DCD     FPU_IRQHandler                    // FPU                          
		DCD     0                                 // Reserved                                        
		DCD     0                                 // Reserved                     
		DCD     SPI4_IRQHandler                   // SPI4                         
		DCD     SPI5_IRQHandler                   // SPI5                           

	#elif defined LUMINARY
        DCD     IntDefaultHandler           // 16 GPIO Port A
        DCD     IntDefaultHandler           // 17 GPIO Port B
        DCD     IntDefaultHandler           // 18 GPIO Port C
        DCD     IntDefaultHandler           // 19 GPIO Port D
        DCD     IntDefaultHandler           // 20 GPIO Port E
        DCD     UART0_IRQHandler            // 21 UART0 Rx and Tx
        DCD     UART1_IRQHandler            // 22 UART1 Rx and Tx
        DCD     IntDefaultHandler           // 23 SSI0 Rx and Tx
        DCD     IntDefaultHandler           // 24 I2C0 Master and Slave
        DCD     IntDefaultHandler           // 25 PWM Fault
        DCD     IntDefaultHandler           // 26 PWM Generator 0
        DCD     IntDefaultHandler           // 27 PWM Generator 1
        DCD     IntDefaultHandler           // 28 PWM Generator 2
        DCD     IntDefaultHandler           // 29 Quadrature Encoder 0
        DCD     IntDefaultHandler           // 30 ADC Sequence 0
        DCD     IntDefaultHandler           // 31 ADC Sequence 1
        DCD     IntDefaultHandler           // 32 ADC Sequence 2
        DCD     IntDefaultHandler           // 33 ADC Sequence 3
        DCD     WDT_IRQHandler              // 34 Watchdog timer
        DCD     IntDefaultHandler           // 35 Timer 0 subtimer A
        DCD     IntDefaultHandler           // 36 Timer 0 subtimer B
        DCD     IntDefaultHandler           // 37 Timer 1 subtimer A
        DCD     IntDefaultHandler           // 38 Timer 1 subtimer B
        DCD     IntDefaultHandler           // 39 Timer 2 subtimer A
        DCD     IntDefaultHandler           // 40 Timer 2 subtimer B
        DCD     IntDefaultHandler           // 41 Analog Comparator 0
        DCD     IntDefaultHandler           // 42 Analog Comparator 1
        DCD     IntDefaultHandler           // 43 Analog Comparator 2
        DCD     IntDefaultHandler           // 44 System Control (PLL, OSC, BO)
        DCD     IntDefaultHandler           // 45 FLASH Control
        DCD     IntDefaultHandler           // 46 GPIO Port F
        DCD     IntDefaultHandler           // 47 GPIO Port G
        DCD     IntDefaultHandler           // 48 GPIO Port H
        DCD     IntDefaultHandler           // 49 UART2 Rx and Tx
        DCD     IntDefaultHandler           // 50 SSI1 Rx and Tx
        DCD     IntDefaultHandler           // 51 Timer 3 subtimer A
        DCD     IntDefaultHandler           // 52 Timer 3 subtimer B
        DCD     IntDefaultHandler           // 53 I2C1 Master and Slave
        DCD     IntDefaultHandler           // 54 Quadrature Encoder 1
        DCD     IntDefaultHandler           // 55 CAN0
        DCD     IntDefaultHandler           // 56 CAN1
        DCD     IntDefaultHandler           // 57 CAN2
        DCD     IntDefaultHandler	// EthernetIntHandler          // 58 Ethernet
        DCD     IntDefaultHandler           // 59 Hibernate
    #elif defined LPC54102 || defined LPC54102m0
                // Available on M0/M4
                // External Interrupts
                DCD     WDT_IRQHandler              // Watchdog
                DCD     BOD_IRQHandler              // Brown Out Detect
                DCD     IntDefaultHandler            // Non-Volatile Memory Controller
                DCD     DMA_IRQHandler              // DMA Controller
                DCD     GINT0_IRQHandler            // GPIO Group0 Interrupt
                DCD     PININT0_IRQHandler          // PIO INT0
                DCD     PININT1_IRQHandler          // PIO INT1
                DCD     PININT2_IRQHandler          // PIO INT2
                DCD     PININT3_IRQHandler          // PIO INT3
                DCD     UTICK_IRQHandler            // UTICK timer  				
                DCD     MRT_IRQHandler              // Multi-Rate Timer
                DCD     TIMER0_IRQHandler          // CTIMER0
                DCD     TIMER1_IRQHandler          // CTIMER1
                DCD     TIMER2_IRQHandler          // CTIMER2
                DCD     TIMER3_IRQHandler          // CTIMER3
                DCD     TIMER4_IRQHandler          // CTIMER4
                DCD     SCT_IRQHandler              // Smart Counter Timer 
                DCD     UART0_IRQHandler            // UART0             
                DCD     UART1_IRQHandler            // UART1            
                DCD     UART2_IRQHandler            // UART2
                DCD     UART3_IRQHandler            // UART3
                DCD     I2C0_IRQHandler             // I2C0 controller  
                DCD     I2C1_IRQHandler             // I2C1 controller  
                DCD     I2C2_IRQHandler             // I2C2 controller  
                DCD     SPI0_IRQHandler             // SPI0 controller				
                DCD     SPI1_IRQHandler             // SPI1 controller
                DCD     ADC0_SEQA_IRQHandler         // ADC SEQA             
                DCD     ADC0_SEQB_IRQHandler         // ADC SEQB
                DCD     ADC_THCMP_OVR_IRQHandler    // ADC THCMP and OVERRUN ORed
                DCD     RTC_IRQHandler              // RTC Timer
                DCD     IntDefaultHandler              // EZH
                DCD     MBOX_IRQHandler             // Mailbox 

         #ifdef CORE_M4
                // For M4 only
                DCD     GINT1_IRQHandler            // GPIO Group1 Interrupt
                DCD     PININT4_IRQHandler          // PIO INT4
                DCD     PININT5_IRQHandler          // PIO INT5
                DCD     PININT6_IRQHandler          // PIO INT6
                DCD     PININT7_IRQHandler          // PIO INT7
                DCD     SPI2_IRQHandler             // SPI2 controller				
                DCD     SPI3_IRQHandler             // SPI3 controller				
                DCD     0                           // Reserved
                DCD     RIT_IRQHandler          // Repetitive Interrupt Timer
                DCD     PVT0_A_IRQHandler           // PVT0 Amber                         
                DCD     PVT0_R_IRQHandler           // PVT0 Red       
                DCD     PVT1_A_IRQHandler           // PVT1 Amber                         
                DCD     PVT1_R_IRQHandler           // PVT1 Red  
		  #endif

    #elif defined LPC54618
                DCD     WDTBOD_IRQHandler        // 16 0  WWDT                                     
                DCD     DMA_IRQHandler           // 17 1  DMA                                      
                DCD     GINT0_IRQHandler         // 18 2  GINT0                                    
                DCD     GINT1_IRQHandler         // 19 3  GINT1                                    
                DCD     PIN_INT0_IRQHandler      // 20 4  PININT0                                  
                DCD     PIN_INT1_IRQHandler      // 21 5  PININT1                                  
                DCD     PIN_INT2_IRQHandler      // 22 6  PININT2                                  
                DCD     PIN_INT3_IRQHandler      // 23 7  PININT3                                  
                DCD     UTICK_IRQHandler         // 24 8  Micro-tick Timer interrupt               
                DCD     MRT_IRQHandler           // 25 9  Multi-rate timer interrupt               
                DCD     CT32B0_IRQHandler        // 26 10 CTMR0                                    
                DCD     CT32B1_IRQHandler        // 27 11 CTMR1                                    
                DCD     SCT0_IRQHandler          // 28 12 SCT                                      
                DCD     CT32B3_IRQHandler        // 29 13 CTMR3                                    
                DCD     FLEXCOMM0_IRQHandler     // 30 14 FLEXCOMM0                                
                DCD     FLEXCOMM1_IRQHandler     // 31 15 FLEXCOMM1                                
                DCD     FLEXCOMM2_IRQHandler     // 32 16 FLEXCOMM2                                
                DCD     FLEXCOMM3_IRQHandler     // 33 17 FLEXCOMM3                                
                DCD     FLEXCOMM4_IRQHandler     // 34 18 FLEXCOMM4                                
                DCD     FLEXCOMM5_IRQHandler     // 35 19 FLEXCOMM5                                
                DCD     FLEXCOMM6_IRQHandler     // 36 20 FLEXCOMM6                                
                DCD     FLEXCOMM7_IRQHandler     // 37 21 FLEXCOMM7                                
                DCD     ADC_SEQA_IRQHandler      // 38 22 ADC0 sequence A completion               
                DCD     ADC_SEQB_IRQHandler      // 39 23 ADC0 sequence B completion               
                DCD     ADC_THCMP_IRQHandler     // 40 24 ADC0 threshold compare and error         
                DCD     DMIC_IRQHandler          // 41 25 Digital Mic                              
                DCD     HWVAD_IRQHandler         // 42 26 Hardware Voice acitivity detect          
                DCD     USB0ACT_IRQHandler       // 43 27 USB Activity                             
                DCD     USB0_IRQHandler          // 44 28 USB                                      
                DCD     RTC_IRQHandler           // 45 29 RTC alarm and wake-up interrupts         
                DCD     WAKEUP_IRQHandler        // 47 31 FIXME: what is wakeup (is this reserved?)
                DCD     PIN_INT4_IRQHandler      // 48 32 External Interrupt 4                     
                DCD     PIN_INT5_IRQHandler      // 49 33 External Interrupt 5                     
                DCD     PIN_INT6_IRQHandler      // 50 34 External Interrupt 6                     
                DCD     PIN_INT7_IRQHandler      // 51 35 External Interrupt 7                     
                DCD     CT32B2_IRQHandler        // 52 36 CTMR2                                    
                DCD     CT32B4_IRQHandler        // 53 37 CTMR4                                    
                DCD     RITIMER_IRQHandler       // 54 38 OSTIMER Interrupt                        
                DCD     SPIFI_IRQHandler         // 55 39 SPI Flash interface                      
                DCD     FLEXCOMM8_IRQHandler     // 56 40 Flexcomm8 interrupt                      
                DCD     FLEXCOMM9_IRQHandler     // 57 41 Flexcomm9 interrupt                      
                DCD     SDIO_IRQHandler          // 58 42 SDIO Interrupt                           
                DCD     CAN0_0_IRQHandler        // 59 43 CAN0 Interrupt0                          
                DCD     CAN0_1_IRQHandler        // 60 44 CAN0 Interrupt1                          
                DCD     USB1_IRQHandler          // 63 47 USB1 Interrupt                           
                DCD     USB1ACT_IRQHandler       // 64 48 USB1 Activity interrupt                  
                DCD     ETH_IRQHandler           // 65 49 Ethernet Interrupt handler               
                DCD     ETH_PMT_IRQHandler       // 66 50 FIXME: What is this (?)                  
                DCD     ETH_MACLP_IRQHandler     // 67 51 FIXME: Check what this is!               
                DCD     EEPROM_IRQHandler        // 68 52 EEPROM Interrupt                         
                DCD     LCD_IRQHandler           // 69 53 LCD Controller Interrupt                 
                DCD     SHA_IRQHandler           // 70 54 Hash engine interrupt                    
                DCD     SMARTCARD0_IRQHandler    // 71 55 Smart card-0 interrupt                   
                DCD     SMARTCARD1_IRQHandler    // 72 56 Smart card-1 interrupt                   
    
    #else
    	#error -- interrupt vectors not defined for this CPU yet
	#endif
	
        WEAK	(	NmiSR                )       
        WEAK    (   FaultISR             )       
        WEAK    (   FaultMPU             )       
        WEAK    (   FaultBUS             )       
        WEAK    (   FaultUSE             )       
        WEAK    (   IntDefaultHandler    )
        
		THUMBCODE
LABEL( NmiSR           )
		THUMBCODE
LABEL( FaultISR           )
		THUMBCODE
LABEL( FaultMPU           )
		THUMBCODE
LABEL( FaultBUS           )
		THUMBCODE
LABEL( FaultUSE           )
    	bl 		IntDefaultHandler			//lr set back in crash routine -- to 0xfffffff9  indicates fault -- bte 2017

        WEAK	(	SysTick_Handler )
        
        WEAK	( UTICK_IRQHandler )
        WEAK	( ADC_THCMP_OVR_IRQHandler )
        WEAK	( EZH_IRQHandler )
        WEAK	( MBOX_IRQHandler )
        WEAK (OSTIMER_IRQHandler   )
        WEAK (PVT0_A_IRQHandler    )                         
        WEAK (PVT0_R_IRQHandler    )     
        WEAK (PVT1_A_IRQHandler    )                         
        WEAK (PVT1_R_IRQHandler    )
        
  		WEAK	 ( USB_IRQHandler         )            
  		WEAK	 ( USB_FIQHandler         )             
		WEAK	 ( USBWakeup_IRQHandler   )            
  		WEAK	 ( ADC0_SEQA_IRQHandler   )             
		WEAK	 ( ADC0_SEQB_IRQHandler   )            
		WEAK	 ( ADC0_THCMP_IRQHandler  )            
		WEAK	 ( ADC0_OVR_IRQHandler    )            
		WEAK	 ( ADC1_SEQA_IRQHandler   )            
		WEAK	 ( ADC1_SEQB_IRQHandler   )           
		WEAK	 ( ADC1_THCMP_IRQHandler  )            
		WEAK	 ( ADC1_OVR_IRQHandler    )             
               
        WEAK    ( WDT_IRQHandler            ) 
        WEAK    ( TIMER0_IRQHandler         ) 
        WEAK    ( TIMER1_IRQHandler         ) 
        WEAK    ( TIMER2_IRQHandler         ) 
        WEAK    ( TIMER3_IRQHandler         ) 
        WEAK    ( TIMER4_IRQHandler         ) 
        WEAK    ( UART0_IRQHandler          ) 
        WEAK    ( UART1_IRQHandler          ) 
        WEAK    ( UART2_IRQHandler          ) 
        WEAK    ( UART3_IRQHandler          ) 
        WEAK    ( PWM0_IRQHandler           ) 
        WEAK    ( PWM1_IRQHandler           ) 
        WEAK    ( I2C0_IRQHandler           ) 
        WEAK    ( I2C1_IRQHandler           ) 
        WEAK    ( I2C2_IRQHandler           ) 
        WEAK    ( SPIFI_IRQHandler          ) 
        WEAK    ( SSP0_IRQHandler           ) 
        WEAK    ( SSP1_IRQHandler           ) 
        WEAK    ( PLL0_IRQHandler           ) 
        WEAK    ( RTC_IRQHandler            ) 
		WEAK	(  RTCALARM_IRQHandler      )         
		WEAK	(  RTCWAKE_IRQHandler       )        
        WEAK    ( EINT0_IRQHandler          ) 
        WEAK    ( EINT1_IRQHandler          ) 
        WEAK    ( EINT2_IRQHandler          ) 
        WEAK    ( EINT3_IRQHandler          ) 
        WEAK    ( ADC_IRQHandler            ) 
        WEAK    ( BOD_IRQHandler            ) 
        WEAK    ( CAN_IRQHandler            ) 
        WEAK    ( DMA_IRQHandler            ) 
        WEAK    ( I2S_IRQHandler            ) 
        WEAK    ( ENET_IRQHandler           ) 
        WEAK    ( MCI_IRQHandler            ) 
        WEAK    ( MCPWM_IRQHandler          ) 
        WEAK    ( QEI_IRQHandler            ) 
        WEAK    ( PLL1_IRQHandler           ) 
        WEAK    ( USBActivity_IRQHandler    ) 
        WEAK    ( CANActivity_IRQHandler    ) 
        WEAK    ( UART4_IRQHandler          ) 
        WEAK    ( SSP2_IRQHandler           )
        WEAK	( M0a_IRQHandler            )
        
        WEAK 	(SPI0_IRQHandler      )
        WEAK 	(SPI1_IRQHandler      )
        WEAK 	(SPI2_IRQHandler      )
        WEAK 	(SPI3_IRQHandler      )
        WEAK 	(I2C_IRQHandler       )                 
        WEAK 	(SCT_IRQHandler       )                     
        WEAK 	(SCT0_IRQHandler      )                      
        WEAK 	(SCT1_IRQHandler      )                      
        WEAK 	(SCT2_IRQHandler      )                      
        WEAK 	(SCT3_IRQHandler      )                      
        WEAK 	(MRT_IRQHandler       )
        WEAK 	(CMP_IRQHandler       )
        WEAK 	(CMP0_IRQHandler      )
        WEAK 	(CMP1_IRQHandler      )
        WEAK 	(CMP2_IRQHandler      )
        WEAK 	(CMP3_IRQHandler      )
        WEAK 	(EEPROM_IRQHandler    )
        WEAK 	(WKT_IRQHandler       )
        WEAK 	(PININT0_IRQHandler   )
        WEAK 	(PININT1_IRQHandler   )
        WEAK 	(PININT2_IRQHandler   )
        WEAK 	(PININT3_IRQHandler   )
        WEAK 	(PININT4_IRQHandler   )
        WEAK 	(PININT5_IRQHandler   )
        WEAK 	(PININT6_IRQHandler   )
        WEAK 	(PININT7_IRQHandler   )
        
        WEAK	(	DAC_IRQHandler                  )
        WEAK	(	CAN0_IRQHandler                 )
        WEAK	(	CAN1_IRQHandler                 )
		WEAK	(	GPIO0_IRQHandler                )
		WEAK	(	GPIO1_IRQHandler                )
		WEAK	(	GPIO2_IRQHandler                )
		WEAK	(	GPIO3_IRQHandler                )
		WEAK	(	GPIO4_IRQHandler                )
		WEAK	(	GPIO5_IRQHandler                )
		WEAK	(	GPIO6_IRQHandler                )
		WEAK	(	GPIO7_IRQHandler                )
		WEAK	(	GINT0_IRQHandler                )
		WEAK	(	GINT1_IRQHandler                )
		WEAK	(	VADC_IRQHandler                 )
		WEAK	(	ADC0_IRQHandler                 )
		WEAK	(	ADC1_IRQHandler                 )
		WEAK	(	SDIO_IRQHandler                 )
		WEAK	(	USB0_IRQHandler                 )
		WEAK	(	USB1_IRQHandler                 )
		WEAK	(	RIT_IRQHandler                  )
		WEAK	(	SPI_IRQHandler                  )
		WEAK	(	I2S0_IRQHandler                 )
		WEAK	(	I2S1_IRQHandler                 )
		WEAK	(	SGPIO_IRQHandler                )
		WEAK	(	EVRT_IRQHandler                 )
		WEAK	(	ATIMER_IRQHandler               )

        WEAK    ( DMA_CH0_IRQHandler                )
        WEAK    ( DMA_CH1_IRQHandler                )
        WEAK    ( DMA_CH2_IRQHandler                )
        WEAK    ( DMA_CH3_IRQHandler                )
        WEAK    ( DMA_ERROR_IRQHandler              )
        WEAK    ( UNUSED_IRQHandler                 )
        WEAK    ( FLASH_CMD_IRQHandler              )
        WEAK    ( FLASH_ERROR_IRQHandler            )
        WEAK    ( LOW_VOLTAGE_IRQHandler            )
        WEAK    ( WAKEUP_IRQHandler                 )
        WEAK    ( WATCHDOG_IRQHandler               )
        WEAK    ( SPI0_IRQHandler                   )
        WEAK    ( I2S0_TX_IRQHandler                )
        WEAK    ( I2S0_RX_IRQHandler                )
        WEAK    ( UART0_LON_IRQHandler              )
        WEAK    ( UART0_STATUS_IRQHandler           )
        WEAK    ( UART0_ERROR_IRQHandler            )
        WEAK    ( UART1_STATUS_IRQHandler           )
        WEAK    ( UART1_ERROR_IRQHandler            )
        WEAK    ( UART2_STATUS_IRQHandler           )
        WEAK    ( UART2_ERROR_IRQHandler            )
        WEAK    ( ADC0_IRQHandler                   )
        WEAK    ( CMP0_IRQHandler                   )
        WEAK    ( CMP1_IRQHandler                   )
        WEAK    ( FTM0_IRQHandler                   )
        WEAK    ( FTM1_IRQHandler                   )
        WEAK    ( CMT_IRQHandler                    )
        WEAK    ( RTC_ALARM_IRQHandler              )
        WEAK    ( RTC_SECONDS_IRQHandler            )
        WEAK    ( PIT0_IRQHandler                   )
        WEAK    ( PIT1_IRQHandler                   )
        WEAK    ( PIT2_IRQHandler                   )
        WEAK    ( PIT3_IRQHandler                   )
        WEAK    ( PDB_IRQHandler                    )
        WEAK    ( USB_IRQHandler                    )
        WEAK    ( USB_CHARGE_IRQHandler             )
        WEAK    ( TSI0_IRQHandler                   )
        WEAK    ( MCG_IRQHandler                    )
        WEAK    ( LPTMR_IRQHandler                  )
        WEAK    ( PORTA_IRQHandler                  )
        WEAK    ( PORTB_IRQHandler                  )
        WEAK    ( PORTC_IRQHandler                  )
        WEAK    ( PORTD_IRQHandler                  )
        WEAK    ( PORTE_IRQHandler                  )
        WEAK    ( SOFTWARE_IRQHandler               )

        WEAK    ( DMA_CH4_IRQHandler                )
        WEAK    ( DMA_CH5_IRQHandler                )
        WEAK    ( DMA_CH6_IRQHandler                )
        WEAK    ( DMA_CH7_IRQHandler                )
        WEAK    ( DMA_CH8_IRQHandler                )
        WEAK    ( DMA_CH9_IRQHandler                )
        WEAK    ( DMA_CH10_IRQHandler               )
        WEAK    ( DMA_CH11_IRQHandler               )
        WEAK    ( DMA_CH12_IRQHandler               )
        WEAK    ( DMA_CH13_IRQHandler               )
        WEAK    ( DMA_CH14_IRQHandler               )
        WEAK    ( DMA_CH15_IRQHandler               )
        WEAK    ( UART3_STATUS_IRQHandler           )
        WEAK    ( UART3_ERROR_IRQHandler            )
        WEAK    ( UART4_STATUS_IRQHandler           )
        WEAK    ( UART4_ERROR_IRQHandler            )
        WEAK    ( FTM2_IRQHandler                   )
        WEAK    ( MCM_IRQHandler                    )
        WEAK    ( LVD_LVW_IRQHandler                )
        WEAK    ( LLW_IRQHandler                    )
        WEAK    ( CAN0_ORD_MESSAGE_IRQHandler       )
        WEAK    ( CAN0_BUS_OFF_IRQHandler           )
        WEAK    ( CAN0_ERROR_IRQHandler             )
        WEAK    ( CAN0_TX_WARNING_IRQHandler        )
        WEAK    ( CAN0_RX_WARNING_IRQHandler        )
        WEAK    ( CAN0_WAKE_UP_IRQHandler           )
        WEAK    ( USBDCD_IRQHandler                 )
        WEAK    ( DAC0_IRQHandler                   )
        
        WEAK    ( ADC_SEQA_IRQHandler               )
        WEAK    ( ADC_SEQB_IRQHandler               )
        WEAK    ( ADC_THCMP_IRQHandler              )
        WEAK    ( ADC_OVR_IRQHandler                )
        WEAK    ( I2C2_Handler                      )
        WEAK    ( I2C3_Handler                      )

        WEAK    ( FLEX_INT0_IRQHandler              )
        WEAK    ( FLEX_INT1_IRQHandler              )
        WEAK    ( FLEX_INT2_IRQHandler              )
        WEAK    ( FLEX_INT3_IRQHandler              )
        WEAK    ( FLEX_INT4_IRQHandler              )
        WEAK    ( FLEX_INT5_IRQHandler              )
        WEAK    ( FLEX_INT6_IRQHandler              )
        WEAK    ( FLEX_INT7_IRQHandler              )
        WEAK    ( TIMER_16_0_IRQHandler             )
        WEAK    ( TIMER_16_1_IRQHandler             )
        WEAK    ( TIMER_32_0_IRQHandler             )
        WEAK    ( TIMER_32_1_IRQHandler             )
        WEAK    ( FMC_IRQHandler                    )

		WEAK (     WWDG_IRQHandler                   )// Window WatchDog                                                      
		WEAK (     PVD_IRQHandler                    )// PVD through EXTI Line detection                         
		WEAK (     TAMP_STAMP_IRQHandler             )// Tamper and TimeStamps through the EXTI line             
		WEAK (     RTC_WKUP_IRQHandler               )// RTC Wakeup through the EXTI line                       
		WEAK (     FLASH_IRQHandler                  )// FLASH                                                                  
		WEAK (     RCC_IRQHandler                    )// RCC                                                                      
		WEAK (     EXTI0_IRQHandler                  )// EXTI Line0                                           
		WEAK (     EXTI1_IRQHandler                  )// EXTI Line1                                             
		WEAK (     EXTI2_IRQHandler                  )// EXTI Line2                                             
		WEAK (     EXTI3_IRQHandler                  )// EXTI Line3                                             
		WEAK (     EXTI4_IRQHandler                  )// EXTI Line4                                             
		WEAK (     DMA1_Stream0_IRQHandler           )// DMA1 Stream 0                                  
		WEAK (     DMA1_Stream1_IRQHandler           )// DMA1 Stream 1                                   
		WEAK (     DMA1_Stream2_IRQHandler           )// DMA1 Stream 2                                   
		WEAK (     DMA1_Stream3_IRQHandler           )// DMA1 Stream 3                                   
		WEAK (     DMA1_Stream4_IRQHandler           )// DMA1 Stream 4                                   
		WEAK (     DMA1_Stream5_IRQHandler           )// DMA1 Stream 5                                   
		WEAK (     DMA1_Stream6_IRQHandler           )// DMA1 Stream 6                                   
		WEAK (     ADC_IRQHandler                    )// ADC1, ADC2 and ADC3s                            
		WEAK (     EXTI9_5_IRQHandler                )// External Line[9:5]s                                    
		WEAK (     TIM1_BRK_TIM9_IRQHandler          )// TIM1 Break and TIM9                   
		WEAK (     TIM1_UP_TIM10_IRQHandler          )// TIM1 Update and TIM10                 
		WEAK (     TIM1_TRG_COM_TIM11_IRQHandler     )// TIM1 Trigger and Commutation and TIM11 
		WEAK (     TIM1_CC_IRQHandler                )// TIM1 Capture Compare                                   
		WEAK (     TIM2_IRQHandler                   )// TIM2                                            
		WEAK (     TIM3_IRQHandler                   )// TIM3                                            
		WEAK (     TIM4_IRQHandler                   )// TIM4                                            
		WEAK (     I2C1_EV_IRQHandler                )// I2C1 Event                                             
		WEAK (     I2C1_ER_IRQHandler                )// I2C1 Error                                             
		WEAK (     I2C2_EV_IRQHandler                )// I2C2 Event                                             
		WEAK (     I2C2_ER_IRQHandler                )// I2C2 Error                                               
		WEAK (     SPI1_IRQHandler                   )// SPI1                                            
		WEAK (     SPI2_IRQHandler                   )// SPI2                                            
		WEAK (     USART1_IRQHandler                 )// USART1                                          
		WEAK (     USART2_IRQHandler                 )// USART2                                          
		WEAK (     EXTI15_10_IRQHandler              )// External Line[15:10]s                                  
		WEAK (     RTC_Alarm_IRQHandler              )// RTC Alarm (A and B) through EXTI Line                  
		WEAK (     OTG_FS_WKUP_IRQHandler            )// USB OTG FS Wakeup through EXTI line                        
		WEAK (     DMA1_Stream7_IRQHandler           )// DMA1 Stream7                                           
		WEAK (     SDIO_IRQHandler                   )// SDIO                                            
		WEAK (     TIM5_IRQHandler                   )// TIM5                                            
		WEAK (     SPI3_IRQHandler                   )// SPI3                                            
		WEAK (     DMA2_Stream0_IRQHandler           )// DMA2 Stream 0                                   
		WEAK (     DMA2_Stream1_IRQHandler           )// DMA2 Stream 1                                   
		WEAK (     DMA2_Stream2_IRQHandler           )// DMA2 Stream 2                                   
		WEAK (     DMA2_Stream3_IRQHandler           )// DMA2 Stream 3                                   
		WEAK (     DMA2_Stream4_IRQHandler           )// DMA2 Stream 4                                   
		WEAK (     OTG_FS_IRQHandler                 )// USB OTG FS                                      
		WEAK (     DMA2_Stream5_IRQHandler           )// DMA2 Stream 5                                   
		WEAK (     DMA2_Stream6_IRQHandler           )// DMA2 Stream 6                                   
		WEAK (     DMA2_Stream7_IRQHandler           )// DMA2 Stream 7                                   
		WEAK (     USART6_IRQHandler                 )// USART6                                           
		WEAK (     I2C3_EV_IRQHandler                )// I2C3 event                                             
		WEAK (     I2C3_ER_IRQHandler                )// I2C3 error                                             
		WEAK (     FPU_IRQHandler                    )// FPU                          
		WEAK (     SPI4_IRQHandler                   )// SPI4                         
		WEAK (     SPI5_IRQHandler                   )// SPI5                           

		WEAK (     WDTBOD_IRQHandler        )// 16 0  WWDT                                     
		WEAK (     DMA_IRQHandler           )// 17 1  DMA                                      
		WEAK (     GINT0_IRQHandler         )// 18 2  GINT0                                    
		WEAK (     GINT1_IRQHandler         )// 19 3  GINT1                                    
		WEAK (     PIN_INT0_IRQHandler      )// 20 4  PININT0                                  
		WEAK (     PIN_INT1_IRQHandler      )// 21 5  PININT1                                  
		WEAK (     PIN_INT2_IRQHandler      )// 22 6  PININT2                                  
		WEAK (     PIN_INT3_IRQHandler      )// 23 7  PININT3                                  
		WEAK (     UTICK_IRQHandler         )// 24 8  Micro-tick Timer interrupt               
		WEAK (     MRT_IRQHandler           )// 25 9  Multi-rate timer interrupt               
		WEAK (     CT32B0_IRQHandler        )// 26 10 CTMR0                                    
		WEAK (     CT32B1_IRQHandler        )// 27 11 CTMR1                                    
		WEAK (     SCT0_IRQHandler          )// 28 12 SCT                                      
		WEAK (     CT32B3_IRQHandler        )// 29 13 CTMR3                                    
		WEAK (     FLEXCOMM0_IRQHandler     )// 30 14 FLEXCOMM0                                
		WEAK (     FLEXCOMM1_IRQHandler     )// 31 15 FLEXCOMM1                                
		WEAK (     FLEXCOMM2_IRQHandler     )// 32 16 FLEXCOMM2                                
		WEAK (     FLEXCOMM3_IRQHandler     )// 33 17 FLEXCOMM3                                
		WEAK (     FLEXCOMM4_IRQHandler     )// 34 18 FLEXCOMM4                                
		WEAK (     FLEXCOMM5_IRQHandler     )// 35 19 FLEXCOMM5                                
		WEAK (     FLEXCOMM6_IRQHandler     )// 36 20 FLEXCOMM6                                
		WEAK (     FLEXCOMM7_IRQHandler     )// 37 21 FLEXCOMM7                                
		WEAK (     ADC_SEQA_IRQHandler      )// 38 22 ADC0 sequence A completion               
		WEAK (     ADC_SEQB_IRQHandler      )// 39 23 ADC0 sequence B completion               
		WEAK (     ADC_THCMP_IRQHandler     )// 40 24 ADC0 threshold compare and error         
		WEAK (     DMIC_IRQHandler          )// 41 25 Digital Mic                              
		WEAK (     HWVAD_IRQHandler         )// 42 26 Hardware Voice acitivity detect          
		WEAK (     USB0ACT_IRQHandler       )// 43 27 USB Activity                             
		WEAK (     USB0_IRQHandler          )// 44 28 USB                                      
		WEAK (     RTC_IRQHandler           )// 45 29 RTC alarm and wake-up interrupts         
		WEAK (     WAKEUP_IRQHandler        )// 47 31 FIXME: what is wakeup (is this reserved?)
		WEAK (     PIN_INT4_IRQHandler      )// 48 32 External Interrupt 4                     
		WEAK (     PIN_INT5_IRQHandler      )// 49 33 External Interrupt 5                     
		WEAK (     PIN_INT6_IRQHandler      )// 50 34 External Interrupt 6                     
		WEAK (     PIN_INT7_IRQHandler      )// 51 35 External Interrupt 7                     
		WEAK (     CT32B2_IRQHandler        )// 52 36 CTMR2                                    
		WEAK (     CT32B4_IRQHandler        )// 53 37 CTMR4                                    
		WEAK (     RITIMER_IRQHandler       )// 54 38 OSTIMER Interrupt                        
		WEAK (     SPIFI_IRQHandler         )// 55 39 SPI Flash interface                      
		WEAK (     FLEXCOMM8_IRQHandler     )// 56 40 Flexcomm8 interrupt                      
		WEAK (     FLEXCOMM9_IRQHandler     )// 57 41 Flexcomm9 interrupt                      
		WEAK (     SDIO_IRQHandler          )// 58 42 SDIO Interrupt                           
		WEAK (     CAN0_0_IRQHandler        )// 59 43 CAN0 Interrupt0                          
		WEAK (     CAN0_1_IRQHandler        )// 60 44 CAN0 Interrupt1                          
		WEAK (     USB1_IRQHandler          )// 63 47 USB1 Interrupt                           
		WEAK (     USB1ACT_IRQHandler       )// 64 48 USB1 Activity interrupt                  
		WEAK (     ETH_IRQHandler           )// 65 49 Ethernet Interrupt handler               
		WEAK (     ETH_PMT_IRQHandler       )// 66 50 FIXME: What is this (?)                  
		WEAK (     ETH_MACLP_IRQHandler     )// 67 51 FIXME: Check what this is!               
		WEAK (     EEPROM_IRQHandler        )// 68 52 EEPROM Interrupt                         
		WEAK (     LCD_IRQHandler           )// 69 53 LCD Controller Interrupt                 
		WEAK (     SHA_IRQHandler           )// 70 54 Hash engine interrupt                    
		WEAK (     SMARTCARD0_IRQHandler    )// 71 55 Smart card-0 interrupt                   
		WEAK (     SMARTCARD1_IRQHandler    )// 72 56 Smart card-1 interrupt                   
		WEAK (     I2C1_IRQn                )                  
		WEAK (     UART1_4_IRQn				)
		WEAK (     UART2_3_IRQn				)
		WEAK (     SCT0_1_IRQn 				)
		WEAK (     DMA_IRQn  				)
		WEAK (     ADC_B_IRQn				)
        									
		THUMBCODE
LABEL( SysTick_Handler     )

		THUMBCODE
LABEL (I2C1_IRQn      )               
		THUMBCODE
LABEL (UART1_4_IRQn	)
		THUMBCODE
LABEL (UART2_3_IRQn	)
		THUMBCODE
LABEL (SCT0_1_IRQn 	)
		THUMBCODE
LABEL (DMA_IRQn  		)
		THUMBCODE
LABEL (ADC_B_IRQn		)
		THUMBCODE
LABEL (OSTIMER_IRQHandler   )
		THUMBCODE
LABEL (PVT0_A_IRQHandler    )                         
		THUMBCODE
LABEL (PVT0_R_IRQHandler    )     
		THUMBCODE
LABEL (PVT1_A_IRQHandler    )                         
		THUMBCODE
LABEL (PVT1_R_IRQHandler    )
		THUMBCODE
LABEL( EZH_IRQHandler)		
		THUMBCODE
LABEL( MBOX_IRQHandler)
		THUMBCODE
LABEL( ADC_THCMP_OVR_IRQHandler )
		THUMBCODE
LABEL( UTICK_IRQHandler			)
		THUMBCODE
LABEL( USB_IRQHandler           )          
		THUMBCODE
LABEL( USB_FIQHandler           )           
		THUMBCODE
LABEL( USBWakeup_IRQHandler     )          
		THUMBCODE
LABEL( ADC0_SEQA_IRQHandler     )           
		THUMBCODE
LABEL( ADC0_SEQB_IRQHandler     )          
		THUMBCODE
LABEL( ADC0_THCMP_IRQHandler    )          
		THUMBCODE
LABEL( ADC0_OVR_IRQHandler      )          
		THUMBCODE
LABEL( ADC1_SEQA_IRQHandler     )          
		THUMBCODE
LABEL( ADC1_SEQB_IRQHandler     )         
		THUMBCODE
LABEL( ADC1_THCMP_IRQHandler    )          
		THUMBCODE
LABEL( ADC1_OVR_IRQHandler      )           
		THUMBCODE
LABEL( WDT_IRQHandler           )
		THUMBCODE
LABEL( TIMER0_IRQHandler        )
		THUMBCODE
LABEL( TIMER1_IRQHandler        )
		THUMBCODE
LABEL( TIMER2_IRQHandler        )
		THUMBCODE
LABEL( TIMER3_IRQHandler        )
		THUMBCODE
LABEL( TIMER4_IRQHandler        )
		THUMBCODE
LABEL( UART0_IRQHandler         )
		THUMBCODE
LABEL( UART1_IRQHandler         )
		THUMBCODE
LABEL( UART2_IRQHandler         )
		THUMBCODE
LABEL( UART3_IRQHandler         )
		THUMBCODE
LABEL( PWM1_IRQHandler          )
		THUMBCODE
LABEL( I2C0_IRQHandler          )
		THUMBCODE
LABEL( I2C1_IRQHandler          )
		THUMBCODE
LABEL( I2C2_IRQHandler          )
		THUMBCODE
LABEL( SPIFI_IRQHandler         )  
		THUMBCODE
LABEL( SSP0_IRQHandler          )
		THUMBCODE
LABEL( SSP1_IRQHandler          )
		THUMBCODE
LABEL( PLL0_IRQHandler          )
		THUMBCODE
LABEL( RTC_IRQHandler           )
		THUMBCODE
LABEL( RTCALARM_IRQHandler      )
		THUMBCODE
LABEL( RTCWAKE_IRQHandler       )
		THUMBCODE
LABEL( EINT0_IRQHandler         )
		THUMBCODE
LABEL( EINT1_IRQHandler         )
		THUMBCODE
LABEL( EINT2_IRQHandler         )
		THUMBCODE
LABEL( EINT3_IRQHandler         )
		THUMBCODE
LABEL( ADC_IRQHandler           )
		THUMBCODE
LABEL( BOD_IRQHandler           )
		THUMBCODE
LABEL( CAN_IRQHandler           )
		THUMBCODE
LABEL( DMA_IRQHandler           )
		THUMBCODE
LABEL( I2S_IRQHandler           )
		THUMBCODE
LABEL( ENET_IRQHandler          )
		THUMBCODE
LABEL( MCI_IRQHandler           )
		THUMBCODE
LABEL( MCPWM_IRQHandler         )   
		THUMBCODE
LABEL( QEI_IRQHandler           )
		THUMBCODE
LABEL( PLL1_IRQHandler          )
		THUMBCODE
LABEL( USBActivity_IRQHandler   )
		THUMBCODE
LABEL( CANActivity_IRQHandler   )
		THUMBCODE
LABEL( UART4_IRQHandler         )
		THUMBCODE
LABEL( SSP2_IRQHandler          )
		THUMBCODE
LABEL( LCD_IRQHandler           )
		THUMBCODE
LABEL( GPIO_IRQHandler          )
		THUMBCODE
LABEL( PWM0_IRQHandler          )
		THUMBCODE
LABEL( KFLASH_IRQHandler        )
		THUMBCODE
LABEL( FLASH_IRQHandler         )
		THUMBCODE
LABEL( M0a_IRQHandler           )
		THUMBCODE
LABEL( CMP0_IRQHandler          )
		THUMBCODE
LABEL( CMP1_IRQHandler          )
		THUMBCODE
LABEL( CMP2_IRQHandler          )
		THUMBCODE
LABEL( CMP3_IRQHandler          )
		THUMBCODE
LABEL( EEPROM_IRQHandler        )
		THUMBCODE
LABEL( DAC_IRQHandler           )
		THUMBCODE
LABEL( CAN0_IRQHandler          )
		THUMBCODE
LABEL( CAN1_IRQHandler          )
		THUMBCODE
LABEL( GPIO0_IRQHandler         )
		THUMBCODE
LABEL( GPIO1_IRQHandler         )
		THUMBCODE
LABEL( GPIO2_IRQHandler         )
		THUMBCODE
LABEL( GPIO3_IRQHandler         )
		THUMBCODE
LABEL( GPIO4_IRQHandler         )
		THUMBCODE
LABEL( GPIO5_IRQHandler         )
		THUMBCODE
LABEL( GPIO6_IRQHandler         )
		THUMBCODE
LABEL( GPIO7_IRQHandler         )
		THUMBCODE
LABEL( GINT0_IRQHandler         )
		THUMBCODE
LABEL( GINT1_IRQHandler         )
		THUMBCODE
LABEL( VADC_IRQHandler          )
		THUMBCODE
LABEL( ADC0_IRQHandler          )
		THUMBCODE
LABEL( ADC1_IRQHandler          )
		THUMBCODE
LABEL( SDIO_IRQHandler          )
		THUMBCODE
LABEL( USB0_IRQHandler          )
		THUMBCODE
LABEL( USB1_IRQHandler          )
		THUMBCODE
LABEL( SCT_IRQHandler           )
		THUMBCODE
LABEL( SCT0_IRQHandler          )
		THUMBCODE
LABEL( SCT1_IRQHandler          )
		THUMBCODE
LABEL( SCT2_IRQHandler          )
		THUMBCODE
LABEL( SCT3_IRQHandler          )
		THUMBCODE
LABEL( SPI_IRQHandler           )
		THUMBCODE
LABEL( I2S0_IRQHandler          )
		THUMBCODE
LABEL( I2S1_IRQHandler          )
		THUMBCODE
LABEL( SGPIO_IRQHandler         )
		THUMBCODE
LABEL( EVRT_IRQHandler          )
		THUMBCODE
LABEL( ATIMER_IRQHandler        )

		THUMBCODE
LABEL( DMA_CH0_IRQHandler       )
		THUMBCODE
LABEL( DMA_CH1_IRQHandler       )
		THUMBCODE
LABEL( DMA_CH2_IRQHandler       )
		THUMBCODE
LABEL( DMA_CH3_IRQHandler       )
		THUMBCODE
LABEL( DMA_ERROR_IRQHandler     )
		THUMBCODE
LABEL( UNUSED_IRQHandler        )
		THUMBCODE
LABEL( FLASH_CMD_IRQHandler     )
		THUMBCODE
LABEL( FLASH_ERROR_IRQHandler   )
		THUMBCODE
LABEL( LOW_VOLTAGE_IRQHandler   )
		THUMBCODE
LABEL( WAKEUP_IRQHandler        )
		THUMBCODE
LABEL( WATCHDOG_IRQHandler      )
		THUMBCODE
LABEL( SPI0_IRQHandler          )
		THUMBCODE
LABEL( SPI1_IRQHandler          )
		THUMBCODE
LABEL( SPI2_IRQHandler          )
		THUMBCODE
LABEL( SPI3_IRQHandler          )
		THUMBCODE
LABEL( I2S0_TX_IRQHandler       )
		THUMBCODE
LABEL( I2S0_RX_IRQHandler       )
		THUMBCODE
LABEL( UART0_LON_IRQHandler     )
		THUMBCODE
LABEL( UART0_STATUS_IRQHandler  )
		THUMBCODE
LABEL( UART0_ERROR_IRQHandler   )
		THUMBCODE
LABEL( UART1_STATUS_IRQHandler  )
		THUMBCODE
LABEL( UART1_ERROR_IRQHandler   )
		THUMBCODE
LABEL( UART2_STATUS_IRQHandler  )
		THUMBCODE
LABEL( UART2_ERROR_IRQHandler   )
		THUMBCODE
LABEL( FTM0_IRQHandler          )
		THUMBCODE
LABEL( FTM1_IRQHandler          )
		THUMBCODE
LABEL( CMT_IRQHandler           )
		THUMBCODE
LABEL( RTC_ALARM_IRQHandler     )
		THUMBCODE
LABEL( RTC_SECONDS_IRQHandler   )
		THUMBCODE
LABEL( PIT0_IRQHandler          )
		THUMBCODE
LABEL( PIT1_IRQHandler          )
		THUMBCODE
LABEL( PIT2_IRQHandler          )
		THUMBCODE
LABEL( PIT3_IRQHandler          )
		THUMBCODE
LABEL( PDB_IRQHandler           )
		THUMBCODE
LABEL( USB_CHARGE_IRQHandler    )
		THUMBCODE
LABEL( TSI0_IRQHandler          )
		THUMBCODE
LABEL( MCG_IRQHandler           )
		THUMBCODE
LABEL( LPTMR_IRQHandler         )
		THUMBCODE
LABEL( PORTA_IRQHandler         )
		THUMBCODE
LABEL( PORTB_IRQHandler         )
		THUMBCODE
LABEL( PORTC_IRQHandler         )
		THUMBCODE
LABEL( PORTD_IRQHandler         )
		THUMBCODE
LABEL( PORTE_IRQHandler         )
		THUMBCODE
LABEL( SOFTWARE_IRQHandler      )

		THUMBCODE
LABEL( DMA_CH4_IRQHandler       )
		THUMBCODE
LABEL( DMA_CH5_IRQHandler       )
		THUMBCODE
LABEL( DMA_CH6_IRQHandler       )
		THUMBCODE
LABEL( DMA_CH7_IRQHandler       )
		THUMBCODE
LABEL( DMA_CH8_IRQHandler       )
		THUMBCODE
LABEL( DMA_CH9_IRQHandler       )
		THUMBCODE
LABEL( DMA_CH10_IRQHandler      )
		THUMBCODE
LABEL( DMA_CH11_IRQHandler      )
		THUMBCODE
LABEL( DMA_CH12_IRQHandler      )
		THUMBCODE
LABEL( DMA_CH13_IRQHandler      )
		THUMBCODE
LABEL( DMA_CH14_IRQHandler      )
		THUMBCODE
LABEL( DMA_CH15_IRQHandler      )
		THUMBCODE
LABEL( UART3_STATUS_IRQHandler  )
		THUMBCODE
LABEL( UART3_ERROR_IRQHandler   )
		THUMBCODE
LABEL( UART4_STATUS_IRQHandler  )
		THUMBCODE
LABEL( UART4_ERROR_IRQHandler   )
		THUMBCODE
LABEL( FTM2_IRQHandler          )
		THUMBCODE
LABEL( MCM_IRQHandler           )
		THUMBCODE
LABEL( LVD_LVW_IRQHandler       )
		THUMBCODE
LABEL( LLW_IRQHandler           )
		THUMBCODE
LABEL( CAN0_ORD_MESSAGE_IRQHandler)
		THUMBCODE
LABEL( CAN0_BUS_OFF_IRQHandler  )
		THUMBCODE
LABEL( CAN0_ERROR_IRQHandler    )
		THUMBCODE
LABEL( CAN0_TX_WARNING_IRQHandler)
		THUMBCODE
LABEL( CAN0_RX_WARNING_IRQHandler)
		THUMBCODE
LABEL( CAN0_WAKE_UP_IRQHandler  )
		THUMBCODE
LABEL( USBDCD_IRQHandler        )
		THUMBCODE
LABEL( DAC0_IRQHandler          )
		THUMBCODE
LABEL( I2C_IRQHandler           )
		THUMBCODE
LABEL( MRT_IRQHandler           )
		THUMBCODE
LABEL( CMP_IRQHandler           )
		THUMBCODE
LABEL( WKT_IRQHandler           )
		THUMBCODE
LABEL( PININT0_IRQHandler       )
		THUMBCODE
LABEL( PININT1_IRQHandler       )
		THUMBCODE
LABEL( PININT2_IRQHandler       )
		THUMBCODE
LABEL( PININT3_IRQHandler       )
		THUMBCODE
LABEL( PININT4_IRQHandler       )
		THUMBCODE
LABEL( PININT5_IRQHandler       )
		THUMBCODE
LABEL( PININT6_IRQHandler       )
		THUMBCODE
LABEL( PININT7_IRQHandler       )
		THUMBCODE
LABEL( RIT_IRQHandler           )
    	bl 		IntDefaultHandler			//lr set back in crash routine -- to 0xfffffff9  indicates fault -- bte 2017
                	
		THUMBCODE
LABEL(IntDefaultHandler)
        			b		.			
					

