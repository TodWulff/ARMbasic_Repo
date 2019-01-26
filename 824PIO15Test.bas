
	dim start, x as integer
	dim _824PinEnableReg0Bits as integer
	#define _824PinEnableReg0Addr 0x4000C1C0
	#define _824PinEnableReg0Mask 0x01ffffff
	_824PinEnableReg0Bits = *_824PinEnableReg0Addr
	*_824PinEnableReg0Addr = _824PinEnableReg0Mask and (_824PinEnableReg0Bits and 0xffffffcf) 'b5:b4 = 0...
	' *0x4000C1C0 = 0x01fffECf	'hmm doesn't work when put here - need to figure it out - put inside of main for now...

	' print "Paused.  SWD enabled.  Connect debugger and then press enter to continue."
	' debugin start


output(15)
while x < 1000
x+=1
out(15) = x and 1
wait (500)
loop
