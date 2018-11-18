
#define _DAC_B0			24   '
#define _DAC_B1			25   '
#define _DAC_B2			26   '
#define _DAC_B3			27   '

MAIN:

PRINT "STARTING APP ..."

OUTPUT(_DAC_B0)
OUTPUT(_DAC_B1)
OUTPUT(_DAC_B2)
OUTPUT(_DAC_B3)

DO ' an inlined approach to fire off a nibble of gpio, as a binary counter (in a fast manner)

	' Print AD(0), AD(7), AD(8)  ' trying nxp's naming, historical AB approach, and even the package pin # - no joy.  Pkg pin 8 tied to pin 40 (3v3 Vdd)

	OUT(_DAC_B0) = 0
	OUT(_DAC_B1) = 0
	OUT(_DAC_B2) = 0
	OUT(_DAC_B3) = 0
	
	OUT(_DAC_B0) = 1
	
	OUT(_DAC_B0) = 0
	OUT(_DAC_B1) = 1
	
	OUT(_DAC_B0) = 1
	
	OUT(_DAC_B0) = 0
	OUT(_DAC_B1) = 0
	OUT(_DAC_B2) = 1
	
	OUT(_DAC_B0) = 1
	
	OUT(_DAC_B0) = 0
	OUT(_DAC_B1) = 1
	
	OUT(_DAC_B0) = 1
	
	OUT(_DAC_B0) = 0
	OUT(_DAC_B1) = 0
	OUT(_DAC_B2) = 0
	OUT(_DAC_B3) = 1
	
	OUT(_DAC_B0) = 1
	
	OUT(_DAC_B0) = 0
	OUT(_DAC_B1) = 1
	
	OUT(_DAC_B0) = 1
	
	OUT(_DAC_B0) = 0
	OUT(_DAC_B1) = 0
	OUT(_DAC_B2) = 1
	
	OUT(_DAC_B0) = 1
	
	OUT(_DAC_B0) = 0
	OUT(_DAC_B1) = 1
	
	OUT(_DAC_B0) = 1
	
	LOOP

	END
