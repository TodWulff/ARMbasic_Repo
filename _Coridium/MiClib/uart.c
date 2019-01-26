
//////////////////////////////////////////////////////

// UART stuff

// modfications by Coridium Corp 2011 

//#define UART_NO_INTERRUPT	// use this during debug

#include "uart.h"

////////////////////////////////////////////////////////////////////////////////
//
// buffers and pointers for UARTs
//
// finally define them here



int 	uart0_rx_insert_idx, uart0_rx_extract_idx, uart0_tx_insert_idx, uart0_tx_extract_idx;
char uart0_rx_buffer[UART_RX_BUFFER_SIZE];
char uart0_tx_buffer[UART_TX_BUFFER_SIZE];
#ifdef LPC_UART1
int 	uart1_rx_insert_idx, uart1_rx_extract_idx, uart1_tx_insert_idx, uart1_tx_extract_idx;
char uart1_rx_buffer[UART_RX_BUFFER_SIZE];
char uart1_tx_buffer[UART_TX_BUFFER_SIZE];
#endif  			
#ifdef LPC_UART2
int 	uart2_rx_insert_idx, uart2_rx_extract_idx, uart2_tx_insert_idx, uart2_tx_extract_idx;
char uart2_rx_buffer[UART_RX_BUFFER_SIZE];
char uart2_tx_buffer[UART_TX_BUFFER_SIZE];
#endif  			
#ifdef LPC_UART3
int 	uart3_rx_insert_idx, uart3_rx_extract_idx, uart3_tx_insert_idx, uart3_tx_extract_idx;
char uart3_rx_buffer[UART_RX_BUFFER_SIZE];
char uart3_tx_buffer[UART_TX_BUFFER_SIZE];
#endif  			
#ifdef LPC_UART4
int 	uart4_rx_insert_idx, uart4_rx_extract_idx, uart4_tx_insert_idx, uart4_tx_extract_idx;
char uart4_rx_buffer[UART_RX_BUFFER_SIZE];
char uart4_tx_buffer[UART_TX_BUFFER_SIZE];
#endif  			


/*
  * @brief       Initializes the UARTx peripheral.
  * @param    UARTx   UART peripheral selected, should be LPC_UART0, LPC_UART1.
  * @return     None
  */
void UART_init(int uartNUM, int baud) {

	LPC_UART_TypeDef      *UARTX;
  #ifndef MIN_UART
	int clk_div;					// set to the PCLK value of the UART
  #endif

  #if defined LPC11U35 || defined LPC11U37 || (defined LPC11U67) || (defined LPC11U68)
  	if(uartNUM == 1) uartNUM = 0; // LPC11U37 UART1 becomes physical UART0
  #endif

	switch(uartNUM) {
		case 0:
  #if defined LPC4330m0 || defined LPC54102m0
    		// do nothing the M4 already set it up
    		return;
  #else    		
			UARTX = (LPC_UART_TypeDef *)LPC_UART0;
			uart0_rx_insert_idx = uart0_rx_extract_idx = uart0_tx_insert_idx = uart0_tx_extract_idx = 0;
  #endif			
  #if defined LPC1751 || defined LPC1756 || defined LPC1768				// TXD0 = P0.2  RXD0 = P03
			LPC_PINCON->PINSEL0 = (LPC_PINCON->PINSEL0 & ~0xF0) | 0x00000050;       // RxD0 and TxD0
			clk_div = ((LPC_SC->PCLKSEL0>>6)&3)==0 ? 4 : (((LPC_SC->PCLKSEL0>>6)&3)==3 ? 8 : (LPC_SC->PCLKSEL0>>6)&3) ;	
  #elif defined LPC407x             //TXD0 P0_2=1 RXD0 P0_3=1
  			LPC_IOCON->P0_2 = 1;
  			LPC_IOCON->P0_3 = 1;
			clk_div = LPC_SC->PCLKSEL & 0x1f;
  #elif defined OTEST
  			LPC_SCU->SFSP0_15 = 1;
  			LPC_SCU->SFSP0_16 = 0x41;
  #elif defined LPC4330 || defined LPC4337 || defined LPC1850            //TXD0 P0_2=1 RXD0 P0_3=1
			LPC_CGU->BASE_USART0_CLK = 6<<24;	// 12 MHz oscillator
 			LPC_CCU1->CLK_M4_USART0_CFG = 1;
 			LPC_SCU->SFSP2_0 = 0x41;
  			LPC_SCU->SFSP2_1 = 0x41;
  			clk_div = 1;
  #elif defined LPC178x				// TXD0 = P0.2  RXD0 = P03
  			LPC_IOCON->P0_2 = 1;
  			LPC_IOCON->P0_3 = 1;
			clk_div = LPC_SC->PCLKSEL & 0x1f;	
  #elif defined LPC54102				// TXD0 = P0.1  RXD0 = P0.0
  			LPC_ASYNC_SYSCTL->ASYNCVPBCLKCTRLSET = 1<<1;		// enable UART clocks
  			LPC_ASYNC_SYSCTL->ASYNCPRESETCTRLSET = 1<<1;		// reset to UART (probably redundant)
  			LPC_ASYNC_SYSCTL->ASYNCPRESETCTRLCLR = 1<<1;		// disable reset to UART (probably redundant)
  			LPC_IOCON->PIO[0][1] = 0x181;
  			LPC_IOCON->PIO[0][0] = 0x181;
			NVIC->ISER[0] = 1 << UART0_IRQn;// enable interrupt UART0
  #elif defined LPC15xx			
			LPC_SWM->PINASSIGN0 = 0xFFFF0D12;		// enable RXD0, TXD0	-- 64pin device
//			LPC_SWM->PINASSIGN0 = 0xFFFF4746;		// enable RXD0, TXD0	-- 100pin device Oscar2 test PCB
			NVIC->ISER[0] = 1 << UART0_IRQn;// enable interrupt UART0
  #elif defined LPC12xx			
			LPC_IOCON->PIO0_2 = 2;		// enable RXD0
			LPC_IOCON->PIO0_1 = 2;		// enable TXD0
			NVIC->ISER[0] = 1 << UART0_IRQn;// enable interrupt UART0
			clk_div = LPC_SYSCON->UART0CLKDIV;

  #elif defined LPC11U35 || defined LPC11U37 || (defined LPC11U67) || (defined LPC11U68)
		// USB is initialized elsewhere
		// OK yes removing this does make it hang during programming -- BTE ????
			LPC_IOCON->PIO0_18 = 1;		// enable RXD0
			LPC_IOCON->PIO0_19 = 1;		// enable TXD0
   			//LPC_IOCON->PIO1_26 = 2;		// enable RXD1 -- alternate pins
   			//LPC_IOCON->PIO1_27 = 2;		// enable TXD1
			clk_div = LPC_SYSCON->UARTCLKDIV & 0xff;	
			// in SystemInit LPC_SYSCON->SYSAHBCLKCTRL |= (1<<12); //turn on the UART clock

  #elif defined LPC111x
  	#ifdef LPC1168
		#warning *********** WARNING HACK FOR LPC1168 *******************************  
			LPC_IOCON->PIO0_6 = 0x91;		// enable RXD0 -- LPC1168  -- port # differs from 1114
			LPC_IOCON->PIO3_5 = 0x91;		// enable TXD0 -- LPC1168
	#else			
			LPC_IOCON->PIO1_6 = 1;		// enable RXD0
			LPC_IOCON->PIO1_7 = 1;		// enable TXD0
			NVIC->ISER[0] = 1 << UART0_IRQn;// enable interrupt UART0
	#endif
			clk_div = LPC_SYSCON->UARTCLKDIV & 0xff;	
			LPC_SYSCON->SYSAHBCLKCTRL |= (1<<12); //turn on the UART clock
  #elif defined LPC21xx
			PCB_PINSEL0 = (PCB_PINSEL0 & ~0xF) | 0x5;  // enable TXD0, RXD0
			clk_div = (SCB_APBDIV&3)==0 ? 4 : (SCB_APBDIV&3);
  #elif defined LPC802 || defined LPC812 || defined LPC824
			LPC_SYSCON->SYSAHBCLKCTRL |= (1<<14);//turn on the UART clock
			LPC_SYSCON->PRESETCTRL &= ~(0x1<<3); //reset the UART
			LPC_SYSCON->PRESETCTRL |= (0x1<<3);
			LPC_SWM->PINASSIGN0 &= ~( 0xFF << 0 );
			LPC_SWM->PINASSIGN0 |= ( 4 << 0 );				// P0.4 is UART0 TXD, ASSIGN0(7:0)
			LPC_SWM->PINASSIGN0 &= ~( 0xFF << 8 );
			//LPC_SWM->PINASSIGN0 |= ( 0 << 8 );				// P0.0 is UART0 RXD. ASSIGN0(15:8)
			NVIC->ISER[0] = 1 << UART0_IRQn;// enable interrupt UART0
			//clk_div = LPC_SYSCON->UARTCLKDIV & 0xff;
  #else
    #error   Unknown CPU type in UART_Init
  #endif  			
			break;
 #ifdef LPC_UART1			
		case 1:
			UARTX = (LPC_UART_TypeDef *)LPC_UART1; //M3 regs are at 0x4000C000 and 0x40010000
			uart1_rx_insert_idx = uart1_rx_extract_idx = uart1_tx_insert_idx = uart1_tx_extract_idx = 0;
  #if defined LPC1751 || defined LPC1756 || defined LPC1768				// TXD1 = P2.0  RXD1 = P2.1
			LPC_PINCON->PINSEL4 = (LPC_PINCON->PINSEL4 & ~0xF) | 0x0000000A;       // RxD1 and TxD1  P2.0, P2.1
			clk_div = ((LPC_SC->PCLKSEL0>>8)&3)==0 ? 4 : (((LPC_SC->PCLKSEL0>>8)&3)==3 ? 8 : (LPC_SC->PCLKSEL0>>8)&3) ;	
			NVIC->ISER[0] = 1 << UART1_IRQn;// enable interrupt UART1
  #elif defined LPC407x //TXD1 P2_0=2 RXD1 P2_1=2
  			LPC_IOCON->P2_0 = 2;
  			LPC_IOCON->P2_1 = 2;
			clk_div = LPC_SC->PCLKSEL & 0x1f;
			LPC_SC->PCONP |= 1<<4;				 // turn it on
			NVIC->ISER[0] = 1 << UART1_IRQn;// enable interrupt UART1
  #elif defined LPC4330 || defined LPC4337 || defined LPC1850             //TXD0 P1_13=1 RXD0 P1_14=1
			LPC_CGU->BASE_USART1_CLK = 6<<24;	// 12 MHz oscillator
			LPC_CCU1->CLK_M4_USART1_CFG = 1;
 			LPC_SCU->SFSP1_13 = 0x41;
  			LPC_SCU->SFSP1_14 = 0x41;
  			clk_div = 1;
  #elif defined LPC178x				
			clk_div = LPC_SC->PCLKSEL & 0x1f;	
     #warning -- need uart def for 177x UART1
  #elif defined LPC54102				// TXD1 = P0.6  RXD1 = P0.5
			LPC_ASYNC_SYSCTL->ASYNCVPBCLKCTRLSET = 1<<2;		// enable UART clocks
			LPC_ASYNC_SYSCTL->ASYNCPRESETCTRLSET = 1<<2;		// reset to UART (probably redundant)
			LPC_ASYNC_SYSCTL->ASYNCPRESETCTRLCLR = 1<<2;		// disable reset to UART (probably redundant)
			LPC_IOCON->PIO[0][6] = 0x181;
			LPC_IOCON->PIO[0][5] = 0x181;
			NVIC->ISER[0] = 1 << UART1_IRQn;// enable interrupt UART1
  #elif defined LPC12xx			
			LPC_IOCON->PIO2_12 = 3;		// enable RXD1
			LPC_IOCON->PIO2_13 = 3;		// enable TXD1
			clk_div = LPC_SYSCON->UART1CLKDIV;
			NVIC->ISER[0] = 1 << UART1_IRQn;// enable interrupt UART1
  #elif defined LPC21xx
			PCB_PINSEL0 = (PCB_PINSEL0 & ~0xF0000) | 0x50000;  // enable TXD1, RXD1
			clk_div = (SCB_APBDIV&3)==0 ? 4 : (SCB_APBDIV&3);
  #elif defined LPC802 || defined LPC812 || defined LPC824
			LPC_SYSCON->SYSAHBCLKCTRL |= (1<<15);//turn on the UART clock
			LPC_SYSCON->PRESETCTRL &= ~(0x1<<4); //reset the UART
			LPC_SYSCON->PRESETCTRL |= (0x1<<4);
			//LPC_SWM->PINASSIGN1 &= ~( 0xFF << 16 );
			//LPC_SWM->PINASSIGN1 |= ( 9 << 16 );				// PIO0_9 pin 13 U1_RXD ASSIGN1(23:16)
			//LPC_SWM->PINASSIGN1 &= ~( 0xFF << 8 );
			//LPC_SWM->PINASSIGN1 |= ( 8 << 8 );				// PIO0_8 pin 14  U1_TXD ASSIGN1(15:8)
			LPC_SWM->PINASSIGN1 = 0xFF0908FF;
			NVIC->ISER[0] = 1 << UART1_IRQn;// enable interrupt UART1
			//clk_div = LPC_SYSCON->UARTCLKDIV & 0xff;
  #elif defined LPC15xx			
			LPC_SYSCON->SYSAHBCLKCTRL1 |= (EN1_UART1);
			LPC_SWM->PINASSIGN1 = 0xFF0100FF;		// enable RXD1 = p0.1, TXD0 = p0.0	-- 64pin device
  #elif defined LPC11U67 || defined LPC11U68
  	//GET THIS
	
  #else
    #error   Unknown CPU type in UART_Init
  #endif  			
			break;
 #endif			
 #ifdef LPC_UART2	
		case 2:
			UARTX = (LPC_UART_TypeDef *)LPC_UART2; //M3 regs are at 0x4000C000 and 0x40010000
			uart2_rx_insert_idx = uart2_rx_extract_idx = uart2_tx_insert_idx = uart2_tx_extract_idx = 0;
  #if defined LPC1751 || defined LPC1756 || defined LPC1768				// TXD2 = P2.8  RXD2 = P2.9
			LPC_SC->PCONP |= 1<<24;				 // turn it on
			LPC_PINCON->PINSEL4 = (LPC_PINCON->PINSEL4 & ~0xF0000) | 0x000A0000;       // on P2 pin 8 and 9
			clk_div = ((LPC_SC->PCLKSEL1>>16)&3)==0 ? 4 : (((LPC_SC->PCLKSEL1>>16)&3)==3 ? 8 : (LPC_SC->PCLKSEL1>>16)&3) ;	
			NVIC->ISER[0] = 1 << UART2_IRQn;// enable interrupt UART2
  #elif defined LPC407x //TXD2 P2_8=2 RXD2 P2_9=2
  			LPC_IOCON->P2_8 = 2;
  			LPC_IOCON->P2_9 = 2;
			clk_div = LPC_SC->PCLKSEL & 0x1f;
			LPC_SC->PCONP |= 1<<24;				 // turn it on
			NVIC->ISER[0] = 1 << UART2_IRQn;// enable interrupt UART2
  #elif defined LPC4330 || defined LPC4337 || defined LPC1850             //TXD0 P0_2=1 RXD0 P0_3=1
			LPC_CGU->BASE_USART2_CLK = 6<<24;	// 12 MHz oscillator
			LPC_CCU1->CLK_M4_USART2_CFG = 1;
 			LPC_SCU->SFSP1_15 = 0x41;
  			LPC_SCU->SFSP1_16 = 0x41;
  			clk_div = 1;
  #elif defined LPC54102				// TXD2 = P0.9  RXD2 = P0.8
			LPC_ASYNC_SYSCTL->ASYNCVPBCLKCTRLSET = 1<<3;		// enable UART clocks
			LPC_ASYNC_SYSCTL->ASYNCPRESETCTRLSET = 1<<3;		// reset to UART (probably redundant)
			LPC_ASYNC_SYSCTL->ASYNCPRESETCTRLCLR = 1<<3;		// disable reset to UART (probably redundant)
			LPC_IOCON->PIO[0][9] = 0x181;
			LPC_IOCON->PIO[0][8] = 0x181;
			NVIC->ISER[0] = 1 << UART2_IRQn;// enable interrupt UART2
  #elif defined LPC178x				
			clk_div = LPC_SC->PCLKSEL ;	
     #warning -- need uart def for 177x UART1
  #elif defined LPC15xx			
  	#warning -- IOs not set for UART2
  #elif defined LPC11U67 || defined LPC11U68
  	//GET THIS
  #else
    #error   Unknown CPU type in UART_Init
  #endif  			
			break;
 #endif			
 
 #ifdef LPC_UART3	
		case 3:
			UARTX = (LPC_UART_TypeDef *)LPC_UART3; //M3 regs are at 0x4000C000 and 0x40010000
			uart3_rx_insert_idx = uart3_rx_extract_idx = uart3_tx_insert_idx = uart3_tx_extract_idx = 0;
  #if defined LPC1751 || LPC1756 || defined LPC1768				// TXD3 = P4.28  RXD3 = P4.29
			LPC_SC->PCONP |= 1<<25;				 // turn it on
			LPC_PINCON->PINSEL9 = (LPC_PINCON->PINSEL9 & ~0x0F000000) | 0x0F000000;       // on P4 pin 28 and 29
			clk_div = ((LPC_SC->PCLKSEL1>>18)&3)==0 ? 4 : (((LPC_SC->PCLKSEL1>>18)&3)==3 ? 8 : (LPC_SC->PCLKSEL1>>18)&3) ;	
			NVIC->ISER[0] = 1 << UART3_IRQn;// enable interrupt UART3
  #elif defined LPC4074 //TXD3 ADPIN P0_25=3 RXD3 ADPIN P0_26=3
  			LPC_IOCON->P4_28 = 2;
  			LPC_IOCON->P4_29 = 2;
			clk_div = LPC_SC->PCLKSEL & 0x1f;
			LPC_SC->PCONP |= 1<<25;				 // turn it on
			NVIC->ISER[0] = 1 << UART3_IRQn;// enable interrupt UART3
  #elif defined LPC407x //TXD3 ADPIN P0_25=3 RXD3 ADPIN P0_26=3
  			LPC_IOCON->P0_25 = 3;
  			LPC_IOCON->P0_26 = 3;
			clk_div = LPC_SC->PCLKSEL & 0x1f;
			LPC_SC->PCONP |= 1<<25;				 // turn it on
			NVIC->ISER[0] = 1 << UART3_IRQn;// enable interrupt UART3
  #elif defined LPC4330 || defined LPC4337  || defined LPC1850            //TXD0 P0_2=1 RXD0 P0_3=1
			LPC_CGU->BASE_USART3_CLK = 6<<24;	// 12 MHz oscillator
			LPC_CCU1->CLK_M4_USART3_CFG = 1;
 			LPC_SCU->SFSP2_3 = 0x42;
  			LPC_SCU->SFSP2_4 = 0x42;
  			clk_div = 1;
  #elif defined LPC54102				// TXD3 = P1.13  RXD3 = P1.12
			LPC_ASYNC_SYSCTL->ASYNCVPBCLKCTRLSET = 1<<4;		// enable UART clocks
			LPC_ASYNC_SYSCTL->ASYNCPRESETCTRLSET = 1<<4;		// reset to UART (probably redundant)
			LPC_ASYNC_SYSCTL->ASYNCPRESETCTRLCLR = 1<<4;		// disable reset to UART (probably redundant)
			LPC_IOCON->PIO[1][13] = 0x182;
			LPC_IOCON->PIO[1][12] = 0x182;
			NVIC->ISER[0] = 1 << UART3_IRQn;// enable interrupt UART3
  #elif defined LPC178x				
			clk_div = LPC_SC->PCLKSEL ;	
     #warning -- need uart def for 177x UART1
  #elif defined LPC11U67 || defined LPC11U68
  	//GET THIS
  #else
    #error   Unknown CPU type in UART_Init
  #endif  			
			break;
 #endif			
 
 #ifdef LPC_UART4	
		case 4:
			UARTX = (LPC_UART_TypeDef *)LPC_UART4; //M3 regs are at 0x4000C000 and 0x40010000
			uart4_rx_insert_idx = uart4_rx_extract_idx = uart4_tx_insert_idx = uart4_tx_extract_idx = 0;
  #ifdef LPC407x //TXD4  P5_4=4 RXD4 P5_3=4
    #ifdef LPC4074
      #warning no available pins for U4_RXD on LPC4074
    #endif
  			LPC_IOCON->P5_4 = 4;
  			LPC_IOCON->P5_3 = 4;
			clk_div = LPC_SC->PCLKSEL & 0x1f;
			LPC_SC->PCONP |= 1<<8;				 // turn it on
			NVIC->ISER[1] = 1 << (UART4_IRQn - 32);// enable interrupt UART4
  #elif defined LPC11U67 || defined LPC11U68
  	//GET THIS
  #else
    #error   Unknown CPU type in UART_Init
  #endif  			
			break;
 #endif			
		default:
			
			return;
	}
	
#if defined LPC802 || defined LPC812 || defined LPC824 
//MAR 2/18/13 adjusted for 50MHz clock, see also system_LPC8xx.c
	UARTX->INTENCLR = 0xFFFF; // disable all interrupts
	UARTX->STAT = 0xFFFF;     // clear all status bits
	UARTX->RBR;           //read RXDATA to clear RXRDY status bit
	
  #if defined LPC802
  #warning -- a lot of this should move into system_lpc802
	UARTX->BRG = 37;	// baud rate
  #else  
	int UARTSysClk = SystemCoreClock / (int) LPC_SYSCON->UARTCLKDIV;// put back for 812, needs testing else where MAR
	UARTX->BRG = UARTSysClk/8/baud-1;	// baud rate
  #endif

	UARTX->INTENSET = 1; // Enable UART RX interrupt
	UARTX->CFG = (1<<2) | 1; // 8 bits, no Parity, 1 Stop bit and Enable UART

#elif defined LPC15xx


	UARTX->INTENCLR = 0xFFFF; // disable all interrupts
	UARTX->STAT = 0xFFFF;     // clear all status bits
	UARTX->RXDATA;            //read RXDATA to clear RXRDY status bit
	
//	UARTX->OSR = 15;		  			// divide by 16 BRG
	UARTX->BRG = SystemCoreClock/16/baud-1;	// baud rate
	#warning ******************* need to set baud rate

	UARTX->INTENSET = 1; // Enable UART RX interrupt
	UARTX->CFG = (1<<2) | 1; // 8 bits, no Parity, 1 Stop bit and Enable UART
	
#elif defined LPC54102

	UARTX->INTENCLR = 0xFFFF; // disable all interrupts
	UARTX->STAT = 0xFFFF;     // clear all status bits
	UARTX->RXDATA;            //read RXDATA to clear RXRDY status bit
	
	UARTX->BRG = 12000000/16/baud-1;	// baud rate

	UARTX->INTENSET = 0x1; // Enable UART RX interrupt
	UARTX->CFG = (1<<2) | 1; // 8 bits, no Parity, 1 Stop bit and Enable UART
	
#elif defined OTEST

	UARTX->INTENCLR = 0xFFFF; // disable all interrupts
	UARTX->STAT = 0xFFFF;     // clear all status bits
	UARTX->RXDATA;            //read RXDATA to clear RXRDY status bit
	
	UARTX->OSR = 15;		  			// divide by 16 BRG
	UARTX->BRG = 12000000/16/baud-1;	// baud rate
	#warning ******************* need to set baud rate

	UARTX->INTENSET = 1; // Enable UART RX interrupt
	UARTX->CFG = (1<<2) | 1; // 8 bits, no Parity, 1 Stop bit and Enable UART

#else //not LPC812 or MIN_UART

	UARTX->IER = 0x00;                       // disable all interrupts
  
	baud = ((SystemCoreClock / clk_div / baud) + 7) >> 4;		// add 7 to round the result/16

// NOTE TO BRUCE: NVIC->ISER[0] has already been set above
// is this redunadant 
// LPC812 does not get here
	
	switch(uartNUM) {
 #ifdef NVIC		
		case 0:
			NVIC->ISER[0] = 1 << UART0_IRQn;// enable interrupt UART0
			break;
  #ifdef LPC_UART1			
		case 1:
			NVIC->ISER[0] = 1 << UART1_IRQn;// enable interrupt UART1
			break;
  #endif			
  #ifdef LPC_UART2			
		case 2:
			NVIC->ISER[0] = 1 << UART2_IRQn;// enable interrupt UART2
			break;
  #endif			
  #ifdef LPC_UART3			
		case 3:
			NVIC->ISER[0] = 1 << UART3_IRQn;// enable interrupt UART3
			break;
  #endif			
  #ifdef LPC_UART4			
		case 4:
			NVIC->ISER[1] = 1 << (UART4_IRQn - 32);// enable interrupt UART4
			break;
  #endif			
 #else
		case 0:
			VICVectCntl0 = VIC_ENABLE | VIC_UART0;	// choice of interupt 10 is arbitrary
			VICVectAddr0 = (unsigned int)UART0_IRQHandler;	// address of the ISR
			VICIntEnable |= 1 << VIC_UART0;    		// UART0 interrupt enabled
			break;
		case 1: 
			VICVectCntl3 = VIC_ENABLE | VIC_UART1;	// choice of interupt 11 is arbitrary
			VICVectAddr3 = (unsigned int)UART1_IRQHandler;	// address of the ISR
			VICIntEnable |= 1 << VIC_UART1;    		// UART1 interrupt enabled
			break;
 #endif			
		default:
			break;
	}
	
	UARTX->IIR;                              // clear interrupt ID
	UARTX->RBR;                              // clear receive register
	UARTX->LSR;                              // clear line status register

	// set the baudrate
	UARTX->LCR |= UART_LCR_DLAB_EN;           // select divisor latches 
	UARTX->DLL = baud;        				// set for baud low byte
	UARTX->DLM = baud >> 8;    				// set for baud high byte
	
	UARTX->FDR = 0x10;		// turn off fractional rate -- to use it in BASIC set baud > desired rate, then divide by between 1 and 2

	// set the number of characters and other
	// user specified operating parameters
	
	UARTX->LCR = ((UART_CFG_DATABIT_8 | UART_CFG_STOPBIT_1 | UART_CFG_PARITY_NONE) & ~UART_LCR_DLAB_EN);
	UARTX->FCR = UART_FCR_FIFO_EN | UART_CFG_FIFOTRG_8;
	
    #ifdef TX_USE_BUFFER
	// enable receiver and transmit interrupts
	UARTX->IER = UART_INTCFG_RBR | UART_INTCFG_THRE;
    #else	
	// enable receiver interrupts
	UARTX->IER = UART_INTCFG_RBR;
    #endif
#endif //not LPC812

}

//////////////////////////////////////////////////////////////////////////////
//
//	all uart interrupt come to this code with pointers set to
//	the proper set of UART registers and buffers and buffer pointers
//


void doUartStuff(LPC_UART_TypeDef *LPC_UARTX, char uart_tx_buffer[], int *uart_tx_insert_idx,int *uart_tx_extract_idx, 
											  char uart_rx_buffer[], int *uart_rx_insert_idx,int *uart_rx_extract_idx) {

	char iid, ch;
	int temp;

#if defined MIN_UART // defined LPC812 || defined OTEST
	iid = LPC_UARTX->STAT & 5;

	// RXRDY - Cleared after a read of the RXDATA aka RBR
	if (iid & 1) {
   	      // calc next insert index & store character
       	  temp = (*uart_rx_insert_idx + 1) & (UART_RX_BUFFER_SIZE-1);
          ch = LPC_UARTX->RBR;
   	      uart_rx_buffer[*uart_rx_insert_idx] = ch;

       	  // check for more room in queue
          if (temp != *uart_rx_extract_idx) *uart_rx_insert_idx = temp; // update insert index
	}
  #ifdef TX_USE_BUFFER
	// TXRDY - Cleared by disabling the interrupt
	if (iid & 4) {
		LPC_UARTX->INTENCLR = 4; // Disable UART TX interrupt
          // check if more data to send
		if (*uart_tx_insert_idx != *uart_tx_extract_idx) { 		// more data left to send
       	   	LPC_UARTX->THR = uart_tx_buffer[*uart_tx_extract_idx];
       		*uart_tx_extract_idx = (*uart_tx_extract_idx+1) & (UART_TX_BUFFER_SIZE-1);    
			LPC_UARTX->INTENSET = 4; // Enable UART TX interrupt
		}
	}
  #endif
	
#else //not LPC812

  #ifdef TX_USE_BUFFER
	char uartTXFIFOcnt;
  #endif

	iid = LPC_UARTX->IIR & 0xe;  //UART_INTSTAT_PEND             
	
   	// identify & process the highest priority interrupt
	if ((iid == IIR_RDA) || (iid == IIR_CTI)) {

		// read out all of RBR, reduces number of CTI timeouts and makes reading faster
		while(LPC_UARTX->LSR & LSR_RDR){
          // calc next insert index & store character
       	  temp = (*uart_rx_insert_idx + 1) & (UART_RX_BUFFER_SIZE-1);
   	      ch = LPC_UARTX->RBR;
          //usbPutch(ch); // pass it through to UART0
		  uart_rx_buffer[*uart_rx_insert_idx] = ch;
        	  // check for more room in queue
   	      if (temp != *uart_rx_extract_idx) *uart_rx_insert_idx = temp; // update insert index
		}
  	} else if (iid == IIR_THRE) {               // Transmit Holding Register Empty
#if defined LPC11U37  || defined LPC11U35 || (defined LPC11U67) || (defined LPC11U68)
  		while(LPC_UARTX->LSR & LSR_THRE){
       	  // check if more data to send
			if (*uart_tx_insert_idx == *uart_tx_extract_idx) break; // no data left to send
			
           	LPC_UARTX->THR = uart_tx_buffer[*uart_tx_extract_idx];
          	*uart_tx_extract_idx = (*uart_tx_extract_idx+1) & (UART_TX_BUFFER_SIZE-1);    
           	         	       	           	
		}
#elif defined TX_USE_BUFFER
		uartTXFIFOcnt = 15;				// fill up the fifo
        do {						
       	  // check if more data to send
			if (*uart_tx_insert_idx == *uart_tx_extract_idx) break; // no data left to send
			
           	LPC_UARTX->THR = uart_tx_buffer[*uart_tx_extract_idx];
          	*uart_tx_extract_idx = (*uart_tx_extract_idx+1) & (UART_TX_BUFFER_SIZE-1);    
           	         	       	           	
		} while (uartTXFIFOcnt--) ;
//bte-- LPC_UARTX->IIR;
  #endif
	} else {                          // error conditions -- read status and character buffer and exit
       	LPC_UARTX->LSR;
   	    LPC_UARTX->RBR;
	}
	
  #ifdef VICVectAddr		// doesn't exist in Cortex
	VICVectAddr = 0x00000000;             // clear this interrupt from the VIC
  #endif

#endif //not LPC812
}



/////////////////////////////////////////////////////
//
//	general interfaces to send and receive characters from the UARTs
//

int uartGetch(LPC_UART_TypeDef *LPC_UARTX,volatile char uart_rx_buffer[],volatile int *uart_rx_insert_idx,volatile int *uart_rx_extract_idx)
{
 #ifdef UART_NOBUFFER		// use this during bring up when interrupts aren't working yet
 	if (LPC_UARTX->LSR & 1) return LPC_UARTX->RBR;
	else return -1;
 #else  
	char ch;
  
	if (*uart_rx_insert_idx == *uart_rx_extract_idx) // check if character is available
		return -1;
	ch = uart_rx_buffer[(*uart_rx_extract_idx)++]; // get character, bump pointer
	*uart_rx_extract_idx &= (UART_RX_BUFFER_SIZE-1); // limit the pointer
	return ch;
 #endif  
}



int uartPutch(LPC_UART_TypeDef *LPC_UARTX, char ch)		// FIXME XOFF has to go ahead of the transmit buffer, if that ever gets enabled
{
 #ifdef TX_USE_BUFFER
 
	char *uart_tx_buffer;	
	volatile int  *uart_tx_insert_idx;
	volatile int  *uart_tx_extract_idx;

	// do this though it can be a waste, but keeps compiler happy
	uart_tx_buffer = uart0_tx_buffer;
	uart_tx_insert_idx  = &uart0_tx_insert_idx;
	uart_tx_extract_idx = &uart0_tx_extract_idx;
	
	
	if (LPC_UARTX == (LPC_UART_TypeDef *)LPC_UART0) {
	}
   #ifdef LPC_UART1
	else if (LPC_UARTX == (LPC_UART_TypeDef *)LPC_UART1) {
		uart_tx_buffer = uart1_tx_buffer;
		uart_tx_insert_idx  = &uart1_tx_insert_idx;
		uart_tx_extract_idx = &uart1_tx_extract_idx;
	}
   #endif
   #ifdef LPC_UART2
	else if (LPC_UARTX == (LPC_UART_TypeDef *)LPC_UART2) {
		uart_tx_buffer = uart2_tx_buffer;
		uart_tx_insert_idx  = &uart2_tx_insert_idx;
		uart_tx_extract_idx = &uart2_tx_extract_idx;
	}
   #endif
   #ifdef LPC_UART3
	else if (LPC_UARTX == (LPC_UART_TypeDef *)LPC_UART3) {
		uart_tx_buffer = uart3_tx_buffer;
		uart_tx_insert_idx  = &uart3_tx_insert_idx;
		uart_tx_extract_idx = &uart3_tx_extract_idx;
	}
   #endif
   #ifdef LPC_UART4
	else if (LPC_UARTX == (LPC_UART_TypeDef *)LPC_UART4) {
		uart_tx_buffer = uart4_tx_buffer;
		uart_tx_insert_idx  = &uart4_tx_insert_idx;
		uart_tx_extract_idx = &uart4_tx_extract_idx;
	}
   #endif

   #ifdef MIN_UART
	if  (LPC_UARTX->STAT & 8) {   								// transmitter is idle - was &4 but idle is bit 3 mar
   #else
	if  (LPC_UARTX->LSR & UART_LS_TX_EMPTY) { 					// transmitter is idle
   #endif
		if  (*uart_tx_insert_idx == *uart_tx_extract_idx) { 		// and the buffer is empty
		  	LPC_UARTX->THR = (char)ch;								// TX empty AND nothing in the buffer -- send it out
	  	} else {												// idle and buffer not empty send next char in buffer out
	    	uart_tx_buffer[*uart_tx_insert_idx] = ch;				// should not need to wait here 
	    	*uart_tx_insert_idx = (*uart_tx_insert_idx+1) & (UART_TX_BUFFER_SIZE-1);
	    	
           	LPC_UARTX->THR = uart_tx_buffer[*uart_tx_extract_idx];	
          	*uart_tx_extract_idx = (*uart_tx_extract_idx+1) & (UART_TX_BUFFER_SIZE-1);    
	  	}	
	  #ifdef MIN_UART
		LPC_UARTX->INTENSET = 4; // Enable UART TX/RX interrupt
	  #endif
	} else {													// transmitter is busy
    	uart_tx_buffer[*uart_tx_insert_idx] = ch;
 		while (((*uart_tx_insert_idx+1) & (UART_TX_BUFFER_SIZE-1)) == *uart_tx_extract_idx);  // no room for data left -- WAIT
    	*uart_tx_insert_idx = (*uart_tx_insert_idx+1) & (UART_TX_BUFFER_SIZE-1);
	}
	
 #else	
  #if defined MIN_UART		// defined LPC812 || defined OTEST
	while ( !(LPC_UARTX->STAT & 4) );//TXRDY
  #else
	while ((LPC_UARTX->LSR & UART_LS_TX_EMPTY_ALL) == 0);
  #endif
  	LPC_UARTX->THR = (char)ch;
  #endif

  	return ch;
}

// use the following until TX interrupts and buffer enabled
// NOTE this is not working for LPC812, don't know about the others
// LPC812 prints a couple characters then returns
int uartPuts(LPC_UART_TypeDef *LPC_UARTX, char *string)
{	
  	char ch;
  	
 #ifdef TX_USE_BUFFER
  	while ((ch = *string++) != 0) {
		uartPutch(LPC_UARTX, ch);		// FIXME XOFF has to go ahead of the transmit buffer, if that ever gets enabled
 #else	  	
  #if defined MIN_UART		// defined LPC812 || defined OTEST
  	while ((ch = *string++) != 0) {
		while ( !(LPC_UARTX->STAT & 4) );//TXRDY
	  	LPC_UARTX->TXDATA = (char)ch;
  #else
	int uartTXFIFOcnt;
  	uartTXFIFOcnt = 0;			// can't read the FIFO status wait for empty and then send 16 bytes
  	
  	while ((ch = *string++) != 0) {
		if (uartTXFIFOcnt == 0) {
			while ((LPC_UARTX->LSR & UART_LS_TX_EMPTY_ALL) == 0);
	  		uartTXFIFOcnt = 16;			// can't read this reliably
  		}
	  	LPC_UARTX->THR = (char)ch;
	  	uartTXFIFOcnt--;
  #endif
 #endif
	}
	return 0;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	standard C like access to the UARTs as streams  -- getchar, getc, putchar, putc
//

// we could mimic C more by adding -- and defining UARTnum as a FILE

// struct __FILE { int handle; /* Add whatever you need here */ };
// typedef FILE __FILE;

#ifndef ALT_SERIAL_DEBUG	// special cases of getchar / putchar defined in system_xxxx.c

int getchar(void) {
  #ifdef UART_NO_INTERRUPT
	if (LPC_UART0->LSR & 1) return LPC_UART0->RBR;
	else return -1;
  #elif defined CORE_M0a
    return -1;
  #else
	return uartGetch((LPC_UART_TypeDef *)LPC_UART0, uart0_rx_buffer, &uart0_rx_insert_idx, &uart0_rx_extract_idx);
  #endif
}

#endif

int getc(int UARTnum) {
#ifdef ALT_SERIAL_DEBUG // LPC11U37 UART0 is USB, UART1 becomes physical UART0
	if (UARTnum == 0) return usbGetch();
	if (UARTnum == 1) return uartGetch((LPC_UART_TypeDef *)LPC_UART0, uart0_rx_buffer, &uart0_rx_insert_idx, &uart0_rx_extract_idx);
#else
  #ifdef CORE_M0a
  	if (UARTnum == 0) return -1;
  #else
	if (UARTnum == 0) return uartGetch((LPC_UART_TypeDef *)LPC_UART0, uart0_rx_buffer, &uart0_rx_insert_idx, &uart0_rx_extract_idx);
  #endif	
  #ifdef LPC_UART1
	if (UARTnum == 1) return uartGetch((LPC_UART_TypeDef *)LPC_UART1, uart1_rx_buffer, &uart1_rx_insert_idx, &uart1_rx_extract_idx);
  #endif	
  #ifdef LPC_UART2
	if (UARTnum == 2) return uartGetch(LPC_UART2, uart2_rx_buffer, &uart2_rx_insert_idx, &uart2_rx_extract_idx);
  #endif	
  #ifdef LPC_UART3
	if (UARTnum == 3) return uartGetch(LPC_UART3, uart3_rx_buffer, &uart3_rx_insert_idx, &uart3_rx_extract_idx);
  #endif	
  #ifdef LPC_UART4
	if (UARTnum == 4) return uartGetch(LPC_UART4, uart4_rx_buffer, &uart4_rx_insert_idx, &uart4_rx_extract_idx);
  #endif	
#endif	
	return -1;
}

#ifndef CR
 #define CR 0xd
 #define LF 0xa
#endif


#ifdef CORE_M0a

int putchar(int ch) {
	while ((LPC_UART0->LSR & UART_LS_TX_EMPTY_ALL) == 0);
	LPC_UART0->THR = (char)ch;

	return ch;
}

#else


int fgets_last_ch;  // handle  LF same as CR or CR/LF

char * fgets (char * string, int max_count, int UARTnum) {
	char * save_string;
	int ch;
	
	save_string = string;
	
	do {
		do {
			ch = getc(UARTnum);
		} while (ch == -1);
		if (ch == LF) {
			if (fgets_last_ch == CR) continue;
			*string=0;
			break;
		}
		if (ch == CR) {
			*string=0;
			break;
		}
		*string++ = ch;
		if(ch == 0) break;  	// unlikely, but could happen
	} while (--max_count);
	fgets_last_ch = ch;
	return save_string;
}

char * gets(char * string) {
	return fgets(string, 255, 0);
}

#ifndef ALT_SERIAL_DEBUG

int putchar(int ch) {
	echo_char(ch);				// in ARMweb this redirects IO to web page, when debugging sends to both
	return uartPutch((LPC_UART_TypeDef *)LPC_UART0, ch);
}
#endif

#endif

int putc(int ch, int UARTnum) {
#ifdef ALT_SERIAL_DEBUG // LPC11U37 UART0 is USB, UART1 becomes physical UART0
	if (UARTnum == 0) return usbPutch(ch);
	if (UARTnum == 1) return uartPutch((LPC_UART_TypeDef *)LPC_UART0, ch);
#else
  #ifdef CORE_M0a
	if (UARTnum == 0) return putchar(ch);
  #else
	if (UARTnum == 0) return uartPutch((LPC_UART_TypeDef *)LPC_UART0, ch);
  #endif
  #ifdef LPC_UART1
	if (UARTnum == 1) return uartPutch((LPC_UART_TypeDef *)LPC_UART1, ch);
  #endif	
  #ifdef LPC_UART2
	if (UARTnum == 2) return uartPutch((LPC_UART_TypeDef *)LPC_UART2, ch);
  #endif	
  #ifdef LPC_UART3
	if (UARTnum == 3) return uartPutch((LPC_UART_TypeDef *)LPC_UART3, ch);
  #endif	
  #ifdef LPC_UART4
	if (UARTnum == 4) return uartPutch((LPC_UART_TypeDef *)LPC_UART4, ch);
  #endif	
#endif	
	return -1;
}

#ifndef FOR_BASIC

int fputs(char *string, int UARTnum) {
	if (UARTnum == 0) return uartPuts((LPC_UART_TypeDef *)LPC_UART0, string);
  #ifdef LPC_UART1
	if (UARTnum == 1) return uartPuts((LPC_UART_TypeDef *)LPC_UART1, string);
  #endif	
  #ifdef LPC_UART2
	if (UARTnum == 2) return uartPuts((LPC_UART_TypeDef *)LPC_UART2, string);
  #endif	
  #ifdef LPC_UART3
	if (UARTnum == 3) return uartPuts((LPC_UART_TypeDef *)LPC_UART3, string);
  #endif	
  #ifdef LPC_UART4
	if (UARTnum == 4) return uartPuts((LPC_UART_TypeDef *)LPC_UART4, string);
  #endif	
	return -1;
}

#endif

 #if !(defined LPC1114 || defined LPC802 || defined LPC812)		// need the space

int uart_txfree(int UARTnum) {
	if (UARTnum == 0) return UART_TX_BUFFER_SIZE-((uart0_tx_insert_idx - uart0_tx_extract_idx) & (UART_TX_BUFFER_SIZE-1));
  #ifdef LPC_UART1
	if (UARTnum == 1) return UART_TX_BUFFER_SIZE-((uart1_tx_insert_idx - uart1_tx_extract_idx) & (UART_TX_BUFFER_SIZE-1));
  #endif	
  #ifdef LPC_UART2
	if (UARTnum == 2) return UART_TX_BUFFER_SIZE-((uart2_tx_insert_idx - uart2_tx_extract_idx) & (UART_TX_BUFFER_SIZE-1));
  #endif	
  #ifdef LPC_UART3
	if (UARTnum == 3) return UART_TX_BUFFER_SIZE-((uart3_tx_insert_idx - uart3_tx_extract_idx) & (UART_TX_BUFFER_SIZE-1));
  #endif	
  #ifdef LPC_UART4
	if (UARTnum == 4) return UART_TX_BUFFER_SIZE-((uart4_tx_insert_idx - uart4_tx_extract_idx) & (UART_TX_BUFFER_SIZE-1));
  #endif	
	return -1;
}
 #endif

/*
externC void TIMER1_IRQHandler(void)
{
	LPC_TIM1->IR = 1;  // Clear interrupt flag by writing 1 to Bit 0
	LPC_UART0->THR = '.';
}
*/
#ifndef CORE_M0s

#ifdef LPC_UART0

externC void UART0_IRQHandler(void)
{
	doUartStuff((LPC_UART_TypeDef *) LPC_UART0, uart0_tx_buffer,&uart0_tx_insert_idx,&uart0_tx_extract_idx, uart0_rx_buffer,&uart0_rx_insert_idx,&uart0_rx_extract_idx);
}
#endif



#ifdef LPC_UART1

externC void UART1_IRQHandler(void)
{
	doUartStuff((LPC_UART_TypeDef *) LPC_UART1, uart1_tx_buffer,&uart1_tx_insert_idx,&uart1_tx_extract_idx, uart1_rx_buffer,&uart1_rx_insert_idx,&uart1_rx_extract_idx);
}
#endif


#ifdef LPC_UART2

externC void UART2_IRQHandler(void)
{
	doUartStuff((LPC_UART_TypeDef *) LPC_UART2, uart2_tx_buffer,&uart2_tx_insert_idx,&uart2_tx_extract_idx, uart2_rx_buffer,&uart2_rx_insert_idx,&uart2_rx_extract_idx);
}
#endif


#ifdef LPC_UART3

externC void UART3_IRQHandler(void)
{
	doUartStuff((LPC_UART_TypeDef *) LPC_UART3, uart3_tx_buffer,&uart3_tx_insert_idx,&uart3_tx_extract_idx, uart3_rx_buffer,&uart3_rx_insert_idx,&uart3_rx_extract_idx);
}
#endif

#endif // CORE_M0s
 