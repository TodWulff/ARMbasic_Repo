#ifndef ab_math
#define ab_math

goto jump_around_ABmath

#define ab_math_ver	1.02

' Contributed by Tod

'  Revision History
'
'v 1.02      25May13 added to the Coridium standard release
'
'	•	split out inverse trig as separate #define
'	•	re-ordered functions to define include_power_exp_log_sqrt earlier	
'
'v 1.01		04Jul12	Maintenance Release, 44 functions
'
'	•	Added this Revision History comment block
'	•	Made the INT funct to be a synonym of FLOOR vs. FIX (Thanks to Yahoo Group User: KeepIt SimpleStupid)
'	•	Thanks to Chris Parker (Group User: pompey2) for helping to begin the debug effort on the lib and for offering performance improvement suggestions.
'		o	Fixed the NAN preamble to be more descript about the specific subject matter
'		o	Reworked the LOG10 funct as it presented to be incorrect (I had initially used LOG vs. LOGN...)
'		o	POWI used for all funct that have a static integral as the power argument.
'		o	Changed all static integer divides (/11, /2) to inverse multiplies (*0.090909…, *0.5)
'			-	Did this via a Constant Array - low cost and helps to keep code somewhat readable (fewer magic numbers)
'		o	Changed all static integer factorial divides (/fact(6),/fact(3)) to inverse multiplies (*0.0013888…,* 0.1666…)
'			-	Also did this via a Constant Array - low cost and helps to keep code somewhat readable (fewer magic numbers)
'
'v 1.00		11Jun12	Initial Release
'
'	•	44 Functions
'	•	Following preamble and code are descriptive of initial implementation
'
'


' here are the #defs for the various function groups
' you can either uncomment them here, or drop the 
' #defs in your main app prior to #including ab_math.lib

' #define include_misc
' #define include_factorial
' #define include_power_exp_log_sqrt
' #define include_trig
' #define include_inverse_trig
' #define include_hyper
' #define include_rand

'** // guidance and reference information

#if defined include_trig
 #define include_power_exp_log_sqrt  
#endif
#if defined include_inverse_trig
 #define include_power_exp_log_sqrt  
#endif
#if defined include_hyper
 #define include_power_exp_log_sqrt  
#endif

#if defined include_misc
#elif defined include_power_exp_log_sqrt
#elif defined include_trig
#elif defined include_inverse_trig
#elif defined include_hyper
#elif defined include_hyper
#elif defined include_rand
#elif defined include_factorial
#else
#error -- you must define one of the function groups 
#endif



'   fixme and misc stuffs
'	0 - need to check for the umpteenth gajizillionth time regarding the domains for the various functions.
'		a - i am tired of being ignant in math...
'	1 - need to optimize the reducerange function' - i was really exhausted.
'	2 - need to verify that fmod works good in the negative domain
'	3 - should log10i return a _nan on neg parameters being passed???
'
'
' floating point NAN reference
'(just a fyi for those who might be curious about now NANs are represented)
	
' s111 1111 1axx xxxx xxxx xxxx xxxx xxxx

' ms = mantissa sign   a = q/snan flag
' exp (exponent) is signed(a) inverted? 
' ms es exp    a mantisse/nan payload

' 1  0 0000000 0 0000000000000000000000	-0.0
' 0  0 0000000 0 0000000000000000000000	 0.0

' 0  1 1111111 1 0000000000000000000000	 qnan
' 1  1 1111111 1 0000000000000000000000	-qnan

' 0  1 1111111 0 0000000000000000000000	 infinity
' 1  1 1111111 0 0000000000000000000000	-infinity

' 0  1 1111111 0 0000000000000000000001	 snan w/ payload in bits
' 1  1 1111111 0 0000000000000000000001	-snan

' for example, a bit-wise example of a ieee floating-point standard single
' precision (32-bit) nan would be: s111 1111 1axx xxxx xxxx xxxx xxxx xxxx where 
' s is the sign (most often ignored in applications), a determines the type 
' of nan, and x is an extra payload (most often ignored in applications).
' if a = 1, it is a quiet nan; if a is zero and the payload is nonzero, 
' then it is a signaling nan.

' ARMbasic only reports NAN.
' It ignores the sign bit and does not differentiate between +/-NAN, +/-qNAN, nor +/- sNAN.
' For ARMbasic, the user will need to implement functions to drill down into the sign, type,
' and payload of a NAN, if needed by user's code.
'

' ab_math.lib  readme & acknowledgments
'	
'this math lib was built using guidance contained in the algerbra.chm which is available for download from
'http://mathonweb.com/algebra_e-book.htm
'
'additional guidance is contained below
'
'ab numerics library - ab_math instantiates a set of functions to compute common mathematical operations 
'and transformations:
'
'trigonometric functions:
'	cos - compute cosine (funct)		domain = -inf to +inf  range = -1 to +1
'	sin - compute sine (funct)		domain = -inf to +inf  range = -1 to +1
'	tan - compute tangent (funct)
'
'inverse trigonometric functions:
'	acos - compute arc cosine (funct)
'	asin - compute arc sine (funct)
'	atan - compute arc tangent (funct)
'	atan2 - compute arc tangent with two parameters (funct)
'
'hyperbolic functions:
'	cosh - compute hyperbolic cosine (funct)
'	sinh - compute hyperbolic sine (funct)
'	tanh - compute hyperbolic tangent (funct)
'
'exponential and logarithmic functions:
'	exp - compute exponential funct (funct)
'	frexp - get significand and exponent (funct)
'	ldexp - generate number from significand and exponent (funct)
'	log - compute natural logarithm (funct)
'	log10 - compute common logarithm (funct)
'	modf - break into fractional and integral parts (funct)
'
'power functions
'	pow - raise to power (funct)
'	sqrt - compute square root (funct)
'
'rounding, absolute value and remainder functions:
'	fix - truncates a floating-point expression returning its integer portion.
'	int - returns the largest integer less than or equal to a numeric expression.
'	floor - round down value (funct)
'	ceil - round up value (funct)
'	fabs - compute absolute value (funct)
'	fmod - compute remainder of division (funct)
'	
'derived equivalents
'(http://msdn.microsoft.com/en-us/library/w3t84e33%28v=vs.71%29.aspx)
'the following is a list of non-intrinsic math functions that can be derived from the intrinsic math functions:
'
'secant 						(sec(x)) 		1 / cos(x)
'cosecant 						(csc(x)) 		1 / sin(x)
'cotangent 						(ctan(x)) 		1 / tan(x)
' inverse sine 					(asin(x)) 		atan(x / sqrt(-x * x + 1))
' inverse cosine 				(acos(x)) 		atan(-x / sqrt(-x * x + 1)) + 2 * atan(1)
'inverse secant 				(asec(x)) 		2 * atan(1) – atan(sign(x) / sqrt(x * x – 1))
'inverse cosecant 				(acsc(x)) 		atan(sign(x) / sqrt(x * x – 1))
'inverse cotangent 				(acot(x)) 		2 * atan(1) - atan(x)
'hyperbolic sine 				(sinh(x)) 		(exp(x) – exp(-x)) / 2
'hyperbolic cosine 				(cosh(x)) 		(exp(x) + exp(-x)) / 2
'hyperbolic tangent 			(tanh(x)) 		(exp(x) – exp(-x)) / (exp(x) + exp(-x))
'hyperbolic secant 				(sech(x)) 		2 / (exp(x) + exp(-x))
'hyperbolic cosecant 			(csch(x)) 		2 / (exp(x) – exp(-x))
'hyperbolic cotangent 			(coth(x)) 		(exp(x) + exp(-x)) / (exp(x) – exp(-x))
'inverse hyperbolic sine 		(asinh(x)) 	log(x + sqrt(x * x + 1))
'inverse hyperbolic cosine 		(acosh(x)) 	log(x + sqrt(x * x – 1))
'inverse hyperbolic tangent 	(atanh(x)) 	log((1 + x) / (1 – x)) / 2
'inverse hyperbolic secant 		(asech(x)) 	log((sqrt(-x * x + 1) + 1) / x)
'inverse hyperbolic cosecant 	(acsch(x))		log((sign(x) * sqrt(x * x + 1) + 1) / x)
'inverse hyperbolic cotangent	(acoth(x))		log((x + 1) / (x – 1)) / 2
' base-10 logarithm 			(log10(x))		log(x) / log(10)
' logarithm to base n 			(logn(x))		log(x) / log(n)
'
'intrinsics: sqrt, atan, cos, sin, tan, sign, exp, log
'
'
'(from: http://www.analyzemath.com/domainrange/domain_range_functions.html)
'algebraic functions
'function_ 					domain 			range
'f(x) = x 					(-inf , + inf) 	(-inf , + inf)
'f(x) = x 2					(-inf , + inf) 	[0 , + inf)
'f(x) = x3 					(-inf , + inf) 	(-inf , + inf)
'f(x) = xn , n even 		(-inf , + inf)		[0 , + inf)
'f(x) = xn , n odd 			(-inf , + inf) 	(-inf , + inf)
'f(x) = | x | 				(-inf , + inf) 	[0 , + inf)
'f(x) = square root ( x ) 	[0 , + inf) 		[0 , + inf)
'f(x) = cube root ( x ) 	(-inf , + inf) 	(-inf , + inf)
'
'trigonometric functions
'function_ 			domain 								range
'f(x) = sin ( x ) 	(-inf , + inf) 						[-1 , 1]
'f(x) = cos ( x ) 	(-inf , + inf) 						[-1 , 1]
'f(x) = tan ( x ) 	all real numbers except pi/1 + n*pi (-in , + inf)
'f(x) = sec ( x ) 	all real numbers except pi/1 + n*pi (-inf , -1] u [1 , + inf)
'f(x) = csc ( x ) 	all real numbers except n*pi 		(-inf , -1] u [1 , + inf)
'f(x) = cot ( x ) 	all real numbers except n*pi 		(-inf , + inf)
'
'inverse trigonometric functions
'function_ 				domain 						range
'f(x) = sin-1( x ) 	[-1 , 1] 						[-pi/2 , pi/2]
'f(x) = cos-1( x ) 	[-1 , 1] 						[0 , pi]
'f(x) = tan-1( x ) 	(-inf , + inf) 				(-pi/2 , + pi/2)
'f(x) = sec-1( x ) 	(-inf , -1] u [1 , + inf) 	[0 , pi/2) u [pi , 3 pi/2)
'f(x) = csc-1( x ) 	(-inf , -1] u [1 , + inf) 	(-pi , -pi/2] u (0 , pi/2]
'f(x) = cot-1( x ) 	(-inf , + inf) 				(0 , pi)
'
'logarithmic and exponential functions
'function_ 							domain 			range
'f(x) = a x 						(-inf , + inf) 	(0 , +inf)
'f(x) = log a ( x ) 				(0 , + inf) 	(-inf , + inf)
'f(x) = a x + k{k=a const}			(-inf , + inf) 	(k , + inf)
'f(x) = log a ( x - k){k=a const}	(k , + inf)		(-inf , + inf)
'
'hyperbolic functions
'function_ 									domain 					range
'sinh(x) = (e x - e -x) / 2 				(-inf , + inf) 			(-inf , + inf)
'cosh(x) = (e x + e -x) / 2 				(-inf , + inf) 			[1 , + inf)
'tanh(x) = (e x - e -x) / (e x + e -x) 		(-inf , + inf) 			(-1 , + 1)
'coth(x) = (e x + e -x) / (e x - e -x) 		(-inf , 0) u (0 , + inf) 	(-inf , - 1) u (1 , +inf)
'sech(x) = 2 / (e x + e -x) 				(-inf , + inf) 			(0 , 1)
'sech(x) = 2 / (e x - e -x) 				(-inf , 0) u (0 , +inf) 	(-inf , 0) u (0 , +inf) 
'
'

' constants


' Constant Table division by integer
CONST DivByInt = { 0.0, 1.0000000000000000, 0.5000000000000000,
					0.33333333333333300, 0.25000000000000000, 0.20000000000000000,
					0.16666666666666700, 0.14285714285714300, 0.12500000000000000,
					0.11111111111111100, 0.10000000000000000, 0.09090909090909090 }

' Constant Table division by fact
CONST DivByFact = { 0.0, 1.00000000000000000000000, 0.50000000000000000000000,
					0.16666666666666700000000, 0.04166666666666670000000, 0.00833333333333333000000,
					0.00138888888888889000000, 0.00019841269841269800000, 0.00002480158730158730000,
					0.00000275573192239859000, 0.00000027557319223985900, 0.00000002505210838544170 }


const _2pi 		=	6.283185307179590000
const _pi 		=	3.141592653589790000
const _halfpi 	=	1.570796326794900000
const _qtrpi 	=	0.785398163397448000
const _6thpi	=	0.523598775598299000
const _8thpi	=	0.392699081698724000

const _sqrtk	=	3.162277660168380000
const _e		=	2.718281828459050000
const _ln10		=	2.302585092994050000
const _logln	=	0.434294481903252000

const _rad2deg 	= 57.295779513082320876798154814105		'x*180/pi
const _deg2rad 	= 0.01745329251994329576923690768489	'x*pi/180

const _atanident	= 0.267949192431123000				' 2-sqrt(3)
const _sqrt3		= 1.732050807568880000				' sqrt(3)
	
const _nan		=	$7fc00000
const _infp		=	$7f800000
const _infn		=	$ff800000

'*

#if defined include_factorial

const factorials = { 1.0, 1.0, 2.0, 
					 6.0, 24.0, 120.0, 
					 720.0, 5040.0, 40320.0, 
					 362880.0, 3628800.0, 39916800.0,
					 479001600.0, 6227020800.0, 87178291200.0,
					 1307674368000.0, 20922789888000.0, 355687428096000.0,
					 6402373705728000.0, 121645100408832000.0, 2432902008176640000.0,
					 5.10909421717094E+19, 1.12400072777761E+21, 2.5852016738885E+22,
					 6.20448401733239E+23, 1.55112100433310E+25, 4.03291461126606E+26,
					 1.08888694504184E+28, 3.04888344611714E+29, 8.8417619937397E+30,
					 2.65252859812191E+32, 8.22283865417792E+33, 2.63130836933694E+35,
					 8.68331761881189E+36, 2.95232799039604E+38 }

function fact(x as integer) as single				
	if (x > 34) or (x < 0) then return _nan else return factorials(x)
	endfunction

#endif

#if 1 '** common functions used across the higher-order groups of functions '*

function fix(x as single) as integer
	' fix truncates a floating-point expression to its integer portion, returning an integer
	' print fix(12.49), fix(12.54)    'output is:  12  12
	return x
	endfunction
		
function floor(x as single) as single
	' floor returns the largest integral single value not greater than fparam
	' floor of 3.8 is 3.0, floor of -2.3 is -3.0
	if(x = fix(x)) or x>=0 then return fix(x) else return fix(x)-1
	endfunction	
	
function int(x as single) as integer
	return floor(x)
	endfunction

function ceil(x as single) as single
	'	returns the smallest integral single value that is not less than x
	if(x = fix(x)) then return fix(x) else return floor(x)+1
	endfunction

function round(x as single) as single
	if ceil(x)-x <= x-floor(x) then return ceil(x) else return floor(x)
	endfunction
	
function sign(x as single) as single
	' returns the 1 if x is >0, -1 if x<0, 0 if x=0
	return if(x<0,-1,if(x>0,1,0))
	endfunction

function fmod(n as single, d as single) as single
	' returns the floating-point remainder of numerator/denominator.
	if d <> 0 then return n-(fix(n/d)*d) else return _nan
	endfunction
	
function powi(b as single, e as integer) as single
	' returns the base raised to the integral power of exponent
	dim res as single
	if e = 0 then return 1
	if e = 1 then return b
	res = 1
	while e		' iterate thru the exponent, moving it towards zero while multiplying the base
		res = res*if(e<0,1/b,b)
		e = e+if(e<0,1,-1)
		loop
	return res
	endfunction

function log10i(x as single) as single
	' returns the integral log10 of the parameter 
	dim log as integer
	
	log = 0
	if x < 0 then x*=-1		' is this legit or should I return nan for neg #s?
	while ((x<1)or(x>=10))	' iterate thru the number reducing its power of 10 while counting powers of 10
		log=if(x<1,-1,1)+log
		x=if(x<1,10,0.1)*x
		loop
		
	return log
	endfunction

function sci(n as single, byref p as single) as single
	p = log10i(n)
	return (n/powi(10,p))
	endfunction
	
#endif

#ifdef include_misc
		
function fabs(fparam as single) as single
	'	returns the absolute single value of the parameter
	return abs(fparam)
	endfunction
	
#endif

#ifdef include_power_exp_log_sqrt



function sqrt(x as single) as single		' using newton's method + some tod magic- good - <=6 iterations typical
' definition: the square root function is defined as the function that takes any 
' positive number y as input and returns the positive number x which would have 
' to be squared (i.e. multiplied by itself), to obtain y. the square root of y is 
' usually denoted like this:
' 	    ______
' 	__ /  y
' 	  v
' the sqrt symbol is called the radical symbol and the quantity inside it is called 
' the argument of the square root. 

	dim result, last_guess as single
	
	if x<0 then return _nan
	if x = 0 then return 0
	if x = 1 then return 1
	
	' tod's magic for a realitively close start - thank you m$ excel.!.
	last_guess = _sqrtk * powi(10,int(log10i(x)*0.5))
		
	while last_guess > 0
		result = (last_guess*0.5)+((x/(2*last_guess)))
		if result=last_guess then exit
		last_guess = result
		loop
	return result
	endfunction

function exp(x as single) as single		' using polynomial - good
	' definition: we define a function called the exp function that takes an argument x and 
	' returns the value of e raised to the power x
	
	dim fract,e_intg,e_fract as single
	dim intg, neg as integer
	
	intg = round(x)			' get the integral of the number
	fract = x - intg		' get the real of the number
	e_intg = 1				' prep for the following loop
	
	if intg < 0 then neg =-1 else neg = 1	' doing this to make sure to move the decimal the 
											' correct direction in the following loop

	while intg				' this raises the e_intg var to the power of intg - 
		intg-=1*neg			' reduce the count by 1 or bump it by one, or reduct it by 1 if moving other direction
		e_intg*=_e			' _e is the constant for e.  e_intg represents e^intg
		loop
	
	' calculate the fractional power to use in the e^x = e^intg * e^fract
	e_fract	=1+fract+(powi(fract,2)*divbyfact(2))+(powi(fract,3)*divbyfact(3))+(powi(fract,4)*divbyfact(4))+(powi(fract,5)*divbyfact(5))+(powi(fract,6)*divbyfact(6))+(powi(fract,7)*divbyfact(7))+(powi(fract,8)*divbyfact(8))+(powi(fract,9)*divbyfact(9))
	
	return if(neg<0,(1/e_intg)*e_fract,e_intg*e_fract)		' and do the math to return the desired result
	endfunction

function logn(x as single) as single		' using polynomial - good
	' ln(x) is defined as the function that takes any positive number x as input
	' and returns the exponent to which the base e must be raised to obtain x. 
	' (e denotes the number 2.7182818284590…) 
	
	dim p, msrt, y as single
	if x<=0 then return _nan		' ... any positive number ...
	msrt = sqrt(sci(x,p))			' p is set to the power of 10 on return and the mantissa is returned
	y = (msrt-1)/(msrt+1)
	return 4*(y+(powi(y,3)*DivByInt(3))+(powi(y,5)*DivByInt(5))+(powi(y,7)*DivByInt(7))+(powi(y,9)*DivByInt(9))+(powi(y,11)*DivByInt(11)))+ _ln10*p
	endfunction

function pow(x as single, p as single) as single	' using the identity e^ln(x) = x and the exponention property of exponents. 
	' definition: the power function is defined as the function that takes any number x
	' as input, raises x to some power p, and returns x p as output. 	' x^p = e^p^logn(x)

	' if the power p is a positive integer or a positive fraction with an odd denominator then 
	' the domain is all x. if the power p is a negative integer or a negative fraction with an
	' odd denominator then the domain is all x except x = 0. for all other values of the power
	'	p the domain is positive x only.
	
	if p=0 then return 1
	if p=1 then return x
	if x=0 then return 0
	
'temp ??????????????????????????
	if x < 0 then return _nan
	
	return exp(p*logn(x))
	endfunction

function log(x as single) as single		' using polynomial - good
' log(x) is defined as the function that takes any positive number x as input
' and returns the exponent to which the base 10 must be raised to obtain x. 

	dim p, msrt, y as single
	
	if x<=0 then return _nan	' ... any positive number ...
	msrt = sqrt(sci(x,p))		' p is set to the power of 10 on return and the mantissa is returned
	y = (msrt-1)/(msrt+1)
	return 4*_logln*(y+(powi(y,3)*DivByInt(3))+(powi(y,5)*DivByInt(5))+(powi(y,7)*DivByInt(7))+(powi(y,9)*DivByInt(9))+(powi(y,11)*DivByInt(11)))+p
	endfunction

function log10(x as single) as single
	return logn(x) * _logln  	' logn(x)/logn(10)
	endfunction

#endif

#ifdef include_trig
	
function reducerange(x as single, sc as single, byref m as integer) as single

	' this is used to reduce a number to within a range and maintain the phase angles
	' for some gawd awful reason, this kicked my arse for hours over a few nights,
	' i strongly suspect that i got lost as i couldn't see the gd forest 'cause of all of
	' the effin trees. i was, admittedly, buring the candle at both ends too.
	' this is a function that can be optimized a lot i suspect.
	' however, i am still tired and ... it ain't broke, boss...

	dim res as single	
	dim scsign, xsign as integer
	
	xsign=1
	scsign =1
	
	if x < 0 then
		xsign = -1
		x *= -1
		endif
	
	if sc < 0 then
		scsign = -1
		sc *= -1
		endif
		
	res = fmod(x,sc)
	m = (int(x/sc))
	
	if (res = 0) and (m = 1) and (xsign=scsign)
		' print "same side same val - unity"
		m = 0
		return x * xsign
	elseif (res = 0) and (m = 1) and (xsign<>scsign)
		' print "opposite unities"
		m = 2 * if(scsign=-1,-1,1)
		return sc * scsign
	elseif (res = 0) and (m > 1) and (xsign <> scsign)
		' print "opposite side - multiples: ";m
		m = if(scsign=-1,-m-1,m+1)
		return sc * scsign
	elseif (res = 0) and (m > 1) 'and xsign = scsign
		' print "same side - multiples: ";m
		m = if(scsign=1,(m-1)*-1,m-1)
		return sc * scsign
	elseif scsign = 1 and xsign = 1
		m *= -1
		return res
	elseif scsign = 1 and xsign = -1
		m += 1
		return sc - res	
	elseif scsign = -1 and xsign = -1
		return res * -1
	else ' scsign = -1 and xsign = 1
		m += 1
		m *= -1
		return res - sc
	endif
	endfunction

function sin(rad as single) as single		' using polynomial - good
	' domain and range: from the graphs above we see that for both the sin and cos functions the
	' domain is all real numbers and the range is all reals from -1 to +1 inclusive. for the tan
	' function the domain is all real numbers except ±p/2, ±3p/2, ±5p/2, …, 
	' (or in degrees: ±90°, ±270°, ±450°, …), where the tan function is undefined.
	' the range of the tan function is all real numbers.
	
	dim multiple as integer
	dim period, symm as single
	period = reducerange(rad,_2pi,multiple)		' 0-360
	symm = reducerange(period,_halfpi,multiple)	' 0-90
	if multiple = -1 then symm = _halfpi-symm
	if multiple = -3 then symm = _halfpi-symm
	
	if symm <=_qtrpi			' <=45 deg
		return if(multiple<-1,-1,1)*(symm-(powi(symm,3)*divbyfact(3))+(powi(symm,5)*divbyfact(5))-(powi(symm,7)*divbyfact(7)))
	else
		return if(multiple<-1,-1,1)*(1-(powi((_halfpi-symm),2)*divbyfact(2))+(powi((_halfpi-symm),4)*divbyfact(4))-(powi((_halfpi-symm),6)*divbyfact(6)))
	endif
	endfunction

function cos(rad as single) as single		' using polynomial - good
	' domain and range: from the graphs above we see that for both the sin and cos functions the
	' domain is all real numbers and the range is all reals from -1 to +1 inclusive. for the tan
	' function the domain is all real numbers except ±p/2, ±3p/2, ±5p/2, …, 
	' (or in degrees: ±90°, ±270°, ±450°, …), where the tan function is undefined.
	' the range of the tan function is all real numbers.
	
	dim multiple as integer
	dim period, symm as single
	period = reducerange(rad,_2pi,multiple)
	symm = reducerange(period,_halfpi,multiple)
	if multiple = -1 then symm = _halfpi-symm
	if multiple = -3 then symm = _halfpi-symm
	
	if symm <=_qtrpi
		return if(((multiple=-1)or(multiple=-2)),-1,1)*(1-(powi(symm,2)*divbyfact(2))+(powi(symm,4)*divbyfact(4))-(powi(symm,6)*divbyfact(6)))
	else
		return if(((multiple=-1)or(multiple=-2)),-1,1)*((_halfpi-symm)-(powi((_halfpi-symm),3)*divbyfact(3))+(powi((_halfpi-symm),5)*divbyfact(5))-(powi((_halfpi-symm),7)*divbyfact(7)))
	endif
	endfunction
	
function tan(rad as single) as single		' using polys - ok - want better accuracy
	' domain and range: from the graphs above we see that for both the sin and cos functions the
	' domain is all real numbers and the range is all reals from -1 to +1 inclusive. for the tan
	' function the domain is all real numbers except ±p/2, ±3p/2, ±5p/2, …, 
	' (or in degrees: ±90°, ±270°, ±450°, …), where the tan function is undefined.
	' the range of the tan function is all real numbers.
	
	dim multiple, tancofunc_flag, tanident_flag as integer
	dim period, symm,result as single

	tancofunc_flag = 0
	tanident_flag = 0

	period = reducerange(rad,_pi,multiple)			'0-180
	symm = reducerange(period,_halfpi,multiple)		'0-90
	if multiple then symm =_halfpi - symm			'mirror about 90 to leverage the property properly
	
	if symm > _qtrpi
		' use cofunction to get it < _qtrpi (45 deg) and then retest above
		tancofunc_flag = 1
		symm = _halfpi-symm
		endif
	if symm > _8thpi
		' use identity to get it < _8thpii (22.5 deg)and then use poly above
		tanident_flag = 1
		symm *= divbyint(2)
		endif
	' use poly here since it is (finally) < 22.5 deg
	result = symm + (powi(symm,3)*0.333333333333333)+((2*(powi(symm,5)))*0.0666666666666667)+((17*(powi(symm,7)))*0.00317460317460317)+((62*(powi(symm,9)))*0.000352733686067019) '+((__*(powi(symm,11)))/______)

	if tanident_flag
		' do the math here to implement the tan identy
		result = (2*result)/(1-(result*result))
		endif
	if tancofunc_flag
		' do the math here to implement the tan cofunction
		result = 1/result
		endif
	return if(multiple,-1,1)*result
	endfunction

#endif
	
#ifdef include_inverse_trig
		
function atan(rad as single) as single		' using polys - ok - want better accuracy
' definition: arctan(x) is defined as “the set of all angles whose tan is x”. 
' it is a one-to-many relation.

' definition: atan(x) is defined as “the one angle between -p/2 and +p/2 radians 
' (or between -90° and +90°) whose tan is x”. it is a one-to-one function. 

' definition: of all the values returned by the arctan relation, the one that is 
' the same as the value returned by the arctan function is called the principal 
' value of the arctan relation.

' this function is atan - a one to one implementation...

	dim atansymmetry_flag, atancompang_flag, atanident_flag as integer
	dim result as single
	
	' as with a lot of these functions that use polynomials, the fixes required to get the 
	' arguments small enough for the polys are accumulative and need to be addressed in two
	' phases - reducing the actual argument to a small enough value to apply the poly to
	' and then force-feed the poly's results into the remainder of the balance of the 'fixes'.
	' the flags are used to trigger the post-poly code to fire if needed, in proper sequence
	' and, if required, provide signage correction too

	atansymmetry_flag = 0  	'if rad<0 atan(-x) = -atan(x)
	atancompang_flag = 0	'if rad>1 atan(x)=pi/2-atan(1/x)
	atanident_flag = 0		'if rad>2-sqrt(3) then atan(x)=pi/6+atan((_sqrt3*rad)-1)/(_sqrt3+rad)
	
	if rad < 0   			' apply symmetry if arg is <0
		rad*=-1				' will be implemented at the end of the function
		atansymmetry_flag = 1
		endif
		
	if rad>=1				' use comp angle if arg >= 1
		rad = 1/rad			' will be implemented in the end
		atancompang_flag = 1
		endif
		
	if rad>_atanident				' if arg stil to big then do the identity
		rad = ((_sqrt3*rad)-1)/(rad+_sqrt3)		' which will be implemente at end
		if rad <0					' i had to resort to some trickery here as the poly relies on
			rad *=-1				' pow and it or its sub functions don't deal well with neg
			atanident_flag = -1		' numbers so i force it positive and then adjust at the
			else					' end during implementation
			atanident_flag = 1		' or i let it stay positive and just flag that it needs finishin
			endif
		endif
	' use poly here since it is (finally) small enuf
	result = rad - (powi(rad,3)*divbyint(3))+(powi(rad,5)*divbyint(5))-(powi(rad,7)*divbyint(7))+(powi(rad,9)*divbyint(9)) '+((__*(powi(symm,11)))/______)

	if atanident_flag		' do the math here to implement the atan identity
		result = _6thpi+result*atanident_flag
		endif	
	if atancompang_flag		' do the math here to implement the atan comp angle
		result = _halfpi - result
		endif
	if atansymmetry_flag	' do the math here to implement atan symmetry
		result *= -1
		endif
	return result
	endfunction

function asin(rad as single) as single		' uses atan & sqrt
	' the arcsin function is the inverse of the sin function (as long as the sin function
	' is restricted to a certain domain). definition: arcsin(x) is defined as “the one angle
	' between -p/2 and +p/2 radians (or between -90° and +90°) whose sin is x”. it is a 
	' one-to-one function
	
	dim period, symm as single
	dim multiple as integer
	period = reducerange(rad,_2pi,multiple)		' 0-360
	period *= if(multiple>0,-1,1)				' need to do this to keep track of the sign
	symm = reducerange(period,_halfpi,multiple)	' 0-90

	if symm >= 1 then return _nan
'	if symm >= sqrt(1) then return _nan
	return if(multiple>0,-1,1)*atan(symm/(sqrt(1-symm*symm)))
	endfunction
	
function acos(rad as single) as single		' uses atan & sqrt
	' the arccos function is the inverse of the cos function (as long as the cos function
	' is restricted to a certain domain). definition: arccos(x) is defined as “the one angle 
	' between 0 and p radians (or between 0° and 180°) whose cos is x”. it is a one-to-one 
	' function
	
	dim period, symm as single
	dim multiple as integer
	period = reducerange(rad,_2pi,multiple)	' 0-360
	period *= if(multiple>0,-1,1)			' need to do this to keep track of the sign
	symm = reducerange(period,_pi,multiple)	' 0-180

	if symm >= 1 then return _nan
'	if symm >= sqrt(1) then return _nan
	return if(multiple>0,_pi,0.0)+atan((sqrt(1-symm*symm)/symm))*if(multiple>0,-1,1)
	endfunction

function atan2(y as single, x as single, byref hypot as single) as single
	if x=0 and y=0 then return _nan
	hypot = sqrt(x*x+y*y)
	return 2*atan(y/(hypot+x))
	endfunction

function sec(x as single) as single
	return 1/cos(x)
	endfunction

function csc(x as single) as single
	return 1/sin(x)
	endfunction
	
function ctan(x as single) as single
	return 1/tan(x)
	endfunction
	
function asec(x as single) as single
	return atan(1.0)*2-atan(sign(x)/sqrt(x*x-1.0))
	endfunction

function acsc(x as single) as single
	return atan(sign(x)/sqrt(x*x-1.0))
	endfunction
	
function acot(x as single) as single
	return 2 * atan(1) - atan(x)
	endfunction

#endif

#ifdef include_hyper
	
function sinh(x as single) as single
	return (exp(x)-exp(-x))*0.5
	endfunction

function cosh(x as single) as single
	return (exp(x) + exp(-x))*0.5
	endfunction

function tanh(x as single) as single
	return (exp(x)-exp(-x))/(exp(x)+exp(-x))
	endfunction

function sech(x as single) as single
	return 2 / (exp(x) + exp(-x))
	endfunction

function csch(x as single) as single
	return 2/(exp(x)-exp(-x))
	endfunction

function coth(x as single) as single
	return (exp(x)+exp(-x))/(exp(x)-exp(-x))
	endfunction

function asinh(x as single) as single
	return log(x + sqrt(x * x + 1))
	endfunction

function acosh(x as single) as single
	return log(x+sqrt(x*x-1))
	endfunction

function atanh(x as single) as single
	return log((1+x)/(1-x))*0.5
	return 0
	endfunction

function asech(x as single) as single
	return log((sqrt(-x * x + 1) + 1) / x)
	endfunction

function acsch(x as single) as single
	return log((sign(x) * sqrt(x * x + 1) + 1) / x)
	endfunction

function acoth(x as single) as single
	return log((x+1)/(x-1))*0.5
	endfunction

#endif

#ifdef include_rand

'  This works surprizingly well.  I mean I am totally shocked at how 
'  good the distribution is. Take a peek at the following screeny
'  http://gyazo.com/83546e60d2dfeaa97b0ddc41f4edc269
'  I got the code from here and ported it to ARMbasic.
'  http://web.archive.org/web/20120318073935/http://www.bobwheeler.com/statistics/Password/MarsagliaPost.txt
'  http://school.anhb.uwa.edu.au/personalpages/kwessen/shared/Marsaglia03.html


'  global static variables: 
dim _z_rand, _w_rand, _rand_init		' as integer	' used by mwc random number generator

sub init_random
	' _z_rand		= 362436069
	_z_rand		= timer and $7fff0000		'<- put static seed here if you want repeatability...
	_w_rand		= 521288629
	_rand_init  = 1
	endsub

function znew
	_z_rand=36969*(_z_rand and $ffff)+(_z_rand>>16 and $ffff)
	return $7fffffff and _z_rand<<16
	endfunction

function wnew
	_w_rand=18000*(_w_rand and $ffff)+(_w_rand>>16 and $ffff)
	return _w_rand and $ffff
	endfunction

function mwc
	return (znew+wnew)
	endfunction

function rand as single
	dim u as integer
	
	if _z_rand = 0 and _w_rand = 0 and _rand_init = 0 then init_random
	
	' produce a uniform random sample from the open interval (0, 1).
	' the method will not return either end point.
	' 0 <= u < 2^31
	u = mwc
	' the magic number below is 1/(2^31 + 2).
	' the result is strictly between 0 and 1.
	return (u + 1.0) * 4.656612868740580000e-10
	endfunction

function randb (rlo as single, rhi as single) as single
	return rlo + (rand * (rhi-rlo))
	endfunction
	
#endif

jump_around_ABmath:

#endif
