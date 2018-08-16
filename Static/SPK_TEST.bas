#include "SPK\SPK_support.lib"
 
 ' Preprocessor used to assert hard-coded constants vs using variables
 #define _HiFreq 5000
 #define _LoFreq 0
  #define _SpkFreqLoopStep 100
#define _MaxVol 50
 #define _MinVol 0
  #define _SpkVolLoopStep 5
#define _TestDur 50 'mS
 

 
 
 
MAIN:

	DO

/*		' FOR VOLUME = _MinVol TO _MaxVol STEP _SpkVolLoopStep

			' FOR FREQ = _LoFreq TO _HiFreq STEP _SpkFreqLoopStep
				' SPK_BEEP(FREQ, VOLUME, _TestDur)
			' NEXT FREQ
			' FOR FREQ = _HiFreq DOWNTO _LoFreq STEP _SpkFreqLoopStep
				' SPK_BEEP(FREQ, VOLUME, _TestDur)
			' NEXT FREQ

		' NEXT VOLUME

		' FOR VOLUME = _MaxVol TO _MinVol STEP _SpkVolLoopStep

			' FOR FREQ = _LoFreq TO _HiFreq STEP _SpkFreqLoopStep
				' SPK_BEEP(FREQ, VOLUME, _TestDur)
			' NEXT FREQ
			' FOR FREQ = _HiFreq DOWNTO _LoFreq STEP _SpkFreqLoopStep
				' SPK_BEEP(FREQ, VOLUME, _TestDur)
			' NEXT FREQ

		' NEXT VOLUME
*/

		Print "Enter Freq (INT, 0-10000, <0 to exit): ";
		Debugin Freq_
		if Freq_ < 0 then exit
		if freq_ = 0 then freq_ = lastfreq
		Print Freq_;" Enter Volume (INT, 0-50): ";
		Debugin Vol_
		if Vol_ = 0 then Vol_ = lastvol
'		if Vol_ < 0 then exit
		Print Vol_;" Enter Duration in MS (INT >0): ";
		Debugin Dur_
		if Dur_ = 0 then Dur_ = lastdur
'		if Dur_ < 0 then exit
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

END
