
'#define ABmt_TaskName ABmt_Task1_Blinky_824
'#include "..\ABmt_Lib\ABmt_TaskWrapper.lib"

#define _824_Blinky_LEDDwell	333		'1/3 of a second for visual identification
#define _824_Blinky_led_port_red	15
#define _824_Blinky_led_port_green	16
#define _824_Blinky_led_port_blue	17
#define _824_Blinky_Cycles	1

'/* the 824 chip is residing on an NXP LPC800-DIP with 3 led(s)

sub ABmt_Blinky_824
#ifdef LPC824
PRINT "Warning: this will/could effect the the address/data bus !"
	dim led_dwell, i as integer
	led_dwell = _824_Blinky_LEDDwell
	i = _824_Blinky_Cycles
	'setup port config pins
	output(_824_Blinky_led_port_red)
	output(_824_Blinky_led_port_green)
	output(_824_Blinky_led_port_blue)
	
	while i>-1		'possible boolean error ???
	'this should turn on and off 1 cycle per task call
		out(_824_Blinky_led_port_red) = i and 1
		print chr(if(i mod 2 = 0,"#","-"));
		wait(_824_Blinky_LEDDwell) ' so it can be seen
		out(_824_Blinky_led_port_green) = i and 1
		print chr(if(i mod 2 = 0,"#","-"));
		wait(_824_Blinky_LEDDwell) ' so it can be seen
		out(_824_Blinky_led_port_blue) = i and 1
		print chr(if(i mod 2 = 0,"#","-"));
		wait(_824_Blinky_LEDDwell) ' so it can be seen
		i -= 1
		loop
		print
RETURN
#else	
	#error "ONLY configured for the NXP LPC800-DIP"
#endif
ENDSUB

