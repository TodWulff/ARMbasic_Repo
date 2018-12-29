#warning ********** This is Blinky **********

#define _54102_Blinky_Cycles	200
#define _54102_Blinky_Dwell		100
#define _54102_Blinky_led_port	31

main:
	dim i as integer
	output(_54102_Blinky_led_port)

MainRestart:	

	i = _54102_Blinky_Cycles

	while i>0
		out(_54102_Blinky_led_port) = i and 1
		wait(_54102_Blinky_Dwell)
		i -= 1
		loop
	goto MainRestart

end
