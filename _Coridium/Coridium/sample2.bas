''''''''''''''''''''''''''''''''''''''
''
''	port of original Csample to CMSIS environment
'' 

#define LPC21xx

'#include "coridium_pcb.bas"	' this one is required and configures FOR the proper CPU

'#include "uart17.bas"

'#include "hwpwm17.bas"

#include <PULSE.bas>
#include <ONEWIRE.bas>

#define I2Cspeed100                 ' slow the i2c shift rate to 100 KHz
#ifdef LPC21xx
  #include <I2C.bas>
  #include <HWPWM.bas>
#else
  #include <I2C17.bas>
//#include <HWPWM17.bas>
#endif

#define MSBfirst	0
#define LSBfirst    1
'#define SHIFTpreSample			' use this depending on the target device
#include <SHIFT.bas>

#include <SPI.bas>

#include <RTC.bas>

#ifdef LPC17xx
#include <UART17.bas>

  #ifndef OUTPUT1
  
    #define OUTPUT0(pin)   FIO0DIR = FIO0DIR or (1 << pin)
    #define INPUT0 (pin)   FIO0DIR = FIO0DIR and not(1 << pin)
    #define OUTPUT1(pin)   FIO1DIR = FIO1DIR or (1 << pin)
    #define INPUT1 (pin)   FIO1DIR = FIO1DIR and not(1 << pin)
    #define OUTPUT2(pin)   FIO2DIR = FIO2DIR or (1 << pin)
    #define INPUT2 (pin)   FIO2DIR = FIO2DIR and not(1 << pin)
    #define OUTPUT4(pin)   FIO4DIR = FIO4DIR or (1 << pin)
    #define INPUT4 (pin)   FIO4DIR = FIO4DIR and not(1 << pin)
    
  #endif
#endif


' gets could be done with DEBUGIN, but this shows how to use RXD0

#ifndef CR
  #define CR		&HD
  #define LF		&HA
#endif

'#define DEBUG_gets			' un-comment this line to echo hex values of characters typed into gets

SUB gets (BYREF instring as STRING)
	DIM i as INTEGER
	DIM ch as INTEGER
	i=0
	
	while 1
		do
			ch = RXD0
		until ch>=0
		
	#ifdef DEBUG_gets		
		print hex(ch);
	#endif
			
		if ch=CR then
			if i>0 then 
				instring(i)=0
				EXIT
			end if
		end if
		if ch=LF then
			if i>0 then 
				instring(i)=0
				EXIT
			end if
		end if
		if ch <> CR and ch <> LF then		' ignore blank lines, which can also happen when CR LF received
			instring(i)=ch
			i=i+1
		end if
	loop
	
  #if defined DEBUG_gets || defined SOMETHINGelse	' shows the 2 forms of #ifdef and #if defined, the later makes more complex tests possible
	print				
  #endif
END SUB

FUNCTION atoi (BYREF instring as STRING) as INTEGER
	DIM i as INTEGER
	DIM x as INTEGER
	DIM sign as INTEGER
	
	sign = 1
	i = 0
	x = 0
	
	while instring(i)
		x = x * 10
		x = x + instring(i) - "0"      ' single byte strings are translated to the character value
		i = i + 1
	loop
	
	return x * sign
END FUNCTION


DIM buffer(512) as BYTE

main:									' the program starts here


	DIM instring(255) as STRING
	DIM inval as INTEGER
	DIM i as INTEGER
	DIM save_time as INTEGER
	
	DIM port as INTEGER
	DIM bit  as INTEGER
	
	DIM present as INTEGER
	DIM shortMessage(20) as STRING
	DIM shortResponse(20) as STRING
	DIM wordMessage(20) as INTEGER
	DIM wordResponse(20) as INTEGER
	
	BAUD0(19200)	' this is redundant, as it is the default state of UART0 in BASIC
	
	PRINT
	PRINT "Welcome to ARMexpress Family BASIC Demo"
	while (1) 
		PRINT "enter option:"
		gets(instring)
		inval = atoi(instring)
		
		SELECT (inval) 
			
			case 0
				PRINT "BASIC support point type commands"
				PRINT " from the command line @xxxxx  will display the contents at the hex address xxxxx"
				PRINT " also !xxxx yyyy  will write the hex value yyyy into address xxxx"
				PRINT
				PRINT " STOP in a BASIC program will invoke these commands without ending the program"
				PRINT " and the program will continue by typing a ^"
				
				STOP
										
			
			case 1
				PRINT "LED on"
	#ifdef LPC17xx 				
				OUTPUT2 (1<<10)
				P2(10)=0
	#else
				OUTPUT(15)
				P0(15)=0
	#endif				
				
			case 2
				PRINT "LED off"
	#ifdef LPC17xx 				
				OUTPUT2(10)			' could also be done with OUTPUT2(10)
				P2(10)=1			' could also be done with HIGH2(10)
	#else
				OUTPUT(15)
				P0(15)=1
	#endif				
				

			case 41			' test the EEPROM 24LC256 
			
	#ifdef LPC17xx					' SUperPRO PROplus -- connected to OUR internal test PCB
			#define SCL		(1<<16) + 28	'P1.28
			#define SDA		0				'P0.0
	#else
			#define SCL		5				'P0.10
			#define SDA		6				'
	#endif			
	
				shortMessage(0) = 2
				shortMessage(1) = 0
				
				FOR i=2 TO 7 
					shortMessage(i) = &H30+i	'  shortMessage to "1234567" 	
				NEXT i
				
'while(1) { WAIT(5)				' use this to loop and measure the rate
				present = I2COUT (SDA, SCL, &HA0, 8, shortMessage)
'}				
				if (present = 0) then PRINT "NO i2c device ***"  else PRINT "24LC256 device found"

				shortMessage(0) = 2
				shortMessage(1) = 0
								
				WAIT(10)	' allow time FOR data to be written
'while(1) { WAIT(5)				' use this to loop and measure the rate
				I2CIN(SDA, SCL, &HA0, 2, shortMessage, 7, shortResponse)
'}				
				
				PRINT ">>";hex(shortResponse(0)),shortResponse(1),shortResponse(2),shortResponse(3),shortResponse(4),shortResponse(5),shortResponse(6),shortResponse(7)
				
					
				
			case 42			' test the EEPROM 24LC02 on pins 0 = SDA and 1 = SCL, with seperate I2CIN
			
'while(1) { WAIT(5)				' use this to loop and measure the rate
				present = I2COUT (SDA, SCL, &HA0, 9, "ABCDEF GH")	' address, followed by data
'}				
				if (present = 0) then PRINT "NO i2c device ***" else PRINT "24LC02 device found"

				WAIT(10)	' allow time FOR data to be written
								
				shortMessage(0) = 0
				I2COUT(SDA, SCL, &HA0, 1, shortMessage) 

				save_time = TIMER
				while ((TIMER - save_time) < 50) 				' wait 50 uSec -- not needed, just demonstrate how to talk to slow devices
				loop
				
				shortMessage(0) = " "        ' same as 32

				I2CIN(SDA, SCL, &HA0, 1, shortMessage, 8, shortResponse) 
				
				shortResponse(8) = 0
				PRINT "read from EEPROM "
				PRINT ""
				PRINT ""
				PRINT ">> ",shortResponse(0),shortResponse(1),shortResponse(2),shortResponse(3),shortResponse(4),shortResponse(5),shortResponse(6),shortResponse(7)
													
				
			case 45
				PRINT "93LC46 SHIFT test"
PRINT "*** still being tested ***"			
				
		#ifdef LPC17xx					' SUperPRO PROplus
		
			#define SPICS		29				'P0.29
				OUTPUT(30) 
				OUTPUT(29)	' these 2 pins must be both ins or outs P0.29 and 30
			#define SPICLK		(1<<16) + 18	'P1.18
				OUTPUT1(18) 
				P1(18)=0			' drive CLK low initially
			#define SPIDO		(1<<16) + 20	'P1.20	' DO from CPU --> DI of 93LC46
			#define SPIDI		(1<<16) + 23	'P1.23
		#else
			#define SPICS		1				'P0.10
			#define SPICLK		2				'
			#define SPIDO		3				'
			#define SPIDI		4				'
		#endif			
				
				shiftOutBuf (0) = &H260
				P0(SPICS)=1		' CS positive true on this part 
				SHIFTOUT (SPICLK,SPIDO,MSBfirst,1)		' the array shiftOutBuf is shifted out, shiftCounts 0=8bits, or #bits
				P0(SPICS)=0
				
	#if 0  ' not yet supported
	#warning  -- need to add SHIFTBI

				shiftOutBuf (0) = &H3000000
				P0(SPICS)=1
				SHIFTBI (SPIDI, SPICLK, SPIDO, MSBPRE,1,wordMessage, wordResponse, 26)		' read 2 bytes
				P0(SPICS)=0
	#endif

				PRINT "> ";wordResponse(0)
				
				shiftOutBuf (0) = &H28000 + &Hbe	' &Hbe is the data
				P0(SPICS)=1		 
				SHIFTOUT (SPICLK,SPIDO,MSBfirst,1)		' write something
				P0(SPICS)=0
				
				WAIT(1)
				P0(SPICS)=1		 ' watch the data complete operation
				WAIT(10)
				P0(SPICS)=0
				
	#if 0  ' not yet supported
				shiftOutBuf (0) = &H3000000
				P0(SPICS)=1		
				SHIFTBI (SPIDI, SPICLK, SPIDO, MSBPRE,1,wordMessage, wordResponse, 26)		' read 2 bytes
				P0(SPICS)=0
	#endif
				
				PRINT "> ", hex(wordResponse(0))
				
				
			case 46			' check something -- debugged on 93LC46 which is not a byte oriented SPI device	
#warning SPI tests still being developed				
PRINT "*** still being tested ***"			
			
				shortMessage (0) = &H98
				P0(SPICS)=1		' CS positive true on this part -- need to do it manually
				SPIOUT (-1,SPICLK,SPIDO, LSBfirst,1,shortMessage)	' write enable
				P0(SPICS)=0
				WAIT (1)
				
'while(1) { WAIT(5)				' use this to loop and measure the rate or inspect the waveFORm
				P0(SPICS)=1
				SPIBI(-1, SPIDI, SPICLK, SPIDO, LSBfirst, 8,shortMessage, shortResponse)		' read 8 bytes
				P0(SPICS)=0
'}				
				PRINT ">> ";shortResponse(1),shortResponse(2),shortResponse(3),shortResponse(4),shortResponse(5),shortResponse(6),shortResponse(7)

				shortMessage (0) = &HA0
				shortMessage (1) = &HBE
				P0(SPICS)=1		' CS positive true on this part -- need to do it manually
				SPIOUT (-1,SPICLK,SPIDO,LSBfirst,2,shortMessage)	' write 
				P0(SPICS)=0
				WAIT(10)
								
				P0(SPICS)=1
				SPIBI(-1, SPIDI, SPICLK, SPIDO, LSBfirst, 8, shortMessage, shortResponse)		' read 8 bytes
				P0(SPICS)=0
				PRINT ">> ";hex(shortResponse(1)),shortResponse(2),shortResponse(3),shortResponse(4),shortResponse(5),shortResponse(6),shortResponse(7)
					
				

		
	#ifndef LPC111x		' no RTC in this part			
			case 50
				MONTH(10)
				DAY  (12)
				
				HOUR (12)
				MINUTE  (1)
				SECOND  (2)
				
				YEAR (2011)		'  this last as it calculates DayOfWeek and DayOfYear

				
			case 51
				PRINT "This is "
				SELECT WEEKDAY (-1)
					case 0	
						PRINT "Sunday "; 
					case 1	
						PRINT "Monday "; 
					case 2	
						PRINT "Tuesday ";
					case 3	
						PRINT "Wednesday "; 
					case 4	
						PRINT "Thursday "; 
					case 5	
						PRINT "Friday "; 
					case 6	
						PRINT "Saturday "; 
				END SELECT     
				
				PRINT MONTH(-1),DAY(-1),YEAR(-1); "and time ";HOUR(-1),MINUTE(-1),SECOND(-1)
				
				PRINT "and its is day of the year is",RTC_DOY
				
								
				
			case 52
				PRINT "enter day"
				gets(instring)
				DAY(atoi(instring))
				YEAR(2012)		' recalulate DayOfWeek and DayOfYear
								
	#endif				



	#ifdef LPC_UART1
			case 70				' ASSUMEs a jumper wire between RXD1 and TXD1
				BAUD1(19200)		' turn on UART1, baud rate 19.2Kb -- replaces the baud call
				FOR inval=0 TO 10
					TXD1("A" + inval)
				NEXT inval
				PRINT " UART1 sent out ABCDEFGHIJ"
				
				WAIT (500)			' wait FOR it to be received
				
				PRINT " UART1 got back-->"
				while (1) 
					inval = RXD1
					if(inval = -1) exit	' the receive buffer is empty
					TXD0(inval)		' send it to UART0 -- the debug port
				LOOP
				
	#endif				
	#ifdef LPC_UART2
			case 71				' ASSUMEs a jumper wire between RXD1 and TXD1
				BAUD2(19200)		' turn on UART2, baud rate 19.2Kb -- replaces the baud call
				FOR inval=0 TO 10
					TXD2("a" + inval)
				NEXT inval
				PRINT " UART2 sent out abcdefghij"
				
				WAIT (500)			' wait FOR it to be received
				
				PRINT " UART2 got back-->"
				while (1) 
					inval = RXD2
					if(inval = -1) exit	' the receive buffer is empty
					TXD0(inval)		' send it to UART0 -- the debug port
				LOOP
				
	#endif				
	#ifdef LPC_UART3
			case 72				' ASSUMEs a jumper wire between RXD1 and TXD1
				BAUD3(19200)		' turn on UART3, baud rate 19.2Kb -- replaces the baud call
				FOR inval=0 TO 10
					TXD3('0' + inval)
				NEXT inval
				PRINT " UART3 sent out 0123456789"
				
				WAIT (500)			' wait FOR it to be received
				PRINT " UART3 got back-->"
				while (1) 
					inval = RXD3
					if(inval = -1) exit 	' the receive buffer is empty
					TXD0(inval)		' send it to UART0 -- the debug port
				LOOP
				
	#endif				
			CASE ELSE
				PRINT "*** unknown option - "; inval; " ***"
				

		
		END SELECT
	print "operation done"
	LOOP
	
END		' this will never get executed as the while 1 loop never ends

	

