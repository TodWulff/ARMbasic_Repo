#if defined LPC824
	#define RedLED_PIN		15
	#define GrnLED_PIN		16
	#define BluLED_PIN		17
#else
  #error undefined CPU type  - code intended for LPC800-DIP with an 824 thereon
#endif		   

WHILE 1

	print X
    X=X+1
    
	IO(8) = 128-X and 1    ' IO() sets pin direction and state
	IO(9) = 128-X and 2   ' IO() sets pin direction and state
	IO(18) = 128-X and 4   ' IO() sets pin direction and state
	IO(19) = 128-X and 8    ' IO() sets pin direction and state
	IO(12) = 128-X and 16    ' IO() sets pin direction and state
	IO(13) = 128-X and 32    ' IO() sets pin direction and state
	IO(14) = 128-X and 64    ' IO() sets pin direction and state
	IO(20) = 128-X and 128    ' IO() sets pin direction and state
	IO(RedLED_PIN) = 128-X and 32    ' IO() sets pin direction and state
	IO(GrnLED_PIN) = 128-X and 64    ' IO() sets pin direction and state
	IO(BluLED_PIN) = 128-X and 128   ' IO() sets pin direction and state
	
'    WAIT(1)
	
	LOOP

