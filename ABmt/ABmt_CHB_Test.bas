dim ABmt_Module(63) as string

#define enabledchb
#include "ABmt_Lib\ABmt_CircularBuffer.lib"


main:
dim i as integer

_CHB_init
timer = 0
wait(1000)

for i = 1 to 3000
_CHB_EventAdd(i, timer)
next i


' for i = 0 to 2500
' _CHB_EventAdd(i, timer)
' next i


_CHB_print

end
