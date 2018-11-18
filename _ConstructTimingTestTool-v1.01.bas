'========================================================================================
'
'	Construct Timing Test Tool
'   used to ease the determination of timing of ARMbasic code constructs on Coridium Targets
'
'
'	'  Revision History
'
'v 1.01		02Oct18	Maintenance/Bug Fix Update
'	•	typos fixed, comments added, defaults manipulated a bit, refactored again, etc.
'	•	Had a pretty big issue with how I was handling resolution limiting - resolved by 
'	•	scrapping the whole rounding approach and resorted to firmware sprintf code use. :)
'
'v 1.00		02Oct18	Initial Release
'	•	ample comments/diatribe and code are descriptive of initial implementation
'
'========================================================================================
#define _Construct_Timing_Tester_Version "1.01"

//error  testing 

// note the '~~ | '~ pairs you see littered below are for folding purposes
// in my editor.  They can be ignored or removed as you deem fit.  I just
// like to fold up stuffs that I am not touching to declutter the editor's
// UI - makeing things more navigable/intuitive (and me happy... ;).

// Also note that I make use of // in addition to ' to impute comments
// considering my ARMbasic language definition in NPP allows for toggling single line comments, 
// which I use to quickly enable/disable code blocks.  By making use of // comments,
// same isn't accidently uncommented when I select a larger code block for uncommenting...

'~~ // #DEFS/#INCLUDES FOR THE TEST CONSTRUCTS HERE <----== IF NEEDED, HERE IS WHERE TO DO IT
// do any #defines/#includes here as needed for the test constructs, or setup thereof
'#define something_used_by_#included libs
'#include "x:\somefolder\somefile.lib"
'~

'~~ // testing constructs initialization (#defs) here   - leave these be & redefine below
// ignore the warnings tossed at compile for each redefine.  It's OK.  ...  Really.  :)

#define Test_Construct_Name 	   "'NullTest'"	' include " at each end - the ' are for readability only

#define Test_Construct_Code0		' null
#define Test_Construct_Code1		' null
#define Test_Construct_Code2		' null
#define Test_Construct_Code3		' null
#define Test_Construct_Code4		' null
#define Test_Construct_Code5		' null
#define Test_Construct_Code6		' null
#define Test_Construct_Code7		' null
#define Test_Construct_Code8		' null
#define Test_Construct_Code9		' null
#define Test_Construct_CodeA		' null
#define Test_Construct_CodeB		' null
#define Test_Construct_CodeC		' null
#define Test_Construct_CodeD		' null
#define Test_Construct_CodeE		' null
#define Test_Construct_CodeF		' null
'~

'~~ // INITIALIZATION/SETUP FOR THE TEST CONSTRUCTS HERE <----== IF NEEDED, HERE IS WHERE TO DO IT
// using the man behind the curtain's trick to instantiate globals from w/in a sub
// USER SHOULD AVOID ACCIDENTAL REUSE OF TEST LOOP VARS (w/ leading _ - i.e.  _foo, _bar), else results will be unpredictable
 
dim i,j,k,m,x as integer
dim n,p,r as single

_do_test_setup:
	i=0
	j=0
	k=5
	m=addressof k
	n=0.0
	p=0.0
	r=0.0
	
	output(32)
	out(32) = 1


'~ 

'~~ // leave the rest of this code block & _pre_process sub be (used for test)
	return
sub _pre_process
	print "======================================================================"
	print
	print "ARMbasic Construct Timing Test Tool v";_Construct_Timing_Tester_Version
	print
	print "Resetting Timer - BT' ";chr(34);"... Finished in xxx ms";chr(34);" will be violated - ignore it..."
	print
	timer = 0	// elected to reset the timer given liklihood that user test constructs could run a log time here,
				// and having a timer rollover could be counterproductive/error inducing/bad
				// a FIXME, maybe?  (dealing with a rollover programatically, or checking and tossing an error if likely.?.) 
				// I dunno.  Muh gray matter hurts.
	goto _do_test_setup
endsub	'~	

'~~ // CODE THE TEST CONSTRUCTS HERE  <-----== THIS SECTION IS WHERE THE USER TEST CONSTRUCTS ARE INSTANTIATED 
	// Some samples follow.  If you comment everything out, the tool will still work (default null constructs above...).
	// yeah entering a construct name can be a small pita, but make sure you edit the Test_Construct_Name to
	// be descriptive of the constructs actually coded below it - a small bit of effort will yield goodness.
	// In looking at main:'s code, you can see how these #defs are used to 'inject' code into the test framework.
	// Up to 16 are provisioned for (Test_Construct_Code0 thru Test_Construct_CodeF).
	// More can be easily added, of course  (above in #def init, in this section, and in main, below).
	// But note that more test constructs yields longer test times, so edit the test parameters, as noted below,
	// if things are taking forever during the testing.

// these three #defs are a mirror of the Default #defs - useful to demonstrate the testing loop's overhead removal
	' #define Test_Construct_Name 	   "'NullConstruct'"
	' #define Test_Construct_Code0		' null
	' #define Test_Construct_Code1		' null

// the rest of these are samples (actual constructs I used to generate sample device-specific timings in the forum post)

	' #define Test_Construct_Name 	   "'intvar=timer'"
	' #define Test_Construct_Code0		j = timer

	' #define Test_Construct_Name 	   "'intvar=intvar'"
	' #define Test_Construct_Code0		j=k

	' #define Test_Construct_Name 	   "'intvar=sglvar'"
	' #define Test_Construct_Code0		j=n

	' #define Test_Construct_Name 	   "'sglvar=intvar'"
	' #define Test_Construct_Code0		n=j

	' #define Test_Construct_Name 	   "'sglvar=sglvar'"
	' #define Test_Construct_Code0		n=p

	' #define Test_Construct_Name 	   "'InterruptToggle'"
	' #define Test_Construct_Code0		interrupt(0)
	' #define Test_Construct_Code1		interrupt(1)

	' #define Test_Construct_Name 	   "'FNLoop'"
	' #define Test_Construct_Code0		For x=0 to 0
	' #define Test_Construct_Code1		next x

	#define Test_Construct_Name 	   "'DULoop'"
	#define Test_Construct_Code0		do
	#define Test_Construct_Code1		until 1

	' #define Test_Construct_Name 	   "'WLLoop'"
	' #define Test_Construct_Code0		While 0
	' #define Test_Construct_Code1		loop

	' #define Test_Construct_Name 	   "'IntVarPeek'"
	' #define Test_Construct_Code0		i=*00000000

	' #define Test_Construct_Name 	   "'IntVarPoke'"
	' #define Test_Construct_Code0		*m=0

'~

'~~ // POST-PROCESS THE TEST CONSTRUCT PROCESSING HEREIN <----== IF NEEDED, HERE IS WHERE TO DO IT
sub _post_process

endsub	'~

'~~ // these are the testing tool configs - edit as needed, making note of comments here
#define _test_density 10000	// the quantity of loop test per iteration
								// recommend 10K to 1M to allow settling, unless test construct is dense/lengthy
								
#define _test_iterations 10		// used to determine how many iterations of _test_density loops are used in 
								// developing averages - Min 2, suggest 4 to 10, unless test construct is dense
								
#define _time_resolution 10		// 6-14 digits of resolution - 6 is uS, 9 is nS, 12 is pS - max is 14
								// <6 will break code, more then 14 is of no value.  10 is default.
 '~

'~~ //	test variables - leave these be
#define _du_loop 1
#define _tc_loop 2
dim _looptime(2) as single
dim _start, _fin, _i, _x, _itime, _presolution as integer
dim _times(_test_iterations), _time_sum as single
dim _spf_format(100) as string
'~

sub _get_test_loop_overhead		// uses globals - using DU loops for test loops, as they are fastest - shouldn't need to mess with this...
	_x=1
	do
		_i=0
		_start = timer
		do
		
		// this is an intentionally null loop construct for OH determination purposes...
		
		_i+=1
		until _i>=_test_density
		_fin = timer
		_times(_x) = 1.0*((_fin-_start)/_test_density)	// elected not to round the interim values to avoid cumulative errors
		print chr(if(_x mod 2 = 0,"+","*"));	'~
		_x+=1
	until _x >= _test_iterations
	_time_sum =0.0
	_x=2	// omit the first pass, as they are usually not representative of the balance (i dunno why - suspect related to user app startup.?.)
			// might need to be a TODO/FIXME.?.
	do
		_time_sum += _times(_x)
		_x+=1
	until _x >= _test_iterations
	_looptime(_du_loop) = _time_sum/((1.0 * _test_iterations)-1)	// -1 as first pass omitted - elected not to round the interim values to avoid cumulative errors
	print " | ";
endsub

sub _test_code_constructs	// uses globals - using DU loops for test loops, as they are fastest - shouldn't need to mess with this...
	_x=1
	do
		_i=0
		_start = timer
		do
		
			Test_Construct_Code0
			Test_Construct_Code1
			Test_Construct_Code2
			Test_Construct_Code3
			Test_Construct_Code4
			Test_Construct_Code5
			Test_Construct_Code6
			Test_Construct_Code7
			Test_Construct_Code8
			Test_Construct_Code9
			Test_Construct_CodeA
			Test_Construct_CodeB
			Test_Construct_CodeC
			Test_Construct_CodeD
			Test_Construct_CodeE
			Test_Construct_CodeF
			
		_i+=1
		until _i>=_test_density
		_fin = timer
		_times(_x) = 1.0*((_fin-_start)/_test_density)		// elected not to round the interim values to avoid cumulative errors
		print chr(if(_x mod 2 = 0,"+","*"));	'~
		_x+=1
	until _x >= _test_iterations
	print
	print
	_time_sum =0.0
	_x=2	// omit the first pass, as they are usually not representative of the balance (i dunno why - suspect related to user app startup.?.)
			// might need to be a TODO/FIXME.?.
	do
		_time_sum += _times(_x)
		_x+=1
	until _x >= _test_iterations
	_looptime(_tc_loop) = _time_sum/((1.0 * _test_iterations)-1)	// -1 as first pass omitted - elected not to round the interim values to avoid cumulative errors

endsub

main:							// the main test app code - using DU loops for test loops, as they are fastest - shouldn't need to mess with this...

	_pre_process
	print Test_Construct_Name;" being tested ";
	_get_test_loop_overhead
	_test_code_constructs
	_post_process

	' display construct name and time
	_spf_format = str(_time_resolution-6)	// adjusting for uS base uom
	_spf_format = Test_Construct_Name & " %1." & _spf_format & "f uS"
	print SPRINTF(_spf_format, _looptime(_tc_loop)-_looptime(_du_loop))

end
