/*
	Copyright 2001, 2002 Georges Menie (www.menie.org)
	
	Floating Point additions and other modifications by Coridium Corp 2007
	www.coridium.us
	
	2018 -- fixed rounding changing format error -- Coridium

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

//  #define USE_FLOAT	// enables floating point formats


#ifdef FOR_BASIC	// BASIC doesn't use the length of characters printed
  #define ADD2CharCnt
  #define INCCharCnt
  #define CharCntPLUS
 #include "basic_pcb.h"
#else
  #define ADD2CharCnt CharCnt+=
  #define INCCharCnt  ++CharCnt
  #define CharCntPLUS CharCnt+
#endif

#include "printf.h"


int puts(char *s) {
	char lastc = 0;
	
	while (*s) {
		lastc = outbyte(*s);
		s++;
	}
	return lastc;
}

static void printchar(char **str, int c)
{
//	extern int outbyte(int c);
	if (str) {
		**str = c;
		++(*str);
	}
	else (void)outbyte(c);
}

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	int CharCnt = 0, padchar = ' ';

	if (width > 0) {
		int len = 0;
		const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			INCCharCnt;
		}
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		INCCharCnt;
	}
	for ( ; width > 0; --width) {
		printchar (out, padchar);
		INCCharCnt;
	}

	return CharCnt;
}

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 14


#ifdef FOR_BASIC	
  extern char	dec0x80000000[];		//"2147483648"
//  extern char	hex0x80000000[];		//"80000000"
#endif

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	char *s;
	int t, neg = 0;
#ifdef FOR_BASIC	
	int u = i;				// using only signed divide saves lot of code...  more than the special case below
	
	if ((i == 0x80000000) && (b == 10)) {
		printchar (out, '-');
		INCCharCnt;
		--width;
		return prints (out, dec0x80000000, width, pad);
	}	
#else	
	int CharCnt = 0;
	unsigned int u = i;
#endif

	if (i == 0) {
		print_buf[0] = '0';
		print_buf[1] = '\0';
		return prints (out, print_buf, width, pad);
	}

	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	if (b == 16) {
		t = u & 0xF;
		if( t >= 10 )
			t += letbase - '0' - 10;
		*--s = t + '0';
		u = (u >> 4) & 0x0FFFFFFF;
	}
	while (u) {
		t = u % b;
		if( t >= 10 )
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
		if( width && (pad & PAD_ZERO) ) {
			printchar (out, '-');
			INCCharCnt;
			--width;
		}
		else {
			*--s = '-';
		}
	}

	return CharCntPLUS prints (out, s, width, pad);
}

#ifdef USE_FLOAT	

//float flt4print;				// normalized value is built here d.dddddd

union{ int i; float f; } flt4print;

int flt_log10(char **out,float fp, int width, int pad) {		
											// returns the integer portion of log10 of x
	int exp,j;								// or -99 for NaN

	flt4print.f = fp;
	j = flt4print.i;
	if (j & 0x80000000) {
		flt4print.f = -flt4print.f;
		printchar (out, '-');
	}
	if( (j & 0x7F800000) == 0x7F800000) {
		if (j & 0x007FFFFF) prints(out, "NaN", width, pad); else prints(out, "Inf", width, pad);
		return -99;
	}
	
	exp = (j & 0x3F800000) >> 23;
	
	if ((j & (1<<30))==0)  exp -= 128;		// find the rough log2 of x
	
	exp = exp / (float) 3.321928095;		// convert to rough log10 of x

	j = exp;
	if (exp > 0) {
		while (j--) flt4print.f /= 10;
	} else if (exp < 0) {
		while (j++) flt4print.f *= 10;
	}

	if (flt4print.f >= 10) {				// adjust log10
		exp++;
		flt4print.f /= 10;
	}
	if (flt4print.f < 1) {
		exp--;
		flt4print.f *= 10;
	}
	
	return exp;
}

int scalebyprec (int prec) {
	int mult = 1;
	
	while (prec-- > 0) mult *= 10;
	
	return mult;
}

char flt_digit_rollover;

#ifdef FOR_BASIC
  extern char g_ROUND_PRINT;
#else
  #define g_ROUND_PRINT	0		// set to 1 to round printf for float
#endif  

int printflt (char **out, float x, int width, int prec, int pad, int doEnum)
{
	int M, N, CharCnt=0;
	int mult, exp, scale=0;

	exp = flt_log10(out, x, width, pad);			// find the base10 exponent and print - sign
	if (exp == -99) return 3;

	if (x < 0) {
		x = -x;
		INCCharCnt;
	}

	if (x > (float) 4294967295.0) {
		scale = exp - 6;
		x = x / scalebyprec(scale);
    	mult = 1;
	} else
    	mult = scalebyprec(prec+1);	
	
	M = (int) x;
	
        
	N = (int) ((x - M)*mult);
	if (g_ROUND_PRINT) {	// in BASIC this is a compiler flag, in C a #define normally 0
//		printchar (out, '['); printi (out, M, 10, 1, width, pad, 'a'); printchar (out, ':');  printi (out, N, 10, 1, width, pad, 'a'); printchar (out, ']');
		
    	N += 5;
	    if (N >= mult) {
		    M++;
		    N=0;
    		if (doEnum) {
			    if (M>=10) {
			    	M /= 10;
	    			flt_digit_rollover = 1;
    			}
//    		} else prec--;			// bug reported by user when rounding rollover happens
    		} 
    	}
	}
    N /= 10;
	
	ADD2CharCnt printi (out, M, 10, 1, width, pad, 'a');
	while (scale--) { printchar (out, '0'); INCCharCnt; }
	printchar (out, '.');
	INCCharCnt;
	
	if (prec>0) ADD2CharCnt printi (out, N, 10, 1, prec, PAD_ZERO, 'a');			
	
	return CharCnt;	
}



int printEnote (char **out, float x, int width, int prec, int pad, char Echar)
{
	union{ int i; float f; } fp;
//	float fp = x;
	int exp, CharCnt = 0;
	fp.f = x;
	
    flt_digit_rollover = 0;
	
#ifndef FOR_BASIC		
	if (fp.f < 0) INCCharCnt;
#endif
	
	exp = flt_log10(out, fp.f, width, pad);			// find the base10 exponent
	if (exp == -99) return 3;
	
	ADD2CharCnt printflt (out, flt4print.f, 1, prec, pad, 1);
	
	if ((fp.i & 0x7ffffFFFF) == 0) return CharCnt;
	printchar (out, Echar);
	INCCharCnt;
	
	if (flt_digit_rollover) {
		exp++;
	}
	
	if (exp >= 0) {
		printchar (out, '+');
		INCCharCnt;
	} else {
		printchar (out, '-');
		INCCharCnt;
		exp = -exp;		// want to see   E-02  and the like
	}
	
	ADD2CharCnt printi (out, exp, 10, 1, 2, PAD_ZERO, 'a');				
  
	return CharCnt;	
}

#ifdef FOR_BASIC		
  extern char g_BASIC_PRINT;		// this 1 when called from PRINT, 0 when PRINTF
#else
  #define g_BASIC_PRINT  0
#endif

int printGnote (char **out, float x, int width, int prec, int pad, char Gchar) {
	float fp = x;
	int i=1;

	if (fp < 0) fp = -fp;
	
	if((fp < (float) 0.1) || (fp >= (float) 10000000))  return printEnote(out, x, width, prec, pad,Gchar);
	else {
		if (g_BASIC_PRINT) {
			prec++;
			while (fp > i){
				prec--;
				i *= 10;			
			}
		}
		return printflt (out, x, width, prec, pad, 0);
	}
}

#endif

int f_sprintf(char **out, int *varg)		// need to use it in BASIC
{
	int width, pad, prec;
	int CharCnt = 0;
	char *format = (char *)(*varg++);
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = prec = pad = 0;
			if (*format == '\0') break;
			if (*format == '%') goto outc;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
				width *= 10;
				width += *format - '0';
			}

#ifdef USE_FLOAT			
			if( *format == '.' ) {
				++format;
				if (*format >= '0' && *format <= '9') {
					prec += *format++ - '0';	// get real more than 9 digits ?? -- actually breaks at 8 for now 
					prec = (prec>8)? 8 : prec;	// to fix this is not worth the time at the moment
				}
			}
			if( *format == 'f' ) {
				ADD2CharCnt printflt (out, *(float*)varg++, width, prec, pad, 0);
				continue;
			}
			if(( *format == 'E' ) || ( *format == 'e' )) {
				ADD2CharCnt printEnote (out, *(float*)varg++, width, prec, pad, *format);
				continue;
			}
			if(( *format == 'G' ) || ( *format == 'g' )) {
				ADD2CharCnt printGnote (out, *(float*)varg++, width, prec, pad, *format - 2);
				continue;
			}
#endif

			if( *format == 's' ) {
				char *s = *((char **)varg++);
				ADD2CharCnt prints (out, s?s:"(null)", width, pad);
				continue;
			}
			if( *format == 'd' ) {
				ADD2CharCnt printi (out, *varg++, 10, 1, width, pad, 'a');
				continue;
			}
			if(( *format == 'x' ) || ( *format == 'X' )) {
				ADD2CharCnt printi (out, *varg++, 16, 0, width, pad, *format - 23);
				continue;
			}
#ifndef FOR_BASIC			
			if( *format == 'u' ) {
				ADD2CharCnt printi (out, *varg++, 10, 0, width, pad, 'a');
				continue;
			}
#endif			
			if( *format == 'c' ) {
				/* char are converted to int then pushed on the stack */
				scr[0] = *varg++;
				scr[1] = '\0';
				ADD2CharCnt prints (out, scr, width, pad);
				continue;
			}
		}
		else {
		outc:
			printchar (out, *format);
			INCCharCnt;
		}
	}
	if (out) **out = '\0';
	return CharCnt;
}

/* assuming sizeof(void *) == sizeof(int) */

int printf(const char *format, ...)
{
	int *varg = (int *)(&format);
	return f_sprintf(0, varg);
}

int sprintf(char *out, const char *format, ...)
{
	int *varg = (int *)(&format);
	return f_sprintf(&out, varg);
}

#ifdef TEST_PRINTF
int main(void)
{
	char *ptr = "Hello world!";
	char *np = 0;
	int i = 5;
	unsigned int bs = sizeof(int)*8;
	int mi;
	char buf[80];

	mi = (1 << (bs-1)) + 1;
	printf("%s\n", ptr);
	printf("printf test\n");
	printf("%s is null pointer\n", np);
	printf("%d = 5\n", i);
	printf("%d = - max int\n", mi);
	printf("char %c = 'a'\n", 'a');
	printf("hex %x = ff\n", 0xff);
	printf("hex %02x = 00\n", 0);
	printf("signed %d = unsigned %u = hex %x\n", -3, -3, -3);
	printf("%d %s(s)%", 0, "message");
	printf("\n");
	printf("%d %s(s) with %%\n", 0, "message");
	sprintf(buf, "justif: \"%-10s\"\n", "left"); printf("%s", buf);
	sprintf(buf, "justif: \"%10s\"\n", "right"); printf("%s", buf);
	sprintf(buf, " 3: %04d zero padded\n", 3); printf("%s", buf);
	sprintf(buf, " 3: %-4d left justif.\n", 3); printf("%s", buf);
	sprintf(buf, " 3: %4d right justif.\n", 3); printf("%s", buf);
	sprintf(buf, "-3: %04d zero padded\n", -3); printf("%s", buf);
	sprintf(buf, "-3: %-4d left justif.\n", -3); printf("%s", buf);
	sprintf(buf, "-3: %4d right justif.\n", -3); printf("%s", buf);

	return 0;
}

/*
 * if you compile this file with
 *   gcc -Wall $(YOUR_C_OPTIONS) -DTEST_PRINTF -c printf.c
 * you will get a normal warning:
 *   printf.c:214: warning: spurious trailing `%' in format
 * this line is testing an invalid % at the end of the format string.
 *
 * this should display (on 32bit int machine) :
 *
 * Hello world!
 * printf test
 * (null) is null pointer
 * 5 = 5
 * -2147483647 = - max int
 * char a = 'a'
 * hex ff = ff
 * hex 00 = 00
 * signed -3 = unsigned 4294967293 = hex fffffffd
 * 0 message(s)
 * 0 message(s) with %
 * justif: "left      "
 * justif: "     right"
 *  3: 0003 zero padded
 *  3: 3    left justif.
 *  3:    3 right justif.
 * -3: -003 zero padded
 * -3: -3   left justif.
 * -3:   -3 right justif.
 */

#endif
