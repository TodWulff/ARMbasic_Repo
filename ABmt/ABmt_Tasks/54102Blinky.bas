#define ABmt_TaskID 1
#define ABmt_TaskName 54102_Blinky
#include "..\ABmt_Lib\ABmt_TaskWrapper.lib"

' #define ABmt_TasksLoaded add(ABmt_TasksLoaded,1)


' #define ABmt_FileName __FILE__
' #pragma filepp Write # ABmt_FileName
' #pragma filepp Write # __FILE__
' #warning ABmt_FileName
' #warning __FILE__

' #warning ===================================================================
' #warning #pragma filepp ReplaceDefines __FILE__
' #pragma filepp Debug #pragma filepp ReplaceDefines __FILE__
' #pragma filepp ReplaceDefines __FILE__
' #pragma filepp Debug 
' #warning ===================================================================

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
