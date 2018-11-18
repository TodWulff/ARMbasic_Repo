
#include  "__LIB\ARMbasicTargetVitals.lib"
#include "SPK\SPK_support.lib"
#define enabledebug 0

' #define ABE_Generic
#define ABE_Debug
#define ABE_Bitwise
' #define ABE_FloatHelpers
#define ABE_Conversion
' #define ABE_UserInput
' #define ABE_Suspend
' #define ABE_ASCStuffs
' #define ABE_DDR
#define ABE_RNG
#include "__lib\AB_Extensions.lib"

#define enable_lcd_debug 0
#include "LCD\LCD_Support.lib"

' #include "SPI.bas"
' #include "serial.bas"

' #define SPI_CS			16
' #define SPI_Clk			17
' #define SPI_MOSI			13
' #define SPI_MISO			14

' #define scope_trigger 		13
#define scope_trigger 		33
#define led_port			31

MAIN:

#ifdef LPC824
	' fix the effin SWD pin settings, as AB firmware disables them (likely to provide gpio...)
	*0x4000C1C0 = 0x01fffECf
	print i2b4(*0x4000C1C0)
#endif
	
	Debug(InitDebug)
	Debug(dim loop_count as integer)
	Debug(loop_count = 0)

	DIM TEST$(255) AS STRING
	DIM LCD_CHAR_NUM AS INTEGER
	DIM LCD_CHAR_DATA1 AS INTEGER
	DIM LCD_CHAR_DATA2 AS INTEGER
	DIM X,i AS INTEGER
	
	' SERINtimeout = 1000000
	
	dim InStr(50) as string
	dim SPIoutStr(255) as string

	' SPIoutstr="0123456789"
	
	output(scope_trigger)
	output(led_port)
	
	out(scope_trigger)=0

	' output(SPI_CS)
	' output(SPI_Clk)
	' output(SPI_MOSI)
	
'	LCD_DEBUG(if(SPK_BEEP(3500, 1, 5)) then Print "SPK_BEEP Error")
	' LCD_DEBUG(SPK_BEEP(3500, 1, 5))
	
	LCD_INIT_IO
	LCD_INIT_MODULE
	LCD_DISP_CNTL (LCD_DISPLAY_ON, LCD_LINE_CURS_OFF, LCD_BLOCK_CURS_OFF)

	i=0
	DO
	out(led_port) = i and 1
	i+=1
	Debug(loop_count+=1)
	Debug(print loop_count)
	Debug(if ((loop_count mod 10) = 0 ))
	Debug(DebugHandler)
	Debug(endif)
		
	sblip
	' __ASM__($BE00)					' BKPT 
	' SERIN (16, 115200, 0, 0, SPIoutstr)
	' print SPIoutstr
	' print
	' LCD_DISP_CLEAR
	' LCD_STRG_SEND(SPIoutstr)
		
	out(scope_trigger)=0
	' SPIOUT (SPI_CS, SPI_Clk, SPI_MOSI, 0, 5, SPIoutstr)
	out(scope_trigger)=1

	TEST$="TEST'G STRG SEND"	
	LCD_DISP_RESET
	LCD_STRG_SEND(TEST$)
	WAIT(200)
	
	GOSUB LCD_DISP_RESET
	TEST$="TESTING RND SEND"
	GOSUB LCD_STRG_SEND(TEST$)
	WAIT(100)

	FOR LCD_ROW = 0 TO LCD_MAX_ROW
		FOR LCD_COLUMN = 0 TO LCD_MAX_COLUMN
			GOSUB LCD_CHAR_SEND_XY(RAND_BIT_WIDTH(TIMER,8),LCD_COLUMN,LCD_ROW)
		NEXT LCD_COLUMN
	NEXT LCD_ROW
	WAIT(200)
	
	FOR LCD_ROW = 0 TO LCD_MAX_ROW
		FOR LCD_COLUMN = 0 TO LCD_MAX_COLUMN
			GOSUB LCD_SET_DRAM_ADDR(LCD_CALC_CELL_ADDR(LCD_COLUMN, LCD_ROW))
			PRINT LCD_CHAR_GET,
		NEXT LCD_COLUMN
	NEXT LCD_ROW
	WAIT(200)
	
PRINT
PRINT "BLANKING DISPLAY FOR A BIT..."
		
	GOSUB LCD_DISP_OFF
	WAIT(100)
	GOSUB LCD_DISP_ON

PRINT "DISPLAY BACK ON..."
	WAIT(200)
	
	FOR LCD_ROW = LCD_MAX_ROW DOWNTO 0
		FOR LCD_COLUMN = LCD_MAX_COLUMN DOWNTO 0
			PRINT LCD_CHAR_GET_XY(LCD_COLUMN, LCD_ROW),
		NEXT LCD_COLUMN
	NEXT LCD_ROW
	PRINT
	
	GOSUB LCD_DISP_CLEAR
	
	FOR LCD_ROW = 0 TO LCD_MAX_ROW
		FOR LCD_COLUMN = 0 TO LCD_MAX_COLUMN
			GOSUB LCD_CURS_SET_XY(LCD_COLUMN, LCD_ROW)
			GOSUB LCD_CURS_SET_TYPE(LCD_CURS_TYPE_LINE)
			WAIT(5)
			GOSUB LCD_CURS_SET_TYPE(LCD_CURS_TYPE_BLOCK)
			WAIT(5)
			GOSUB LCD_CURS_SET_TYPE(LCD_CURS_TYPE_BOTH)
			WAIT(5)
			GOSUB LCD_CURS_SET_TYPE(LCD_CURS_TYPE_OFF)
		NEXT LCD_COLUMN            
	NEXT LCD_ROW

	GOSUB LCD_DISP_FILL(42)
			GOSUB LCD_CURS_SET_TYPE(LCD_CURS_TYPE_BLOCK)
	WAIT(250)
	GOSUB LCD_STRG_SEND_XY("THIS IS A TEST", 1, 1)
	
	GOSUB LCD_CHAR_SEND_XY ("-", 5, 1)
	
	' wait(20000)
	
	GOSUB LCD_CURS_SHFT_LEFT(5)
	WAIT(100)
	GOSUB LCD_CURS_SHFT_RIGHT(2)
	WAIT(100)
	GOSUB LCD_DISP_SHFT_LEFT(2)
	WAIT(100)
	GOSUB LCD_DISP_SHFT_RIGHT(3)
	WAIT(100)
	GOSUB LCD_CURS_SET_XY(39, 0)
	WAIT(100)
	GOSUB LCD_DISP_HOME
	WAIT(100)
	GOSUB LCD_CURS_SET_XY(39, 0)
	WAIT(100)
	GOSUB LCD_CURS_HOME
	
	LCD_CHAR_NUM = 0
	LCD_CHAR_DATA1 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	LCD_CHAR_DATA2 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	GOSUB LCD_CHAR_MAKE(LCD_CHAR_NUM, LCD_CHAR_DATA1, LCD_CHAR_DATA2)
	GOSUB LCD_DISP_FILL(00)
	WAIT(100)

	
	LCD_CHAR_NUM = 1
	LCD_CHAR_DATA1 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	LCD_CHAR_DATA2 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	GOSUB LCD_CHAR_MAKE(LCD_CHAR_NUM, LCD_CHAR_DATA1, LCD_CHAR_DATA2)
	GOSUB LCD_DISP_FILL(01)
	WAIT(100)

	
	LCD_CHAR_NUM = 2
	LCD_CHAR_DATA1 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	LCD_CHAR_DATA2 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	GOSUB LCD_CHAR_MAKE(LCD_CHAR_NUM, LCD_CHAR_DATA1, LCD_CHAR_DATA2)
	GOSUB LCD_DISP_FILL(02)
	WAIT(100)

	LCD_CHAR_NUM = 3
	LCD_CHAR_DATA1 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	LCD_CHAR_DATA2 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	GOSUB LCD_CHAR_MAKE(LCD_CHAR_NUM, LCD_CHAR_DATA1, LCD_CHAR_DATA2)
	GOSUB LCD_DISP_FILL(03)
	WAIT(100)

	
	LCD_CHAR_NUM = 4
	LCD_CHAR_DATA1 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	LCD_CHAR_DATA2 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	GOSUB LCD_CHAR_MAKE(LCD_CHAR_NUM, LCD_CHAR_DATA1, LCD_CHAR_DATA2)
	GOSUB LCD_DISP_FILL(04)
	WAIT(100)

	
	LCD_CHAR_NUM = 5
	LCD_CHAR_DATA1 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	LCD_CHAR_DATA2 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	GOSUB LCD_CHAR_MAKE(LCD_CHAR_NUM, LCD_CHAR_DATA1, LCD_CHAR_DATA2)
	GOSUB LCD_DISP_FILL(05)
	WAIT(100)

	LCD_CHAR_NUM = 6
	LCD_CHAR_DATA1 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	LCD_CHAR_DATA2 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	GOSUB LCD_CHAR_MAKE(LCD_CHAR_NUM, LCD_CHAR_DATA1, LCD_CHAR_DATA2)
	GOSUB LCD_DISP_FILL(06)
	WAIT(100)

	
	LCD_CHAR_NUM = 7
	LCD_CHAR_DATA1 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	LCD_CHAR_DATA2 = ((RAND_BIT_WIDTH(TIMER,16)<<16) or RAND_BIT_WIDTH(TIMER,16))
	GOSUB LCD_CHAR_MAKE(LCD_CHAR_NUM, LCD_CHAR_DATA1, LCD_CHAR_DATA2)
	GOSUB LCD_DISP_FILL(07)
	WAIT(100)
	
	GOSUB LCD_CURS_SHFT_UP
	WAIT(100)
	GOSUB LCD_CURS_SHFT_DOWN
	WAIT(100)
	GOSUB LCD_CURS_SHFT_RIGHT(2)
	WAIT(100)
	GOSUB LCD_CURS_SHFT_DOWN
	WAIT(100)
	FOR X = 1 TO 40
	 	GOSUB LCD_DISP_SHFT_LEFT(1)
		WAIT(20)
	NEXT X
	 FOR X = 1 TO 40
	 	GOSUB LCD_DISP_SHFT_RIGHT(1)
		WAIT(20)
	NEXT X

	LCD_DISP_RESET
	

	loop

END