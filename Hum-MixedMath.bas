dim sums, times(4), avgs(3) as single
dim _x, int1 as integer

times(1) = 1.167426
times(2) = 1.166702
times(3) = 1.166704
times(4) = 1.166703
int1 = 4


sums=0
for _x = 2 to 4
sums+=times(_x)
next _x
avgs(3)=sums/(1.0*(int1-1))
print avgs(3)


' sums =0.0
' for _x = 2 to int1
' print "Pass ";_x, "Avg Time: ";times(_x),"uS / timer capture", looptime(3), times(_x)-looptime(3),
' sums += times(_x)

' print sums
' next _x
' print sums/(1.0*(4 -1))
