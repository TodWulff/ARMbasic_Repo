#include "CORIDIUM_PCB.bas"

print "Testing HWPM11"

'HWPWM ( channel, cycleTime, highTime )

HWPWM ( 1, 10, 2 )'P0.8
HWPWM ( 2, 10, 4 )'P0.9
HWPWM ( 3, 10, 6 )'P0.10
HWPWM ( 4, 10, 8 )'P1.9 