
'const xyzzy = 33+22*3/2
const xyzzy = 66

function bstrcomp(a(256) as string, b(100) as string) 
  dim x as integer
  x = strcomp(a,b)
  return x
end function

function sum(a,b,c,d,e)
return a+b+c+d+e
endfunction

function toupper(a(100) as string) as string
  dim i as integer
  for i=0 to 100
    if a(i) = 0 then exit
    if a(i) <= "z" and a(i) >= "a" then a(i) = a(i) - $20
  next i
  return a
end function


function tolower(byref a as string) as string
  dim i as integer
  for i=0 to 100
'   print i,a(i)
    if a(i) = 0 then exit
    if a(i) <= "Z" and a(i) >= "A" then a(i) = a(i) + $20
  next i
  return a
end function

x=1     ' never executed, but declares x

sub setx
  x = 5555
end sub

sub setxvalue (value)
  x = value
end sub

function useless
return 1234
endfunction

main:

print 11111111

dim tl(255) as string

errs = 0

if sum(1,2,3,4,5) <> 15 then errs = errs+1

print 0,errs

if bstrcomp(toupper("asdf"),"ASDF") <> 0 then errs = errs+1

print 11,errs

if bstrcomp("asdf"+"zxcv", "a"+"sdfzxcv") <> 0 then errs = errs+1

print 1,errs

tl = "ASDDF"

if bstrcomp("asddf",tolower(tl)) <> 0 then errs = errs+1

tl = "ASDDF"
gosub tolower(tl)
if bstrcomp("asddf",tl) <> 0 then errs = errs+1

gosub setx
if x<> 5555 then errs = errs+1

print 2,errs

gosub setxvalue(3333)
if x<> 3333 then errs = errs+1
print 3,errs
x = useless
if x<> 1234 then errs = errs+1
print 4,errs

if errs then print "function FAIL" else print "function OK"


if xyzzy <> (33+22*3/2) then print "FAIL const"

#define BLIVET 12345678

x = 12345678
if x <> BLIVET then print "CPP FAIL"


'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' force code into higher memory

for j = 0 to 3
x=0

x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1

#if 1		' need to shorten test for temp_code test

x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1
x=x+1

#endif

print x, "should be 300"
next j





'---------------------------------------------------------------------------------

print "a ";"test","or ";2;
print
print " should have printed    a test or 2"

'// compare tests -- here each one should add 1
a=3
b=6
x=0

gosub DoCompare

print 22222222

'//end

print x

x=x+ (a AND b) -1
x=x+ ((a AND 1) OR 1)
x=x+ (b XOR a) -4
x=x+ a*b/(a*b)
x=x+ b MOD a +1

print x

x=x+ (5>3 AND a )
x=x+ (5>3 OR  a )
x=x+ (3>5 OR  a )
x=x+ (3>5 XOR a )
x= -1 +x +2
x= abs(NOT (a>b)) + x
if x=16 then print "pass ops" else print "FAIL ops", x

'//end

a=6
b=3
gosub DoCompare
x = x + ( a <> 6)
x = x + (a*b = 18)
x = x + abs(5-4)
x = x + abs(-1)
if x=20 then print "pass more ops" else print "FAIL ops", x

'//end

z=0
for j=1 to 10 
z=z+j
next j
if z=55 then print "pass "; else print "FAIL ";
print "for 1-10 "

'//end

w=0
for j=11 downto 2
w=w+j
next j
if w=65 then 
  print "pass "; 
else 
  print "FAIL ";
endif
print "for 11-2 done"

z=0
x=0
do
x=x+1
z=z+x
until x=10
if z>55 or z<55 then print "FAIL "; else print "pass ";
print "repeat 1-10 done"

dim array(7)

for i=7 downto 1 step 12-11
array(i)=i
'// print i
next i

#ifdef USE_DATA
data 10,1,2,3,4,5,6,7,0x5555,0xaaaa
read x  '// skip over the 10
#else
x = 10
#endif

for i=1 to 7 step 2*5-9
#ifdef USE_DATA
read x
#else
x=i
#endif
if x <> array(i) then print "fail at",i,x,array(i)
next i


#ifdef USE_DATA
read x,y
#else
x=0x5555
y=0xaaaa
#endif

if x+y = -1 then
  print "16 bit arith"
elseif x+y+1 = 0x10000 then
  print "32 bit arith"
else
  print "FAIL width, elseif",x,y
endif


#ifdef USE_DATA

restore
read x

if x=0 then
  print "restore fail"
elseif x<>10
  print "restore fail"
else
  print "restore pass"
endif
read a,b  ' 1 and 2
#else
a=1
b=2
#endif


if 5+3*(a+b)-2*b-(4*a+a)-b > 3 then 
  print "fail",5+3*(a+b)-2*b-(4*a+a)-b
elseif 5+3*(a+b)-2*b-(4*a+a)-b < 3 then 
  print "fail-",5+3*(a+b)-2*b-(4*a+a)-b
elseif 3 = 5+3*(a+b)-2*b-(4*a+a)-b then
  print "OK",5+3*(a+b)-2*b-(4*a+a)-b
  x=55
endif

if x = 55 then
	if 10 - 4/2 - 2*2 = -4/2 -2*2 + 10 then	print "over and out" else print "FAIL swapsub"
else
    print "FAIL"
endif	

print "end data dim test"


print "string test"

dim s$(40)
dim w$(40)

s$="xxxx"
's$=s$+1234+"abcd"
's$=s$+str(1234) +"abcd"
s$=s$+str(1234)
s$=s$+"abcd"


if strcomp(s$,"xxxx1234abcd")=0 then print "string 1 OK" else print "string1 FAIL";s$
if strcomp("xxxx1234abcd",s$)=0 then print "string OK" else print "string1 FAIL"
if s$(1)<>chr(120) then print "string FAIL"
s$(2)="Z"

print "left/right"

w$ = left(s$,5)
if strcomp(w$,"xxZx1")<>0 then print "left FAIL"
w$ = right(s$,3)
if strcomp(w$,"bcd")<>0 then print "right FAIL"

if strcomp(w$,"bcd")<>0 then print "right FAIL"
if strcomp(w$,"bbb")<=0 then 
    print "right FAIL"
elseif strcomp(w$,"bdd")>=0 then 
	print "right FAIL"
elseif strcomp(w$,"bcd")=0 then 
	print "elseif OK"
else
	print "elseif FAIL"
endif	


print w$,"should show bcd"

print "complex concat ";

x=2
y=12
s$ = w$ + left(w$,x) + right("ABCD",2) + y + 34 + hex(55) + "end"

if strcomp(s$,"bcdbcCD123437end") = 0 then print "OK" else print "FAIL",s$

if len (s$) = 16 then print "len OK" else print "FAIL len"


print "end of string tests"


print "gosub goto defined tests"

goto do_gotest

print "initial goto fwd FAIL"

gotoback3:
	goto gotodone
	print " goto *** FAIL"

gotoback2:
	goto gotoback3
	print " goto *** FAIL"

gotoback1:
	goto gotoback2
	print " goto *** FAIL"

defined_gosub:
   print "into gosub back"
   return
print "initial gosub back FAIL"
   
do_gotest:

gosub defined_gosub

print " gosub done"

	goto gotoback1
	print " goto *** FAIL"
gotodone:
	print " goto  done"
end

print "FAIL on END"

DoCompare:

print "DC"

x=x+ ( b>a  )
x=x+ ( a<b  )
x=x+ ( a<>b )
x=x+ ( b>=a )
x=x+ ( a<=b )

return

print "FAIL on RETURN"





