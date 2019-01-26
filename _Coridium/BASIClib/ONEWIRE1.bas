'========================================================================================
'
'	One Wire Functions
'
'	no initialization code
'
'		copyright Coridium Corp, 2008,   may be used with Coridium Hardware or licensees
'
'	Modified to work by David J. Kaleta Jan 3, 2015
'========================================================================================
#ifndef USE_ONEWIRE
#define USE_ONEWIRE

FUNCTION ow_reset(pin)
	DIM start as integer
	DIM start2 as integer

	OUTPUT (pin)	 
	OUT(pin) = 0					' when drive it will go low
	
	start = TIMER
	while ((TIMER - start) < 10)	' allow rise time for initial starting point
	loop
	OUTPUT (pin)						' drive it low
	start = TIMER
	while ((TIMER - start) < 500)	' hold line low for >480 uS for reet
	loop
	
	INPUT (pin)	 
	start2 = TIMER
	while ((TIMER - start2) < 15)	' allow rise time and rest time
	loop
	start = TIMER
	while ((TIMER - start) < 60)	' wait for low going pulse
		if (IN(pin) = 0) then exit
	loop
	
	start = TIMER
	while ((TIMER - start) < 20)	' wait for sample time
	loop
	
	start = IN(pin)					' double duty on start used for presence return
	while ((TIMER - start2) < 500)	' presence pulse time period
	loop
	
	return start = 0
END FUNCTION


SUB ow_sendbyte(pin, value) 
	DIM start as integer
	DIM i as integer
	OUTPUT (pin)
	i = 1
	while i and $ff
		OUT(pin) = 0						
		WAITMICRO(7)
		if (i and value) then OUT(pin) = 1 
		WAITMICRO(72)
		OUT (pin) = 1
		i = i << 1
	loop
	
END SUB

FUNCTION ow_readbyte(pin)
	DIM start as integer
	DIM i as integer
	DIM value as integer
	DIM j as integer
	value = 0
	i = 1
		while i and $ff
			OUTPUT (pin)
			OUT(pin) = 0
			WAITMICRO(7)
			OUT(pin) = 1
			INPUT (pin)						
			WAITMICRO(7)
			value = value >> 1
			if IN(pin) then 
			value or= $80
			else
			value and= $7f
			end if
			i = i << 1
			WAITMICRO(70)
			
		loop
	
return value

END FUNCTION


SUB OWIN (pin, OUTcnt, BYREF OUTlist as string, INcnt, BYREF INlist as string) 
	DIM start as integer
	DIM i as integer
	DIM j as integer
		
	j = 0
	do
		ow_sendbyte( pin, OUTlist(j))
		j = j+1
	until j = OUTcnt

	j = 0
	do 

		INlist(j) = ow_readbyte(pin)
		j = j+1
	until j = INcnt	
	
END SUB


SUB OWOUT (pin, OUTcnt, BYREF OUTlist as string)
	DIM i as integer
	i = 0
	do
		if OUTcnt = 0 then
			if OUTlist(i) = 0 then exit
		endif
		ow_sendbyte( pin, OUTlist(i))
		i=i+1
	until i = OUTcnt

END SUB


#endif
