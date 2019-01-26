'========================================================================================
'
'	HWPWM Functions
'
'	no initialization code
'
'		copyright Coridium Corp, 2018,   may be used with Coridium Hardware or licensees
'========================================================================================
#ifndef USE_HWPWM
#define USE_HWPWM

#if defined LPC1751 || defined LPC1756
	#include <HWPWM17.bas>
#elif defined LPC1114 || defined LPC11U37
	#include <HWPWM11.bas>
#elif defined LPC2103 || defined LPC2138

goto jumpAroundHWPWM

#include <LPC21xx.bas>

#define TxTCR_COUNTER_ENABLE	1

//#define CYCLETIMES_DIFFER		' use this for 3 seperate cycletimes


#ifndef CYCLETIMES_DIFFER

lastHWPWMcycle = 0			' this is used to detect whether cycle time needs to be changed

' all cycletimes are assumed to be the same
		
SUB HWPWM ( channel, cycletime, hightime )		' channel are 1-8
	DIM prescale as integer
	
	prescale = 15		' (CCLK/PBSD/1000000) as the peripherals run at 15 MHz

	' timer 0,1 are 32 bit,  but 2,3 are 16
	' so treat them all like 16 bits
	
	while (cycletime >= &H10000) 
		cycletime = cycletime >> 1
		hightime = hightime >> 1
		prescale = prescale << 1
	loop
	prescale = prescale - 1				' counts to n-1
	cycleTime = cycleTime - 1			' counts to n-1

		
	T2_PR  = prescale
	T2_TCR = TxTCR_COUNTER_ENABLE          		' Timer1 Enable
	 
	T2_MR3 = cycletime -1
	T2_MCR = 0x400				' rollover when count reaches MR3
	if T2_TC >= cycletime -2  then T2_TC  = 0			' need to get into the proper range
	PWM2CON = 0xF
	
	if (channel > 2) then
		T3_PR  = prescale
		T3_TCR = TxTCR_COUNTER_ENABLE          ' Timer2 Enable
		 
		T3_MR1 = cycletime -1
		T3_MCR = 0x10			' rollover when count reaches MR1
		if T3_TC >= cycletime -2  then T3_TC  = 0		' need to get into the proper range
		PWM3CON = 0xF
	end if

	if (channel > 4) then
		T1_PR  = prescale
		T1_TCR = TxTCR_COUNTER_ENABLE			' Timer3 Enable
		 
		T1_MR0 = cycletime -1
		T1_MCR = 0x2			' rollover when count reaches MR0
		if T1_TC >= cycletime -2  then	T1_TC  = 0		' need to get into the proper range
		PWM1CON = 0xF
	end if
  		
	select channel
	case 8
		PCB_PINSEL1 = PCB_PINSEL1 or &H00000080		'IO(11)
		T1_MR2 = cycletime - hightime
	case 7
		PCB_PINSEL0 = PCB_PINSEL0 or &H08000000		'IO(10)
		T1_MR1 = cycletime - hightime
	case 6
		PCB_PINSEL0 = PCB_PINSEL0 or &H00008000		'IO(9)
		T2_MR0 = cycletime - hightime
	case 5
		PCB_PINSEL1 = PCB_PINSEL1 or &H00000200		'IO(4)
		T1_MR3 = cycletime - hightime
	case 4
		PCB_PINSEL1 = PCB_PINSEL1 or &H00000800		'IO(3)
		T3_MR0 = cycletime - hightime
	case 3
		PCB_PINSEL1 = PCB_PINSEL1 or &H20000000		'IO(2)
		T3_MR3 = cycletime - hightime
	case 2
		PCB_PINSEL0 = PCB_PINSEL0 or &H00020000		'IO(1)
		T2_MR1 = cycletime - hightime
	case 1
		PCB_PINSEL0 = PCB_PINSEL0 or &H00080000		'IO(0)
		T2_MR2 = cycletime - hightime
	end select
end sub

#else

' 3 different cycletimes -- THIS CODE HAS NOT BEEN VERIFIED
		
	' timer 0,1 are 32 bit,  but 2,3 are 16
	' so treat them all like 16 bits

sub HWPWM578 (cycle1, high5, high7, high8 )
	DIM prescale as INTEGER	
	DIM divider1  as INTEGER		
		
	prescale = 15		' (CCLK/PBSD/1000000) as the peripherals run at 15 MHz
	divider1 = 0
	
	while (cycle1 >= &H10000) 
		cycle1 = cycle1 >> 1
		prescale = prescale << 1
		divider1 = divider1 + 1
	loop
	T1_PR = prescale - 1				' counts to n-1
	cycle1 = cycle1 - 1					' counts to n-1
	
	T1_TCR = TxTCR_COUNTER_ENABLE			' Timer3 Enable
	 
	T1_MR0 = cycle1 -1
	T1_MCR = 0x2				' rollover when count reaches MR0
	T1_TC  = 0					' need to get into the proper range
	
	PWM1CON = 0xF
	
	PCB_PINSEL1 = PCB_PINSEL1 or &H00000080		'IO(11)
	PCB_PINSEL0 = PCB_PINSEL0 or &H08000000		'IO(10)
	PCB_PINSEL1 = PCB_PINSEL1 or &H00000200		'IO(4)
	
	T1_MR3 = high5 >> divider1
	T1_MR1 = high7 >> divider1
	T1_MR2 = high8 >> divider1
	
end sub


sub HWPWM126 (cycle2, high1, high2, high6 )
	DIM prescale as INTEGER	
	DIM divider2  as INTEGER		
		
	prescale = 15		' (CCLK/PBSD/1000000) as the peripherals run at 15 MHz
	divider2 = 0
	
	while (cycle2 >= &H10000) 
		cycle2 = cycle2 >> 1
		prescale = prescale << 1
		divider2 = divider2 + 1
	loop
	T2_PR = prescale - 1				' counts to n-1
	cycle2 = cycle2 - 1					' counts to n-1
	
	T2_TCR = TxTCR_COUNTER_ENABLE			' Timer3 Enable
	 
	T2_MR3 = cycle2 -1
	T2_MCR = 0x400				' rollover when count reaches MR3
	T2_TC  = 0					' need to get into the proper range
	
	PWM2CON = 0xF
	
	PCB_PINSEL0 = PCB_PINSEL0 or &H00080000		'IO(0)
	PCB_PINSEL0 = PCB_PINSEL0 or &H00020000		'IO(1)
	PCB_PINSEL0 = PCB_PINSEL0 or &H00008000		'IO(9)
	
	T2_MR2 = high1 >> divider2
	T2_MR1 = high2 >> divider2
	T2_MR0 = high6 >> divider2
	
end sub


sub HWPWM34 (cycle3, high3, high4 )
	DIM prescale as INTEGER	
	DIM divider3  as INTEGER		
		
	prescale = 15		' (CCLK/PBSD/1000000) as the peripherals run at 15 MHz
	divider3 = 0
	
	while (cycle3 >= &H10000) 
		cycle3 = cycle3 >> 1
		prescale = prescale << 1
		divider3 = divider3 + 1
	loop
	T3_PR = prescale - 1				' counts to n-1
	cycle3 = cycle3 - 1					' counts to n-1
	
	T3_TCR = TxTCR_COUNTER_ENABLE			' Timer3 Enable
	 
	T3_MR1 = cycle3 -1
	T3_MCR = 0x10			' rollover when count reaches MR1
	T3_TC  = 0				' need to get into the proper range
	
	PWM3CON = 0xF
	
	PCB_PINSEL1 = PCB_PINSEL1 or &H00000800		'IO(3)
	PCB_PINSEL1 = PCB_PINSEL1 or &H20000000		'IO(2)
	
	T3_MR3 = high3 >> divider3
	T3_MR0 = high4 >> divider3
	
end sub

#else
	#error -- PWM not poorted to this processor yet
#endif

jumpAroundHWPWM:

#endif

#endif
