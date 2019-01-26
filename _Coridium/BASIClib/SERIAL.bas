'========================================================================================
'
'	Async Serial Interface -- 
'
'	no required initialization code -- uses the fact that variables are initially 0
'
'		copyright Coridium Corp, 2008,   may be used anywhere with this notice
'========================================================================================

#ifndef USE_SERIAL
#define USE_SERIAL

goto jumpAroundSerial

DIM bbBAUD(95)

doInitSerial:	' by doing it this way the variables become global

SERINtimeout = 500000		' this should be initialized  -- time in microseconds, default is 0.5 seconds
lastSERpin = -1				' last pin serial input from, this saves time when restarting -- add 1 as 0 is initial value
lastBitTime = 0				' last bit time
lastNegTrue = 0				' set this to be 1 for negative true serial -- default positive true

return

SUB InitSerial
	GOSUB doInitSerial
END SUB	


#ifndef CR
	#define CR	chr(13)
	#define	LF	chr(10)
#endif


' bit banged serial input


FUNCTION bbRXD(pin)
	DIM  ch AS INTEGER
	DIM  i AS INTEGER
	DIM  start AS INTEGER

	if (lastSERpin -1 <> pin) then
		lastSERpin = pin+1
		if SERINtimeout = 0 then SERINtimeout = 500000	' it may not be initialized on the first call
		INPUT (pin)
		lastBitTime = ( 2000000 / bbBAUD(pin) + 1) >>1	' round the value up gets within 3% for 115Kb
	endif		

	start = TIMER
	' look for stop/idle
	i = SERINtimeout>>3
	if (lastNegTrue) then
   		while IN(pin)  
	   		if (TIMER-start > i) then return -1
	   	loop
	else                                                            
   		while IN(pin) = 0
	   		if (TIMER-start > i) then return -1
		loop
	endif

	' look for start bit	
	if (lastNegTrue) then
   		while IN(pin) = 0
	   		if (TIMER-start > SERINtimeout) then return -1
	   	loop
	else                                                            
   		while IN(pin)  
	   		if (TIMER-start > SERINtimeout) then return -1
	   	loop
	endif

	INTERRUPT (0)					' takes 2.5 uSec  
	waitmicro((lastBitTime >> 1)-3)	' waits 1/2 bbBAUD time -- using the 1usec ticker

	ch = 0
	i = 1
	while i < $100
		waitmicro(lastBitTime) 
   		if IN(pin) then	ch = i or ch
   		i = i << 1
	loop
	INTERRUPT (1)
   		
	if lastNegTrue then ch = ch xor 0xFF
	
	return ch
END FUNCTION


' if cnt = 0 then read until carriage-return or 0

FUNCTION SERIN (pin, bd, posTrue, INcnt, BYREF INlist as string) 

	DIM  ch AS INTEGER
	DIM  timeout AS INTEGER
	DIM  j AS INTEGER
	
	if posTrue then lastNegTrue = 0 else lastNegTrue = 1
	bbBAUD(pin) = bd
	
	timeout = 0
	ch = 0
	j = 0
	do 
		ch = bbRXD(pin)
		if ch = -1 then 
			INlist(j) = 255
			j = j+1
			timeout = -1
			exit
		endif
		
		if (INcnt = 0) then
			if ch = 0 then exit
 #ifndef TERMINATE_ON_0_ONLY				
			if CR = ch or LF = ch then exit
 #endif
			
		endif

		INlist(j) = ch		
		j = j+1
	until j = INcnt
	
	INlist(j) = 0
	
	return timeout
END FUNCTION


' send a single character

SUB bbTXD(pin, ch)
	DIM  start AS INTEGER
	DIM  i AS INTEGER

	if (lastSERpin-1 <> pin) then
		lastSERpin = pin+1
		OUTPUT (pin)
		lastBitTime = ( 2000000 / bbBAUD(pin) + 1) >>1	' round the value up gets within 3% for 115Kb
	endif		
	
	ch = (ch<<1) + $600		' add start and stop bit  -- 2 stop bits needed??, no but have to wait for 1 to go out
	if lastNegTrue then ch = not ch

	INTERRUPT (0)
	
	i = 1		
	
	while i < $800
		OUT (pin) = ch and i
				
	   	i = i << 1
	    
		waitmicro(lastBitTime) 
	loop
	
	INTERRUPT (1)

END SUB

' if cnt = 0 then write until carriage-return or 0

SUB SEROUT( pin, bd, posTrue, cnt, BYREF s AS STRING)

	DIM  j AS INTEGER
		
	if posTrue then lastNegTrue = 0 else lastNegTrue = 1
	bbBAUD(pin) = bd

	j = 0
	
	do
		if cnt = 0 then
			if s(j) = 0 then exit
		endif
		bbTXD(pin, s(j))
		
		j=j+1
		
	until j = cnt
	
END SUB

jumpAroundSerial:


#endif
