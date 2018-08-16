'==============================================================================
function ASC (BYVAL strg(16) as string) as integer
	return ((*(addressof strg)) AND $FF)
	endfunction
'==============================================================================
function ASC2(BYREF strg_NAME AS STRING) as integer
	return ((*(*(ADDRESSOF strg_NAME))) AND $FF)
	endfunction
'==============================================================================
function ASC3(BYREF ADDR) as integer
	return ((*(ADDR)) AND $FF)
	endfunction
'==============================================================================
#define ASCS(args...)	((*(ADDRESSOF args)) AND $FF)  ' ASC for variables only, not literals


MAIN:
	DIM TEST_STR16(16) AS STRING
	DIM TS16ADDY AS INTEGER
	
	TEST_STR16 = "1234567890"
	
	PRINT "ASC : ";ASC("1")
	PRINT "ASC : ";ASC(TEST_STR16)
	PRINT "ASC2: ";ASC2(TEST_STR16)
	

	' PRINT "ASC3: ";ASC3((ADDRESSOF TEST_STR16))		' THIS FAILS
	
	TS16ADDY = ADDRESSOF TEST_STR16					' BUT THESE DONT
	PRINT "ASC3: ";ASC3(TS16ADDY)					' FAIL.
	
	PRINT "ASCS: ",ASCS(TEST_STR16)

	END
