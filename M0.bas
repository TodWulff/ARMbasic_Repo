sub init
	output(32)
endsub 

Main:
dim i as integer
init
do
i+=1
out(32) = i and 1
wait(500)
until i=1000

end

