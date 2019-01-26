' Teensyduino Core Library
' http://www.pjrc.com/teensy/
' Copyright (c) 2013 PJRC.COM, LLC.

' Permission is hereby granted, free of charge, to any person obtaining
' a copy of this software and associated documentation files (the
' "Software"), to deal in the Software without restriction, including
' without limitation the rights to use, copy, modify, merge, publish,
' distribute, sublicense, and/or sell copies of the Software, and to
' permit persons to whom the Software is furnished to do so, subject to
' the following conditions:

' 1. The above copyright notice and this permission notice shall be 
' included in all copies or substantial portions of the Software.

' 2. If the Software is incorporated into a build system that allows 
' selection among a list of target devices, then similar target
' devices manufactured by PJRC.COM must be included in the list of
' target devices and selectable in the same manner.

' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
' EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
' MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
' NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
' BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
' ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
' CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
' SOFTWARE.


#ifndef _mk20dx128_h_
#define _mk20dx128_h_


' Interrupt Number Definitions
' .vectortable starts at 0x1FFFE400
#if defined MK20DX128
#define PSV_ISR              *&H1FFFE438 ' 14: The PendSV handler
#define SYSTICK_ISR          *&H1FFFE43C ' 15: Cortex-M4 System Tick Interrupt
#define DMA0_ISR             *&H1FFFE440 ' 16: DMA channel 0 transfer complete interrupt
#define DMA1_ISR             *&H1FFFE444 ' 17: DMA channel 1 transfer complete interrupt
#define DMA2_ISR             *&H1FFFE448 ' 18: DMA channel 2 transfer complete interrupt
#define DMA3_ISR             *&H1FFFE44C ' 19: DMA channel 3 transfer complete interrupt
#define DMA_ERROR_ISR        *&H1FFFE450 ' 20: DMA error interrupt
'  Reserved21_ISR            *&H1FFFE454   21: Reserved interrupt 21
#define FLASH_CMD_SR         *&H1FFFE458 ' 22: Flash Memory Command Complete interrupt
#define FLASH_ERROR_ISR      *&H1FFFE45C ' 23: Flash Read collision interrupt
#define LVD_LVW_ISR          *&H1FFFE460 ' 24: Low Voltage Detect, Low Voltage Warning
#define LLW_ISR              *&H1FFFE464 ' 25: Low Leakage Wakeup
#define WDT_ISR              *&H1FFFE468 ' 26: WDOG interrupt
#define I2C0_ISR             *&H1FFFE46C ' 27: I2C0 interrupt
#define SPI0_ISR             *&H1FFFE470 ' 28: SPI0 interrupt
#define I2S0_TX_ISR          *&H1FFFE474 ' 29: I2S0 transmit interrupt
#define I2S0_RX_ISR          *&H1FFFE478 ' 30: I2S0 receive interrupt
#define UART0_LON_ISR        *&H1FFFE47C ' 31: UART0 LON interrupt
#define UART0_STATUS_ISR     *&H1FFFE480 ' 32: UART0 receive/transmit interrupt
#define UART0_ERROR_ISR      *&H1FFFE484 ' 33: UART0 error interrupt
#define UART1_STATUS_ISR     *&H1FFFE488 ' 34: UART1 receive/transmit interrupt
#define UART1_ERROR_ISR      *&H1FFFE48C ' 35: UART1 error interrupt
#define UART2_STATUS_ISR     *&H1FFFE490 ' 36: UART2 receive/transmit interrupt
#define UART2_ERROR_ISR      *&H1FFFE494 ' 37: UART2 error interrupt
#define ADC0_ISR             *&H1FFFE498 ' 38: ADC0 interrupt
#define CMP0_ISR             *&H1FFFE49C ' 39: CMP0 interrupt
#define CMP1_ISR             *&H1FFFE4A0 ' 40: CMP1 interrupt
#define FTM0_ISR             *&H1FFFE4A4 ' 41: FTM0 fault, overflow and channels interrupt
#define FTM1_ISR             *&H1FFFE4A8 ' 42: FTM1 fault, overflow and channels interrupt
#define CMT_ISR              *&H1FFFE4AC ' 43: CMT interrupt
#define RTC_ALARM_ISR        *&H1FFFE4B0 ' 44: RTC interrupt
#define RTC_SECONDS_ISR      *&H1FFFE4B4 ' 45: RTC seconds interrupt
#define PIT0_ISR             *&H1FFFE4B8 ' 46: PIT timer channel 0 interrupt
#define PIT1_ISR             *&H1FFFE4BC ' 47: PIT timer channel 1 interrupt
#define PIT2_ISR             *&H1FFFE4C0 ' 48: PIT timer channel 2 interrupt
#define PIT3_ISR             *&H1FFFE4C4 ' 49: PIT timer channel 3 interrupt
#define PDB_ISR              *&H1FFFE4C8 ' 50: PDB interrupt
#define USB_ISR              *&H1FFFE4CC ' 51: USB interrupt
#define USBDCD_ISR           *&H1FFFE4D0 ' 52: USBDCD interrupt
#define TSI0_ISR             *&H1FFFE4D4 ' 53: TSI0 interrupt
#define MCG_ISR              *&H1FFFE4D8 ' 54: MCG interrupt
#define LPTMR_ISR            *&H1FFFE4DC ' 55: LPTimer interrupt
#define PORTA_ISR            *&H1FFFE4E0 ' 56: Port A interrupt
#define PORTB_ISR            *&H1FFFE4E4 ' 57: Port B interrupt
#define PORTC_ISR            *&H1FFFE4E8 ' 58: Port C interrupt
#define PORTD_ISR            *&H1FFFE4EC ' 59: Port D interrupt
#define PORTE_ISR            *&H1FFFE4F0 ' 60: Port E interrupt
#define SOFTWARE_IRQHandler  *&H1FFFE4F4 ' 61: Software interrupt

  ' Device specific interrupts
#define DMA0_IRQn            0           ' DMA channel 0 transfer complete interrupt
#define DMA1_IRQn            1           ' DMA channel 1 transfer complete interrupt
#define DMA2_IRQn            2           ' DMA channel 2 transfer complete interrupt
#define DMA3_IRQn            3           ' DMA channel 3 transfer complete interrupt
#define DMA_Error_IRQn       4           ' DMA error interrupt
#define FTFL_IRQn            6           ' FTFL interrupt
#define Read_Collision_IRQn  7           ' Read collision interrupt
#define LVD_LVW_IRQn         8           ' Low Voltage Detect Low Voltage Warning
#define LLW_IRQn             9           ' Low Leakage Wakeup
#define WDT_IRQn             10          ' WDOG interrupt
#define I2C0_IRQn            11          ' I2C0 interrupt
#define SPI0_IRQn            12          ' SPI0 interrupt
#define I2S0_Tx_IRQn         13          ' I2S0 transmit interrupt
#define I2S0_Rx_IRQn         14          ' I2S0 receive interrupt
#define UART0_LON_IRQn       15          ' UART0 LON interrupt
#define UART0_RX_TX_IRQn     16          ' UART0 receive/transmit interrupt
#define UART0_ERR_IRQn       17          ' UART0 error interrupt
#define UART1_RX_TX_IRQn     18          ' UART1 receive/transmit interrupt
#define UART1_ERR_IRQn       19          ' UART1 error interrupt
#define UART2_RX_TX_IRQn     20          ' UART2 receive/transmit interrupt
#define UART2_ERR_IRQn       21          ' UART2 error interrupt
#define ADC0_IRQn            22          ' ADC0 interrupt
#define CMP0_IRQn            23          ' CMP0 interrupt
#define CMP1_IRQn            24          ' CMP1 interrupt
#define FTM0_IRQn            25          ' FTM0 fault overflow and channels interrupt
#define FTM1_IRQn            26          ' FTM1 fault overflow and channels interrupt
#define CMT_IRQn             27          ' CMT interrupt
#define RTC_IRQn             28          ' RTC interrupt
#define RTC_Seconds_IRQn     29          ' RTC seconds interrupt
#define PIT0_IRQn            30          ' PIT timer channel 0 interrupt
#define PIT1_IRQn            31          ' PIT timer channel 1 interrupt
#define PIT2_IRQn            32          ' PIT timer channel 2 interrupt
#define PIT3_IRQn            33          ' PIT timer channel 3 interrupt
#define PDB0_IRQn            34          ' PDB0 interrupt
#define USB0_IRQn            35          ' USB0 interrupt
#define USBDCD_IRQn          36          ' USBDCD interrupt
#define TSI0_IRQn            37          ' TSI0 interrupt
#define MCG_IRQn             38          ' MCG interrupt
#define LPTimer_IRQn         39          ' LPTimer interrupt
#define PORTA_IRQn           40          ' Port A interrupt
#define PORTB_IRQn           41          ' Port B interrupt
#define PORTC_IRQn           42          ' Port C interrupt
#define PORTD_IRQn           43          ' Port D interrupt
#define PORTE_IRQn           44          ' Port E interrupt
#define SWI_IRQn             45          ' Software interrupt

#elif defined MK20DX256
' .vectortable starts at 0x1FFF8400
#define PSV_ISR              *&H1FFF8438 ' 14: Cortex-M4 Pend SV Interrupt
#define SYSTICK_ISR          *&H1FFF843C ' 15: Cortex-M4 System Tick Interrupt
#define DMA0_ISR             *&H1FFF8440 ' 16: DMA Channel 0 Transfer Complete
#define DMA1_ISR             *&H1FFF8444 ' 17: DMA Channel 1 Transfer Complete
#define DMA2_ISR             *&H1FFF8448 ' 18: DMA Channel 2 Transfer Complete
#define DMA3_ISR             *&H1FFF844C ' 19: DMA Channel 3 Transfer Complete
#define DMA4_ISR             *&H1FFF8450 ' 20: DMA Channel 4 Transfer Complete
#define DMA5_ISR             *&H1FFF8454 ' 21: DMA Channel 5 Transfer Complete
#define DMA6_ISR             *&H1FFF8458 ' 22: DMA Channel 6 Transfer Complete
#define DMA7_ISR             *&H1FFF845C ' 23: DMA Channel 7 Transfer Complete
#define DMA8_ISR             *&H1FFF8460 ' 24: DMA Channel 8 Transfer Complete
#define DMA9_ISR             *&H1FFF8464 ' 25: DMA Channel 9 Transfer Complete
#define DMA10_ISR            *&H1FFF8468 ' 26: DMA Channel 10 Transfer Complete
#define DMA11_ISR            *&H1FFF846C ' 27: DMA Channel 11 Transfer Complete
#define DMA12_ISR            *&H1FFF8470 ' 28: DMA Channel 12 Transfer Complete
#define DMA13_ISR            *&H1FFF8474 ' 29: DMA Channel 13 Transfer Complete
#define DMA14_ISR            *&H1FFF8478 ' 30: DMA Channel 14 Transfer Complete
#define DMA15_ISR            *&H1FFF847C ' 31: DMA Channel 15 Transfer Complete
#define DMA_ERROR_ISR        *&H1FFF8480 ' 32: DMA Error Interrupt
#define MCM_ISR              *&H1FFF8484 ' 33: Normal interrupt
#define FLASH_CMD_ISR        *&H1FFF8488 ' 34: Flash Memory Command Complete interrupt
#define FLASH_ERROR_ISR      *&H1FFF848C ' 35: Flash Read Collision Interrupt
#define LVD_LVW_ISR          *&H1FFF8490 ' 36: Low Voltage Detect, Low Voltage Warning
#define LLW_ISR              *&H1FFF8494 ' 37: Low Leakage Wakeup
#define WDT_ISR              *&H1FFF8498 ' 38: WDOG Interrupt
'#define Reserved39_ISR      *&H1FFF849C   39: Reserved Interrupt 39
#define I2C0_ISR             *&H1FFF84A0 ' 40: I2C0 interrupt
#define I2C1_ISR             *&H1FFF84A4 ' 41: I2C1 interrupt
#define SPI0_ISR             *&H1FFF84A8 ' 42: SPI0 Interrupt
#define SPI1_ISR             *&H1FFF84AC ' 43: SPI1 Interrupt
'#define Reserved44_ISR      *&H1FFF84B0   44: Reserved interrupt 44
#define CAN0_ORD_MESSAGE_ISR *&H1FFF84B4 ' 45: CAN0 ORd Message Buffers Interrupt
#define CAN0_BUS_OFF_ISR     *&H1FFF84B8 ' 46: CAN0 Bus Off Interrupt
#define CAN0_ERROR_ISR       *&H1FFF84BC ' 47: CAN0 Error Interrupt
#define CAN0_TX_WARNING_ISR  *&H1FFF84C0 ' 48: CAN0 Tx Warning Interrupt
#define CAN0_RX_WARNING_ISR  *&H1FFF84C4 ' 49: CAN0 Rx Warning Interrupt
#define CAN0_WAKE_UP_ISR     *&H1FFF84C8 ' 50: CAN0 Wake Up Interrupt
#define I2S0_TX_ISR          *&H1FFF84CC ' 51: I2S0 transmit interrupt
#define I2S0_RX_ISR          *&H1FFF84D0 ' 52: I2S0 receive interrupt
'#define Reserved53_ISR      *&H1FFF84D4   53: Reserved interrupt 53
'#define Reserved54_ISR      *&H1FFF84D8   54: Reserved interrupt 54
'#define Reserved55_ISR      *&H1FFF84DC   55: Reserved interrupt 55
'#define Reserved56_ISR      *&H1FFF84E0   56: Reserved interrupt 56
'#define Reserved57_ISR      *&H1FFF84E4   57: Reserved interrupt 57
'#define Reserved58_ISR      *&H1FFF84E8   58: Reserved interrupt 58
'#define Reserved59_ISR      *&H1FFF84EC   59: Reserved interrupt 59
#define UART0_LON_ISR        *&H1FFF84F0 ' 60: UART0 LON interrupt
#define UART0_STATUS_ISR     *&H1FFF84F4 ' 61: UART0 Receive/Transmit interrupt
#define UART0_ERROR_ISR      *&H1FFF84F8 ' 62: UART0 Error interrupt
#define UART1_STATUS_ISR     *&H1FFF84FC ' 63: UART1 Receive/Transmit interrupt
#define UART1_ERROR_ISR      *&H1FFF8500 ' 64: UART1 Error interrupt
#define UART2_STATUS_ISR     *&H1FFF8504 ' 65: UART2 Receive/Transmit interrupt
#define UART2_ERROR_ISR      *&H1FFF8508 ' 66: UART2 Error interrupt
#define UART3_STATUS_ISR     *&H1FFF850C ' 67: UART3 Receive/Transmit interrupt
#define UART3_ERROR_ISR      *&H1FFF8510 ' 68: UART3 Error interrupt
#define UART4_STATUS_ISR     *&H1FFF8514 ' 69: UART4 Receive/Transmit interrupt
#define UART4_ERROR_ISR      *&H1FFF8518 ' 70: UART4 Error interrupt
'#define Reserved71_ISR      *&H1FFF851C   71: Reserved interrupt 71
'#define Reserved72_ISR      *&H1FFF8520   72: Reserved interrupt 72
#define ADC0_ISR             *&H1FFF8524 ' 73: ADC0 interrupt
#define ADC1_ISR             *&H1FFF8528 ' 74: ADC1 interrupt
#define CMP0_ISR             *&H1FFF852C ' 75: CMP0 interrupt
#define CMP1_ISR             *&H1FFF8530 ' 76: CMP1 interrupt
#define CMP2_ISR             *&H1FFF8534 ' 77: CMP2 interrupt
#define FTM0_ISR             *&H1FFF8538 ' 78: FTM0 fault, overflow and channels interrupt
#define FTM1_ISR             *&H1FFF853C ' 79: FTM1 fault, overflow and channels interrupt
#define FTM2_ISR             *&H1FFF8540 ' 80: FTM2 fault, overflow and channels interrupt
#define CMT_ISR              *&H1FFF8544 ' 81: CMT interrupt
#define RTC_ALARM_ISR        *&H1FFF8548 ' 82: RTC interrupt
#define RTC_SECONDS_ISR      *&H1FFF854C ' 83: RTC seconds interrupt
#define PIT0_ISR             *&H1FFF8550 ' 84: PIT timer channel 0 interrupt
#define PIT1_ISR             *&H1FFF8554 ' 85: PIT timer channel 1 interrupt
#define PIT2_ISR             *&H1FFF8558 ' 86: PIT timer channel 2 interrupt
#define PIT3_ISR             *&H1FFF855C ' 87: PIT timer channel 3 interrupt
#define PDB_ISR              *&H1FFF8560 ' 88: PDB Interrupt
#define USB_ISR              *&H1FFF8564 ' 89: USB interrupt
#define USBDCD_ISR           *&H1FFF8568 ' 90: USBDCD Interrupt
'#define Reserved91_ISR      *&H1FFF856C   91: Reserved interrupt 91
'#define Reserved92_ISR      *&H1FFF8570   92: Reserved interrupt 92
'#define Reserved93_ISR      *&H1FFF8574   93: Reserved interrupt 93
'#define Reserved94_ISR      *&H1FFF8578   94: Reserved interrupt 94
'#define Reserved95_ISR      *&H1FFF857C   95: Reserved interrupt 95
'#define Reserved96_ISR      *&H1FFF8580   96: Reserved interrupt 96
#define DAC0_ISR             *&H1FFF8584 ' 97: DAC0 interrupt
'#define Reserved98_ISR      *&H1FFF8588   98: Reserved interrupt 98
#define TSI0_ISR             *&H1FFF858C ' 99: TSI0 Interrupt
#define MCG_ISR              *&H1FFF8590 ' 100:MCG Interrupt
#define LPTMR_ISR            *&H1FFF8594 ' 101:LPTimer interrupt
'#define Reserved102_ISR     *&H1FFF8598   102:Reserved interrupt 102
#define PORTA_ISR            *&H1FFF859C ' 103:Port A interrupt
#define PORTB_ISR            *&H1FFF85A0 ' 104:Port B interrupt
#define PORTC_ISR            *&H1FFF85A4 ' 105:Port C interrupt
#define PORTD_ISR            *&H1FFF85A8 ' 106:Port D interrupt
#define PORTE_ISR            *&H1FFF85AC ' 107:Port E interrupt
'#define Reserved108_ISR     *&H1FFF85B0   108:Reserved interrupt 108
'#define Reserved109_ISR     *&H1FFF85B4   109:Reserved interrupt 109
#define SOFTWARE_IRQHandler  *&H1FFF85B8 ' 110:Software interrupt

#define DMA0_IRQn            0           ' DMA Channel 0 Transfer Complete
#define DMA1_IRQn            1           ' DMA Channel 1 Transfer Complete
#define DMA2_IRQn            2           ' DMA Channel 2 Transfer Complete
#define DMA3_IRQn            3           ' DMA Channel 3 Transfer Complete
#define DMA4_IRQn            4           ' DMA Channel 4 Transfer Complete
#define DMA5_IRQn            5           ' DMA Channel 5 Transfer Complete
#define DMA6_IRQn            6           ' DMA Channel 6 Transfer Complete
#define DMA7_IRQn            7           ' DMA Channel 7 Transfer Complete
#define DMA8_IRQn            8           ' DMA Channel 8 Transfer Complete
#define DMA9_IRQn            9           ' DMA Channel 9 Transfer Complete
#define DMA10_IRQn           10          ' DMA Channel 10 Transfer Complete
#define DMA11_IRQn           11          ' DMA Channel 11 Transfer Complete
#define DMA12_IRQn           12          ' DMA Channel 12 Transfer Complete
#define DMA13_IRQn           13          ' DMA Channel 13 Transfer Complete
#define DMA14_IRQn           14          ' DMA Channel 14 Transfer Complete
#define DMA15_IRQn           15          ' DMA Channel 15 Transfer Complete
#define DMA_Error_IRQn       16          ' DMA Error Interrupt
#define MCM_IRQn             17          ' Normal interrupt
#define FTFL_IRQn            18          ' FTFL Interrupt
#define Read_Collision_IRQn  19          ' Read Collision Interrupt
#define LVD_LVW_IRQn         20          ' Low Voltage Detect Low Voltage Warning
#define LLW_IRQn             21          ' Low Leakage Wakeup
#define WDT_IRQn             22          ' WDOG Interrupt
#define I2C0_IRQn            24          ' I2C0 interrupt
#define I2C1_IRQn            25          ' I2C1 interrupt
#define SPI0_IRQn            26          ' SPI0 Interrupt
#define SPI1_IRQn            27          ' SPI1 Interrupt
#define CAN0_ORed_Message_buffer_IRQn  29' CAN0 ORd Message Buffers Interrupt
#define CAN0_Bus_Off_IRQn    30          ' CAN0 Bus Off Interrupt
#define CAN0_Error_IRQn      31          ' CAN0 Error Interrupt
#define CAN0_Tx_Warning_IRQn 32          ' CAN0 Tx Warning Interrupt
#define CAN0_Rx_Warning_IRQn 33          ' CAN0 Rx Warning Interrupt
#define CAN0_Wake_Up_IRQn    34          ' CAN0 Wake Up Interrupt
#define I2S0_Tx_IRQn         35          ' I2S0 transmit interrupt
#define I2S0_Rx_IRQn         36          ' I2S0 receive interrupt
#define UART0_LON_IRQn       44          ' UART0 LON interrupt
#define UART0_RX_TX_IRQn     45          ' UART0 Receive/Transmit interrupt
#define UART0_ERR_IRQn       46          ' UART0 Error interrupt
#define UART1_RX_TX_IRQn     47          ' UART1 Receive/Transmit interrupt
#define UART1_ERR_IRQn       48          ' UART1 Error interrupt
#define UART2_RX_TX_IRQn     49          ' UART2 Receive/Transmit interrupt
#define UART2_ERR_IRQn       50          ' UART2 Error interrupt
#define UART3_RX_TX_IRQn     51          ' UART3 Receive/Transmit interrupt
#define UART3_ERR_IRQn       52          ' UART3 Error interrupt
#define UART4_RX_TX_IRQn     53          ' UART4 Receive/Transmit interrupt
#define UART4_ERR_IRQn       54          ' UART4 Error interrupt
#define ADC0_IRQn            57          ' ADC0 interrupt
#define ADC1_IRQn            58          ' ADC1 interrupt
#define CMP0_IRQn            59          ' CMP0 interrupt
#define CMP1_IRQn            60          ' CMP1 interrupt
#define CMP2_IRQn            61          ' CMP2 interrupt
#define FTM0_IRQn            62          ' FTM0 fault overflow and channels interrupt
#define FTM1_IRQn            63          ' FTM1 fault overflow and channels interrupt
#define FTM2_IRQn            64          ' FTM2 fault overflow and channels interrupt
#define CMT_IRQn             65          ' CMT interrupt
#define RTC_IRQn             66          ' RTC interrupt
#define RTC_Seconds_IRQn     67          ' RTC seconds interrupt
#define PIT0_IRQn            68          ' PIT timer channel 0 interrupt
#define PIT1_IRQn            69          ' PIT timer channel 1 interrupt
#define PIT2_IRQn            70          ' PIT timer channel 2 interrupt
#define PIT3_IRQn            71          ' PIT timer channel 3 interrupt
#define PDB0_IRQn            72          ' PDB0 Interrupt
#define USB0_IRQn            73          ' USB0 interrupt
#define USBDCD_IRQn          74          ' USBDCD Interrupt
#define DAC0_IRQn            81          ' DAC0 interrupt
#define TSI0_IRQn            83          ' TSI0 Interrupt
#define MCG_IRQn             84          ' MCG Interrupt
#define LPTimer_IRQn         85          ' LPTimer interrupt
#define PORTA_IRQn           87          ' Port A interrupt
#define PORTB_IRQn           88          ' Port B interrupt
#define PORTC_IRQn           89          ' Port C interrupt
#define PORTD_IRQn           90          ' Port D interrupt
#define PORTE_IRQn           91          ' Port E interrupt
#define SWI_IRQn             94          ' Software interrupt

#endif

' chapter 11: Port control and interrupts (PORT) - 32 bit registers
#define PORTA_PCR0             *&H40049000 ' Pin Control Register n
#define PORT_PCR_ISF           &H01000000        ' Interrupt Status Flag
#define PORT_PCR_IRQC(n)       (((n) and 15) shl 16)    ' Interrupt Configuration
#define PORT_PCR_IRQC_MASK     &H000F0000
#define PORT_PCR_LK            &H00008000        ' Lock Register
#define PORT_PCR_MUX(n)        (((n) and 7) shl 8)    ' Pin Mux Control
#define PORT_PCR_MUX_MASK      &H00000700
#define PORT_PCR_DSE           &H00000040        ' Drive Strength Enable
#define PORT_PCR_ODE           &H00000020        ' Open Drain Enable
#define PORT_PCR_PFE           &H00000010        ' Passive Filter Enable
#define PORT_PCR_SRE           &H00000004        ' Slew Rate Enable
#define PORT_PCR_PE            &H00000002        ' Pull Enable
#define PORT_PCR_PS            &H00000001        ' Pull Select
#define PORTA_PCR1             *&H40049004 ' Pin Control Register n
#define PORTA_PCR2             *&H40049008 ' Pin Control Register n
#define PORTA_PCR3             *&H4004900C ' Pin Control Register n
#define PORTA_PCR4             *&H40049010 ' Pin Control Register n
#define PORTA_PCR5             *&H40049014 ' Pin Control Register n
#define PORTA_PCR6             *&H40049018 ' Pin Control Register n
#define PORTA_PCR7             *&H4004901C ' Pin Control Register n
#define PORTA_PCR8             *&H40049020 ' Pin Control Register n
#define PORTA_PCR9             *&H40049024 ' Pin Control Register n
#define PORTA_PCR10            *&H40049028 ' Pin Control Register n
#define PORTA_PCR11            *&H4004902C ' Pin Control Register n
#define PORTA_PCR12            *&H40049030 ' Pin Control Register n
#define PORTA_PCR13            *&H40049034 ' Pin Control Register n
#define PORTA_PCR14            *&H40049038 ' Pin Control Register n
#define PORTA_PCR15            *&H4004903C ' Pin Control Register n
#define PORTA_PCR16            *&H40049040 ' Pin Control Register n
#define PORTA_PCR17            *&H40049044 ' Pin Control Register n
#define PORTA_PCR18            *&H40049048 ' Pin Control Register n
#define PORTA_PCR19            *&H4004904C ' Pin Control Register n
#define PORTA_PCR20            *&H40049050 ' Pin Control Register n
#define PORTA_PCR21            *&H40049054 ' Pin Control Register n
#define PORTA_PCR22            *&H40049058 ' Pin Control Register n
#define PORTA_PCR23            *&H4004905C ' Pin Control Register n
#define PORTA_PCR24            *&H40049060 ' Pin Control Register n
#define PORTA_PCR25            *&H40049064 ' Pin Control Register n
#define PORTA_PCR26            *&H40049068 ' Pin Control Register n
#define PORTA_PCR27            *&H4004906C ' Pin Control Register n
#define PORTA_PCR28            *&H40049070 ' Pin Control Register n
#define PORTA_PCR29            *&H40049074 ' Pin Control Register n
#define PORTA_PCR30            *&H40049078 ' Pin Control Register n
#define PORTA_PCR31            *&H4004907C ' Pin Control Register n
#define PORTA_GPCLR            *&H40049080 ' Global Pin Control Low Register
#define PORTA_GPCHR            *&H40049084 ' Global Pin Control High Register
#define PORTA_ISFR             *&H400490A0 ' Interrupt Status Flag Register

#define PORTB_PCR0             *&H4004A000 ' Pin Control Register n
#define PORTB_PCR1             *&H4004A004 ' Pin Control Register n
#define PORTB_PCR2             *&H4004A008 ' Pin Control Register n
#define PORTB_PCR3             *&H4004A00C ' Pin Control Register n
#define PORTB_PCR4             *&H4004A010 ' Pin Control Register n
#define PORTB_PCR5             *&H4004A014 ' Pin Control Register n
#define PORTB_PCR6             *&H4004A018 ' Pin Control Register n
#define PORTB_PCR7             *&H4004A01C ' Pin Control Register n
#define PORTB_PCR8             *&H4004A020 ' Pin Control Register n
#define PORTB_PCR9             *&H4004A024 ' Pin Control Register n
#define PORTB_PCR10            *&H4004A028 ' Pin Control Register n
#define PORTB_PCR11            *&H4004A02C ' Pin Control Register n
#define PORTB_PCR12            *&H4004A030 ' Pin Control Register n
#define PORTB_PCR13            *&H4004A034 ' Pin Control Register n
#define PORTB_PCR14            *&H4004A038 ' Pin Control Register n
#define PORTB_PCR15            *&H4004A03C ' Pin Control Register n
#define PORTB_PCR16            *&H4004A040 ' Pin Control Register n
#define PORTB_PCR17            *&H4004A044 ' Pin Control Register n
#define PORTB_PCR18            *&H4004A048 ' Pin Control Register n
#define PORTB_PCR19            *&H4004A04C ' Pin Control Register n
#define PORTB_PCR20            *&H4004A050 ' Pin Control Register n
#define PORTB_PCR21            *&H4004A054 ' Pin Control Register n
#define PORTB_PCR22            *&H4004A058 ' Pin Control Register n
#define PORTB_PCR23            *&H4004A05C ' Pin Control Register n
#define PORTB_PCR24            *&H4004A060 ' Pin Control Register n
#define PORTB_PCR25            *&H4004A064 ' Pin Control Register n
#define PORTB_PCR26            *&H4004A068 ' Pin Control Register n
#define PORTB_PCR27            *&H4004A06C ' Pin Control Register n
#define PORTB_PCR28            *&H4004A070 ' Pin Control Register n
#define PORTB_PCR29            *&H4004A074 ' Pin Control Register n
#define PORTB_PCR30            *&H4004A078 ' Pin Control Register n
#define PORTB_PCR31            *&H4004A07C ' Pin Control Register n
#define PORTB_GPCLR            *&H4004A080 ' Global Pin Control Low Register
#define PORTB_GPCHR            *&H4004A084 ' Global Pin Control High Register
#define PORTB_ISFR             *&H4004A0A0 ' Interrupt Status Flag Register
#define PORTC_PCR0             *&H4004B000 ' Pin Control Register n
#define PORTC_PCR1             *&H4004B004 ' Pin Control Register n
#define PORTC_PCR2             *&H4004B008 ' Pin Control Register n
#define PORTC_PCR3             *&H4004B00C ' Pin Control Register n
#define PORTC_PCR4             *&H4004B010 ' Pin Control Register n
#define PORTC_PCR5             *&H4004B014 ' Pin Control Register n
#define PORTC_PCR6             *&H4004B018 ' Pin Control Register n
#define PORTC_PCR7             *&H4004B01C ' Pin Control Register n
#define PORTC_PCR8             *&H4004B020 ' Pin Control Register n
#define PORTC_PCR9             *&H4004B024 ' Pin Control Register n
#define PORTC_PCR10            *&H4004B028 ' Pin Control Register n
#define PORTC_PCR11            *&H4004B02C ' Pin Control Register n
#define PORTC_PCR12            *&H4004B030 ' Pin Control Register n
#define PORTC_PCR13            *&H4004B034 ' Pin Control Register n
#define PORTC_PCR14            *&H4004B038 ' Pin Control Register n
#define PORTC_PCR15            *&H4004B03C ' Pin Control Register n
#define PORTC_PCR16            *&H4004B040 ' Pin Control Register n
#define PORTC_PCR17            *&H4004B044 ' Pin Control Register n
#define PORTC_PCR18            *&H4004B048 ' Pin Control Register n
#define PORTC_PCR19            *&H4004B04C ' Pin Control Register n
#define PORTC_PCR20            *&H4004B050 ' Pin Control Register n
#define PORTC_PCR21            *&H4004B054 ' Pin Control Register n
#define PORTC_PCR22            *&H4004B058 ' Pin Control Register n
#define PORTC_PCR23            *&H4004B05C ' Pin Control Register n
#define PORTC_PCR24            *&H4004B060 ' Pin Control Register n
#define PORTC_PCR25            *&H4004B064 ' Pin Control Register n
#define PORTC_PCR26            *&H4004B068 ' Pin Control Register n
#define PORTC_PCR27            *&H4004B06C ' Pin Control Register n
#define PORTC_PCR28            *&H4004B070 ' Pin Control Register n
#define PORTC_PCR29            *&H4004B074 ' Pin Control Register n
#define PORTC_PCR30            *&H4004B078 ' Pin Control Register n
#define PORTC_PCR31            *&H4004B07C ' Pin Control Register n
#define PORTC_GPCLR            *&H4004B080 ' Global Pin Control Low Register
#define PORTC_GPCHR            *&H4004B084 ' Global Pin Control High Register
#define PORTC_ISFR             *&H4004B0A0 ' Interrupt Status Flag Register
#define PORTD_PCR0             *&H4004C000 ' Pin Control Register n
#define PORTD_PCR1             *&H4004C004 ' Pin Control Register n
#define PORTD_PCR2             *&H4004C008 ' Pin Control Register n
#define PORTD_PCR3             *&H4004C00C ' Pin Control Register n
#define PORTD_PCR4             *&H4004C010 ' Pin Control Register n
#define PORTD_PCR5             *&H4004C014 ' Pin Control Register n
#define PORTD_PCR6             *&H4004C018 ' Pin Control Register n
#define PORTD_PCR7             *&H4004C01C ' Pin Control Register n
#define PORTD_PCR8             *&H4004C020 ' Pin Control Register n
#define PORTD_PCR9             *&H4004C024 ' Pin Control Register n
#define PORTD_PCR10            *&H4004C028 ' Pin Control Register n
#define PORTD_PCR11            *&H4004C02C ' Pin Control Register n
#define PORTD_PCR12            *&H4004C030 ' Pin Control Register n
#define PORTD_PCR13            *&H4004C034 ' Pin Control Register n
#define PORTD_PCR14            *&H4004C038 ' Pin Control Register n
#define PORTD_PCR15            *&H4004C03C ' Pin Control Register n
#define PORTD_PCR16            *&H4004C040 ' Pin Control Register n
#define PORTD_PCR17            *&H4004C044 ' Pin Control Register n
#define PORTD_PCR18            *&H4004C048 ' Pin Control Register n
#define PORTD_PCR19            *&H4004C04C ' Pin Control Register n
#define PORTD_PCR20            *&H4004C050 ' Pin Control Register n
#define PORTD_PCR21            *&H4004C054 ' Pin Control Register n
#define PORTD_PCR22            *&H4004C058 ' Pin Control Register n
#define PORTD_PCR23            *&H4004C05C ' Pin Control Register n
#define PORTD_PCR24            *&H4004C060 ' Pin Control Register n
#define PORTD_PCR25            *&H4004C064 ' Pin Control Register n
#define PORTD_PCR26            *&H4004C068 ' Pin Control Register n
#define PORTD_PCR27            *&H4004C06C ' Pin Control Register n
#define PORTD_PCR28            *&H4004C070 ' Pin Control Register n
#define PORTD_PCR29            *&H4004C074 ' Pin Control Register n
#define PORTD_PCR30            *&H4004C078 ' Pin Control Register n
#define PORTD_PCR31            *&H4004C07C ' Pin Control Register n
#define PORTD_GPCLR            *&H4004C080 ' Global Pin Control Low Register
#define PORTD_GPCHR            *&H4004C084 ' Global Pin Control High Register
#define PORTD_ISFR             *&H4004C0A0 ' Interrupt Status Flag Register
#define PORTE_PCR0             *&H4004D000 ' Pin Control Register n
#define PORTE_PCR1             *&H4004D004 ' Pin Control Register n
#define PORTE_PCR2             *&H4004D008 ' Pin Control Register n
#define PORTE_PCR3             *&H4004D00C ' Pin Control Register n
#define PORTE_PCR4             *&H4004D010 ' Pin Control Register n
#define PORTE_PCR5             *&H4004D014 ' Pin Control Register n
#define PORTE_PCR6             *&H4004D018 ' Pin Control Register n
#define PORTE_PCR7             *&H4004D01C ' Pin Control Register n
#define PORTE_PCR8             *&H4004D020 ' Pin Control Register n
#define PORTE_PCR9             *&H4004D024 ' Pin Control Register n
#define PORTE_PCR10            *&H4004D028 ' Pin Control Register n
#define PORTE_PCR11            *&H4004D02C ' Pin Control Register n
#define PORTE_PCR12            *&H4004D030 ' Pin Control Register n
#define PORTE_PCR13            *&H4004D034 ' Pin Control Register n
#define PORTE_PCR14            *&H4004D038 ' Pin Control Register n
#define PORTE_PCR15            *&H4004D03C ' Pin Control Register n
#define PORTE_PCR16            *&H4004D040 ' Pin Control Register n
#define PORTE_PCR17            *&H4004D044 ' Pin Control Register n
#define PORTE_PCR18            *&H4004D048 ' Pin Control Register n
#define PORTE_PCR19            *&H4004D04C ' Pin Control Register n
#define PORTE_PCR20            *&H4004D050 ' Pin Control Register n
#define PORTE_PCR21            *&H4004D054 ' Pin Control Register n
#define PORTE_PCR22            *&H4004D058 ' Pin Control Register n
#define PORTE_PCR23            *&H4004D05C ' Pin Control Register n
#define PORTE_PCR24            *&H4004D060 ' Pin Control Register n
#define PORTE_PCR25            *&H4004D064 ' Pin Control Register n
#define PORTE_PCR26            *&H4004D068 ' Pin Control Register n
#define PORTE_PCR27            *&H4004D06C ' Pin Control Register n
#define PORTE_PCR28            *&H4004D070 ' Pin Control Register n
#define PORTE_PCR29            *&H4004D074 ' Pin Control Register n
#define PORTE_PCR30            *&H4004D078 ' Pin Control Register n
#define PORTE_PCR31            *&H4004D07C ' Pin Control Register n
#define PORTE_GPCLR            *&H4004D080 ' Global Pin Control Low Register
#define PORTE_GPCHR            *&H4004D084 ' Global Pin Control High Register
#define PORTE_ISFR             *&H4004D0A0 ' Interrupt Status Flag Register

' Chapter 12: System Integration Module (SIM) - 32 bit registers
#define SIM_SOPT1              *&H40047000 ' System Options Register 1
#define SIM_SOPT1CFG           *&H40047004 ' SOPT1 Configuration Register
#define SIM_SOPT2              *&H40048004 ' System Options Register 2
#define SIM_SOPT2_USBSRC       &H00040000        ' 0=USB_CLKIN, 1=FFL/PLL 
#define SIM_SOPT2_PLLFLLSEL    &H00010000        ' 0=FLL, 1=PLL
#define SIM_SOPT2_TRACECLKSEL  &H00001000        ' 0=MCGOUTCLK, 1=CPU
#define SIM_SOPT2_PTD7PAD      &H00000800        ' 0=normal, 1=double drive PTD7
#define SIM_SOPT2_CLKOUTSEL(n) (((n) and 7) shl 5)    ' Selects the clock to output on the CLKOUT pin.
#define SIM_SOPT2_RTCCLKOUTSEL &H00000010        ' RTC clock out select
#define SIM_SOPT4              *&H4004800C ' System Options Register 4
#define SIM_SOPT5              *&H40048010 ' System Options Register 5
#define SIM_SOPT7              *&H40048018 ' System Options Register 7
#define SIM_SDID               *&H40048024 ' System Device Identification Register
#define SIM_SCGC4              *&H40048034 ' System Clock Gating Control Register 4
#define SIM_SCGC4_VREF         &H00100000        ' VREF Clock Gate Control
#define SIM_SCGC4_CMP          &H00080000        ' Comparator Clock Gate Control
#define SIM_SCGC4_USBOTG       &H00040000        ' USB Clock Gate Control
#define SIM_SCGC4_UART2        &H00001000        ' UART2 Clock Gate Control
#define SIM_SCGC4_UART1        &H00000800        ' UART1 Clock Gate Control
#define SIM_SCGC4_UART0        &H00000400        ' UART0 Clock Gate Control
#define SIM_SCGC4_I2C0         &H00000040        ' I2C0 Clock Gate Control
#define SIM_SCGC4_CMT          &H00000004        ' CMT Clock Gate Control
#define SIM_SCGC4_EWM          &H00000002        ' EWM Clock Gate Control
#define SIM_SCGC5              *&H40048038 ' System Clock Gating Control Register 5
#define SIM_SCGC5_PORTE        &H00002000        ' Port E Clock Gate Control
#define SIM_SCGC5_PORTD        &H00001000        ' Port D Clock Gate Control
#define SIM_SCGC5_PORTC        &H00000800        ' Port C Clock Gate Control
#define SIM_SCGC5_PORTB        &H00000400        ' Port B Clock Gate Control
#define SIM_SCGC5_PORTA        &H00000200        ' Port A Clock Gate Control
#define SIM_SCGC5_TSI          &H00000020        ' Touch Sense Input TSI Clock Gate Control
#define SIM_SCGC5_LPTIMER      &H00000001        ' Low Power Timer Access Control
#define SIM_SCGC6              *&H4004803C ' System Clock Gating Control Register 6
#define SIM_SCGC6_RTC          &H20000000        ' RTC Access
#define SIM_SCGC6_ADC0         &H08000000        ' ADC0 Clock Gate Control
#define SIM_SCGC6_FTM1         &H02000000        ' FTM1 Clock Gate Control
#define SIM_SCGC6_FTM0         &H01000000        ' FTM0 Clock Gate Control
#define SIM_SCGC6_PIT          &H00800000        ' PIT Clock Gate Control
#define SIM_SCGC6_PDB          &H00400000        ' PDB Clock Gate Control
#define SIM_SCGC6_USBDCD       &H00200000        ' USB DCD Clock Gate Control
#define SIM_SCGC6_CRC          &H00040000        ' CRC Clock Gate Control
#define SIM_SCGC6_I2S          &H00008000        ' I2S Clock Gate Control
#define SIM_SCGC6_SPI0         &H00001000        ' SPI0 Clock Gate Control
#define SIM_SCGC6_DMAMUX       &H00000002        ' DMA Mux Clock Gate Control
#define SIM_SCGC6_FTFL         &H00000001        ' Flash Memory Clock Gate Control
#define SIM_SCGC7              *&H40048040 ' System Clock Gating Control Register 7
#define SIM_SCGC7_DMA          &H00000020        ' DMA Clock Gate Control
#define SIM_CLKDIV1            *&H40048044 ' System Clock Divider Register 1
#define SIM_CLKDIV1_OUTDIV1(n) (((n) and &H0F) shl 28)    ' divide value for the core/system clock
#define SIM_CLKDIV1_OUTDIV2(n) (((n) and &H0F) shl 24)    ' divide value for the peripheral clock
#define SIM_CLKDIV1_OUTDIV4(n) (((n) and &H0F) shl 16)    ' divide value for the flash clock
#define SIM_CLKDIV2            *&H40048048 ' System Clock Divider Register 2
#define SIM_CLKDIV2_USBDIV(n)  (((n) and &H07) shl 1)
#define SIM_CLKDIV2_USBFRAC    &H00000001
#define SIM_FCFG1              *&H4004804C ' Flash Configuration Register 1
#define SIM_FCFG2              *&H40048050 ' Flash Configuration Register 2
#define SIM_UIDH               *&H40048054 ' Unique Identification Register High
#define SIM_UIDMH              *&H40048058 ' Unique Identification Register Mid-High
#define SIM_UIDML              *&H4004805C ' Unique Identification Register Mid Low
#define SIM_UIDL               *&H40048060 ' Unique Identification Register Low
'added for MK20DX256
#define SIM_SCGC2		        *&H4004802C ' System Clock Gating Control Register 2
#define SIM_SCGC2_DAC0			&H00001000		' DAC0 Clock Gate Control
#define SIM_SCGC3		        *&H40048030 ' System Clock Gating Control Register 3
#define SIM_SCGC3_ADC1			&H08000000		' ADC1 Clock Gate Control
#define SIM_SCGC3_FTM2			&H01000000		' FTM2 Clock Gate Control
#define SIM_SCGC4_I2C1			&H00000080		' I2C1 Clock Gate Control
#define SIM_SCGC6_SPI1			&H00002000		' SPI1 Clock Gate Control
#define SIM_SCGC6_FLEXCAN0		&H00000010		' FlexCAN0 Clock Gate Control

' Chapter 13: Reset Control Module (RCM) - 8 bit registers
#define RCM_SRS0               *&H4007F000 ' System Reset Status Register 0
#define RCM_SRS1               *&H4007F001 ' System Reset Status Register 1
#define RCM_RPFC               *&H4007F004 ' Reset Pin Filter Control Register
#define RCM_RPFW               *&H4007F005 ' Reset Pin Filter Width Register
#define RCM_MR                 *&H4007F007 ' Mode Register

' Chapter 14: System Mode Controller - 8 bit registers
#define SMC_PMPROT             *&H4007E000 ' Power Mode Protection Register
#define SMC_PMPROT_AVLP        &H20            ' Allow very low power modes
#define SMC_PMPROT_ALLS        &H08            ' Allow low leakage stop mode
#define SMC_PMPROT_AVLLS       &H02            ' Allow very low leakage stop mode
#define SMC_PMCTRL             *&H4007E001 ' Power Mode Control Register
#define SMC_PMCTRL_LPWUI       &H80            ' Low Power Wake Up on Interrupt
#define SMC_PMCTRL_RUNM(n)     (((n) and &H03) shl 5)    ' Run Mode Control
#define SMC_PMCTRL_STOPA       &H08            ' Stop Aborted
#define SMC_PMCTRL_STOPM(n)    ((n) and &H07)        ' Stop Mode Control
#define SMC_VLLSCTRL           *&H4007E002 ' VLLS Control Register
#define SMC_VLLSCTRL_PORPO     &H20            ' POR Power Option
#define SMC_VLLSCTRL_VLLSM(n)  ((n) and &H07)        ' VLLS Mode Control
#define SMC_PMSTAT             *&H4007E003 ' Power Mode Status Register
#define SMC_PMSTAT_RUN         &H01            ' Current power mode is RUN
#define SMC_PMSTAT_STOP        &H02            ' Current power mode is STOP
#define SMC_PMSTAT_VLPR        &H04            ' Current power mode is VLPR
#define SMC_PMSTAT_VLPW        &H08            ' Current power mode is VLPW
#define SMC_PMSTAT_VLPS        &H10            ' Current power mode is VLPS
#define SMC_PMSTAT_LLS         &H20            ' Current power mode is LLS
#define SMC_PMSTAT_VLLS        &H40            ' Current power mode is VLLS

' Chapter 15: Power Management Controller - 8 bit registers
#define PMC_LVDSC1             *&H4007D000 ' Low Voltage Detect Status And Control 1 register
#define PMC_LVDSC1_LVDF        &H80            ' Low-Voltage Detect Flag
#define PMC_LVDSC1_LVDACK      &H40            ' Low-Voltage Detect Acknowledge
#define PMC_LVDSC1_LVDIE       &H20            ' Low-Voltage Detect Interrupt Enable
#define PMC_LVDSC1_LVDRE       &H10            ' Low-Voltage Detect Reset Enable
#define PMC_LVDSC1_LVDV(n)     ((n) and &H03)        ' Low-Voltage Detect Voltage Select
#define PMC_LVDSC2             *&H4007D001 ' Low Voltage Detect Status And Control 2 register
#define PMC_LVDSC2_LVWF        &H80            ' Low-Voltage Warning Flag
#define PMC_LVDSC2_LVWACK      &H40            ' Low-Voltage Warning Acknowledge
#define PMC_LVDSC2_LVWIE       &H20            ' Low-Voltage Warning Interrupt Enable
#define PMC_LVDSC2_LVWV(n)     ((n) and &H03)        ' Low-Voltage Warning Voltage Select
#define PMC_REGSC              *&H4007D002 ' Regulator Status And Control register
#define PMC_REGSC_BGEN         &H10            ' Bandgap Enable In VLPx Operation
#define PMC_REGSC_ACKISO       &H08            ' Acknowledge Isolation
#define PMC_REGSC_REGONS       &H04            ' Regulator In Run Regulation Status
#define PMC_REGSC_BGBE         &H01            ' Bandgap Buffer Enable

' Chapter 16: Low-Leakage Wakeup Unit (LLWU) - 8 bit registers
#define LLWU_PE1                *&H4007C000 ' LLWU Pin Enable 1 register
#define LLWU_PE2                *&H4007C001 ' LLWU Pin Enable 2 register
#define LLWU_PE3                *&H4007C002 ' LLWU Pin Enable 3 register
#define LLWU_PE4                *&H4007C003 ' LLWU Pin Enable 4 register
#define LLWU_ME                 *&H4007C004 ' LLWU Module Enable register
#define LLWU_F1                 *&H4007C005 ' LLWU Flag 1 register
#define LLWU_F2                 *&H4007C006 ' LLWU Flag 2 register
#define LLWU_F3                 *&H4007C007 ' LLWU Flag 3 register
#define LLWU_FILT1              *&H4007C008 ' LLWU Pin Filter 1 register
#define LLWU_FILT2              *&H4007C009 ' LLWU Pin Filter 2 register
#define LLWU_RST                *&H4007C00A ' LLWU Reset Enable register

' Chapter 17: Miscellaneous Control Module (MCM) - mixed 16/32 bit registers
#define MCM_PLASC               *&HE0080008 ' 16 bit Crossbar Switch (AXBS) Slave Configuration
#define MCM_PLAMC               *&HE008000A ' 16 bit Crossbar Switch (AXBS) Master Configuration
#define MCM_PLACR               *&HE008000C ' 32 bit Crossbar Switch (AXBS) Control Register

' Chapter 20: Direct Memory Access Multiplexer (DMAMUX) - 8 bit registers
#define DMAMUX0_CHCFG0          *&H40021000 ' Channel Configuration register
#define DMAMUX0_CHCFG1          *&H40021001 ' Channel Configuration register
#define DMAMUX0_CHCFG2          *&H40021002 ' Channel Configuration register
#define DMAMUX0_CHCFG3          *&H40021003 ' Channel Configuration register
#define DMAMUX0_CHCFG4          *&H40021004 ' Channel Configuration register
#define DMAMUX0_CHCFG5          *&H40021005 ' Channel Configuration register
#define DMAMUX0_CHCFG6          *&H40021006 ' Channel Configuration register
#define DMAMUX0_CHCFG7          *&H40021007 ' Channel Configuration register
#define DMAMUX0_CHCFG8          *&H40021008 ' Channel Configuration register
#define DMAMUX0_CHCFG9          *&H40021009 ' Channel Configuration register
#define DMAMUX0_CHCFG10         *&H4002100A ' Channel Configuration register
#define DMAMUX0_CHCFG11         *&H4002100B ' Channel Configuration register
#define DMAMUX0_CHCFG12         *&H4002100C ' Channel Configuration register
#define DMAMUX0_CHCFG13         *&H4002100D ' Channel Configuration register
#define DMAMUX0_CHCFG14         *&H4002100E ' Channel Configuration register
#define DMAMUX0_CHCFG15         *&H4002100F ' Channel Configuration register
#define DMAMUX_DISABLE          0
#define DMAMUX_TRIG             64
#define DMAMUX_ENABLE           128
#define DMAMUX_SOURCE_UART0_RX  2
#define DMAMUX_SOURCE_UART0_TX  3
#define DMAMUX_SOURCE_UART1_RX  4
#define DMAMUX_SOURCE_UART1_TX  5
#define DMAMUX_SOURCE_UART2_RX  6
#define DMAMUX_SOURCE_UART2_TX  7
#define DMAMUX_SOURCE_I2S0_RX   14
#define DMAMUX_SOURCE_I2S0_TX   15
#define DMAMUX_SOURCE_SPI0_RX   16
#define DMAMUX_SOURCE_SPI0_TX   17
#define DMAMUX_SOURCE_I2C0      22
#define DMAMUX_SOURCE_I2C1      23
#define DMAMUX_SOURCE_FTM0_CH0  24
#define DMAMUX_SOURCE_FTM0_CH1  25
#define DMAMUX_SOURCE_FTM0_CH2  26
#define DMAMUX_SOURCE_FTM0_CH3  27
#define DMAMUX_SOURCE_FTM0_CH4  28
#define DMAMUX_SOURCE_FTM0_CH5  29
#define DMAMUX_SOURCE_FTM0_CH6  30
#define DMAMUX_SOURCE_FTM0_CH7  31
#define DMAMUX_SOURCE_FTM1_CH0  32
#define DMAMUX_SOURCE_FTM1_CH1  33
#define DMAMUX_SOURCE_FTM2_CH0  34
#define DMAMUX_SOURCE_FTM2_CH1  35
#define DMAMUX_SOURCE_ADC0      40
#define DMAMUX_SOURCE_ADC1      41
#define DMAMUX_SOURCE_CMP0      42
#define DMAMUX_SOURCE_CMP1      43
#define DMAMUX_SOURCE_CMP2      44
#define DMAMUX_SOURCE_DAC0      45
#define DMAMUX_SOURCE_CMT       47
#define DMAMUX_SOURCE_PDB       48
#define DMAMUX_SOURCE_PORTA     49
#define DMAMUX_SOURCE_PORTB     50
#define DMAMUX_SOURCE_PORTC     51
#define DMAMUX_SOURCE_PORTD     52
#define DMAMUX_SOURCE_PORTE     53
#define DMAMUX_SOURCE_ALWAYS0   54
#define DMAMUX_SOURCE_ALWAYS1   55
#define DMAMUX_SOURCE_ALWAYS2   56
#define DMAMUX_SOURCE_ALWAYS3   57
#define DMAMUX_SOURCE_ALWAYS4   58
#define DMAMUX_SOURCE_ALWAYS5   59
#define DMAMUX_SOURCE_ALWAYS6   60
#define DMAMUX_SOURCE_ALWAYS7   61
#define DMAMUX_SOURCE_ALWAYS8   62
#define DMAMUX_SOURCE_ALWAYS9   63

' Chapter 21: Direct Memory Access Controller (eDMA) - mixed 8/16/32 bit registers
#define DMA_CR                  *&H40008000 ' 32 bit Control Register
#define DMA_CR_CX                       ((1 shl 17))     ' Cancel Transfer
#define DMA_CR_ECX                      ((1 shl 16))     ' Error Cancel Transfer
#define DMA_CR_EMLM                     (&H80)        ' Enable Minor Loop Mapping
#define DMA_CR_CLM                      (&H40)        ' Continuous Link Mode
#define DMA_CR_HALT                     (&H20)        ' Halt DMA Operations
#define DMA_CR_HOE                      (&H10)        ' Halt On Error
#define DMA_CR_ERCA                     (&H04)        ' Enable Round Robin Channel Arbitration
#define DMA_CR_EDBG                     (&H02)        ' Enable Debug
#define DMA_ES                  *&H40008004 ' 32 bit Error Status Register
#define DMA_ERQ                 *&H4000800C ' 32 bit Enable Request Register
#define DMA_ERQ_ERQ0                    (1 shl 0)        ' Enable DMA Request 0
#define DMA_ERQ_ERQ1                    (1 shl 1)        ' Enable DMA Request 1
#define DMA_ERQ_ERQ2                    (1 shl 2)        ' Enable DMA Request 2
#define DMA_ERQ_ERQ3                    (1 shl 3)        ' Enable DMA Request 3
#define DMA_EEI                 *&H40008014 ' 32 bit Enable Error Interrupt Register
#define DMA_EEI_EEI0                    (1 shl 0)        ' Enable Error Interrupt 0
#define DMA_EEI_EEI1                    (1 shl 1)        ' Enable Error Interrupt 1
#define DMA_EEI_EEI2                    (1 shl 2)        ' Enable Error Interrupt 2
#define DMA_EEI_EEI3                    (1 shl 3)        ' Enable Error Interrupt 3
#define DMA_CEEI                *&H40008018 ' 8 bit Clear Enable Error Interrupt Register
#define DMA_CEEI_CEEI(n)                ((n and 3) shl 0)   ' Clear Enable Error Interrupt
#define DMA_CEEI_CAEE                   (1 shl 6)         ' Clear All Enable Error Interrupts
#define DMA_CEEI_NOP                    (1 shl 7)         ' NOP
#define DMA_SEEI                *&H40008019 ' 8 bit Set Enable Error Interrupt Register
#define DMA_SEEI_SEEI(n)                ((n and 3) shl 0)   ' Set Enable Error Interrupt
#define DMA_SEEI_SAEE                   (1 shl 6)         ' Set All Enable Error Interrupts
#define DMA_SEEI_NOP                    (1 shl 7)         ' NOP
#define DMA_CERQ                *&H4000801A ' 8 bit Clear Enable Request Register
#define DMA_CERQ_CERQ(n)                ((n and 3) shl 0)   ' Clear Enable Request
#define DMA_CERQ_CAER                   (1 shl 6)         ' Clear All Enable Requests
#define DMA_CERQ_NOP                    (1 shl 7)         ' NOP
#define DMA_SERQ                *&H4000801B ' 8 bit Set Enable Request Register
#define DMA_SERQ_SERQ(n)                ((n and 3) shl 0)   ' Set Enable Request
#define DMA_SERQ_SAER                   (1 shl 6)         ' Set All Enable Requests
#define DMA_SERQ_NOP                    (1 shl 7)         ' NOP
#define DMA_CDNE                *&H4000801C ' 8 bit Clear DONE Status Bit Register
#define DMA_CDNE_CDNE(n)                ((n and 3) shl 0)   ' Clear Done Bit
#define DMA_CDNE_CADN                   (1 shl 6)         ' Clear All Done Bits
#define DMA_CDNE_NOP                    (1 shl 7)         ' NOP
#define DMA_SSRT                *&H4000801D ' 8 bit Set START Bit Register
#define DMA_SSRT_SSRT(n)                ((n and 3) shl 0)   ' Set Start Bit
#define DMA_SSRT_SAST                   (1 shl 6)         ' Set All Start Bits
#define DMA_SSRT_NOP                    (1 shl 7)         ' NOP
#define DMA_CERR                *&H4000801E ' 8 bit Clear Error Register
#define DMA_CERR_CERR(n)                ((n and 3) shl 0)   ' Clear Error Indicator
#define DMA_CERR_CAEI                   (1 shl 6)         ' Clear All Error Indicators
#define DMA_CERR_NOP                    (1 shl 7)         ' NOP
#define DMA_CINT                *&H4000801F ' 8 bit Clear Interrupt Request Register
#define DMA_CINT_CINT(n)                ((n and 3) shl 0)   ' Clear Interrupt Request
#define DMA_CINT_CAIR                   (1 shl 6)         ' Clear All Interrupt Requests
#define DMA_CINT_NOP                    (1 shl 7)         ' NOP
#define DMA_INT                 *&H40008024 ' 32 bit Interrupt Request Register
#define DMA_INT_INT0                    (1 shl 0)        ' Interrupt Request 0
#define DMA_INT_INT1                    (1 shl 1)        ' Interrupt Request 1
#define DMA_INT_INT2                    (1 shl 2)        ' Interrupt Request 2
#define DMA_INT_INT3                    (1 shl 3)        ' Interrupt Request 3
#define DMA_ERR                 *&H4000802C ' 32 bit Error Register
#define DMA_ERR_ERR0                    (1 shl 0)        ' Error in Channel 0
#define DMA_ERR_ERR1                    (1 shl 1)        ' Error in Channel 1
#define DMA_ERR_ERR2                    (1 shl 2)        ' Error in Channel 2
#define DMA_ERR_ERR3                    (1 shl 3)        ' Error in Channel 3
#define DMA_HRS                 *&H40008034 ' 32 bit Hardware Request Status Register
#define DMA_HRS_HRS0                    (1 shl 0)        ' Hardware Request Status Channel 0
#define DMA_HRS_HRS1                    (1 shl 1)        ' Hardware Request Status Channel 1
#define DMA_HRS_HRS2                    (1 shl 2)        ' Hardware Request Status Channel 2
#define DMA_HRS_HRS3                    (1 shl 3)        ' Hardware Request Status Channel 3
#define DMA_DCHPRI3             *&H40008100 ' 8 bit Channel n Priority Register
#define DMA_DCHPRI2             *&H40008101 ' 8 bit Channel n Priority Register
#define DMA_DCHPRI1             *&H40008102 ' 8 bit Channel n Priority Register
#define DMA_DCHPRI0             *&H40008103 ' 8 bit Channel n Priority Register
#define DMA_DCHPRI_CHPRI(n)             ((n and 3) shl 0)   ' Channel Arbitration Priority
#define DMA_DCHPRI_DPA                  (1 shl 6)         ' Disable PreEmpt Ability
#define DMA_DCHPRI_ECP                  (1 shl 7)         ' Enable PreEmption


#define DMA_TCD_ATTR_SMOD(n)       (((n) and &H1F) shl 11)
#define DMA_TCD_ATTR_SSIZE(n)      (((n) and &H7) shl 8)
#define DMA_TCD_ATTR_DMOD(n)       (((n) and &H1F) shl 3)
#define DMA_TCD_ATTR_DSIZE(n)      (((n) and &H7) shl 0)
#define DMA_TCD_ATTR_SIZE_8BIT     0
#define DMA_TCD_ATTR_SIZE_16BIT    1
#define DMA_TCD_ATTR_SIZE_32BIT    2
#define DMA_TCD_ATTR_SIZE_16BYTE   4
#define DMA_TCD_ATTR_SIZE_32BYTE   5
#define DMA_TCD_CSR_BWC(n)         (((n) and &H3) shl 14)
#define DMA_TCD_CSR_MAJORLINKCH(n) (((n) and &H3) shl 8)
#define DMA_TCD_CSR_DONE           &H0080
#define DMA_TCD_CSR_ACTIVE         &H0040
#define DMA_TCD_CSR_MAJORELINK     &H0020
#define DMA_TCD_CSR_ESG            &H0010
#define DMA_TCD_CSR_DREQ           &H0008
#define DMA_TCD_CSR_INTHALF        &H0004
#define DMA_TCD_CSR_INTMAJOR       &H0002
#define DMA_TCD_CSR_START          &H0001
#define DMA_TCD_CITER_MASK                  (&H7FFF)     ' Loop count mask
#define DMA_TCD_CITER_ELINK                 (1 shl 15)      ' Enable channel linking on minor-loop complete
#define DMA_TCD_BITER_MASK                  (&H7FFF)     ' Loop count mask
#define DMA_TCD_BITER_ELINK                 (1 shl 15)      ' Enable channel linking on minor-loop complete
#define DMA_TCD_NBYTES_SMLOE                (1 shl 31)               ' Source Minor Loop Offset Enable
#define DMA_TCD_NBYTES_DMLOE                (1 shl 30)               ' Destination Minor Loop Offset Enable
#define DMA_TCD_NBYTES_MLOFFNO_NBYTES(n)    ((n))                 ' NBytes transfer count when minor loop disabled
#define DMA_TCD_NBYTES_MLOFFYES_NBYTES(n)   ((n and &H1F))          ' NBytes transfer count when minor loop enabled
#define DMA_TCD_NBYTES_MLOFFYES_MLOFF(n)    ((n and &HFFFFF) shl 10)   ' Offset 

#define DMA_TCD0_SADDR           *&H40009000 ' 32 bit TCD Source Address
#define DMA_TCD0_SOFF            *&H40009004 ' 16 bit TCD Signed Source Address Offset
#define DMA_TCD0_ATTR            *&H40009006 ' 16 bit TCD Transfer Attributes
#define DMA_TCD0_NBYTES_MLNO     *&H40009008 ' 32 bit TCD Minor Byte Count (Minor Loop Disabled)
#define DMA_TCD0_NBYTES_MLOFFNO  *&H40009008 ' 32 bit TCD Signed Minor Loop Offset (Minor Loop Enabled and Offset Disabled)
#define DMA_TCD0_NBYTES_MLOFFYES *&H40009008 ' 32 bit TCD Signed Minor Loop Offset (Minor Loop and Offset Enabled)
#define DMA_TCD0_SLAST           *&H4000900C ' 32 bit TCD Last Source Address Adjustment
#define DMA_TCD0_DADDR           *&H40009010 ' 32 bit TCD Destination Address
#define DMA_TCD0_DOFF            *&H40009014 ' 16 bit TCD Signed Destination Address Offset
#define DMA_TCD0_CITER_ELINKYES  *&H40009016 ' 16 bit TCD Current Minor Loop Link, Major Loop Count, Channel Linking Enabled
#define DMA_TCD0_CITER_ELINKNO   *&H40009016 ' 16 bit ??
#define DMA_TCD0_DLASTSGA        *&H40009018 ' 32 bit TCD Last Destination Address Adjustment/Scatter Gather Address
#define DMA_TCD0_CSR             *&H4000901C ' 16 bit TCD Control and Status
#define DMA_TCD0_BITER_ELINKYES  *&H4000901E ' 16 bit TCD Beginning Minor Loop Link, Major Loop Count, Channel Linking Enabled
#define DMA_TCD0_BITER_ELINKNO   *&H4000901E ' 16 bit TCD Beginning Minor Loop Link, Major Loop Count, Channel Linking Disabled

#define DMA_TCD1_SADDR           *&H40009020 ' 32 bit TCD Source Address
#define DMA_TCD1_SOFF            *&H40009024 ' 16 bit TCD Signed Source Address Offset
#define DMA_TCD1_ATTR            *&H40009026 ' 16 bit TCD Transfer Attributes
#define DMA_TCD1_NBYTES_MLNO     *&H40009028 ' 32 bit TCD Minor Byte Count, Minor Loop Disabled
#define DMA_TCD1_NBYTES_MLOFFNO  *&H40009028 ' 32 bit TCD Signed Minor Loop Offset, Minor Loop Enabled and Offset Disabled
#define DMA_TCD1_NBYTES_MLOFFYES *&H40009028 ' 32 bit TCD Signed Minor Loop Offset, Minor Loop and Offset Enabled
#define DMA_TCD1_SLAST           *&H4000902C ' 32 bit TCD Last Source Address Adjustment
#define DMA_TCD1_DADDR           *&H40009030 ' 32 bit TCD Destination Address
#define DMA_TCD1_DOFF            *&H40009034 ' 16 bit TCD Signed Destination Address Offset
#define DMA_TCD1_CITER_ELINKYES  *&H40009036 ' 16 bit TCD Current Minor Loop Link, Major Loop Count, Channel Linking Enabled
#define DMA_TCD1_CITER_ELINKNO   *&H40009036 ' 16 bit ??
#define DMA_TCD1_DLASTSGA        *&H40009038 ' 32 bit TCD Last Destination Address Adjustment/Scatter Gather Address
#define DMA_TCD1_CSR             *&H4000903C ' 16 bit TCD Control and Status
#define DMA_TCD1_BITER_ELINKYES  *&H4000903E ' 16 bit TCD Beginning Minor Loop Link, Major Loop Count Channel Linking Enabled
#define DMA_TCD1_BITER_ELINKNO   *&H4000903E ' 16 bit TCD Beginning Minor Loop Link, Major Loop Count, Channel Linking Disabled

#define DMA_TCD2_SADDR           *&H40009040 ' 32 bit TCD Source Address
#define DMA_TCD2_SOFF            *&H40009044 ' 16 bit TCD Signed Source Address Offset
#define DMA_TCD2_ATTR            *&H40009046 ' 16 bit TCD Transfer Attributes
#define DMA_TCD2_NBYTES_MLNO     *&H40009048 ' 32 bit TCD Minor Byte Count, Minor Loop Disabled
#define DMA_TCD2_NBYTES_MLOFFNO  *&H40009048 ' 32 bit TCD Signed Minor Loop Offset, Minor Loop Enabled and Offset Disabled
#define DMA_TCD2_NBYTES_MLOFFYES *&H40009048 ' 32 bit TCD Signed Minor Loop Offset, Minor Loop and Offset Enabled
#define DMA_TCD2_SLAST           *&H4000904C ' 32 bit TCD Last Source Address Adjustment
#define DMA_TCD2_DADDR           *&H40009050 ' 32 bit TCD Destination Address
#define DMA_TCD2_DOFF            *&H40009054 ' 16 bit TCD Signed Destination Address Offset
#define DMA_TCD2_CITER_ELINKYES  *&H40009056 ' 16 bit TCD Current Minor Loop Link, Major Loop Count, Channel Linking Enabled
#define DMA_TCD2_CITER_ELINKNO   *&H40009056 ' 16 bit ??
#define DMA_TCD2_DLASTSGA        *&H40009058 ' 32 bit TCD Last Destination Address Adjustment/Scatter Gather Address
#define DMA_TCD2_CSR             *&H4000905C ' 16 bit TCD Control and Status
#define DMA_TCD2_BITER_ELINKYES  *&H4000905E ' 16 bit TCD Beginning Minor Loop Link, Major Loop Count, Channel Linking Enabled
#define DMA_TCD2_BITER_ELINKNO   *&H4000905E ' 16 bit TCD Beginning Minor Loop Link, Major Loop Count, Channel Linking Disabled

#define DMA_TCD3_SADDR           *&H40009060 ' 32 bit TCD Source Address
#define DMA_TCD3_SOFF            *&H40009064 ' 16 bit TCD Signed Source Address Offset
#define DMA_TCD3_ATTR            *&H40009066 ' 16 bit TCD Transfer Attributes
#define DMA_TCD3_NBYTES_MLNO     *&H40009068 ' 32 bit TCD Minor Byte Count, Minor Loop Disabled
#define DMA_TCD3_NBYTES_MLOFFNO  *&H40009068 ' 32 bit TCD Signed Minor Loop Offset, Minor Loop Enabled and Offset Disabled
#define DMA_TCD3_NBYTES_MLOFFYES *&H40009068 ' 32 bit TCD Signed Minor Loop Offset, Minor Loop and Offset Enabled
#define DMA_TCD3_SLAST           *&H4000906C ' 32 bit TCD Last Source Address Adjustment
#define DMA_TCD3_DADDR           *&H40009070 ' 32 bit TCD Destination Address
#define DMA_TCD3_DOFF            *&H40009074 ' 16 bit TCD Signed Destination Address Offset
#define DMA_TCD3_CITER_ELINKYES  *&H40009076 ' 16 bit TCD Current Minor Loop Link, Major Loop Count, Channel Linking Enabled
#define DMA_TCD3_CITER_ELINKNO   *&H40009076 ' 16 bit ??
#define DMA_TCD3_DLASTSGA        *&H40009078 ' 32 bit TCD Last Destination Address Adjustment/Scatter Gather Address
#define DMA_TCD3_CSR             *&H4000907C ' 16 bit TCD Control and Status
#define DMA_TCD3_BITER_ELINKYES  *&H4000907E ' 16 bit TCD Beginning Minor Loop Link, Major Loop Count ,Channel Linking Enabled
#define DMA_TCD3_BITER_ELINKNO   *&H4000907E ' 16 bit TCD Beginning Minor Loop Link, Major Loop Count ,Channel Linking Disabled

' Chapter 22: External Watchdog Monitor (EWM) - 8 bit registers
#define EWM_CTRL                *&H40061000 ' Control Register
#define EWM_SERV                *&H40061001 ' Service Register
#define EWM_CMPL                *&H40061002 ' Compare Low Register
#define EWM_CMPH                *&H40061003 ' Compare High Register

' Chapter 23: Watchdog Timer (WDOG) - 16 bit registers
#define WDOG_STCTRLH             *&H40052000 ' Watchdog Status and Control Register High
#define WDOG_STCTRLH_DISTESTWDOG &H4000        ' Allows the WDOGs functional test mode to be disabled permanently.
#define WDOG_STCTRLH_BYTESEL(n)  (((n) and 3) shl 12)    ' selects the byte to be tested when the watchdog is in the byte test mode.
#define WDOG_STCTRLH_TESTSEL     &H0800
#define WDOG_STCTRLH_TESTWDOG    &H0400
#define WDOG_STCTRLH_WAITEN      &H0080
#define WDOG_STCTRLH_STOPEN      &H0040
#define WDOG_STCTRLH_DBGEN       &H0020
#define WDOG_STCTRLH_ALLOWUPDATE &H0010
#define WDOG_STCTRLH_WINEN       &H0008
#define WDOG_STCTRLH_IRQRSTEN    &H0004
#define WDOG_STCTRLH_CLKSRC      &H0002
#define WDOG_STCTRLH_WDOGEN      &H0001
#define WDOG_STCTRLL             *&H40052002 ' Watchdog Status and Control Register Low
#define WDOG_TOVALH              *&H40052004 ' Watchdog Time-out Value Register High
#define WDOG_TOVALL              *&H40052006 ' Watchdog Time-out Value Register Low
#define WDOG_WINH                *&H40052008 ' Watchdog Window Register High
#define WDOG_WINL                *&H4005200A ' Watchdog Window Register Low
#define WDOG_REFRESH             *&H4005200C ' Watchdog Refresh register
#define WDOG_UNLOCK              *&H4005200E ' Watchdog Unlock register
#define WDOG_UNLOCK_SEQ1         &HC520
#define WDOG_UNLOCK_SEQ2         &HD928
#define WDOG_TMROUTH             *&H40052010 ' Watchdog Timer Output Register High
#define WDOG_TMROUTL             *&H40052012 ' Watchdog Timer Output Register Low
#define WDOG_RSTCNT              *&H40052014 ' Watchdog Reset Count register
#define WDOG_PRESC               *&H40052016 ' Watchdog Prescaler register

' Chapter 24: Multipurpose Clock Generator (MCG) - 8 bit registers
#define MCG_C1              *&H40064000 ' MCG Control 1 Register
#define MCG_C1_IREFSTEN     &H01            ' Internal Reference Stop Enable, Controls whether or not the internal reference clock remains enabled when the MCG enters Stop mode.
#define MCG_C1_IRCLKEN      &H02            ' Internal Reference Clock Enable, Enables the internal reference clock for use as MCGIRCLK.
#define MCG_C1_IREFS        &H04            ' Internal Reference Select, Selects the reference clock source for the FLL.
#define MCG_C1_FRDIV(n)     (((n) and &H07) shl 3)    ' FLL External Reference Divider, Selects the amount to divide down the external reference clock for the FLL
#define MCG_C1_CLKS(n)      (((n) and &H03) shl 6)    ' Clock Source Select, Selects the clock source for MCGOUTCLK
#define MCG_C2              *&H40064001 ' MCG Control 2 Register
#define MCG_C2_IRCS         &H01            ' Internal Reference Clock Select, Selects between the fast or slow internal reference clock source.
#define MCG_C2_LP           &H02            ' Low Power Select, Controls whether the FLL or PLL is disabled in BLPI and BLPE modes.
#define MCG_C2_EREFS        &H04            ' External Reference Select, Selects the source for the external reference clock. 
#define MCG_C2_HGO0         &H08            ' High Gain Oscillator Select, Controls the crystal oscillator mode of operation
#define MCG_C2_RANGE0(n)    (((n) and &H03) shl 4)    ' Frequency Range Select, Selects the frequency range for the crystal oscillator
#define MCG_C2_LOCRE0       &H80            ' Loss of Clock Reset Enable, Determines whether an interrupt or a reset request is made following a loss of OSC0 
#define MCG_C3              *&H40064002 ' MCG Control 3 Register
#define MCG_C3_SCTRIM(n)    (n)            ' Slow Internal Reference Clock Trim Setting
#define MCG_C4              *&H40064003 ' MCG Control 4 Register
#define MCG_C4_SCFTRIM      &H01            ' Slow Internal Reference Clock Fine Trim
#define MCG_C4_FCTRIM(n)    (((n) and &H0F) shl 1)    ' Fast Internal Reference Clock Trim Setting
#define MCG_C4_DRST_DRS(n)  (((n) and &H03) shl 5)    ' DCO Range Select
#define MCG_C4_DMX32        &H80            ' DCO Maximum Frequency with 32.768 kHz Reference, controls whether the DCO frequency range is narrowed
#define MCG_C5              *&H40064004 ' MCG Control 5 Register
#define MCG_C5_PRDIV0(n)    ((n) and &H1F)        ' PLL External Reference Divider
#define MCG_C5_PLLSTEN0     &H20            ' PLL Stop Enable
#define MCG_C5_PLLCLKEN0    &H40            ' PLL Clock Enable
#define MCG_C6              *&H40064005 ' MCG Control 6 Register
#define MCG_C6_VDIV0(n)     ((n) and &H1F)        ' VCO 0 Divider
#define MCG_C6_CME0         &H20            ' Clock Monitor Enable
#define MCG_C6_PLLS         &H40            ' PLL Select, Controls whether the PLL or FLL output is selected as the MCG source when CLKS[1:0]=00. 
#define MCG_C6_LOLIE0       &H80            ' Loss of Lock Interrrupt Enable
#define MCG_S               *&H40064006 ' MCG Status Register
#define MCG_S_IRCST         &H01            ' Internal Reference Clock Status
#define MCG_S_OSCINIT0      &H02            ' OSC Initialization,  resets to 0, is set to 1 after the initialization cycles of the crystal oscillator
#define MCG_S_CLKST(n)      (((n) and &H03) shl 2)    ' Clock Mode Status, 0=FLL is selected, 1= Internal ref, 2=External ref, 3=PLL
#define MCG_S_CLKST_MASK    &H0C
#define MCG_S_IREFST        &H10            ' Internal Reference Status
#define MCG_S_PLLST         &H20            ' PLL Select Status
#define MCG_S_LOCK0         &H40            ' Lock Status, 0=PLL Unlocked, 1=PLL Locked
#define MCG_S_LOLS0         &H80            ' Loss of Lock Status
#define MCG_SC              *&H40064008 ' MCG Status and Control Register
#define MCG_SC_LOCS0        &H01            ' OSC0 Loss of Clock Status
#define MCG_SC_FCRDIV(n)    (((n) and &H07) shl 1)    ' Fast Clock Internal Reference Divider
#define MCG_SC_FLTPRSRV     &H10            ' FLL Filter Preserve Enable
#define MCG_SC_ATMF         &H20            ' Automatic Trim Machine Fail Flag
#define MCG_SC_ATMS         &H40            ' Automatic Trim Machine Select
#define MCG_SC_ATME         &H80            ' Automatic Trim Machine Enable
#define MCG_ATCVH           *&H4006400A ' MCG Auto Trim Compare Value High Register
#define MCG_ATCVL           *&H4006400B ' MCG Auto Trim Compare Value Low Register
#define MCG_C7              *&H4006400C ' MCG Control 7 Register
#define MCG_C8              *&H4006400D ' MCG Control 8 Register

' Chapter 25: Oscillator (OSC) - 8 bit registers
#define OSC0_CR          *&H40065000 ' OSC Control Register
#define OSC_SC16P        &H01            ' Oscillator 16 pF Capacitor Load Configure
#define OSC_SC8P         &H02            ' Oscillator 8 pF Capacitor Load Configure
#define OSC_SC4P         &H04            ' Oscillator 4 pF Capacitor Load Configure
#define OSC_SC2P         &H08            ' Oscillator 2 pF Capacitor Load Configure
#define OSC_EREFSTEN     &H20            ' External Reference Stop Enable, Controls whether or not the external reference clock (OSCERCLK) remains enabled when MCU enters Stop mode.
#define OSC_ERCLKEN      &H80            ' External Reference Enable, Enables external reference clock (OSCERCLK).

' Chapter 27: Flash Memory Controller (FMC) - 32 bit registers
#define FMC_PFAPR        *&H4001F000    ' Flash Access Protection
#define FMC_PFB0CR       *&H4001F004    ' Flash Control
#define FMC_TAGVDW0S0    *&H4001F100    ' Cache Tag Storage
#define FMC_TAGVDW0S1    *&H4001F104    ' Cache Tag Storage
#define FMC_TAGVDW1S0    *&H4001F108    ' Cache Tag Storage
#define FMC_TAGVDW1S1    *&H4001F10C    ' Cache Tag Storage
#define FMC_TAGVDW2S0    *&H4001F110    ' Cache Tag Storage
#define FMC_TAGVDW2S1    *&H4001F114    ' Cache Tag Storage
#define FMC_TAGVDW3S0    *&H4001F118    ' Cache Tag Storage
#define FMC_TAGVDW3S1    *&H4001F11C    ' Cache Tag Storage
#define FMC_DATAW0S0     *&H4001F200    ' Cache Data Storage
#define FMC_DATAW0S1     *&H4001F204    ' Cache Data Storage
#define FMC_DATAW1S0     *&H4001F208    ' Cache Data Storage
#define FMC_DATAW1S1     *&H4001F20C    ' Cache Data Storage
#define FMC_DATAW2S0     *&H4001F210    ' Cache Data Storage
#define FMC_DATAW2S1     *&H4001F214    ' Cache Data Storage
#define FMC_DATAW3S0     *&H4001F218    ' Cache Data Storage
#define FMC_DATAW3S1     *&H4001F21C    ' Cache Data Storage

' Chapter 28: Flash Memory Module (FTFL) - 8 bit registers
#define FTFL_FSTAT              *&H40020000      ' Flash Status Register
#define FTFL_FSTAT_CCIF         &H80            ' Command Complete Interrupt Flag
#define FTFL_FSTAT_RDCOLERR     &H40            ' Flash Read Collision Error Flag
#define FTFL_FSTAT_ACCERR       &H20            ' Flash Access Error Flag
#define FTFL_FSTAT_FPVIOL       &H10            ' Flash Protection Violation Flag
#define FTFL_FSTAT_MGSTAT0      &H01            ' Memory Controller Command Completion Status Flag
#define FTFL_FCNFG              *&H40020001      ' Flash Configuration Register
#define FTFL_FCNFG_CCIE         &H80            ' Command Complete Interrupt Enable
#define FTFL_FCNFG_RDCOLLIE     &H40            ' Read Collision Error Interrupt Enable
#define FTFL_FCNFG_ERSAREQ      &H20            ' Erase All Request
#define FTFL_FCNFG_ERSSUSP      &H10            ' Erase Suspend
#define FTFL_FCNFG_PFLSH        &H04            ' Flash memory configuration
#define FTFL_FCNFG_RAMRDY       &H02            ' RAM Ready
#define FTFL_FCNFG_EEERDY       &H01            ' EEPROM Ready
#define FTFL_FSEC               *&H40020002      ' Flash Security Register
#define FTFL_FOPT               *&H40020003      ' Flash Option Register
#define FTFL_FCCOB3             *&H40020004      ' Flash Common Command Object Registers
#define FTFL_FCCOB2             *&H40020005
#define FTFL_FCCOB1             *&H40020006
#define FTFL_FCCOB0             *&H40020007
#define FTFL_FCCOB7             *&H40020008
#define FTFL_FCCOB6             *&H40020009
#define FTFL_FCCOB5             *&H4002000A
#define FTFL_FCCOB4             *&H4002000B
#define FTFL_FCCOBB             *&H4002000C
#define FTFL_FCCOBA             *&H4002000D
#define FTFL_FCCOB9             *&H4002000E
#define FTFL_FCCOB8             *&H4002000F
#define FTFL_FPROT3             *&H40020010      ' Program Flash Protection Registers
#define FTFL_FPROT2             *&H40020011      ' Program Flash Protection Registers
#define FTFL_FPROT1             *&H40020012      ' Program Flash Protection Registers
#define FTFL_FPROT0             *&H40020013      ' Program Flash Protection Registers
#define FTFL_FEPROT             *&H40020016      ' EEPROM Protection Register
#define FTFL_FDPROT             *&H40020017      ' Data Flash Protection Register

' Chapter 30: Cyclic Redundancy Check (CRC) - 32 bit registers
#define CRC_CRC                 *&H40032000 ' CRC Data register
#define CRC_GPOLY               *&H40032004 ' CRC Polynomial register
#define CRC_CTRL                *&H40032008 ' CRC Control register

' Chapter 31: Analog-to-Digital Converter (ADC) - 32 bit registers
#define ADC0_SC1A               *&H4003B000 ' ADC status and control registers 1
#define ADC0_SC1B               *&H4003B004 ' ADC status and control registers 1
#define ADC_SC1_COCO            &H80            ' Conversion complete flag
#define ADC_SC1_AIEN            &H40            ' Interrupt enable
#define ADC_SC1_DIFF            &H20            ' Differential mode enable
#define ADC_SC1_ADCH(n)         ((n) and &H1F)        ' Input channel select
#define ADC0_CFG1               *&H4003B008 ' ADC configuration register 1
#define ADC_CFG1_ADLPC          &H80            ' Low-power configuration
#define ADC_CFG1_ADIV(n)        (((n) and 3) shl 5)    ' Clock divide select, 0=direct, 1=div2, 2=div4, 3=div8
#define ADC_CFG1_ADLSMP         &H10            ' Sample time configuration, 0=Short, 1=Long
#define ADC_CFG1_MODE(n)        (((n) and 3) shl 2)    ' Conversion mode, 0=8 bit, 1=12 bit, 2=10 bit, 3=16 bit
#define ADC_CFG1_ADICLK(n)      (((n) and 3) shl 0)    ' Input clock, 0=bus, 1=bus/2, 2=OSCERCLK, 3=async
#define ADC0_CFG2               *&H4003B00C ' Configuration register 2
#define ADC_CFG2_MUXSEL         &H10            ' 0=a channels, 1=b channels
#define ADC_CFG2_ADACKEN        &H08            ' async clock enable
#define ADC_CFG2_ADHSC          &H04            ' High speed configuration
#define ADC_CFG2_ADLSTS(n)      (((n) and 3) shl 0)    ' Sample time, 0=24 cycles, 1=12 cycles, 2=6 cycles, 3=2 cycles
#define ADC0_RA                 *&H4003B010 ' ADC data result register
#define ADC0_RB                 *&H4003B014 ' ADC data result register
#define ADC0_CV1                *&H4003B018 ' Compare value registers
#define ADC0_CV2                *&H4003B01C ' Compare value registers
#define ADC0_SC2                *&H4003B020 ' Status and control register 2
#define ADC_SC2_ADACT           &H80            ' Conversion active
#define ADC_SC2_ADTRG           &H40            ' Conversion trigger select, 0=software, 1=hardware
#define ADC_SC2_ACFE            &H20            ' Compare function enable
#define ADC_SC2_ACFGT           &H10            ' Compare function greater than enable
#define ADC_SC2_ACREN           &H08            ' Compare function range enable
#define ADC_SC2_DMAEN           &H04            ' DMA enable
#define ADC_SC2_REFSEL(n)       (((n) and 3) shl 0)    ' Voltage reference, 0=vcc/external, 1=1.2 volts
#define ADC0_SC3                *&H4003B024 ' Status and control register 3
#define ADC_SC3_CAL             &H80            ' Calibration, 1=begin, stays set while cal in progress
#define ADC_SC3_CALF            &H40            ' Calibration failed flag
#define ADC_SC3_ADCO            &H08            ' Continuous conversion enable
#define ADC_SC3_AVGE            &H04            ' Hardware average enable
#define ADC_SC3_AVGS(n)        	(((n) and 3) shl 0)    ' avg select, 0=4 samples, 1=8 samples, 2=16 samples, 3=32 samples
#define ADC0_OFS                *&H4003B028 ' ADC offset correction register
#define ADC0_PG                 *&H4003B02C ' ADC plus-side gain register
#define ADC0_MG                 *&H4003B030 ' ADC minus-side gain register
#define ADC0_CLPD               *&H4003B034 ' ADC plus-side general calibration value register
#define ADC0_CLPS               *&H4003B038 ' ADC plus-side general calibration value register
#define ADC0_CLP4               *&H4003B03C ' ADC plus-side general calibration value register
#define ADC0_CLP3               *&H4003B040 ' ADC plus-side general calibration value register
#define ADC0_CLP2               *&H4003B044 ' ADC plus-side general calibration value register
#define ADC0_CLP1               *&H4003B048 ' ADC plus-side general calibration value register
#define ADC0_CLP0               *&H4003B04C ' ADC plus-side general calibration value register
#define ADC0_CLMD               *&H4003B054 ' ADC minus-side general calibration value register
#define ADC0_CLMS               *&H4003B058 ' ADC minus-side general calibration value register
#define ADC0_CLM4               *&H4003B05C ' ADC minus-side general calibration value register
#define ADC0_CLM3               *&H4003B060 ' ADC minus-side general calibration value register
#define ADC0_CLM2               *&H4003B064 ' ADC minus-side general calibration value register
#define ADC0_CLM1               *&H4003B068 ' ADC minus-side general calibration value register
#define ADC0_CLM0               *&H4003B06C ' ADC minus-side general calibration value register

'ADC1 and DAC added for MK20DX256 - 32 bit registers
#define ADC1_SC1A		*&H400BB000 ' ADC status and control registers 1
#define ADC1_SC1B		*&H400BB004 ' ADC status and control registers 1
#define ADC1_CFG1		*&H400BB008 ' ADC configuration register 1
#define ADC1_CFG2		*&H400BB00C ' Configuration register 2
#define ADC1_RA			*&H400BB010 ' ADC data result register
#define ADC1_RB			*&H400BB014 ' ADC data result register
#define ADC1_CV1		*&H400BB018 ' Compare value registers
#define ADC1_CV2		*&H400BB01C ' Compare value registers
#define ADC1_SC2		*&H400BB020 ' Status and control register 2
#define ADC1_SC3		*&H400BB024 ' Status and control register 3
#define ADC1_OFS		*&H400BB028 ' ADC offset correction register
#define ADC1_PG			*&H400BB02C ' ADC plus-side gain register
#define ADC1_MG			*&H400BB030 ' ADC minus-side gain register
#define ADC1_CLPD		*&H400BB034 ' ADC plus-side general calibration value register
#define ADC1_CLPS		*&H400BB038 ' ADC plus-side general calibration value register
#define ADC1_CLP4		*&H400BB03C ' ADC plus-side general calibration value register
#define ADC1_CLP3		*&H400BB040 ' ADC plus-side general calibration value register
#define ADC1_CLP2		*&H400BB044 ' ADC plus-side general calibration value register
#define ADC1_CLP1		*&H400BB048 ' ADC plus-side general calibration value register
#define ADC1_CLP0		*&H400BB04C ' ADC plus-side general calibration value register
#define ADC1_CLMD		*&H400BB054 ' ADC minus-side general calibration value register
#define ADC1_CLMS		*&H400BB058 ' ADC minus-side general calibration value register
#define ADC1_CLM4		*&H400BB05C ' ADC minus-side general calibration value register
#define ADC1_CLM3		*&H400BB060 ' ADC minus-side general calibration value register
#define ADC1_CLM2		*&H400BB064 ' ADC minus-side general calibration value register
#define ADC1_CLM1		*&H400BB068 ' ADC minus-side general calibration value register
#define ADC1_CLM0		*&H400BB06C ' ADC minus-side general calibration value register

' 8 bit registers
#define DAC0_DAT0L		*&H400CC000 ' DAC Data Low Register 
#define DAC0_DATH		*&H400CC001 ' DAC Data High Register 
#define DAC0_DAT1L		*&H400CC002 ' DAC Data Low Register 
#define DAC0_DAT2L		*&H400CC004 ' DAC Data Low Register 
#define DAC0_DAT3L		*&H400CC006 ' DAC Data Low Register 
#define DAC0_DAT4L		*&H400CC008 ' DAC Data Low Register 
#define DAC0_DAT5L		*&H400CC00A ' DAC Data Low Register 
#define DAC0_DAT6L		*&H400CC00C ' DAC Data Low Register 
#define DAC0_DAT7L		*&H400CC00E ' DAC Data Low Register 
#define DAC0_DAT8L		*&H400CC010 ' DAC Data Low Register 
#define DAC0_DAT9L		*&H400CC012 ' DAC Data Low Register 
#define DAC0_DAT10L		*&H400CC014 ' DAC Data Low Register 
#define DAC0_DAT11L		*&H400CC016 ' DAC Data Low Register 
#define DAC0_DAT12L		*&H400CC018 ' DAC Data Low Register 
#define DAC0_DAT13L		*&H400CC01A ' DAC Data Low Register 
#define DAC0_DAT14L		*&H400CC01C ' DAC Data Low Register 
#define DAC0_DAT15L		*&H400CC01E ' DAC Data Low Register 
#define DAC0_SR			*&H400CC020 ' DAC Status Register 
#define DAC0_C0			*&H400CC021 ' DAC Control Register 

#define DAC_C0_DACEN			&H80				' DAC Enable
#define DAC_C0_DACRFS			&H40				' DAC Reference Select
#define DAC_C0_DACTRGSEL		&H20				' DAC Trigger Select
#define DAC_C0_DACSWTRG			&H10				' DAC Software Trigger
#define DAC_C0_LPEN			&H08				' DAC Low Power Control
#define DAC_C0_DACBWIEN			&H04				' DAC Buffer Watermark Interrupt Enable
#define DAC_C0_DACBTIEN			&H02				' DAC Buffer Read Pointer Top Flag Interrupt Enable
#define DAC_C0_DACBBIEN			&H01				' DAC Buffer Read Pointer Bottom Flag Interrupt Enable
#define DAC0_C1			*&H400CC022 ' DAC Control Register 1 
#define DAC_C1_DMAEN			&H80				' DMA Enable Select
#define DAC_C1_DACBFWM(n)		(((n) and 3) shl 3)		' DAC Buffer Watermark Select
#define DAC_C1_DACBFMD(n)		(((n) and 3) shl 0)		' DAC Buffer Work Mode Select
#define DAC_C1_DACBFEN			&H00				' DAC Buffer Enable

#define DAC0_C2			*&H400CC023 ' DAC Control Register 2 
#define DAC_C2_DACBFRP(n)		(((n) and 15) shl 4)		' DAC Buffer Read Pointer
#define DAC_C2_DACBFUP(n)		(((n) and 15) shl 0)		' DAC Buffer Upper Limit


'#define MCG_C2_RANGE0(n)        (((n) and &H03) shl 4)    ' Frequency Range Select, Selects the frequency range for the crystal oscillator
'#define MCG_C2_LOCRE0           &H80            ' Loss of Clock Reset Enable, Determines whether an interrupt or a reset request is made following a loss of OSC0 

' Chapter 32: Comparator (CMP) - 8 bit registers
#define CMP0_CR0                *&H40073000 ' CMP Control Register 0
#define CMP0_CR1                *&H40073001 ' CMP Control Register 1
#define CMP0_FPR                *&H40073002 ' CMP Filter Period Register
#define CMP0_SCR                *&H40073003 ' CMP Status and Control Register
#define CMP0_DACCR              *&H40073004 ' DAC Control Register
#define CMP0_MUXCR              *&H40073005 ' MUX Control Register
#define CMP1_CR0                *&H40073008 ' CMP Control Register 0
#define CMP1_CR1                *&H40073009 ' CMP Control Register 1
#define CMP1_FPR                *&H4007300A ' CMP Filter Period Register
#define CMP1_SCR                *&H4007300B ' CMP Status and Control Register
#define CMP1_DACCR              *&H4007300C ' DAC Control Register
#define CMP1_MUXCR              *&H4007300D ' MUX Control Register

' Chapter 33: Voltage Reference (VREFV1) - 8 bit registers
#define VREF_TRM                *&H40074000 ' VREF Trim Register
#define VREF_SC                 *&H40074001 ' VREF Status and Control Register

' Chapter 34: Programmable Delay Block (PDB) - 32 bit registers
#define PDB0_SC                 *&H40036000 ' Status and Control Register
#define PDB_SC_LDMOD(n)         (((n) and 3) shl 18)    ' Load Mode Select
#define PDB_SC_PDBEIE           &H00020000        ' Sequence Error Interrupt Enable
#define PDB_SC_SWTRIG           &H00010000        ' Software Trigger
#define PDB_SC_DMAEN            &H00008000        ' DMA Enable
#define PDB_SC_PRESCALER(n)     (((n) and 7) shl 12)    ' Prescaler Divider Select
#define PDB_SC_TRGSEL(n)        (((n) and 15) shl 8)    ' Trigger Input Source Select
#define PDB_SC_PDBEN            &H00000080        ' PDB Enable
#define PDB_SC_PDBIF            &H00000040        ' PDB Interrupt Flag
#define PDB_SC_PDBIE            &H00000020        ' PDB Interrupt Enable.
#define PDB_SC_MULT(n)          (((n) and 3) shl 2)    ' Multiplication Factor
#define PDB_SC_CONT             &H00000002        ' Continuous Mode Enable
#define PDB_SC_LDOK             &H00000001        ' Load OK
#define PDB0_MOD                *&H40036004 ' Modulus Register
#define PDB0_CNT                *&H40036008 ' Counter Register
#define PDB0_IDLY               *&H4003600C ' Interrupt Delay Register
#define PDB0_CH0C1              *&H40036010 ' Channel n Control Register 1
#define PDB0_CH0S               *&H40036014 ' Channel n Status Register
#define PDB0_CH0DLY0            *&H40036018 ' Channel n Delay 0 Register
#define PDB0_CH0DLY1            *&H4003601C ' Channel n Delay 1 Register
#define PDB0_POEN               *&H40036190 ' Pulse-Out n Enable Register
#define PDB0_PO0DLY             *&H40036194 ' Pulse-Out n Delay Register
#define PDB0_PO1DLY             *&H40036198 ' Pulse-Out n Delay Register

' Chapter 35: FlexTimer Module (FTM) - 32 bit registers
#define FTM0_SC                 *&H40038000 ' Status And Control
#define FTM_SC_TOF              &H80                ' Timer Overflow Flag
#define FTM_SC_TOIE             &H40                ' Timer Overflow Interrupt Enable
#define FTM_SC_CPWMS            &H20                ' Center-Aligned PWM Select
#define FTM_SC_CLKS(n)          (((n) and 3) shl 3)        ' Clock Source Selection
#define FTM_SC_PS(n)            (((n) and 7) shl 0)        ' Prescale Factor Selection
#define FTM0_CNT                *&H40038004 ' Counter
#define FTM0_MOD                *&H40038008 ' Modulo
#define FTM0_C0SC               *&H4003800C ' Channel 0 Status And Control
#define FTM0_C0V                *&H40038010 ' Channel 0 Value
#define FTM0_C1SC               *&H40038014 ' Channel 1 Status And Control
#define FTM0_C1V                *&H40038018 ' Channel 1 Value
#define FTM0_C2SC               *&H4003801C ' Channel 2 Status And Control
#define FTM0_C2V                *&H40038020 ' Channel 2 Value
#define FTM0_C3SC               *&H40038024 ' Channel 3 Status And Control
#define FTM0_C3V                *&H40038028 ' Channel 3 Value
#define FTM0_C4SC               *&H4003802C ' Channel 4 Status And Control
#define FTM0_C4V                *&H40038030 ' Channel 4 Value
#define FTM0_C5SC               *&H40038034 ' Channel 5 Status And Control
#define FTM0_C5V                *&H40038038 ' Channel 5 Value
#define FTM0_C6SC               *&H4003803C ' Channel 6 Status And Control
#define FTM0_C6V                *&H40038040 ' Channel 6 Value
#define FTM0_C7SC               *&H40038044 ' Channel 7 Status And Control
#define FTM0_C7V                *&H40038048 ' Channel 7 Value
#define FTM0_CNTIN              *&H4003804C ' Counter Initial Value
#define FTM0_STATUS             *&H40038050 ' Capture And Compare Status
#define FTM0_MODE               *&H40038054 ' Features Mode Selection
#define FTM_MODE_FAULTIE        &H80                ' Fault Interrupt Enable
#define FTM_MODE_FAULTM(n)      (((n) and 3) shl 5)        ' Fault Control Mode
#define FTM_MODE_CAPTEST        &H10                ' Capture Test Mode Enable
#define FTM_MODE_PWMSYNC        &H08                ' PWM Synchronization Mode
#define FTM_MODE_WPDIS          &H04                ' Write Protection Disable
#define FTM_MODE_INIT           &H02                ' Initialize The Channels Output
#define FTM_MODE_FTMEN          &H01                ' FTM Enable
#define FTM0_SYNC               *&H40038058 ' Synchronization
#define FTM_SYNC_SWSYNC         &H80                ' 
#define FTM_SYNC_TRIG2          &H40                ' 
#define FTM_SYNC_TRIG1          &H20                ' 
#define FTM_SYNC_TRIG0          &H10                ' 
#define FTM_SYNC_SYNCHOM        &H08                ' 
#define FTM_SYNC_REINIT         &H04                ' 
#define FTM_SYNC_CNTMAX         &H02                ' 
#define FTM_SYNC_CNTMIN         &H01                ' 
#define FTM0_OUTINIT            *&H4003805C ' Initial State For Channels Output
#define FTM0_OUTMASK            *&H40038060 ' Output Mask
#define FTM0_COMBINE            *&H40038064 ' Function For Linked Channels
#define FTM0_DEADTIME           *&H40038068 ' Deadtime Insertion Control
#define FTM0_EXTTRIG            *&H4003806C ' FTM External Trigger
#define FTM0_POL                *&H40038070 ' Channels Polarity
#define FTM0_FMS                *&H40038074 ' Fault Mode Status
#define FTM0_FILTER             *&H40038078 ' Input Capture Filter Control
#define FTM0_FLTCTRL            *&H4003807C ' Fault Control
#define FTM0_QDCTRL             *&H40038080 ' Quadrature Decoder Control And Status
#define FTM0_CONF               *&H40038084 ' Configuration
#define FTM0_FLTPOL             *&H40038088 ' FTM Fault Input Polarity
#define FTM0_SYNCONF            *&H4003808C ' Synchronization Configuration
#define FTM0_INVCTRL            *&H40038090 ' FTM Inverting Control
#define FTM0_SWOCTRL            *&H40038094 ' FTM Software Output Control
#define FTM0_PWMLOAD            *&H40038098 ' FTM PWM Load
#define FTM1_SC                 *&H40039000 ' Status And Control
#define FTM1_CNT                *&H40039004 ' Counter
#define FTM1_MOD                *&H40039008 ' Modulo
#define FTM1_C0SC               *&H4003900C ' Channel 0 Status And Control
#define FTM1_C0V                *&H40039010 ' Channel 0 Value
#define FTM1_C1SC               *&H40039014 ' Channel 1 Status And Control
#define FTM1_C1V                *&H40039018 ' Channel 1 Value
#define FTM1_CNTIN              *&H4003904C ' Counter Initial Value
#define FTM1_STATUS             *&H40039050 ' Capture And Compare Status
#define FTM1_MODE               *&H40039054 ' Features Mode Selection
#define FTM1_SYNC               *&H40039058 ' Synchronization
#define FTM1_OUTINIT            *&H4003905C ' Initial State For Channels Output
#define FTM1_OUTMASK            *&H40039060 ' Output Mask
#define FTM1_COMBINE            *&H40039064 ' Function For Linked Channels
#define FTM1_DEADTIME           *&H40039068 ' Deadtime Insertion Control
#define FTM1_EXTTRIG            *&H4003906C ' FTM External Trigger
#define FTM1_POL                *&H40039070 ' Channels Polarity
#define FTM1_FMS                *&H40039074 ' Fault Mode Status
#define FTM1_FILTER             *&H40039078 ' Input Capture Filter Control
#define FTM1_FLTCTRL            *&H4003907C ' Fault Control
#define FTM1_QDCTRL             *&H40039080 ' Quadrature Decoder Control And Status
#define FTM1_CONF               *&H40039084 ' Configuration
#define FTM1_FLTPOL             *&H40039088 ' FTM Fault Input Polarity
#define FTM1_SYNCONF            *&H4003908C ' Synchronization Configuration
#define FTM1_INVCTRL            *&H40039090 ' FTM Inverting Control
#define FTM1_SWOCTRL            *&H40039094 ' FTM Software Output Control
#define FTM1_PWMLOAD            *&H40039098 ' FTM PWM Load
'added for MK20DX256
#define FTM2_SC                 *&H400B8000 ' Status And Control
#define FTM2_CNT                *&H400B8004 ' Counter
#define FTM2_MOD                *&H400B8008 ' Modulo
#define FTM2_C0SC               *&H400B800C ' Channel 0 Status And Control
#define FTM2_C0V                *&H400B8010 ' Channel 0 Value
#define FTM2_C1SC               *&H400B8014 ' Channel 1 Status And Control
#define FTM2_C1V                *&H400B8018 ' Channel 1 Value
#define FTM2_CNTIN              *&H400B804C ' Counter Initial Value
#define FTM2_STATUS             *&H400B8050 ' Capture And Compare Status
#define FTM2_MODE               *&H400B8054 ' Features Mode Selection
#define FTM2_SYNC               *&H400B8058 ' Synchronization
#define FTM2_OUTINIT            *&H400B805C ' Initial State For Channels Output
#define FTM2_OUTMASK            *&H400B8060 ' Output Mask
#define FTM2_COMBINE            *&H400B8064 ' Function For Linked Channels
#define FTM2_DEADTIME           *&H400B8068 ' Deadtime Insertion Control
#define FTM2_EXTTRIG            *&H400B806C ' FTM External Trigger
#define FTM2_POL                *&H400B8070 ' Channels Polarity
#define FTM2_FMS                *&H400B8074 ' Fault Mode Status
#define FTM2_FILTER             *&H400B8078 ' Input Capture Filter Control
#define FTM2_FLTCTRL            *&H400B807C ' Fault Control
#define FTM2_QDCTRL             *&H400B8080 ' Quadrature Decoder Control And Status
#define FTM2_CONF               *&H400B8084 ' Configuration
#define FTM2_FLTPOL             *&H400B8088 ' FTM Fault Input Polarity
#define FTM2_SYNCONF            *&H400B808C ' Synchronization Configuration
#define FTM2_INVCTRL            *&H400B8090 ' FTM Inverting Control
#define FTM2_SWOCTRL            *&H400B8094 ' FTM Software Output Control
#define FTM2_PWMLOAD            *&H400B8098 ' FTM PWM Load

' Chapter 36: Periodic Interrupt Timer (PIT) - 32 bit registers
#define PIT_MCR                 *&H40037000 ' PIT Module Control Register
#define PIT_LDVAL0              *&H40037100 ' Timer Load Value Register
#define PIT_CVAL0               *&H40037104 ' Current Timer Value Register
#define PIT_TCTRL0              *&H40037108 ' Timer Control Register
#define PIT_TFLG0               *&H4003710C ' Timer Flag Register
#define PIT_LDVAL1              *&H40037110 ' Timer Load Value Register
#define PIT_CVAL1               *&H40037114 ' Current Timer Value Register
#define PIT_TCTRL1              *&H40037118 ' Timer Control Register
#define PIT_TFLG1               *&H4003711C ' Timer Flag Register
#define PIT_LDVAL2              *&H40037120 ' Timer Load Value Register
#define PIT_CVAL2               *&H40037124 ' Current Timer Value Register
#define PIT_TCTRL2              *&H40037128 ' Timer Control Register
#define PIT_TFLG2               *&H4003712C ' Timer Flag Register
#define PIT_LDVAL3              *&H40037130 ' Timer Load Value Register
#define PIT_CVAL3               *&H40037134 ' Current Timer Value Register
#define PIT_TCTRL3              *&H40037138 ' Timer Control Register
#define PIT_TFLG3               *&H4003713C ' Timer Flag Register

' Chapter 37: Low-Power Timer (LPTMR) - 32 bit registers
#define LPTMR0_CSR              *&H40040000 ' Low Power Timer Control Status Register
#define LPTMR0_PSR              *&H40040004 ' Low Power Timer Prescale Register
#define LPTMR0_CMR              *&H40040008 ' Low Power Timer Compare Register
#define LPTMR0_CNR              *&H4004000C ' Low Power Timer Counter Register

' Chapter 38: Carrier Modulator Transmitter (CMT) - 8 bit registers
#define CMT_CGH1                *&H40062000 ' CMT Carrier Generator High Data Register 1
#define CMT_CGL1                *&H40062001 ' CMT Carrier Generator Low Data Register 1
#define CMT_CGH2                *&H40062002 ' CMT Carrier Generator High Data Register 2
#define CMT_CGL2                *&H40062003 ' CMT Carrier Generator Low Data Register 2
#define CMT_OC                  *&H40062004 ' CMT Output Control Register
#define CMT_MSC                 *&H40062005 ' CMT Modulator Status and Control Register
#define CMT_CMD1                *&H40062006 ' CMT Modulator Data Register Mark High
#define CMT_CMD2                *&H40062007 ' CMT Modulator Data Register Mark Low
#define CMT_CMD3                *&H40062008 ' CMT Modulator Data Register Space High
#define CMT_CMD4                *&H40062009 ' CMT Modulator Data Register Space Low
#define CMT_PPS                 *&H4006200A ' CMT Primary Prescaler Register
#define CMT_DMA                 *&H4006200B ' CMT Direct Memory Access Register

' Chapter 39: Real Time Clock (RTC) - 32 bit registers
#define RTC_TSR            *&H4003D000 ' RTC Time Seconds Register
#define RTC_TPR            *&H4003D004 ' RTC Time Prescaler Register
#define RTC_TAR            *&H4003D008 ' RTC Time Alarm Register
#define RTC_TCR            *&H4003D00C ' RTC Time Compensation Register
#define RTC_TCR_CIC(n)     (((n) and 255) shl 24)        ' Compensation Interval Counter
#define RTC_TCR_TCV(n)     (((n) and 255) shl 16)        ' Time Compensation Value
#define RTC_TCR_CIR(n)     (((n) and 255) shl 8)        ' Compensation Interval Register
#define RTC_TCR_TCR(n)     (((n) and 255) shl 0)        ' Time Compensation Register
#define RTC_CR             *&H4003D010 ' RTC Control Register
#define RTC_CR_SC2P        &H00002000        ' 
#define RTC_CR_SC4P        &H00001000        ' 
#define RTC_CR_SC8P        &H00000800        ' 
#define RTC_CR_SC16P       &H00000400        ' 
#define RTC_CR_CLKO        &H00000200        ' 
#define RTC_CR_OSCE        &H00000100        ' 
#define RTC_CR_UM          &H00000008        ' 
#define RTC_CR_SUP         &H00000004        ' 
#define RTC_CR_WPE         &H00000002        ' 
#define RTC_CR_SWR         &H00000001        ' 
#define RTC_SR             *&H4003D014 ' RTC Status Register
#define RTC_SR_TCE         &H00000010        ' 
#define RTC_SR_TAF         &H00000004        ' 
#define RTC_SR_TOF         &H00000002        ' 
#define RTC_SR_TIF         &H00000001        ' 
#define RTC_LR             *&H4003D018 ' RTC Lock Register
#define RTC_IER            *&H4003D01C ' RTC Interrupt Enable Register
#define RTC_WAR            *&H4003D800 ' RTC Write Access Register
#define RTC_RAR            *&H4003D804 ' RTC Read Access Register

' Chapter 40: Universal Serial Bus OTG Controller (USBOTG)  8 bit registers
#define USB0_PERID                  *&H40072000 ' Peripheral ID register
#define USB0_IDCOMP                 *&H40072004 ' Peripheral ID Complement register
#define USB0_REV                    *&H40072008 ' Peripheral Revision register
#define USB0_ADDINFO                *&H4007200C ' Peripheral Additional Info register
#define USB0_OTGISTAT               *&H40072010 ' OTG Interrupt Status register
#define USB_OTGISTAT_IDCHG          &H80            '
#define USB_OTGISTAT_ONEMSEC        &H40            '
#define USB_OTGISTAT_LINE_STATE_CHG &H20            '
#define USB_OTGISTAT_SESSVLDCHG     &H08            '
#define USB_OTGISTAT_B_SESS_CHG     &H04            '
#define USB_OTGISTAT_AVBUSCHG       &H01            '
#define USB0_OTGICR                 *&H40072014 ' OTG Interrupt Control Register
#define USB_OTGICR_IDEN             &H80            ' 
#define USB_OTGICR_ONEMSECEN        &H40            ' 
#define USB_OTGICR_LINESTATEEN      &H20            ' 
#define USB_OTGICR_SESSVLDEN        &H08            ' 
#define USB_OTGICR_BSESSEN          &H04            ' 
#define USB_OTGICR_AVBUSEN          &H01            ' 
#define USB0_OTGSTAT                *&H40072018 ' OTG Status register
#define USB_OTGSTAT_ID              &H80            ' 
#define USB_OTGSTAT_ONEMSECEN       &H40            ' 
#define USB_OTGSTAT_LINESTATESTABLE &H20            ' 
#define USB_OTGSTAT_SESS_VLD        &H08            ' 
#define USB_OTGSTAT_BSESSEND        &H04            ' 
#define USB_OTGSTAT_AVBUSVLD        &H01            ' 
#define USB0_OTGCTL                 *&H4007201C ' OTG Control Register
#define USB_OTGCTL_DPHIGH           &H80            ' 
#define USB_OTGCTL_DPLOW            &H20            ' 
#define USB_OTGCTL_DMLOW            &H10            ' 
#define USB_OTGCTL_OTGEN            &H04            ' 
#define USB0_ISTAT                  *&H40072080 ' Interrupt Status Register
#define USB_ISTAT_STALL             &H80            ' 
#define USB_ISTAT_ATTACH            &H40            ' 
#define USB_ISTAT_RESUME            &H20            ' 
#define USB_ISTAT_SLEEP             &H10            ' 
#define USB_ISTAT_TOKDNE            &H08            ' 
#define USB_ISTAT_SOFTOK            &H04            ' 
#define USB_ISTAT_ERROR             &H02            ' 
#define USB_ISTAT_USBRST            &H01            ' 
#define USB0_INTEN                  *&H40072084 ' Interrupt Enable Register
#define USB_INTEN_STALLEN           &H80            ' 
#define USB_INTEN_ATTACHEN          &H40            ' 
#define USB_INTEN_RESUMEEN          &H20            ' 
#define USB_INTEN_SLEEPEN           &H10            ' 
#define USB_INTEN_TOKDNEEN          &H08            ' 
#define USB_INTEN_SOFTOKEN          &H04            ' 
#define USB_INTEN_ERROREN           &H02            ' 
#define USB_INTEN_USBRSTEN          &H01            ' 
#define USB0_ERRSTAT                *&H40072088 ' Error Interrupt Status Register
#define USB_ERRSTAT_BTSERR          &H80            ' 
#define USB_ERRSTAT_DMAERR          &H20            ' 
#define USB_ERRSTAT_BTOERR          &H10            ' 
#define USB_ERRSTAT_DFN8            &H08            ' 
#define USB_ERRSTAT_CRC16           &H04            ' 
#define USB_ERRSTAT_CRC5EOF         &H02            ' 
#define USB_ERRSTAT_PIDERR          &H01            ' 
#define USB0_ERREN                  *&H4007208C ' Error Interrupt Enable Register
#define USB_ERREN_BTSERREN          &H80            ' 
#define USB_ERREN_DMAERREN          &H20            ' 
#define USB_ERREN_BTOERREN          &H10            ' 
#define USB_ERREN_DFN8EN            &H08            ' 
#define USB_ERREN_CRC16EN           &H04            ' 
#define USB_ERREN_CRC5EOFEN         &H02            ' 
#define USB_ERREN_PIDERREN          &H01            ' 
#define USB0_STAT                   *&H40072090 ' Status Register
#define USB_STAT_TX                 &H08            ' 
#define USB_STAT_ODD                &H04            ' 
#define USB_STAT_ENDP(n)            ((n) >> 4)        ' 
#define USB0_CTL                    *&H40072094 ' Control Register
#define USB_CTL_JSTATE              &H80            ' 
#define USB_CTL_SE0                 &H40            ' 
#define USB_CTL_TXSUSPENDTOKENBUSY  &H20            ' 
#define USB_CTL_RESET               &H10            ' 
#define USB_CTL_HOSTMODEEN          &H08            ' 
#define USB_CTL_RESUME              &H04            ' 
#define USB_CTL_ODDRST              &H02            ' 
#define USB_CTL_USBENSOFEN          &H01            ' 
#define USB0_ADDR                   *&H40072098 ' Address Register
#define USB0_BDTPAGE1               *&H4007209C ' BDT Page Register 1
#define USB0_FRMNUML                *&H400720A0 ' Frame Number Register Low
#define USB0_FRMNUMH                *&H400720A4 ' Frame Number Register High
#define USB0_TOKEN                  *&H400720A8 ' Token Register
#define USB0_SOFTHLD                *&H400720AC ' SOF Threshold Register
#define USB0_BDTPAGE2               *&H400720B0 ' BDT Page Register 2
#define USB0_BDTPAGE3               *&H400720B4 ' BDT Page Register 3
#define USB0_ENDPT0                 *&H400720C0 ' Endpoint Control Register
#define USB_ENDPT_HOSTWOHUB         &H80            ' host only, enable low speed
#define USB_ENDPT_RETRYDIS          &H40            ' host only, set to disable NAK retry
#define USB_ENDPT_EPCTLDIS          &H10            ' 0=control, 1=bulk, interrupt, isync
#define USB_ENDPT_EPRXEN            &H08            ' enables the endpoint for RX transfers.
#define USB_ENDPT_EPTXEN            &H04            ' enables the endpoint for TX transfers.
#define USB_ENDPT_EPSTALL           &H02            ' set to stall endpoint
#define USB_ENDPT_EPHSHK            &H01            ' enable handshaking during a transaction, generally set unless Isochronous
#define USB0_ENDPT1                 *&H400720C4 ' Endpoint Control Register
#define USB0_ENDPT2                 *&H400720C8 ' Endpoint Control Register
#define USB0_ENDPT3                 *&H400720CC ' Endpoint Control Register
#define USB0_ENDPT4                 *&H400720D0 ' Endpoint Control Register
#define USB0_ENDPT5                 *&H400720D4 ' Endpoint Control Register
#define USB0_ENDPT6                 *&H400720D8 ' Endpoint Control Register
#define USB0_ENDPT7                 *&H400720DC ' Endpoint Control Register
#define USB0_ENDPT8                 *&H400720E0 ' Endpoint Control Register
#define USB0_ENDPT9                 *&H400720E4 ' Endpoint Control Register
#define USB0_ENDPT10                *&H400720E8 ' Endpoint Control Register
#define USB0_ENDPT11                *&H400720EC ' Endpoint Control Register
#define USB0_ENDPT12                *&H400720F0 ' Endpoint Control Register
#define USB0_ENDPT13                *&H400720F4 ' Endpoint Control Register
#define USB0_ENDPT14                *&H400720F8 ' Endpoint Control Register
#define USB0_ENDPT15                *&H400720FC ' Endpoint Control Register
#define USB0_USBCTRL                *&H40072100 ' USB Control Register
#define USB_USBCTRL_SUSP            &H80            ' Places the USB transceiver into the suspend state.
#define USB_USBCTRL_PDE             &H40            ' Enables the weak pulldowns on the USB transceiver.
#define USB0_OBSERVE                *&H40072104 ' USB OTG Observe Register
#define USB_OBSERVE_DPPU            &H80            ' 
#define USB_OBSERVE_DPPD            &H40            ' 
#define USB_OBSERVE_DMPD            &H10            ' 
#define USB0_CONTROL                *&H40072108 ' USB OTG Control Register
#define USB_CONTROL_DPPULLUPNONOTG  &H10            '  Provides control of the DP PULLUP in the USB OTG module, if USB is configured in non-OTG device mode.
#define USB0_USBTRC0                *&H4007210C ' USB Transceiver Control Register 0
#define USB_USBTRC_USBRESET         &H80            '
#define USB_USBTRC_USBRESMEN        &H20            '
#define USB_USBTRC_SYNC_DET         &H02            '
#define USB_USBTRC_USB_RESUME_INT   &H01            '
#define USB0_USBFRMADJUST           *&H40072114 ' Frame Adjust Register

' Chapter 41: USB Device Charger Detection Module (USBDCD) - 32 registers
#define USBDCD_CONTROL          *&H40035000 ' Control register
#define USBDCD_CLOCK            *&H40035004 ' Clock register
#define USBDCD_STATUS           *&H40035008 ' Status register
#define USBDCD_TIMER0           *&H40035010 ' TIMER0 register
#define USBDCD_TIMER1           *&H40035014 ' TIMER1 register
#define USBDCD_TIMER2           *&H40035018 ' TIMER2 register

' Chapter 43: SPI (DSPI) - 32 registers
#define SPI0_MCR             *&H4002C000 ' DSPI Module Configuration Register
#define SPI_MCR_MSTR         &H80000000        ' Master/Slave Mode Select
#define SPI_MCR_CONT_SCKE    &H40000000        ' 
#define SPI_MCR_DCONF(n)     (((n) and 3) shl 28)        ' 
#define SPI_MCR_FRZ          &H08000000        ' 
#define SPI_MCR_MTFE         &H04000000        ' 
#define SPI_MCR_ROOE         &H01000000        ' 
#define SPI_MCR_PCSIS(n)     (((n) and &H1F) shl 16)        '
#define SPI_MCR_DOZE         &H00008000        ' 
#define SPI_MCR_MDIS         &H00004000        ' 
#define SPI_MCR_DIS_TXF      &H00002000        ' 
#define SPI_MCR_DIS_RXF      &H00001000        ' 
#define SPI_MCR_CLR_TXF      &H00000800        ' 
#define SPI_MCR_CLR_RXF      &H00000400        ' 
#define SPI_MCR_SMPL_PT(n)   (((n) and 3) shl 8)        '
#define SPI_MCR_HALT         &H00000001        ' 
#define SPI0_TCR             *&H4002C008 ' DSPI Transfer Count Register
#define SPI0_CTAR0           *&H4002C00C ' DSPI Clock and Transfer Attributes Register, In Master Mode
#define SPI_CTAR_DBR         &H80000000        ' Double Baud Rate
#define SPI_CTAR_FMSZ(n)     (((n) and 15) shl 27)        ' Frame Size (+1)
#define SPI_CTAR_CPOL        &H04000000        ' Clock Polarity
#define SPI_CTAR_CPHA        &H02000000        ' Clock Phase
#define SPI_CTAR_LSBFE       &H01000000        ' LSB First
#define SPI_CTAR_PCSSCK(n)   (((n) and 3) shl 22)        ' PCS to SCK Delay Prescaler
#define SPI_CTAR_PASC(n)     (((n) and 3) shl 20)        ' After SCK Delay Prescaler
#define SPI_CTAR_PDT(n)      (((n) and 3) shl 18)        ' Delay after Transfer Prescaler
#define SPI_CTAR_PBR(n)      (((n) and 3) shl 16)        ' Baud Rate Prescaler
#define SPI_CTAR_CSSCK(n)    (((n) and 15) shl 12)        ' PCS to SCK Delay Scaler
#define SPI_CTAR_ASC(n)      (((n) and 15) shl 8)        ' After SCK Delay Scaler
#define SPI_CTAR_DT(n)       (((n) and 15) shl 4)        ' Delay After Transfer Scaler
#define SPI_CTAR_BR(n)       (((n) and 15) shl 0)        ' Baud Rate Scaler
#define SPI0_CTAR0_SLAVE     *&H4002C00C ' DSPI Clock and Transfer Attributes Register, In Slave Mode
#define SPI0_CTAR1           *&H4002C010 ' DSPI Clock and Transfer Attributes Register, In Master Mode
#define SPI0_SR              *&H4002C02C ' DSPI Status Register
#define SPI_SR_TCF           &H80000000        ' Transfer Complete Flag
#define SPI_SR_TXRXS         &H40000000        ' TX and RX Status
#define SPI_SR_EOQF          &H10000000        ' End of Queue Flag
#define SPI_SR_TFUF          &H08000000        ' Transmit FIFO Underflow Flag
#define SPI_SR_TFFF          &H02000000        ' Transmit FIFO Fill Flag
#define SPI_SR_RFOF          &H00080000        ' Receive FIFO Overflow Flag
#define SPI_SR_RFDF          &H00020000        ' Receive FIFO Drain Flag
#define SPI0_RSER            *&H4002C030 ' DSPI DMA/Interrupt Request Select and Enable Register
#define SPI_RSER_TCF_RE		 &H80000000		' Transmission Complete Request Enable
#define SPI_RSER_EOQF_RE	 &H10000000		' DSPI Finished Request Request Enable
#define SPI_RSER_TFUF_RE	 &H08000000		' Transmit FIFO Underflow Request Enable
#define SPI_RSER_TFFF_RE	 &H02000000		' Transmit FIFO Fill Request Enable
#define SPI_RSER_TFFF_DIRS	 &H01000000		' Transmit FIFO FIll Dma or Interrupt Request Select
#define SPI_RSER_RFOF_RE	 &H00080000		' Receive FIFO Overflow Request Enable
#define SPI_RSER_RFDF_RE	 &H00020000		' Receive FIFO Drain Request Enable
#define SPI_RSER_RFDF_DIRS	 &H00010000		' Receive FIFO Drain DMA or Interrupt Request Select
#define SPI0_PUSHR           *&H4002C034 ' DSPI PUSH TX FIFO Register In Master Mode
#define SPI_PUSHR_CONT       &H80000000        ' 
#define SPI_PUSHR_CTAS(n)    (((n) and 7) shl 28)        ' 
#define SPI_PUSHR_EOQ        &H08000000        ' 
#define SPI_PUSHR_CTCNT      &H04000000        ' 
#define SPI_PUSHR_PCS(n)     (((n) and 31) shl 16)        '
#define SPI0_PUSHR_SLAVE     *&H4002C034 ' DSPI PUSH TX FIFO Register In Slave Mode
#define SPI0_POPR            *&H4002C038 ' DSPI POP RX FIFO Register
#define SPI0_TXFR0           *&H4002C03C ' DSPI Transmit FIFO Registers
#define SPI0_TXFR1           *&H4002C040 ' DSPI Transmit FIFO Registers
#define SPI0_TXFR2           *&H4002C044 ' DSPI Transmit FIFO Registers
#define SPI0_TXFR3           *&H4002C048 ' DSPI Transmit FIFO Registers
#define SPI0_RXFR0           *&H4002C07C ' DSPI Receive FIFO Registers
#define SPI0_RXFR1           *&H4002C080 ' DSPI Receive FIFO Registers
#define SPI0_RXFR2           *&H4002C084 ' DSPI Receive FIFO Registers
#define SPI0_RXFR3           *&H4002C088 ' DSPI Receive FIFO Registers

' Chapter 44: Inter-Integrated Circuit (I2C) - 8 bit registers
#define I2C0_A1              *&H40066000 ' I2C Address Register 1
#define I2C0_F               *&H40066001 ' I2C Frequency Divider register
#define I2C0_C1              *&H40066002 ' I2C Control Register 1
#define I2C_C1_IICEN         &H80            ' I2C Enable
#define I2C_C1_IICIE         &H40            ' I2C Interrupt Enable
#define I2C_C1_MST           &H20           ' Master Mode Select
#define I2C_C1_TX            &H10          ' Transmit Mode Select
#define I2C_C1_TXAK          &H08            ' Transmit Acknowledge Enable
#define I2C_C1_RSTA          &H04            ' Repeat START
#define I2C_C1_WUEN          &H02            ' Wakeup Enable
#define I2C_C1_DMAEN         &H01            ' DMA Enable
#define I2C0_S               *&H40066003 ' I2C Status register
#define I2C_S_TCF            &H80          ' Transfer Complete Flag
#define I2C_S_IAAS           &H40           ' Addressed As A Slave
#define I2C_S_BUSY           &H20           ' Bus Busy
#define I2C_S_ARBL           &H10           ' Arbitration Lost
#define I2C_S_RAM            &H08          ' Range Address Match
#define I2C_S_SRW            &H04          ' Slave Read/Write
#define I2C_S_IICIF          &H02            ' Interrupt Flag
#define I2C_S_RXAK           &H01           ' Receive Acknowledge
#define I2C0_D               *&H40066004 ' I2C Data I/O register
#define I2C0_C2              *&H40066005 ' I2C Control Register 2
#define I2C_C2_GCAEN         &H80            ' General Call Address Enable
#define I2C_C2_ADEXT         &H40            ' Address Extension
#define I2C_C2_HDRS          &H20            ' High Drive Select
#define I2C_C2_SBRC          &H10            ' Slave Baud Rate Control
#define I2C_C2_RMEN          &H08            ' Range Address Matching Enable
#define I2C_C2_AD(n)         ((n) and 7)            ' Slave Address, upper 3 bits
#define I2C0_FLT             *&H40066006 ' I2C Programmable Input Glitch Filter register
#define I2C0_RA              *&H40066007 ' I2C Range Address register
#define I2C0_SMB             *&H40066008 ' I2C SMBus Control and Status register
#define I2C0_A2              *&H40066009 ' I2C Address Register 2
#define I2C0_SLTH            *&H4006600A ' I2C SCL Low Timeout Register High
#define I2C0_SLTL            *&H4006600B ' I2C SCL Low Timeout Register Low

' Chapter 45: Universal Asynchronous Receiver/Transmitter (UART) - 8 bit registers
#define UART0_BDH            *&H4006A000 ' UART Baud Rate Registers: High
#define UART0_BDL            *&H4006A001 ' UART Baud Rate Registers: Low
#define UART0_C1             *&H4006A002 ' UART Control Register 1
#define UART_C1_LOOPS        &H80            ' When LOOPS is set, the RxD pin is disconnected from the UART and the transmitter output is internally connected to the receiver input
#define UART_C1_UARTSWAI     &H40            ' UART Stops in Wait Mode
#define UART_C1_RSRC         &H20            ' When LOOPS is set, the RSRC field determines the source for the receiver shift register input
#define UART_C1_M            &H10            ' 9-bit or 8-bit Mode Select
#define UART_C1_WAKE         &H08            ' Determines which condition wakes the UART
#define UART_C1_ILT          &H04            ' Idle Line Type Select
#define UART_C1_PE           &H02            ' Parity Enable
#define UART_C1_PT           &H01            ' Parity Type, 0=even, 1=odd
#define UART0_C2             *&H4006A003 ' UART Control Register 2
#define UART_C2_TIE          &H80            ' Transmitter Interrupt or DMA Transfer Enable.
#define UART_C2_TCIE         &H40            ' Transmission Complete Interrupt Enable
#define UART_C2_RIE          &H20            ' Receiver Full Interrupt or DMA Transfer Enable
#define UART_C2_ILIE         &H10            ' Idle Line Interrupt Enable
#define UART_C2_TE           &H08            ' Transmitter Enable
#define UART_C2_RE           &H04            ' Receiver Enable
#define UART_C2_RWU          &H02            ' Receiver Wakeup Control
#define UART_C2_SBK          &H01            ' Send Break
#define UART0_S1             *&H4006A004 ' UART Status Register 1
#define UART_S1_TDRE         &H80            ' Transmit Data Register Empty Flag
#define UART_S1_TC           &H40            ' Transmit Complete Flag
#define UART_S1_RDRF         &H20            ' Receive Data Register Full Flag
#define UART_S1_IDLE         &H10            ' Idle Line Flag
#define UART_S1_OR           &H08            ' Receiver Overrun Flag
#define UART_S1_NF           &H04            ' Noise Flag
#define UART_S1_FE           &H02            ' Framing Error Flag
#define UART_S1_PF           &H01            ' Parity Error Flag
#define UART0_S2             *&H4006A005 ' UART Status Register 2
#define UART0_C3             *&H4006A006 ' UART Control Register 3
#define UART0_D              *&H4006A007 ' UART Data Register
#define UART0_MA1            *&H4006A008 ' UART Match Address Registers 1
#define UART0_MA2            *&H4006A009 ' UART Match Address Registers 2
#define UART0_C4             *&H4006A00A ' UART Control Register 4
#define UART0_C5             *&H4006A00B ' UART Control Register 5
#define UART0_ED             *&H4006A00C ' UART Extended Data Register
#define UART0_MODEM          *&H4006A00D ' UART Modem Register
#define UART0_IR             *&H4006A00E ' UART Infrared Register
#define UART0_PFIFO          *&H4006A010 ' UART FIFO Parameters
#define UART_PFIFO_TXFE      &H80
#define UART_PFIFO_RXFE      &H08
#define UART0_CFIFO          *&H4006A011 ' UART FIFO Control Register
#define UART_CFIFO_TXFLUSH   &H80            ' 
#define UART_CFIFO_RXFLUSH   &H40            ' 
#define UART_CFIFO_RXOFE     &H04            ' 
#define UART_CFIFO_TXOFE     &H02            ' 
#define UART_CFIFO_RXUFE     &H01            ' 
#define UART0_SFIFO          *&H4006A012 ' UART FIFO Status Register
#define UART_SFIFO_TXEMPT    &H80
#define UART_SFIFO_RXEMPT    &H40
#define UART_SFIFO_RXOF      &H04
#define UART_SFIFO_TXOF      &H02
#define UART_SFIFO_RXUF      &H01
#define UART0_TWFIFO         *&H4006A013 ' UART FIFO Transmit Watermark
#define UART0_TCFIFO         *&H4006A014 ' UART FIFO Transmit Count
#define UART0_RWFIFO         *&H4006A015 ' UART FIFO Receive Watermark
#define UART0_RCFIFO         *&H4006A016 ' UART FIFO Receive Count
#define UART0_C7816          *&H4006A018 ' UART 7816 Control Register
#define UART0_IE7816         *&H4006A019 ' UART 7816 Interrupt Enable Register
#define UART0_IS7816         *&H4006A01A ' UART 7816 Interrupt Status Register
#define UART0_WP7816T0       *&H4006A01B ' UART 7816 Wait Parameter Register
#define UART0_WP7816T1       *&H4006A01B ' UART 7816 Wait Parameter Register
#define UART0_WN7816         *&H4006A01C ' UART 7816 Wait N Register
#define UART0_WF7816         *&H4006A01D ' UART 7816 Wait FD Register
#define UART0_ET7816         *&H4006A01E ' UART 7816 Error Threshold Register
#define UART0_TL7816         *&H4006A01F ' UART 7816 Transmit Length Register
#define UART0_C6             *&H4006A021 ' UART CEA709.1-B Control Register 6
#define UART0_PCTH           *&H4006A022 ' UART CEA709.1-B Packet Cycle Time Counter High
#define UART0_PCTL           *&H4006A023 ' UART CEA709.1-B Packet Cycle Time Counter Low
#define UART0_B1T            *&H4006A024 ' UART CEA709.1-B Beta1 Timer
#define UART0_SDTH           *&H4006A025 ' UART CEA709.1-B Secondary Delay Timer High
#define UART0_SDTL           *&H4006A026 ' UART CEA709.1-B Secondary Delay Timer Low
#define UART0_PRE            *&H4006A027 ' UART CEA709.1-B Preamble
#define UART0_TPL            *&H4006A028 ' UART CEA709.1-B Transmit Packet Length
#define UART0_IE             *&H4006A029 ' UART CEA709.1-B Interrupt Enable Register
#define UART0_WB             *&H4006A02A ' UART CEA709.1-B WBASE
#define UART0_S3             *&H4006A02B ' UART CEA709.1-B Status Register
#define UART0_S4             *&H4006A02C ' UART CEA709.1-B Status Register
#define UART0_RPL            *&H4006A02D ' UART CEA709.1-B Received Packet Length
#define UART0_RPREL          *&H4006A02E ' UART CEA709.1-B Received Preamble Length
#define UART0_CPW            *&H4006A02F ' UART CEA709.1-B Collision Pulse Width
#define UART0_RIDT           *&H4006A030 ' UART CEA709.1-B Receive Indeterminate Time
#define UART0_TIDT           *&H4006A031 ' UART CEA709.1-B Transmit Indeterminate Time
#define UART1_BDH            *&H4006B000 ' UART Baud Rate Registers: High
#define UART1_BDL            *&H4006B001 ' UART Baud Rate Registers: Low
#define UART1_C1             *&H4006B002 ' UART Control Register 1
#define UART1_C2             *&H4006B003 ' UART Control Register 2
#define UART1_S1             *&H4006B004 ' UART Status Register 1
#define UART1_S2             *&H4006B005 ' UART Status Register 2
#define UART1_C3             *&H4006B006 ' UART Control Register 3
#define UART1_D              *&H4006B007 ' UART Data Register
#define UART1_MA1            *&H4006B008 ' UART Match Address Registers 1
#define UART1_MA2            *&H4006B009 ' UART Match Address Registers 2
#define UART1_C4             *&H4006B00A ' UART Control Register 4
#define UART1_C5             *&H4006B00B ' UART Control Register 5
#define UART1_ED             *&H4006B00C ' UART Extended Data Register
#define UART1_MODEM          *&H4006B00D ' UART Modem Register
#define UART1_IR             *&H4006B00E ' UART Infrared Register
#define UART1_PFIFO          *&H4006B010 ' UART FIFO Parameters
#define UART1_CFIFO          *&H4006B011 ' UART FIFO Control Register
#define UART1_SFIFO          *&H4006B012 ' UART FIFO Status Register
#define UART1_TWFIFO         *&H4006B013 ' UART FIFO Transmit Watermark
#define UART1_TCFIFO         *&H4006B014 ' UART FIFO Transmit Count
#define UART1_RWFIFO         *&H4006B015 ' UART FIFO Receive Watermark
#define UART1_RCFIFO         *&H4006B016 ' UART FIFO Receive Count
#define UART1_C7816          *&H4006B018 ' UART 7816 Control Register
#define UART1_IE7816         *&H4006B019 ' UART 7816 Interrupt Enable Register
#define UART1_IS7816         *&H4006B01A ' UART 7816 Interrupt Status Register
#define UART1_WP7816T0       *&H4006B01B ' UART 7816 Wait Parameter Register
#define UART1_WP7816T1       *&H4006B01B ' UART 7816 Wait Parameter Register
#define UART1_WN7816         *&H4006B01C ' UART 7816 Wait N Register
#define UART1_WF7816         *&H4006B01D ' UART 7816 Wait FD Register
#define UART1_ET7816         *&H4006B01E ' UART 7816 Error Threshold Register
#define UART1_TL7816         *&H4006B01F ' UART 7816 Transmit Length Register
#define UART1_C6             *&H4006B021 ' UART CEA709.1-B Control Register 6
#define UART1_PCTH           *&H4006B022 ' UART CEA709.1-B Packet Cycle Time Counter High
#define UART1_PCTL           *&H4006B023 ' UART CEA709.1-B Packet Cycle Time Counter Low
#define UART1_B1T            *&H4006B024 ' UART CEA709.1-B Beta1 Timer
#define UART1_SDTH           *&H4006B025 ' UART CEA709.1-B Secondary Delay Timer High
#define UART1_SDTL           *&H4006B026 ' UART CEA709.1-B Secondary Delay Timer Low
#define UART1_PRE            *&H4006B027 ' UART CEA709.1-B Preamble
#define UART1_TPL            *&H4006B028 ' UART CEA709.1-B Transmit Packet Length
#define UART1_IE             *&H4006B029 ' UART CEA709.1-B Interrupt Enable Register
#define UART1_WB             *&H4006B02A ' UART CEA709.1-B WBASE
#define UART1_S3             *&H4006B02B ' UART CEA709.1-B Status Register
#define UART1_S4             *&H4006B02C ' UART CEA709.1-B Status Register
#define UART1_RPL            *&H4006B02D ' UART CEA709.1-B Received Packet Length
#define UART1_RPREL          *&H4006B02E ' UART CEA709.1-B Received Preamble Length
#define UART1_CPW            *&H4006B02F ' UART CEA709.1-B Collision Pulse Width
#define UART1_RIDT           *&H4006B030 ' UART CEA709.1-B Receive Indeterminate Time
#define UART1_TIDT           *&H4006B031 ' UART CEA709.1-B Transmit Indeterminate Time
#define UART2_BDH            *&H4006C000 ' UART Baud Rate Registers: High
#define UART2_BDL            *&H4006C001 ' UART Baud Rate Registers: Low
#define UART2_C1             *&H4006C002 ' UART Control Register 1
#define UART2_C2             *&H4006C003 ' UART Control Register 2
#define UART2_S1             *&H4006C004 ' UART Status Register 1
#define UART2_S2             *&H4006C005 ' UART Status Register 2
#define UART2_C3             *&H4006C006 ' UART Control Register 3
#define UART2_D              *&H4006C007 ' UART Data Register
#define UART2_MA1            *&H4006C008 ' UART Match Address Registers 1
#define UART2_MA2            *&H4006C009 ' UART Match Address Registers 2
#define UART2_C4             *&H4006C00A ' UART Control Register 4
#define UART2_C5             *&H4006C00B ' UART Control Register 5
#define UART2_ED             *&H4006C00C ' UART Extended Data Register
#define UART2_MODEM          *&H4006C00D ' UART Modem Register
#define UART2_IR             *&H4006C00E ' UART Infrared Register
#define UART2_PFIFO          *&H4006C010 ' UART FIFO Parameters
#define UART2_CFIFO          *&H4006C011 ' UART FIFO Control Register
#define UART2_SFIFO          *&H4006C012 ' UART FIFO Status Register
#define UART2_TWFIFO         *&H4006C013 ' UART FIFO Transmit Watermark
#define UART2_TCFIFO         *&H4006C014 ' UART FIFO Transmit Count
#define UART2_RWFIFO         *&H4006C015 ' UART FIFO Receive Watermark
#define UART2_RCFIFO         *&H4006C016 ' UART FIFO Receive Count
#define UART2_C7816          *&H4006C018 ' UART 7816 Control Register
#define UART2_IE7816         *&H4006C019 ' UART 7816 Interrupt Enable Register
#define UART2_IS7816         *&H4006C01A ' UART 7816 Interrupt Status Register
#define UART2_WP7816T0       *&H4006C01B ' UART 7816 Wait Parameter Register
#define UART2_WP7816T1       *&H4006C01B ' UART 7816 Wait Parameter Register
#define UART2_WN7816         *&H4006C01C ' UART 7816 Wait N Register
#define UART2_WF7816         *&H4006C01D ' UART 7816 Wait FD Register
#define UART2_ET7816         *&H4006C01E ' UART 7816 Error Threshold Register
#define UART2_TL7816         *&H4006C01F ' UART 7816 Transmit Length Register
#define UART2_C6             *&H4006C021 ' UART CEA709.1-B Control Register 6
#define UART2_PCTH           *&H4006C022 ' UART CEA709.1-B Packet Cycle Time Counter High
#define UART2_PCTL           *&H4006C023 ' UART CEA709.1-B Packet Cycle Time Counter Low
#define UART2_B1T            *&H4006C024 ' UART CEA709.1-B Beta1 Timer
#define UART2_SDTH           *&H4006C025 ' UART CEA709.1-B Secondary Delay Timer High
#define UART2_SDTL           *&H4006C026 ' UART CEA709.1-B Secondary Delay Timer Low
#define UART2_PRE            *&H4006C027 ' UART CEA709.1-B Preamble
#define UART2_TPL            *&H4006C028 ' UART CEA709.1-B Transmit Packet Length
#define UART2_IE             *&H4006C029 ' UART CEA709.1-B Interrupt Enable Register
#define UART2_WB             *&H4006C02A ' UART CEA709.1-B WBASE
#define UART2_S3             *&H4006C02B ' UART CEA709.1-B Status Register
#define UART2_S4             *&H4006C02C ' UART CEA709.1-B Status Register
#define UART2_RPL            *&H4006C02D ' UART CEA709.1-B Received Packet Length
#define UART2_RPREL          *&H4006C02E ' UART CEA709.1-B Received Preamble Length
#define UART2_CPW            *&H4006C02F ' UART CEA709.1-B Collision Pulse Width
#define UART2_RIDT           *&H4006C030 ' UART CEA709.1-B Receive Indeterminate Time
#define UART2_TIDT           *&H4006C031 ' UART CEA709.1-B Transmit Indeterminate Time

' Chapter 46: Synchronous Audio Interface (SAI) - 32 bit registers
#define I2S0_TCSR              *&H4002F000 ' SAI Transmit Control Register
#define I2S_TCSR_TE            *&H80000000    ' Transmitter Enable
#define I2S_TCSR_STOPE         *&H40000000    ' Transmitter Enable in Stop mode
#define I2S_TCSR_DBGE          *&H20000000    ' Transmitter Enable in Debug mode
#define I2S_TCSR_BCE           *&H10000000    ' Bit Clock Enable
#define I2S_TCSR_FR            *&H02000000    ' FIFO Reset
#define I2S_TCSR_SR            *&H01000000    ' Software Reset
#define I2S_TCSR_WSF           *&H00100000    ' Word Start Flag
#define I2S_TCSR_SEF           *&H00080000    ' Sync Error Flag
#define I2S_TCSR_FEF           *&H00040000    ' FIFO Error Flag (underrun)
#define I2S_TCSR_FWF           *&H00020000    ' FIFO Warning Flag (empty)
#define I2S_TCSR_FRF           *&H00010000    ' FIFO Request Flag (Data Ready)
#define I2S_TCSR_WSIE          *&H00001000    ' Word Start Interrupt Enable
#define I2S_TCSR_SEIE          *&H00000800    ' Sync Error Interrupt Enable
#define I2S_TCSR_FEIE          *&H00000400    ' FIFO Error Interrupt Enable
#define I2S_TCSR_FWIE          *&H00000200    ' FIFO Warning Interrupt Enable
#define I2S_TCSR_FRIE          *&H00000100    ' FIFO Request Interrupt Enable
#define I2S_TCSR_FWDE          *&H00000002    ' FIFO Warning DMA Enable
#define I2S_TCSR_FRDE          *&H00000001    ' FIFO Request DMA Enable
#define I2S0_TCR1              *&H4002F004 ' SAI Transmit Configuration 1 Register
#define I2S_TCR1_TFW(n)        (n and &H03)          ' Transmit FIFO watermark
#define I2S0_TCR2              *&H4002F008 ' SAI Transmit Configuration 2 Register
#define I2S_TCR2_DIV(n)        (n and &Hff)          ' Bit clock divide by (DIV+1)*2
#define I2S_TCR2_BCD           (1shl24)             ' Bit clock direction
#define I2S_TCR2_BCP           (1shl25)             ' Bit clock polarity
#define I2S_TCR2_MSEL(n)       ((n and 3) shl 26)       ' MCLK select, 0=bus clock, 1=I2S0_MCLK
#define I2S_TCR2_BCI           (1 shl 28)             ' Bit clock input
#define I2S_TCR2_BCS           (1 shl 29)             ' Bit clock swap
#define I2S_TCR2_SYNC(n)       ((n and 3) shl 30)       ' 0=async 1=sync with receiver
#define I2S0_TCR3              *&H4002F00C ' SAI Transmit Configuration 3 Register
#define I2S_TCR3_WDFL(n)       (n and &H0f)          ' word flag configuration
#define I2S_TCR3_TCE           (&H10000)           ' transmit channel enable
#define I2S0_TCR4              *&H4002F010 ' SAI Transmit Configuration 4 Register
#define I2S_TCR4_FSD           (1)                 ' Frame Sync Direction
#define I2S_TCR4_FSP           (2)                 ' Frame Sync Polarity
#define I2S_TCR4_FSE           (8)                 ' Frame Sync Early
#define I2S_TCR4_MF            (&H10)              ' MSB First
#define I2S_TCR4_SYWD(n)       ((n and &H1f) shl 8)     ' Sync Width
#define I2S_TCR4_FRSZ(n)       ((n and &H0f) shl 16)    ' Frame Size
#define I2S0_TCR5              *&H4002F014 ' SAI Transmit Configuration 5 Register
#define I2S_TCR5_FBT(n)        ((n and &H1f) shl 8)     ' First Bit Shifted
#define I2S_TCR5_W0W(n)        ((n and &H1f) shl 16)    ' Word 0 Width
#define I2S_TCR5_WNW(n)        ((n and &H1f) shl 24)    ' Word N Width
#define I2S0_TDR0              *&H4002F020 ' SAI Transmit Data Register
#define I2S0_TFR0              *&H4002F040 ' SAI Transmit FIFO Register
#define I2S_TFR_RFP(n)         (n and 7)             ' read FIFO pointer
#define I2S_TFR_WFP(n)         ((n and 7) shl 16)       ' write FIFO pointer
#define I2S0_TMR               *&H4002F060 ' SAI Transmit Mask Register
#define I2S_TMR_TWM(n)         (n and &HFFFFFFFF)
#define I2S0_RCSR              *&H4002F080 ' SAI Receive Control Register
#define I2S_RCSR_RE            *&H80000000    ' Receiver Enable
#define I2S_RCSR_STOPE         *&H40000000    ' Receiver Enable in Stop mode
#define I2S_RCSR_DBGE          *&H20000000    ' Receiver Enable in Debug mode
#define I2S_RCSR_BCE           *&H10000000    ' Bit Clock Enable
#define I2S_RCSR_FR            *&H02000000    ' FIFO Reset
#define I2S_RCSR_SR            *&H01000000    ' Software Reset
#define I2S_RCSR_WSF           *&H00100000    ' Word Start Flag
#define I2S_RCSR_SEF           *&H00080000    ' Sync Error Flag
#define I2S_RCSR_FEF           *&H00040000    ' FIFO Error Flag (underrun)
#define I2S_RCSR_FWF           *&H00020000    ' FIFO Warning Flag (empty)
#define I2S_RCSR_FRF           *&H00010000    ' FIFO Request Flag (Data Ready)
#define I2S_RCSR_WSIE          *&H00001000    ' Word Start Interrupt Enable
#define I2S_RCSR_SEIE          *&H00000800    ' Sync Error Interrupt Enable
#define I2S_RCSR_FEIE          *&H00000400    ' FIFO Error Interrupt Enable
#define I2S_RCSR_FWIE          *&H00000200    ' FIFO Warning Interrupt Enable
#define I2S_RCSR_FRIE          *&H00000100    ' FIFO Request Interrupt Enable
#define I2S_RCSR_FWDE          *&H00000002    ' FIFO Warning DMA Enable
#define I2S_RCSR_FRDE          *&H00000001    ' FIFO Request DMA Enable
#define I2S0_RCR1              *&H4002F084 ' SAI Receive Configuration 1 Register
#define I2S_RCR1_RFW(n)        (n and &H03)          ' Receive FIFO watermark
#define I2S0_RCR2              *&H4002F088 ' SAI Receive Configuration 2 Register
#define I2S_RCR2_DIV(n)        (n and &Hff)          ' Bit clock divide by (DIV+1)*2
#define I2S_RCR2_BCD           (1 shl 24)             ' Bit clock direction
#define I2S_RCR2_BCP           (1 shl 25)             ' Bit clock polarity
#define I2S_RCR2_MSEL(n)       ((n and 3) shl 26)       ' MCLK select, 0=bus clock, 1=I2S0_MCLK
#define I2S_RCR2_BCI           (1 shl 28)             ' Bit clock input
#define I2S_RCR2_BCS           (1 shl 29)             ' Bit clock swap
#define I2S_RCR2_SYNC(n)       ((n and 3) shl 30)       ' 0=async 1=sync with receiver
#define I2S0_RCR3              *&H4002F08C ' SAI Receive Configuration 3 Register
#define I2S_RCR3_WDFL(n)       (n and &H0f)          ' word flag configuration
#define I2S_RCR3_RCE           (&H10000)           ' receive channel enable
#define I2S0_RCR4              *&H4002F090 ' SAI Receive Configuration 4 Register
#define I2S_RCR4_FSD           (1)                 ' Frame Sync Direction
#define I2S_RCR4_FSP           (2)                 ' Frame Sync Polarity
#define I2S_RCR4_FSE           (8)                 ' Frame Sync Early
#define I2S_RCR4_MF            (&H10)              ' MSB First
#define I2S_RCR4_SYWD(n)       ((n and &H1f) shl 8)     ' Sync Width
#define I2S_RCR4_FRSZ(n)       ((n and &H0f) shl 16)    ' Frame Size
#define I2S0_RCR5              *&H4002F094 ' SAI Receive Configuration 5 Register
#define I2S_RCR5_FBT(n)        ((n and &H1f) shl 8)     ' First Bit Shifted
#define I2S_RCR5_W0W(n)        ((n and &H1f) shl 16)    ' Word 0 Width
#define I2S_RCR5_WNW(n)        ((n and &H1f) shl 24)    ' Word N Width
#define I2S0_RDR0              *&H4002F0A0 ' SAI Receive Data Register
#define I2S0_RFR0              *&H4002F0C0 ' SAI Receive FIFO Register
#define I2S_RFR_RFP(n)         (n and 7)             ' read FIFO pointer
#define I2S_RFR_WFP(n)         ((n and 7) shl 16)       ' write FIFO pointer
#define I2S0_RMR               *&H4002F0E0 ' SAI Receive Mask Register
#define I2S_RMR_RWM(n)         (n and &HFFFFFFFF)
#define I2S0_MCR               *&H4002F100 ' SAI MCLK Control Register
#define I2S_MCR_DUF            (1 shl 31)             ' Divider Update Flag
#define I2S_MCR_MOE            (1 shl 30)             ' MCLK Output Enable
#define I2S_MCR_MICS(n)        ((n and 3) shl 24)       ' MCLK Input Clock Select
#define I2S0_MDR               *&H4002F104 ' SAI MCLK Divide Register
#define I2S_MDR_FRACT(n)       ((n and &Hff) shl 12)    ' MCLK Fraction
#define I2S_MDR_DIVIDE(n)      ((n and &Hfff))       ' MCLK Divide

' Chapter 47: General-Purpose Input/Output (GPIO) - 32 bit registers
#define GPIOA_PDOR             *&H400FF000 ' Port Data Output Register
#define GPIOA_PSOR             *&H400FF004 ' Port Set Output Register
#define GPIOA_PCOR             *&H400FF008 ' Port Clear Output Register
#define GPIOA_PTOR             *&H400FF00C ' Port Toggle Output Register
#define GPIOA_PDIR             *&H400FF010 ' Port Data Input Register
#define GPIOA_PDDR             *&H400FF014 ' Port Data Direction Register
#define GPIOB_PDOR             *&H400FF040 ' Port Data Output Register
#define GPIOB_PSOR             *&H400FF044 ' Port Set Output Register
#define GPIOB_PCOR             *&H400FF048 ' Port Clear Output Register
#define GPIOB_PTOR             *&H400FF04C ' Port Toggle Output Register
#define GPIOB_PDIR             *&H400FF050 ' Port Data Input Register
#define GPIOB_PDDR             *&H400FF054 ' Port Data Direction Register
#define GPIOC_PDOR             *&H400FF080 ' Port Data Output Register
#define GPIOC_PSOR             *&H400FF084 ' Port Set Output Register
#define GPIOC_PCOR             *&H400FF088 ' Port Clear Output Register
#define GPIOC_PTOR             *&H400FF08C ' Port Toggle Output Register
#define GPIOC_PDIR             *&H400FF090 ' Port Data Input Register
#define GPIOC_PDDR             *&H400FF094 ' Port Data Direction Register
#define GPIOD_PDOR             *&H400FF0C0 ' Port Data Output Register
#define GPIOD_PSOR             *&H400FF0C4 ' Port Set Output Register
#define GPIOD_PCOR             *&H400FF0C8 ' Port Clear Output Register
#define GPIOD_PTOR             *&H400FF0CC ' Port Toggle Output Register
#define GPIOD_PDIR             *&H400FF0D0 ' Port Data Input Register
#define GPIOD_PDDR             *&H400FF0D4 ' Port Data Direction Register
#define GPIOE_PDOR             *&H400FF100 ' Port Data Output Register
#define GPIOE_PSOR             *&H400FF104 ' Port Set Output Register
#define GPIOE_PCOR             *&H400FF108 ' Port Clear Output Register
#define GPIOE_PTOR             *&H400FF10C ' Port Toggle Output Register
#define GPIOE_PDIR             *&H400FF110 ' Port Data Input Register
#define GPIOE_PDDR             *&H400FF114 ' Port Data Direction Register

' Chapter 48: Touch sense input (TSI) - 32 bit registers
#define TSI0_GENCS             *&H40045000 ' General Control and Status Register
#define TSI_GENCS_LPCLKS       *&H10000000        ' 
#define TSI_GENCS_LPSCNITV(n)  (((n) and 15)  shl  24)        ' 
#define TSI_GENCS_NSCN(n)      (((n) and 31)  shl  19)        ' 
#define TSI_GENCS_PS(n)        (((n) and 7)  shl  16)        ' 
#define TSI_GENCS_EOSF         *&H00008000        ' 
#define TSI_GENCS_OUTRGF       *&H00004000        ' 
#define TSI_GENCS_EXTERF       *&H00002000        ' 
#define TSI_GENCS_OVRF         *&H00001000        ' 
#define TSI_GENCS_SCNIP        *&H00000200        ' 
#define TSI_GENCS_SWTS         *&H00000100        ' 
#define TSI_GENCS_TSIEN        *&H00000080        ' 
#define TSI_GENCS_TSIIE        *&H00000040        ' 
#define TSI_GENCS_ERIE         *&H00000020        ' 
#define TSI_GENCS_ESOR         *&H00000010        ' 
#define TSI_GENCS_STM          *&H00000002        ' 
#define TSI_GENCS_STPE         *&H00000001        ' 
#define TSI0_SCANC             *&H40045004 ' SCAN Control Register
#define TSI_SCANC_REFCHRG(n)   (((n) and 15)  shl  24)        ' 
#define TSI_SCANC_EXTCHRG(n)   (((n) and 7)  shl  16)        ' 
#define TSI_SCANC_SMOD(n)      (((n) and 255)  shl  8)        ' 
#define TSI_SCANC_AMCLKS(n)    (((n) and 3)  shl  3)        ' 
#define TSI_SCANC_AMPSC(n)     (((n) and 7)  shl  0)        ' 
#define TSI0_PEN               *&H40045008 ' Pin Enable Register
#define TSI0_WUCNTR            *&H4004500C ' Wake-Up Channel Counter Register
#define TSI0_CNTR1             *&H40045100 ' Counter Register
#define TSI0_CNTR3             *&H40045104 ' Counter Register
#define TSI0_CNTR5             *&H40045108 ' Counter Register
#define TSI0_CNTR7             *&H4004510C ' Counter Register
#define TSI0_CNTR9             *&H40045110 ' Counter Register
#define TSI0_CNTR11            *&H40045114 ' Counter Register
#define TSI0_CNTR13            *&H40045118 ' Counter Register
#define TSI0_CNTR15            *&H4004511C ' Counter Register
#define TSI0_THRESHOLD         *&H40045120 ' Low Power Channel Threshold Register

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

#endif
