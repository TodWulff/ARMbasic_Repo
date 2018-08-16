'==================================================================================================================
Const	 snan		=	$7F800001
'==================================================================================================================
Function atof(byref strg as string) as single				// for converting string to float

	// a function for ARMbasic v8.x+ where a string representation of a number is processed and a single is returned.
	// supports number enteries such as: 1, -1.2, 123.4e-2, 1e1, 1.e+004.05 (note fractional portions of the power of 10 is discarded as it is illegal to do so anyways...)
	// even an entry such as	-   0  1 2 33 6 5  .  10001 e +-003.2-34	is processed and the result returned is   -123.3651
	
	//  Useage example:  
		' print "Enter a real number (+/- integer or single (can include +/- e-notation too): ";
		' debugin inputstring
		' print inputstring
		' print 
		' print "Value derived: ";atof(inputstring)
		' print

	// surprisingly, we actually need quite a few vars to track all the shite we're tracking herein
	dim valu,power,exp_pwr,exp_valu as single
	dim i, i1, i2, i3, sign, exp_sign, str_end, tempint as integer
	if strg="" then return snan
	// and we need to set up some valid starting points for things...
	valu  = 0.0			// the numerical representation of the integral and decimal portions of the mantissa
	sign = 0				// the sign of the mantissa
	power = 1.0			// this is used to help properly place the decimal in the mantissa after processing the whole string
	exp_valu = 0.0			// this is the numerical representation of the integral and decimal portions of the e-notation's power of 10
	exp_pwr = 1.0			// like above this is used to help properly place the decimal in the enotation's power of 10 after processing the string for same.;
	exp_sign = 0			// the sign of the e-notation's power of 10 - i.e. the '-' in 1234E-3
	str_end = len(strg)-1	// calculate this once and use the var below - code saver...
	for i = 0 to str_end									// and here we go - clackity clack, then the strange silence as gravity pulls you over the top and down the rails...
		if (i=0) and ((strg(i)="e") or (strg(i)="E")) then return 0.0	// with no mantissa before the exponent, simply return 0.0
		if strg(i)="+" then i += 1							// ignore + and increment the index so that the next char can be processed by this iteration of the loop...
		if(strg(i)="-") then sign -= 1						// gotta keep track if the user entered a negative number...
		if (strg(i)>="0") and (strg(i)<="9") 
			tempint = strg(i)-"0"
			valu=10.0*valu+(tempint)  // build the val of the integral mantissa
			endif
		if ((strg(i)="e") or (strg(i)="E"))					// deal with inputs of the form 1e05 (no decimal in the mantissa)
			i-=1												// ... the mantissa is done and we got the value for it to this point
			strg(i)="."										// so simulate a decimal to trigger the following code
			endif
		if strg(i) = "."										// ok, we're goin fractional
			i += 1												// bump to the next char past the '.'
			for i1 = i to str_end							// and jump into a sub loop to parse the rest of the string
				i += 1											// need to inc the index of the outer loop(s) since we are processing in a sub-loop
				if (strg(i1)>="0") and (strg(i1)<="9")		// if the char is part of a number
					power*=10.0								// keep track of the post-decimal depth, so we can divide the integer decimal to arrive at the real decimal val
					tempint = strg(i1)-"0"
					valu=10.0*valu+(tempint)			// and build an integer representation of the decimal portions...
					endif
				if ((strg(i1)="e") or (strg(i1)="E")) 		// if we arrive at an e or an E then we jump yet again into a sub loop to pocoess e-notation
					i += 1										// bump the outer indicies to get past the e/E
					i1+=1										// ...
					for i2 = i1 to str_end				// and grind thru the rest of the string
						i+=1									// and continue to keep the outer indicies updated to where we are at
						i1+=1									// ...
						if(strg(i2)="-") then exp_sign -= 1		// if there is a - sym in the enotation, negate the enotation
						if (strg(i2)>="0") and (strg(i2)<="9")
							tempint = strg(i2)-"0"
							exp_valu=10.0*exp_valu+(tempint) // and build the mantissa portions of the enotation
							endif
						if strg(i2) = "."						// yes, I said mantissa as it is possible that someone could get the bright idea to try to do fractional powers of 10...
							i += 1								// and if they do, we need to process it as such, so that we can throw it away later, vs. concatenating and really screwing things up...
							i1+=1								// bump the outer indicies to get past the enotation's decimal point
							i2+=1								// ...
							for i3 = i2 to str_end		// and here we go with fractional enotation component parsing
								i += 1							// since we are into yet another subloop we must keep the outer indicies updated,
								i1+=1							// ...
								i2+=1							// ...
								if (strg(i3)>="0") and (strg(i3)<="9")		// if the char is part of a number
									exp_pwr*=10.0								// keep track of the post-decimal value, so we can divide the integer decimal to arrive at the real decimal val
									tempint = strg(i3)-"0"
									exp_valu=10.0*exp_valu+(tempint)  // and build an integer representation of the decimal portions of the enotation...
									endif
								next i3
							endif
						next i2
					exp_valu = (exp_valu/exp_pwr)*if(exp_sign<0,-1,1)		// at this level we are done processing the enotation portions of the construct and we create a proper single representing the enotation's power of 10, integer and decimal portion
					endif
				next i1
			endif
		next i
		exp_pwr = 1					// using this single to become our value to multiply the real mantissa by.  For the record, 10^0 = 1 so this is a perfect default, in case there is not any enotation and we fall right through to the return.
		if exp_sign < 0				// if power of 10 is <0, then we are needing to move the decimal left (much like calling Cadence in the Marine Corps, 'LEFT, LEFT, LEFT aighty LEFT)
			while (exp_valu <= -1)	// not using < 0  to get rid of fractional exponent portions of the enotation's power of 10
				exp_pwr/=10			// so while we are still negative powered, move the multiplier's decimal more left
				exp_valu+=1.0			// and keep track of how less negative in power we are
				loop					// until we are done and have arrived at a good multiplier...
		else							// so we are either a 0 power of 10, which case well fall thru, or a positive power of 10 and gotta shuffle to the right (To the RIGHT, my conservative Brothas. To the RIGHT!!!)
			while exp_valu >= 1		// not using > 0  to get rid of fractional exponent portions of the enotation's power of 10
				exp_pwr*=10			// same principles at a negative powers of 10, except we are moving the decimal to the right now.
				exp_valu-=1.0			// and keeping track of how much more positive in power we are
				loop					// until we are done and have arrived at a good multiplier...
		endif	
		return (valu/power)*if(sign<0,-1,1)*exp_pwr	// and we finally get to do the math to return a single that was converted from a string that may have included a integral and fractional portion of a mantissa and also possibly a integral and fractional portion of a e-notated power of 10...  Woo Hoo.!.
		

	endfunction
'==============================================================================
function uinputf1(byref str_pmpt as string, byref sing_var as single) as single		// for user input of floats
// 	use:  starti = uinputi("enter the float val (32bit ieee754):")
	dim usr_str(32) as string
	print str_pmpt;"(len<=";32;" characters): ";
	debugin usr_str
	
	sing_var = atof(usr_str)
	print usr_str;" --> ";sing_var
	return sing_var
	
	endfunction
'==================================================================================================================
function uinputf2(byref str_pmpt as string, byref sing_var as single) as single		// for user input of floats
// 	use:  starti = uinputi("enter the float val (32bit ieee754):")
	dim usr_str(32) as string
	print str_pmpt;"(len<=";32;" characters): ";
	debugin usr_str
	
	return atof(usr_str)
	
	endfunction

dim tempsing as single

main:

print uinputf1("Testing float input - enter a single: ",tempsing)
print "uinputf returned: "; tempsing
print
print uinputf2("Testing float input - enter a single: ",tempsing)
print "uinputf returned: "; tempsing


end
