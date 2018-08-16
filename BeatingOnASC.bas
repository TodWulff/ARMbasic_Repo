/*	' Builtin asc sort of got me spinning a bit...
	
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

#define ASCS(args...)	((*(ADDRESSOF args)) AND $FF)

'==============================================================================
' this works ok, but does not support string constants too well - the app hangs

function ASC (BYREF strg_NAME AS STRING) as integer
	return ((*(*(ADDRESSOF strg_NAME))) AND $FF)		'dbl deref kicked my arse
	endfunction
'==============================================================================
' while this is the most robust, I waste ram by dim'g too large a func var,
' or run the risk of a calling construct overflowing - too risky, imo.

function ASC1 (BYVAL strg(16) as string) as integer
	return ((*(addressof strg)) AND $FF)
	endfunction
'==============================================================================
' Byref works well, other than it doesn't deal with string constants at all.
' also I have to pass the address and not the var name.  it seems that the
' compiler could see & provide the pointer without my having to provide it?

function ASC2 (BYREF ADDR) as integer
	return ((*(ADDR)) AND $FF)
	endfunction
'==============================================================================

MAIN:
	
	DIM TEST_STR16(16) AS STRING
	DIM TS16ADDY AS INTEGER
	dim x as integer
	
	TEST_STR16 = "1234567890"
	
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
	PRINT "ASC : ";ASC(TEST_STR16)						' this works
	
	PRINT "ASC1: ";ASC1("1")								' works but bad juju (overflow potential)
	PRINT "ASC1: ";ASC1(TEST_STR16)						' ditto

	TS16ADDY = ADDRESSOF TEST_STR16						' this works and
	PRINT "ASC2: ";ASC2(TS16ADDY)						' does not fail
	' PRINT "ASC2: ";ASC3((ADDRESSOF TEST_STR16))	' this fails
	
	' PRINT "ASCS: ";ASCS("1")							' this fails for constants
	PRINT "ASCS: ";ASCS(TEST_STR16)						' this works too for vars

	END
