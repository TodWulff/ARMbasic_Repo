'========================================================================================
'
'	Hardware Interface --  SPI routines
'
'		copyright Coridium Corp, 2008,   may be used with Coridium Hardware or licensees
'
' *** 21Nov08: Modified by Tod Wulff ***
'
' Added in 'CS Stall' functionality to optionally allow user code to slow SPI comms by
' providing a user-configurable delay between pulling CS low and start of bus activity.
'
' Leave spi_cs_stall_time not #defined to remove the delay, or #define it in the user
' code before #include'g this lib file, to impute a delay.
'
' if #def'd to 0 then delay = loop overhead only.  
' If #def'd to > 0 then delay = #def val plus loop overhead (in uS)  i.e.:
'
' #define spi_cs_stall_time 2		'impute a 2uS (+ call overhead) delay from pulling cs
	'								'low before allowing more activity on the bus
' [#define SPIpreSample]			'optional based on slave specs (uM-FPU requires this)
' #include <spi.bas>				'includes this file in the user app code
'
'========================================================================================
#ifndef USE_SPI
#define USE_SPI

#define ~~

' #ifdef V6FIRMWARE		' define this when using firmware prior to version 7
	' #define SPIIN		doSPIIN
	' #define SPIBI		doSPIBI
	' #define SPIOUT		doSPIOUT
' #endif

#ifndef CR
	#define CR	13
	#define	LF	10
#endif

#ifdef	SPIclkNEGATIVE 
	#define SPIclkACTIVE	LOW CLKpin
	#define SPIclkIDLE		HIGH CLKpin
#else
	#define SPIclkACTIVE	HIGH CLKpin
	#define SPIclkIDLE		LOW CLKpin
#endif


goto JumpAroundSPI

#ifdef spi_cs_stall_time
	#define spi_cs_stall spi_cs_stall_loop
#else
	#define spi_cs_stall
	#define spi_cs_stall_time	1		
#endif

sub spi_cs_stall_loop
	dim start as integer
	start = TIMER
	while (TIMER - start) < spi_cs_stall_time
	loop
ENDSUB

SUB SPIshiftOut (CLKpin, OUTpin, outByte, LSBfirst) 
	DIM i as integer
	if (LSBfirst) 		' LSB first
		i = 1
		while i and $ff
			if (i and outByte) then HIGH OUTpin else LOW OUTpin ~~
			SPIclkACTIVE
			SPIclkIDLE
			i = i << 1
		loop
	else					' MSB first
		i = $80
		while i
			if (i and outByte) then HIGH OUTpin else LOW OUTpin
			SPIclkACTIVE
			SPIclkIDLE
			i = i >> 1
		loop
	endif
ENDSUB


SUB SPIIN (CSpin, INpin, CLKpin, OUTpin, LSBfirst, OUTcnt, BYREF OUTlist as STRING, INcnt, BYREF INlist as STRING)
	DIM i as integer
	DIM j as integer
	DIM value as integer

	if CSpin >= 0 then 
		OUTPUT CSpin
		HIGH CSpin	
	endif		

	SPIclkIDLE
	OUTPUT CLKpin
	INPUT  INpin
	
	if CSpin >= 0 then
		LOW CSpin
		spi_cs_stall
	endif
	
	i=0
	if OUTcnt >= 0 then	
		OUTPUT OUTpin
		do
			if OUTcnt = 0 then
				if OUTlist(i) = 0 then exit
			endif
			SPIshiftOut( CLKpin, OUTpin, OUTlist(i), LSBfirst)
			i=i+1
		
		until i = OUTcnt
	endif

	INPUT	INpin		' this allows INpin and OUTpin to be the same
	
	i = 0
	if (LSBfirst) then			' LSB first
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
	
	if CSpin >= 0 then HIGH CSpin
	
ENDSUB



SUB SPIOUT (CSpin, CLKpin, OUTpin, LSBfirst, OUTcnt, BYREF OUTlist AS STRING)
	DIM i AS INTEGER
	
	if CSpin >= 0 then 
		OUTPUT CSpin
		HIGH CSpin	
	endif		

	SPIclkIDLE
	OUTPUT OUTpin
	OUTPUT CLKpin

	if CSpin >= 0 then
		LOW CSpin
		spi_cs_stall
	endif
	
	i = 0
	do
		if OUTcnt = 0 then
			if OUTlist(i) = 0 then exit
		endif
		SPIshiftOut( CLKpin, OUTpin, OUTlist(i), LSBfirst)
		i=i+1
		
	until i = OUTcnt
	
	HIGH CSpin

ENDSUB



SUB SPIBI (CSpin, INpin, CLKpin, OUTpin, LSBfirst, BIcnt, BYREF OUTlist as STRING, BYREF INlist as STRING) 
	DIM i as integer
	DIM j as integer
	DIM value as integer

	if CSpin >= 0 then 
		OUTPUT CSpin
		HIGH CSpin	
	endif		

	SPIclkIDLE
	OUTPUT CLKpin
	INPUT  INpin
	
	if OUTpin >= 0 then OUTPUT OUTpin
	
	if CSpin >= 0 then
		LOW CSpin
		spi_cs_stall
	endif
	
	i = 0
	if (LSBfirst) then			' LSB first
		do 
			value = 0
			j = 1
			while j and $ff
				if (OUTlist(i) and j) then HIGH OUTpin else LOW OUTpin
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
				if (OUTlist(i) and j) then HIGH OUTpin else LOW OUTpin
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
	
	if CSpin >= 0 then HIGH CSpin
	
ENDSUB

JumpAroundSPI:

'#undef SPIIN
'#undef SPIBI
'#undef SPIOUT

#endif

