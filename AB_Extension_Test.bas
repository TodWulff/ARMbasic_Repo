
#define enabledebug 0

#include "__LIB\AB_Extensions.lib"


dim tempint as integer
dim tempsing as single
dim tempstr(64) as string

/*' Builtin asc sort of got me spinning a bit...
	
	initial implementation was 
	
		#define ASC(args...)		args
	
	as detailed in the help.  later in code I did a
	
		print ASC("Z") 
		
	and the damn thing printed Z just like I told it to
	
	This got me wondering how many ways I could solve the asc problem.
	
	The following is for your review and comment, whenever you get around to it.
	
*/

/*	ASC returns the ASCII code for the first character in a string expression.
	CHR$ returns the character corresponding to a specified ASCII code.

	ASC(stringexpression$)
	CHR$(ascii-code%)

		¦ stringexpression$    Any string expression.
		¦ ascii-code%          The ASCII code of the desired character.

	Example:
		PRINT ASC("Q")    'Output is:  81
		PRINT CHR$(65)    'Output is:  A
*/

'==============================================================================
' this works and is not too bad an approach other then the fact that it doesnt
' deal well with string constants at all...

'#define ASCS(args...)	((*(ADDRESSOF args)) AND $FF)

'==============================================================================
' this works ok, but does not support string constants too well - the app hangs

' function ASC (BYREF strg_NAME AS STRING) as integer
	' return ((*(*(ADDRESSOF strg_NAME))) AND $FF)		'dbl deref kicked my arse
	' endfunction
'==============================================================================
' while this is the most robust, I waste ram by dim'g too large a func var,
' or run the risk of a calling construct overflowing - too risky, imo.

' function ASC1 (BYVAL strg(16) as string) as integer
	' return ((*(addressof strg)) AND $FF)
	' endfunction
'==============================================================================
' Byref works well, other than it doesn't deal with string constants at all.
' also I have to pass the address and not the var name.  it seems that the
' compiler could see & provide the pointer without my having to provide it?

' function ASC2 (BYREF ADDR) as integer
	' return ((*(ADDR)) AND $FF)
	' endfunction
'==============================================================================
sub initme


endsub
Main:
init_abe

	DIM TEST_STR16(16) AS STRING
	DIM TS16ADDY AS INTEGER
	dim x as integer
	
	TEST_STR16 = "1234567890"
	
	dim a as integer
dim b as integer
dim c as integer
dim d as integer
dim e as integer
dim saved_ddr as integer

dim test_single as single


print "===================================================================="
print
Print "...Testing of AB_Extensions..."
Print

uinputs("Paused using uinputs (used to pause from hereon).  Press Enter to continue.",global$)
print
' Print "1) Testing of AB Debug Extensions..."
' Print
' paws


/*
print
Print "1) Testing of (debug) halt sub which enables using BT's debug functionality..."
Print
'halt

Debug(Print "This line prints when enabledebug is defined as a non-zero value.  Edit at top of this test file...")
production(Print "This line prints when enabledebug is defined as a zero value, or not defined.  Edit at top of this test file...")

paws


Print "2) Testing PreProcessor #def macros"
print

Print "GlbStr_Lim: ";GlbStr_Lim, " Should be 48"

Print "one: "; one 
Print "One: "; One 
Print "ONE: "; ONE 
Print "zero: "; zero 
Print "Zero: "; Zero 
Print "ZERO: "; ZERO 
Print "hi: "; hi 
Print "Hi: "; Hi 
Print "HI: "; HI 
Print "lo: "; lo 
Print "Lo: "; Lo 
Print "LO: "; LO 
Print "outp: "; outp 
Print "Outp: "; Outp 
Print "OUTP: "; OUTP
Print "inpt: "; inpt 
Print "Inpt: "; Inpt 
Print "INPT: "; INPT 
Print "false: "; false 
Print "False: "; False 
Print "FALSE: "; FALSE
Print "true: "; true 
Print "True: "; True 
Print "TRUE: "; TRUE 

paws

print
print "testing ASC constructs"
print

' Print ASCA(args...)	args
' Print "ASCS(Global$): "; ASCS(Global$)
	
	' x = test_str16										' this fails
	' print "Builtin: ";x
	
	' x = left(test_str16,1)								' this fails
	' print "builtin: ";x
	
	' TEST_STR16 = "1"
	' x = TEST_STR16								' this fails
	' print "builtin: ";x
	
	x = "1"
	print "Builtin: ";x									' this works
	
	' PRINT "ASC : ";ASC("1")							' this compiles but hangs the app
	PRINT "ASC var: ";ASC(TEST_STR16)						' this works
	
	PRINT "ASC1 literal: ";ASC1("1")								' works but bad juju (overflow potential)
	PRINT "ASC1 var: ";ASC1(TEST_STR16)						' ditto

	TS16ADDY = ADDRESSOF TEST_STR16						' this works and
	PRINT "ASC2 var: ";ASC2(TS16ADDY)						' does not fail
	'PRINT "ASC3: ";ASC3((ADDRESSOF TEST_STR16))	' this fails  (Aug'18 - ASC3 is gone to the ethers, likely forever...)
	
	PRINT "ASCS var: ";ASCS(TEST_STR16)						' this works too for vars
	' PRINT "ASCS literal: ";ASCS("1")							' but fails for constants
	
paws

print
print "Testing input routines for Integer and Float conversion constructs, to Hex and Bin."
print
print
print uinputi("Testing integer input - enter an integer: ",tempint)
print "uinputi returned: ";tempint
print "i2h input: ";tempint,"i2h output: ";i2h(tempint)
print "i2b input: ";tempint,"i2b output: ";i2b(tempint)
Print i2h(uinputi("Testing nested input to i2h - Enter an integer for hex conversion: ",tempint))
Print i2b(uinputi("Testing nested input to i2b - Enter an integer for hex conversion: ",tempint))

print uinputf("Testing float input - enter a single: ",tempsing)
print "uinputf returned: "; tempsing
print "f2h input: ";tempsing,"f2h output: ";f2h(tempsing)
print "f2b input: ";tempsing,"f2b output: ";f2b(tempsing)
Print f2h(uinputf("Testing nested input to f2h - Enter a float for hex conversion: ",tempsing))
Print f2b(uinputf("Testing nested input to f2b - Enter a float for hex conversion: ",tempsing))




a = 12345
print addressof a,a

b = 23456
print addressof b, b

b=addressof a
print b,*b



print 
print "NStr address and value: ",addressof NStr, *(addressof NStr), NStr
print "NSgl address and value: ",addressof NSgl, *(addressof NSgl), NSgl
print "NInt address and value: ",addressof NInt, *(addressof NInt), NInt, i2h(NInt)

' support func
print 
Print _uinput("enter sumptin: ")				'global used
print "entered: ";Global$				'_uinput used global$ - this checks to be sure
print
print
'strings

print uinputs("enter a string: ",nstr)		'null indicated should just return
print "checking NStr: ...";NStr;"..."
print
print uinputs("enter a string: ",tempstr)		'null indicated should just return
print "checking to ensure tempstr got set: ...";tempstr;"..."
print
print
print
'floats

print uinputf("enter a float: ",NSgl)		'null indicated should just return
print "checking NSgl: ...";NSgl;"..."
print
print uinputf("enter a float: ",tempsing)		'null indicated should just return
print "checking to ensure tempsing got set: ...";tempsing;"..."
print
print
print

'ints

print uinputi("enter an integer: ",NInt)		'null indicated should just return
print "checking NInt: ...";NInt;"..."
print
print uinputi("enter an integer: ",tempint)		'null indicated should just return
print "checking to ensure tempint got set: ...";tempint;"..."
print
print
print

PRINT "testing the ddr manipulation constructs and also testing the int/float to hex/bin functions"
print 
print
paws
print 
print "pin_data_dir_reg retreival and saving"
print getddr(a)
saved_ddr = pin_data_dir_reg
print pin_data_dir_reg
print i2h(getddr(a)) ' sets var a when ran, as a result for eval
print i2b(a)
print
paws
print 
print "checking saved"
print i2h(saved_ddr) ' sets var a when ran, as a result for eval
print i2b(saved_ddr)
print
paws
print 
print "setting all dirs to output"
b = $FFFFFFFF
print i2h(b)
print i2b(b)
print
print 
c= setddr(b)
paws
print
print "checking results"
print i2h(b)
print i2b(b)
print i2h(c)
print i2b(c)
print
paws
print 
print "checking via a new poll to see what got set"
print getddr(d)
print pin_data_dir_reg
print i2h(getddr(e)) ' sets var a when ran, as a result for eval
print i2b(d)
print pin_data_dir_reg
print
paws
print 
print "restoring original ddr"
c= setddr(saved_ddr)
print i2h(c)
print i2b(c)
print
paws
print 
print

print "validating our variables are wurkin:"

a=1431655765	' $55555555	&01010101010101010101010101010101
b=2863311530	' $aaaaaaaa	&10101010101010101010101010101010
c=1431655765	' $55555555	&01010101010101010101010101010101
d=2863311530	' $aaaaaaaa	&10101010101010101010101010101010

print 
print "a - ",i2h(a), i2b(a)
print "b - ",i2h(b), i2b(b)
print "c - ",i2h(c), i2b(c)
print "d - ",i2h(d), i2b(d)
print
print "validating our starting point is all zeros:"

a=0
b=0
c=0
d=0

print "a - ",i2h(a), i2b(a)
print "b - ",i2h(b), i2b(b)
print "c - ",i2h(c), i2b(c)
print "d - ",i2h(d), i2b(d)

paws
Print "now let's poll for a DDR refresh"
print 

print 
print "getting current ddr states:"
d = getddr(a)
print "returned: ",i2h(d), i2b(d)
print "byref'd: ",i2h(a), i2b(d)
paws

a=0
print 
print "setting all dirs to output with the following:"
print i2h(a), i2b(a)
print
paws
a=0


b = $FFFFFFFF
print "Now doing the setting of the target's DDRs"
print
setddr(b)
print "presumably they are set - let's check:"
print i2h(b), i2b(b)
print
print
paws
b=0

print
Print "now let's poll for a DDR refresh"
print
print "getting current ddr states:"
getddr(a)
print i2h(a), i2b(a)
paws
a=0


print 
print "setting all dirs to inputs with the following:"
a = $00000000
print i2h(a), i2b(a)
print
paws

print "Now doing the setting of the target's DDRs"
print
b = setddr(a)
print "presumably they are set - let's check:"
print i2h(a), i2b(b)
print
print
paws
b=0

print 
print "restoring original pin direction register with the following:"
print i2h(d), i2b(d)
print
paws

print "Now doing the setting of the target's DDRs"
print
b = setddr(d)
print "presumably they are set - let's check:"
print i2h(d), i2b(b)
print
print
paws
b=0
d=0
*/

'faibh

' f2f
test_single = 365.250
print "f2a 365.25: ",f2a(test_single)
print "f2i 365.25: ",f2i(test_single)
print "f2b 365.25: ",f2b(test_single)
print "f2h 365.25: ",f2h(test_single)

TEST_STR16 = "365.25"
print "a2f 365.25: ",a2f(TEST_STR16)
' a2a
print "a2i 365.25: ",a2i(TEST_STR16)
print "a2b 365.25: ",a2b(TEST_STR16)
print "a2h 365.25: ",a2h(TEST_STR16)

a=12546
Print "i2a 17: ",i2a(a)
print "i2f 15: ",i2f(a)
' i2i
print "i2b 14: ",i2b(a)
print "i2h 14: ",i2h(a)


print "b2f &01101010100011101011110001010100: ",b2f("&01101010100011101011110001010100")
print "b2a &01101010100011101011110001010100: ",b2a("&01101010100011101011110001010100")
print "b2i &01101010100011101011110001010100: ",b2i("&01101010100011101011110001010100")
' b2b
print "b2h &01101010100011101011110001010100: ",b2h("&01101010100011101011110001010100")


print "h2f $5a5a5a5a: ",h2f("$5a5a5a5a")
print "h2a $5a5a5a5a: ",h2a("$5a5a5a5a")
print "h2i $5a5a5a5a: ",h2i("$5a5a5a5a")
print "h2b $5a5a5a5a: ",h2b("$5a5a5a5a")
' h2h






' add tests for all of the float tests (inqnan, etc)
' the binary to blah conversion
' overtly check a2i, a2f
' create and test b2h
' creat and test i2f and f2i
' create all 




end

