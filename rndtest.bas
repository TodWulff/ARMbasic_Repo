' #include "__lib\ab_extensions.lib"


'==============================================================================
' random number generators
' http://web.archive.org/web/20120318073935/http://www.bobwheeler.com/statistics/Password/MarsagliaPost.txt
'==============================================================================
   
FUNCTION RAND_BIT_WIDTH (SEED AS INTEGER, BIT_WIDTH AS INTEGER) AS INTEGER
' SEED 0 TO 65535, BITWIDTH = 0 TO 16 - RETURNS 0 TO 65535 SHIFTED TO DESIRED BIT WIDTH...
	RETURN (((((TIMER*(SEED AND $0000FFFF)) AND $000FFFF0) >> 4) * (((TIMER/(SEED AND $0000FFFF)) AND $000FFFF0) >> 4)) AND $0000FFFF) >> (16-BIT_WIDTH)
ENDFUNCTION

function rand as single ' return 0 to 1 strictly
	dim u as integer
	u = (($7fffffff and ((36969*((timer and $7fff0000) and $ffff)+((timer and $7fff0000)>>16 and $ffff))<<16))+((18000*(521288629 and $ffff)+(521288629>>16 and $ffff)) and $ffff))
	return (1.0 + u) * 4.656612868740580000e-10
	endfunction
	
function randb (rlo as single, rhi as single) as single
	return rlo + (rand * (rhi-rlo))
	endfunction


function test_PlaceboFunction(x as single, y as single) as single
	return 1
	endfunction
main:

dim i, j, start, fin, loop_overhead, rand1_loop, rand2_loop, rand3_loop as integer

start = timer
for i = 1 to 1000000
j = test_PlaceboFunction(1.0,1.0) ' call to a useless function, just to capture loop overhead with a function call
next i
fin = timer
loop_overhead = fin-start

print "Loop Overhead:","","","", 1.0*(loop_overhead/1000000),"uS / loop"

start = timer
for i = 1 to 1000000
j = RAND_BIT_WIDTH(RAND_BIT_WIDTH(timer, 16),16)
next i
fin = timer
rand1_loop = fin-start-loop_overhead

print "Loop RAND_BIT_WIDTH (16):","","","", 1.0*(rand1_loop/1000000),"uS / RAND_BIT_WIDTH"

start = timer
for i = 1 to 1000000
j = randb(0.0, 1000000.0)
next i
fin = timer
rand2_loop = fin-start-loop_overhead

print "Loop randb (0-1M):","","","", 1.0*(rand2_loop/1000000),"uS / randb"

start = timer
for i = 1 to 1000000
j = rand
next i
fin = timer
rand3_loop = fin-start-loop_overhead

print "Loop rand (0-1):","","","", 1.0*(rand3_loop/1000000),"uS / rand"

/*
================================================================

On 54102 device (M4 Core @ 100MHz AND M0+ Core @ 100MHz):

Loop Overhead:				1.281261	uS / loop
Loop RAND_BIT_WIDTH (16):	4.065834	uS / RAND_BIT_WIDTH
Loop randb (0-1M):			8.015817	uS / randb
Loop rand (0-1):			4.958465	uS / rand

================================================================

On 11U37/1114 device (both are M0 Core @ 50MHz):

Loop Overhead:				3.479305	uS / loop
Loop RAND_BIT_WIDTH (16):	23.16990	uS / RAND_BIT_WIDTH
Loop randb (0-1M):			28.91742	uS / randb
Loop rand (0-1):			16.33374	uS / rand

================================================================

On 824 device (M0+ Core @ 30MHz):

Loop Overhead:				4.967409	uS / loop
Loop RAND_BIT_WIDTH (16):	34.23674	uS / RAND_BIT_WIDTH
Loop randb (0-1M):			45.04422	uS / randb
Loop rand (0-1):			25.16518	uS / rand

================================================================

*/


' print RAND_BIT_WIDTH (timer<<3, 16)<<16 * RAND_BIT_WIDTH (timer<<7, 16)
' print RAND_BIT_WIDTH (timer<<3, 16)<<16 * RAND_BIT_WIDTH (timer<<7, 16)
' print RAND_BIT_WIDTH (timer<<3, 16)<<16 * RAND_BIT_WIDTH (timer<<7, 16)
' print RAND_BIT_WIDTH (timer<<3, 16)<<16 * RAND_BIT_WIDTH (timer<<7, 16)
' print "clear the screen now"
' print "==========================================================================="
' print
' wait(5000) ' clear the screen...
' for i=1 to 2621440
/* J=RAND_BIT_WIDTH (timer, 16)<<16 or RAND_BIT_WIDTH (timer, 16)
print i, j, i2h(j) */
' print i2h(RAND_BIT_WIDTH (timer, 16)<<16 or RAND_BIT_WIDTH (timer, 16));
' if (i mod 4096)=0
	' print
	' print
	' print i/4096;" of ";2621440/4096;" - Copy the output (Cntl-A, Cntl-C) paste it into storage, clear the screen, and press enter"
	' debugin j
	' endif
' next i


end


'0966ff14e0068662fa








