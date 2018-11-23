'#define ABmt_NewTask
'#define ABmt_TaskID 2
'#define ABmt_TaskName ABmt_Task2_Printy_824
'#include "..\ABmt_Lib\ABmt_TaskWrapper.lib"

#define _824_Printy_Cycles 3
#define _824_Printy_Dwell	250

SUB ABmt_Printy_824
	dim i as integer
	i = _824_Printy_Cycles

	while i>0
		print chr(if(i mod 2 = 0,"+","*"));
		wait(_824_Printy_Dwell)
		i -= 1
		loop
		print
ENDSUB
