
'#include "Coridium_pcb.bas"
'#include "ABmt_LPC824.bas"		'modified var names as applicable from Coridium original

'#define SYSCON_WDTOSCCTRL      *&H40048024 ' Watchdog oscillator control (R/W)
'#define SYSCON_PDRUNCFG        *&H40048238 ' Power-down configuration Register (R/W)
'#define SYSCON_SYSAHBCLKCTRL   *&H40048080 ' System AHB clock control (R/W)
'#define VICIntEnable  *&HE000E100 'Set Enable
'#define VICIntEnClear *&HE000E180 'Clr Enable  to READ the INTs that are enabled


ABmt_WDT_init_824:
	DIM WDT_J,WDT_K
	
	WDT_J = SYSCON_PDRUNCFG
	SYSCON_PDRUNCFG = (WDT_J - &H040) '   (1<<5)	' power up the WDT Osc - b6   'WDTOSC_PD Watchdog oscillator. 
					' 0 = Powered; 1 = Powered down; Resets to 1;  Write a 1 to the 'clear' register to clear it.
	WAIT(1)
	SYSCON_WDTOSCCTRL = 0x40    'DIVSEL = %00000 (bits 4:0); FREQSEL =  %00100  (bits 8:5) a ~500Khz clock
	WAITMICRO(500)
	WDT_K = SYSCON_SYSAHBCLKCTRL
	SYSCON_SYSAHBCLKCTRL = (WDT_K OR &H20000) '(1<<16)' enable the WDT clock to run from the WDT Osc. bit 17
	WWDT_TC = 0x00098968	'Twdclk * 625000 * 4 = Twdclk * 2500000 = 5 sec (500KHz clock)
	WWDT_MOD = 0x00000003	' enables WDT (once fed) & reset if it starves (b0 & b1)
							' a RESET clears the bits
			'Remark:  [from the UM]
			'Because of the synchronization step, software must add a delay of three 
			'WDCLK clock cycles between the feed sequence and the time the WDPROTECT bit is 
			'enabled in the MOD register. The length of the delay depends on the selected watchdog 
			'clock WDCLK.
	VICIntEnable = &H1008	'ENABLES INTERRUPT IN NVIC
	wait(10)		'"This is the time delay - not optimized, as WDTclock can vary +- 40%"
	WWDT_FEED = 0xAA	' WDT init'd - feeding now to start it up...
	WWDT_FEED = 0x55
RETURN

ABmt_WDT_feed_824:
 'feed the dog
			WWDT_FEED = 0xAA
			WWDT_FEED = 0x55
RETURN
'
SUB ABmt_WDT_824
	CALL ABmt_WDT_feed_824
ENDSUB
'
'=================================================
'------------- Watchdog Timer (WWDT) -----------------------------------------
'#define WWDT_MOD      *&H40000000' mode register (R/W)
'#define WWDT_TC       *&H40000004' timer constant register (R/W)
'#define WWDT_FEED     *&H40000008' feed sequence register (W)
'#define WWDT_TV       *&H4000000C' timer value register (R)
'#define WWDT_WARNINT  *&H40000014' timer warning int. register (R/W)
'#define WWDT_WINDOW   *&H40000018' timer window value register (R/W)




