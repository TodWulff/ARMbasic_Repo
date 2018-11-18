dim task_state_verbose1(16) as string
dim task_state_verbose2(16) as string
dim task_state_verbose3(16) as string
dim task_state_verbose4(16) as string

dim task_state_verbose(4) as integer

sub init()
	task_state_verbose1	= "Not Started"
	task_state_verbose2	= "Idle"
	task_state_verbose3	= "Active"
	task_state_verbose4	= "Paused"
	
	task_state_verbose(1) = addressof task_state_verbose1
	task_state_verbose(2) = addressof task_state_verbose2
	task_state_verbose(3) = addressof task_state_verbose3
	task_state_verbose(4) = addressof task_state_verbose4
	endsub
	
function StrArray(byref str_addr() as string) as string
	dim rtnstr(16) as string
	rtnstr = *STR_ADDR
	print rtnstr
	return 
	endfunction
	 
main:

	dim i as integer

	init()

	for i = 1 to 4
	print *task_state_verbose(i)
	print StrArray("123")
	next i

end
