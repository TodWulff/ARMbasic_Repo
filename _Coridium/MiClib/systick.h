#ifndef _SYSTICK_H
#define _SYSTICK_H

////////////////////////////////////////////////////////////////////////////
//
//	Copyright Coridium Corp, 2011, free to use anywhere with this notice
//
//	counts to 2^24 at 256 MHz -- will worry about that someday
//
// these numbers are the non-binary portion of the fraction in the multiplier
//   x/30  =  ((x/2)*(0x10000/15))/0x10000

// calculate DIV value
// take RELOAD_VAL >> by the number of 2s in MHz
// then 0xFFFF / remaining factors
						   
#if defined LPC812 || defined LPC824 // LPC802 using default 12 MHz
  #define SYSTICK_RELOAD_VAL 0x1E0000	//	30 * 0x10000 	2999999
  #define SYSTICK_DIV(x)	(((x>>1)*0x1111)>>16)
  #define SYSTICK_MULT(x)	(x*30)
#elif defined CC3200
  #define SYSTICK_RELOAD_VAL 0x500000	//	80 * 0x10000	7999999
  #define SYSTICK_DIV(x)   (((x >>4) * 0x3333)>>16)
  #define SYSTICK_MULT(x)	(x*80)
#elif defined LPC1114 || defined LPC11U35 || defined LPC11U37 || (defined LPC11U67) || (defined LPC11U68)
  #define SYSTICK_RELOAD_VAL 0x300000	//  48 * 0x10000	4799999
  #define SYSTICK_DIV(x)	(((x>>4)*0x5555)>>16)
  #define SYSTICK_MULT(x)	(x*48)
#elif (defined MK20DX128) || (defined MK20DX256)
  #define SYSTICK_RELOAD_VAL 0x300000	//  48 * 0x10000	4799999
  #define SYSTICK_DIV(x)	(((x>>4)*0x5555)>>16)
  #define SYSTICK_MULT(x)	(x*48)
//#elif defined MK20DX256
//  #define SYSTICK_RELOAD_VAL 0x480000	//	72 * 0x10000	7199999
//  #define SYSTICK_DIV(x)	(((x>>3)*0x1C71)>>16)
//  #define SYSTICK_MULT(x)	(x*72)
#elif defined LPC1751 || defined LPC1756 || defined LPC1768 || defined LPC54102 || defined LPC54102m0 || defined LPC54618
  #define SYSTICK_RELOAD_VAL 0x600000	//	96 * 0x10000	9599999
  #define SYSTICK_DIV(x)	(((x>>5)*0x5555)>>16)
  #define SYSTICK_MULT(x)	(x*96)
#elif defined MHz_100					// this is limited to 50 MHz for now
  #define SYSTICK_RELOAD_VAL 0x640000	//	100 * 0x10000	4999999
  #define SYSTICK_DIV(x)    (((x>>4)*0x0A3d)>>16)
  #define SYSTICK_MULT(x)	(x*100)
#elif defined STM32F411
  #define SYSTICK_RELOAD_VAL 0x640000	//	100 * 0x10000	9999999
  #define SYSTICK_DIV(x)    (((x>>2)*0x0A3d)>>16)
  #define SYSTICK_MULT(x)	(x*100)
#elif defined LPC4078 || defined LPC4074
  #define SYSTICK_RELOAD_VAL 0x780000	//	120 * 0x10000	11999999		
  #define SYSTICK_DIV(x)	(((x>>3)*0x1111)>>16)
  #define SYSTICK_MULT(x)	(x*120)
#elif defined LPC4330 || defined LPC4337 || defined LPC1850
  #define SYSTICK_RELOAD_VAL 0xC80000	//	200 * 0x10000	19999999		
  #define SYSTICK_DIV(x)	(((x>>3)*0x0A3d)>>16)
  #define SYSTICK_MULT(x)	(x*200)
#else					  				// this is the default running off the 12 MHz IRC -- use this in bringup
  #define SYSTICK_RELOAD_VAL 0x0C0000	//	12 * 0x10000	1199999		
  #define SYSTICK_DIV(x)	(((x>>2)*0x5555)>>16)
  #define SYSTICK_MULT(x)	(x*12)
#endif


#define WAIT		delay_ms
#define WAITmicro	delay_us

extern volatile unsigned int ms65_count;

#ifdef __cplusplus
extern "C" {
#endif

void SysTick_Handler(void);

/**
 *
 */
void systick_init( void ) ;


/**
 * \brief Returns the number of microseconds since the Coridium board began running the current program.
 *
 * This number will overflow (go back to zero), after approximately 70 minutes.
 */
unsigned int micros( void ) ;

/**
 * \brief Pauses the program for the amount of time (in miliseconds) specified as parameter.
 *
 * \param ms the number of milliseconds to pause (unsigned int)
 */
void delay_ms( unsigned int ms ) ;

/**
 * \brief Pauses the program for the amount of time (in microseconds) specified as parameter.
 *
 * \param us the number of microseconds to pause (unsigned int)
 */
void delay_us( unsigned int us ) ;

/**
 * \brief Pauses the program for the amount of time (in system Tics) specified as parameter.
 *
 * \param us the number of Tics to pause (unsigned int)
 */
 

//// NOTE These work but are not used
//unsigned int systics( void );
//void delayTics( unsigned int tics ) ;

#ifdef __cplusplus
}
#endif

#endif
