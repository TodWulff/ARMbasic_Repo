'========================================================================================
'
'	Shift Functions
'
'	no initialization code
'
'		copyright Coridium Corp, 2012,   may be used with notice
'========================================================================================
#ifndef USE_SHIFTS
#define USE_SHIFTS

#define	MAXshiftARRAY	10

DIM OUTlist(MAXshiftARRAY)		' save the value to shifted out
DIM INlist(MAXshiftARRAY)		' save the value to shifted in
DIM shiftCounts(MAXshiftARRAY)		' bit counts to generate each value (0 assumed to be 8 bits), 1-32 allowed


goto jumpAroundShifts

#ifdef	SHIFTclkNEGATIVE 
	#define SHIFTclkACTIVE	OUT(scl_pin)=0
	#define SHIFTclkIDLE	OUT(scl_pin)=1
#else
	#define SHIFTclkACTIVE	OUT(scl_pin)=1
	#define SHIFTclkIDLE	OUT(scl_pin)=0
#endif


SUB SHIFTOUT (sdo_pin, scl_pin, isLSBfirst, cnt) 		' mode = 0 isLSBfirst, cnt is the number of elements
	DIM i as INTEGER
	DIM j as INTEGER
	DIM value as INTEGER
	DIM bits as INTEGER

	IO(sdo_pin) = 0				' set the pin low and output
	SHIFTclkIDLE
	OUTPUT (scl_pin)			' initial condition drive them low
	OUTPUT (sdo_pin)			' initial condition drive them low
	
	j = 0
	do
		value = OUTlist(j)
		bits = shiftCounts(j) -1
		if (bits < 0) then bits = 7
		if isLSBfirst then 
			for i=0 to bits
				OUT (sdo_pin) = ((1 << i) and value) 
				SHIFTclkACTIVE
				SHIFTclkIDLE
			next i
		else 	
			for i=bits downto 0
				OUT (sdo_pin) = ((1 << i) and value)
				SHIFTclkACTIVE
				SHIFTclkIDLE
			next i
		end if
		j = j+1
	until j >= cnt
END SUB



SUB SHIFTIN (sdo_pin, scl_pin, isLSBfirst, cnt) 		' cnt is the number of elements
	DIM i as INTEGER
	DIM j as INTEGER
	DIM value as INTEGER
	DIM bits as INTEGER

	INPUT (sdo_pin)		
	SHIFTclkIDLE
	OUTPUT (scl_pin)				' initial condition drive them idle

	j = 0
	do 
		value = 0
		bits = shiftCounts(j) -1
		if (bits < 0) then bits = 7
		
		if isLSBfirst then 
			for i=0 to bits
	#ifdef SHIFTpreSample			
				if IN(sdo_pin) then value = (1 << i) + value
				SHIFTclkACTIVE
				SHIFTclkIDLE
	#else				
				SHIFTclkACTIVE
				SHIFTclkIDLE
				if IN(sdo_pin) then value = (1 << i) + value
	#endif				
			next i
		else			
			for i=bits downto 0
	#ifdef SHIFTpreSample			
				if IN(sdo_pin) then value = (1 << i) + value
				SHIFTclkACTIVE
				SHIFTclkIDLE
	#else
				SHIFTclkACTIVE
				SHIFTclkIDLE
				if IN(sdo_pin) then value = (1 << i) + value
	#endif				
			next i
		endif
		
		INlist (j) = value
		j = j+1
	until j >= cnt
END SUB

' SHIFTBI is untested
#warning SHIFTBI is untested

SUB SHIFTBI (sdi_pin, scl_pin, sdo_pin, isLSBfirst, cnt) 
	DIM i as INTEGER
	DIM j as INTEGER
	DIM value as INTEGER
	DIM bitlength as INTEGER
	
	IO(sdo_pin) = 0				' set the pin low and output
	SHIFTclkIDLE
	OUTPUT (scl_pin)			' initial condition drive them low
	OUTPUT (sdo_pin)			' initial condition drive them low
	
	j = 0
	DO 
		value = 0
		bitLength = shiftCounts(j)
		if (bitLength = 0) then bitLength = 8
		if (isLSBfirst) then									' LSB first
			FOR i=0 TO bitLength-1
	#ifdef SHIFTpreSample			
				IN(sdo_pin) = OUTlist(j) and (1 << i)
				value =  value or (IN(sdi_pin) and (1 << i))		'  pre mode
				SHIFTclkACTIVE
				SHIFTclkIDLE
	#else				
				IN(sdo_pin) = OUTlist(j) and (1 << i)
				SHIFTclkACTIVE
				SHIFTclkIDLE
				value =  value or (IN(sdi_pin) and (1 << i))		'  post mode
	#endif				
			NEXT i
		ELSE  											' MSB first
			FOR i = bitLength-1 DOWNTO 0
	#ifdef SHIFTpreSample			
				IN(sdo_pin) = OUTlist(j) and (1 << i)
				value =  value or (IN(sdi_pin) and (1 << i))		'  pre mode
				SHIFTclkACTIVE
				SHIFTclkIDLE
	#else				
				IN(sdo_pin) = OUTlist(j) and (1 << i)
				SHIFTclkACTIVE
				SHIFTclkIDLE
				value =  value or (IN(sdi_pin) and (1 << i))		'  post mode
	#endif				
			NEXT i
		END IF
		INlist (j) = value
		j= j+1
	UNTIL j >= cnt
END SUB


jumpAroundShifts:

#endif
