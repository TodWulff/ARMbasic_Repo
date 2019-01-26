/*
	Copyright 2007 Coridium Corp --	www.coridium.us

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
    
*/


#include "printf.h"
 #if (defined MK20DX128) || (defined MK20DX256) 
  #include "usb_serial.h"
 #elif defined CC3200
  #include "uart_if.h"
 #elif defined STM32F411
  #include "uart_stm.h"
 #elif defined LPC54618
  #include "uart_lpc546xx.h"
 #else   
  #include "uart.h"
 #endif

#define CR 			0xD
#define LF 			0xA
#define XON 		0x11
#define XOFF		0x13
#define BACKSPACE	0x8
#define SPACE		0x20
#define TAB	 		0x09
#define ESC	 		27				//these 2 will stop the interpreter in serial mode
#define CTRLC 		3
#define EOTX 		4				//sent back when program finishes
#define SOH 		1				//sent back when program starts

#if !(defined MK20DX128) && !(defined MK20DX256) && !(defined CC3200)
#ifndef __UART_H		// if not included then I need to do this myself
int getchar(void)
{
	if (LPC_UART1->LSR & 1) return LPC_UART1->RBR;
	else return -1;
}
#endif
#endif


#ifdef FOR_BASIC		

  extern char line[];
  extern char breakHelpMsg[];
  
  int hexdig2num(char c);		// defined in BASIC.c

  
#else

  char line[80];
  const char breakHelpMsg[] =	"Coridium BreakPoint:\n\n@ hex [yy] - dump at hex yy words\n! hex yyy  - write yyy to hex\n^ to continue\n\nAlso d or w for @ !\n\n";

  int hexdig2num(char c) {
	if (c <= '9')	return (c - '0');
	c = c & 0x4F;			// crude upshift
	return (c - 'A' + 10);
  }
  
#endif

void breakHelpScreen(void) {
	printf(breakHelpMsg);
}

/////////////////////////////////////////////////////////////////////////////////
//
//	read a line -- handle backspace, tab
//
int get_line(char *line, int max_len) {
	char c;
	int i, linelen; // , lineTruncated = 0;
	c = '\0';
	linelen = 0;

	while( 1 ) {
		//hang here waiting for a character
		i = -1;
		while(i == -1){
#if (defined ARMweb) || (defined SUPERweb) || (defined USE_ENET) || (defined CC3200)
#warning -- try to eliminate this dependency

			i = tcpGetch();
			if (i != -1) break;
#endif
			i = getchar();
		}
		c = i & 0xFF;//safety
		if (c == CR) break;				// end on either CR or LF
		if (c == LF) break;				// end on either CR or LF
		
		if (c == BACKSPACE){
			linelen--;
			continue;
		} else if (c == TAB) {
			c = ' ';
		} 
		
		line[linelen++] = c;
		if(linelen >= max_len) {
			linelen--;
//			lineTruncated = 1;
		}
	}
	line[linelen] = '\0';

	return linelen;
}	

unsigned int debug_get_a=0, debug_get_b=0;		// these values set by scanning the input line

/////////////////////////////////////////////////////////////////////////////////
//
//	parse the line for upto 2 input values
//

int  get2values(char *line) {
	int i;
	
	if (line[1] == 0) return -1;	// no values
	debug_get_a = debug_get_b = 0;
	i = 1;
	while (line[i] == ' ') i++;		// skip spaces
	if (line[i] == 0) return -1;	// no values
	
	while (line[i]>' ') debug_get_a = (debug_get_a<<4) + hexdig2num(line[i++]);
		
	if (line[i] == 0) return 0;		// one values

	while (line[i] == ' ') i++;		// skip spaces
	while (line[i]>' ') debug_get_b = (debug_get_b<<4) + hexdig2num(line[i++]);
		
	return 1;
}

/////////////////////////////////////////////////////////////////////////////////
//
// dump a block of memory
//
#if defined FOR_BASIC && defined CODE_PROTECT
int call_peekw(int x) ;		// used by BASIC
#endif

char ignorFault;


void dumpmem(char *line) {
	int i;

	ignorFault = 1;
	
	get2values(line);
	debug_get_a &= 0xfffffffc;		// word allign it
	
	for (i=0; i<(debug_get_b==0? 32: (debug_get_b<<2)-1); i += 4) {
		if ((i==0) || ((((debug_get_a + i)) & 0x1f) == 0)) printf("\n%08x:  ",debug_get_a+i);
#if defined FOR_BASIC && defined CODE_PROTECT
		printf("%08X ", call_peekw((debug_get_a+i)));		// no unsigned printf in BASIC
#else		
		printf("%08X ", *(int *)(debug_get_a+i));		// no unsigned printf in BASIC
#endif	
	}
	putchar('\n');

	if (debug_get_b) debug_get_a += (debug_get_b<<2);
	
	ignorFault = 0;	
}
  
/////////////////////////////////////////////////////////////////////////////////
//
//	change 1 word location
//
void changemem(char *line) {

	if (get2values(line) > 0) {
	
		// OK now write it out
	
		*(int *)debug_get_a = debug_get_b;
		printf("%x <- %x\n",debug_get_a,debug_get_b);
		debug_get_b = 0;			// leave the start pointer alone, but clear this so dump works where it left off
	}
}
  
/////////////////////////////////////////////////////////////////////////////////
//
// do this here to save some space
//
int break_command(void) {
	if( line[0] == '@')	     dumpmem(line);
	else if (line[0] == '!') changemem(line);
	else return 0;
	
	return 1;			// we did something
}

/////////////////////////////////////////////////////////////////////////////////
//
// a simple monitor, not much but pretty useful
//
void breakpoint(void) {
	while (1) {
		get_line(line, 80);
		if (break_command());
#ifndef FOR_BASIC		
		else if (line[0] == 'w') changemem(line);
		else if (line[0] == 'W') changemem(line);
		else if (line[0] == 'd') dumpmem(line);
		else if (line[0] == 'D') dumpmem(line);
#endif		
		else if (line[0] == '?') breakHelpScreen();
		else if (line[0] == 0) 	 printf("\n");
		else if( line[0] == '^') break;	// restart
	}
}
