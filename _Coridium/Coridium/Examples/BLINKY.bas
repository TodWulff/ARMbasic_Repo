
#if defined LPC1751 || defined LPC1756 || defined LPC1758 || defined LPC4078
	#define LED_PIN		74

#elif defined LPC1114
	#define LED_PIN		1
	
#elif defined LPC11U68
	#define LED_PIN		1
	
#elif defined LPC2138 
	#define LED_PIN		15
	
#elif defined LPC54102
	#define LED_PIN		31
	
#elif defined LPC54005
	#define LED_PIN		4
	
#elif defined LPC2103 
	#define LED_PIN		15

#elif defined MK20DX128 || defined MK20DX256
	#define LED_PIN		13

#elif defined LPC4330
	#define LED_PIN		7
	
#elif defined LPC11U37 || defined LPC1137 || defined LPC11U67
	#define LED_PIN		1
	
#elif defined LPC1768
	#error need to define an LED pin for this board
#elif defined LPC2106	
  #error this code has not been ported to the LPC2106
#else
  #error undefined CPU type    
#endif		   

WHILE X<30

	print X
    X=X+1
    

	IO(LED_PIN) = X and 1    ' IO() sets pin direction and state
    WAIT(500)
LOOP

