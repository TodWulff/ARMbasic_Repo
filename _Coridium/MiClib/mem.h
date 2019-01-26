/*
 * mem.h
 *
 * Definitions for memory functions.
 */

#ifndef _MEM_H_
#define	_MEM_H_

/*
DESCRIPTION
	This function searches memory starting at <<*<[src]>>> for the
	character <[c]>.  The search only ends with the first
	occurrence of <[c]>, or after <[length]> characters; in
	particular, <<NULL>> does not terminate the search.

RETURNS
	If the character <[c]> is found within <[length]> characters
	of <<*<[src]>>>, a pointer to the character is returned. If
	<[c]> is not found, then <<NULL>> is returned.
*/
void * memchr (void *src_void, int c,unsigned int length);

/*
DESCRIPTION
	This function compares not more than <[n]> characters of the
	object pointed to by <[s1]> with the object pointed to by <[s2]>.


RETURNS
	The function returns an integer greater than, equal to or
	less than zero 	according to whether the object pointed to by
	<[s1]> is greater than, equal to or less than the object
	pointed to by <[s2]>.

*/
int memcmp (void * m1, void * m2,unsigned int n);

/*
DESCRIPTION
        This function copies up to <[n]> bytes from the memory region
        pointed to by <[in]> to the memory region pointed to by
        <[out]>.  If a byte matching the <[endchar]> is encountered,
	the byte is copied and copying stops.

        If the regions overlap, the behavior is undefined.

RETURNS
        <<memccpy>> returns a pointer to the first byte following the
	<[endchar]> in the <[out]> region.  If no byte matching
	<[endchar]> was copied, then <<NULL>> is returned.
*/
void * memcpy (void * dst0,void * src0,unsigned int len0);

/*
DESCRIPTION
	This function moves <[length]> characters from the block of
	memory starting at <<*<[src]>>> to the memory starting at
	<<*<[dst]>>>. <<memmove>> reproduces the characters correctly
	at <<*<[dst]>>> even if the two areas overlap.


RETURNS
	The function returns <[dst]> as passed.
*/
void * memmove (void * dst_void, void * src_void,unsigned int length) ;
	
/*
DESCRIPTION
	This function converts the argument <[c]> into an unsigned
	char and fills the first <[length]> characters of the array
	pointed to by <[dst]> to the value.

RETURNS
	<<memset>> returns the value of <[m]>.

*/
void * memset (void *m, int c, unsigned int n);



#endif
