'==================================================================================================================
dim tempsing as single
'==================================================================================================================
function placebo_atof(byref strg as string) as single
	if strg = "123.456" then return 123.456
	if strg = "456.789" then return 456.789
	return 0.0
	endfunction
'==============================================================================
function uinputf1(byref str_pmpt as string, byref sing_var as single) as single		// for user input of floats
// 	use:  starti = uinputi("enter the float val (32bit ieee754):")
	dim usr_str(32) as string
	print str_pmpt;"(len<=";32;" characters): ";
	debugin usr_str
	
	sing_var = placebo_atof(usr_str)
	return sing_var
	
	endfunction
'==================================================================================================================
function uinputf2(byref str_pmpt as string, byref sing_var as single) as single		// for user input of floats
// 	use:  starti = uinputi("enter the float val (32bit ieee754):")
	dim usr_str(32) as string
	print str_pmpt;"(len<=";32;" characters): ";
	debugin usr_str
	
	return (sing_var=placebo_atof(usr_str) )  ' looks like this is returning right, but 
	
	endfunction


main:

print uinputf1("Testing uinputf1 - enter a single: ",tempsing)
print "uinputf1 returned: "; tempsing
print
print uinputf2("Testing uinputf2 - enter a single: ",tempsing)
print "uinputf2 returned: "; tempsing


end
