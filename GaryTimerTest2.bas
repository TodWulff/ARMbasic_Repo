dim times(10) as integer

#define timer_reset_val 0x00004650

temp=timer
timer=timer_reset_val
temp1=timer
#ifdef LPC2103
	wait(1)
#else
	waitmicro(10)
#endif
temp2=timer

x=1
do
times(x)=timer
x+=1
until x=10

'printing time not part of the issue
print "init: ";temp
Print "Attempted to reset to: ";timer_reset_val
print timer_reset_val;"-ish?: ";temp1
print timer_reset_val;"-ish?: ";temp2

x=1
do
print x,times(x)
x+=1
until x=10
