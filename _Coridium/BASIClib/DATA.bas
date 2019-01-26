
#ifndef _DATA_REPLACE
#define _DATA_REPLACE

#define READ	bREAD
#define RESTORE bRESTORE

#define DATA	const bDATA={
#warning you will have to modify your DATA statements

bDATA_INDEX	= 0

goto jumparoundDATA

FUNCTION bREAD AS INTEGER
	bDATA_INDEX += 1
	return bDATA(bDATA_INDEX-1)
END FUNCTION

SUB bRESTORE
	bDATA_INDEX += 1
END SUB

jumparoundDATA:

#endif