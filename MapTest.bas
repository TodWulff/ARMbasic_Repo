#define PEEK(addr) (*(addr)) ' the () ensure only addr is used in the address calculation
#define POKE(addr,value) *(addr) = value

' Constants are available globally. If code tries to alter a constant, an error message 
' will result upon code compilation. Only the first 32 characters of a constant name are used, 
' beyond that they are truncated.  $ and &H for Hex,  % for Binary, Include a decimal for
' Single Float Constants.  ARMbasic doesn't support double precision floats, only ieee 754 
' singles.  While decimal constants can be signed, hex and binary constants are always unsigned.
' Array constants can be 8 or 32 bit values and are stored in high memory along with constant 
' strings and do take up Flash space available on the ARM. Constant arrays can span more than
' one line, the compiler, it will keep reading lines until the final } is found.

' https://www.h-schmidt.net/FloatConverter/IEEE754.html
' Const PositiveZero 				as Single = $00000000
' Const SmallestPositiveSingle 	as single = $00000001 ' 1.4E-45      | 1.40129846432481707092372958328991613128026194187651577175706828388979108268586060148663818836212158203125E-45
' Const LargestPositiveSinglle 	as single = $7f7fffff ' 3.4028235E38 | 340282346638528859811704183484516925440
' Const PositiveInfinity 			as Single = $7f800000
' Const FirstPositiveNaN 			as Single = $7f800001
' Const LastPositiveNaN 			as single = $7fffffff
' Const NegativeZero 				as Single = $80000000
' Const SmallestNegativeSingle 	as single = $80000001 '-1.4E-45      | -1.40129846432481707092372958328991613128026194187651577175706828388979108268586060148663818836212158203125E-45
' Const LargestNegativeSinglle 	as single = $ff7fffff '-3.4028235E38 | -340282346638528859811704183484516925440
' Const NegativeInfinity 			as Single = $ff800000
' Const FirstNegativeNaN 			as Single = $FF800001
' Const LastNegativeNaN 			as single = $Ffffffff



CONST FirstConstInt = 1
CONST SecondConstInt = -2
CONST PIConstSingle = 3.14159265
Const SmallSingle = 3.14159e-12
const HexConstInt1 = $fffffffe
const HexConstInt2 = $f56C39A0
'const BinConstInt1 = %1111 0101 0110 1100 0011 1001 1010 0000
const BinConstInt2 = %11110101011011000011100110100000 ' $f56C39A0 -177456736
CONST SomeConstArray = {1,
						2.0,
						$0AFF, 
						&H1234}  '<-- fails with lower case h ($h1234) but &H1234 works
CONST OtherConstArray as single = {1,
						2.0,
						$0AFF,
						&H1234}  '<-- fails with lower case h ($h1234) but &H1234 works
const ConstByteArray as byte = {0,1,&H2,4,8,$10}

' Memory for simple variables is allocated from the start of a heap
' SINGLE use a single word of storage and are allocated from the start of the heap.
' (Signed) Integer range: -2147483648 to 2147483647
' Arrays of 8bit values can be declared AS BYTE. BYTE arrays are not limited to 255 characters.

Dim FirstVarInt as integer
dim SecondVarInt as integer
dim ThirdVarInt as integer
DIM a_symbolname (441) AS BYTE 
dim PIVarSingle as single

FirstVarInt += 1
SecondVarInt -=2
PIVarSingle = 3.14159265
ThirdVarInt = FirstVarInt * SecondVarInt

' strings or arrays are allocated from the top or end of the heap
' Strings are packed as bytes and always word aligned
' Strings may not exceed 255 characters

dim FirstString (2) as string
dim SecondString (17) as string
dim PiString (11) as string

FirstString = "12"
SecondString = "0123456789abcdef"
PiString = "3.14159265"

main:
dim PositiveZero 				as Single '= $00000000
dim SmallestPositiveSingle 		as single '= $00000001 ' 1.4E-45      | 1.40129846432481707092372958328991613128026194187651577175706828388979108268586060148663818836212158203125E-45
dim LargestPositiveSinglle 		as single '= $7f7fffff ' 3.4028235E38 | 340282346638528859811704183484516925440
dim PositiveInfinity 			as Single '= $7f800000
dim FirstPositiveNaN 			as Single '= $7f800001
dim LastPositiveNaN 			as single '= $7fffffff
dim NegativeZero 				as Single '= $80000000
dim SmallestNegativeSingle 		as single '= $80000001 '-1.4E-45      | -1.40129846432481707092372958328991613128026194187651577175706828388979108268586060148663818836212158203125E-45
dim LargestNegativeSinglle 		as single '= $ff7fffff '-3.4028235E38 | -340282346638528859811704183484516925440
dim NegativeInfinity 			as Single '= $ff800000
dim FirstNegativeNaN 			as Single '= $FF800001
dim LastNegativeNaN 			as single '= $Ffffffff

dim A(2) as integer
dim a0_ptr as integer
dim a1_ptr as integer

a0_ptr = addressof a
' a1_ptr = addressof a(1) doesn't work

Dim FirstVarInt_ptr as integer
dim SecondVarInt_ptr as integer
dim PIVarSingle_ptr as integer

FirstVarInt_ptr = addressof FirstVarInt
SecondVarInt_ptr = addressof SecondVarInt
PIVarSingle_ptr  = addressof PIVarSingle 

Print "FirstVarInt_ptr: ",FirstVarInt_ptr 
Print "SecondVarInt_ptr:",SecondVarInt_ptr
Print "PIVarSingle_ptr: ",PIVarSingle_ptr 
Print 
print "$";hex(addressof FirstVarInt)
print hex(addressof SecondVarInt)
print addressof PIVarSingle 
Print 
print FirstVarInt
print hex(*SecondVarInt)
print *(addressof PIVarSingle)
Print 
print ConstByteArray(0), "$";hex(addressof ConstByteArray)
print ConstByteArray(1), "$";hex(addressof ConstByteArray + 1<<2)
print ConstByteArray(2), "$";hex(addressof ConstByteArray + 2<<2)
print ConstByteArray(3), "$";hex(addressof ConstByteArray + 3<<2)
print ConstByteArray(4), "$";hex(addressof ConstByteArray + 4<<2)
print ConstByteArray(5), "$";hex(addressof ConstByteArray + 5<<2)
print
print hex(*$6ffe8)', *$1bffa4, *$1bffa8, *$1bffac, *$1bffb0, *$1bffb4
print

/* PositiveZero 			= (0 or $00000000)
SmallestPositiveSingle 	= (0 or $00000001) ' 1.4E-45      | 1.40129846432481707092372958328991613128026194187651577175706828388979108268586060148663818836212158203125E-45
LargestPositiveSinglle 	= (0 or $7f7fffff) ' 3.4028235E38 | 340282346638528859811704183484516925440
PositiveInfinity 		= (0 or $7f800000)
FirstPositiveNaN 		= (0 or $7f800001)
LastPositiveNaN 		= (0 or $7fffffff)
NegativeZero 			= (0 or $80000000)
SmallestNegativeSingle 	= (0 or $80000001) '-1.4E-45      | -1.40129846432481707092372958328991613128026194187651577175706828388979108268586060148663818836212158203125E-45
LargestNegativeSinglle 	= (0 or $ff7fffff) '-3.4028235E38 | -340282346638528859811704183484516925440
NegativeInfinity 		= (0 or $ff800000)
FirstNegativeNaN 		= (0 or $FF800001)
LastNegativeNaN 		= (0 or $Ffffffff)

print "PositiveZero 			",hex(*(addressof PositiveZero 		    )   )
print "SmallestPositiveSingle "  ,hex(*(addressof SmallestPositiveSingle  ) )
print "LargestPositiveSinglle "  ,hex(*(addressof LargestPositiveSinglle  ) )
print "PositiveInfinity 		",hex(*(addressof PositiveInfinity 	    )   )
print "FirstPositiveNaN 		",hex(*(addressof FirstPositiveNaN 	    )   )
print "LastPositiveNaN 		  "  ,hex(*(addressof LastPositiveNaN 		)   )
print "NegativeZero 			",hex(*(addressof NegativeZero 		    )   )
print "SmallestNegativeSingle "  ,hex(*(addressof SmallestNegativeSingle  ) )
print "LargestNegativeSinglle "  ,hex(*(addressof LargestNegativeSinglle  ) )
print "NegativeInfinity 		",hex(*(addressof NegativeInfinity 	    )   )
print "FirstNegativeNaN 		",hex(*(addressof FirstNegativeNaN 	    )   )
print "LastNegativeNaN 		  "  ,hex(*(addressof LastNegativeNaN 		)   ) */

dim PositiveZero_adr as integer
dim SmallestPositiveSingle_adr as integer
dim LargestPositiveSinglle_adr as integer
dim PositiveInfinity_adr as integer
dim FirstPositiveNaN_adr as integer
dim LastPositiveNaN_adr as integer 
dim NegativeZero_adr as integer
dim SmallestNegativeSingle_adr as integer
dim LargestNegativeSinglle_adr as integer
dim NegativeInfinity_adr as integer
dim FirstNegativeNaN_adr as integer
dim LastNegativeNaN_adr as integer 

PositiveZero_adr = *(PositiveZero )
SmallestPositiveSingle_adr = *(SmallestPositiveSingle)
LargestPositiveSinglle_adr = *(LargestPositiveSinglle)
PositiveInfinity_adr = *(PositiveInfinity )
FirstPositiveNaN_adr = *(FirstPositiveNaN )
LastPositiveNaN_adr = *(LastPositiveNaN )
NegativeZero_adr = *(NegativeZero )
SmallestNegativeSingle_adr = *(SmallestNegativeSingle)
LargestNegativeSinglle_adr = *(LargestNegativeSinglle)
NegativeInfinity_adr = *(NegativeInfinity )
FirstNegativeNaN_adr = *(FirstNegativeNaN )
LastNegativeNaN_adr = *(LastNegativeNaN )

print
print "$"; hex(PositiveZero_adr 		  )
print "$"; hex(SmallestPositiveSingle_adr )
print "$"; hex(LargestPositiveSinglle_adr )
print "$"; hex(PositiveInfinity_adr       )
print "$"; hex(FirstPositiveNaN_adr       )
print "$"; hex(LastPositiveNaN_adr        )
print "$"; hex(NegativeZero_adr           )
print "$"; hex(SmallestNegativeSingle_adr )
print "$"; hex(LargestNegativeSinglle_adr )
print "$"; hex(NegativeInfinity_adr       )
print "$"; hex(FirstNegativeNaN_adr       )
print "$"; hex(LastNegativeNaN_adr        )
print

POKE(PositiveZero_adr 		   , $00000000)
POKE(SmallestPositiveSingle_adr, $00000001)
POKE(LargestPositiveSinglle_adr, $7f7fffff)
POKE(PositiveInfinity_adr      , $7f800000)
POKE(FirstPositiveNaN_adr      , $7f800001)
POKE(LastPositiveNaN_adr       , $7fffffff)
POKE(NegativeZero_adr          , $80000000)
POKE(SmallestNegativeSingle_adr, $80000001)
POKE(LargestNegativeSinglle_adr, $ff7fffff)
POKE(NegativeInfinity_adr      , $ff800000)
POKE(FirstNegativeNaN_adr      , $FF800001)
POKE(LastNegativeNaN_adr       , $Ffffffff)


print "PositiveZero 			";PositiveZero 					
print "SmallestPositiveSingle 	";SmallestPositiveSingle 	
print "LargestPositiveSinglle 	";LargestPositiveSinglle 	
print "PositiveInfinity 		";PositiveInfinity 				
print "FirstPositiveNaN 		";FirstPositiveNaN 				
print "LastPositiveNaN 			";LastPositiveNaN 			
print "NegativeZero 			";NegativeZero 					
print "SmallestNegativeSingle 	";SmallestNegativeSingle 	
print "LargestNegativeSinglle 	";LargestNegativeSinglle 	
print "NegativeInfinity 		";NegativeInfinity 				
print "FirstNegativeNaN 		";FirstNegativeNaN 				
print "LastNegativeNaN 			";LastNegativeNaN 			

print




print hex(SomeConstArray(0)), hex(SomeConstArray(1)), hex(SomeConstArray(2)), hex(SomeConstArray(3)) 

' __map__
end

