#define ABmt_TaskID 1
#define ABmt_TaskName 54102_Blinky
#include "..\ABmt_Lib\ABmt_TaskWrapper.lib"

#define _54102_Blinky_LEDDwell	50
#define _54102_Blinky_led_port	31
#define _54102_Blinky_Cycles	20

main:
	dim led_dwell, i as integer
	led_dwell = _54102_Blinky_LEDDwell
	i = _54102_Blinky_Cycles
	output(_54102_Blinky_led_port)

	while i>0
		out(_54102_Blinky_led_port) = i and 1
		wait(_54102_Blinky_LEDDwell)
		i -= 1
		loop
end