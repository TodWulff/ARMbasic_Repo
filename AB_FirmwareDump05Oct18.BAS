
#define enabledebug 0

' these are debug stuffs from AB_Extensions - just to keep code small, inlined them here
#define debug	DEBUG
#define Debug	DEBUG
#define production PRODUCTION
#define Production PRODUCTION

#if enabledebug != 0		' need to be #def'd prior to getting here...
	#define DEBUG(args...)	args
	#define PRODUCTION(args...)
	#warning "DEBUG FACILITIES ARE ENABLED"
#else ' debug is disabled
	#define DEBUG(args...)
	#define PRODUCTION(args...)	args
	#warning "DEBUG FACILITIES ARE DISABLED"
#endif

' these defines are instantiated via a cmd line parameter passed to the preprocessor when the tool chain is kicked off...
#if defined LPC2103		' ARMmite | ARMexpress Lite | ARMpro | 
	#define LPC2103 LPC2103
	#warning TARGET: LPC2103
	#define MEM_Size	32		' 32k flash
	
	#define _tgtid	NXP LPC 2103
	#define _tgtnm	NXP LPC2103
	
#elif defined LPC2106	' ARMexpress
	#define LPC2106 LPC2106
	#warning TARGET: LPC2106
	#define MEM_Size	128
	
	#define _tgtid	LPC2106
	#define _tgtnm	NXP LPC2106
	
#elif defined LPC2138	' ARMweb/ARMconnect | DINbase
	#define LPC2138 LPC2138
	#warning TARGET: LPC2138
	#define MEM_Size	512
	#define _tgtid	LPC2138
	#define _tgtnm	NXP LPC2138

#elif defined LPC1114	' BASICchip | PROstart
	#define LPC1114 LPC1114
	#warning TARGET: LPC1114
	#define MEM_Size	32			' 32k flash
	#define _tgtid	LPC1114
	#define _tgtnm	NXP LPC1114

#elif defined LPC1751 || defined LPC1756 || defined LPC1758 || defined LPC4078  ' Super8 | Super Pro | ...
	#define LPC1751 LPC1751
	#warning TARGET: LPC1751, LPC1756, LPC1758, or LPC4078
	#define MEM_Size	
	#error CODE NEEDS TO BE PORTED TO THIS DEVICE
	#define _tgtid	LPCugh
	#define _tgtnm	NXP LPCmany
	
#elif defined LPC1768	' ???
	#define LPC1768 LPC1768
	#warning TARGET: LPC1768
	#define MEM_Size	
	#error CODE NEEDS TO BE PORTED TO THIS DEVICE
	#define _tgtid	LPC1768
	#define _tgtnm	NXP LPC1768
	
#elif defined MK20DX128 || defined MK20DX256	' ????
	#define MK20DX128 MK20DX128
	#define MK20DX256 MK20DX256
	#warning TARGET: MK20DX128, or MK20DX256
	#define MEM_Size	
	#error CODE NEEDS TO BE PORTED TO THIS DEVICE
	#define _tgtid	MK20DX128, or MK20DX256
	#define _tgtnm	MK20DX128, or MK20DX256

#elif defined LPC4330	' DATAlog???
	#define LPC4330 LPC4330
	#warning TARGET: LPC4330
	#define MEM_Size	
	#error CODE NEEDS TO BE PORTED TO THIS DEVICE 
	#define _tgtid	LPC4330
	#define _tgtnm	NXP LPC4330
	
#elif defined LPC824	' LPC800-DIP
	#define LPC824 LPC824
	#warning TARGET: LPC824
	#define MEM_Size	32			' 32k flash
	#define _tgtid	LPC824
	#define _tgtnm	NXP LPC824

#elif defined LPC54102	' ARMdrino | ARMniobe
	#define LPC54102 LPC54102
	#warning TARGET: LPC54102
	#define MEM_Size	512
	#define _tgtid	LPC54102
	#define _tgtnm	NXP LPC54102
	
#elif defined LPC11U37 || defined LPC1137 ' ARMstamp
	#define LPC11U37 LPC11U37
	#define LPC1137 LPC1137
	#warning TARGET: LPC11U37/LPC1137
	#define MEM_Size 128
	#define _tgtid	LPC11U37/LPC1137
	#define _tgtnm	NXP LPC11U37/LPC1137

#else
  #error undefined CPU type 
	exit
#endif

#define _tgtmem MEM_Size


GOTO MAIN

DIM CODE_BLOCK(68) AS INTEGER
DIM TEMP_VAL AS INTEGER

DIM LOOP_POINTER AS INTEGER
DIM BLOCK AS INTEGER
DIM MEM_VAL AS INTEGER
DIM MEM_ADR AS INTEGER
DIM TEMP_INT AS INTEGER
DIM TEMP_STR(16) AS STRING
DIM TEMP_STR2(16) AS STRING
dim usrinput(50) as string

dim L(16) as integer
dim j as integer

dim B0(4) as string
dim B1(4) as string
dim B2(4) as string
dim B3(4) as string

FUNCTION TOUPPER(BYREF A AS STRING) AS STRING	' CONVERTS A STRING TO UPPER-CASE

	DIM I AS INTEGER
	FOR I=0 TO LEN(A)-1
		IF A(I) <= "z" AND A(I) >= "a" THEN A(I) = A(I) - $20
	NEXT I
	RETURN A

ENDFUNCTION

FUNCTION CALC_INTEL_CS AS INTEGER	' THIS CALCULATES THE CHECKSUM IN THE (GLOBAL ARRAY) CODE_BLOCK

	DIM CS AS INTEGER
	DIM X AS INTEGER

	CS = 0

	FOR X = 1 TO 68
		CS = CS + CODE_BLOCK(X)
	NEXT X
	CS = CS MOD 256
	CS = ($FF AND(NOT CS)) +1 
	RETURN CS

ENDFUNCTION

SUB PRINT_CODE_BLOCK(BEGIN_BLOCK,END_BLOCK)	' THIS IS THE SUB THAT GENERATES & PRINTS THE INTEL HEX STRINGS (avoid use of __ASM__ IN THIS IMPLEMENTATION...)

	' TO KEEP RAM USEAGE TO A MINIMUM, THE SAME INTEGER ARRAY IS USED TO BUILD & PRINT EACH 68 BYTE STRING ITERATIVELY.
	DEBUG(Print "Code Block Print Entry")
	FOR BLOCK = BEGIN_BLOCK TO END_BLOCK

		DEBUG(Print "Block: ";BLOCK;" in loop from ";BEGIN_BLOCK;" to ";END_BLOCK;"...")
	
		CODE_BLOCK(1) = $40
		DEBUG(Print ". cb1: ";CODE_BLOCK(1))
		
		TEMP_INT = BLOCK * 64
		DEBUG(Print ".. ti: ";TEMP_INT)
		
		TEMP_STR = "000" & HEX(TEMP_INT)	' PREPEND A SET OF 0'S ONTO THE VAL OF THE BLOCK - TO ENSURE THAT WE HAVE ENOUGH CHARS TO WORK WITH
		DEBUG(Print "... ts: ";TEMP_STR)
		
		TEMP_STR = RIGHT(TEMP_STR,4)		' 
		DEBUG(Print ".... ts: ";TEMP_STR)
		
		TEMP_STR2 = "$" & LEFT(TEMP_STR,2)	'
		DEBUG(Print "..... ts2: ";TEMP_STR2)
		
		CODE_BLOCK(2) = VAL(TEMP_STR2)		'
		DEBUG(Print "...... cb2: ";CODE_BLOCK(2))
		
		TEMP_STR2 = "$" & RIGHT(TEMP_STR,2)	'
		DEBUG(Print "....... ts2: ";TEMP_STR2)
		
		CODE_BLOCK(3) = VAL(TEMP_STR2)		'
		DEBUG(Print "........ cb3: ";CODE_BLOCK(3))
		
		CODE_BLOCK(4) = 0
		DEBUG(Print "......... cb4: ";CODE_BLOCK(4))
		
	
		DEBUG(Print "Fetching")
			
			MEM_ADR = BLOCK * 64 	' SET THE POINTER TO THE ADDRESS THAT WE WANT TO READ

			DEBUG(Print )
			DEBUG(Print "MEM_ADR: ";MEM_ADR )
			DEBUG(Print )



		L(0)=(*(MEM_ADR+$00))
		L(1)=(*(MEM_ADR+$04))
		L(2)=(*(MEM_ADR+$08))
		L(3)=(*(MEM_ADR+$0c))
		L(4)=(*(MEM_ADR+$10))
		L(5)=(*(MEM_ADR+$14))
		L(6)=(*(MEM_ADR+$18))
		L(7)=(*(MEM_ADR+$1c))
		L(8)=(*(MEM_ADR+$20))
		L(9)=(*(MEM_ADR+$24))
		L(10)=(*(MEM_ADR+$28))
		L(11)=(*(MEM_ADR+$2c))
		L(12)=(*(MEM_ADR+$30))
		L(13)=(*(MEM_ADR+$34))
		L(14)=(*(MEM_ADR+$38))
		L(15)=(*(MEM_ADR+$3c))
			
		for LOOP_POINTER = 0 to 15
		
			temp_str = hex(L(LOOP_POINTER))
			temp_str = "00000000" + temp_str
			temp_str = right(temp_str,8)
		
			DEBUG(Print )
			DEBUG(Print )
			DEBUG(Print temp_str)
			DEBUG(Print )
'			DEBUG(Print "Printing")
		
			B3 = "$" & left(temp_str,2)
			B2 = left(temp_str,4)
			B2 = "$" & right(B2,2)
			B1 = right(temp_str,4)
			B1 = "$" & left(B1,2)
			B0 = "$" & right(temp_str,2)
			
			CODE_BLOCK(5+((0)+(LOOP_POINTER*4)))=val(B0)
			CODE_BLOCK(5+((1)+(LOOP_POINTER*4)))=val(B1)
			CODE_BLOCK(5+((2)+(LOOP_POINTER*4)))=val(B2)
			CODE_BLOCK(5+((3)+(LOOP_POINTER*4)))=val(B3)
				
			NEXT LOOP_POINTER

			MEM_ADR+=64
			
		DEBUG(Print "Printing")
		
		PRINT ":";
		
		FOR LOOP_POINTER = 1 TO 68
			TEMP_STR="0" & HEX(CODE_BLOCK(LOOP_POINTER))
			TEMP_STR=RIGHT(TEMP_STR,2)
			PRINT TOUPPER(TEMP_STR);
		NEXT LOOP_POINTER
		
		TEMP_STR="0" & HEX(CALC_INTEL_CS)
		TEMP_STR=RIGHT(TEMP_STR,2)
		PRINT TOUPPER(TEMP_STR)
		
	NEXT BLOCK
	
ENDSUB

SUB GENERATE_INTEL_HEX	' THIS SUB GENERATES THE BOUNDS TO BE PRINTED AND KICKS OFF THE PRINTING OF THE CONTENTS - USES CONDITIONAL COMPILING...

	DEBUG(Print "Generating Intel Hex")

	PRINT ":020000040000FA"	' THE HEX FILE HAS THE SAME START SEQUENCE FOR ALL TARGETS
	
#if defined LPC2103 || defined LPC1114 || defined LPC824	' ONLY 32k AVAILABLE - 512 'BLOCKS' OF 64 BYTES = $7FFF OF FLASH
	'Print "ONLY 32k AVAILABLE - 512 'BLOCKS' OF 64 BYTES = $7FFF OF FLASH"
	DEBUG(Print "THIS COVERS THE Entire 32k ($1ff OF 64 BYTE 'BLOCKS')...")
	PRINT_CODE_BLOCK(0,$01FF)
#else			' >32k AVAILABLE OTHER TARGETS so grind through full 64K...
	DEBUG(Print "THIS COVERS THE FIRST 64k ($400 OF 64 BYTE 'BLOCKS')...")
	PRINT_CODE_BLOCK(0,$3FF)' SO THIS COVERS THE FIRST 64k ($400 OF 64 BYTE 'BLOCKS')...
#endif

#ifdef LPC2106	' THE LPC2106 HAS 128k with 8K BOOT BLOCK REMAPPED - so collect 64k-120k

	PRINT ":020000040001F9"			' WE NEED TO KEEP GOING FROM 64k TO 120k ON THE ARMEXPRESS ONLY
	PRINT_CODE_BLOCK($400,$077F)		' THE ARMEXPRESS HAS 120k, SO THIS COVERS THE NEXT 56k ($380 OF 64 BYTE 'BLOCKS')...
	
#endif
#if defined LPC1137 || defined LPC11U37	' THE 11U37 HAS 128k - so collect 64k-128k

	PRINT ":020000040001F9"			' WE NEED TO KEEP GOING FROM 64k TO 128k
	PRINT_CODE_BLOCK($400,$07FF)		' THIS COVERS THE NEXT 64k ($3FF OF 64 BYTE 'BLOCKS')...
	
#endif
#if defined LPC2138 || defined LPC54102	' THE THE 2138 & 54102 HAve 512k
										' the ARMweb (2138) as a 12k BOOT BLOCK REMAP - 64k TO 500k follow for that device
										' the 54102 has 512K, - 64K - 512K follow

'	64k-128k

	PRINT ":020000040001F9"			' WE NEED TO KEEP GOING FROM 64k TO 128k ON THE ARMWEB
	PRINT_CODE_BLOCK($400,$07FF)		' THIS COVERS THE NEXT 64k ($400 OF 64 BYTE 'BLOCKS')...

'	128k-192k

	PRINT ":020000040002F8"			' WE NEED TO KEEP GOING FROM 128k-192k ON THE ARMWEB
	PRINT_CODE_BLOCK($800,$0BFF)		' THIS COVERS THE NEXT 64k ($400 OF 64 BYTE 'BLOCKS')...
	
'	192k-256k

	PRINT ":020000040003F7"			' WE NEED TO KEEP GOING FROM 192k-256k ON THE ARMWEB
	PRINT_CODE_BLOCK($C00,$0FFF)		' THIS COVERS THE NEXT 64k ($400 OF 64 BYTE 'BLOCKS')...
	
'	256k-320k

	PRINT ":020000040004F6"			' WE NEED TO KEEP GOING FROM 256k-320k ON THE ARMWEB
	PRINT_CODE_BLOCK($1000,$13FF)	' THIS COVERS THE NEXT 64k ($400 OF 64 BYTE 'BLOCKS')...
	
'	320k-384k

	PRINT ":020000040005F5"			' WE NEED TO KEEP GOING FROM 320k-384k ON THE ARMWEB
	PRINT_CODE_BLOCK($1400,$17FF)	' THIS COVERS THE NEXT 64k ($400 OF 64 BYTE 'BLOCKS')...
	
'	384k-448k

	PRINT ":020000040006F4"			' WE NEED TO KEEP GOING FROM 384k-448k ON THE ARMWEB
	PRINT_CODE_BLOCK($1800,$1BFF)	' THIS COVERS THE NEXT 64k ($400 OF 64 BYTE 'BLOCKS')...

#ifdef LPC2138	' THE ARMWEB HAS 512k - 12k BOOT BLOCK REMAP - 448k TO 500k FOLLOWS

	
'	448k-500k

	PRINT ":020000040007F3"			' WE NEED TO KEEP GOING FROM 448k-500k ON THE ARMWEB
	DEBUG(Print "THIS COVERS THE last 52k (not 64K) ($340 OF 64 BYTE 'BLOCKS')...")
	PRINT_CODE_BLOCK($1C00,$1F3F)	' THE ARMWEB HAS 500k, SO THIS COVERS THE LAST 52k ($340 OF 64 BYTE 'BLOCKS')...
	
#elif defined LPC54102  ' THE 54102 HAS 512k - 448k TO 512k FOLLOWS

'	448k-512k

	PRINT ":020000040007F3"			' WE NEED TO KEEP GOING FROM 448k-500k ON THE ARMWEB
	PRINT_CODE_BLOCK($1C00,$1FFF)	' THIS COVERS THE last 64k ($400 OF 64 BYTE 'BLOCKS')...
	
#endif
#endif

	PRINT ":00000001FF"		' THE HEX FILE HAS THE SAME STOP SEQUENCE FOR ALL TARGETS
	PRINT ""				' AND, WE ARE DONE...

ENDSUB

MAIN:	' GENERATE_INTEL_HEX

	Print "Target_ID:", "_tgtid"
	Print "Target_Name:", "_tgtnm"
	Print "Target_Memsize:",  "_tgtmem"
	Print "Target_ScrPad:", "_tgtscr"
	print
	Print "You've three options here:"
	print "1) Select BT's console input field press enter to run."
	Print "2) If shite be borked, press stop now, this helps to prevent bad code from making the device unrecoverable."
	Print "3) If on a manual device (i.e. 824, etc.), once you press stop, you've 5 seconds to do the Reset/OK thing, before the proggy continues."
	Print
	Print "_tgtid is waiting on user input>";
	debugin usrinput 
	print " ";usrinput
	print
	Print "Continuing in 5 seconds - you can clear the screen now, to aid in ease of copy/paste, once the code completes..."
	wait(5000)
	' Print "Clear the screen, click in the input field, and then press enter...:"
	' debugin usrinput 
	
	GENERATE_INTEL_HEX

END
