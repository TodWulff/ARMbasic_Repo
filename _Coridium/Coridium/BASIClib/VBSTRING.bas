'========================================================================================
'
'	String Functions  -- Visual BASIC style
'
'	no initialization code
'
'   these versions assume the index of the first character in a string is 1
'
'		copyright Coridium Corp, 2007,   may be used with Coridium Hardware or licensees
'========================================================================================
#ifndef VB_STRING
#define VB_STRING

goto jumpAroundVBString

#ifndef SHARED_STRING
	dim sharedString(255) as string
#define SHARED_STRING
#endif

function UCASE(byref a as string) as string
  dim i as integer
  for i=0 to 255
    if a(i) = 0 then exit
    if a(i) <= "Z" and a(i) >= "A" then a(i) = a(i) + &H20
  next i
  return a
end function


function LCASE(byref a as string) as string
  dim i as integer
  for i=0 to 255
    if a(i) = 0 then exit
    if a(i) <= "z" and a(i) >= "a" then a(i) = a(i) - &H20
  next i
  return a
end function


function MID (byref s as string, start, length) as string

  sharedString = right(s,len(s) - start + 1)

  if length = 0 then return sharedString
  return left(sharedString,length)
end function

function InStr (start, byref searchee as string, byref lookfor as string)
	dim i as integer
	dim j as integer
	
	if start > 0 then j = start-1
	
	while searchee(j)
		i = 0
		
		while 1
			if lookfor(i)=0 then return j+1
			
			if lookfor(i) <> searchee(i+j) then exit
			
			i=i+1
		loop
		
		j=j+1
	loop
	
	return 0
	
end function


jumpAroundVBString:

#endif
