'standard var dims
dim int1 as integer
dim sgl1 as single
dim str1(10) as string

'to be used for nulls
dim NInt as integer
dim NSgl as single
dim NStr(10) as string


Const	 nsnan		=	$FF800001


function teststuff( byref testint as integer, byref testsgl as single, byref teststr as string) as integer


print 
Print "inside Passed:"
print addressof testint, *(addressof testint), testint, "<--testint"
print addressof testsgl, *(addressof testsgl), testsgl, "<--testsgl"
print addressof teststr, *(addressof teststr), teststr, "<--teststr"
print

' change the values internally
/* testint = 789
testsgl = 123.456
teststr = "changed" */

/* print
print "inside Edited:"
print addressof testint, *(addressof testint), testint, "<--testint"
print addressof testsgl, *(addressof testsgl), testsgl, "<--testsgl"
print addressof teststr, *(addressof teststr), teststr, "<--teststr"
print */

return 1

endfunction

main:

NInt = $FF800001
*(addressof NSgl)  =nsnan
NStr=""

int1=123
sgl1 = 456.789
str1 ="abc"

print "orig:"
print addressof int1, *(addressof int1), int1, "<--int1"
print addressof sgl1, *(addressof sgl1), sgl1, "<--sgl1"
print addressof str1, *(addressof str1), str1, "<--str1"
print

print teststuff (int1,sgl1,str1)

' print "should be changed:"
' print addressof int1, *(addressof int1), int1, "<--int1"
' print addressof sgl1, *(addressof sgl1), sgl1, "<--sgl1"
' print addressof str1, *(addressof str1), str1, "<--str1"
' print

print "Nulls:"
print addressof NInt, *(addressof NInt), NInt, "<--NInt"
print addressof NSgl, *(addressof NSgl), NSgl, "<--NSgl"
print addressof NStr, *(addressof NStr), NStr, "<--NStr"
print

print teststuff (NInt,NSgl,NStr)


' print "should be changed:"
' print addressof NInt, *(addressof NInt), NInt, "<--NInt"
' print addressof NSgl, *(addressof NSgl), NSgl, "<--NSgl"
' print addressof NStr, *(addressof NStr), NStr, "<--NStr"
' print



end
