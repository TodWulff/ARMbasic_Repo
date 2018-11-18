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
	
function sing_add (sing1 as single, sing2 as single) as single
	return sing1+sing2
	endfunction
	
function sing_sub (sing1 as single, sing2 as single) as single
	return sing1-sing2
	endfunction
	
function sing_mul (sing1 as single, sing2 as single) as single
	return sing1*sing2
	endfunction
	
function sing_div (sing1 as single, sing2 as single) as single
	return sing1/sing2
	endfunction
	
	
main:

dim i, j, start, fin, loop_overhead, add_loop, sub_loop, mul_loop, div_loop as integer
dim test_sing1, test_sing2 as single

test_sing1 = rand
test_sing2 = rand

start = timer
for i = 1 to 1000000
	j = test_PlaceboFunction(test_sing1, test_sing2) ' call to a useless function, just to capture loop overhead with a function call
	next i
fin = timer
loop_overhead = fin-start
print "Loop Overhead:","", 1.0*(loop_overhead/1000000),"uS / loop"

start = timer
for i = 1 to 1000000
	j = sing_add(test_sing1, test_sing2)
	next i
fin = timer
add_loop = fin-start-loop_overhead
print "Loop add_loop:","", 1.0*(add_loop/1000000),"uS / add_loop"

start = timer
for i = 1 to 1000000
	j = sing_sub(test_sing1, test_sing2)
	next i
fin = timer
sub_loop = fin-start-loop_overhead
print "Loop sub_loop:","", 1.0*(sub_loop/1000000),"uS / sub_loop"

start = timer
for i = 1 to 1000000
	j = sing_mul(test_sing1, test_sing2)
	next i
fin = timer
mul_loop = fin-start-loop_overhead
print "Loop mul_loop:","", 1.0*(mul_loop/1000000),"uS / mul_loop"

start = timer
for i = 1 to 1000000
	j = sing_div(test_sing1, test_sing2)
	next i
fin = timer
div_loop = fin-start-loop_overhead
print "Loop div_loop:","", 1.0*(div_loop/1000000),"uS / div_loop"

/*
================================================================

On 54102 device (M4 Core @ 100MHz AND M0+ Core @ 100MHz):

Loop Overhead:		1.322927	uS / loop
Loop add_loop:		1.010502	uS / add_loop
Loop sub_loop:		0.7813460	uS / sub_loop
Loop mul_loop:		0.8751000	uS / mul_loop
Loop div_loop:		1.448015	uS / div_loop

================================================================

On 11U37/1114 device (both are M0 Core @ 50MHz):

Loop Overhead:		3.312641	uS / loop
Loop add_loop:		2.666683	uS / add_loop
Loop sub_loop:		2.833368	uS / sub_loop
Loop mul_loop:		3.520877	uS / mul_loop
Loop div_loop:		3.645880	uS / div_loop

================================================================

On 824 device (M0+ Core @ 30MHz):

Loop Overhead:		4.900743	uS / loop
Loop add_loop:		3.799636	uS / add_loop
Loop sub_loop:		4.132997	uS / sub_loop
Loop mul_loop:		5.366361	uS / mul_loop
Loop div_loop:		5.333050	uS / div_loop

================================================================

*/

end









