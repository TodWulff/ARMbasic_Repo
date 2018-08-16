#ifndef _SPI_TEST
#define _SPI_TEST

#ifndef ARMbasic_Extensions
	#include __LIB\AB_Extensions.lib
	#endif


'------------------------ IO DEFINITIONS --------------------------------------

#define _SPI_RSET	 			16   ' RESET -also grn led

#define _SPI_MISO	 			27   ' SPI Master In/Slave Out
#define _SPI_MOSI	 			26   ' SPI Master Out/Slave In
#define _SPI_SCLK	 			25   ' SPI CLOCK
#define _SPI_CSEL	 			24   ' SPI SLAVE SELECT (high = not selected, low to select)

#define _SPI_MODE				0	' 0 to 4

/* 
' #if _SPI_MODE = 0

	' #define _SPI_CPOL			0		' Clock phase is configured such that data is sampled on the rising edge of the clock pulse and
	' #define _SPI_CPHA			0		' shifted out on the falling edge of the clock pulse.  Note that data must be available before the first rising edge of the clock.

' #elif _SPI_MODE = 1

	' #define _SPI_CPOL			0		' Clock phase is configured such that data is sampled on the falling edge of the clock pulse and
	' #define _SPI_CPHA			1		' shifted out on the rising edge of the clock pulse.

' #elif _SPI_MODE = 2

	' #define _SPI_CPOL			1		' Clock phase is configured such that data is sampled on the falling edge of the clock pulse and
	' #define _SPI_CPHA			0		' shifted out on the rising edge of the clock pulse.  Note that data must be available before the first falling edge of the clock.

' #else ' _SPI_MODE = 3

	' #define _SPI_CPOL			1		' Clock phase is configured such that data is sampled on the. rising edge of the clock pulse and
	' #define _SPI_CPHA			1		' shifted out on the falling edge of the clock pulse

' #endif 
 */
 
MAIN:

PRINT "STARTING APP ..."
LOOPS=0
HOUR=0
MINUTE=0
SECOND=0

DO

LOOP

SPI_MODE_SETUP:
	SELECT SPI_MODE
		CASE 0
			SPI_CPOL = 0
			SPI_CPHA = 0
			SPI_DORD = 0
		CASE 1
			SPI_CPOL = 1
			SPI_CPHA = 0
			SPI_DORD = 0
		CASE 2
			SPI_CPOL = 0
			SPI_CPHA = 1
			SPI_DORD = 0
		CASE 3
			SPI_CPOL = 1
			SPI_CPHA = 1
			SPI_DORD = 0
		CASE 4
			SPI_CPOL = 0
			SPI_CPHA = 0
			SPI_DORD = 1
		CASE 5
			SPI_CPOL = 1
			SPI_CPHA = 0
			SPI_DORD = 1
		CASE 6
			SPI_CPOL = 0
			SPI_CPHA = 1
			SPI_DORD = 1
		CASE ELSE
			SPI_CPOL = 1
			SPI_CPHA = 1
			SPI_DORD = 1
	ENDSELECT
RETURN
'------------------------------------------------------------------------------
SPI_TX_BYTE:	'FROM ELSEWHERE SPI_CPOL, SPI_CPHA, SPI_DORD, SPI_SSEL, SPI_SCLK, SPI_MISO, SPI_MOSI, SPI_DATA
	BIT2IO(SPI_CPOL,0,SPI_SCLK) 									'SET INIT CLOCK IDLE STATE
	IF SPI_SSEL <> -1 THEN OUT(SPI_SSEL) = LO 						'PULL SLAVE SEL LINE LOW
	FOR SPI_TX_LOOP = 7 DOWNTO 0									'SETUP LOOP
		IF SPI_CPHA = 0 THEN BIT2IO(SPI_DATA,ABS(SPI_TX_LOOP-(SPI_DORD * 7)),SPI_MOSI)	'SET MOSI TO ALLOW SLAVE TO CLOCK IN DATA ON LE IF CPHA = 0
		_BIT2IO(SPI_CPOL,0,SPI_SCLK) 								'TOGGLE CLOCK
		IF SPI_CPHA = 1 THEN BIT2IO(SPI_DATA,ABS(SPI_TX_LOOP-(SPI_DORD * 7)),SPI_MOSI)	'SET MOSI TO ALLOW SLAVE TO CLOCK IN DATA ON TE IF CPHA = 1
		BIT2IO(SPI_CPOL,0,SPI_SCLK) 								'COMPLETE CLOCK CYCLE
	NEXT SPI_TX_LOOP												'CONTINUE THRU REST OF BYTE
	IF SPI_SSEL <> -1 THEN OUT(SPI_SSEL) = HI						'PUSH SLAVE SEL LINE BACK HI
RETURN
'------------------------------------------------------------------------------
SPI_RX_BYTE:	'FROM ELSEWHERE SPI_CPOL, SPI_CPHA, SPI_DORD, SPI_SSEL, SPI_SCLK, SPI_MISO, SPI_MOSI.  SPI_DATA SET ON EXIT
	SPI_DATA = 0
	BIT2IO(SPI_CPOL,0,SPI_SCLK) 									'SET INIT CLOCK IDLE STATE
	IF SPI_SSEL <> -1 THEN OUT(SPI_SSEL) = LO 						'PULL SLAVE SEL LINE LOW
	FOR SPI_RX_LOOP = 7 DOWNTO 0									'SETUP LOOP
		_BIT2IO(SPI_CPOL,0,SPI_SCLK) 								'TOGGLE CLOCK
		IF SPI_CPHA = 0 THEN IO2BIT(SPI_DATA,ABS(SPI_RX_LOOP-(SPI_DORD * 7)),SPI_MISO)	'SET MOSI TO ALLOW SLAVE TO CLOCK IN DATA ON LE IF CPHA = 0
		BIT2IO(SPI_CPOL,0,SPI_SCLK) 								'COMPLETE CLOCK CYCLE
		IF SPI_CPHA = 1 THEN IO2BIT(SPI_DATA,ABS(SPI_RX_LOOP-(SPI_DORD * 7)),SPI_MISO)	'SET MOSI TO ALLOW SLAVE TO CLOCK IN DATA ON TE IF CPHA = 1
	NEXT SPI_RX_LOOP												'CONTINUE THRU REST OF BYTE
	IF SPI_SSEL <> -1 THEN OUT(SPI_SSEL) = HI						'PUSH SLAVE SEL LINE BACK HI
RETURN
'------------------------------------------------------------------------------





END




'-----------------------------------------------------------------------------------------------------------------------------

#endif
