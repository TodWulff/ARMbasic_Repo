
#include "uart_lpc546xx.h"
#define UART_NOBUFFER
#define UART_NO_INTERRUPT


int  uart0_rx_insert_idx, uart0_rx_extract_idx, uart0_tx_insert_idx, uart0_tx_extract_idx;
char uart0_rx_buffer[UART_RX_BUFFER_SIZE];
char uart0_tx_buffer[UART_TX_BUFFER_SIZE];

void UART_init(int uartNUM, unsigned int baud)
{
	LPC_IOCON->PIO[0][29] = IOCON_MODE_INACT | IOCON_FUNC1 | IOCON_DIGITAL_EN | IOCON_INPFILT_OFF; /* UART RX */
	LPC_IOCON->PIO[0][30] = IOCON_MODE_INACT | IOCON_FUNC1 | IOCON_DIGITAL_EN | IOCON_INPFILT_OFF; /* UART TX */

	LPC_SYSCON->AHBCLKCTRLSET[1] = 1 << 11;
	LPC_SYSCON->PRESETCTRLSET[1] = 1 << 11; // they like 4 NOPs between
	LPC_SYSCON->PRESETCTRLCLR[1] = 1 << 11;
	LPC_USART0->PSELID = 1;

	// Do We Want Wakeup? MAR
	//Chip_SYSCON_EnableWakeup((CHIP_SYSCON_WAKEUP_T) (SYSCON_STARTER_FLEXCOMM0));

	LPC_USART0->FIFOCFG = (LPC_USART0->FIFOCFG & UART_FIFOCFG_BITMASK) | UART_FIFOCFG_ENABLETX | UART_FIFOCFG_ENABLERX;
	LPC_USART0->FIFOCFG = (LPC_USART0->FIFOCFG & UART_FIFOCFG_BITMASK) | UART_FIFOCFG_EMPTYTX | UART_FIFOCFG_EMPTYRX;

	LPC_SYSCON->FRGCLKSEL = SYSCON_FRGCLKSRC_FRO12MHZ;
	LPC_USART0->OSR = 0xD;
	LPC_USART0->BRG = 0x4;
	LPC_SYSCON->FRGCTRL = 0x7DFF;
	LPC_SYSCON->FXCOMCLKSEL[0] = SYSCON_FLEXCOMMCLKSELSRC_FRG;
	LPC_USART0->CFG = (LPC_USART0->CFG & UART_CFG_BITMASK) | UART_CFG_DATALEN_8 | UART_CFG_PARITY_NONE | UART_CFG_STOPLEN_1;
	LPC_USART0->CFG |= UART_CFG_ENABLE;
	LPC_USART0->CTL &= ~UART_CTRL_TXDIS;
}



int uartGetch(LPC_UART_TypeDef *LPC_UARTX,volatile char uart_rx_buffer[],volatile int *uart_rx_insert_idx,volatile int *uart_rx_extract_idx)
{
 #ifdef UART_NOBUFFER		// use this during bring up when interrupts aren't working yet
	if ( (LPC_USART0->FIFOSTAT & UART_FIFOSTAT_RXNOTEMPTY) != 0) return LPC_USART0->FIFOWR;
	return -1;
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
   #ifdef LPC_USB1
	else if (LPC_UARTX == (LPC_UART_TypeDef *)LPC_UART1) {
		uart_tx_buffer = uart1_tx_buffer;
		uart_tx_insert_idx  = &uart1_tx_insert_idx;
		uart_tx_extract_idx = &uart1_tx_extract_idx;
	}
   #endif

	if  (LPC_UARTX->LSR & UART_LS_TX_EMPTY) { 					// transmitter is idle
		if  (*uart_tx_insert_idx == *uart_tx_extract_idx) { 		// and the buffer is empty
		  	LPC_UARTX->THR = (char)ch;								// TX empty AND nothing in the buffer -- send it out
	  	} else {												// idle and buffer not empty send next char in buffer out
	    	uart_tx_buffer[*uart_tx_insert_idx] = ch;				// should not need to wait here 
	    	*uart_tx_insert_idx = (*uart_tx_insert_idx+1) & (UART_TX_BUFFER_SIZE-1);
	    	
           	LPC_UARTX->THR = uart_tx_buffer[*uart_tx_extract_idx];	
          	*uart_tx_extract_idx = (*uart_tx_extract_idx+1) & (UART_TX_BUFFER_SIZE-1);    
	  	}	
	} else {													// transmitter is busy
    	uart_tx_buffer[*uart_tx_insert_idx] = ch;
 		while (((*uart_tx_insert_idx+1) & (UART_TX_BUFFER_SIZE-1)) == *uart_tx_extract_idx);  // no room for data left -- WAIT
    	*uart_tx_insert_idx = (*uart_tx_insert_idx+1) & (UART_TX_BUFFER_SIZE-1);
	}
	
 #else	

	while ((LPC_UARTX->FIFOSTAT & UART_FIFOSTAT_TXNOTFULL) == 0);
  	LPC_USART0->FIFOWR = ch;
  #endif

  	return ch;
}

int getchar(void)
{
  #ifdef UART_NO_INTERRUPT
	if ( (LPC_USART0->FIFOSTAT & UART_FIFOSTAT_RXNOTEMPTY) != 0) return LPC_USART0->FIFORD;
	return -1;
  #else
	return uartGetch((LPC_UART_TypeDef *)LPC_UART0, uart0_rx_buffer, &uart0_rx_insert_idx, &uart0_rx_extract_idx);
  #endif

}


int getc(int UARTnum)
{
	if (UARTnum == 0) return uartGetch((LPC_UART_TypeDef *)LPC_UART0, uart0_rx_buffer, &uart0_rx_insert_idx, &uart0_rx_extract_idx);

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


#ifndef ALT_SERIAL_DEBUG

int putchar(int ch) {
	//echo_char(ch);				// in ARMweb this redirects IO to web page, when debugging sends to both
	return uartPutch((LPC_UART_TypeDef *)LPC_UART0, ch);
}
#endif



int putc(int ch, int UARTnum)
{
	if (UARTnum == 0) return uartPutch((LPC_UART_TypeDef *)LPC_UART0, ch);
	
	return -1;
}



int uart_txfree(int UARTnum)
{
	if (UARTnum == 0) return UART_TX_BUFFER_SIZE-((uart0_tx_insert_idx - uart0_tx_extract_idx) & (UART_TX_BUFFER_SIZE-1));

	return -1;
}


extern void FLEXCOMM0_IRQHandler(void)
{
	//doUartStuff((LPC_USART_T *) LPC_UART0, uart0_tx_buffer,&uart0_tx_insert_idx,&uart0_tx_extract_idx, uart0_rx_buffer,&uart0_rx_insert_idx,&uart0_rx_extract_idx);
}

