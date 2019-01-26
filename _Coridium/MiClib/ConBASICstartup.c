
#include "ConBASIC.h"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//				this code must not be moved and should end up at the start of user code
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
__asm(" 	bl main				");
__asm("breakpoint:				");
jump2breakpoint;
__asm("		b	breakpoint		");
__asm("printf:					");
__asm("		mov		r9,lr		");
jump2printf;
__asm("		bx 		r9			");
__asm("sprintf:					");
__asm("		mov		r9,lr		");
jump2sprintf;
__asm("		bx 		r9			");

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////


void (*BASICfunc) (void);				// this should be variable number of params someday -- handled in ASM for now


int getc(int UARTnum) {		// accum has the UART #
	BASICfunc = f_getrxd;
	__asm("	push {r4,r7}");
	__asm("	mov	r4,r0	");
	BASICfunc();	
	__asm("	mov	r0,r7	");
	__asm("	pop	{r4,r7}");
	__asm("	pop	{r3,pc}	");
	return 0;				// this never gets executed -- keep compiler happy
}


int putc(int c, int UARTnum) {	
	BASICfunc = f_settxd;
	__asm("	push	{r4,r7}");
	__asm("	mov	r7, r0");
	__asm("	mov r4, r1");
	BASICfunc();	
	__asm("	mov	r0,r7");
	__asm("	pop	{r4,r7}");
	__asm("	pop	{r3,pc}");
	return 0;				// this never gets executed -- keep compiler happy
}


int puts(char *s) {// spews garbage then hangs
	char lastc = 0;
	while (*s) {
		lastc = putc(*s, 0);
		s++;
	}
	return lastc;
}


int micros(void) {	
	BASICfunc = f_gettimer;
	__asm("	push	{r7}");
	BASICfunc();	
	__asm("	mov	r0,r7");
	__asm("	pop	{r7}");
	__asm("	pop	{r3,pc}");
	return 0;				// this never gets executed -- keep compiler happy
}


void waitmicro(int val) {
	BASICfunc = f_waitmicro;
	__asm("	push	{r7}");
	__asm("	mov	r7,r0");
	BASICfunc();	
	__asm("	pop	{r7}");
}


void wait(int val) {
	BASICfunc = f_wait;
	__asm("	push	{r7}");
	__asm("	mov	r7,r0");
	BASICfunc();	
	__asm("	pop	{r7}");
}


int rdDIR(int bit) {						
	BASICfunc = f_rddirbit;
	__asm("	push	{r7}");
	__asm("	mov	r7,r0");
	BASICfunc();	
	__asm("	mov	r0,r7");
	__asm("	pop	{r7}");
	__asm("	pop	{r3,pc}");
	return 0;				// this never gets executed -- keep compiler happy
}


void wrDIR(int bit, int val) {						
	BASICfunc = f_wrdirbit;
	__asm("	push	{r4,r7}");
	__asm("	mov	r4,r0");
	__asm("	mov	r7,r1");
	BASICfunc();	
	__asm("	pop	{r4,r7}");
}


int rdGPIO(int bit) {						
	BASICfunc = f_pbinbit;
	__asm("	push	{r7}");
	__asm("	mov	r7,r0");
	BASICfunc();	
	__asm("	mov	r0,r7");
	__asm("	pop	{r7}");
	__asm("	pop	{r3,pc}");
	return 0;				// this never gets executed -- keep compiler happy
}


void wrGPIO(int bit, int val) {						
	BASICfunc = f_pboutbit;
	__asm("	push	{r4,r7}");
	__asm("	mov	r4,r0");
	__asm("	mov	r7,r1");
	BASICfunc();	
	__asm("	pop	{r4,r7}");
}


void intsw(int val) { // disable interrupts works but then you're hung
	BASICfunc = f_intsw;
	__asm("	push	{r7}");
	__asm("	mov	r7,r0");
	BASICfunc();	
	__asm("	pop	{r7}");
}


void setbaud(int uartNUM, int baud) {
	BASICfunc = f_setbaud;
	__asm("	push	{r4,r7}");
	__asm("	mov	r4,r0");
	__asm("	mov	r7,r1");
	BASICfunc();	
	__asm("	pop	{r4,r7}");
}



void settimer(int time) {
	BASICfunc = f_settimer;
	__asm("	push	{r7}");
	__asm("	mov	r7,r0");
	BASICfunc();
	__asm("	pop	{r7}");
}


int flash_write(int flash_addr, int data_addr, int blksize) {						
	__asm("	push {r4,r7}");
	__asm("	mov  r4,r9");
	__asm("	push {r4}");
	__asm("	mov  r4,r0");
	__asm("	mov  r9,r1");
	__asm("	mov  r7,r2");
	BASICfunc = f_fwrite;
	BASICfunc();	
	__asm("	mov	r0,r7");
	__asm("	pop	{r4}");
	__asm("	mov	r9,r4");
	__asm("	pop	{r4,r7}");
	__asm("	pop	{r3,pc}");
	return 0;				// this never gets executed -- keep compiler happy
}


//reg_accum = AD(reg_accum)
int adin(int ch) {						
	BASICfunc = f_adin;
	__asm("	push	{r7}");
	__asm("	mov	r7,r0");
	BASICfunc();	
	__asm("	mov	r0,r7");
	__asm("	pop	{r7}");
	__asm("	pop	{r3,pc}");
	return 0;				// this never gets executed -- keep compiler happy
}

