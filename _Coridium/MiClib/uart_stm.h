/**
  ******************************************************************************
  * @file    system_stm32f4xx.h
  * @author  MCD Application Team
  * @version V2.4.1
  * @date    09-October-2015
  * @brief   CMSIS Cortex-M4 Device System Source File for STM32F4xx devices.       
  ******************************************************************************  
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2015 STMicroelectronics</center></h2>
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

/** @addtogroup CMSIS
  * @{
  */

/** @addtogroup stm32f4xx_system
  * @{
  */  
  
/**
  * @brief Define to prevent recursive inclusion
  */
#ifndef __UART_H
#define __UART_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f411.h"

#define XON 		0x11
#define XOFF		0x13
#define BACKSPACE	0x8
#define SPACE		0x20
#define TAB	 		0x09
#define ESC	 		27				//these 2 will stop the interpreter in serial mode
#define CTRLC 		3
#define EOTX 		4				//sent back when program finishes
#define SOH 		1				//sent back when program starts



#define U_F_TXE        ((uint32_t)0x00000080)
#define U_F_RXNE       ((uint32_t)0x00000020)

#define UART_DIV_SAMPLING16(_PCLK_, _BAUD_)            (((_PCLK_)*25)/(4*(_BAUD_)))
#define UART_DIVMANT_SAMPLING16(_PCLK_, _BAUD_)        (UART_DIV_SAMPLING16((_PCLK_), (_BAUD_))/100)
#define UART_DIVFRAQ_SAMPLING16(_PCLK_, _BAUD_)        (((UART_DIV_SAMPLING16((_PCLK_), (_BAUD_)) - (UART_DIVMANT_SAMPLING16((_PCLK_), (_BAUD_)) * 100)) * 16 + 50) / 100)
#define UART_BRR_SAMPLING16(_PCLK_, _BAUD_)            ((UART_DIVMANT_SAMPLING16((_PCLK_), (_BAUD_)) << 4)|(UART_DIVFRAQ_SAMPLING16((_PCLK_), (_BAUD_)) & 0x0F))

#define UART_RX_BUFFER_SIZE	256			// must be powers of 2
#define UART_TX_BUFFER_SIZE	128
#define TX_INTERRUPT    1		/* 0 if TX uses polling, 1 interrupt driven. */// bte is this needed anymore

void UART_init(int uartNUM, unsigned int baud);

int getchar(void) ;		// from  UART2
int getc(int UARTnum) ;
char * fgets(char *string, int maxcount, int UARTnum);
char * gets(char *string);

int putchar(int ch) ;	// to UART2

int putc(int ch, int UARTnum) ;
//int fputs(char *string, int UARTnum);


extern int 	uart0_rx_insert_idx, uart0_rx_extract_idx, uart0_tx_insert_idx, uart0_tx_extract_idx;
extern int 	uart1_rx_insert_idx, uart1_rx_extract_idx, uart1_tx_insert_idx, uart1_tx_extract_idx;
extern int 	uart2_rx_insert_idx, uart2_rx_extract_idx, uart2_tx_insert_idx, uart2_tx_extract_idx;
extern int 	uart3_rx_insert_idx, uart3_rx_extract_idx, uart3_tx_insert_idx, uart3_tx_extract_idx;

extern char uart0_rx_buffer[];
extern char uart1_rx_buffer[];
extern char uart2_rx_buffer[];
extern char uart3_rx_buffer[];

int uart_txfree(int UARTnum);

#ifdef __cplusplus
}
#endif

#endif /*__SYSTEM_STM32F4XX_H */

