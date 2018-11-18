#include "__LIB\ARMbasicTargetVitals.lib"
#define UHS_enabledebug 1		// This needs to be prior to the support lib being #inc'd
#include "UHS\UHS_support.lib"
#include "spk\SPK_support.lib"

sub _UHS_Init
DEBUG(Print "Debug is ON")
PRODUCTION(Print "FYSA, Debug is OFF")

DEBUG(Print "UHS Init Entered")

DEBUG(Print "Setting Ports ...",)
	output(_LED_PORT)
	output(_SPK_PORT)
	input(_UHS_SINT)
	input(_UHS_MISO)
	input(_UHS_GPXO)
	output(_UHS_MOSI)
	output(_UHS_SCLK)
	output(_UHS_SSEL)
	output(_UHS_SRST)
DEBUG(Print "Ports Set")

	_UHS_bleep			' audible feedback		
	
DEBUG(Print "Setting up IO ...",)
	'setup soc io
	out(_UHS_MOSI)=0	' set inactive
	out(_UHS_SCLK)=0	' set inactive
	out(_UHS_SSEL)=1	' set inactive
	out(_UHS_SRST)=1	' set inactive
DEBUG(Print "IO Setup")
	
DEBUG(Print "Resetting UHS",)
	'reset the soc
	out(_UHS_SRST)=0
	out(_UHS_SRST)=1	' >200nS needed ("The RES pulse width can be as short as 200ns") - 'Set GPIO via Out(x)' takes 0.3765 uS
DEBUG(dim i as integer)
DEBUG(do)
DEBUG(i+=1)
DEBUG(print chr(if(i mod 2 = 0,"+","*"));)
DEBUG(until in(_UHS_GPXO))
DEBUG(Print "","UHS Reset")
	
	out(_LED_PORT)=0
	_UHS_bloop			' audible feedback
	' _UHS_blip		
	' _UHS_blop		

DEBUG(Print "UHS Init Exiting")
endsub

sub _UHS_SendSPIByte
	' All SPI transfers are MSB first, per UM
	' assumes that _UHS_SCLK is unknown
	' assumes that _UHS_SSEL is unknown
	dim i as integer
	out(_UHS_SCLK)=0	' set inactive

endsub

sub _UHS_ReceiveSPIByte

endsub

function  _UHS_GetReg(_UHS_Reg as integer) as integer

return 1
endfunction


Main:
	
	DEBUG(Print "UHS Main Entered")
	_UHS_Init

	do
		dim i as integer
		i+=1
		out(_LED_PORT) = i and 1
		wait(500)
		if i = 11 then exit
	loop

	DEBUG(Print "Exiting to AB FW")
end






