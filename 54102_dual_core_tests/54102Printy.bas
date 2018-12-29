#warning ********** This is Printy **********

#define _54102_Printy_Cycles	200
#define _54102_Printy_Dwell		1000


main:
	dim i as integer


MainRestart:

	i = _54102_Printy_Cycles

	while i>0
		print chr(if(i mod 2 = 0,"+","*")); '~
		wait(_54102_Printy_Dwell)
		i -= 1
		loop
	goto MainRestart

end
