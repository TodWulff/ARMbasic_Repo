#define CORE_M4						' needed for this dual core device, & given we're working with the NVIC on the M4
#include "LPC54102.bas"				' needed for the header #defs

#define LPC54102_Freq 96000000		' MRT scaler is 24 bits wide on the 54102 - @ 100MHz, that boils down to 5.7hz (174.633 mS per cycle)
#define LPC54102_MinMRTFreqHz 6		' actually 5.7xxhz, but kept it an int.
#define LPC54102_MaxMRTFreqHz 97656	' 1024 clocks minimum ($ff * 4 @ 100MHz)

#define Switch_FreqHz	100

dim ToggleFlag as integer
dim S1_ptr as integer
dim S2_ptr as integer

interrupt sub Ticker_INT_ISR
	' MRT_IRQ_FLAG = MRT_IRQ_FLAG	' clears the MRT interrupt 
	if ToggleFlag = 0 
		ToggleFlag = 1
		call(S1_ptr)
		return 
	else
		ToggleFlag = 0
		call(S2_ptr)
		return
	endif
	endsub
	
sub Ticker_INT_Config(SwitchFreqHz as integer)
	dim MRT_TimerConstant as integer
	if SwitchFreqHz < LPC54102_MinMRTFreqHz then SwitchFreqHz = LPC54102_MinMRTFreqHz
	if SwitchFreqHz > LPC54102_MaxMRTFreqHz then SwitchFreqHz = LPC54102_MaxMRTFreqHz
	MRT_TimerConstant = LPC54102_Freq / SwitchFreqHz
	Print "SwitchFreqHz: ";SwitchFreqHz;" Hz"," T: ";timer
	SCB_AHBCLKCTRL(1) or= SYSCON_CLOCK_MRT	' set the MRT bit to enable the clock to the register interface.
	SCB_PRESETCTRL(1) and= 0xFFFFFFFE 		' Clear reset to the MRT.
	MRT_INTVAL(0) = (MRT_TimerConstant or $80000000) and 0x80FFFFFF 				'b31 = 1 for immediately load the MRT IntVal
	MRT_CTRL(0) = 0x00000001				' enable TIMERn Interrupt in repeat interrupt mode
	MRT_IRQn = (addressof Ticker_INT_ISR) or 1	' assign the isr sub addy to the NVIC vector table for MRT_irq  (the 'or 1' is for thumb code purposes)
	endsub

sub Ticker_INT_Enable	
	Print "Task Ticker CFG'd @ ",timer;
	wait(10)	' to allow printing to complete
	VICIntEnable0 or= (1<<10)	' enable the MRT interrupt
	endsub

sub Sub1
	print chr(10);0;
	MRT_IRQ_FLAG = MRT_IRQ_FLAG	' clears the MRT interrupt 
	endsub

sub Sub2
	print chr(10);1;
	MRT_IRQ_FLAG = MRT_IRQ_FLAG	' clears the MRT interrupt 
	endsub

main:
	print "Starting"
	Ticker_INT_Config(Switch_FreqHz)
	ToggleFlag = 0
	S1_ptr = addressof Sub1
	S2_ptr = addressof Sub2
	wait(10)	' to allow printing to complete
	Ticker_INT_Enable
	do
		print ".";
		waitmicro(100)  'anything less and it breaks on my dev sys - prolly due to overrun of some buffer somewhere.
	loop
end

