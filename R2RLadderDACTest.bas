#include "__LIB\AB_Extensions.lib"


#define _DAC_B0			24	' pins 13 to 16 on the LPC824-DIP package
#define _DAC_B1			25	' 
#define _DAC_B2			26	' 
#define _DAC_B3			27	' 

#define _ADC_Port		2	' this is pin 22 on the LPC824-DIP package

#define _ADC_Scalar		65472	' magic number pursuant to AB help docs
#define _ADC_Vmin		0.0		' voltage at MCU pin 20 (Vrefn) per LPC824-DIP schematic
#define _ADC_Vmax		3.3		' voltage at MCU pin 21 (Vrefp) per LPC824-DIP schematic

#define _DAC_Loops		47	' set to multiples of 16 -1 to get multiple waveforms to trigger and capture on the scope
							' 0-47 is 3 cycles of a 4 bit ladder dac range...

'for use during data dump
function volts (i as integer) as single
	return  1.0*(i/_ADC_Scalar*(_ADC_Vmax-_ADC_Vmin))
	endfunction

MAIN:
dim i as integer
dim start as integer
dim t_buffer(_DAC_Loops) as integer
dim v_buffer(_DAC_Loops) as integer
dim s_buffer(15) as single

PRINT "STARTING APP ..."


OUTPUT(_DAC_B0)		' set as outputs, in case OUT is to be used
OUTPUT(_DAC_B1)
OUTPUT(_DAC_B2)
OUTPUT(_DAC_B3)


i=-1
start = timer

DO		' 36.5955659uS total loop time
	
	i+=1	' 1.734080us per index decrement  1.767424us per index increment  1.767424us per index increment
	
	if ((i MOD 16)=0) then print	' 3.899546us per unsatisfied inline conditional
	
	' the Bit2IO 'function' that follows is a preprocessor macro that is expanded using the AB_Extensions.lib #include
		'
		' #define BITTEST(REG,BIT)  		(1 and ((REG AND (1 << BIT)) >> BIT))		' RETURNS A 1 IF SET,0 IF CLR
		' #define BIT2IO(REG,BIT,PORT)		IO(PORT) = BITTEST(REG,BIT)		' SETS PORT TO BIT IN REG
		' 		consider:
		' BIT2IO(REG,BIT,PORT)
		' 		expands to
		' IO(PORT) = BITTEST(REG,BIT)
		' 		which finally expands to
		' IO(PORT) = (1 and ((REG AND (1 << BIT)) >> BIT))
		' 
		' this is an approach from the old me from 10 years ago - some room for improvement...
		'preprocessor macro expands to: IO(24) = (1 and ((i AND (1 << 0)) >> 0))  which takes some 4 uS on an LPC824
	BIT2IO(i,0,_DAC_B0)		' 4.149393us per BIT2IO(reg,bit,port)
	BIT2IO(i,1,_DAC_B1)		' 4.149391us per BIT2IO(reg,bit,port)
	BIT2IO(i,2,_DAC_B2)		' 4.149391us per BIT2IO(reg,bit,port)
	BIT2IO(i,3,_DAC_B3)		' 4.149391us per BIT2IO(reg,bit,port)
	
	t_buffer(i) = timer-start		' 2.932732us 2.932733us 2.932734us per var=timer-start
	v_buffer(i) = ad(_ADC_Port)		' 6.866112us 6.866111us 6.866113us per var=ad(_ADC_Port)
	
	' 4+4+4+3+6 (b1, b2, b3, t_buff, and adc read) is 21uS, which coincides with the analog blips I see here: 
	' https://i.imgur.com/0J5UIJN.png 21us after b0 is set, the blips happen
	
	if i = _DAC_Loops  ' we've met the limit, dump the data now and exit  
						' 0.9993199us per unsatisfied conditional w/ guts
		for i=0 to _DAC_Loops
			print i;": ";t_buffer(i);"µS - ";volts(v_buffer(i));" VDC"
			if (((i+1) mod 16)=0) then print
		next i
		' OUT(_DAC_B0)=0
		' OUT(_DAC_B1)=0
		' OUT(_DAC_B2)=0
		' OUT(_DAC_B3)=0
		exit
	endif

	if (((i+1) mod 16)=0) then start=timer ' if we're going to start a new cycle, 
											' zero the timer display reference
											' 3.999541us per unsatisfied inline conditional

	loop									' 0.834062 loop overhead

	END
