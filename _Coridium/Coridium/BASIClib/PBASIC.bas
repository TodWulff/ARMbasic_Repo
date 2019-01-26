#ifndef _PBASIC_LIB
#define _PBASIC_LIB

' this LCG routine from wikipedia
FUNCTION RND(seed)

	seed *= 279470273 
    RETURN seed MOD 4294967291
       
END FUNCTION


FUNCTION REV(y,bits) 
	DIM i,x
	
	x = y
	FOR i = 0 to bits
		x AND= NOT(1<<i)
		if (y AND (1 << (bits - i -1))) THEN x OR= (1 << i)
	NEXT i
	RETURN x
END FUNCTION

#endif
