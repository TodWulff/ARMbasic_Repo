'========================================================================================
'
'	Hardware Interface --  I2C routines
'
'	initialization code or #defines for speed setting
'
'		copyright Coridium Corp, 2012,   may be used with this notice
'========================================================================================

#ifndef USE_I2C
#define USE_I2C


#ifndef CR
	#define CR	13
	#define	LF	10
#endif


goto JumpAroundI2C

#ifdef I2Cspeed100
	#define I2CwaitTime	5
#elif defined I2Cspeed50
	#define I2CwaitTime	10
#else
	#define I2CwaitTime	3		
#endif


SUB I2Cwait
	dim start as integer
	start = TIMER
	while (TIMER - start) < I2CwaitTime
	loop
END SUB


SUB waitCLKstretch (SCLpin)    ' this routine is called to support slave clock stretching
	while (IN(SCLpin) = 0)
	loop
	I2Cwait
END SUB


SUB i2c_start (SDApin, SCLpin) 
	DIM start as integer
	
	INPUT (SDApin)						' allow them to float
	INPUT (SCLpin)
	I2Cwait
	
	IO(SDApin) = 0
	I2Cwait
	
	IO(SCLpin) = 0
END SUB


SUB i2c_stop (SDApin, SCLpin) 
	IO(SDApin) = 0

	INPUT (SCLpin)			' release SCL high
	I2Cwait
	INPUT (SDApin)			' release SDA high
END SUB


' shift out 8 bits, return ACK, leave SCL low, SDA float 

FUNCTION i2c_shift ( SDApin, SCLpin, value) 	' returns TRUE when ACK'd
	DIM i as integer
	
	i=&H80
	while i 
		IO(SCLpin) = 0
		I2Cwait
		if (i and value ) then INPUT (SDApin) else IO(SDApin)=0
		INPUT (SCLpin)		' release SCL high
		waitCLKstretch (SCLpin)
		i = i >> 1
	loop
	
	IO(SCLpin) = 0
	INPUT (SDApin)			' let SDA float
	I2Cwait
	INPUT (SCLpin)			' release SCL high
	waitCLKstretch (SCLpin)

	i = IN(SDApin)			' check ACK here (save value in i, 0 was ACK'd
	
	IO(SCLpin) = 0

	return i=0			' was it ACK'd	
END FUNCTION

' the following does the writes to the i2c, but does not do a STOP

FUNCTION send_i2cout (SDApin, SCLpin, addr, OUTcnt, BYREF OUTlist as string) 
	DIM itsOK as integer
	DIM i AS INTEGER

	i2c_start(SDApin, SCLpin)
	itsOK = i2c_shift(SDApin, SCLpin, addr & 0xfe)
	i = 0
	
	if (itsOK) then
		do
			if OUTcnt < 0 then exit
			if OUTcnt = 0 then
				if OUTlist(i) = 0 then exit
			endif
			if (i2c_shift(SDApin, SCLpin, OUTlist(i)) = 0) then
				itsOK = 0
				exit
			endif
			i=i+1
		
		until i = OUTcnt
	endif
	
	return itsOK
END FUNCTION


' returns 1 if i2c device responding

FUNCTION I2COUT (SDApin, SCLpin, addr, OUTcnt, BYREF OUTlist as string) 
	DIM itsOK as integer
	
	itsOK = send_i2cout (SDApin, SCLpin, addr, OUTcnt, OUTlist) 
	
	i2c_stop(SDApin, SCLpin)
	return itsOK
END FUNCTION

' set OUTcnt to -1 to only send an address

SUB I2CIN ( SDApin, SCLpin, addr, OUTcnt, BYREF OUTlist as string, INcnt, BYREF INlist as string) 
	DIM itsOK as integer	' also set to 0 when last data sent
	DIM value as integer
	DIM i as integer
	DIM j as integer
	
	itsOK = 1
	if OUTcnt >= 0 then
		itsOK = send_i2cout (SDApin, SCLpin, addr, OUTcnt, OUTlist) 
	endif
	
	if (itsOK) then

		i2c_start(SDApin, SCLpin)
		i = 0
		if (i2c_shift(SDApin, SCLpin, addr or 1)) then		' read this time
			while 1
				value = 0
				j = &H80
				while j
					IO(SCLpin) = 0
					I2Cwait
					INPUT (SCLpin)		' release SCL high
					I2Cwait
					value = (IN(SDApin) and  j) + value
					j = j >> 1
				loop

				if INcnt = 0 then 
					if value = 0 then exit
 #ifndef TERMINATE_ON_0_ONLY				
					if value = CR or value = LF then exit
 #endif
				endif
				
				INlist(i) = value
				i = i+1
				if i = INcnt then exit
								
				IO(SCLpin) = 0
'				master (me would ACK here for a sequenctial read				
				IO(SDApin) = 0
				I2Cwait
				INPUT (SCLpin)			' release SCL high
				I2Cwait
		
				IO(SCLpin) = 0
				INPUT (SDApin)			' release SDA high  

			loop						' internal checks exit this loop
			IO(SCLpin) = 0
			I2Cwait
			INPUT (SCLpin)			' release SCL high  -- this time with no ACK
			I2Cwait
			IO(SCLpin) = 0
			
		endif
	endif
	
	INlist(i) = 0
	
	i2c_stop(SDApin, SCLpin)
	
END SUB


JumpAroundI2C:

#endif
