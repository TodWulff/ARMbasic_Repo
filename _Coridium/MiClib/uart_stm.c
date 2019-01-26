/**
  ******************************************************************************
  * @file    system_stm32f4xx.c
  * @author  MCD Application Team
  * @version V1.1.2
  * @date    09-October-2015
  * @brief   CMSIS Cortex-M4 Device Peripheral Access Layer System Source File.
  *
  *   This file provides two functions and one global variable to be called from 
  *   user application:
  *      - SystemInit(): This function is called at startup just after reset and 
  *                      before branch to main program. This call is made inside
  *                      the "startup_stm32f4xx.s" file.
  *
  *      - SystemCoreClock variable: Contains the core clock (HCLK), it can be used
  *                                  by the user application to setup the SysTick 
  *                                  timer or configure other parameters.
  *                                     
  *      - SystemCoreClockUpdate(): Updates the variable SystemCoreClock and must
  *                                 be called whenever the core clock is changed
  *                                 during program execution.
  *
  *
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2015 STMicroelectronics</center></h2>
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

//#include "system_stm32f4xx.h"
#include "uart_stm.h"
//#include "stm32f411xe.h"




int  uart1_rx_insert_idx, uart1_rx_extract_idx, uart1_tx_insert_idx, uart1_tx_extract_idx;
char uart1_rx_buffer[UART_RX_BUFFER_SIZE];
char uart1_tx_buffer[UART_TX_BUFFER_SIZE];

int  uart2_rx_insert_idx, uart2_rx_extract_idx, uart2_tx_insert_idx, uart2_tx_extract_idx;
char uart2_rx_buffer[UART_RX_BUFFER_SIZE];
char uart2_tx_buffer[UART_TX_BUFFER_SIZE];

int  uart6_rx_insert_idx, uart6_rx_extract_idx, uart6_tx_insert_idx, uart6_tx_extract_idx;
char uart6_rx_buffer[UART_RX_BUFFER_SIZE];
char uart6_tx_buffer[UART_TX_BUFFER_SIZE];

void UART_init(int uartNUM, unsigned int baud)
{
	GPIO_InitTypeDef  GPIO_InitStruct;  
	USART_TypeDef* USARTx;
	IRQn_Type IRQn;
	
	GPIO_InitStruct.Mode      = GPIO_MODE_AF_PP;
	GPIO_InitStruct.Pull      = 0;//nopull instead of GPIO_PULLUP;
	GPIO_InitStruct.Speed     = GPIO_SPEED_FAST;
	//     IO    Pin FunctionNumber
	// TX1 PB6   30  7?
	// RX1 PA10  29  7?
	// TX2 PA2    8  7
	// RX2 PA3   12  7
	// TX6 PA11  35  8?
	// RX6 PA12  27  8?
	switch(uartNUM) {
		case 1:
			USARTx = USART1;
			USART1_CLK_ENABLE(); // Enable USARTx clock
			IRQn = USART1_IRQn;
			uart1_rx_insert_idx = uart1_rx_extract_idx = uart1_tx_insert_idx = uart1_tx_extract_idx = 0;

			// Configure peripheral GPIO
			GPIO_InitStruct.Pin       = GPIO_PIN_6; // TX_PIN
			GPIO_InitStruct.Alternate = 7; // TX_AF GPIO_AF_USART1
			STM_GPIO_Init(GPIOB, &GPIO_InitStruct);
				
			GPIO_InitStruct.Pin       = GPIO_PIN_10; // RX_PIN
			GPIO_InitStruct.Alternate = 7; // RX_AF GPIO_AF_USART1
			STM_GPIO_Init(GPIOA, &GPIO_InitStruct);
			break;

		case 2:
			USARTx = USART2;
			USART2_CLK_ENABLE(); // Enable USARTx clock
			IRQn = USART2_IRQn;
			uart2_rx_insert_idx = uart2_rx_extract_idx = uart2_tx_insert_idx = uart2_tx_extract_idx = 0;
	
			// Configure peripheral GPIO
			GPIO_InitStruct.Pin       = GPIO_PIN_2; // TX_PIN
			GPIO_InitStruct.Alternate = 7; // TX_AF GPIO_AF_USART2
			STM_GPIO_Init(GPIOA, &GPIO_InitStruct);
				
			GPIO_InitStruct.Pin       = GPIO_PIN_3; // RX_PIN
			GPIO_InitStruct.Alternate = 7; // RX_AF GPIO_AF_USART2
			STM_GPIO_Init(GPIOA, &GPIO_InitStruct);
			break;

		case 6:
			USARTx = USART6;
			USART6_CLK_ENABLE(); // Enable USARTx clock
			IRQn = USART6_IRQn;
			uart6_rx_insert_idx = uart6_rx_extract_idx = uart6_tx_insert_idx = uart6_tx_extract_idx = 0;
	
			// Configure peripheral GPIO
			GPIO_InitStruct.Pin       = GPIO_PIN_11; // TX_PIN
			GPIO_InitStruct.Alternate = 8; // TX_AF GPIO_AF_USART6
			STM_GPIO_Init(GPIOA, &GPIO_InitStruct);
				
			GPIO_InitStruct.Pin       = GPIO_PIN_12; // RX_PIN
			GPIO_InitStruct.Alternate = 8; // RX_AF GPIO_AF_USART6
			STM_GPIO_Init(GPIOA, &GPIO_InitStruct);
			break;

		default:
			return;
	}

	USARTx->CR1 = 0;   // Disable the peripheral
	
	// Set the UART Communication parameters
	USARTx->CR1 = 0xC; // WordLength | Parity | Mode | OverSampling
	USARTx->CR2 = 0;   // M, PCE, PS, TE and RE
	USARTx->CR3 = 0;   // CTSE and RTSE
	
	// using Over Sampling 16
	if((USARTx == USART1) || (USARTx == USART6))
		USARTx->BRR = UART_BRR_SAMPLING16(100000000, baud); // uses PCLK2
	else
		USARTx->BRR = UART_BRR_SAMPLING16(50000000, baud);  // uses PCLK1

	USARTx->CR1 |= 0x2020; // Enable the peripheral and Data Register not empty Interrupt
	//NVIC_EnableIRQ(IRQn);  // Enable USART global interrupt
	NVIC->ISER[(uint32_t)((int32_t)IRQn) >> 5] = (uint32_t)(1 << ((uint32_t)((int32_t)IRQn) & (uint32_t)0x1F)); /* enable interrupt */
}

//void send(char c){
//	while((USART2->SR & 0x80) == 0){} //wait for empty
//	USART2->DR = c;
//}


#define U_FLAG_TXE                       ((uint32_t)0x00000080)
#define U_FLAG_RXNE                      ((uint32_t)0x00000020)

void doUartStuff(USART_TypeDef *USARTX, char uart_tx_buffer[], int *uart_tx_insert_idx,int *uart_tx_extract_idx, 
									    char uart_rx_buffer[], int *uart_rx_insert_idx,int *uart_rx_extract_idx) {


	volatile unsigned int IIR;
	char ch;
	int temp;
	
	//struct buf_st *p;
	IIR = USARTX->SR;
	if (IIR & U_FLAG_RXNE) {                  // read interrupt
		USARTX->SR &= ~U_FLAG_RXNE;	          // clear interrupt
		
		// calc next insert index & store character
		temp = (*uart_rx_insert_idx + 1) & (UART_RX_BUFFER_SIZE-1);
		ch = USARTX->DR & 0xFF; //0x1FF;
		//USARTX->DR = ch; // DEBUG ECHO
		//if(ch== '!')while(1); // hang
		uart_rx_buffer[*uart_rx_insert_idx] = ch;

		// check for more room in queue
		if (temp != *uart_rx_extract_idx) *uart_rx_insert_idx = temp; // update insert index
	}

	if (IIR & U_FLAG_TXE) {
		USARTX->SR &= ~U_FLAG_TXE;	          // clear interrupt
		
		USARTX->CR1 &= ~U_FLAG_TXE; // Disable USART TX interrupt
        // check if more data to send
		if (*uart_tx_insert_idx != *uart_tx_extract_idx) { 		// more data left to send
       	   	USARTX->DR = uart_tx_buffer[*uart_tx_extract_idx];
       		*uart_tx_extract_idx = (*uart_tx_extract_idx+1) & (UART_TX_BUFFER_SIZE-1);    
			USARTX->CR1 |= U_FLAG_TXE; // Enable USART TX interrupt
		}
	}
}



/////////////////////////////////////////////////////
//
//	general interfaces to send and receive characters from the UARTs
//

int uartGetch(USART_TypeDef *USARTX,volatile char uart_rx_buffer[],volatile int *uart_rx_insert_idx,volatile int *uart_rx_extract_idx)
{
	char ch;
  
	if (*uart_rx_insert_idx == *uart_rx_extract_idx) // check if character is available
		return -1;
	ch = uart_rx_buffer[(*uart_rx_extract_idx)++]; // get character, bump pointer
	*uart_rx_extract_idx &= (UART_RX_BUFFER_SIZE-1); // limit the pointer
	return ch;
}



int uartPutch(USART_TypeDef *USARTX, char ch)		// FIXME XOFF has to go ahead of the transmit buffer, if that ever gets enabled
{
 
	char *uart_tx_buffer;	
	volatile int  *uart_tx_insert_idx;
	volatile int  *uart_tx_extract_idx;

	// do this though it can be a waste, but keeps compiler happy
	uart_tx_buffer = uart2_tx_buffer;
	uart_tx_insert_idx  = &uart2_tx_insert_idx;
	uart_tx_extract_idx = &uart2_tx_extract_idx;

	// How to do it with out TX_BUFFER
	//while((USART2->SR & 0x80) == 0){} //wait for empty
	//USART2->DR = ch & 0xFF;

	// default 2, else 1 or 6
	if (USARTX == (USART_TypeDef *)USART1) {
		uart_tx_buffer = uart1_tx_buffer;
		uart_tx_insert_idx  = &uart1_tx_insert_idx;
		uart_tx_extract_idx = &uart1_tx_extract_idx;
	}
	else if (USARTX == (USART_TypeDef *)USART6) {
		uart_tx_buffer = uart6_tx_buffer;
		uart_tx_insert_idx  = &uart6_tx_insert_idx;
		uart_tx_extract_idx = &uart6_tx_extract_idx;
	}

	if  (USART2->SR & 0x80) { 					// transmitter is idle
		if  (*uart_tx_insert_idx == *uart_tx_extract_idx) { 		// and the buffer is empty
		  	USARTX->DR = (char)ch;								// TX empty AND nothing in the buffer -- send it out
	  	} else {												// idle and buffer not empty send next char in buffer out
	    	uart_tx_buffer[*uart_tx_insert_idx] = ch;				// should not need to wait here 
	    	*uart_tx_insert_idx = (*uart_tx_insert_idx+1) & (UART_TX_BUFFER_SIZE-1);
	    	
           	USARTX->DR = uart_tx_buffer[*uart_tx_extract_idx];	
          	*uart_tx_extract_idx = (*uart_tx_extract_idx+1) & (UART_TX_BUFFER_SIZE-1);    
	  	}
		USARTX->CR1 |= U_FLAG_TXE; // Enable USART TX interrupt	
	} else {													// transmitter is busy
    	uart_tx_buffer[*uart_tx_insert_idx] = ch;
 		while (((*uart_tx_insert_idx+1) & (UART_TX_BUFFER_SIZE-1)) == *uart_tx_extract_idx);  // no room for data left -- WAIT
    	*uart_tx_insert_idx = (*uart_tx_insert_idx+1) & (UART_TX_BUFFER_SIZE-1);
	}
  	return ch;
}

//// use the following until TX interrupts and buffer enabled
//// NOTE this is not working for LPC812, don't know about the others
//// LPC812 prints a couple characters then returns
//int uartPuts(USART_TypeDef *USARTX, char *string)
//{	
//  	char ch;
//  	
// #ifdef TX_USE_BUFFER
//  	while ((ch = *string++) != 0) {
//		uartPutch(LPC_UARTX, ch);		// FIXME XOFF has to go ahead of the transmit buffer, if that ever gets enabled
// #else	  	
//	int uartTXFIFOcnt;
//  	uartTXFIFOcnt = 0;			// can't read the FIFO status wait for empty and then send 16 bytes
//  	
//  	while ((ch = *string++) != 0) {
//  #if defined MIN_UART		// defined LPC812 || defined OTEST
//		while ( !(LPC_UARTX->STAT & 4) );//TXRDY
//	  	LPC_UARTX->TXDATA = (char)ch;
//  #else
//		if (uartTXFIFOcnt == 0) {
//			while ((LPC_UARTX->LSR & UART_LS_TX_EMPTY_ALL) == 0);
//	  		uartTXFIFOcnt = 16;			// can't read this reliably
//  		}
//	  	LPC_UARTX->THR = (char)ch;
//	  	uartTXFIFOcnt--;
//  #endif
// #endif
//	}
//	return 0;
//}

/////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	standard C like access to the UARTs as streams  -- getchar, getc, putchar, putc
//


int getchar(void) {
	return uartGetch((USART_TypeDef *)USART2, uart2_rx_buffer, &uart2_rx_insert_idx, &uart2_rx_extract_idx);
}


int getc(int UARTnum) {
	if (UARTnum == 1) return uartGetch(USART1, uart1_rx_buffer, &uart1_rx_insert_idx, &uart1_rx_extract_idx);
	if (UARTnum == 2) return uartGetch(USART2, uart2_rx_buffer, &uart2_rx_insert_idx, &uart2_rx_extract_idx);
	if (UARTnum == 6) return uartGetch(USART6, uart6_rx_buffer, &uart6_rx_insert_idx, &uart6_rx_extract_idx);
	return -1;
}

#ifndef CR
 #define CR 0xd
 #define LF 0xa
#endif


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

int putchar(int ch) {
	//??echo_char(ch);				// in ARMweb this redirects IO to web page, when debugging sends to both
	return uartPutch((USART_TypeDef *)USART2, ch);
}


int putc(int ch, int UARTnum) {
	if (UARTnum == 1) return uartPutch((USART_TypeDef *)USART1, ch);
	if (UARTnum == 2) return uartPutch((USART_TypeDef *)USART2, ch);
	if (UARTnum == 6) return uartPutch((USART_TypeDef *)USART6, ch);
	return -1;
}


int uart_txfree(int UARTnum) {
	if (UARTnum == 1) return UART_TX_BUFFER_SIZE-((uart1_tx_insert_idx - uart1_tx_extract_idx) & (UART_TX_BUFFER_SIZE-1));
	if (UARTnum == 2) return UART_TX_BUFFER_SIZE-((uart2_tx_insert_idx - uart2_tx_extract_idx) & (UART_TX_BUFFER_SIZE-1));
	if (UARTnum == 6) return UART_TX_BUFFER_SIZE-((uart6_tx_insert_idx - uart6_tx_extract_idx) & (UART_TX_BUFFER_SIZE-1));
	return -1;
}



extern void USART1_IRQHandler(void)
{
	doUartStuff((USART_TypeDef *) USART1, uart1_tx_buffer,&uart1_tx_insert_idx,&uart1_tx_extract_idx, uart1_rx_buffer,&uart1_rx_insert_idx,&uart1_rx_extract_idx);
}

extern void USART2_IRQHandler(void)
{
	doUartStuff((USART_TypeDef *) USART2, uart2_tx_buffer,&uart2_tx_insert_idx,&uart2_tx_extract_idx, uart2_rx_buffer,&uart2_rx_insert_idx,&uart2_rx_extract_idx);
}

extern void USART6_IRQHandler(void)
{
	doUartStuff((USART_TypeDef *) USART6, uart6_tx_buffer,&uart6_tx_insert_idx,&uart6_tx_extract_idx, uart6_rx_buffer,&uart6_rx_insert_idx,&uart6_rx_extract_idx);
}
