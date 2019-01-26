//////////////////////////////////////////////////////////////////////
//
// software bit-banged async serial routines

#ifndef _COR_BITBANG_H
#define _COR_BITBANG_H



//////////////////////////////////////////////////////////////////////////
//
//  bit banged serial routines, see uart.h for use of hardware UARTs --putc, getc
//
//

int  recv_byte(int pin, int posTrue) ;
void xmit_byte(int pin, int posTrue, int chr) ;

extern int SERbauds[];

#define RXD(pin)			recv_byte(remap(pin), 1)
#define TXD(pin,val)		xmit_byte(remap(pin), 1, val)		// this pin must be made an OUTPUT using the OUTPUT macro

extern int  SERIN (int pin, int baud, int posTrue, int cnt, char *inList) ;
extern void SEROUT(int pin, int baud, int posTrue, int cnt, char *outList) ;

// these are for backward compatiblity
#define TXD1(x) putc(x,1)
#define RXD1()  getc(1)
#define TXD0(x) putc(x,0)
#define RXD0()  getc(0)


// PBASIC style functions available to C-
// 	duration in miliseconds
//	this function returns the number of transitions found on pin during the duration
extern int COUNT(int pin, int duration);

/////////////////////////////////////////////////////////////////////
// 	duty_cycle   0-255
// 	duration in miliseconds
extern void PWM(int pin, int duty, int duration);

/////////////////////////////////////////////////////////////////////
//	Hardware generate PWM on AMRmite, ARMexpressLITE
extern void HWPWM(int cycle, int cnt, int *list);	// cycle time in microseconds, 
// cnt is # channels, list[] contains high times in microseconds for each channel during the cycle time
// if you want to skip an assigned pin for HWPWM, set the corresponding entry in the list to -1

/////////////////////////////////////////////////////////////////////
//  return the amount of time pin was in state in microseconds
//  PULSIN times out after 1 second, and if it times out 0 is returned
//  if pin is already in state, then it will wait for a transition to the opposite state
//	PULSIN will make pin an input
extern int PULSIN (int pin, int state);
//	PULSIN will make pin an output
//  then will drive the pin into the opposite state for duration microseconds
extern void PULSOUT (int pin, int duration);

/////////////////////////////////////////////////////////////////////
//	RCTIME 
//	return time in microseconds that pin stays in state
//	If pin is not at state when the function is called variable is set to 1.
//	If pin remains at state longer than 1 second variable is set to 0.
extern int RCTIME(int pin, int state) ;

/////////////////////////////////////////////////////////////////////
// default speed for I2C is 400 Kb
extern void I2CSPEED(int);

extern void I2CIN  (int sda_pin, int scl_pin, int addr, int opt1, int opt2, int opt3, int opt4, int opt5, int cnt, char *inList);
extern int  I2COUT (int sda_pin, int scl_pin, int addr, int cnt, char *outList);	// returns false on device error or not present

extern void OWIN (int pin, int out1,int out2,int out3,int out4,int out5, int out6, int cnt, char *inList) ;
extern int  OWOUT (int pin, int cnt, char *outList) ;			// returns FALSE on no device

/* MAR *//////////////////////////////////////////////////////////////////////
/* MAR *///mode for SHIFTIN / SHIFTBI
/* MAR */#define MSBPRE		0
/* MAR */#define LSBPRE		1
/* MAR */#define MSBPOST		2
/* MAR */#define LSBPOST		3

/* MAR */extern void SHIFTIN  (int sda_pin, int scl_pin, int mode, int cnt, int *inList,  int bitLengths) ;
/* MAR */extern void SHIFTBI  (int sda_pin, int scl_pin, int sdo_pin, int mode, int cnt, int *outList, int *inList,  int bitLengths) ;

/* MAR *//////////////////////////////////////////////////////////////////////
/* MAR *///mode for SHIFTOUT
/* MAR */#define LSBFIRST	0
/* MAR */#define MSBFIRST	1

/* MAR */extern void SHIFTOUT (int scl_pin, int sdo_pin, int mode, int cnt, int *outList, int bitLengths) ;

/* MAR *//////////////////////////////////////////////////////////////////////
/* MAR */// SPImode
/* MAR */#define MSBposCLK	0
/* MAR */#define LSBposCLK	1
/* MAR */#define MSBnegCLK	2
/* MAR */#define LSBnegCLK	3

/* MAR */extern char SPImode;
/* MAR */extern void SPIIN (int cspin, int inpin,  int clkpin, int outpin, int out1, int out2, int out3, int cnt, char *inList) ;
/* MAR */extern void SPIOUT(int cspin, int clkpin, int outpin, int cnt, char *outList) ;
/* MAR */extern void SPIBI (int cspin, int inpin,  int clkpin, int outpin, int out1, int out2, int out3, int cnt, char *inList) ;


/* MAR *//////////////////////////////////////////////////////////////////////
/* MAR *///  RTC functions
/* MAR *///


/* MAR */#define setYEAR(x)	 	{LPC_RTC->CCR &= ~1; LPC_RTC->YEAR  = x; count_the_days(); LPC_RTC->CCR |= 1;}
/* MAR */#define setMONTH(x) 	{LPC_RTC->CCR &= ~1; LPC_RTC->MONTH = x; LPC_RTC->CCR |= 1;}
/* MAR */#define setDAY(x) 		{LPC_RTC->CCR &= ~1; LPC_RTC->DOM   = x; LPC_RTC->CCR |= 1;}
/* MAR */#define setHOUR(x) 		{LPC_RTC->CCR &= ~1; LPC_RTC->HOUR  = x; LPC_RTC->CCR |= 1;}
/* MAR */#define setMIN(x) 		{LPC_RTC->CCR &= ~1; LPC_RTC->MIN   = x; LPC_RTC->CCR |= 1;}
/* MAR */#define setSEC(x)	 	{LPC_RTC->CCR &= ~1; LPC_RTC->SEC   = x; LPC_RTC->CCR |= 1;}


///////////////////////////////////////////////////////////////////////
//
//  miscellaneous
//

#define init_coridium()	{SystemInit();UART_init(0,19200); timer_tick_init(); ADC_Init(ADC_CLOCKRATE_MAX);}

int atoi(char * string) ;

void count_the_days(void);

void timer_tick_init(void);



//////////////////////////////////////////////////////////////////////////////////////////
//
//	the following are obsolete function calls that are not supported, or should be replaced
//

#ifdef _COR_HWLIB_H
void FREQOUT(int a, int b, int c, int d) ;
void SLEEP(int a) ;
#endif

#define configAD(x)		initAD()
#define setbaud(chan,divisor)	UART_init(chan, 392 * divisor)		// the divisor has been replace with the actual requested baudrate

#endif
