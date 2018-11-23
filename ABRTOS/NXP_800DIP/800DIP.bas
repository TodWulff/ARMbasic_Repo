'ABRTOS - a multitasking version of ARMbasic (Coridium Corp.)
'
' This is the version for the NXP LPC800-DIP product, 
' incorporating NXP's LPC824 ARM microcontroller.
'
'Original work and project designer is Tod.Wulff@engineer.com
' Modified by team member Gary Zwan (aka Olzeke51)
'
' Licensing and NO Warranty to useability notice to follow later 
'
' created Nov 21, 2018
'
#define XMAS		'comment out for your usage


'===========================================
'ABRTOS files needed
'
'
'
'==============================================
'
'============== Variables / CONSTs / #def(s)
DIM j,k,l		'counters
'the following defines require the name to be the primary GOSUB name in the
'corresponding #include files - one to one match
#define ABmt_Task0	ABmt_WDT_824
#define ABmt_Task1	ABmt_Blinky_824
#define ABmt_Task2	ABmt_Printy_824
#define ABmt_Task3	ABmt_Forthy_824
'
'============== #includes
#include "Coridium_pcb.bas"
#include "LPC8xx.bas"
'#include XMAS.bas		'defines for a particular 8051 OEM pcb & 800DIP
#include "ABmt_WDT_824.bas"
#include "ABmt_Blinky_824.bas"
#include "ABmt_Printy_824.bas"
#include "ABmt_Forthy_824.bas"

'
'
'============== Modules - SUBs / FUNCs / Labeled:
Hey_yall:
PRINT "hello World, welcome to ABrtos, a multitasking ARMbasic program"
PRINT "This particular version is for the NXP LPC824 processor on"
PRINT "their LPC800-DIP product; available from Coridium.us"
PRINT
RETURN
'
'========================================= M A I N : ===========================
Main:
'===========
call Hey_yall
'
'
'===========
Configure:
			'can I have a goto point
'define pin ports, etc
'
'
'===========
WDT_init:
#ifdef LPC824
	DIM WD_J,WD_K
	'
	WD_J = SYSCON_PDRUNCFG
	SYSCON_PDRUNCFG = (WD_J - &H040) '   (1<<5)	' power up the WDT Osc - b6   'WDTOSC_PD Watchdog oscillator. 
					' 0 = Powered; 1 = Powered down; Resets to 1;  Write a 1 to the 'clear' register to clear it.
	WAIT(1)
	SYSCON_WDTOSCCTRL = 0x40    'DIVSEL = %00000 (bits 4:0); FREQSEL =  %00100  (bits 8:5) a ~500Khz clock
	WAITMICRO(500)
	WD_K = SYSCON_SYSAHBCLKCTRL
	SYSCON_SYSAHBCLKCTRL = (WD_K OR &H20000) '(1<<16)' enable the WDT clock to run from the WDT Osc. bit 17
	WD_WDT_TC = 0x00098968	'Twdclk * 625000 * 4 = Twdclk * 2500000 = 5 sec (500KHz clock)
	WD_WDT_MOD = 0x00000003	' enables WDT (once fed) & reset if it starves (b0 & b1)
							' a RESET clears the bits
			'Remark:  [from the UM]
			'Because of the synchronization step, software must add a delay of three 
			'WDCLK clock cycles between the feed sequence and the time the WDPROTECT bit is 
			'enabled in the MOD register. The length of the delay depends on the selected watchdog 
			'clock WDCLK.
	VICIntEnable = &H1008	'ENABLES INTERRUPT IN NVIC
	wait(10)		'"This is the time delay - not optimized, as WDTclock can vary +- 40%"
	WD_WDT_FEED = 0xAA	' WDT init'd - feeding now to start it up...
	WD_WDT_FEED = 0x55
#else
	#error "Undefined CPU"
	STOP
#endif
'
'
'==========
Sched_timer:
'MRT timer channel 0 is used as the scheduler clock / time slice - currently 1Khz approx.
#ifdef LPC824
'
	PRINT "Configure MRT channel 0 for time slicer"
'
#else
	#error "Undefined CPU"
	STOP
#endif
'
'
'=========
Sched_init_vars:
' this is where the vars are initialized to be ready for Task launching/ Scheduling
'
' ??? do I want a Warm & Cold versions
'=========
Sched_start:
'
' ??? what kind of scheduler is being used???
GOSUB ABmt_Task0		'this will feed (as needed)the WDT and return
GOSUB ABmt_Task1		'see the #defines & #includes for the ABmt_Taskx
GOSUB ABmt_Task2		'see the #defines & #includes for the ABmt_Taskx
GOSUB ABmt_Task3		'see the #defines & #includes for the ABmt_Taskx

GOTO Sched_start 		'??? do I want a loop of some condition???
end



