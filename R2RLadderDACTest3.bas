#define _DAC_B0			24
#define _DAC_B1			25
#define _DAC_B2			26
#define _DAC_B3			27

MAIN:
	dim i as integer
	OUTPUT(_DAC_B0)
	OUTPUT(_DAC_B1)
	OUTPUT(_DAC_B2)
	OUTPUT(_DAC_B3)
	i = 0
	DO
		out(_DAC_B0) = i and 1
		out(_DAC_B1) = i and 2
		out(_DAC_B2) = i and 4
		out(_DAC_B3) = i and 8
		i+=1
	loop									

END
