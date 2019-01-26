'========================================================================================
'
'	Hardware Interface -- real time clock functions
'       call with > 0 to change the value, otherwise just return the value
'
'		no initialization code
'
'		copyright Coridium Corp, 2008,   may be used with Coridium Hardware or licensees
'========================================================================================

#ifndef USE_timing
#define USE_timing

goto jumpAroundRTC

#if (defined LPC2103) || (defined LPC2106) || (defined LPC2138)  
  #include <LPC21xx.bas>
#elif (defined LPC1751) || (defined LPC1756)  
  #include <LPC17xx.bas>
#elif (defined LPC4074) || (defined LPC4078)  
  #include <LPC40xx.bas>
#elif (defined LPC1114)
  #error LPC1114 does not have RTC hardware
#elif defined LPC812
  #error LPC812 does not have RTC hardware
#else
  #error undefined CPU type, please install new BASICtools from www.coridium.us/Support.php    
#endif		   


SUB count_the_days
	DIM days as INTEGER
	DIM i as INTEGER
	
	days = RTC_DAY
	for i = 0 TO RTC_MONTH - 2		'MONTH IS 1 BASED
		select i
			case 3, 5, 8, 10
				days = days + 30
			case 1 
				days = days + 28
			case else 
				days = days + 31
		end select
	next i

	if ((RTC_YEAR and 0x3) = 0) and (RTC_MONTH > 2) then days = days + 1
	
	RTC_DOY = days

	i = 2006  			'lucky, 1/1/06 was sunday
	while (i < RTC_YEAR)
		days = days + 365
		if ((i and 0x3) = 0) then days = days + 1
		i = i+1
	loop
	
	days = days - 1
	RTC_DOW	= days mod 7		'DayOfYear is 1 based, DayOfWeek is 0 based
END SUB

' when setting the date call YEAR last as it sets the weekday
FUNCTION YEAR(x)
	if(x > 0) then
		RTC_CCR AND= not 1
		RTC_YEAR = x
		CALL count_the_days
		RTC_CCR OR= 1
	end if
	return RTC_YEAR
END FUNCTION

FUNCTION MONTH(x)
	if(x > 0) then
		RTC_CCR AND= not 1
		RTC_MONTH = x
		RTC_CCR OR= 1
	end if
	return RTC_MONTH
END FUNCTION

FUNCTION WEEKDAY(x)
	if(x >= 0) then
		RTC_CCR AND= not 1
		RTC_DOW = x
		RTC_CCR OR= 1
	end if
	return RTC_DOW
END FUNCTION
	
	
FUNCTION DAY(x)
	if(x > 0) then
		RTC_CCR AND= not 1
		RTC_DAY = x
		RTC_CCR OR= 1
	end if
	return RTC_DAY
END FUNCTION

FUNCTION SECOND(x)
	if(x >= 0) then
		RTC_CCR AND= not 1
		RTC_SEC = x
		RTC_CCR OR= 1
	end if
	return RTC_SEC
END FUNCTION

FUNCTION MINUTE(x)
	if(x >= 0) then
		RTC_CCR AND= not 1
		RTC_MIN = x
		RTC_CCR OR= 1
	end if
	return RTC_MIN  
END FUNCTION

FUNCTION HOUR(x)
	if(x >= 0) then
		RTC_CCR AND= not 1
		RTC_HOUR = x
		RTC_CCR OR= 1
	end if
	return RTC_HOUR
END FUNCTION

SUB IDLE(x)
	while x
		wait(1000) 
		x=x-1
	loop
END SUB


jumpAroundRTC:

#endif	
