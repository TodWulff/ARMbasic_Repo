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
				
			case 3
	#ifdef LPC17xx 				
				INPUT2(10)		
				PRINT "Pin P2.10 is ",IN2(10)
	#else
				INPUT(15)
				PRINT "Pin 15 is",IN(15)
	#endif				
				
			case 4
				PRINT "Blink LED FOR 500ms"
	#ifdef LPC17xx 				
				OUTPUT2 (10)
				P2 (10)=1
				FOR i=0 to 19
					P2(10)= i and 1
					WAIT (500)
				NEXT i
	#else
				OUTPUT(15)
				P0(15)=1
				FOR i=0 to 19
					P0(15) = i and 1
					WAIT (500)
				NEXT i
	#endif				
				
				
			case 5
				PRINT "Ramp thru PWM on LED"
				FOR i=0 to 255
					PWM (15,255-i,20)	
				NEXT i
				

			case 6
				PRINT " Wiggle a pin FOR 5 seconds"
				PRINT " enter which pin"
				gets(instring)
				bit = atoi(instring)
				OUTPUT(bit)
				FOR i=1 to 5
					P0(bit)=1
					WAIT (500)
					P0(bit)=0
					WAIT (500)
				NEXT i
'				INPUT(bit)
				
#ifdef LPC_GPIO1
			case 7
				PRINT " Wiggle a pin FOR 5 seconds"
				PRINT " enter which port"
				gets(instring)
				port = atoi(instring)
				PRINT " enter which pin"
				gets(instring)
				bit = atoi(instring)
				
				SELECT (port) 
					case 0	
						OUTPUT(bit)  
					case 1	
						OUTPUT1(bit) 
	#ifdef LPC_GPIO3
					case 2	
						OUTPUT2(bit) 
					case 3	
						OUTPUT3(bit) 
					case 4	
						OUTPUT4(bit) 
	#endif					
				END SELECT       
				
				FOR i=0 TO 5
					SELECT (port) 
						case 0	
							P0(bit)=1
						case 1	
							P1(bit)=1
	#ifdef LPC_GPIO3
						case 2	
							P2(bit)=1
						case 3	
							P3(bit)=1
						case 4	
							P4(bit)=1
	#endif					
					END SELECT        
					WAIT (500)
					SELECT (port) 
						case 0	
							P0(bit)=0
						case 1	
							P1(bit)=0 
	#ifdef LPC_GPIO3
						case 2	
							P2(bit)=0
						case 3	
							P3(bit)=0 
						case 4	
							P4(bit)=0
	#endif					
					END SELECT
					WAIT (500)
				NEXT i
#endif					
				
				
			case 9
				PRINT "Pin 15 is "
				if DIR(15) then PRINT "an output" else PRINT "an input"
				INPUT(15)
				PRINT "Pin 15 should now be an input and is ---";
				if DIR(15) then PRINT "an output" else PRINT "an input"
				
				
				
			case 10
				PRINT "current TIMER (LPC_TIM0) is ",TIMER
				

	#if (defined ARMmite) || (defined ARMexpressLT)			
			case 11
				PRINT "Turn on HWPWM on 8 channels"
				FOR i=0 TO 7
					wordMessage(i) = 4 << i
				NEXT i
				HWPWM (1000, 8, wordMessage)
								
				
	#elif (defined LPC17xx)
			case 11
				PRINT "Turn on HWPWM on 6 channels"
				FOR i=0 TO 5
					wordMessage(i) = 16 << i
				NEXT i
				HWPWM (1000, 6, wordMessage)
				
	#endif	
						
			case 20
				PRINT "Flash Memory at &H7000 = ", hex(* &H7000	)
				
				
			case 21
				PRINT "write Flash at &H7000"			
				FOR i=0 TO 511
					buffer(i) = &H5555AAAA
				NEXT i
				WAIT(10)						' when PLL shuts down the printf above is still pending
				WRITE ( &H7000,  buffer, 512)
							
				
  #if (!defined ARMexpress) && (!defined LPC2106) 	
  				
			case 30
	#ifdef LPC21xx			
				PRINT "Read AD(2) = ",AD(2) >> 6		' the 21xx series had 10 bit converters
	#else				
				PRINT "Read AD(2) = ",AD(2) >> 4		' these are 12 bit converters
	#endif				
				
  #endif
  
			case 31			' generate pulses on LED continuously so they can be measured on another device
				PRINT " generate low 234 uS pulse then high 1000 uS pulse"
				OUTPUT(15) 
				P0(15)=1
				while (1) 
					PULSOUT(15,234) 
					WAIT(1)
				LOOP
				
			case 32
				PRINT " Measure PULSIN on pin 0, four times as low pulse then high pulse"
				FOR i=0  TO 4
					PRINT PULSIN (0, 0)  
				NEXT i					
				FOR i=0  TO 4
					PRINT PULSIN (0, 1)  
				NEXT i					
				
				
			case 33
				PRINT " count pulses on pin 0 FOR 5 seconds"
				
				PRINT COUNT(0, 5000);" pulses happened"

					

			case 34
				PRINT " check RCTIME into a 700ohm 0.1uF drive on 14, sense on 13"
				OUTPUT (14)
				
				P0(14)=1	
				PRINT "high to low "
				WAIT(10)		' make sure line is high
				P0(14)=0
				PRINT RCTIME (13, 1);" microseconds, high to low "
				WAIT(10)		' make sure line is low
				P0(14)=1	
				PRINT RCTIME (13, 0);" microseconds, low to high",
				
				
				
			case 40			' test the EEPROM of a DS2430 on pin 7
			
	#ifdef LPC17xx			' SUperPRO PROplus -- connected to OUR internal test PCB
			#define OWPIN	10	'P0.10
	#else
			#define OWPIN	7
	#endif			
				shortMessage(0) = &HCC
				shortMessage(1) = &H0F
				shortMessage(2) = &H00
				shortMessage(3) = &H44
				shortMessage(4) = &H11
				shortMessage(5) = &H22
				shortMessage(6) = &HBE
				
				present = OWOUT(OWPIN, 7, shortMessage)
				if (present) then PRINT "one wire device found" else PRINT "*** NO one wire device ***"  
				
				shortMessage(0) = &HCC
				shortMessage(1) = &HAA
				shortMessage(2) = &H00

				
				OWIN(OWPIN, 3, shortMessage, 4, shortResponse)			
				FOR i=0 TO 3 
					if (shortMessage(i+3) <> shortResponse(i)) then exit
				NEXT i
				
				if (i=3) then PRINT "one wire OK" else PRINT "*** one wire FAIL ***"
				
			CASE ELSE
				PRINT "*** unknown option - "; inval; " ***"
				

		
		END SELECT
	print "operation done"
	LOOP
	
END		' this will never get executed as the while 1 loop never ends

	

