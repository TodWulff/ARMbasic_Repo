/****************************************************************************
 *   $Id:: uart.h 3926 2010-07-22 22:51:00Z usb00423                        $
 *   Project: NXP LPC122x software example
 *
 *   Description:
 *     This file contains definition and prototype for UART configuration.
 *
 ****************************************************************************
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * products. This software is supplied "AS IS" without any warranties.
 * NXP Semiconductors assumes no responsibility or liability for the
 * use of the software, conveys no license or title under any patent,
 * copyright, or mask work right to the product. NXP Semiconductors
 * reserves the right to make changes in the software without
 * notification. NXP Semiconductors also make no representation or
 * warranty that such application will be suitable for the specified
 * use without further testing or modification.
****************************************************************************/
#ifndef __UART_H 
#define __UART_H

#define RS485_ENABLED   0
#define TX_INTERRUPT    0		/* 0 if TX uses polling, 1 interrupt driven. */
#define MODEM_TEST      0

#define IER_RBR         (0x01<<0)
#define IER_THRE        (0x01<<1)
#define IER_RLS         (0x01<<2)

#define IIR_PEND        0x01
#define IIR_RLS         (0x03<<1)
#define IIR_RDA         (0x02<<1)
#define IIR_CTI         (0x06<<1)
#define IIR_THRE        (0x01<<1)

#define LSR_RDR         (0x01<<0)
#define LSR_OE          (0x01<<1)
#define LSR_PE          (0x01<<2)
#define LSR_FE          (0x01<<3)
#define LSR_BI          (0x01<<4)
#define LSR_THRE        (0x01<<5)
#define LSR_TEMT        (0x01<<6)
#define LSR_RXFE        (0x01<<7)

#define BUFSIZE         0x40

/* RS485 mode definition. */
#define RS485_NMMEN		(0x1<<0)
#define RS485_RXDIS		(0x1<<1)
#define RS485_AADEN		(0x1<<2)
#define RS485_SEL		(0x1<<3)
#define RS485_DCTRL		(0x1<<4)
#define RS485_OINV		(0x1<<5)

void ModemInit( uint32_t location );
void SetupUART_Location(uint32_t portNum, uint32_t location);
void UARTInit(uint32_t portNum, uint32_t Baudrate);
void UART0_IRQHandler(void);
void UART1_IRQHandler(void);
void UARTSend(uint32_t portNum, uint8_t *BufferPtr, uint32_t Length);



/* Public Macros -------------------------------------------------------------- */
/** @defgroup UART_Public_Macros
  * @{
  */
  
/* Macro to define bit mask */ 
#define UART_RBR_MASKBIT    ((uint8_t)0xFF) /* Received Buffer mask bit  */
#define UART_THR_MASKBIT    ((uint8_t)0xFF) /* Transmit Holding mask bit  */ 
#define UART_IER_BITMASK    ((uint32_t)(0x307)) /* IER normal bit mask */
#define UART_IER_BITMASK2   ((uint32_t)(0x38F)) /* IER include modem bit mask */
#define UART_IIR_BITMASK    ((uint32_t)(0x3CF)) /* IIR bit mask */
#define UART_FCR_BITMASK    ((uint8_t)(0xCF))   /* FCR bit mask */
#define UART_LCR_BITMASK    ((uint8_t)(0xFF))   /* LCR bit mask */
#define UART_MCR_BITMASK    ((uint8_t)(0xF3))   /* MCR bit mask */
#define UART_LSR_BITMASK    ((uint8_t)(0xFF))   /* LSR bit mask */
#define UART_MSR_BITMASK    ((uint8_t)(0xFF))   /* MSR register bit mask */
#define UART_SCR_BIMASK     ((uint8_t)(0xFF))   /* UART Scratch Pad bit mask */
#define UART_ACR_BITMASK    ((uint32_t)(0x307)) /* ACR bit mask */
#define UART_ICR_BITMASK    ((uint32_t)(0x3F))  /* IRDA bit mask */
#define UART_FDR_BITMASK    ((uint32_t)(0xFF))  /* FDR bit mask */
#define UART_TER_BITMASK    ((uint8_t)(0x80))   /* TER bit mask */
#define UART_RS485CTRL_BITMASK     ((uint32_t)(0x3F))  /* 485 CTRL bit mask */
#define UART_RS485ADRMATCH_BITMASK ((uint8_t)(0xFF))   /* 485 ADR bit mask */
#define UART_RS485DLY_BITMASK      ((uint8_t)(0xFF))   /* 485 DLY bit mask */
#define UART_FIFOLVL_BITMASK       ((uint32_t)(0x0F0F))/* 485 FIFOLVL bit mask */

/* Macro to define control bit */
#define UART_LCR_DLAB_EN        ((uint8_t)(1<<7))   /* DivisorLatchesAccess enable*/
#define UART_FCR_FIFO_EN        ((uint8_t)(1<<0))   /* FIFO enable */
#define UART_FCR_RX_RS          ((uint8_t)(1<<1))   /* FIFO RX reset */
#define UART_FCR_TX_RS          ((uint8_t)(1<<2))   /* FIFO TX reset */
#define UART_TER_TXEN           ((uint8_t)(1<<7))   /* Transmit enable bit */
#define UART_ACR_START          ((uint32_t)(1<<0))  /* Auto baudrate Start */
#define UART_ACR_ABEOINT_CLR    ((uint32_t)(1<<8))  /* Auto baudrate end INT clear */
#define UART_ACR_ABTOINT_CLR    ((uint32_t)(1<<9))  /* Auto baudrate Ttime-out INT clear */

/* Macro to define caculate */
#define UART_LOAD_DLL(div)        ((div) & 0xFF) 
#define UART_LOAD_DLM(div)        (((div) >> 8) & 0xFF)
#define UART_FDR_DIVADDVAL(n)     ((uint32_t)(n&0x0F))      /* Pre-scaler divisor */
#define UART_FDR_MULVAL(n)        ((uint32_t)((n<<4)&0xF0)) /* Multiplier value */
#define UART_FIFOLVL_RXFIFOLVL(n) ((uint32_t)(n&0x0F))      /*receiver FIFO */
#define UART_FIFOLVL_TXFIFOLVL(n) ((uint32_t)((n>>8)&0x0F)) /*transmitter FIFO */

/* Macro to define parameter */
#define UART_ACCEPTED_BAUDRATE_ERROR  (5) /* Acceptable baudrate error, 1/2(n) percent */
#define UART_TX_FIFO_SIZE             (16)
#define UART_DEVICE_NUMBER            (2)
  

/* @brief UART_databit_type definitions  
  * @{
  */
#define UART_CFG_DATABIT_5   ((uint8_t)(0))       /* UART 5 bit data mode */
#define UART_CFG_DATABIT_6   ((uint8_t)(1<<0))    /* UART 6 bit data mode */
#define UART_CFG_DATABIT_7   ((uint8_t)(2<<0))    /* UART 7 bit data mode */
#define UART_CFG_DATABIT_8   ((uint8_t)(3<<0))    /* UART 8 bit data mode */
#define PARAM_UART_DATABIT(databit) ((databit==UART_CFG_DATABIT_5) || \
                                     (databit==UART_CFG_DATABIT_6) || \
                                     (databit==UART_CFG_DATABIT_7) || \
                                     (databit==UART_CFG_DATABIT_8))
/**
  * @}
  */   
  
/*@brief UART_stopbit_type definitions 
  * @{
  */
#define UART_CFG_STOPBIT_1   ((uint8_t)(0))      /* UART 1 Stop Bits Select */
#define UART_CFG_STOPBIT_2   ((uint8_t)(1<<2))   /* UART Two Stop Bits Select */
#define PARAM_UART_STOPBIT(stopbit) ((stopbit==UART_CFG_STOPBIT_1) || \
                                     (stopbit==UART_CFG_STOPBIT_2))
/**
  * @}
  */

/* @brief UART_parity_type definitions 
  * @{
  */
#define UART_CFG_PARITY_NONE   ((uint8_t)(0))     /* No parity */
#define UART_CFG_PARITY_ODD    ((uint8_t)(1<<3))  /* Odd parity */
#define UART_CFG_PARITY_EVEN   ((uint8_t)(3<<3))  /* Even parity */
#define UART_CFG_PARITY_MARK   ((uint8_t)(5<<3))  /* Forced "1" stick parity */
#define UART_CFG_PARITY_SPACE  ((uint8_t)(7<<3))  /* Forced "0" stick parity */
#define PARAM_UART_PARITY(parity)   ((parity==UART_CFG_PARITY_NONE) || \
                                     (parity==UART_CFG_PARITY_ODD)  || \
                                     (parity==UART_CFG_PARITY_EVEN) || \
                                     (parity==UART_CFG_PARITY_MARK) || \
                                     (parity==UART_CFG_PARITY_SPACE))
/**
  * @}
  */

/* @brief FIFO_level_type definitions 
  * @{
  */
#define UART_CFG_FIFOTRG_1   ((uint8_t)(0))    /* UART FIFO trigger level 0: 1 char */
#define UART_CFG_FIFOTRG_4   ((uint8_t)(1<<6)) /* UART FIFO trigger level 1: 4 char */
#define UART_CFG_FIFOTRG_8   ((uint8_t)(2<<6)) /* UART FIFO trigger level 2: 8 char */
#define UART_CFG_FIFOTRG_14  ((uint8_t)(3<<6)) /* UART FIFO trigger level 3: 14 char */
#define PARAM_UART_FIFO_LEVEL(fifo) ((fifo==UART_CFG_FIFOTRG_1) || \
                                     (fifo==UART_CFG_FIFOTRG_4) || \
                                     (fifo==UART_CFG_FIFOTRG_8) || \
                                     (fifo==UART_CFG_FIFOTRG_14))
/**
  * @}
  */

/*@brief FIFO_dmamode_type definitions  
  * @{
  */
#define UART_CFG_DMAMODE_DISABLE  ((uint8_t)(0))     /* UART DMA mode disable */
#define UART_CFG_DMAMODE_ENABLE   ((uint8_t)(1<<3))  /* UART DMA mode enable  */
#define PARAM_UART_FIFO_DMA(fifo)   ((fifo==UART_CFG_DMAMODE_DISABLE) ||\
                                     (fifo==UART_CFG_DMAMODE_ENABLE))
/**
  * @}
  */
                                     
/*@brief TXD_break_forced_type definitions   
  * @{
  */
#define UART_CFG_TXDBREAK_DISABLE  ((uint8_t)(0))      /* TXD Break disable */
#define UART_CFG_TXDBREAK_ENABLE   ((uint8_t)(1<<6))   /* TXD Break enable */
#define PARAM_UART_TXDBREAK(type)   ((type==UART_CFG_TXDBREAK_DISABLE) ||\
                                     (type==UART_CFG_TXDBREAK_ENABLE))
/**
  * @}
  */

/*@brief UART_interrupt_type definitions   
  * @{
  */
#define UART_INTCFG_RBR  ((uint16_t)(1<<0)) /* RBR Interrupt enable*/
#define UART_INTCFG_THRE ((uint16_t)(1<<1)) /* THR Interrupt enable*/
#define UART_INTCFG_RLS  ((uint16_t)(1<<2)) /* RX line status interrupt enable*/
#define UART_MSINT_EN    ((uint32_t)(1<<3)) /*!< Modem status interrupt enable */
#define UART_CTSINT_EN   ((uint32_t)(1<<7)) /*!< CTS1 signal transition interrupt enable */
#define UART_INTCFG_ABEO ((uint16_t)(1<<8)) /* the end of auto-baud interrupt */
#define UART_INTCFG_ABTO ((uint16_t)(1<<9)) /* the auto-baud time-out interrupt */
#define PARAM_UART_INTCFG(intcfg)   ((intcfg == UART_INTCFG_RBR)  ||\
                                     (intcfg == UART_INTCFG_THRE) ||\
                                     (intcfg == UART_INTCFG_RLS)  ||\
                                     (intcfg == UART_MSINT_EN)    ||\
                                     (intcfg == UART_CTSINT_EN)   ||\
                                     (intcfg == UART_INTCFG_ABEO) ||\
                                     (intcfg == UART_INTCFG_ABTO))
/**
  * @}
  */
  
/*@brief UART_int_status_type definitions   
  * @{
  */

#define UART_INTSTAT_PEND              ((uint16_t)(1<<0))  /* Active low */
#define UART_INTSTAT_RX_LINE_STAT      ((uint16_t)(3<<1))  /* Receive line status*/
#define UART_INTSTAT_RX_DATA_AVAILABLE ((uint16_t)(2<<1))  /* Receive data available*/
#define UART_INTSTAT_RX_TIMEOUT        ((uint16_t)(6<<1))  /* Character time-out indicator*/
#define UART_INTSTAT_TX_READY          ((uint16_t)(1<<1))  /* THRE interrupt*/
#define UART_INTSTAT_MODEM             ((uint16_t)(0<<1))  /* Modem interrupt*/
#define UART_INTSTAT_AUTO_END          ((uint16_t)(1<<8))  /* End of auto-baud interrupt */
#define UART_INTSTAT_AUTO_TIMOUT       ((uint16_t)(1<<9))  /* Autobaud time-out interrupt */

/**
  * @}
  */
  
/*@brief UART_line_status_type definitions   
  * @{
  */
#define UART_LS_RX_DATA_READY ((uint8_t)(1<<0)) /*Receive data ready*/
#define UART_LS_RX_FIFO_FULL  ((uint8_t)(1<<1)) /*Overrun error: RX fifo overflow*/
#define UART_LS_PARITY_ERROR  ((uint8_t)(1<<2)) /*Parity error*/
#define UART_LS_FRAMING_ERROR ((uint8_t)(1<<3)) /*Framing error*/
#define UART_LS_BREAK_INT     ((uint8_t)(1<<4)) /*Break interrupt*/
#define UART_LS_TX_EMPTY      ((uint8_t)(1<<5)) /*Transmit holding register THR empty*/
#define UART_LS_TX_EMPTY_ALL  ((uint8_t)(1<<6)) /*Transmitter THR and TSR all empty*/
#define UART_LS_RX_FIFO_ERROR ((uint8_t)(1<<7)) /*Error in RX FIFO or others*/

/**
  * @}
  */
  
/*@brief UART_auto_baudrate_mode_type definitions   
  * @{
  */
#define UART_CFG_AUTOBAUD_MODE0  ((uint8_t)(0))     /* UART Auto baudrate Mode 0 */
#define UART_CFG_AUTOBAUD_MODE1  ((uint8_t)(1<<1)) /* UART Auto baudrate Mode 1 */

#define PARAM_UART_AB_MODE(ABmode) ((ABmode==UART_CFG_AUTOBAUD_MODE0) ||\
                                    (ABmode==UART_CFG_AUTOBAUD_MODE1))

/**
  * @}
  */
  
/*@brief UART_auto_baudrate_restart_type definitions   
  * @{
  */
#define UART_CFG_ABRESTART_DISABLE  ((uint8_t)(0))     /* Auto baudrate disable */
#define UART_CFG_ABRESTART_ENABLE   ((uint8_t)(1<<2)) /* Auto baudrate enable */

#define PARAM_UART_AB_RESTART(type) ((type==UART_CFG_ABRESTART_DISABLE) ||\
                                     (type==UART_CFG_ABRESTART_ENABLE))


/**
  * @}
  */
  
/*@brief UART_modem_status_type definitions   
  * @{
  */
#define UART_MODEM_STAT_DELTA_CTS  ((uint8_t)(1<<0))   /* State change of CTS */
#define UART_MODEM_STAT_DELTA_DSR  ((uint8_t)(1<<1))   /* State change of DSR */
#define UART_MODEM_STAT_LO2HI_RI   ((uint8_t)(1<<2))   /* Low to high transition of RI */
#define UART_MODEM_STAT_DELTA_DCD  ((uint8_t)(1<<3))   /* State change of input DCD */
#define UART_MODEM_STAT_CTS        ((uint8_t)(1<<4))   /* Clear To Send State */
#define UART_MODEM_STAT_DSR        ((uint8_t)(1<<5))   /* Data Set Ready State */
#define UART_MODEM_STAT_RI         ((uint8_t)(1<<6))   /* Ring Indicator State */
#define UART_MODEM_STAT_DCD        ((uint8_t)(1<<7))   /* Data Carrier Detect State */

/**
  * @}
  */
  
/*@brief UART_modem_DTR_pin_type definitions   
  * @{
  */
#define UART_MODEM_PIN_DTR_DISABLE ((uint8_t)(0)) 
#define UART_MODEM_PIN_DTR_ENABLE  ((uint8_t)(1<<0)) /* Modem output pin DTR */
#define PARAM_MODEM_PIN_DTR(x) ((x==UART_MODEM_PIN_DTR_DISABLE) || \
                                (x==UART_MODEM_PIN_DTR_ENABLE))

/**
  * @}
  */
  
/*@brief UART_modem_RTS_pin_type definitions   
  * @{
  */

#define UART_MODEM_PIN_RTS_DISABLE ((uint8_t)(0)) 
#define UART_MODEM_PIN_RTS_ENABLE  ((uint8_t)(1<<1)) /* Modem output pin RTS */  
#define PARAM_MODEM_PIN_RTS(x) ((x==UART_MODEM_PIN_RTS_DISABLE) || \
                                (x==UART_MODEM_PIN_RTS_ENABLE))

/**
  * @}
  */
  
/*@brief UART_modem_loopback_type definitions   
  * @{
  */

#define UART_MODEM_MODE_LOOPBACK_DISABLE ((uint8_t)(0)) 
#define UART_MODEM_MODE_LOOPBACK_ENABLE  ((uint8_t)(1<<4))  /* Loop back mode select */ 
#define PARAM_MODEM_MODE_LOOPBACK(x) ((x==UART_MODEM_MODE_LOOPBACK_DISABLE) || \
                                      (x==UART_MODEM_MODE_LOOPBACK_ENABLE))

/**
  * @}
  */
  
/*@brief UART_modem_autoRTS_type definitions   
  * @{
  */
#define UART_MODEM_MODE_AUTO_RTS_DISABLE ((uint8_t)(0))
#define UART_MODEM_MODE_AUTO_RTS_ENABLE  ((uint8_t)(1<<6)) /* Enable AutoRTS flow-control*/
#define PARAM_MODEM_MODE_AUTO_RTS(x) ((x==UART_MODEM_MODE_AUTO_RTS_DISABLE) || \
                                      (x==UART_MODEM_MODE_AUTO_RTS_ENABLE))

/**
  * @}
  */
  
/*@brief UART_modem_autoCTS_type definitions   
  * @{
  */
#define UART_MODEM_MODE_AUTO_CTS_DISABLE ((uint8_t)(0))
#define UART_MODEM_MODE_AUTO_CTS_ENABLE  ((uint8_t)(1<<7)) /* Enable AutoCTS flow-control*/
#define PARAM_MODEM_MODE_AUTO_CTS(x) ((x==UART_MODEM_MODE_AUTO_CTS_DISABLE) || \
                                      (x==UART_MODEM_MODE_AUTO_CTS_ENABLE))

/**
  * @}
  */
  
/*@brief UART_485_nmm_type definitions   
  * @{
  */
#define UART_RS485_NORMAL_MULTIDROP_DISABLE ((uint8_t)(0))
#define UART_RS485_NORMAL_MULTIDROP_ENABLE  ((uint8_t)(1<<0))  /* Normal Multi-drop Mode */ 
#define PARAM_UART_RS485_NORMAL_MULTIDROP(x) ((x==UART_RS485_NORMAL_MULTIDROP_DISABLE) || \
                                             (x==UART_RS485_NORMAL_MULTIDROP_ENABLE))

/**
  * @}
  */
  
/*@brief UART_485_receiver_type definitions   
  * @{
  */
#define UART_RS485_RECEIVER_ENABLE   ((uint8_t)(0))
#define UART_RS485_RECEIVER_DISABLE  ((uint8_t)(1<<1))  /* The receiver is disabled */
#define PARAM_UART_RS485_RECEIVER(x) ((x==UART_RS485_RECEIVER_ENABLE) || \
                                 (x==UART_RS485_RECEIVER_DISABLE))

/**
  * @}
  */
  
/*@brief UART_485_add_type definitions   
  * @{
  */

#define UART_RS485_AUTO_ADDRRESS_DISABLE ((uint8_t)(0)) 
#define UART_RS485_AUTO_ADDRRESS_ENABLE  ((uint8_t)(1<<2))  /* Auto Address Detect */ 
#define PARAM_UART_RS485_AUTO_ADDRRESS(x) ((x==UART_RS485_AUTO_ADDRRESS_DISABLE) || \
                                      (x==UART_RS485_AUTO_ADDRRESS_ENABLE))

/**
  * @}
  */
  
/*@brief UART_485_dirpin_ctrl_type definitions   
  * @{
  */
#define UART_RS485_DIRPIN_RTS  ((uint8_t)(0))
#define UART_RS485_DIRPIN_DTR  ((uint8_t)(1<<3))  /* Direction control */
#define PARAM_UART_RS485_DIRPIN_SELECT(x) ((x==UART_RS485_DIRPIN_RTS) || \
                                      (x==UART_RS485_DIRPIN_DTR))

/**
  * @}
  */
  
/*@brief UART_485_autodir_type definitions   
  * @{
  */
#define UART_RS485_AUTO_DIRECTION_DISABLE ((uint8_t)(0))
#define UART_RS485_AUTO_DIRECTION_ENABLE  ((uint8_t)(1<<4)) /* Auto Direction Control */
#define PARAM_UART_RS485_AUTO_DIRECTION(x) ((x==UART_RS485_AUTO_DIRECTION_DISABLE) || \
                                           (x==UART_RS485_AUTO_DIRECTION_ENABLE))

/**
  * @}
  */
  
/*@brief UART_485_dirpin_level_type definitions   
  * @{
  */
#define UART_RS485_DIRPIN_LOW   ((uint8_t)(0))
#define UART_RS485_DIRPIN_HIGH  ((uint8_t)(1<<5))  /* Reverses the polarity */
#define PARAM_UART_RS485_DIRPIN_LEVEL(x) ((x==UART_RS485_DIRPIN_LOW) || \
                                          (x==UART_RS485_DIRPIN_HIGH))

/**
  * @}
  */
  
/*@brief UART_irda_mode_type definitions   
  * @{
  */
#define UART_IRDA_DISABLE       ((uint8_t)(0))    /* IrDA mode disable */
#define UART_IRDA_ENABLE        ((uint8_t)(1<<0)) /* IrDA mode enable */
#define PARAM_UART_IRDA_MODE(x) ((x==UART_IRDA_DISABLE) || \
                                 (x==UART_IRDA_ENABLE))

/**
  * @}
  */
  
/*@brief UART_irda_input_invert_type definitions   
  * @{
  */
#define UART_IRDA_INPUTINVERT_NOT   ((uint8_t)(0))    /* IrDA serial not input inverted */
#define UART_IRDA_INPUTINVERTED     ((uint8_t)(1<<1)) /* IrDA serial input inverted */
#define PARAM_UART_IRDA_INPUT(x) ((x==UART_IRDA_INPUTINVERT_NOT) || \
                                  (x==UART_IRDA_INPUTINVERTED))

/**
  * @}
  */
  
/*@brief UART_irda_fixed_pulse_type definitions   
  * @{
  */
#define UART_IRDA_PULSEDIV_NORMAL     ((uint8_t)(0))  
#define UART_IRDA_PULSEDIV_2          ((uint8_t)(0x1<<2))
#define UART_IRDA_PULSEDIV_4          ((uint8_t)(0x3<<2))
#define UART_IRDA_PULSEDIV_8          ((uint8_t)(0x5<<2))
#define UART_IRDA_PULSEDIV_16         ((uint8_t)(0x7<<2)) 
#define UART_IRDA_PULSEDIV_32         ((uint8_t)(0x9<<2))
#define UART_IRDA_PULSEDIV_64         ((uint8_t)(0xB<<2))
#define UART_IRDA_PULSEDIV_128        ((uint8_t)(0xD<<2))
#define UART_IRDA_PULSEDIV_256        ((uint8_t)(0xF<<2))
#define PARAM_UART_IRDA_PULSEDIV(x) ((x==UART_IRDA_PULSEDIV_NORMAL) || \
                                     (x==UART_IRDA_PULSEDIV_2)      || \
                                     (x==UART_IRDA_PULSEDIV_4)      || \
                                     (x==UART_IRDA_PULSEDIV_8)      || \
                                     (x==UART_IRDA_PULSEDIV_16)     || \
                                     (x==UART_IRDA_PULSEDIV_64)     || \
                                     (x==UART_IRDA_PULSEDIV_128)    || \
                                     (x==UART_IRDA_PULSEDIV_256))
/**
  * @}
  */

/*@brief UART_process_time_delay definitions   
  * @{
  */

#define UART_BLOKING_TIMEOUT          (0xFFFFFFFFUL)
#define UART_NO_TIMEOUT               (0x1UL)
#define PARAM_UART_PROCESS_DELAY(x) ((x==UART_BLOKING_TIMEOUT) || \
                                     (x==UART_NO_TIMEOUT))

/**
  * @}
  */

/**
 * @}
 */


#endif /* end __UART_H */
/*****************************************************************************
**                            End Of File
******************************************************************************/
