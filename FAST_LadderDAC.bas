#include "__LIB\AB_Extensions.lib"


#define _DAC_B0			24   '
#define _DAC_B1			25   '
#define _DAC_B2			26   '
#define _DAC_B3			27   '

#define _ADC_Port		2

#define _ADC_Scalar		65472
#define _ADC_Vmin		0.0
#define _ADC_Vmax		3.3

#define _DAC_Loops		47	' set to multiples of 16 -1 to get multiple waveforms to trigger and capture on the scope

function volts (i as integer) as single
	return  1.0*(i/_ADC_Scalar*(_ADC_Vmax-_ADC_Vmin))
	endfunction

MAIN:
dim i as integer
dim start as integer
dim t_buffer(_DAC_Loops) as integer
dim v_buffer(_DAC_Loops) as integer

PRINT "STARTING APP ..."

i=-1

OUTPUT(_DAC_B0)
OUTPUT(_DAC_B1)
OUTPUT(_DAC_B2)
OUTPUT(_DAC_B3)

start = timer

DO
	
	i+=1
	
	if ((i MOD 16)=0) then print
	
	BIT2IO(i,0,_DAC_B0)
	BIT2IO(i,1,_DAC_B1)
	BIT2IO(i,2,_DAC_B2)
	BIT2IO(i,3,_DAC_B3)
	
	t_buffer(i) = timer-start
	v_buffer(i) = ad(_ADC_Port)
	
	if i = _DAC_Loops  ' we've met the limit, dump the data now and exit
		for i=0 to _DAC_Loops
			print i;": ";t_buffer(i);"mS - ";volts(v_buffer(i));" VDC"
			if (((i+1) mod 16)=0) then print
		next i
		exit
	endif

	if (((i+1) mod 16)=0) then start=timer ' if we're going to start a new cycle, zero the timer reference

	loop

	END
