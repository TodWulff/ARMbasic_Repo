/* fixme and misc stuffs
	1 - need to work the domain code and parameter generation
	*/

#define include_misc
#define include_power_exp_log_sqrt
#define include_trig
#define include_hyper
#define include_rand
#define include_inverse_trig
#define include_factorial


#include "ab_math.bas"

#ifndef ab_math			// from ab_math.lib
const _nan		=	$7fc00000
const _infp		=	$7f800000
const _infn		=	$ff800000
#endif


#define functioncount		44 '** '44	

#define fn_acos			   1
#define fn_acosh		   2
#define fn_acot			   3
#define fn_acoth		   4
#define fn_acsc			   5
#define fn_acsch		   6
#define fn_asec			   7
#define fn_asech		   8
#define fn_asin			   9
#define fn_asinh		   10
#define fn_atan			   11
#define fn_atan2		   12
#define fn_atanh		   13
#define fn_ceil			   14
#define fn_cos			   15
#define fn_cosh			   16
#define fn_coth			   17
#define fn_csc			   18
#define fn_csch			   19
#define fn_ctan			   20
#define fn_exp			   21
#define fn_fabs			   22
#define fn_fact			   23
#define fn_fix			   24
#define fn_floor		   25
#define fn_fmod			   26
#define fn_int			   27
#define fn_log			   28
#define fn_log10		   29
#define fn_log10i		   30
#define fn_logn			   31
#define fn_pow			   32
#define fn_powi			   33
#define fn_reducerange	   34
#define fn_round		   35
#define fn_sci			   36
#define fn_sec			   37
#define fn_sech			   38
#define fn_sign			   39
#define fn_sin			   40
#define fn_sinh			   41
#define fn_sqrt			   42
#define fn_tan			   43
#define fn_tanh			   44

#define fpt_null			0
#define fpt_single			1
#define fpt_integer			2
#define fpt_string			3
#define fpt_byrefsingle		4
#define fpt_byrefinteger	5
#define fpt_byrefstring		6

#define frt_null			0
#define frt_single			1
#define frt_integer			2
#define frt_string			3

#define fpr_null				0
#define fpr_allreal				1
#define fpr_allrealnoones		2
#define fpr_allrealexzero		3
#define fpr_allrealnopi			4
#define fpr_allrealpinopi		5
#define fpr_onetooneexzero		6
#define fpr_onetoone			7
#define fpr_zerotooneexzero		8
#define fpr_zeroto34			9
#define fpr_allposrealinclz		10
#define fpr_allposrealgtone		11
#define fpr_n38top38			12	

#define maxbigposvar			360
#define minsmposvar			1e-8
#define minsmnegvar			-minsmposvar
#define maxbignegvar			-maxbigposvar
'*

function fname(funcno) as string	// returns a string of the function name
	select funcno
		case fn_acos
			return "acos"
		case fn_acosh
			return "acosh"
		case fn_acot
			return "acot"
		case fn_acoth
			return "acoth"
		case fn_acsc
			return "acsc"
		case fn_acsch
			return "acsch"
		case fn_asec
			return "asec"
		case fn_asech
			return "asech"
		case fn_asin
			return "asin"
		case fn_asinh
			return "asinh"
		case fn_atan
			return "atan"
		case fn_atan2
			return "atan2"
		case fn_atanh
			return "atanh"
		case fn_ceil
			return "ceil"
		case fn_cos
			return "cos"
		case fn_cosh
			return "cosh"
		case fn_coth
			return "coth"
		case fn_csc
			return "csc"
		case fn_csch
			return "csch"
		case fn_ctan
			return "ctan"
		case fn_exp
			return "exp"
		case fn_fabs
			return "fabs"
		case fn_fact
			return "fact"
		case fn_fix
			return "fix"
		case fn_floor
			return "floor"
		case fn_fmod
			return "fmod"
		case fn_int
			return "int"
		case fn_log
			return "log"
		case fn_log10
			return "log10"
		case fn_log10i
			return "log10i"
		case fn_logn
			return "logn"
		case fn_pow
			return "pow"
		case fn_powi
			return "powi"
		case fn_reducerange
			return "reducerange"
		case fn_round
			return "round"
		case fn_sci
			return "sci"
		case fn_sec
			return "sec"
		case fn_sech
			return "sech"
		case fn_sign
			return "sign"
		case fn_sin
			return "sin"
		case fn_sinh
			return "sinh"
		case fn_sqrt
			return "sqrt"
		case fn_tan
			return "tan"
		case fn_tanh
			return "tanh"
		case else
			return ""
		endselect
		endfunction

function fpcnt(funcno) as integer	// returns the # of parameter supported by the passed function
	select funcno
		case fn_atan2
			return 3
		case fn_fmod
			return 2
		case fn_pow
			return 2
		case fn_powi
			return 2
		case fn_reducerange
			return 3
		case fn_sci
			return 2
		case else
			return 1
		endselect
	endfunction

function fptyp(funcno, param) as integer	// return the parameter type for the given function and parameter number
	select param // this is 1,2 or 3
		case 1
			select funcno

				case fn_fact
					return fpt_integer

				case else
					return fpt_single				
				endselect
		case 2
			select funcno

				case fn_atan2
					return fpt_single				

				case fn_fmod
					return fpt_single				

				case fn_pow
					return fpt_single				

				case fn_powi
					return fpt_integer

				case fn_reducerange
					return fpt_single				

				case fn_sci
					return fpt_byrefsingle				

				case else
					return fpt_null
				endselect
		case 3
			select funcno

				case fn_atan2
					return fpt_byrefsingle

				case fn_reducerange
					return fpt_byrefinteger

				case else
					return fpt_null
				endselect
		case else
			return fpt_null		// we should never get here...
		endselect
		endfunction
		
function fptname(fpt) as string		// returns the verbose param type name for a given parameter type number
	select fpt
		case fpt_null
			return "null"
		case fpt_single
			return "single"
		case fpt_integer
			return "integer"
		case fpt_string
			return "string"
		case fpt_byrefsingle
			return "byref single"
		case fpt_byrefinteger
			return "byref integer"
		case fpt_byrefstring
			return "byref string"
		case else
			return ""
		endselect
	endfunction
		
function fprng(funcno,param) as integer	// return the range id for the given function and parameter
	select param // this is 1,2 or 3
		case 1
			select funcno

				case fn_acos
					return fpr_onetoone

				case fn_acosh
					return fpr_allposrealgtone

				case fn_acot
					return fpr_allreal

				case fn_acoth
					return fpr_allrealnoones

				case fn_acsc
					return fpr_allrealnoones

				case fn_acsch
					return fpr_allrealexzero

				case fn_asec
					return fpr_allrealnoones

				case fn_asech
					return fpr_zerotooneexzero

				case fn_asin
					return fpr_onetoone

				case fn_asinh
					return fpr_allreal

				case fn_atan
					return fpr_allreal

				case fn_atan2
					return fpr_allreal

				case fn_atanh
					return fpr_onetooneexzero

				case fn_ceil
					return fpr_allreal

				case fn_cos
					return fpr_allreal

				case fn_cosh
					return fpr_allreal

				case fn_coth
					return fpr_allrealexzero

				case fn_csc
					return fpr_allrealnopi

				case fn_csch
					return fpr_allrealexzero

				case fn_ctan
					return fpr_allrealnopi

				case fn_exp
					return fpr_allreal

				case fn_fabs
					return fpr_allreal

				case fn_fact
					return fpr_zeroto34

				case fn_fix
					return fpr_allreal

				case fn_floor
					return fpr_allreal

				case fn_fmod
					return fpr_allreal

				case fn_int
					return fpr_allreal

				case fn_log
					return fpr_allposrealinclz

				case fn_log10
					return fpr_allreal

				case fn_log10i
					return fpr_allreal

				case fn_logn
					return fpr_allreal

				case fn_pow
					return fpr_allreal

				case fn_powi
					return fpr_allreal

				case fn_reducerange
					return fpr_allreal

				case fn_round
					return fpr_allreal

				case fn_sci
					return fpr_allreal

				case fn_sec
					return fpr_allrealnopi

				case fn_sech
					return fpr_allreal

				case fn_sign
					return fpr_allreal

				case fn_sin
					return fpr_allreal

				case fn_sinh
					return fpr_allreal

				case fn_sqrt
					return fpr_allposrealinclz

				case fn_tan
					return fpr_allrealnopi

				case fn_tanh
					return fpr_allreal

				case else
					return fpt_single		
					
				endselect
		case 2
			select funcno

				case fn_atan2
					return fpr_allreal				

				case fn_fmod
					return fpr_allreal				

				case fn_pow
					return fpr_allreal				

				case fn_powi
					return fpr_allreal

				case fn_reducerange
					return fpr_allreal				

				case fn_sci
					return fpr_null				

				case else
					return fpt_null
					
				endselect
		case 3
			select funcno

				case fn_atan2
					return fpr_null

				case fn_reducerange
					return fpr_null

				case else
					return fpt_null
					
				endselect
		case else
			return fpt_null		// we should never get here...
		endselect
		endfunction

function fprname(fpr) as string		// return the verbose name for a given range id
	select fpr
		case fpr_null				
			return "null"
		case fpr_allreal				
			return "-inf <= x <= inf - all real numbers"
		case fpr_allrealnoones		
			return "all real numbers excluding -1 <= x <= 1"
		case fpr_allrealexzero		
			return "all real numbers excluding 0"
		case fpr_allrealnopi			
			return "all real numbers excluding pi/1 and n*pi"
		case fpr_allrealpinopi		
			return "all real numbers excluding n*pi"
		case fpr_onetooneexzero		
			return "-1 to 1 excluding 0"
		case fpr_onetoone			
			return "-1 to 1"
		case fpr_zerotooneexzero		
			return "0 < x <= 1 (note 0 is excluded)"
		case fpr_zeroto34			
			return "0 <= x <= 34"
		case fpr_allposrealinclz		
			return "0 <= x <= infinity"
		case fpr_allposrealgtone		
			return "1 < x <= infinity"
		case fpr_n38top38			
			return "-39 < x < 39"
		case else
			return ""
		endselect
	endfunction
		
function frtype(funcno) as integer		// returns the return-type that a function provides back to the caller
	select funcno
		case fn_fix
			return frt_integer
		case fn_int
			return frt_integer
		case else
			return frt_single
		endselect
	endfunction

function frtname(frt) as string		// returns the verbose name for a given return type
	select frt
		case fpt_null
			return "null"
		case fpt_single
			return "single"
		case fpt_integer
			return "integer"
		case fpt_string
			return "string"
		case else
			return ""
		endselect
	endfunction
	
function bogusx(px1 as single, px2 as single) as single		// for timing tests
	return 0.0
	endfunction

'** // function atof(byref strg as string) as single				// for user input of floats

	' // a function for armbasic v8.x+ where a string representation of a number is processed and a single is returned.
	' // supports number enteries such as: 1, -1.2, 123.4e-2, 1e1, 1.e+004.05 (note fractional portions of the power of 10 is discarded as it is illegal to do so anyways...)
	' // even an entry such as	-   0  1 2 33 6 5  .  10001 e +-003.2-34	is processed and the result returned is   -123.3651
	
	' //  useage example:  
		// print "enter a real number (+/- integer or single (can include +/- e-notation too): ";
		// debugin inputstring
		// print inputstring
		// print 
		// print "value derived: ";atof(inputstring)
		// print

	' // surprisingly, we actually need quite a few vars to track all the shite we're tracking herein
	' dim valu,power,exp_pwr,exp_valu as single
	' dim i, i1, i2, i3, sign, exp_sign, str_end as integer
	' if strg="" then return _nan
	' // and we need to set up some valid starting points for things...
	' valu  = 0.0			// the numerical representation of the integral and decimal portions of the mantissa
	' sign = 0				// the sign of the mantissa
	' power = 1.0			// this is used to help properly place the decimal in the mantissa after processing the whole string
	' exp_valu = 0.0			// this is the numerical representation of the integral and decimal portions of the e-notation's power of 10
	' exp_pwr = 1.0			// like above this is used to help properly place the decimal in the enotation's power of 10 after processing the string for same.;
	' exp_sign = 0			// the sign of the e-notation's power of 10 - i.e. the '-' in 1234e-3
	' str_end = len(strg)-1	// calculate this once and use the var below - code saver...
	' for i = 0 to str_end									// and here we go - clackity clack, then the strange silence as gravity pulls you over the top and down the rails...
		' if (i=0) and ((strg(i)="e") or (strg(i)="e")) then return 0.0	// with no mantissa before the exponent, simply return 0.0
		' if strg(i)="+" then i += 1							// ignore + and increment the index so that the next char can be processed by this iteration of the loop...
		' if(strg(i)="-") then sign -= 1						// gotta keep track if the user entered a negative number...
		' if (strg(i)>="0") and (strg(i)<="9") then valu=10.0*valu+(strg(i)-"0")  // build the val of the integral mantissa
		' if ((strg(i)="e") or (strg(i)="e"))					// deal with inputs of the form 1e05 (no decimal in the mantissa)
			' i-=1												// ... the mantissa is done and we got the value for it to this point
			' strg(i)="."										// so simulate a decimal to trigger the following code
			' endif
		' if strg(i) = "."										// ok, we're goin fractional
			' i += 1												// bump to the next char past the '.'
			' for i1 = i to str_end							// and jump into a sub loop to parse the rest of the string
				' i += 1											// need to inc the index of the outer loop(s) since we are processing in a sub-loop
				' if (strg(i1)>="0") and (strg(i1)<="9")		// if the char is part of a number
					' power*=10.0								// keep track of the post-decimal depth, so we can divide the integer decimal to arrive at the real decimal val
					' valu=10.0*valu+(strg(i1)-"0")			// and build an integer representation of the decimal portions...
					' endif
				' if ((strg(i1)="e") or (strg(i1)="e")) 		// if we arrive at an e or an e then we jump yet again into a sub loop to pocoess e-notation
					' i += 1										// bump the outer indicies to get past the e/e
					' i1+=1										// ...
					' for i2 = i1 to str_end				// and grind thru the rest of the string
						' i+=1									// and continue to keep the outer indicies updated to where we are at
						' i1+=1									// ...
						' if(strg(i2)="-") then exp_sign -= 1		// if there is a - sym in the enotation, negate the enotation
						' if (strg(i2)>="0") and (strg(i2)<="9") then exp_valu=10.0*exp_valu+(strg(i2)-"0") // and build the mantissa portions of the enotation
						' if strg(i2) = "."						// yes, i said mantissa as it is possible that someone could get the bright idea to try to do fractional powers of 10...
							' i += 1								// and if they do, we need to process it as such, so that we can throw it away later, vs. concatenating and really screwing things up...
							' i1+=1								// bump the outer indicies to get past the enotation's decimal point
							' i2+=1								// ...
							' for i3 = i2 to str_end		// and here we go with fractional enotation component parsing
								' i += 1							// since we are into yet another subloop we must keep the outer indicies updated,
								' i1+=1							// ...
								' i2+=1							// ...
								' if (strg(i3)>="0") and (strg(i3)<="9")		// if the char is part of a number
									' exp_pwr*=10.0								// keep track of the post-decimal value, so we can divide the integer decimal to arrive at the real decimal val
									' exp_valu=10.0*exp_valu+(strg(i3)-"0")  // and build an integer representation of the decimal portions of the enotation...
									' endif
								' next i3
							' endif
						' next i2
					' exp_valu = (exp_valu/exp_pwr)*if(exp_sign<0,-1,1)		// at this level we are done processing the enotation portions of the construct and we create a proper single representing the enotation's power of 10, integer and decimal portion
					' endif
				' next i1
			' endif
		' next i
		' exp_pwr = 1					// using this single to become our value to multiply the real mantissa by.  for the record, 10^0 = 1 so this is a perfect default, in case there is not any enotation and we fall right through to the return.
		' if exp_sign < 0				// if power of 10 is <0, then we are needing to move the decimal left (much like calling cadence in the marine corps, 'left, left, left aighty left)
			' while (exp_valu <= -1)	// not using < 0  to get rid of fractional exponent portions of the enotation's power of 10
				' exp_pwr/=10			// so while we are still negative powered, move the multiplier's decimal more left
				' exp_valu+=1.0			// and keep track of how less negative in power we are
				' loop					// until we are done and have arrived at a good multiplier...
		' else							// so we are either a 0 power of 10, which case well fall thru, or a positive power of 10 and gotta shuffle to the right (to the right, my conservative brothas. to the right!!!)
			' while exp_valu >= 1		// not using > 0  to get rid of fractional exponent portions of the enotation's power of 10
				' exp_pwr*=10			// same principles at a negative powers of 10, except we are moving the decimal to the right now.
				' exp_valu-=1.0			// and keeping track of how much more positive in power we are
				' loop					// until we are done and have arrived at a good multiplier...
		' endif	
		' return (valu/power)*if(sign<0,-1,1)*exp_pwr	// and we finally get to do the math to return a single that was converted from a string that may have included a integral and fractional portion of a mantissa and also possibly a integral and fractional portion of a e-notated power of 10...  woo hoo.!.
		

	' endfunction
	
' function uinputf (byref str_pmpt as string) as single		// for user input of floats
' // 	use:  starti = uinputi("enter the float val (32bit ieee754):")
	' dim ret_val as single
	' dim usr_str(32) as string
	' print str_pmpt;" (len<=";32;"): ";
	' debugin usr_str
	' ret_val = atof(usr_str)
	' print usr_str;" --> ";ret_val
	' return ret_val
	' endfunction  	
	'*

main:
	dim x,y,z, i, start, t(100), oh as integer
	dim _p0, _p1, _p2, _p3 as single
	dim plo,plosm,phi,phism, pexlo, pexhi as single
	
	init_random

	// automatic tests
	
			' start = timer
			' //' for i = 1 to 100
				' select 1
					' case 1
						' _p0 = bogusx(_p1, _p2)
					' endselect
			' oh = timer - start

			//' print OH
			
			oh = 16


	for x = 1 to functioncount
		print
		// print "function #: ";x;" name: ";		(x) // ,"","param count: ";fpcnt(x),"","returns a ";frtname(frtype(x))
		print fname(x)
		// print "parameter vitals: "
		for i = 1 to 100
			for y = 1 to fpcnt(x)
				//' print "param #: "; y ; " is a "; fptname(fptyp(x, y)) ; " with a valid range of: "; fprname(fprng(x,y));" test val: ";
				select fprng(x,y)

					case fpr_null				
						// return "null"
						phi = maxbigposvar
						phism = minsmposvar
						plosm = minsmnegvar
						plo = maxbignegvar
						pexlo = phi
						pexhi = plo

					case fpr_allreal				
						// return "-inf <= x <= inf - all real numbers"
						phi = maxbigposvar
						phism = minsmposvar
						plosm = minsmnegvar
						plo = maxbignegvar
						pexlo = phi
						pexhi = plo

					case fpr_allrealnoones		
						// return "all real numbers excluding -1 <= x <= 1"
						phi = maxbigposvar
						phism = minsmposvar
						plosm = minsmnegvar
						plo = maxbignegvar
						pexlo = -1
						pexhi = 1

					case fpr_allrealexzero		
						// return "all real numbers excluding 0"
						phi = maxbigposvar
						phism = minsmposvar
						plosm = minsmnegvar
						plo = maxbignegvar
						pexlo = 0
						pexhi = 0

					case fpr_allrealnopi			
						// return "all real numbers excluding pi/1 and n*pi"
						phi = maxbigposvar
						phism = minsmposvar
						plosm = minsmnegvar
						plo = maxbignegvar
						pexlo = 0
						pexhi = 0

					case fpr_allrealpinopi		
						// return "all real numbers excluding n*pi"
						phi = maxbigposvar
						phism = minsmposvar
						plosm = minsmnegvar
						plo = maxbignegvar
						pexlo = phi
						pexhi = plo

					case fpr_onetooneexzero		
						// return "-1 to 1 excluding 0"
						plo = -1
						phi = 1
						pexlo = 0
						pexhi = 0

					case fpr_onetoone			
						// return "-1 to 1"
						plo = -1
						phi = 1
						pexlo = phi
						pexhi = plo

					case fpr_zerotooneexzero		
						// return "0 < x <= 1 (note 0 is excluded)"
						plo = 0
						phi = 1
						pexlo = 0
						pexhi = 0

					case fpr_zeroto34			
						// return "0 <= x <= 34"
						plo = 0
						phi = 34
						pexlo = phi
						pexhi = plo

					case fpr_allposrealinclz		
						// return "0 <= x <= infinity"
						' phi = maxbigposvar
						' phism = minsmposvar
						' plosm = minsmnegvar
						' plo = maxbignegvar

						phi = maxbigposvar
						plo = minsmposvar
						pexlo = phi
						pexhi = plo

					case fpr_allposrealgtone		
						// return "1 < x <= infinity"
						plo = 1
						phi = maxbigposvar
						pexlo = phi
						pexhi = plo

					case fpr_n38top38			
						// return "-39 < x < 39"
						plo = -39
						phi = 39
						pexlo = phi
						pexhi = plo
					endselect
				getp0again:
				_p0 = randb(plo, phi)
				if _p0<=pexhi and _p0>=pexlo then goto getp0again
				
				select y

					case 1
						_p1 = _p0

					case 2
						_p2 = _p0

					case 3
						' _p3 = _p0
					endselect
				next y
				
			start = timer
			select x

				case fn_acos
					_p0 = acos(_p1)

				case fn_acosh
					_p0 = acosh(_p1)

				case fn_acot
					_p0 = acot(_p1)

				case fn_acoth
					_p0 = acoth(_p1)

				case fn_acsc
					_p0 = acsc(_p1)

				case fn_acsch
					_p0 = acsch(_p1)

				case fn_asec
					_p0 = asec(_p1)

				case fn_asech
					_p0 = asech(_p1)

				case fn_asin
					_p0 = asin(_p1)

				case fn_asinh
					_p0 = asinh(_p1)

				case fn_atan
					_p0 = atan(_p1)

				case fn_atan2
					_p0 = atan2(_p2, _p1, _p3)

				case fn_atanh
					_p0 = atanh(_p1)

				case fn_ceil
					_p0 = ceil(_p1)

				case fn_cos
					_p0 = cos(_p1)

				case fn_cosh
					_p0 = cosh(_p1)

				case fn_coth
					_p0 = coth(_p1)

				case fn_csc
					_p0 = csc(_p1)

				case fn_csch
					_p0 = csch(_p1)

				case fn_ctan
					_p0 = ctan(_p1)

				case fn_exp
					_p0 = exp(_p1)

				case fn_fabs
					_p0 = fabs(_p1)

				case fn_fact
					_p0 = fact(_p1)

				case fn_fix
					_p0 = fix(_p1)

				case fn_floor
					_p0 = floor(_p1)

				case fn_fmod
					_p0 = fmod(_p1, _p2)

				case fn_int
					_p0 = int(_p1)

				case fn_log
					_p0 = log(_p1)

				case fn_log10
					_p0 = log10(_p1)

				case fn_log10i
					_p0 = log10i(_p1)

				case fn_logn
					_p0 = logn(_p1)

				case fn_pow
					_p0 = pow(_p1, _p2)

				case fn_powi
					_p0 = powi(_p1, _p2)

				case fn_reducerange
					_p0 = reducerange(_p1, _p2, z)

				case fn_round
					_p0 = round(_p1)

				case fn_sci
					_p0 = sci(_p1, _p2)

				case fn_sec
					_p0 = sec(_p1)

				case fn_sech
					_p0 = sech(_p1)

				case fn_sign
					_p0 = sign(_p1)

				case fn_sin
					_p0 = sin(_p1)

				case fn_sinh
					_p0 = sinh(_p1)

				case fn_sqrt
					_p0 = sqrt(_p1)

				case fn_tan
					_p0 = tan(_p1)

				case fn_tanh
					_p0 = tanh(_p1)
				' case else
					' _p0 = _nan
				endselect
			t(i) = timer - start - oh

			' print i, _p1,
			print i,t(i), _p1,
			select fpcnt(x)

				case 1
					//' printf("%d%c%.8f%c%.8f",i,chr(9),_p1,chr(9),_p0)

				case 2
					//' printf("%d%c%.8f%c%.8f%c%.8f",i,chr(9),_p1,chr(9),_p2,chr(9),_p0)
					print _p2,

				case 3
					select x
						case fn_atan2
							//' printf("%d%c%.8f%c%.8f%c%.8f%c%.8f",i,chr(9),_p1,chr(9),_p2,chr(9),_p3,chr(9),_p0)
							print _p2,_p3,
						case fn_reducerange
							//' printf("%d%c%.8f%c%.8f%c%.8f%c%.8f",i,chr(9),_p1,chr(9),_p2,chr(9),z,chr(9),_p0)
							print _p2,z,
						endselect
				endselect
			print _p0
			next i
			' start = 0
			' for i = 1 to 100
			' start += t(i)
			' next i
			' start *= 0.01
			' print start
		next x
end
