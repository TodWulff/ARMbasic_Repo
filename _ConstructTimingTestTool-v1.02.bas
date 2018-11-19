'========================================================================================
'
'	Construct Timing Test Tool
'   used to ease the determination of timing of ARMbasic code constructs on Coridium Targets
'
'
'	'  Revision History
'v 1.02		15Nov18 Maintenance/UI Tweaks
'	•	added #include to enable verbosity of target vitals	
'	•	tweaked the runtime UI a bit and added descriptive/narrative output
'v 1.01		02Oct18	Maintenance/Bug Fix Update
'	•	typos fixed, comments added, defaults manipulated a bit, refactored again, etc.
'	•	Had a pretty big issue with how I was handling resolution limiting - resolved by 
'	•	scrapping the whole rounding approach and resorted to firmware sprintf code use. :)
'
'v 1.00		02Oct18	Initial Release
'	•	ample comments/diatribe and code are descriptive of initial implementation
'
' TODO/FIXME: 	
'	1)	See value of best way to implement a means to an end for extreemly long testing
'		as the 2^31 uS timer rolls over every 35.791394133333333333333333333333 minutes
'	2)	See if there is a means to use NVRam to trigger a 'first run' context, and delay
'		the code on the first run after flashing only
'
'========================================================================================
#define _Construct_Timing_Tester_Version "1.02"
#include "__LIB\ARMbasicTargetVitals.lib"
//error  testing 

// note the '~~ | '~ pairs you see littered below are for folding purposes
// in my editor.  They can be ignored or removed as you deem fit.  I just
// like to fold up stuffs that I am not touching to declutter the editor's
// UI - makeing things more navigable/intuitive (and me happy... ;).

// Also note that I make use of // in addition to ' to impute comments
// considering my ARMbasic language definition in NPP allows for toggling single line comments, 
// which I use to quickly enable/disable code blocks.  By making use of // comments,
// same isn't/aren't accidently uncommented when I select a larger code block for uncommenting...

'~~ // #DEFS/#INCLUDES FOR THE TEST CONSTRUCTS HERE <----== IF NEEDED, HERE IS WHERE TO DO IT
// do any #defines/#includes here as needed for the test constructs, or setup thereof
'#define something_used_by_#included libs
'#include "x:\somefolder\somefile.lib"
'~

'~~ // THESE ARE THE TESTING TOOL CONFIGS - EDIT AS NEEDED, MAKING NOTE OF COMMENTS HERE
#define _test_density 10000		// the quantity of loop test per iteration
								// recommend 10K to 1M to allow settling, unless test construct is dense/lengthy
								
#define _test_iterations 10		// used to determine how many iterations of _test_density loops are used in 
								// developing averages - Min 2, suggest 4 to 10, unless test construct is dense/lengthy
 '~

'~~ //	test variables - leave these be
#define _net 0
#define _null_loop 1
#define _testConstruct_loop 2
#define  _spf_format_start Test_Construct_Name & " %1.9f "
#define  _spf_format_end " on " & _tgtid
dim _looptime(2), _times(_test_iterations), _time_sum, _net_time as single
dim _start, _fin, _i, _x, _itime, _presolution, first_run as integer
'~

'~~ // testing constructs initialization (#defs) here   - leave these be & redefine below
// ignore the warnings tossed at compile for each redefine.  It's OK.  ...  Really.  :)

#define Test_Construct_Name 	   "'Null Test'"	' include " at each end - the ' are for readability only

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
 
/* #define SortArrayElements	255
#define RandomNumBitWidth  	8	' this needs to be 1-8, inclusive

sub ByteArrayInsertionSort(byref _ByteArray() as byte, _ElementCount as integer)
	dim _loopIndex, _tempInt, _sortKey as integer
	for _loopIndex = 1 to _ElementCount-1
		_tempInt = _ByteArray(_loopIndex)
		_sortKey = _loopIndex - 1
		while (_sortKey >= 0) and (_tempInt < _ByteArray(_sortKey))
			_ByteArray(_sortKey + 1) = _ByteArray(_sortKey)
			_sortKey = _sortKey - 1
		loop
	_ByteArray(_sortKey + 1) = _tempInt
	next
	endsub

sub ByteArrayBubbleSort(byref _ByteArray() as byte, _ElementCount as integer)
	dim _loopIndex, _tempInt, _sortKey as integer
	for _loopIndex = 1 to _ElementCount-1
		_tempInt = _ByteArray(_loopIndex)
		_sortKey = _loopIndex - 1
		while (_sortKey >= 0) and (_tempInt < _ByteArray(_sortKey))
			_ByteArray(_sortKey + 1) = _ByteArray(_sortKey)
			_sortKey = _sortKey - 1
		loop
	_ByteArray(_sortKey + 1) = _tempInt
	next
	endsub
 */
dim i,j,k,m,x as integer
dim n,p,r as single

/* dim SortEndIdx as integer
dim SortArray(SortArrayElements) as byte
 */
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

/* 	'generate and fill an array with randomness
	SortEndIdx=0
	do
'	print timer,
	SortArray(SortEndIdx) = (((((TIMER*(Timer AND $ffffFFFF)) AND $000FFFF0) >> 4) * (((TIMER/(Timer AND $0000FFFF)) AND $000FFFF0) >> 4)) AND $0000FFFF) >> (16-RandomNumBitWidth)  ' fills array with randomness
	' print SortArray(SortEndIdx)
	SortEndIdx+=1
	until SortEndIdx >= SortArrayElements
	' print "--------------"

	'print the random array
	SortEndIdx=0
	do
	print SortArray(SortEndIdx)
	SortEndIdx+=1
	until SortEndIdx >= SortArrayElements
 */

'~ 

'~~ // leave the rest of this code block & _pre_process sub be (used for test)
	return
sub _pre_process
	print "Press Enter to continue"
	debugin _itime
	print chr(0xC)	' clears the BT TCLTerm Console
	print "ARMbasic Construct Timing Test Tool v";_Construct_Timing_Tester_Version;" on ";_tgtnm
	print _tgtspecs
	print "================================================================================"
	' print
	' print "Resetting Timer - BT' ";chr(34);"... Finished in xxx ms";chr(34);" will be violated - ignore it..."
	print
	_itime=timer		// grab timer for restoration at the end, as this tool violates it pretty effin hard...
	timer = 0	// elected to reset the timer given liklihood that user test constructs could run a long time here
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
	#define Test_Construct_Name 	   "'NullConstruct'"
	#define Test_Construct_Code0		' null
	#define Test_Construct_Code1		' null

 // the rest of these are samples (actual constructs I used to generate sample device-specific timings in the forum post)

	' #define Test_Construct_Name 	   "'intvar=timer'"
	' #define Test_Construct_Code0		j = timer

	#define Test_Construct_Name 	   "'intvar=int'"
	#define Test_Construct_Code0		j=$55555555

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

	' #define Test_Construct_Name 	   "'FNLoop - 1000 loops'"
	' #define Test_Construct_Code0		For x=0 to 1000
	' #define Test_Construct_Code1		next x

	' #define Test_Construct_Name 	   "'FNLoop - 100 loops'"
	' #define Test_Construct_Code0		For x=0 to 100
	' #define Test_Construct_Code1		next x

	' #define Test_Construct_Name 	   "'DULoop'"
	' #define Test_Construct_Code0		do
	' #define Test_Construct_Code1		until 1
	

	' #define Test_Construct_Name 	   "'WLLoop'"
	' #define Test_Construct_Code0		While 0
	' #define Test_Construct_Code1		loop

	' #define Test_Construct_Name 	   "'IntVarPeek'"
	' #define Test_Construct_Code0		i=*00000000

	' #define Test_Construct_Name 	   "'IntVarPoke'"
	' #define Test_Construct_Code0		*m=0

	' #define Test_Construct_Name 	   "'FNLoop - 100 of IntVarPoke'"
	' #define Test_Construct_Code0		For x=0 to 100
	' #define Test_Construct_Code1		*m=0
	' #define Test_Construct_Code2		next x

	' #define Test_Construct_Name 	   "'DULoop'"
	' #define Test_Construct_Code0		do
	' #define Test_Construct_Code1		until 1
	
	' #define Test_Construct_Name 	   "'Test ByteArrayInsertionSort - "&SortArrayElements&"'"	' include " at each end - the ' are for readability only
	' #define Test_Construct_Code0		ByteArrayInsertionSort(SortArray,SortArrayElements)
'~

'~~ // POST-PROCESS THE TEST CONSTRUCT PROCESSING HEREIN <----== IF NEEDED, HERE IS WHERE TO DO IT
sub _post_process

/* 	SortEndIdx=0
	do
	print SortArray(SortEndIdx)
	SortEndIdx+=1
	until SortEndIdx >= SortArrayElements
 */
endsub	'~

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
		out(32) = _x and 1
		_x+=1
	until _x >= _test_iterations
	_time_sum =0.0
	_x=2	// omit the first pass, as they are usually not representative of the balance (i dunno why - suspect related to user app startup.?.)
			// might need to be a TODO/FIXME.?.
	do
		_time_sum += _times(_x)
		_x+=1
	until _x >= _test_iterations
	_looptime(_null_loop) = _time_sum/((1.0 * _test_iterations)-1)	// -1 as first pass omitted - elected not to round the interim values to avoid cumulative errors
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
		out(32) = _x and 1
		_x+=1
	until _x >= _test_iterations

	_time_sum =0.0
	_x=2	// omit the first pass, as they are usually not representative of the balance (i dunno why - suspect related to user app startup.?.)
			// might need to be a TODO/FIXME.?.
	do
		_time_sum += _times(_x)
		_x+=1
	until _x >= _test_iterations
	_looptime(_testConstruct_loop) = _time_sum/((1.0 * _test_iterations)-1)	// -1 as first pass omitted - elected not to round the interim values to avoid cumulative errors

endsub

main:					// the main test app code - using DU loops for test loops, as they are fastest - shouldn't need to mess with this...

'	_itime=timer		// grab timer for restoration at the end, as this tool violates it pretty effin hard...
	_pre_process
	print "Performing "&_test_iterations&" iterations of "&_test_density&" loops of test construct to develop averages."
	print "First pass data are omitted from results due to consistent runtime overhead,"
	print "which is perceived to be AB firmware related (i.e. user AB app startup)..."
	print "--------------------------------------------------------------------------------"
	print
	print "Testing ";Test_Construct_Name;": ";
	_get_test_loop_overhead
	print " | ";
	_test_code_constructs
	_net_time = _looptime(_testConstruct_loop)-_looptime(_null_loop)
	if _net_time < 0.0 then _net_time=0.0
	print "",_net_time;" uS"
	print

	if _net_time = 0.0			' we're zero
		print SPRINTF(_spf_format_start & "uS" & _spf_format_end, _net_time);
	elseif _net_time < 0.000001	' we're sub pS
		print SPRINTF(_spf_format_start & "fS" & _spf_format_end, _net_time*1000000000);
	elseif _net_time < 0.001	' we're sub nS
		print SPRINTF(_spf_format_start & "pS" & _spf_format_end, _net_time*1000000);
	elseif _net_time < 1		' we're sub uS
		print SPRINTF(_spf_format_start & "nS" & _spf_format_end, _net_time*1000);
	elseif _net_time < 1000		' we're sub mS
		print SPRINTF(_spf_format_start & "uS" & _spf_format_end, _net_time);
	elseif _net_time < 1000000	' we're sub S
		print SPRINTF(_spf_format_start & "mS" & _spf_format_end, _net_time/1000);
	else
		print SPRINTF(_spf_format_start & "S" & _spf_format_end, _net_time/1000000);
	endif

	// restore timer - pretty closely.?.
	timer = _itime + timer  ' restored
	
end
