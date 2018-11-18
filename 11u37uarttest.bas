#ifdef LPC11U37
#else
#include "LPC17xx.bas"
#endif

#define UARTx 3
#define UARTx_FDR UART3_FDR

SUB PrintUART1 (Astr(100) as STRING)
    DIM I as INTEGER
    I=0
    WHILE Astr(I)
        TXD(UARTx) =  Astr(I)
        I=I+1
    LOOP
ENDSUB
'...


main:

#ifdef LPC11U37
BAUD(UARTx)=115200  ' enable UART1
#else
BAUD(UARTx)=125000  ' enable UART1, standard call for 115.2 is too coarse -- needs fractional rate
UARTx_FDR = &HC1
  #if UARTx == 3
    PCB_PINSEL1 OR= &H003C0000
	PCB_PINSEL9 AND= (&HF0FFFFFF)
  #endif
#endif

for i= 1 to 10
PrintUART1 ("Hello World")       ' Send a string of characters serially out UART1
TXD(UARTx)=13
next

' now echo the first 10 charaters sent to UART1

x = 10
while x>0
	y = RXD(UARTx)
	while y = -1
		y = RXD(UARTx)		' when -1 there is no character available
	loop
	TXD(0)=y	        ' echo the character to BASICtools
	x=x-1
loop

end


