#define ABmt_NewTask
#define ABmt_TaskID 2
#define ABmt_TaskName 54102_Printy
#include "..\ABmt_Lib\ABmt_TaskWrapper.lib"

#define _54102_Printy_Cycles 20
#define _54102_Printy_Dwell	500

main:
	dim i as integer
	i = _54102_Printy_Cycles

	while i>0
		print chr(if(i mod 2 = 0,"+","*"));
		' wait(_54102_Printy_Dwell)
		i -= 1
		loop
		print
end
