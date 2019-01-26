'========================================================================================
'
'	PULSE Functions
'
'	no initialization code
'
'		copyright Coridium Corp, 2008,   may be used with Coridium Hardware or licensees
'========================================================================================
#ifndef USE_PULSE
#define USE_PULSE

#ifdef V6FIRMWARE		' define this when using firmware prior to version 7
	#define COUNT  	doCOUNT
	#define PULSIN 	doPULSIN
	#define PULSOUT	doPULSOUT
	#define RCTIME 	doRCTIME
	#define PWM    	doPWM
#endif

goto JumpAroundPULSE


' count pulses on pin for duration milliseconds

FUNCTION COUNT (pin, duration)
	DIM cnt AS INTEGER
	DIM start AS INTEGER
	DIM state AS INTEGER
	DIM newstate AS INTEGER
	
	INPUT(pin)
	state = IN(pin)
	
	duration = duration *1000
	start = TIMER
	cnt = 0
	
	while (TIMER-start) < duration)
		newstate = IN(pin)
		if (state <> newstate) then
			cnt = cnt + 1
			state = newstate
		endif
	loop
	
	return (cnt+1)>>1	' transitions were counted to pules = that divided by 2

END FUNCTION


' PULSIN measures the time pin pulsewidth in state

FUNCTION PULSIN (pin, state)
	DIM start AS INTEGER
	
	INPUT(pin)
	
	start = TIMER

	' while with single element take 0.2 uS,  with a compare 2 uS per loop
	' the timeout check takes about 0.6 uS
		
	if (state) then
		'  if pin is already in this state wait for a transition for 1 second
		while in(pin)
			if (TIMER - start) > 1000000 then return 0
		loop
		'  now wait for pin to become state 
		do
			if (TIMER - start) > 1000000 then return 0
		until in(pin)
		start = TIMER
		while in(pin)
			if (TIMER - start) > 1000000 then return 0
		loop
	else 
		'  if pin is already in this state wait for a transition for 1 second
		do
			if (TIMER - start) > 1000000 then return 0
		until in(pin)
		'  now wait for pin to become state 
		while in(pin)
			if (TIMER - start) > 1000000 then return 0
		loop
		start = TIMER
		do
			if (TIMER - start) > 1000000 then return 0
		until in(pin)
	
	end if	
		
	return (TIMER - start)			' return duration

END FUNCTION


' PULSOUT changes the state of pin for duration microseconds

SUB PULSOUT (pin, duration)

	OUTPUT(pin)
	
	INTERRUPT(0)
	
	OUT(pin) = NOT IN(pin)
	waitmicro( duration )
	
	OUT(pin) = NOT IN(pin)
	INTERRUPT(1)
	
END SUB


' RCTIME measures the time pin stays in state

FUNCTION RCTIME (pin, state)
	DIM start AS INTEGER
	DIM last AS INTEGER
	
	INPUT(pin)
	
	start = TIMER
	
	if state <> 0 then state = -1	' make sure non-zero state is -1

	'  if pin is not in this state return -1
	
	if IN(pin) <> state then return -1
	while state <> IN(pin) 
		if (TIMER - start) > 1000000 then return 0
	loop

	'  now wait for pin to leave state 
		
	INTERRUPT(0)	
	#ifdef ST_CTRL
	ST_CTRL OR= 2		' re-enable SysTick interrupt
	#endif
	
	while state = IN(pin)
		if (TIMER - start) > 1000000 then
			INTERRUPT(1)
			return 0
		end if
	loop
	last = TIMER
	
	INTERRUPT(1)	
	return (last - start)			' return duration

END FUNCTION

' on pin for time (msec) do bit-banged PWM of duty cycle (0-255) 

SUB PWM (pin, duty, timeperiod)
	DIM i as INTEGER
	DIM start AS INTEGER

	OUTPUT (pin)
	duty = duty & 0xFF
	
	if(duty) then OUT(pin) = 1 else OUT(pin) = 0

	INTERRUPT(0)
	#ifdef ST_CTRL
	ST_CTRL OR= 2		' re-enable SysTick interrupt
	#endif
	
	timeperiod = timeperiod * 1000
	start = TIMER		
			
	if (duty=0 OR duty=255) then		' check always high or low
		waitmicro(timeperiod) 
	else
		while ((TIMER - start) < timeperiod) 
			i = duty
			while (i)
				i = i - 1
			loop
			OUT(pin) = 0
			i = 256-duty
			while (i)
				i = i - 1
			loop
			OUT(pin) = 1
		loop
	endif
	
	INTERRUPT(1)
	
	INPUT (pin)		' allow pin to float
END SUB

JumpAroundPULSE:

'#undef COUNT
'#undef PULSIN
'#undef PULSOUT
'#undef RCTIME
'#undef PWM

#endif
