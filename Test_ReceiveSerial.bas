
#define ABE_Generic
' #define ABE_Debug
#define ABE_Bitwise
' #define ABE_FloatHelpers
#define ABE_Conversion
' #define ABE_UserInput
' #define ABE_Suspend
' #define ABE_ASCStuffs
' #define ABE_DDR
' #define ABE_RNG
#define ABE_TargetRegHelpers
#include "__lib\AB_Extensions.lib"


/* Chapter 13: LPC82x USART0/1/2

13.1 How to read this chapter
Three USARTs are available on all parts depending on the switch matrix configuration.

13.2 Features
• 7, 8, or 9 data bits and 1 or 2 stop bits
• Synchronous mode with master or slave operation. Includes data phase selection and continuous clock option.
• Multiprocessor/multidrop (9-bit) mode with software address compare.
• RS-485 transceiver output enable.
• Parity generation and checking: odd, even, or none.
• Software selectable oversampling from 5 to 16 clocks in asynchronous mode.
• One transmit and one receive data buffer.
• RTS/CTS for hardware signaling for automatic flow control. Software flow control can be performed using Delta CTS detect, Transmit Disable control, and any GPIO as an RTS output.
• Received data and status can optionally be read from a single register
• Break generation and detection.
• Receive data is 2 of 3 sample "voting". Status flag set when one sample differs.
• Built-in Baud Rate Generator with autobaud function.
• A fractional rate divider is shared among all USARTs.
• Interrupts available for Receiver Ready, Transmitter Ready, Receiver Idle, change in receiver break detect, Framing error, Parity error, Overrun, Underrun, Delta CTS detect, and receiver sample noise detected.
• Loopback mode for testing of data and flow control.
• USARTn transmit

13.3 Basic configuration
Configure the USARTs for receiving and transmitting data:
• In the SYSAHBCLKCTRL register, set bit 3 to 5 (Table 35) to enable the clock to the register interface.
• Clear the USART peripheral resets using the PRESETCTRL register (Table 23).
• Enable or disable the USART interrupts in slots #3 to #5 in the NVIC. See Table 5.
• Configure the USART pin functions through the switch matrix.
• Configure the USART clock and baud rate. See Section 13.3.1.
• Send and receive lines are connected to DMA request lines. See Table 148.

For wake-up from deep-sleep and power-down modes the USART must be configured in synchronous mode. See Section 13.3.2 for details.

13.3.1 Configure the USART clock and baud rate

All three USARTs use a common peripheral clock (U_PCLK) and, if needed, a fractional baud rate generator. The peripheral clock and the fractional divider for the baud rate calculation are set up in the SYSCON block as follows (see Figure 20):

1. Configure the UART clock by writing a value FRGCLKDIV > 0 in the common USART fractional baud rate divider register. This is the divided main clock common to all USARTs.

Table 36 “USART clock divider register (UARTCLKDIV, address 0x4004 8094) bit description”

2. If a fractional value is needed to obtain a particular baud rate, program the fractional divider. The fractional divider value is the fraction of MULT/DIV. The MULT and DIV values are programmed in the FRGCTRL register. The DIV value must be programmed with the fixed value of 256.

U_PCLK = FRGCLKDIV/(1+(MULT/DIV))

The following rules apply for MULT and DIV:
– Always set DIV to 256 by programming the FRGCTRL register with the value of 0xFF.
– Set the MULT to any value between 0 and 255.
Table 40 “USART fractional generator divider value register (UARTFRGDIV, address
0x4004 80F0) bit description”

3. In asynchronous mode: Configure the baud rate divider BRGVAL in the USARTn BRG register. The baud rate divider divides the common USART peripheral clock by a factor of 16 multiplied by the baud rate value to provide the baud rate = U_PCLK/16 x BRGVAL.

Section 13.6.9 “USART Baud Rate Generator register”

4. In synchronous mode: The serial clock is Un_SCLK = U_PCLK/BRGVAL.

 */


Main: 

' for i = 0x4000C000 to 0x4000C02C step 4
' print
' print i2h(i), i2h(*(i))
' print i2b4(*(i))
' print
' next i

' i = 0x4000C1C0
' print
' print i2h(i), i2h(*(i))
' print i2b4(*(i))
' print

' #################################################################
' I/O configuration (base address 0x4004 4000)
' PIO0_21 R/W 0x06C I/O configuration for pin PIO0_21/ADC_5 0x0000 0090 @ reset Table 108
' PIO0_20 R/W 0x070 I/O configuration for pin PIO0_20/ADC_6 0x0000 0090 @ reset Table 109
	
' PIO0_21, address 0x4004 406C) bit description
	
	' RegBitTestNFix("PIO0_21 register", 0x4004 406C, "RXRDYEN", 0, cleared, nodump)
	
'	print iw2bx(*0x4004406C,4)	'PIO0_21 R/W 0x06C I/O configuration for pin PIO0_21/ADC_5
'	print iw2bx(*0x40044070,4)	'PIO0_20 R/W 0x070 I/O configuration for pin PIO0_20/ADC_6
'
'	upon reset, both IOs are configured the same:
'
'	|3322|2222|2222|1111|1111|1100|0000|0000|
'	|1098|7654|3210|9876|5432|1098|7654|3210|
'	|---------------------------------------|
'	|rrrr|rrrr|rrrr|rrrr|CCCS|SOrr|rIHM|Mrrr|
'	|eeee|eeee|eeee|eeee|KKKM|MPee|eNYO|Oeee|
'	|ssss|ssss|ssss|ssss|DDDO|ONss|sVSD|Dsss|
'	|rrrr|rrrr|rrrr|rrrr|VVVD|DDrr|rRTE|Errr|
'	|vvvv|vvvv|vvvv|vvvv|bbbb|bRvv|vTRb|bvvv|
'	|dddd|dddd|dddd|dddd|2101|0Ndd|dRS1|0ddd|
'	|---------------------------------------|
'	|0000|0000|0000|0000|0000|0000|1001|0000|
'	                            ^^ ^
'	b2:b0	0x0		reserved
'	b4:b3	0x2		Pull Up Resistor Enabled
'	b5		0X0		Hysteresis disabled
'	b6		0X0		Input Inversion disabled
'	b9:b7 	reserved but assumes state 0b001 per UM - 'tis OK...
'	b10		0x0		Open Drain disabled
'	b12:b11	0x0		Digital Filtering disabled
'	b15:b13 0x0		IOCONCLKDIV0 selected for input filter
'	b31:b16 0x0000	reserved

/*	#################################################################
	print iw2bx(*0x40044070,4)	' PINENABLE0


	|M-------------------------------------L|
	|3322|2222|2222|1111|1111|1100|0000|0000|
	|1098|7654|3210|9876|5432|1098|7654|3210|
	|---------------------------------------|
	|rrrr|rrrA|AAAA|AAAA|AAAI|IVCR|XXSS|AAAA|
	|eeee|eeeD|DDDD|DDDD|DDD2|2DLE|TTWW|CCCC|
	|ssss|sssC|CCCC|CCCC|CCC0|0DKS|AADD|MMMM|
	|rrrr|rrrB|A987|6543|210S|SC-E|LLDC|PPPP|
	|vvvv|vvv0|1111|2222|100C|DMIT|OIIL|1111|
	|dddd|ddd4|3789|0123|467L|APNn|UNOK|4321|
	|---------------------------------------|
	|0000|0001|1111|1111|1111|1110|1100|1111|
	|---------------------------------------|
	
	SWDCK & SWDIO enabled on PIO0.2/0.3, and Reset on PIO0.5
	ADC02/03/09/10 now disabled, along with all others, per reset conditions.
	
	################################################################# */	

	'make sure reset is enabled (cleared)
	RegBitTestNFix("PINENABLE0", 0x4000C1C0, "RESETn(PIO0.05)", 8, cleared, nodump)
	
	' fix the SWD pin setting (need to be cleared/enabled), as AB firmware disables them (likely to provide gpio...)
	' this was a bit of a revelation as I had been struggling with getting debugging up and running concurrently with the runtime on the 824...
	RegBitTestNFix("PINENABLE0", 0x4000C1C0, "SWCLK(PIO0.03)", 4, cleared, nodump)
	RegBitTestNFix("PINENABLE0", 0x4000C1C0, "SWDIO(PIO0.02)", 5, cleared, nodump)

	' per UM 13.3: "• In the SYSAHBCLKCTRL register, set bit 3 to 5 (Table 35) to enable the clock to the register interface."
	' wondering if the manual is AFU on this...
	RegBitTestNFix("SYSAHBCLKCTRL", 0x40048080, "FLASHREG(b3)", 3, set, nodump)
	RegBitTestNFix("SYSAHBCLKCTRL", 0x40048080, "FLASH(b4)", 4, set, nodump)
	RegBitTestNFix("SYSAHBCLKCTRL", 0x40048080, "I2C0(b5)", 5, set, nodump)
	
	' per UM 13.3: "• Clear the USART peripheral resets using the PRESETCTRL register (Table 23)."
	RegBitTestNFix("PRESETCTRL", 0x40048004, "UART1_RST_N", 4, set, nodump)
	
	' per UM 13.3: "• Enable or disable the USART interrupts in slots #3 to #5 in the NVIC. See Table 5."
	' no ISR here, so disable for now.  may revisit once I get my head wrapped around servicing interrupts in a low risk manner
	' UART1_IRQ is interrupt #4
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "RXRDYEN", 0, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "TXRDYEN", 2, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "TXIDLEEN", 3, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "DELTACTSEN", 5, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "TXDISEN", 6, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "OVERRUNEN", 8, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "DELTARXBRKEN", 11, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "STARTEN", 12, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "FRAMERREN", 13, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "PARITYERREN", 14, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "RXNOISEEN", 15, cleared, nodump)
	RegBitTestNFix("INTENSET UART1", 0x4006800C, "ABERREN", 16, cleared, nodump)

	' per UM 13.3: "• Configure the USART pin functions through the switch matrix."
	' force the analog functions of PIO0.20:21 to disabled so can be used for async UART1 Tx/Rx
	RegBitTestNFix("PINENABLE0", 0x4000C1C0, "ADC5(PIO0.21)", 18, set, nodump)
	RegBitTestNFix("PINENABLE0", 0x4000C1C0, "ADC6(PIO0.20)", 19, set, nodump)
	' and then matrix the package pins 20:21 to the UART1 peripheral
	' FYSA, AB firmware seems to default to 0xFF0908FF
	*0x4000C004 = 0xFF1514ff
	Print "U1 RXD Port: ";(*0x4000C004 and 0x00ff0000)>>16
	Print "U1 TXD Port: ";(*0x4000C004 and 0x0000ff00)>>8
 	
	print "==================================================="

' The Baud Rate Generator block divides the incoming clock to create a 16x baud rate
' clock in the standard asynchronous operating mode.
 ' - 115200 * 16 = 1843200
 ' - Main Clock = ____ unknown - need to find out how to determine programatically

' The BRG clock input source is the shared Fractional Rate Generator that runs from 
' the common USART peripheral clock U_PCLK).
 ' - Main Clock --> FRGCLKDIV --> FRG = common U_PCLK
 ' - U_PCLK (with divider) yields 16* baud clocking

' Status information from the transmitter and receiver is saved and provided via the Stat
' register. Many of the status flags are able to generate interrupts, as selected by software.

' Remark: The fractional value and the USART peripheral clock are shared between all
' USARTs.

' 0x40064000 (USART0)
' 0x40068000 (USART1)

for i = 0x40064000 to 0x4006402C step 4
print
print "(USART0)",i2h(i), i2h(*(i))
'print iw2bx(*(i),32)
print
next i
 	print "==================================================="
for i = 0x40068000 to 0x4006802C step 4
print
print "(USART1)",i2h(i), i2h(*(i))
'print iw2bx(*(i),32)
print
next i

' 115200 N 8 1 - NO PARITY, 8 DATA BITS, 1 STOP BIT

' 191
						' (USART0)					(USART1)
' CFG			40064000	00000005		40068000	00000000** NEED TO FIX

'	|M-------------------------------------L|
'	|3322|2222|2222|1111|1111|1100|0000|0000|
'	|1098|7654|3210|9876|5432|1098|7654|3210|
'	|---------------------------------------|
'	|rrrr|rrrr|TROO|A4rr|LSrC|SrCr|rSPP|DDrE|
'	|eeee|eeee|XXEE|U8ee|OYeL|YeTe|eTAA|AAeN|
'	|ssss|ssss|DDNN|T5ss|ONsK|NsSs|sORR|TTsA|
'	|rrrr|rrrr|PPPS|AOrr|PMrP|CrEr|rPII|LLrB|
'	|vvvv|vvvv|OOOE|DTvv|BSvO|EvNv|vBTT|EEvL|
'	|dddd|dddd|LLLL|REdd|KTdL|NdAd|d010|10dE|
'	|---------------------------------------|
' 0	|----|----|0000|00--|00-0|0-0-|-000|0101|
' 1	|----|----|0000|00--|00-0|0-0-|-000|0101|
'	|---------------------------------------|

' CTL			40064004	00000000		40068004	00000000
' STAT		40064008	00001012		40068008	0000001e**


' INTENSET	4006400c	00000005		4006800c	00000000**
' HMM - NEED TO DO ISR?

' INTENCLR	40064010	00000000		40068010	00000000
' RXDAT		40064014	0000000a		40068014	00000000**
' RXDATSTAT	40064018	0000000a		40068018	00000000**
' TXDAT		4006401c	00000030		4006801c	00000000**

' BRG			40064020	0000000f		40068020	00000000**


' INTSTAT		40064024	00000012		40068024	00000012
' OSR			40064028	0000000f		40068028	0000000f
' ADDR		4006402c	00000000		4006802c	00000000




 	print "==================================================="
	
	
	' per UM 13.3: "• Configure the USART clock and baud rate. See Section 13.3.1."
	RegBitTestNFix("SYSAHBCLKCTRL", 0x40048080, "UART1(b15)", 15, set, dump)
	*0x40068020 = 0x0000000F	' set to same as uart0 which is 115200bps.?.
	*0x40068000 = 0x00000005	' Enable with N 8 1 - NO PARITY, 8 DATA BITS, 1 STOP BIT
	
 	print "==================================================="
	print
	print "CLKOUTSEL (0x400480E0): 0x";i2h(*0x400480E0)	' CLKOUTSEL (0x400480E0): 0x00000000
	print iw2bx(*0x400480E0,2)
	print
 	print "==================================================="
	print
	print "CLKOUTUEN (0x400480e4): 0x";i2h(*0x400480e4)	' CLKOUTUEN (0x400480e4): 0x00000000
	print iw2bx(*0x400480e4,8)
	Print  
 	print "==================================================="
	print
	print "CLKOUTDIV (0x400480e8): 0x";i2h(*0x400480e8)	' CLKOUTDIV (0x400480e8): 0x00000000
	print iw2bx(*0x400480e8,8)
	Print  
 	print "==================================================="
	print
	print "UARTCLKDIV (0x40048094): 0x";i2h(*0x40048094) ' UARTCLKDIV (0x40048094): 0x00000002
	print iw2bx(*0x40048094,4)
	Print  
 	print "==================================================="
	print
	print "UARTFRGMULT (0x400480f4): 0x";i2h(*0x400480f4) ' UARTFRGMULT (0x400480f4): 0x00000000
	print iw2bx(*0x400480f4,4)
	Print  
 	print "==================================================="
	print
	print "UARTFRGDIV (0x400480f0): 0x";i2h(*0x400480f0) ' UARTFRGDIV (0x400480f0): 0x00000000
	print iw2bx(*0x400480f0,4)
	Print  
 	print "==================================================="

/*
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
 */	
	
	
	
/* 	dim rxdat as integer
	dim i as integer
 */
	' baud(1) = 115200


' do
' rxdat = rxd(1)
' if rxdat <> -1 then print chr(rxdat)
' loop


end
