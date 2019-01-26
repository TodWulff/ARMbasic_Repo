'========================================================================================
'
'	String Functions
'
'	no initialization code
'
'		copyright Coridium Corp, 2007,   may be used with Coridium Hardware or licensees
'========================================================================================
#ifndef USE_STRING
#define USE_STRING

goto jumpAroundString

#ifndef SHARED_STRING
	dim sharedString(255) as string
#define SHARED_STRING
#endif

function tolower(byref a as string) as string
  dim i as integer
  for i=0 to 255
    if a(i) = 0 then exit
    if a(i) <= "Z" and a(i) >= "A" then a(i) = a(i) + &H20
  next i
  return a
end function


function toupper(byref a as string) as string
  dim i as integer
  for i=0 to 255
    if a(i) = 0 then exit
    if a(i) <= "z" and a(i) >= "a" then a(i) = a(i) - &H20
  next i
  return a
end function


function midstr (byref s as string, start, length) as string

  sharedString = right(s,len(s) - start)

  return left(sharedString,length)
end function

function strstr (byref searchee as string, byref lookfor as string)
	dim i as integer
	dim j as integer
	
	j=0
	
	while searchee(j)
		i = 0
		
		while 1
			if lookfor(i)=0 then return j
			
			if lookfor(i) <> searchee(i+j) then exit
			
			i=i+1
		loop
		
		j=j+1
	loop
	
	return -1
	
end function


function strchr (byref s as string, c)
	dim i as integer
	i = 0
	
	while s(i)
		if s(i)=c then exit
		i=i+1
	loop
	
	if s(i) = 0 then return -1
	
	return i
end function

jumpAroundString:

#endif
