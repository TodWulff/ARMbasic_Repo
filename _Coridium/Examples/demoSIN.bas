
#define include_trig

#include <AB_Math.bas>

dim x as single

print " i       sin           cos"

for i=0 to 90 step 10

print i,sin(_deg2rad * i),cos(_deg2rad * i)

next i
