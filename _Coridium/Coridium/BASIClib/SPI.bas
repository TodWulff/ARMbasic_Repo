'========================================================================================
'
'	Hardware Interface --  SPI routines
'
'
'		copyright Coridium Corp, 2008,   may be used with Coridium Hardware or licensees
'========================================================================================
#ifndef USE_SPI
#define USE_SPI


#ifndef CR
	#define CR	13
	#define	LF	10
#endif


#ifdef	SPIclkNEGATIVE 
	#define SPIclkACTIVE	OUT(CLKpin)=0
	#define SPIclkIDLE		OUT(CLKpin)=1
#else
	#define SPIclkACTIVE	OUT(CLKpin)=1
	#define SPIclkIDLE		OUT(CLKpin)=0
#endif


goto JumpAroundSPI


SUB SPIshiftOut (CLKpin, OUTpin, outByte, isLSBfirst) 
	DIM i as integer

	if (isLSBfirst) then		' LSB first
		i = 1
		while i and $ff
			OUT(OUTpin)=(i and outByte)
			SPIclkACTIVE
			SPIclkIDLE
			i = i << 1
		loop
	else					' MSB first
		i = $80
		while i
			OUT(OUTpin)=(i and outByte)
			SPIclkACTIVE
			SPIclkIDLE
			i = i >> 1
		loop
	endif
END SUB


SUB SPIIN (CSpin, INpin, CLKpin, OUTpin, isLSBfirst, OUTcnt, BYREF OUTlist as STRING, INcnt, BYREF INlist as STRING)
	DIM i as integer
	DIM j as integer
	DIM value as integer

	if CSpin >= 0 then IO(CSpin)=1		' set the CSpin as output and 1

	SPIclkIDLE
	OUTPUT (CLKpin)
	INPUT  (INpin)
	
	if CSpin >= 0 then OUT(CSpin)=0
	
	i=0

	if OUTcnt >= 0 then	
		OUTPUT (OUTpin)
		do
			if OUTcnt = 0 then
				if OUTlist(i) = 0 then exit
			endif
			SPIshiftOut( CLKpin, OUTpin, OUTlist(i), isLSBfirst)
			i=i+1
		
		until i = OUTcnt
	endif

	INPUT	(INpin)		' this allows INpin and OUTpin to be the same
	
	i = 0
	if (isLSBfirst) then			' LSB first
		do 
			value = 0
			j = 1
			while j and $ff
	  #ifdef SPIpreSample			
				if (IN(INpin)) then value = value or j
				SPIclkACTIVE
				SPIclkIDLE
	  #else
				SPIclkACTIVE
				SPIclkIDLE
				if (IN(INpin)) then value = value or j
	  #endif				
				j = j << 1
			loop
			if INcnt = 0 then 
				if value = 0 then exit
 #ifndef TERMINATE_ON_0_ONLY				
				if value = CR or value = LF then exit
 #endif
			endif
			INlist(i) = value
			i = i+1
		until i = INcnt
	else 							' MSB first
		do 
			value = 0
			
			j = $80
			while j
	  #ifdef SPIpreSample			
				if (IN(INpin)) then value = value or j
				SPIclkACTIVE
				SPIclkIDLE
	  #else
				SPIclkACTIVE
				SPIclkIDLE
				if (IN(INpin)) then value = value or j
	  #endif				
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
		until i = INcnt
	endif
	
	INlist(i) = 0
	
	if CSpin >= 0 then OUT(CSpin)=1
	
END SUB



SUB SPIOUT (CSpin, CLKpin, OUTpin, isLSBfirst, OUTcnt, BYREF OUTlist AS STRING)
	DIM i AS INTEGER
	
	if CSpin >= 0 then IO(CSpin)=1		' set the CSpin as output and 1

	SPIclkIDLE
	OUTPUT (OUTpin)
	OUTPUT (CLKpin)

	if CSpin >= 0 then OUT(CSpin)=0
	
	i = 0
	do
		if OUTcnt = 0 then
			if OUTlist(i) = 0 then exit
		endif
		SPIshiftOut( CLKpin, OUTpin, OUTlist(i), isLSBfirst)
		i=i+1
		
	until i = OUTcnt
	
	if CSpin >= 0 then OUT(CSpin)=1

END SUB



SUB SPIBI (CSpin, INpin, CLKpin, OUTpin, isLSBfirst, BIcnt, BYREF OUTlist as STRING, BYREF INlist as STRING) 
	DIM i as integer
	DIM j as integer
	DIM value as integer

	if CSpin >= 0 then IO(CSpin)=1

	SPIclkIDLE
	OUTPUT (CLKpin)
	INPUT  (INpin)
	
	if OUTpin >= 0 then OUTPUT (OUTpin)
	
	if CSpin >= 0 then OUT(CSpin)=0
	
	i = 0
	if (isLSBfirst) then			' LSB first
		do 
			value = 0
			j = 1
			while j and $ff
				OUT(OUTpin)=(OUTlist(i) and j)
	  #ifdef SPIpreSample			
				if (IN(INpin)) then value = value or j
				SPIclkACTIVE
				SPIclkIDLE
	  #else
				SPIclkACTIVE
				SPIclkIDLE
				if (IN(INpin)) then value = value or j
	  #endif				
				j = j << 1
			loop
			INlist(i) = value
			i = i+1
		until i = BIcnt
	else 							' MSB first
		do 
			value = 0
			j = $80
			while j
				OUT(OUTpin)=(OUTlist(i) and j)
	  #ifdef SPIpreSample			
				if (IN(INpin)) then value = value or j
				SPIclkACTIVE
				SPIclkIDLE
	  #else
				SPIclkACTIVE
				SPIclkIDLE
				if (IN(INpin)) then value = value or j
	  #endif				
				j = j >> 1
			loop
			INlist(i) = value
			i = i+1
		until i = BIcnt
	endif
	
	INlist(i) = 0
	
	if CSpin >= 0 then OUT(CSpin)=1
	
END SUB

JumpAroundSPI:

'#undef SPIIN
'#undef SPIBI
'#undef SPIOUT

#endif
