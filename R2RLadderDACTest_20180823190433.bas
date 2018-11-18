#define _DAC_B0			24	' pins 13 to 16 on the LPC824-DIP package
#define _DAC_B1			25	' 
#define _DAC_B2			26	' 
#define _DAC_B3			27	' 

#define _ADC_Port		2	' this is pin 22 on the LPC824-DIP package

#define _ADC_Scalar		65472	' magic number pursuant to AB help docs
#define _ADC_Vmin		0.0		' voltage at MCU pin 20 (Vrefn) per LPC824-DIP schematic
#define _ADC_Vmax		3.3		' voltage at MCU pin 21 (Vrefp) per LPC824-DIP schematic

#define _DAC_Loops		495	' set to multiples of 16 -1 to get multiple waveforms to trigger and capture on the scope
							' 0-47 is 3 cycles of a 4 bit ladder dac range...
							
#define _DAC_DispItems	80

function volts (i as integer) as single		'for use during data dump
	return  1.0*(i/_ADC_Scalar*(_ADC_Vmax-_ADC_Vmin))
	endfunction

MAIN:
dim i as integer
dim i2 as integer
dim start as integer
dim t_buffer(_DAC_Loops) as integer
dim v_buffer(_DAC_Loops) as integer

PRINT "STARTING APP ..."

OUTPUT(_DAC_B0)		' set as outputs, in case OUT is to be used
OUTPUT(_DAC_B1)
OUTPUT(_DAC_B2)
OUTPUT(_DAC_B3)

i=-1
start = timer

DO
	
	i+=1
	
	
	' if (i MOD (_DAC_DispItems-1))=0
		' if i>=_DAC_Loops then exit
		' if i<(_DAC_DispItems) then goto continue
		' print
		' for i2=i-(_DAC_DispItems-1) to i
			' print i2;": ";t_buffer(i2);"uS - ";volts(v_buffer(i2));" VDC"
			' if (((i2+1) mod 16)=0) then print
		' next i2
' continue:
		' start=timer
		' endif
		
	' t_buffer(i) = timer-start
	' v_buffer(i) = ad(_ADC_Port)
	
	
	OUT(_DAC_B0) = I AND 1
	OUT(_DAC_B1) = I AND 2
	OUT(_DAC_B2) = I AND 4
	OUT(_DAC_B3) = I AND 8

	
	loop

	END
