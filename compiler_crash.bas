function _uinput(byref str_pmpt as string) as string
	dim temp(16) as string
	print str_pmpt;
	debugin temp
	return temp
	' return ( debugin temp)
	endfunction

Main:

Print _uinput("enter sumptin: ")

end
