
#ifndef USE_CORIDIUM_PCB
#define USE_CORIDIUM_PCB

#if defined LPC2103 || defined LPC2106 || defined LPC2138
	#include <LPC21xx.bas>
	#include <RTC.bas>
	#include <HWPWM.bas>
#elif defined LPC1751 || defined LPC1756
	#include <LPC17xx.bas>
	#include <RTC.bas>
	#include <HWPWM17.bas>
#elif defined LPC1114
	#include <LPC11xx.bas>
	#include <HWPWM11.bas>
#elif defined LPC812 || defined LPC814
	#include <LPC8xx.bas>
	#include <HWPWM8.bas>
#elif defined MK20DX128 || defined MK20DX256
	#include <MK20DX128.bas>
#elif defined LPC11U37
	#include <LPC11U3x.bas>
	#include <HWPWM11.bas>
#elif defined LPC54102
	#include <LPC54102.bas>
#else

  #error undefined CPU type, please install new BASICtools from www.coridium.us/Support.php    

#endif

#endif
