
#ifndef __UART_H
#define __UART_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "LPC546xx.h"

#define XON 		0x11
#define XOFF		0x13
#define BACKSPACE	0x8
#define SPACE		0x20
#define TAB	 		0x09
#define ESC	 		27				//these 2 will stop the interpreter in serial mode
#define CTRLC 		3
#define EOTX 		4				//sent back when program finishes
#define SOH 		1				//sent back when program starts


#define UART_RX_BUFFER_SIZE	256			// must be powers of 2
#define UART_TX_BUFFER_SIZE	128

void UART_init(int uartNUM, unsigned int baud);

int getchar(void) ;		// from  UART2
int getc(int UARTnum) ;
char * fgets(char *string, int maxcount, int UARTnum);
char * gets(char *string);

int putchar(int ch) ;	// to UART2

int putc(int ch, int UARTnum) ;
//int fputs(char *string, int UARTnum);


extern int 	uart0_rx_insert_idx, uart0_rx_extract_idx, uart0_tx_insert_idx, uart0_tx_extract_idx;
extern char uart0_rx_buffer[];

//extern int 	uart1_rx_insert_idx, uart1_rx_extract_idx, uart1_tx_insert_idx, uart1_tx_extract_idx;
//extern int 	uart2_rx_insert_idx, uart2_rx_extract_idx, uart2_tx_insert_idx, uart2_tx_extract_idx;
//extern int 	uart3_rx_insert_idx, uart3_rx_extract_idx, uart3_tx_insert_idx, uart3_tx_extract_idx;

//extern char uart1_rx_buffer[];
//extern char uart2_rx_buffer[];
//extern char uart3_rx_buffer[];

int uart_txfree(int UARTnum);



/**
 * @brief UART CFG register definitions
 */
#define UART_CFG_BITMASK      				(0x00fddbfd)
#define UART_CFG_ENABLE        				(0x01 << 0)
#define UART_CFG_DATALEN_7     				(0x00 << 2)							/*!< UART 7 bit length mode */
#define UART_CFG_DATALEN_8     				(0x01 << 2)							/*!< UART 8 bit length mode */
#define UART_CFG_DATALEN_9     				(0x02 << 2)							/*!< UART 9 bit length mode */
#define UART_CFG_PARITY_NONE   				(0x00 << 4)							/*!< No parity */
#define UART_CFG_PARITY_EVEN   				(0x02 << 4)							/*!< Even parity */
#define UART_CFG_PARITY_ODD    				(0x03 << 4)							/*!< Odd parity */
#define UART_CFG_STOPLEN_1     				(0x00 << 6)							/*!< UART One Stop Bit Select */
#define UART_CFG_STOPLEN_2     				(0x01 << 6)							/*!< UART Two Stop Bits Select */
#define UART_CFG_MODE32K       				(0x01 << 7)							/*!< UART 32K MODE */
#define UART_CFG_LINMODE       				(0x01 << 8)							/*!< UART LIN MODE */
#define UART_CFG_CTSEN         				(0x01 << 9)							/*!< CTS enable bit */
#define UART_CFG_SYNCEN        				(0x01 << 11)						/*!< Synchronous mode enable bit */
#define UART_CFG_CLKPOL        				(0x01 << 12)						/*!< Un_RXD rising edge sample enable bit */
#define UART_CFG_SYNCMST       				(0x01 << 14)						/*!< Select master mode (synchronous mode) enable bit */
#define UART_CFG_LOOP          				(0x01 << 15)						/*!< Loopback mode enable bit */
#define UART_CFG_IOMODE        				(0x01 << 16)						/*!< enable bit standard UART / IrDA UART */
#define UART_CFG_OETA          				(0x01 << 18)						/*!< Output Enable Turnaround time enable for RS-485 operation */
#define UART_CFG_AUTOADDR      				(0x01 << 19)						/*!< Automatic Address matching enable */
#define UART_CFG_OESEL         				(0x01 << 20)						/*!< Output Enable Select */
#define UART_CFG_OEPOL         				(0x01 << 21)						/*!< Output Enable Polarity */
#define UART_CFG_RXPOL         				(0x01 << 22)						/*!< Receive data polarity */
#define UART_CFG_TXPOL         				(0x01 << 23)						/*!< Transmit data polarity */


/**
 * @brief UART CTRL register definitions
 */
#define UART_CTRL_TXBRKEN       			(0x01 << 1)							/*!< Continuous break enable bit */
#define UART_CTRL_ADDRDET       			(0x01 << 2)							/*!< Address detect mode enable bit */
#define UART_CTRL_TXDIS         			(0x01 << 6)							/*!< Transmit disable bit */
#define UART_CTRL_CC            			(0x01 << 8)							/*!< Continuous Clock mode enable bit */
#define UART_CTRL_CLRCCONRX     			(0x01 << 9)							/*!< Clear Continuous Clock bit */
#define UART_CTRL_AUTOBAUD      			(0x01 << 16)						/*!< Auto baud bit */

/**
 * @brief UART STAT register definitions
 */
#define UART_STAT_RXIDLE        			(0x01 << 1)							/*!< Receiver idle */
#define UART_STAT_TXIDLE        			(0x01 << 3)							/*!< Transmitter idle */
#define UART_STAT_CTS           			(0x01 << 4)							/*!< Status of CTS signal */
#define UART_STAT_DELTACTS      			(0x01 << 5)							/*!< Change in CTS state */
#define UART_STAT_TXDISINT      			(0x01 << 6)							/*!< Transmitter disabled */
#define UART_STAT_RXBRK         			(0x01 << 10)						/*!< Received break */
#define UART_STAT_DELTARXBRK    			(0x01 << 11)						/*!< Change in receive break detection */
#define UART_STAT_START         			(0x01 << 12)						/*!< Start detected */
#define UART_STAT_FRM_ERRINT    			(0x01 << 13)						/*!< Framing Error interrupt flag */
#define UART_STAT_PAR_ERRINT    			(0x01 << 14)						/*!< Parity Error interrupt flag */
#define UART_STAT_RXNOISEINT    			(0x01 << 15)						/*!< Received Noise interrupt flag */
#define UART_STAT_ABERR         			(0x01 << 16)						/*!< Auto baud error flag */

/**
 * @brief UART INTENSET/INTENCLR/INTSTAT register definitions
 */
#define UART_INT_TXIDLE       				(0x01 << 3)							/*!< Transmit idle interrupt */
#define UART_INT_DELTACTS     				(0x01 << 5)							/*!< Change in CTS state interrupt */
#define UART_INT_TXDIS        				(0x01 << 6)							/*!< Transmitter disable interrupt */
#define UART_INT_DELTARXBRK   				(0x01 << 11)						/*!< Change in receiver break detection interrupt */
#define UART_INT_START        				(0x01 << 12)						/*!< Start detect interrupt */
#define UART_INT_FRAMERR      				(0x01 << 13)						/*!< Frame error interrupt */
#define UART_INT_PARITYERR    				(0x01 << 14)						/*!< Parity error interrupt */
#define UART_INT_RXNOISE      				(0x01 << 15)						/*!< Received noise interrupt */
#define UART_INT_ABERR      				(0x01 << 16)						/*!< Auto-baud error interrupt */

/**
 * @brief	UART FIFO Configuration register bits
 */
#define UART_FIFOCFG_BITMASK		 		(0x7F033)							/*!< Register mask bit @endcond */
#define UART_FIFOCFG_ENABLETX		 		(1 << 0)							/*!< Enable TX FIFO */
#define UART_FIFOCFG_ENABLERX		 		(1 << 1)							/*!< Enable RX FIFO */
#define UART_FIFOCFG_DMATX			 		(1 << 12)							/*!< Enable DMA TX */
#define UART_FIFOCFG_DMARX			 		(1 << 13)							/*!< Enable DMA RX */
#define UART_FIFOCFG_WAKETX			 		(1 << 14)							/*!< Enable wakeup triggered by TX */
#define UART_FIFOCFG_WAKERX			 		(1 << 15)							/*!< Enable wakeup triggered by RX */
#define UART_FIFOCFG_EMPTYTX		 		(1 << 16)							/*!< Empty the TX FIFO */
#define UART_FIFOCFG_EMPTYRX		 		(1 << 17)							/*!< Empty the RX FIFO */

/**
 * @brief	UART FIFO Status register defines
 */
#define UART_FIFO_DEPTH						(16)								/** UART-FIFO How many entries are in the FIFO */
#define UART_FIFOSTAT_BITMASK				(0x1F1FFB)							/** UART-FIFO STAT Register BitMask */
#define UART_FIFOSTAT_TXERR      			(1 << 0)              				/*!< UART TX Error */
#define UART_FIFOSTAT_RXERR      			(1 << 1)              				/*!< UART RX Error */
#define UART_FIFOSTAT_PERIPH     			(1 << 3)              				/*!< Peripheral interrupt */
#define UART_FIFOSTAT_TXEMPTY    			(1 << 4)              				/*!< TXFIFO Empty */
#define UART_FIFOSTAT_TXNOTFULL  			(1 << 5)              				/*!< TXFIFO Not Full */
#define UART_FIFOSTAT_RXNOTEMPTY 			(1 << 6)              				/*!< RXFIFO Not empty */
#define UART_FIFOSTAT_RXFULL     			(1 << 7)              				/*!< RX FIFO Full */
#define UART_FIFOSTAT_TXLVL(lvl)  			(((lvl) >> 8) & 0x1F)  				/*!< Get TX Level from status */
#define UART_FIFOSTAT_RXLVL(lvl)  			(((lvl) >> 16) & 0x1F) 				/*!< Get TX Level from status */

/**
 * @brief	UART FIFO trigger settings register defines
 */
#define UART_FIFOTRIG_BITMASK				(0x000f0f03)						/**  UART FIFO trigger settings Register BitMask */
#define UART_FIFOTRIG_TXLVLENA 				(1 << 0)              				/*!< TX level enable*/
#define UART_FIFOTRIG_RXLVLENA 				(1 << 1)              				/*!< RX level enable */
#define UART_FIFOTRIG_TXLVL(lvl) 			((lvl & 0x0f) << 8)  				/*!< Set TX Level trigger */
#define UART_FIFOTRIG_RXLVL(lvl)			((lvl & 0x0f) << 16) 				/*!< Set RX Level trigger */

/**
 * @brief 	UART FIFO Interrupt enable/disable/status [INTSET/INTCLR/INTSTAT and FIFOINTSET/FIFOINTCLR/FIFOINTSTAT registers]
 */
#define UART_FIFOINT_BITMASK				(0x001F)							/** FIFO interrupt Bit mask */
#define UART_FIFOINT_TXERR					(1 << 0)							/**	 TX error interrupt			[BIT-0 of FIFOINTENSET/FIFOINTENCLR/FIFOINTSTAT register] */
#define UART_FIFOINT_RXERR					(1 << 1)							/**	 RX error interrupt			[BIT-1 of FIFOINTENSET/FIFOINTENCLR/FIFOINTSTAT register] */
#define UART_FIFOINT_TXLVL					(1 << 2)							/**	 TX FIFO ready interrupt	[BIT-2 of FIFOINTENSET/FIFOINTENCLR/FIFOINTSTAT register] */
#define UART_FIFOINT_RXLVL					(1 << 3)							/**	 RX Data ready interrupt	[BIT-3 of FIFOINTENSET/FIFOINTENCLR/FIFOINTSTAT register] */
#define UART_FIFOINT_PERINT					(1 << 4)							/**	 UART peripheral interrupt	[BIT-4 of FIFOINTSTAT register] */

/**
 * @brief	Fractional Divider clock sources
 */
typedef enum {
	SYSCON_FRGCLKSRC_MAINCLK,     /*!< Main Clock */
	SYSCON_FRGCLKSRC_PLL,         /*!< Output clock from PLL */
	SYSCON_FRGCLKSRC_FRO12MHZ,    /*!< FRO 12-MHz */
	SYSCON_FRGCLKSRC_FROHF,       /*!< FRO High Frequency (48 or 96) MHz */
	SYSCON_FRGCLKSRC_NONE = 7     /*!< No clock input */
}CHIP_SYSCON_FRGCLKSRC_T;

/**
 * Clock sources for FLEXCOMM clock source select
 */
typedef enum {
	SYSCON_FLEXCOMMCLKSELSRC_FRO12MHZ = 0,		/*!< FRO 12-MHz */
	SYSCON_FLEXCOMMCLKSELSRC_FROHF,             /*!< HF-FRO 48-MHz or 96-MHz */
	SYSCON_FLEXCOMMCLKSELSRC_PLL,               /*!< PLL output */
	SYSCON_FLEXCOMMCLKSELSRC_MCLK,              /*!< MCLK output */
	SYSCON_FLEXCOMMCLKSELSRC_FRG,               /*!< FRG output */
	SYSCON_FLEXCOMMCLKSELSRC_NONE = 7           /*!< NONE output */
} CHIP_SYSCON_FLEXCOMMCLKSELSRC_T;

#ifdef __cplusplus
}
#endif

#endif /*__SYSTEM_STM32F4XX_H */

