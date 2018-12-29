
' // /* ---- START ASM CODE BLOCK ---- */ // '
//    1              			.syntax unified
//    2              			.cpu cortex-m4
//    3              			.eabi_attribute 27, 3
//    4              			.eabi_attribute 28, 1
//    5              			.fpu fpv4-sp-d16
//    6              			.eabi_attribute 20, 1
//    7              			.eabi_attribute 21, 1
//    8              			.eabi_attribute 23, 3
//    9              			.eabi_attribute 24, 1
//   10              			.eabi_attribute 25, 1
//   11              			.eabi_attribute 26, 1
//   12              			.eabi_attribute 30, 4
//   13              			.eabi_attribute 18, 4
//   14              			.thumb
//   15              			.file	"Hello_world.c"
//__ASM__(0xF996F000)	'   16 0000 00F096F9 	 		 	bl main				
//   17              			breakpoint:				
__ASM__(0xF810F7FA)	'   18 0004 FAF710F8 	 		  	.word	0xf810f7fa    
__ASM__(0xE7FC)	'   19 0008 FCE7     	 				b	breakpoint		
//   20              			printf:					
__ASM__(0x46F1)	'   21 000a F146     	 				mov		r9,lr		
__ASM__(0xFDF0F7F9)	'   22 000c F9F7F0FD 	 		  	.word	0xfdf0f7f9    
__ASM__(0x4748)	'   23 0010 4847     	 				bx 		r9			
//   24              			sprintf:					
__ASM__(0x46F1)	'   25 0012 F146     	 				mov		r9,lr		
__ASM__(0xFDF6F7F9)	'   26 0014 F9F7F6FD 	 		  	.word	0xfdf6f7f9    
__ASM__(0x4748)	'   27 0018 4847     	 				bx 		r9			
//   28              			.thumb
//   29              			@.text
//   30              			@.align	1
//   31              			@.global	getc
//   32              			.thumb
//   33              			@.thumb_func
//   34              		getc:
//   35              			@ args = 0, pretend = 0, frame = 0
//   36              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x4A06)	'   37 001a 064A     	 		ldr	r2, .L2
__ASM__(0xB508)	'   38 001c 08B5     	 		push	{r3, lr}
__ASM__(0x13A9F242)	'   39 001e 42F2A913 	 		movw	r3, #8617
__ASM__(0x6013)	'   40 0022 1360     	 		str	r3, [r2, #0]
//   41              		@ 34 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB490)	'   42 0024 90B4     	 			push {r4,r7}
//   43              		@ 0 "" 2
//   44              		@ 35 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4604)	'   45 0026 0446     	 			mov	r4,r0	
//   46              		@ 0 "" 2
//   47              			.thumb
__ASM__(0x4798)	'   48 0028 9847     	 		blx	r3
//   49              		@ 37 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4638)	'   50 002a 3846     	 			mov	r0,r7	
//   51              		@ 0 "" 2
//   52              		@ 38 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC90)	'   53 002c 90BC     	 			pop	{r4,r7}
//   54              		@ 0 "" 2
//   55              		@ 39 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBD08)	'   56 002e 08BD     	 			pop	{r3,pc}	
//   57              		@ 0 "" 2
//   58              			.thumb
__ASM__(0x2000)	'   59 0030 0020     	 		movs	r0, #0
__ASM__(0xBD08)	'   60 0032 08BD     	 		pop	{r3, pc}
//   61              		.L3:
//   62              			@.align	2
//   63              		.L2:
__ASM__(0x02000254)	'   64 0034 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//   65              			@.align	1
//   66              			@.global	putc
//   67              			.thumb
//   68              			@.thumb_func
//   69              		putc:
//   70              			@ args = 0, pretend = 0, frame = 0
//   71              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x4A06)	'   72 0038 064A     	 		ldr	r2, .L5
__ASM__(0xB508)	'   73 003a 08B5     	 		push	{r3, lr}
__ASM__(0x13B5F242)	'   74 003c 42F2B513 	 		movw	r3, #8629
__ASM__(0x6013)	'   75 0040 1360     	 		str	r3, [r2, #0]
//   76              		@ 46 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB490)	'   77 0042 90B4     	 			push	{r4,r7}
//   78              		@ 0 "" 2
//   79              		@ 47 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4607)	'   80 0044 0746     	 			mov	r7, r0
//   81              		@ 0 "" 2
//   82              		@ 48 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x460C)	'   83 0046 0C46     	 			mov r4, r1
//   84              		@ 0 "" 2
//   85              			.thumb
__ASM__(0x4798)	'   86 0048 9847     	 		blx	r3
//   87              		@ 50 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4638)	'   88 004a 3846     	 			mov	r0,r7
//   89              		@ 0 "" 2
//   90              		@ 51 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC90)	'   91 004c 90BC     	 			pop	{r4,r7}
//   92              		@ 0 "" 2
//   93              		@ 52 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBD08)	'   94 004e 08BD     	 			pop	{r3,pc}
//   95              		@ 0 "" 2
//   96              			.thumb
__ASM__(0x2000)	'   97 0050 0020     	 		movs	r0, #0
__ASM__(0xBD08)	'   98 0052 08BD     	 		pop	{r3, pc}
//   99              		.L6:
//  100              			@.align	2
//  101              		.L5:
__ASM__(0x02000254)	'  102 0054 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  103              			@.align	1
//  104              			@.global	puts
//  105              			.thumb
//  106              			@.thumb_func
//  107              			puts:
//  108              			@ args = 0, pretend = 0, frame = 0
//  109              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0xB510)	'  110 0058 10B5     	 		push	{r4, lr}
__ASM__(0x4604)	'  111 005a 0446     	 		mov	r4, r0
__ASM__(0x2000)	'  112 005c 0020     	 		movs	r0, #0
__ASM__(0xE004)	'  113 005e 04E0     	 		b	.L8
//  114              		.L9:
__ASM__(0x4618)	'  115 0060 1846     	 		mov	r0, r3
__ASM__(0x2100)	'  116 0062 0021     	 		movs	r1, #0
__ASM__(0xFFE8F7FF)	'  117 0064 FFF7E8FF 	 		bl	putc
__ASM__(0xB2C0)	'  118 0068 C0B2     	 		uxtb	r0, r0
//  119              		.L8:
__ASM__(0x3B01F814)	'  120 006a 14F8013B 	 		ldrb	r3, [r4], #1	@ zero_extendqisi2
__ASM__(0x2B00)	'  121 006e 002B     	 		cmp	r3, #0
__ASM__(0xD1F6)	'  122 0070 F6D1     	 		bne	.L9
__ASM__(0xBD10)	'  123 0072 10BD     	 		pop	{r4, pc}
//  124              			@.align	1
//  125              			@.global	micros
//  126              			.thumb
//  127              			@.thumb_func
//  128              		micros:
//  129              			@ args = 0, pretend = 0, frame = 0
//  130              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x4A05)	'  131 0074 054A     	 		ldr	r2, .L11
__ASM__(0xB508)	'  132 0076 08B5     	 		push	{r3, lr}
__ASM__(0x6341F641)	'  133 0078 41F64163 	 		movw	r3, #7745
__ASM__(0x6013)	'  134 007c 1360     	 		str	r3, [r2, #0]
//  135              		@ 69 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB480)	'  136 007e 80B4     	 			push	{r7}
//  137              		@ 0 "" 2
//  138              			.thumb
__ASM__(0x4798)	'  139 0080 9847     	 		blx	r3
//  140              		@ 71 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4638)	'  141 0082 3846     	 			mov	r0,r7
//  142              		@ 0 "" 2
//  143              		@ 72 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC80)	'  144 0084 80BC     	 			pop	{r7}
//  145              		@ 0 "" 2
//  146              		@ 73 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBD08)	'  147 0086 08BD     	 			pop	{r3,pc}
//  148              		@ 0 "" 2
//  149              			.thumb
__ASM__(0x2000)	'  150 0088 0020     	 		movs	r0, #0
__ASM__(0xBD08)	'  151 008a 08BD     	 		pop	{r3, pc}
//  152              		.L12:
//  153              			@.align	2
//  154              		.L11:
__ASM__(0x02000254)	'  155 008c 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  156              			@.align	1
//  157              			@.global	waitmicro
//  158              			.thumb
//  159              			@.thumb_func
//  160              		waitmicro:
//  161              			@ args = 0, pretend = 0, frame = 0
//  162              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x4A04)	'  163 0090 044A     	 		ldr	r2, .L14
__ASM__(0xB508)	'  164 0092 08B5     	 		push	{r3, lr}
__ASM__(0x6361F641)	'  165 0094 41F66163 	 		movw	r3, #7777
__ASM__(0x6013)	'  166 0098 1360     	 		str	r3, [r2, #0]
//  167              		@ 80 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB480)	'  168 009a 80B4     	 			push	{r7}
//  169              		@ 0 "" 2
//  170              		@ 81 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4607)	'  171 009c 0746     	 			mov	r7,r0
//  172              		@ 0 "" 2
//  173              			.thumb
__ASM__(0x4798)	'  174 009e 9847     	 		blx	r3
//  175              		@ 83 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC80)	'  176 00a0 80BC     	 			pop	{r7}
//  177              		@ 0 "" 2
//  178              			.thumb
__ASM__(0xBD08)	'  179 00a2 08BD     	 		pop	{r3, pc}
//  180              		.L15:
//  181              			@.align	2
//  182              		.L14:
__ASM__(0x02000254)	'  183 00a4 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  184              			@.align	1
//  185              			@.global	wait
//  186              			.thumb
//  187              			@.thumb_func
//  188              		wait:
//  189              			@ args = 0, pretend = 0, frame = 0
//  190              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x4A04)	'  191 00a8 044A     	 		ldr	r2, .L17
__ASM__(0xB508)	'  192 00aa 08B5     	 		push	{r3, lr}
__ASM__(0x6367F641)	'  193 00ac 41F66763 	 		movw	r3, #7783
__ASM__(0x6013)	'  194 00b0 1360     	 		str	r3, [r2, #0]
//  195              		@ 89 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB480)	'  196 00b2 80B4     	 			push	{r7}
//  197              		@ 0 "" 2
//  198              		@ 90 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4607)	'  199 00b4 0746     	 			mov	r7,r0
//  200              		@ 0 "" 2
//  201              			.thumb
__ASM__(0x4798)	'  202 00b6 9847     	 		blx	r3
//  203              		@ 92 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC80)	'  204 00b8 80BC     	 			pop	{r7}
//  205              		@ 0 "" 2
//  206              			.thumb
__ASM__(0xBD08)	'  207 00ba 08BD     	 		pop	{r3, pc}
//  208              		.L18:
//  209              			@.align	2
//  210              		.L17:
__ASM__(0x02000254)	'  211 00bc 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  212              			@.align	1
//  213              			@.global	rdDIR
//  214              			.thumb
//  215              			@.thumb_func
//  216              		rdDIR:
//  217              			@ args = 0, pretend = 0, frame = 0
//  218              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x2018F8DF)	'  219 00c0 DFF81820 	 		ldr	r2, .L20
__ASM__(0xB508)	'  220 00c4 08B5     	 		push	{r3, lr}
__ASM__(0x1379F242)	'  221 00c6 42F27913 	 		movw	r3, #8569
__ASM__(0x6013)	'  222 00ca 1360     	 		str	r3, [r2, #0]
//  223              		@ 98 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB480)	'  224 00cc 80B4     	 			push	{r7}
//  225              		@ 0 "" 2
//  226              		@ 99 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4607)	'  227 00ce 0746     	 			mov	r7,r0
//  228              		@ 0 "" 2
//  229              			.thumb
__ASM__(0x4798)	'  230 00d0 9847     	 		blx	r3
//  231              		@ 101 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4638)	'  232 00d2 3846     	 			mov	r0,r7
//  233              		@ 0 "" 2
//  234              		@ 102 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC80)	'  235 00d4 80BC     	 			pop	{r7}
//  236              		@ 0 "" 2
//  237              		@ 103 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBD08)	'  238 00d6 08BD     	 			pop	{r3,pc}
//  239              		@ 0 "" 2
//  240              			.thumb
__ASM__(0x2000)	'  241 00d8 0020     	 		movs	r0, #0
__ASM__(0xBD08)	'  242 00da 08BD     	 		pop	{r3, pc}
//  243              		.L21:
//  244              	 		@.align	2
//  245              		.L20:
__ASM__(0x02000254)	'  246 00dc 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  247              			@.align	1
//  248              			@.global	wrDIR
//  249              			.thumb
//  250              			@.thumb_func
//  251              		wrDIR:
//  252              			@ args = 0, pretend = 0, frame = 0
//  253              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x2014F8DF)	'  254 00e0 DFF81420 	 		ldr	r2, .L23
__ASM__(0xB508)	'  255 00e4 08B5     	 		push	{r3, lr}
__ASM__(0x130BF242)	'  256 00e6 42F20B13 	 		movw	r3, #8459
__ASM__(0x6013)	'  257 00ea 1360     	 		str	r3, [r2, #0]
//  258              		@ 110 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB490)	'  259 00ec 90B4     	 			push	{r4,r7}
//  260              		@ 0 "" 2
//  261              		@ 111 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4604)	'  262 00ee 0446     	 			mov	r4,r0
//  263              		@ 0 "" 2
//  264              		@ 112 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x460F)	'  265 00f0 0F46     	 			mov	r7,r1
//  266              		@ 0 "" 2
//  267              			.thumb
__ASM__(0x4798)	'  268 00f2 9847     	 		blx	r3
//  269              		@ 114 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC90)	'  270 00f4 90BC     	 			pop	{r4,r7}
//  271              		@ 0 "" 2
//  272              			.thumb
__ASM__(0xBD08)	'  273 00f6 08BD     	 		pop	{r3, pc}
//  274              		.L24:
//  275              	 		@.align	2
//  276              		.L23:
__ASM__(0x02000254)	'  277 00f8 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  278              			@.align	1
//  279              			@.global	rdGPIO
//  280              			.thumb
//  281              			@.thumb_func
//  282              		rdGPIO:
//  283              			@ args = 0, pretend = 0, frame = 0
//  284              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x2018F8DF)	'  285 00fc DFF81820 	 		ldr	r2, .L26
__ASM__(0xB508)	'  286 0100 08B5     	 		push	{r3, lr}
__ASM__(0x1335F242)	'  287 0102 42F23513 	 		movw	r3, #8501
__ASM__(0x6013)	'  288 0106 1360     	 		str	r3, [r2, #0]
//  289              		@ 120 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB480)	'  290 0108 80B4     	 			push	{r7}
//  291              		@ 0 "" 2
//  292              		@ 121 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4607)	'  293 010a 0746     	 			mov	r7,r0
//  294              		@ 0 "" 2
//  295              			.thumb
__ASM__(0x4798)	'  296 010c 9847     	 		blx	r3
//  297              		@ 123 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4638)	'  298 010e 3846     	 			mov	r0,r7
//  299              		@ 0 "" 2
//  300              		@ 124 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC80)	'  301 0110 80BC     	 			pop	{r7}
//  302              		@ 0 "" 2
//  303              		@ 125 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBD08)	'  304 0112 08BD     	 			pop	{r3,pc}
//  305              		@ 0 "" 2
//  306              			.thumb
__ASM__(0x2000)	'  307 0114 0020     	 		movs	r0, #0
__ASM__(0xBD08)	'  308 0116 08BD     	 		pop	{r3, pc}
//  309              		.L27:
//  310              	 		@.align	2
//  311              		.L26:
__ASM__(0x02000254)	'  312 0118 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  313              			@.align	1
//  314              			@.global	wrGPIO
//  315              			.thumb
//  316              			@.thumb_func
//  317              		wrGPIO:
//  318              			@ args = 0, pretend = 0, frame = 0
//  319              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x2014F8DF)	'  320 011c DFF81420 	 		ldr	r2, .L29
__ASM__(0xB508)	'  321 0120 08B5     	 		push	{r3, lr}
__ASM__(0x1359F242)	'  322 0122 42F25913 	 		movw	r3, #8537
__ASM__(0x6013)	'  323 0126 1360     	 		str	r3, [r2, #0]
//  324              		@ 132 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB490)	'  325 0128 90B4     	 			push	{r4,r7}
//  326              		@ 0 "" 2
//  327              		@ 133 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4604)	'  328 012a 0446     	 			mov	r4,r0
//  329              		@ 0 "" 2
//  330              		@ 134 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x460F)	'  331 012c 0F46     	 			mov	r7,r1
//  332              		@ 0 "" 2
//  333              			.thumb
__ASM__(0x4798)	'  334 012e 9847     	 		blx	r3
//  335              		@ 136 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC90)	'  336 0130 90BC     	 			pop	{r4,r7}
//  337              		@ 0 "" 2
//  338              			.thumb
__ASM__(0xBD08)	'  339 0132 08BD     	 		pop	{r3, pc}
//  340              		.L30:
//  341              	 		@.align	2
//  342              		.L29:
__ASM__(0x02000254)	'  343 0134 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  344              			@.align	1
//  345              			@.global	intsw
//  346              			.thumb
//  347              			@.thumb_func
//  348              		intsw:
//  349              			@ args = 0, pretend = 0, frame = 0
//  350              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x2012F8DF)	'  351 0138 DFF81220 	 		ldr	r2, .L32
__ASM__(0xB508)	'  352 013c 08B5     	 		push	{r3, lr}
__ASM__(0x03A1F242)	'  353 013e 42F2A103 	 		movw	r3, #8353
__ASM__(0x6013)	'  354 0142 1360     	 		str	r3, [r2, #0]
//  355              		@ 142 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB480)	'  356 0144 80B4     	 			push	{r7}
//  357              		@ 0 "" 2
//  358              		@ 143 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4607)	'  359 0146 0746     	 			mov	r7,r0
//  360              		@ 0 "" 2
//  361              			.thumb
__ASM__(0x4798)	'  362 0148 9847     	 		blx	r3
//  363              		@ 145 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC80)	'  364 014a 80BC     	 			pop	{r7}
//  365              		@ 0 "" 2
//  366              			.thumb
__ASM__(0xBD08)	'  367 014c 08BD     	 		pop	{r3, pc}
//  368              		.L33:
//  369              			@.align	2
//  370              		.L32:
__ASM__(0x02000254)	'  371 014e 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  372              			@.align	1
//  373              			@.global	setbaud
//  374              			.thumb
//  375              			@.thumb_func
//  376              		setbaud:
//  377              			@ args = 0, pretend = 0, frame = 0
//  378              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x4A05)	'  379 0152 054A     	 		ldr	r2, .L35
__ASM__(0xB508)	'  380 0154 08B5     	 		push	{r3, lr}
__ASM__(0x13A1F242)	'  381 0156 42F2A113 	 		movw	r3, #8609
__ASM__(0x6013)	'  382 015a 1360     	 		str	r3, [r2, #0]
//  383              		@ 151 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB490)	'  384 015c 90B4     	 			push	{r4,r7}
//  385              		@ 0 "" 2
//  386              		@ 152 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4604)	'  387 015e 0446     	 			mov	r4,r0
//  388              		@ 0 "" 2
//  389              		@ 153 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x460F)	'  390 0160 0F46     	 			mov	r7,r1
//  391              		@ 0 "" 2
//  392              			.thumb
__ASM__(0x4798)	'  393 0162 9847     	 		blx	r3
//  394              		@ 155 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC90)	'  395 0164 90BC     	 			pop	{r4,r7}
//  396              		@ 0 "" 2
//  397              			.thumb
__ASM__(0xBD08)	'  398 0166 08BD     	 		pop	{r3, pc}
//  399              		.L36:
//  400              	 		@.align	2
//  401              		.L35:
__ASM__(0x02000254)	'  402 0168 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  403              			@.align	1
//  404              			@.global	settimer
//  405              			.thumb
//  406              			@.thumb_func
//  407              		settimer:
//  408              			@ args = 0, pretend = 0, frame = 0
//  409              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x2012F8DF)	'  410 016c DFF81220 	 		ldr	r2, .L38
__ASM__(0xB508)	'  411 0170 08B5     	 		push	{r3, lr}
__ASM__(0x634BF641)	'  412 0172 41F64B63 	 		movw	r3, #7755
__ASM__(0x6013)	'  413 0176 1360     	 		str	r3, [r2, #0]
//  414              		@ 162 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB480)	'  415 0178 80B4     	 			push	{r7}
//  416              		@ 0 "" 2
//  417              		@ 163 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4607)	'  418 017a 0746     	 			mov	r7,r0
//  419              		@ 0 "" 2
//  420              			.thumb
__ASM__(0x4798)	'  421 017c 9847     	 		blx	r3
//  422              		@ 165 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC80)	'  423 017e 80BC     	 			pop	{r7}
//  424              		@ 0 "" 2
//  425              			.thumb
__ASM__(0xBD08)	'  426 0180 08BD     	 		pop	{r3, pc}
//  427              		.L39:
//  428              			@.align	2
//  429              		.L38:
__ASM__(0x02000254)	'  430 0182 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  431              			@.align	1
//  432              			@.global	flash_write
//  433              			.thumb
//  434              			@.thumb_func
//  435              		flash_write:
//  436              			@ args = 0, pretend = 0, frame = 0
//  437              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0xB508)	'  438 0186 08B5     	 		push	{r3, lr}
//  439              		@ 170 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB490)	'  440 0188 90B4     	 			push {r4,r7}
//  441              		@ 0 "" 2
//  442              		@ 171 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x464C)	'  443 018a 4C46     	 			mov  r4,r9
//  444              		@ 0 "" 2
//  445              		@ 172 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB410)	'  446 018c 10B4     	 			push {r4}
//  447              		@ 0 "" 2
//  448              		@ 173 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4604)	'  449 018e 0446     	 			mov  r4,r0
//  450              		@ 0 "" 2
//  451              		@ 174 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4689)	'  452 0190 8946     	 			mov  r9,r1
//  453              		@ 0 "" 2
//  454              		@ 175 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4617)	'  455 0192 1746     	 			mov  r7,r2
//  456              		@ 0 "" 2
//  457              			.thumb
__ASM__(0x4A05)	'  458 0194 054A     	 		ldr	r2, .L41
__ASM__(0x03ABF242)	'  459 0196 42F2AB03 	 		movw	r3, #8363
__ASM__(0x6013)	'  460 019a 1360     	 		str	r3, [r2, #0]
__ASM__(0x4798)	'  461 019c 9847     	 		blx	r3
//  462              		@ 178 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4638)	'  463 019e 3846     	 			mov	r0,r7
//  464              		@ 0 "" 2
//  465              		@ 179 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC10)	'  466 01a0 10BC     	 			pop	{r4}
//  467              		@ 0 "" 2
//  468              		@ 180 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x46A1)	'  469 01a2 A146     	 			mov	r9,r4
//  470              		@ 0 "" 2
//  471              		@ 181 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC90)	'  472 01a4 90BC     	 			pop	{r4,r7}
//  473              		@ 0 "" 2
//  474              		@ 182 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBD08)	'  475 01a6 08BD     	 			pop	{r3,pc}
//  476              		@ 0 "" 2
//  477              			.thumb
__ASM__(0x2000)	'  478 01a8 0020     	 		movs	r0, #0
__ASM__(0xBD08)	'  479 01aa 08BD     	 		pop	{r3, pc}
//  480              		.L42:
//  481              	 		@.align	2
//  482              		.L41:
__ASM__(0x02000254)	'  483 01ac 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
//  484              			@.align	1
//  485              			@.global	adin
//  486              			.thumb
//  487              			@.thumb_func
//  488              		adin:
//  489              			@ args = 0, pretend = 0, frame = 0
//  490              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0x2018F8DF)	'  491 01b0 DFF81820 	 		ldr	r2, .L44
__ASM__(0xB508)	'  492 01b4 08B5     	 		push	{r3, lr}
__ASM__(0x3303F242)	'  493 01b6 42F20333 	 		movw	r3, #8963
__ASM__(0x6013)	'  494 01ba 1360     	 		str	r3, [r2, #0]
//  495              		@ 190 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xB480)	'  496 01bc 80B4     	 			push	{r7}
//  497              		@ 0 "" 2
//  498              		@ 191 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4607)	'  499 01be 0746     	 			mov	r7,r0
//  500              		@ 0 "" 2
//  501              			.thumb
__ASM__(0x4798)	'  502 01c0 9847     	 		blx	r3
//  503              		@ 193 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0x4638)	'  504 01c2 3846     	 			mov	r0,r7
//  505              		@ 0 "" 2
//  506              		@ 194 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBC80)	'  507 01c4 80BC     	 			pop	{r7}
//  508              		@ 0 "" 2
//  509              		@ 195 "C:/Users/TAJS/DOCUME~1/_Dev/include/ConBASICstartup.c" 1
__ASM__(0xBD08)	'  510 01c6 08BD     	 			pop	{r3,pc}
//  511              		@ 0 "" 2
//  512              			.thumb
__ASM__(0x2000)	'  513 01c8 0020     	 		movs	r0, #0
__ASM__(0xBD08)	'  514 01ca 08BD     	 		pop	{r3, pc}
//  515              		.L45:
//  516              	 		@.align	2
//  517              		.L44:
__ASM__(0x02000254)	'  518 01cc 54020002 	 		.word	0x02000254    @ BASICfunc - a manual tweak, see .comm below
__ASM__(0x6C6C6548)	'  519 01d0 48656C6C 			.word	0x6c6c6548
__ASM__(0x6F57206F)	'  520 01d4 6F20576F 			.word	0x6f57206f
__ASM__(0x2C646C72)	'  521 01d8 726C642C 			.word	0x2c646c72
__ASM__(0x776F4E20)	'  522 01dc 204E6F77 			.word	0x776f4e20
__ASM__(0x6F726420)	'  523 01e0 2064726F 			.word	0x6f726420
__ASM__(0x6E692070)	'  524 01e4 7020696E 			.word	0x6e692070
__ASM__(0x74206F74)	'  525 01e8 746F2074 			.word	0x74206f74
__ASM__(0x72206568)	'  526 01ec 68652072 			.word	0x72206568
__ASM__(0x69746E75)	'  527 01f0 756E7469 			.word	0x69746e75
__ASM__(0x6420656D)	'  528 01f4 6D652064 			.word	0x6420656d
__ASM__(0x67756265)	'  529 01f8 65627567 			.word	0x67756265
__ASM__(0x0D726567)	'  530 01fc 6765720D 			.word	0x0d726567
__ASM__(0x20000D0A)	'  531 0200 0A0D0020 			.word	0x20000d0a
__ASM__(0x70797420)	'  532 0204 20747970 			.word	0x70797420
__ASM__(0x68402065)	'  533 0208 65204068 			.word	0x68402065
__ASM__(0x6E2D7865)	'  534 020c 65782D6E 			.word	0x6e2d7865
__ASM__(0x65626D75)	'  535 0210 756D6265 			.word	0x65626d75
__ASM__(0x6F742072)	'  536 0214 7220746F 			.word	0x6f742072
__ASM__(0x73696420)	'  537 0218 20646973 			.word	0x73696420
__ASM__(0x79616C70)	'  538 021c 706C6179 			.word	0x79616c70
__ASM__(0x6D656D20)	'  539 0220 206D656D 			.word	0x6d656d20
__ASM__(0x2F79726F)	'  540 0224 6F72792F 			.word	0x2f79726f
__ASM__(0x69676572)	'  541 0228 72656769 			.word	0x69676572
__ASM__(0x72657473)	'  542 022c 73746572 			.word	0x72657473
__ASM__(0x20746120)	'  543 0230 20617420 			.word	0x20746120
__ASM__(0x2D786568)	'  544 0234 6865782D 			.word	0x2d786568
__ASM__(0x626D756E)	'  545 0238 6E756D62 			.word	0x626d756e
__ASM__(0x000D7265)	'  546 023c 65720D00 			.word	0x000d7265
__ASM__(0x79742020)	'  547 0240 20207479 			.word	0x79742020
__ASM__(0x40206570)	'  548 0244 70652040 			.word	0x40206570
__ASM__(0x2D786568)	'  549 0248 6865782D 			.word	0x2d786568
__ASM__(0x626D756E)	'  550 024c 6E756D62 			.word	0x626d756e
__ASM__(0x68207265)	'  551 0250 65722068 			.word	0x68207265
__ASM__(0x6E2D7865)	'  552 0254 65782D6E 			.word	0x6e2d7865
__ASM__(0x20326D75)	'  553 0258 756D3220 			.word	0x20326d75
__ASM__(0x64206F74)	'  554 025c 746F2064 			.word	0x64206f74
__ASM__(0x6C707369)	'  555 0260 6973706C 			.word	0x6c707369
__ASM__(0x6D207961)	'  556 0264 6179206D 			.word	0x6d207961
__ASM__(0x726F6D65)	'  557 0268 656D6F72 			.word	0x726f6d65
__ASM__(0x65722F79)	'  558 026c 792F7265 			.word	0x65722f79
__ASM__(0x74736967)	'  559 0270 67697374 			.word	0x74736967
__ASM__(0x61207265)	'  560 0274 65722061 			.word	0x61207265
__ASM__(0x65682074)	'  561 0278 74206865 			.word	0x65682074
__ASM__(0x756E2D78)	'  562 027c 782D6E75 			.word	0x756e2d78
__ASM__(0x7265626D)	'  563 0280 6D626572 			.word	0x7265626d
__ASM__(0x726F6620)	'  564 0284 20666F72 			.word	0x726f6620
__ASM__(0x78656820)	'  565 0288 20686578 			.word	0x78656820
__ASM__(0x6D756E5F)	'  566 028c 5F6E756D 			.word	0x6d756e5f
__ASM__(0x20726562)	'  567 0290 62657220 			.word	0x20726562
__ASM__(0x64726F77)	'  568 0294 776F7264 			.word	0x64726f77
__ASM__(0x20000D73)	'  569 0298 730D0020 			.word	0x20000d73
__ASM__(0x70797420)	'  570 029c 20747970 			.word	0x70797420
__ASM__(0x68212065)	'  571 02a0 65202168 			.word	0x68212065
__ASM__(0x6E2D7865)	'  572 02a4 65782D6E 			.word	0x6e2d7865
__ASM__(0x65626D75)	'  573 02a8 756D6265 			.word	0x65626d75
__ASM__(0x65682072)	'  574 02ac 72206865 			.word	0x65682072
__ASM__(0x756E2D78)	'  575 02b0 782D6E75 			.word	0x756e2d78
__ASM__(0x7420326D)	'  576 02b4 6D322074 			.word	0x7420326d
__ASM__(0x6863206F)	'  577 02b8 6F206368 			.word	0x6863206f
__ASM__(0x65676E61)	'  578 02bc 616E6765 			.word	0x65676e61
__ASM__(0x6D656D20)	'  579 02c0 206D656D 			.word	0x6d656d20
__ASM__(0x2079726F)	'  580 02c4 6F727920 			.word	0x2079726f
__ASM__(0x65682040)	'  581 02c8 40206865 			.word	0x65682040
__ASM__(0x756E2D78)	'  582 02cc 782D6E75 			.word	0x756e2d78
__ASM__(0x7265626D)	'  583 02d0 6D626572 			.word	0x7265626d
__ASM__(0x206F7420)	'  584 02d4 20746F20 			.word	0x206f7420
__ASM__(0x2D786568)	'  585 02d8 6865782D 			.word	0x2d786568
__ASM__(0x326D756E)	'  586 02dc 6E756D32 			.word	0x326d756e
__ASM__(0x2020000D)	'  587 02e0 0D002020 			.word	0x2020000d
__ASM__(0x65707974)	'  588 02e4 74797065 			.word	0x65707974
__ASM__(0x66205E20)	'  589 02e8 205E2066 			.word	0x66205e20
__ASM__(0x6320726F)	'  590 02ec 6F722063 			.word	0x6320726f
__ASM__(0x2065646F)	'  591 02f0 6F646520 			.word	0x2065646f
__ASM__(0x63206F74)	'  592 02f4 746F2063 			.word	0x63206f74
__ASM__(0x69746E6F)	'  593 02f8 6F6E7469 			.word	0x69746e6f
__ASM__(0x0D65756E)	'  594 02fc 6E75650D 			.word	0x0d65756e
__ASM__(0x0D000D0A)	'  595 0300 0A0D000D 			.word	0x0d000d0a
__ASM__(0x620A0D0A)	'  596 0304 0A0D0A62 			.word	0x620a0d0a
__ASM__(0x6B616572)	'  597 0308 7265616B 			.word	0x6b616572
__ASM__(0x6E696F70)	'  598 030c 706F696E 			.word	0x6e696f70
__ASM__(0x6F642074)	'  599 0310 7420646F 			.word	0x6f642074
__ASM__(0x6120656E)	'  600 0314 6E652061 			.word	0x6120656e
__ASM__(0x7720646E)	'  601 0318 6E642077 			.word	0x7720646e
__ASM__(0x65722765)	'  602 031c 65277265 			.word	0x65722765
__ASM__(0x6E6F6320)	'  603 0320 20636F6E 			.word	0x6e6f6320
__ASM__(0x756E6974)	'  604 0324 74696E75 			.word	0x756e6974
__ASM__(0x2E676E69)	'  605 0328 696E672E 			.word	0x2e676e69
__ASM__(0x000D2E2E)	'  606 032c 2E2E0D00 			.word	0x000d2e2e
//  607              			@.section	.text.startup,"ax",%progbits
//  608              			@.align	1
//  609              			@.global	main
//  610              			.thumb
//  611              			@.thumb_func
main: //  612              		main:
//  613              			@ args = 0, pretend = 0, frame = 0
//  614              			@ frame_needed = 0, uses_anonymous_args = 0
__ASM__(0xB508)	'  615 0330 08B5     	 		push	{r3, lr}
__ASM__(0x0030F8DF)	'  616 0332 DFF83000 	 		ldr	r0, .L47
__ASM__(0xFE8FF7FF)	'  617 0336 FFF78FFE 	 		bl	puts
__ASM__(0x002CF8DF)	'  618 033a DFF82C00 	 		ldr	r0, .L47+4
__ASM__(0xFE8BF7FF)	'  619 033e FFF78BFE 	 		bl	puts
__ASM__(0x480A)	'  620 0342 0A48     	 		ldr	r0, .L47+8
__ASM__(0xFE88F7FF)	'  621 0344 FFF788FE 	 		bl	puts
__ASM__(0x0024F8DF)	'  622 0348 DFF82400 	 		ldr	r0, .L47+12
__ASM__(0xFE84F7FF)	'  623 034c FFF784FE 	 		bl	puts
__ASM__(0x4808)	'  624 0350 0848     	 		ldr	r0, .L47+16
__ASM__(0xFE81F7FF)	'  625 0352 FFF781FE 	 		bl	puts
__ASM__(0xFE55F7FF)	'  626 0356 FFF755FE 	 		bl	breakpoint
__ASM__(0x4807)	'  627 035a 0748     	 		ldr	r0, .L47+20
__ASM__(0xFE7CF7FF)	'  628 035c FFF77CFE 	 		bl	puts
__ASM__(0x2000)	'  629 0360 0020     	 		movs	r0, #0
__ASM__(0xBD08)	'  630 0362 08BD     	 		pop	{r3, pc}
//  631              		.L48:
//  632              	 		@.align	2
//  633              		.L47:
__ASM32__(0x000081D0)	'  634 0364 D0810000 			.word	0x000081d0
__ASM32__(0x00008203)	'  635 0368 03820000 			.word	0x00008203
__ASM32__(0x00008240)	'  636 036c 40820000 			.word	0x00008240
__ASM32__(0x0000829B)	'  637 0370 9B820000 			.word	0x0000829b
__ASM32__(0x000082E2)	'  638 0374 E2820000 			.word	0x000082e2
__ASM32__(0x00008303)	'  639 0378 03830000 			.word	0x00008303
//  640              	
//  641              	
//  642              	
//  643              	
//  644              	
' // /* ---- END ASM CODE BLOCK ---- */ // '
end
