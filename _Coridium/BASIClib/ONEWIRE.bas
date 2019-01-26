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

#ifdef LPC1114
 #warning -- this has NOT been tested with the BASICchip
#elif defined LPC812
 #warning -- this has NOT been tested with the  LPC812
#endif

goto jumpAroundOneWire


FUNCTION ow_reset(pin)
	DIM i as integer
	DIM inpin as integer

	INPUT (pin)	 
	OUT(pin) = 0					' when drive it will go low
	
	WAITMICRO(10)					' allow rise time for initial starting point
	OUTPUT (pin)						' drive it low
	WAITMICRO(500)					' hold line low for >480 uS for reset
	
	INPUT (pin)	 
	WAITMICRO(15)					' allow rise time and rest time
	i = 12							' 12 * 5  == 60 microsecond loop
	while (i)						' wait for low going pulse
		if (IN(pin) = 0) then exit
		i -= 1
		WAITMICRO(5)
	loop
	
	WAITMICRO(20)					' wait for sample time
	
	inpin = IN(pin)					' used for presence return
	WAITMICRO(500)					' presence pulse time period
	
	return inpin = 0
END FUNCTION


SUB ow_sendbyte(pin, value) 
	DIM i as integer
	
	i = 1
	while i and $ff
		OUTPUT (pin)						' drive it low
		WAITMICRO(5)		' lead pulse of data
		if (i and value) then INPUT(pin)
		WAITMICRO(90)		' remaining time of data pulse
		INPUT (pin)
		WAITMICRO(100)		' rest period
		i = i << 1
	loop
END SUB


SUB OWIN (pin, OUTcnt, BYREF OUTlist as string, INcnt, BYREF INlist as string) 
	DIM value as integer
	DIM i as integer
	DIM j as integer
		
	INTERRUPT (0)
	ow_reset(pin)
	j = 0
	do
		if OUTcnt < 0 then exit
		if OUTcnt = 0 then
			if OUTlist(j) = 0 then exit
		endif
		ow_sendbyte( pin, OUTlist(j))
		j=j+1
	until j = OUTcnt
	
	j = 0
	do 
		value = 0
		i = 1
		while i and $ff
		    OUTPUT (pin)
		    INPUT (pin)						' slave should take over
			WAITMICRO(10)	' sample period
'			WAITMICRO(20)	' sample period -- breaks at 30 --TI wants 15
			
   			if IN(pin) then value = i + value
			WAITMICRO(100)	' slot period
			i = i << 1
		loop
		
		INlist(j) = value
		j = j+1
	until j = INcnt
	INTERRUPT (1)
	
END SUB


FUNCTION OWOUT (pin, OUTcnt, BYREF OUTlist as string)
	DIM temp as integer
	DIM i as integer
	
	INTERRUPT (0)
	temp = ow_reset(pin)

	i = 0
	do
		if OUTcnt = 0 then
			if OUTlist(i) = 0 then exit
		endif
		ow_sendbyte( pin, OUTlist(i))
		i=i+1
	until i = OUTcnt
	
	INTERRUPT (1)
	return temp
END FUNCTION

jumpAroundOneWire:

#endif
