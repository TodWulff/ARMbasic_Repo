/*
	Copyright 2007 Coridium Corp --	www.coridium.us

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

// A simple monitior that allows read and write to hardware registers or memory
// from the debug serial port, useful for debugging without JTAG connection, or
// sometimes easier than the IDE interface


//Coridium BreakPoint:
//	@ hex [yy] - dump at hex yy words
//	! hex yyy  - write yyy to hex
//	^ to continue
//
//	Also d or w for @

#ifndef __BREAKPOINT_H_
#define __BREAKPOINT_H_

int hexdigit(char c) ;
void breakHelpScreen(void) ;
void dumpmem(char *line) ;
void changemem(char *line) ;
int break_command(void);
void breakpoint(void) ;

#define helpscreen	breakHelpScreen		// name change

#endif

