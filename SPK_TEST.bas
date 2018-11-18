#include "spk\SPK_support.lib"

 
MAIN:

dim int, freq_, vol_, dur_, lastfreq, lastvol, lastdur as integer

lastfreq = -1
lastvol = -1
lastdur = -1


'spk_sweep
		
	DO
		
		
		Print "Enter Freq (INT, 0-10000, <0 to exit): ";
		Debugin Freq_
		if Freq_ < 0 then exit
		if freq_ = 0 then freq_=if(lastfreq = -1, 2500, lastfreq)  ' default to 2500 or last freq
		Print Freq_;" Enter Volume (INT, 0-50): ";
		Debugin Vol_
		if Vol_ = 0 then Vol_=if(lastvol = -1, 25, lastvol)   ' default to 25 or last volume
		Print Vol_;" Enter Duration in MS (INT >0): ";
		Debugin Dur_
		if Dur_ = 0 then Dur_=if(lastdur = -1, 500, lastdur) ' default to 500 or last duration
		Print Dur_
		Print
		
doit:
		
		if(SPK_BEEP(FREQ_, VOL_, DUR_)) then Print "Error!"
		LastFreq = freq_
		LastDur = dur_
		lastvol= vol_
		Print
		Print
		
	LOOP

bloop
bleep
blip
bloop
bloop
bleep
blip
bloop
bloop
bleep
blip
bloop

END
