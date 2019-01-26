
#if defined LPC1751 || defined LPC1756 || defined LPC1758 || defined LPC4078
	#define LED_PIN		74

#elif defined LPC1114
	#define LED_PIN		1
	
#elif defined LPC2138 
	#define LED_PIN		15
	
#elif defined LPC54102
	#define LED_PIN		31
	
#elif defined LPC2103 
	#define LED_PIN		15

#elif defined MK20DX128 || defined MK20DX256
	#define LED_PIN		13

#elif defined LPC4330
	#define LED_PIN		7
	
#elif defined LPC11U37 || defined LPC1137
	#include "STAMP_PINS.bas"
	#define LED_PIN		1

#elif defined LPC1768
	#error need to define an LED pin for this board
#elif defined LPC2106	
  #error this code has not been ported to the LPC2106

#elif defined LPC824
	#define RedLED_PIN		15
	#define GrnLED_PIN		16
	#define BluLED_PIN		17
	
#else
  #error undefined CPU type    
#endif		   

WHILE 1

	' print X
    X=X+1
    
#if defined LPC824
	IO(RedLED_PIN) = 32-X and 1    ' IO() sets pin direction and state
	IO(GrnLED_PIN) = 64-X and 1    ' IO() sets pin direction and state
	IO(BluLED_PIN) = 128-X and 1   ' IO() sets pin direction and state
#else
	IO(LED_PIN) = X and 1    ' IO() sets pin direction and state
#endif
    WAIT(500)
LOOP

#if defined LPC824
	IO(RedLED_PIN) = 1    ' set pin hi to extinguish the led
	IO(GrnLED_PIN) = 1    ' set pin hi to extinguish the led
	IO(BluLED_PIN) = 1    ' set pin hi to extinguish the led
#else
	IO(LED_PIN) = 1    ' set pin hi to extinguish the led
#endif

