////////////////////////////////////////////////////////////////////////////
//
//	Copyright Coridium Corp, 2011, free to use anywhere with this notice
//
//		countdown is set to timeout in 0x10000		microseconds
//		to avoid divides, counts in multiples of 65.536 miliseconds
//

#ifdef FOR_BASIC
  #include "basic_pcb.h"
#else  
  #include "coridium_pcb.h"
#endif
#include "systick.h"

#if (defined CORE_M0a) // does not have a SysTick, so need to use something else

void systick_init( void ) {}

unsigned int micros( void ){
	return LPC_RITIMER->COUNTER / 200;
}

void delay_us( unsigned int us ) {		// only good to 21 sec
	int now;
	
	now = LPC_RITIMER->COUNTER;
	us = us * 200;
	
	while ((LPC_RITIMER->COUNTER - now) < us);
}

#else

volatile unsigned int ms65_count;		// counts 65K microseconds timeTicks

#ifdef __cplusplus
extern "C" {
#endif

void SysTick_Handler(void) {
	ms65_count++;                        // increment counter
	//#if (defined LPC54102) && !(defined LPC54102m0)
	////LPC_MBOX->BOX[0].IRQ = 1;
	//if( (ms65_count & 7) == 7)LPC_GPIO->NOT[0] = (1 << 31);
	////LPC_GPIO->NOT[0] = (1 << 2);
	////#else
	////LPC_GPIO->NOT[0] = (1 << 21);
	//#endif
	//#if defined CC3200 // debug GPIO 9 red LED also at pin
	//	if(ms65_count & 1) HWREG(GPIOA1_BASE + ((1<<1) << 2)) = (1<<1);
	//	else HWREG(GPIOA1_BASE + ((1<<1) << 2)) = 0;
	//#endif
}

void systick_init( void ) {
	// SysTick counter, interrupt every 65 ms
	SysTick->LOAD = SYSTICK_RELOAD_VAL-1;
	SysTick->VAL  = 0;
	SysTick->CTRL  = 4 | 2 | 1; //CLKSOURCE=CPU clock | TICKINT | ENABLE
	ms65_count = 0;
}


unsigned int micros( void )
{
	unsigned int Tick;
	unsigned int count;

    do {
		count = ms65_count;
        Tick = SysTick->VAL;
    } while (SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk);

//	divides take a long time in terms of microseconds
//  return (count * 100000 + (SYSTICK_RELOAD_VAL+1 - Tick) / ( (SYSTICK_RELOAD_VAL+1) / 100000 )) & 0xffffffff ;//LPC111x
    return (count << 16) + (0x10000 - SYSTICK_DIV(Tick));
}


void delay_us( unsigned int us )		// only good to 65000 usec
{
	unsigned int start, now;
	
	us = SYSTICK_MULT(us);
//    do {
        start = SysTick->VAL;
//    } while (SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk);
	
	do {
//	    do {
    	    now = SysTick->VAL;
//    	} while (SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk);
		if (start < now) start += SYSTICK_RELOAD_VAL;
	} while (start - now < us);
}

//// NOTE These work but are not used
//unsigned int systics( void )
//{
//	unsigned int Tick;
//    do {
//        Tick = SysTick->VAL;
//    } while (SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk);
//	// SysTick is a down counter
//	// This is only a 24 bit counter, add lower 8 bits of counter to upper 8 bits tics
//    return ((ms65_count & 0xFF)<<24 ) | (SYSTICK_RELOAD_VAL + 1 - Tick);
//}

////Just making the call takes some tics so passing small numbers returns right away
//void delayTics( unsigned int tics )
//{
//	unsigned int interval;
//	//unsigned int Tick;
//	unsigned int start, now;
//    do {
//        start = SysTick->VAL;
//    } while (SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk);

//	// SysTick is only a 24 bit counter
//	// Adjust variables for use in 32 bit math for roll over
//    start <<= 8;
//	interval = tics<<8;
//	while (1)
//	{
//    	do {
//    	    now = SysTick->VAL;
//    	} while (SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk);
//    	now <<= 8;
//		// SysTick is a down counter so start - now instead of now - start
//		if(start - now > interval)
//			return;
//	}

//}

#ifdef __cplusplus
}
#endif
#endif

void delay_ms( unsigned int ms )
{
	while (ms--) delay_us(1000);
}

