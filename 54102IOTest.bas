 
 main:
 
 #include "LPC54102.bas"
 IOCON(0,1)=0x00000080
 IOCON(0,1)=0x00000080
 GPIO0DIR=0xfff73fff
 GPIO1DIR=ox0003ffff
 output(40)
 output(38)
 output(36)

 output(0)
 output(1)
 output(2)
 output(4)
 output(6)
 output(43)
 output(9)
 output(11)

 do
 
	 wait(10)
	 
	 out(40)=0
	 out(38)=0
	 out(36)=0

	 out(0)=0
	 out(1)=0
	 out(2)=0
	 out(4)=0
	 out(6)=0
	 out(43)=0
	 out(9)=0
	 out(11)=0
	 
	 wait(10)
	 
	 out(40)=1			'always lo
	 out(38)=1			'always hi
	 out(36)=1			'nice square wave, as expected, scope trigger

	 out(0)=1			'always hi
	 out(1)=1			'always hi
	 out(2)=1			'always hi
	 out(4)=1			'always lo
	 out(6)=1			'always lo
	 out(43)=1			'always lo
	 out(9)=1			'always lo
	 out(11)=1			'slow rise, sharp fall, see image
	 
 loop
 
 end
 