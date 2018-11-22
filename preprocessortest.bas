Print "FilePP PreDefined Macros Only"
print __FILEPP_INPUT__
print __ISO_DATE__
print __NEWLINE__
print __TAB__
print __NULL__
print __VERSION__
print

PRINT "Common to BT BPP and FilePP"
print __FILE__
print __LINE__
print __DATE__
print __TIME__
print __BASE_FILE__
print __INCLUDE_LEVEL__
print

PRINT "BT BPP PreDefined Macros Only"
print __CORIDIUM__
print __STDC__
print __STDC_HOSTED__
print

PRINT "Neither?"
print __STDC_VERSION__
print __OBJC__
print __ASSEMBLER__


print __func__
print __FUNCTION__
print __cplusplus

Print "FILEPP PreProcessor Directives"

	Print "#comment"
	
	Print "#include"
	
	Print "#define"
	Print "#undef"
	
	Print "#ifdef"
	Print "#ifndef"
	
	Print "#if"
	Print "#elif"
	Print "#else"
	Print "#endif"
	
	Print "#pragma"
	Print "#error"
	Print "#warning"
	print
 
/* Print "BT BPP PreProcessor Directives"  ' https://gcc.gnu.org/onlinedocs/gcc-4.2.0/cpp/index.html#Top
#include

#define
#undef

#ifdef
#ifndef

#if
#elif
#else
#endif

#pragma
#error
#warning

#include_next
#line

#ident
#sccs

#assert ' https://gcc.gnu.org/onlinedocs/gcc-4.2.0/cpp/Assertions.html#Assertions
#unassert ' https://gcc.gnu.org/onlinedocs/gcc-4.2.0/cpp/Assertions.html#Assertions

#import  ' https://gcc.gnu.org/onlinedocs/gcc-4.2.0/cpp/Obsolete-once_002donly-headers.html#Obsolete-once_002donly-headers
#pragma once  ' https://gcc.gnu.org/onlinedocs/gcc-4.2.0/cpp/Obsolete-once_002donly-headers.html#Obsolete-once_002donly-headers
 */
