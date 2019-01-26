#ifndef ConBASIC_h
#define ConBASIC_h

#include "ConBASIC.h"
#include "cBASICdef.h"

void breakpoint(void) ;
int printf(const char *format, ...);
int sprintf(char *out, const char *format, ...);

#define OUTPUT(x)	wrDIR(x,1)
#define HIGH(x)		{wrDIR(x,1); wrGPIO(x,1);}
#define LOW(x)		{wrDIR(x,1); wrGPIO(x,0);}

#define WAIT		wait
#define WAITMICRO	waitmicro

#define INPUT(x)	wrDIR(x,0)
#define IN(x) 		rdGPIO(x)
#define OUT(x,y)	wrGPIO(x,y)
#define wrIO(x,y)	{wrDIR(x,1); wrGPIO(x,y);}
#define rdIO(x)		{wrDIR(x,0); rdGPIO(x);}		// not sure this works -- might need to define a function

#define putchar(x)	putc(x,0)


int getc(int UARTnum) ;
int putc(int c, int UARTnum) ;
int puts(char *s) ;
int micros(void) ;
void waitmicro(int val) ;
void wait(int val) ;
int rdDIR(int bit) ;
void wrDIR(int bit, int val) ;
int rdGPIO(int bit) ;
void wrGPIO(int bit, int val) ;

void intsw(int val) ; // disable interrupts works but then you're hung

void setbaud(int uartNUM, int baud) ;

int flash_write(int flash_addr, int data_addr, int blksize) ;

void settimer(int time) ;

int adin(int ch) ;


#endif