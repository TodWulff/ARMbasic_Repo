
CONST failmsg="FAIL**FAIL**FAIL**FAIL"

dim a(20) as string
dim zz(20) as single
dim ii(20)
dim x,y,z as single

function toup(a$(100)) as string
  dim i
  for i=0 to 100
    if a$(i)>="a" then a$(i)=a$(i) and &HDF  ' crude upshift
  next i
  return a$
endfunction

function tolow(byval a$(100) as string) as string
  dim i
  for i=0 to 100
    if a$(i)>="A" then a$(i)=a$(i) or &H20 ' crude downshift
  next i
  return a$
endfunction

function xyzzy()            ' check no params OK
    return 1234
endfunction

someglobal = 111         ' this never gets executed, but does declare it

sub plugh()            ' check no params OK
    someglobal = 4321
endsub

' do all the combinations of declaring a string with $ on name


function tolow5(byref a$) as string
  dim i
  for i=0 to 100
    if a$(i)>"A" then a$(i)=a$(i) or &H20 ' crude downshift
  next i
  return a$
endfunction

function tolow4(byref a$()) as string
    return tolow5(a$)
endfunction

function tolow3(byref a$) as string
    return tolow4(a$)
endfunction

function tolow2(byref a$() as string) as string
    return tolow3(a$)
endfunction


function fsum(byref z() as single) as single
  'print z(0),z(1),z(2)
  return z(0)+z(1)+z(2)
endfunction

function findirect(x() as single) as single
  return fsum(x)
endfunction


function isum(byref z())
  return z(0)+z(1)+z(2)
endfunction

function iindirect(x())
  return isum(x)
endfunction


function checkpa(paramarray y)
  dim i,x
 
  x=0
 
  for i=0 to y(15)
      x += y(i)
  next i
 
  return x
endfunction


main:


i = 5
j = 3

print i,j


x = j/i *3

print x

wait(100)

a=failmsg

if a="FAIL**FAIL**FAIL**FAIL" then print "OK" else print "FAIL*****************"

'print a

if failmsg = a and a = "FAIL**FAIL**FAIL**FAIL" and "FAIL**FAIL**FAIL**FAIL" = failmsg then print "OK1" else print "FAIL1"

if x > 1.81 then print failmsg,x
if x < 1.79 then print failmsg,x

const list1 = {101, 102, 103,104, 105}


if list1(0)-list1(1) <> -1 then print "FAIL",list1(0),list1(1)

const xxxx = {55,66,77}

idx4 = 4
idx2 = 2

if list1(idx4)-50 = xxxx(2)-22 then print "OK" else print "FAIL3"
if list1(4)-50 = xxxx(idx2)-22 then print "OK" else print "FAIL3a"
if list1(4)-50 = xxxx(2)-22 then print "OK" else print "FAIL3b"
if list1(idx4)-50 = xxxx(idx2)-22 then print "OK" else print "FAIL3c"

CONST OKmsg="OK"

const multi = {0,&H11,&H22,&H33
  ,&H44,&H55,&H66,
  &H77,&H88,&H99
  }
 
if multi(1)+multi(8)= &H99 then print OKmsg else print "FAIL2"


print hex(addressof multi)

if *(addressof multi +(9<<2)) = multi(9) then print OKmsg else print FAILmsg,multi(9),*(addressof multi +(9<<2))

const list2 = {1.1, 2.2,
               3.3,
               4.4}
               
x = list2(0)

if x <> 1.1 then print "FAILx",x

x = list2(3)

if x <> 4.4 then print "FAILy",x

'print fsum(list2)			' not ready yet

i = 1

i or= 2

i += 4

if i<>7 then print FAILmsg,i

i and= &Hf5
i -= 1

if i<>4 then print FAILmsg,i

i += 5.678

if i<>9 then print FAILmsg,i

i = 7.1234

if i<>7 then print FAILmsg,i


if checkpa() = 0 then print "."; else print FAILmsg,901
if checkpa(1) = 1 then print "."; else print FAILmsg,902


if checkpa(1,2) = 3 then print "."; else print FAILmsg,903
if checkpa(1,2,4,5,6) = 18 then print "."; else print FAILmsg,904

ii(0)=11
ii(1)=22
ii(2)=33

if isum(ii) <> 66 then print FAILmsg,905

ii(0)=33

if iindirect(ii) = 88 then print "."; else print FAILmsg,906



zz(0)=11
zz(1)=22.00
zz(2)=33

if fsum(zz) = 66 then print "."; else print FAILmsg,907,fsum(zz)

zz(0)=33

if findirect(zz) = 88 then print "."; else print FAILmsg,908

print isum(ii),fsum(zz)

x=1.11
y=2.22
z=3.33

if x*y <>2.4642     then print FAILmsg,x*y
if x+y <>3.33       then print FAILmsg,x+y
if 5.1 + x+y*z/3.33 - 51/10 > 3.33001  then print FAILmsg,1,5.1 + x+y*z/3.33 - 51/10
if 5.1 + x+y*z/3.33 - 51/10 < 3.32999  then print FAILmsg,2,5.1 + x+y*z/3.33 - 51/10
if z-x >=y+0.0001   then print FAILmsg,z-x,y
if z-x <=y-0.0001   then print FAILmsg,z-x,y
if z-x >=y-0.0001   then print "."; else print FAILmsg,z-x,y
if z-x <=y+0.0001   then print "."; else print FAILmsg,z-x,y
if z-x > y-0.0001   then print "."; else print FAILmsg,z-x,y
if z-x < y+0.0001   then print "."; else print FAILmsg,z-x,y
if x/y =0.5         then print "."; else print FAILmsg,x/y

print "simple single ops tested"


dim abc$(20)

if toup("abcd")="ABCD" then print "."; else print FAILmsg,toup("abcd")

abc$ = "XYZ"

if "xyz"<>tolow(abc$) then print FAILmsg,tolow(abc$) else print OKmsg
if "XYZ"<>abc$ then print FAILmsg,abc$ else print OKmsg       ' check byval did not change original
if "xyz"<>tolow2(abc$) then print FAILmsg,tolow2(abc$) else print OKmsg
if "xyz"<>abc$ then print FAILmsg,abc$ else print OKmsg        ' check byref changes original

print "deprecated string$ tests"



if xyzzy = 1234 then print "."; else print FAILmsg,xyzzy
if xyzzy() = 1234 then print "."; else print FAILmsg,xyzzy()

if someglobal = 0 then print "."; else print FAILmsg,someglobal
plugh
if someglobal = 4321 then print "."; else print FAILmsg,someglobal
someglobal = 222
plugh()
if someglobal = 4321 then print "."; else print FAILmsg,someglobal

print "no parameter cases"

a = sprintf("this is %d a %x of %c",33,44,55)

if a = "this is 33 a 2c of 7" then print "OK" else print FAILmsg

i = &H12345678
abc$=hex(i)

if "12345678" = abc$ then print "."; else print FAILmsg


wait(200)

#if 0 // #ifdef TEST_STR_FLOAT

z = 123.125

a = z
print 12,a,34
if a = "123.125" then print OKmsg else print FAILmsg,a

a = STR(x)

if "123.125" = a then print OKmsg else print FAILmsg,a

#endif

z = 123.125

a = SPRINTF("%4.2f",z)
if a = " 123.13" then print OKmsg else print FAILmsg,a


print "sprintf hex check",z,a,z


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

const dupOKmsg = "OK."

print "Duplicate Constant test"

print OKmsg


dup_a=777777
dup_b=222222
dup_c=111111


dup_d=111111

goto skipit

__ASM__(0x11111111)
__ASM__(0x11111111)
__ASM__(0x11111111)

skipit:

print dup_a,dup_b,dup_c,dup_d,dup_e,dup_f


dup_e=111111
dup_f=222222


dup_g=333333
dup_h=777777


dup_i=222222
dup_j=111111
dup_k=111111
dup_l=111111
dup_m=222222
dup_n=333333


if dup_a=777777 then print dupOKmsg; else print "FAIL",dup_a;"<>";777777
if dup_b=222222 then print dupOKmsg; else print "FAIL",dup_b;"<>";222222
if dup_c=111111 then print dupOKmsg; else print "FAIL",dup_c;"<>";111111
if dup_d=111111 then print dupOKmsg; else print "FAIL",dup_d;"<>";111111
if dup_e=111111 then print dupOKmsg; else print "FAIL",dup_e;"<>";111111
if dup_f=222222 then print dupOKmsg; else print "FAIL",dup_f;"<>";222222
if dup_g=333333 then print dupOKmsg; else print "FAIL",dup_g;"<>";333333
if dup_h=777777 then print dupOKmsg; else print "FAIL",dup_h;"<>";777777
if dup_i=222222 then print dupOKmsg; else print "FAIL",dup_i;"<>";222222
if dup_j=111111 then print dupOKmsg; else print "FAIL",dup_j;"<>";111111
if dup_k=111111 then print dupOKmsg; else print "FAIL",dup_k;"<>";111111
if dup_l=111111 then print dupOKmsg; else print "FAIL",dup_l;"<>";111111
if dup_m=222222 then print dupOKmsg; else print "FAIL",dup_m;"<>";222222
if dup_n=333333 then print dupOKmsg; else print "FAIL",dup_n;"<>";333333

dup_o=444444
dup_p=333333
dup_q=777777
dup_r=222222
dup_s=111111

if dup_o=444444 then print dupOKmsg; else print "FAIL",dup_o;"<>";444444
if dup_p=333333 then print dupOKmsg; else print "FAIL",dup_p;"<>";333333
if dup_q=777777 then print dupOKmsg; else print "FAIL",dup_q;"<>";777777
if dup_r=222222 then print dupOKmsg; else print "FAIL",dup_r;"<>";222222
if dup_s=111111 then print dupOKmsg; else print "FAIL",dup_s;"<>";111111

#if 1

CONST cs1="cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1."
CONST cs2="cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2."
CONST cs3="cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3."
CONST cs4="cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4."

CONST css1="cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1.cs1."
CONST css2="cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2.cs2."
CONST css3="cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3.cs3."
CONST css4="cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4.cs4."

if cs4=css4 then print dupOKmsg; else print "FAIL",4
if cs4=css4 then print dupOKmsg; else print "FAIL",44

if cs1=css1 then print dupOKmsg; else print "FAIL",1
if cs2=css2 then print dupOKmsg; else print "FAIL",2
if cs3=css3 then print dupOKmsg; else print "FAIL",3

print
print cs3
print cs4

#endif

////////////////////////////////////////////////////////////////////////////////////////////////
//   tests for val

if val("1234") = 1234 then print OKmsg; else print "FAIL",5

a = "4321"

if 4321 = val(a) then print OKmsg; else print "FAIL",50

i = val("$1234")

if 0x1234 = i then print OKmsg; else print "FAIL",51,i

a = "$1234"

if val(toup(a)) = i then print OKmsg; else print "FAIL",52,i,toup("$1234"),a

const _sqrtk    =    3.162277660168380000

if 100.0*_sqrtk < 316 then print "FAIL  single const"
if _sqrtk*100.0> 317 then print "FAIL  single const2"

x = _sqrtk
if x > 3.17 then print "FAIL simple assign const",x
if x < 3.16 then print "FAIL simple assign const",x

///////////////////////////////////////////////////

print

zz(1) = 2.5
i=1
x=zz(i)*2
if x<>5 then print "FAIL single array",x

///////////////////////////////////////////////////


print "test unaligned read/write, rd_byte, rd_half"

ii(0) = &H44332211
ii(1) = &H88776655
ii(2) = &Hccbbaa99
ii(3) = &H00ffeedd

for i=0 to 14
	if rd_byte(addressof( ii) + i) = (i+1)*&H11 then print "."; else print "*** FAIL ***", i, rd_byte(addressof ii + i)
next i

if rd_half(addressof ii) = &H2211 then print "h"; else print "*** FAIL  rd_half 1***"
//if rd_half(addressof ii+1) = &H3322 then print "h"; else print "*** FAIL  rd_half 2***"
if rd_half(addressof ii+2) = &H4433 then print "h"; else print "*** FAIL  rd_half 3***"
//if rd_half(addressof ii+3) = &H5544 then print "h"; else print "*** FAIL  rd_half 4***"

if *(addressof ii + 0) = &H44332211 then print "w"; else print "*** FAIL  *word 1***"
//if *(addressof ii + 1) = &H55443322 then print "w"; else print "*** FAIL  *word 2***"
//if *(addressof ii + 2) = &H66554433 then print "w"; else print "*** FAIL  *word 3***"
//if *(addressof ii + 3) = &H77665544 then print "w"; else print "*** FAIL  *word 4***"

wr_byte(addressof ii + 0, &H21)
wr_byte(addressof ii + 5, &H43)
wr_byte(addressof ii + 10, &H54)
wr_byte(addressof ii + 15, &H65)

wr_half(addressof ii + 2, &H1234)
wr_half(addressof ii + 8, &Habcd)

print
if ii(0) = &H12342221 then print "w"; else print "*** FAIL  ii(0) ***",Hex(ii(0))
if ii(1) = &H88774355 then print "w"; else print "*** FAIL  ii(1) ***",Hex(ii(1))
if ii(2) = &Hcc54abcd then print "w"; else print "*** FAIL  ii(2) ***",Hex(ii(2))
if ii(3) = &H65ffeedd then print "w"; else print "*** FAIL  ii(3) ***",Hex(ii(3))

j = rd_shalf(addressof ii + 8)

if j = -21555 then print " sw" else print "*** FAIL shalf ***"

print "test interrupt on/off -- should pause for 1 second"
wait(100)
interrupt(0)
print ".....................................................this print should be delayed"
wait(1000)
interrupt(1)


	
	
