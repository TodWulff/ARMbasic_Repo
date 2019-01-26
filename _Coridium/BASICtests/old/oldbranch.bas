' comment

goto xyzzy

xxx = 33		' a global variable

dim a(100) as string
dim b(100) as string
dim c(100) as string

function rets(byref a as string) as string
  dim b(100) as string
  dim i as integer
  for i=0 to 100
    b(i)=a(i)
    if b(i) = 0 then exit
  next i
  return b
end function

function item2(byref a as string)
return a(2)
end function

function fa as string
xxx = 22
return "a"
end function

function faa(x) as string
return "aa"
endfunction

function fret(byval a(20) as string) as string
return a
endfunction

function fbret (byref a as string) as string
return a
endfunction

function changei (byref x)
dim a as integer
a = x
x = 55
x = x * 2
return a*10
end function


sub changes (byref x)
dim a as integer
x = 55
a = x
x = a + x
end sub


function toupper(a(100) as string) as string
  dim i as integer
  for i=0 to 100
'   print i,a(i)
    if a(i) = 0 then exit
    if a(i) <= "z" and a(i) >= "a" then a(i) = a(i) - $20
  next i
' print "a= ";a
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

function call2lower (byref a as string) as string
  return tolower(a)
end function

function add10 (byref a as integer) 
  a= a+10
  return a
end function

function plus10 (a as integer) 
  dim b as integer
  dim c as integer
  b = a
  c = a
  gosub add10(a)
  gosub add10(c)
  if a<>b+10 then print "plus10 FAIL ";a;" <> ";b
  if c<>b+10 then print "plus10 FAIL 2 ";c;" <> ";b
  return a
end function

function calladd10 (byref a as integer) 
  return add10 (a)
end function


function midstr (byref s as string, start, length) as string
  dim temp(255) as string

  temp = right(s,len(s) - start)

  return left(temp,length)
end function



'============================================================================================
'===============================  start of code =============================================
'============================================================================================

xyzzy:

const x1111 = 1111
const x1    =    1
const x1234 = 1234

if x1234 <> 1234 then print "FAIL const expression"
if x1 <> 1 then print "FAIL simple constant"
if x1111 <> 1111 then print "FAIL long constant"
if x1111+x1+x1234 = 2346 then PRINT "constants OK" else print "constant FAIL"

zzz = 33
gosub changei (zzz)
if zzz<>110 then print "byref FAIL 1 "; zzz

print zzz


aaa = 1
zzz = changei (aaa)
if zzz<>10  then print "byref FAIL 2 "; zzz
if aaa<>110 then print "byref FAIL 3 "; zzz

print zzz


gosub changes (zzz)
if zzz<>110 then print "byref FAIL 4 "; zzz

print "byref tests done"

' asm ($ea000000)
' asm ($12345678)

print "passed ASM test"

a="a"
b="b"

x=0
x=x+ a<=b
x=x+ a<b
x=x+ a<>b
x=x+ b>=a
x=x+ b>a
x=x+ a=a

x=x+ a<="b"
x=x+ a<"b"
x=x+ a<>"b"
x=x+ b>"a"
x=x+ b>="a"
x=x+ b="b"


a=faa(1)
if ("a"=fa) then x=x+1
x=x+ a="aa"
if "aa"=faa(1) then x=x+1
if "aa"=fret(a) then x=x+1
x=x+ b=fbret(b)
x=x+ a=faa(1)
x=x+ b=fret("b")
x= b=fbret(b)+x

x = x + "c"="c"
x = x + "d"<>"c"
x = x + "abcd" = "abcd"
x = x + "abcd" <> "Abcd"


#ifdef LEADING_STR_FUNCT_OK

x= faa(2)="aa" + x
x= faa(2)=a + x
x= fbret(b)=b + x
x= fret("b")=b + x


#else

x=x+4

#endif

a = "ASDFASDF"
b = a
b = call2lower(a)



x = x + a=b

b = ""
x = b=rets("") + x
print ":";b;":";rets(b);":"
b = "1"
x = b=rets("1") + x
print ":";b;":";rets(b);":"
b = "abcd"
x = b=rets("abcd") + x
print ":";b;":";rets(b);":"

if x<>32 then print "string compare FAIL",x else print "strcomp OK"

c = toupper("asdfasdf")
print toupper("asdfasdf")


a=c

print "c= ";c,a

b = a
c = call2lower(a)
print a,b,c
if a<>c then print "FAIL lower-upper"


a = "0123456789.123456789:0123456"
b = midstr(a,10,5)
if b<>".1234" then print "FAIL midstr"

gosub fa		'
if xxx<> 22 then print "global param FAIL" else print "OK"

a = "01234"
if item2(a) = item2("xx2xxxx") then print "item2(x) OK" else print "item2(x) fail"


xx = 1
yy = calladd10 (xx)
if plus10(xx)<>21 then print "call call byval FAIL"

if xx=yy then print "OK" else print "call call byref FAIL "


#warning  this is a warning -- the first

//#error this is an error

#ifdef XYZZY
#include "nofile.bas"    
#include "noway.bas"     ' this file does not exist
#endif

#warning  this is a warning


dim s(100) as string
s="include FAIL"

 #include "branch1.bas"

total = 0

s = "asdf"+"zxcv"    ' strings with comment
if strcomp("asdfzxcv",s)<>0 then print "FAIL simple string"

x = 0
y = 0

for i= 0 to 5
	x=0
	gosub testGOTO	
	gosub testBRANCH
'	on (i+5)*2-10 gosub br1,br2,br3,br4,br5
	select (i+5)*2-10-i
	  case 0 
	  	gosub br1
	  case 1 
	  	gosub br2
	  case 2 
	  	gosub br3
	  case 3 
	  	gosub br4
	  case 4 
	  	gosub br5
	endselect

	y= 3*(i+1)
	if i=5 then y=20
	print "xx", i,x,y
	if x <> y then print "FAIL", i,x,y
next i

    print total
    if total <> 110 then print "FAIL" 
    
print "test repeated function call"
    
cnt = 1000    
while cnt
	FOR X = 0 TO 23
	SELECT X
	CASE 0,11,14 TO 18
		a = toupper("Complex")+x
	CASE ELSE
		a = toupper("ElSe")+x 
	ENDSELECT
	NEXT X
	cnt = cnt - 1
loop
    
	print "done"
	end



testGOTO:
'	on -i+(i+5)*2-10-i goto br1,br2,br3,br4,br5
	select -i+(i+5)*2-10
	  case 0 
	  	goto br1
	  case 1 
	  	goto br2
	  case 2 
	  	goto br3
	  case 3 
	  	goto br4
	  case 4 
	  	goto br5
	  case else 
	  	x=x
	endselect
	x=x+10
	return

testBRANCH:
'	branch (a+5)*2-10-a, [br1,br2,br3,br4,br5]
	select (i+5)*2-10-i
	  case 0 
	  	goto br1
	  case 1 
	  	goto br2
	  case 2 
	  	goto br3
	  case 3 
	  	goto br4
	  case 4 
	  	goto br5
	endselect
	x=x+10
	total = total+x
	return


br1:
	x=x+1
	goto brEND
br2:
	x=x+2
	goto brEND
br3:
	x=x+3
	goto brEND
br4:
	x=x+4
	goto brEND
br5:
	x=x+5
brEND:	
	total = total + x
	return	
	
	
'	run
	