/*
	Copyright 2001, 2002 Georges Menie (www.menie.org)

	Floating Point additions and other modifications by Coridium Corp 2007
	www.coridium.us

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

//#define USE_FLOAT		//  to add floating point support uncomment this line -- requres 4K of code

#ifndef _PRINTF_H
#define _PRINTF_H

/*
	outbyte (send single character to serial port)is the only external 
	dependency for this file, if you have a working outbyte, just remove 
	the following define. If the function should be called something else,
	replace outbyte(c) by your own function call.
*/

#define outbyte putchar		// comment this out if you have a different outbyte routine

int outbyte(int);			// send a character to the debug serial port


//////////////////////////////////////////////////
//
//	some compilers seem happier doing it this way
//
#if defined ( __CC_ARM   ) 
 #define puts		_embedded_puts
 #define printf  	_embedded_printf
 #define sprintf	_embedded_sprintf
#endif

int putchar(int c);

int puts(char *s);

int printf(const char *format, ...);

int sprintf(char *out, const char *format, ...);

#endif
