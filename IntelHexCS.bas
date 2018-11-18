

':4002C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000021436587AE

dim code_block(68) as integer
dim input_str(136) as string
dim temp_str(2) as string
dim y as integer

function i2h (long as integer) as string
	dim temp_str(24) as string
	temp_str = hex(long)
	temp_str = "00000000" + temp_str
	temp_str = right(temp_str,8)
	return temp_str
	endfunction

function toupper(a(100) as string) as string
dim i as integer
for i=0 to 100
if a(i)=0 then exit
if a(i) <= "z" and a(i) >= "a" then a(i) = a(i) - &H20
next i
return a
end function

FUNCTION CALC_INTEL_CS AS INTEGER	' THIS CALCULATES THE CHECKSUM IN THE (GLOBAL ARRAY) CODE_BLOCK

	DIM CS AS INTEGER
	DIM X AS INTEGER

	CS = 0
	
	FOR X = 1 TO 68
		CS = CS + CODE_BLOCK(X)
		'print "Value: ";Code_Block(x), "Running CS: ";CS
	NEXT X
	CS = CS MOD 256
	CS = ($FF AND(NOT CS)) +1 
	RETURN CS

ENDFUNCTION


main:
Print "enter 136 char string to generate CS on:"
print
debugin input_str
print input_str
print "Checksum: ";

for y = 1 to 68
temp_str = "$" & left(input_str,2)
input_str = right(input_str,len(input_str)-2)
code_block(y) = val(temp_str)
'print y;": ";val(temp_str)
next y

y = CALC_INTEL_CS
temp_str = i2h(y)
temp_str = right(temp_str,2)
temp_str = toupper(temp_str)
Print temp_str

end

