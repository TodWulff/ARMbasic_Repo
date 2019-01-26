
#ifndef STAMP_PINS
#define STAMP_PINS

' definition of pins for ARM stamp  -- maps stamp arrangement to NXP port pins

#ifdef LPC11U37

//#define PROTO -- uncomment this if you are using a prototype version -- 

#ifndef PROTO		// production version of the assignments

#define SP0		2
#define SP1		52
#define SP2		21
#define SP3		56
#define SP4		7
#define SP5		63
#define SP6		8
#define SP7		22

#define SP8		61
#define SP9		12
#define SP10	45
#define SP11	54
#define SP12	16
#define SP13	23
#define SP14	17
#define SP15	57

#define SP16	18		' alternate for SOUT
#define SP17	19		' alternate for SIN
#define SP18	1		' alternate for ATN -- should only be used as an output

#define SP19	3
#define SP20	20
#define SP21	58
#define SP22	59
#define SP23	4
#define SP24	5
#define SP25	55
#define SP26	6
#define SP27	60
#define SP28	53
#define SP29	9
#define SP30	10

#define SP31	11
#define SP32	13
#define SP33	14
#define SP34	46
#define SP35	15
#define SP36	47   
#define SP37	48
#define SP38	51

'#define SP39	0		' reset pin, must be enabled as GPIO by writing to register, and should only be an output if used


#else		// prototype pin definitions

#define SP0		58
#define SP1		4
#define SP2		21
#define SP3		56
#define SP4		7
#define SP5		63
#define SP6		8
#define SP7		10

#define SP8		61
#define SP9		12
#define SP10	45
#define SP11	54
#define SP12	16
#define SP13	23
#define SP14	17
#define SP15	57

#define SP16	18		' alternate for SOUT
#define SP17	19		' alternate for SIN
#define SP18	1		' alternate for ATN -- should only be used as an output

#define SP19	3
#define SP20	20
#define SP21	2
#define SP22	59
#define SP23	52
#define SP24	5
#define SP25	55
#define SP26	6
#define SP27	60
#define SP28	53
#define SP29	9
#define SP30	22

#define SP31	11
#define SP32	13
#define SP33	14
#define SP34	46
#define SP35	15
#define SP36	-1    ' on proto device this is a n.c
#define SP37	47
#define SP38	48
#define SP39	51

#endif


' defined as an array

CONST SPINS = {SP0, SP1, SP2, SP3, SP4, SP5, SP6, SP7,
               SP8, SP9, SP10, SP11, SP12, SP13, SP14, SP15,
			   SP16, SP17, SP18,
			   SP19, SP20, SP21, SP22, SP23, SP24, SP25, SP26, SP27, SP28, SP29, SP30,
			   SP31, SP32, SP33, SP34, SP35, SP36, SP37, SP38}

#else

#error -- Stamp form factor not supported on this chip

#endif			   

#endif			   
