'========================================================================================
'
'	Frequency Out Functions
'
'	required initialization code
'
'		copyright Coridium Corp, 2008,   may be used with Coridium Hardware or licensees
'========================================================================================
#ifndef USE_FREQOUT
#define USE_FREQOUT

DIM sin_val(127) as string		

#define SIN(x)			sin_tbl(x)
#define Sin(x)			sin_tbl(x)
#define sin(x)			sin_tbl(x)
#define COS(x)			sin_tbl(x+64)
#define Cos(x)			sin_tbl(x+64)
#define cos(x)			sin_tbl(x+64)

goto jumpAroundFreqout

SUB INIT_FREQOUT
' working for up to about 5KHz

' clunky but no escape sequences for strings in VB

sin_val = 			chr(1)+chr(3)+chr(6)+chr(9)+chr(12)+chr(16)+chr(19)+chr(22)

'sin_val = sin_val+	chr(25)+chr(28)+chr(31)+chr(34)+chr(37)+chr(40)+chr(43)+chr(46)
'sin_val = sin_val+	chr(49)+chr(51)+chr(54)+chr(57)+chr(60)+chr(63)+chr(65)+chr(68)
'sin_val = sin_val+	chr(71)+chr(73)+chr(76)+chr(78)+chr(81)+chr(83)+chr(85)+chr(88)
'sin_val = sin_val+	chr(90)+chr(92)+chr(94)+chr(96)+chr(98)+chr(100)+chr(102)+chr(104)
'sin_val = sin_val+	chr(106)+chr(107)+chr(109)+chr(111)+chr(112)+chr(113)+chr(115)+chr(116)
'sin_val = sin_val+	chr(117)+chr(118)+chr(120)+chr(121)+chr(122)+chr(122)+chr(123)+chr(124)
'sin_val = sin_val+	chr(125)+chr(125)+chr(126)+chr(126)+chr(126)+chr(127)+chr(127)+chr(127)
sin_val = sin_val+	chr(25)+chr(28)+chr(31)+chr(34)+"%(+.1369<?ADGILNQSUXZ\^`bdfhjkmopqstuvxyzz{|}}~~~"
sin_val = sin_val+	chr(127)+chr(127)+chr(127)+chr(127)
sin_val = sin_val+	chr(127)+chr(127)+chr(127)+"~~~}}|{zzyxvutsqpomkjhfdb`^\ZXUSQNLIGDA?<9631.+(%"
sin_val = sin_val+  chr(34)+chr(31)+chr(28)+chr(25)+chr(22)+chr(19)+chr(16)+chr(12)+chr(9)+chr(6)

sin_val(0) = 0			' patch the 0 value
sin_val(127) = 3		' patch the last value

END SUB

FUNCTION sin_tbl(x)
	x = x and 255
	
	if x<128 then 						
		x = sin_val(x)		
	else
		x = -sin_val(x-128)
	endif
	
	return x
	
END FUNCTION


'#define FACTOR	1000000
#define FACTOR	950000
#define PWM_INTERVAL 26

SUB FREQOUT(pin, duration, freq1, freq2)
	DIM start as integer
	DIM period1 as integer
	DIM period2 as integer
	DIM freq1Interval as integer
	DIM freq2Interval as integer
	DIM i as integer
	DIM j as integer
	
	freq2Interval = 0
	freq1Interval = 0
	if (freq2 = 0) then freq2 = freq1	' divide by 0 not nice
	period1 = FACTOR/freq1			' DIV
	period2 = FACTOR/freq2			' DIV adjust for calculation overhead
	
	OUTPUT (pin)					' enable the output

	INTERRUPT (0)

	duration = duration * 1000
	start = TIMER
	
	while ((TIMER - start) < duration) 

		OUT (pin) = 0
	
		i = (sin_tbl ((freq1Interval << 8)/ period1) + sin_tbl ((freq2Interval << 8)/ period2) + 256) >> 4

'		print i, freq1Interval, freq2Interval, sin_tbl ((freq1Interval << 8)/ period1), sin_tbl ((freq2Interval << 8)/ period2)
	
		j = i
		while j
			j = j-1
		loop
		OUT (pin) = 1
		
		j = 32-i
		while j
			j = j-1
		loop
		
		freq1Interval = (freq1Interval + PWM_INTERVAL) MOD period1
		freq2Interval = (freq2Interval + PWM_INTERVAL) MOD period2
	loop
	
	INTERRUPT (1)
	
	INPUT (pin)
	
END SUB

jumpAroundFreqout:

INIT_FREQOUT		' inline execute this if no MAIN, or must be called when there is a MAIN:

#endif