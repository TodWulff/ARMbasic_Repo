' credits: https://github.com/Jianan-Li/misc-arduino-sketches/tree/master/LEDMusicPlayer
' plays the star spangled banner

#include "__LIB\ARMbasicTargetVitals.lib"
#include "spk\SPK_support.lib"
#include "spk\SPK_notes.lib"


#define SPK_Melements (68-1) 	' the -1 adjust to a zero reference
#define SPM_MdefTempo 1000.0	'default tempo for this piece is 3000 - this is a denominator (larger # = slower tempo)
#define SPM_Volume	1			' 1 to 50 - a pseudo pwm approach - 25 a is 50% duty cycle.

'68 elements
#define nRest 1
const SPK_Mfreqs = {
nC4, nE4, nG4, nG4, nG4, nG4, nG4, nC5, nG4, nE4, nF4, nG4, nG4, nF4, nD4, nC4, nRest, 
nC4, nE4, nG4, nG4, nG4, nG4, nG4, nC5, nG4, nE4, nF4, nG4, nG4, nF4, nD4, nC4, nRest, 
nC5, nB4, nA4, nF4, nA4, nF4, nG4, nA4, nG4, nC5, nB4, nA4, nF4, nA4, nC5, nG4, nG4, nRest, 
nC4, nE4, nG4, nG4, nG4, nG4, nG4, nC5, nG4, nE4, nF4, nG4, nG4, nF4, nD4, nC4
}


'68 elements - durations: 2 = half note, and 8/3,4,6,8,12 

const SPK_Mdurations = { 
4.0, 4.0, 2.0, 2.0, 2.0, 2.0, 1.5, 4.0, 2.0, 4.0, 4.0, 2.0, 2.0, 4.0, 1.5, 1.0, 4.0, 
4.0, 4.0, 2.0, 2.0, 2.0, 2.0, 1.5, 4.0, 2.0, 4.0, 4.0, 2.0, 2.0, 4.0, 1.5, 1.0, 4.0, 
3.0, 8.0, 2.0, 2.0, 2.0, 2.0, 1.5, 4.0, 2.0, 4.0, 4.0, 2.0, 2.0, 3.0, 1.5, 1.0, 4.0, 
4.0, 4.0, 4.0, 2.0, 2.0, 2.0, 2.0, 1.5, 4.0, 2.0, 4.0, 4.0, 2.0, 2.0, 3.0, 1.5, 1.0
}


#ifdef LPC54102
	#define LPC54102_LED	31			' for external LED
#endif

sub playmelody

	dim i as integer
	dim SPK_Mnote_duration as single

	for i= 0 to SPK_Melements
		SPK_Mnote_duration = SPM_MdefTempo/SPK_Mdurations(i)
		SPK_BEEP(SPK_Mfreqs(i), SPM_Volume, (1*SPK_Mnote_duration))

		#ifdef LPC54102_LED
			out(LPC54102_LED)=i and 1					'toggle the LED state with each note
		#endif

		print chr(if(i mod 2 = 0,"+","*")); '~
	next i

endsub
 
MAIN:

#ifdef LPC54102_LED
	output(LPC54102_LED)						' i've an LED hooked to this gpio for visual feedback purposes only
#endif

playmelody
out(_SPK_IO_PORT)=1						' relax spk driver

#ifdef LPC54102_LED
	out(LPC54102_LED)=1						' turn lef off
#endif

END
