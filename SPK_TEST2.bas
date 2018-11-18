' credits: https://github.com/Jianan-Li/misc-arduino-sketches/tree/master/LEDMusicPlayer
' plays the star spangled banner

#include "__LIB\ARMbasicTargetVitals.lib"
#include "spk\SPK_support.lib"
#include "spk\SPK_notes.lib"


#define SPK_Melements (76-1) 	' the -1 adjust to a zero reference
#define SPM_MdefTempo 3000.0	'default tempo for this piece is 3000 - this is a denominator (larger # = slower tempo)
#define SPM_Volume	1			' 1 to 50 - a pseudo pwm approach - 25 a is 50% duty cycle.

'76 elements
const SPK_Mfreqs = { 
  nF5,nD5,nAS4,nD5,nF5,nAS5,nD6,nC6,nAS5,nD5,nE5,nF5,
  nF5,nF5,nD6,nC6,nAS5,nA5,nG5,nA5,nAS5,nAS5,nF5,nD5,nAS4,
  nD6,nD6,nD6,nDS6,nF6,nF6,nDS6,nD6,nC6,nD6,nDS6,nDS6,
  nDS6,nD6,nC6,nAS5,nA5,nG5,nA5,nAS5,nD5,nE5,nF5,
  nF5,nAS5,nAS5,nAS5,nA5,nG5,nG5,nG5,nC6,nDS6,nD6,nC6,nAS5,nAS5,nA5,
  nF5,nF5,nAS5,nC6,nD6,nDS6,nF6,nAS5,nC6,nD6,nDS6,nC6,nAS5
  }

'76 elements - durations: 2 = half note, and 8/3,4,6,8,12
const SPK_Mdurations = {
  6.0,12.0, 4.0, 4.0, 4.0, 2.0, 6.0,12.0, 4.0, 4.0, 4.0, 2.0, 
  8.0, 8.0, 2.76, 8.0, 4.0, 2.0, 8.0, 8.0, 4.0, 4.0, 4.0, 4.0, 4.0, 
  6.0,12.0, 4.0, 4.0, 4.0, 2.0, 8.0, 8.0, 4.0, 4.0, 4.0, 2.0, 
  4.0, 2.76, 8.0, 4.0, 2.0, 8.0, 8.0, 4.0, 4.0, 4.0, 2.0, 
  4.0, 4.0, 4.0, 8.0, 8.0, 4.0, 4.0, 4.0, 4.0, 8.0, 8.0, 8.0, 8.0, 4.0, 4.0, 
  8.0, 8.0, 2.76, 8.0, 8.0, 8.0, 2.0, 8.0, 8.0, 4.0, 4.0, 4.0, 2.0
  }'over the    land     of  the  free  and  the  home  of  the  brave

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
