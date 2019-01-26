#define prototypes for standard #include'd files
#these are used when #include is typed into the entry line for line by line compiles
#the real library will be included when the RUN button is hit

set protoABmath "

function fact(x as integer) as single
	return 0				
	endfunction

function fix(x as single) as integer
	return 0				
	endfunction
		
function floor(x as single) as single
	return 0				
	endfunction	
	
function int(x as single) as integer
	return 0				
	endfunction

function ceil(fparam as single) as single
	return 0				
	endfunction

function round(x as single) as single
	return 0				
	endfunction
	
function sign(x as single) as single
	return 0				
	endfunction

function fmod(n as single, d as single) as single
	return 0				
	endfunction
	
function log10i(x as single) as single
	return 0				
	endfunction

function powi(b as single, e as integer) as single
	return 0				
	endfunction

function sci(n as single, byref p as single) as single
	return 0				
	endfunction
	
function fabs(fparam as single) as single
	return 0				
	endfunction
	
function sqrt(x as single) as single
	return 0				
	endfunction

function exp(x as single) as single
	return 0				
	endfunction

function logn(x as single) as single
	return 0				
	endfunction

function pow(x as single, p as single) as single
	return 0				
	endfunction

function log(x as single) as single
	return 0				
	endfunction

function log10(x as single) as single
	return 0				
	endfunction

function reducerange(x as single, sc as single, byref m as integer) as single
	return 0				
	endfunction

function sin(rad as single) as single
	return 0				
	endfunction

function cos(rad as single) as single
	return 0				
	endfunction
	
function tan(rad as single) as single
	return 0				
	endfunction
	
function atan(rad as single) as single
	return 0				
	endfunction

function asin(rad as single) as single
	return 0				
	endfunction
	
function acos(rad as single) as single
	return 0				
	endfunction

function atan2(y as single, x as single, byref hypot as single) as single
	return 0				
	endfunction

function sec(x as single) as single
	return 0				
	endfunction

function csc(x as single) as single
	return 0				
	endfunction
	
function ctan(x as single) as single
	return 0				
	endfunction
	
function asec(x as single) as single
	return 0				
	endfunction

function acsc(x as single) as single
	return 0				
	endfunction
	
function acot(x as single) as single
	return 0				
	endfunction

function sinh(x as single) as single
	return 0				
	endfunction

function cosh(x as single) as single
	return 0				
	endfunction

function tanh(x as single) as single
	return 0				
	endfunction

function sech(x as single) as single
	return 0				
	endfunction

function csch(x as single) as single
	return 0				
	endfunction

function coth(x as single) as single
	return 0				
	endfunction

function asinh(x as single) as single
	return 0				
	endfunction

function acosh(x as single) as single
	return 0				
	endfunction

function atanh(x as single) as single
	return 0				
	endfunction

function asech(x as single) as single
	return 0				
	endfunction

function acsch(x as single) as single
	return 0				
	endfunction

function acoth(x as single) as single
	return 0				
	endfunction


function znew
	return 0				
	endfunction

function wnew
	return 0				
	endfunction

function mwc
	return 0				
	endfunction

function rand as single
	return 0				
	endfunction

function randb (rlo as single, rhi as single) as single
	return 0				
	endfunction	
"

set protoRTC "
goto jumpAroundRTC

SUB count_the_days
END SUB

FUNCTION YEAR(x)
	return 1
END FUNCTION

FUNCTION MONTH(x)
	return 1
END FUNCTION

FUNCTION WEEKDAY(x)
	return 1
END FUNCTION
	
FUNCTION DAY(x)
	return 1
END FUNCTION

FUNCTION SECOND(x)
	return 1
END FUNCTION

FUNCTION MINUTE(x)
	return 1
END FUNCTION

FUNCTION HOUR(x)
	return 1
END FUNCTION


jumpAroundRTC:
"

set protoSPI "
goto JumpAroundSPI

SUB SPIshiftOut (CLKpin, OUTpin, outByte, LSBfirst) 
END SUB

SUB SPIIN (CSpin, INpin, CLKpin, OUTpin, LSBfirst, OUTcnt, BYREF OUTlist as STRING, INcnt, BYREF INlist as STRING)
END SUB

SUB SPIOUT (CSpin, CLKpin, OUTpin, LSBfirst, OUTcnt, BYREF OUTlist AS STRING)
END SUB

SUB SPIBI (CSpin, INpin, CLKpin, OUTpin, LSBfirst, BIcnt, BYREF OUTlist as STRING, BYREF INlist as STRING) 
END SUB

JumpAroundSPI:
"

set protoSERIAL "
DIM bbBAUD(16)

goto jumpAroundSerial

FUNCTION bbRXD(pin)
	return 1
END FUNCTION

FUNCTION SERIN (pin, bd, posTrue, INcnt, BYREF INlist as string) 
	return 1
END FUNCTION

SUB bbTXD(pin, ch)
END SUB

SUB SEROUT( pin, bd, posTrue, cnt, BYREF s AS STRING)
END SUB

jumpAroundSerial:
"


set protoI2C "
goto JumpAroundI2C

FUNCTION I2COUT (SDApin, SCLpin, addr, OUTcnt, BYREF OUTlist as string) 
	return 1
END FUNCTION

SUB I2CIN ( SDApin, SCLpin, addr, OUTcnt, BYREF OUTlist as string, INcnt, BYREF INlist as string) 
END SUB

JumpAroundI2C:
"


set protoSHIFT "
goto jumpAroundShifts

SUB SHIFTOUT (sda_pin, scl_pin, LSBfirst, cnt) 		' mode = 0 LSBfirst, cnt is the number of elements
END SUB

SUB SHIFTIN (sda_pin, scl_pin, LSBfirst, cnt) 		' cnt is the number of elements
END SUB

jumpAroundShifts:
"

set protoPULSE "
goto JumpAroundPULSE

FUNCTION COUNT (pin, duration)
	return 1
END FUNCTION

FUNCTION PULSIN (pin, state)
	return 1
END FUNCTION

SUB PULSOUT (pin, duration)
END SUB

FUNCTION RCTIME (pin, state)
	return 1
END FUNCTION

SUB PWM (pin, duty, timeperiod)
END SUB

JumpAroundPULSE:
"

set protoONEWIRE "
goto jumpAroundOneWire

SUB OWIN (pin, OUTcnt, BYREF OUTlist as string, INcnt, BYREF INlist as string) 
END SUB

FUNCTION OWOUT (pin, OUTcnt, BYREF OUTlist as string)
	return 1
END FUNCTION

jumpAroundOneWire:
"


set protoFREQOUT "
goto jumpAroundFreqout

SUB INIT_FREQOUT
END SUB

SUB FREQOUT(pin, duration, freq1, freq2)
END SUB

FUNCTION COS(x)
	return 1
END FUNCTION

FUNCTION SIN(x)
	return 1
END FUNCTION

jumpAroundFreqout:
"

set protoHWPWM "
goto jumpAroundHWPWM
		
SUB HWPWM ( channel, cycletime, hightime )		
end sub

sub HWPWM578 (cycle1, high5, high7, high8 )
end sub

sub HWPWM126 (cycle2, high1, high2, high6 )
end sub

sub HWPWM34 (cycle3, high3, high4 )
end sub

jumpAroundHWPWM:
"

set protoSTRING "
goto jumpAroundString

function tolower(byref s as string) as string
  return s
end function

function toupper(byref s as string) as string
  return s
end function

function midstr (byref s as string, start, length) as string
  return s
end function

function strstr (byref searchee as string, byref lookfor as string)
	return 0
end function

function strchr (byref s as string, c)
	return 1
end function

jumpAroundString:
"

set protoUART17 "
goto jumpAroundUart17

sub BAUD2(rate)
end sub

sub BAUD3(rate)
end sub

function RXD2
  return 0
end function

function RXD3
  return 0
end function

sub TXD2(ch)
end sub

sub TXD3(ch)
end sub

jumpAroundUart17:
"

set protoVBSTRING "
goto jumpAroundVBString

function UCASE(byref s as string) as string
  return s
end function


function LCASE(byref s as string) as string
  return s
end function


function MID (byref s as string, start, length) as string
  return s
end function

function InStr (start, byref searchee as string, byref lookfor as string)
	return 0
end function

jumpAroundVBString:
"


proc returnProto { line } {
	if {[string first "<RTC.bas>" $line] > 0} {
		return $::protoRTC
	} elseif {[string first "<RTC17.bas>" $line] > 0} {
		return $::protoRTC
	} elseif {[string first "<SPI.bas>" $line] > 0} {
		return $::protoSPI
	} elseif {[string first "<SERIAL.bas>" $line] > 0} {
		return $::protoSERIAL
	} elseif {[string first "<I2C.bas>" $line] > 0} {
		return $::protoI2C
	} elseif {[string first "<SHIFT.bas>" $line] > 0} {
		return $::protoSHIFT
	} elseif {[string first "<PULSE.bas>" $line] > 0} {
		return $::protoPULSE
	} elseif {[string first "<ONEWIRE.bas>" $line] > 0} {
		return $::protoONEWIRE
	} elseif {[string first "<FREQOUT.bas>" $line] > 0} {
		return $::protoFREQOUT
	} elseif {[string first "<HWPWM17.bas>" $line] > 0} {
		return $::protoHWPWM
	} elseif {[string first "<HWPWM.bas>" $line] > 0} {
		return $::protoHWPWM
	} elseif {[string first "<STRING.bas>" $line] > 0} {
		return $::protoSTRING
	} elseif {[string first "<VBSTRING.bas>" $line] > 0} {
		return $::protoVBSTRING
	} elseif {[string first "<LPC17xx.bas>" $line] > 0} {
		return ""
	} elseif {[string first "<LPC21xx.bas>" $line] > 0} {
		return ""
	} elseif {[string first "<LPC11xx.bas>" $line] > 0} {
		return ""
	} elseif {[string first "<LPC8xx.bas>" $line] > 0} {
		return ""
	} elseif {[string first "<LPC40xx.bas>" $line] > 0} {
		return ""
	} elseif {[string first "<LPC43xx.bas>" $line] > 0} {
		return ""
	} elseif {[string first "<AB_Math.bas>" $line] > 0} {
		return $::protoABmath
	} elseif {[string first "\"RTC.bas\"" $line] > 0} {
		return $::protoRTC
	} elseif {[string first "\"RTC17.bas\"" $line] > 0} {
		return $::protoRTC
	} elseif {[string first "\"SPI.bas\"" $line] > 0} {
		return $::protoSPI
	} elseif {[string first "\"SERIAL.bas\"" $line] > 0} {
		return $::protoSERIAL
	} elseif {[string first "\"I2C.bas\"" $line] > 0} {
		return $::protoI2C
	} elseif {[string first "\"SHIFT.bas\"" $line] > 0} {
		return $::protoSHIFT
	} elseif {[string first "\"PULSE.bas\"" $line] > 0} {
		return $::protoPULSE
	} elseif {[string first "\"ONEWIRE.bas\"" $line] > 0} {
		return $::protoONEWIRE
	} elseif {[string first "\"FREQOUT.bas\"" $line] > 0} {
		return $::protoFREQOUT
	} elseif {[string first "\"HWPWM17.bas\"" $line] > 0} {
		return $::protoHWPWM
	} elseif {[string first "\"HWPWM.bas\"" $line] > 0} {
		return $::protoHWPWM
	} elseif {[string first "\"STRING.bas\"" $line] > 0} {
		return $::protoSTRING
	} elseif {[string first "\"VBSTRING.bas\"" $line] > 0} {
		return $::protoVBSTRING
	} elseif {[string first "\"LPC17xx.bas\"" $line] > 0} {
		return ""
	} elseif {[string first "\"LPC21xx.bas\"" $line] > 0} {
		return ""
	} elseif {[string first "\"LPC11xx.bas\"" $line] > 0} {
		return ""
	} elseif {[string first "\"LPC8xx.bas\"" $line] > 0} {
		return ""
	} elseif {[string first "\"LPC40xx.bas\"" $line] > 0} {
		return ""
	} elseif {[string first "\"LPC43xx.bas\"" $line] > 0} {
		return ""
	} elseif {[string first "\"AB_Math.bas\"" $line] > 0} {
		return $::protoABmath		
	} else {
		return "-ERROR unknown #include file -- $line"
	}		
}

