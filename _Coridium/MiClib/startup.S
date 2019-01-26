
#if defined ( __CC_ARM   ) 
			
  #define STRINGEND	,0			
  #define LABEL(x)	x
  #define WEAK(x)	EXPORT x [WEAK]
  #define THUMBCODE 
  #define END		END
  	
#else 

  #define STRINGEND			
  #define DCB		.string
  #define DCW		.hword
  #define DCDU		.word
  #define DCD		.word
  #define EXPORT	.global
  #define ALIGN		.align
  #define LABEL(x)	x:
  #define SPACE(x)	.fill x

  #define WEAK(x)	.weak x
#if defined LPC2138 || defined LPC2103 || defined LPC2129 || defined LPC2106
  #define THUMBCODE 
#else  
  #define THUMBCODE .thumb_func			// has to preceed any ASM label for Cortex parts
#endif  
  #define END		.end
  
  
.section .startup, "ax"

.global	Reset_Handler
.global _startup
.func   _startup

		THUMBCODE
_startup:

#endif    
	
  
//# Exception Vectors
 
#if !(defined CC3200) //&& !(defined LPC54102)

//////////////////////////////////////////////////////////////////////////////
//
// the #define is done in the command line for gcc from MakeItC
//
//	handle the device specific stuff here
//

#if (defined ARMweb) && (defined FOR_BASIC)
#warn -- move this to basic_pcb.h someday -- bte 2015

 #define MAX_VAR_COUNT   	1024 //fpr ARMweb -- move to -- #include "system_LPC21xx.h" does not compile
#endif

#if defined LPC2103 || defined LPC2106 || defined LPC2138 || defined LPC2119

 #include "startup_arm7tdmi.S"
 
#else

 #include "startup_cortex.S"

#endif
  

#if defined ( __CC_ARM   )
	#warning need the Keil equivalent for C initialization
	
#else
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	Cortex parts set stack with the initial vector, so nothing special to do here
// 
 

//ResetISR2:
	
		THUMBCODE
Reset_Handler:  

 #if (defined MK20DX128) || (defined MK20DX256)
 #else


   #if (defined LPC54102) && !(defined LPC54102m0)
        .set   cpu_ctrl,       0x40000300
        .set   coproc_boot,    0x40000304
        .set   coproc_stack,   0x40000308
        LDR    R0, =0xE000ED00
        LDR    R1, [R0]           // READ CPUID register
        LDR    R2,=0x410CC601     // CM0 R0p1 identifier
        EORS   R1,R1,R2           // XOR to see if we are C0
        LDR    R3, =cpu_ctrl      // get address of CPU_CTRL
        LDR    R1,[R3]            // read cpu_ctrl reg into R1
        BEQ.N  cm0_boot			  // if this is M0 go setup M0
		b      ResetISR2		  // else go on to reset handler
    cm0_boot:
        LDR    R0,=coproc_boot    // M0 boot address aka reset handler
        LDR    R0,[R0]            // get address to branch to
        LDR    R1,=coproc_stack   // pickup coprocesor stackpointer (from syscon CPSTACK)
        LDR    R1,[R1]            // get stack pointer
        MOV    SP,R1              // set stack pointer
        BX     R0                 // now go to reset handler
		// or would you just fall through?
ResetISR2:
  #endif // (defined LPC54102) && !(defined LPC54102m0)


	    // these need to setup their own stack pointer
	    #if ( (defined CORE_M0a) || (defined CORE_M0s) ) && !(defined LPC54102m0)
	    				movs	R0, #0
	    				ldr		R0, [R0]
	    				mov		SP, R0
	    #endif


	 				/* copy .data section (Copy from ROM to RAM) */
	                 ldr     R1, =_etext
	                 ldr     R2, =_data
	                 ldr     R3, =_edata
	 1:        		
	 //				cmp     R2, R3
	 // M0 Thumb doesn't do these
	 //              ldr   R0, [R1], #4
	 //              str   R0, [R2], #4
	                 ldr   R0, [R1]
	                 str   R0, [R2]
	                 adds	R1,#4
	                 adds	R2,#4
	 				cmp     R2, R3
	                 blo     1b
	                 

	 				/* Clear .bss section (Zero init)  */
	                 movs    R0, #0
	                 ldr     R1, =_bss_start
	   #if defined FOR_BASIC && !(defined SUPERweb)	// need to extend this for C -- so we can do a breakpoint                
	                 ldr     R2, =g_var_seg	// don't 0 out BASIC variable space, allows user to look at stuff after a STOP
	   #else                
	                 ldr     R2, =_bss_end
	   #endif
	                 
	 2:
	 //				cmp     R1, R2
	 // M0 Thumb doesn't do these -- LPC1114 for instance
	 //              str   	R0, [R1], #4
	                 str   	R0, [R1]
	                 adds	R1,	R1, #4
	 				cmp     R1, R2
	                 blo     2b
	                 
	   #if ((defined ARMweb) /* || (defined SUPERweb)*/) && (defined FOR_BASIC)
	                 movs    R0, #0
	                 ldr     R1, = g_var_seg + ((MAX_VAR_COUNT+64)<<2)	// don't 0 out BASIC variable space, allows user to look at stuff after a STOP
	                 ldr     R2, =_bss_end
	                 
	 3:
	 //				cmp     R1, R2
	 // M0 Thumb doesn't do these -- LPC1114 for instance
	 //              str   	R0, [R1], #4
	                 str   	R0, [R1]
	                 adds	R1,	R1, #4
	 				cmp     R1, R2
	                 blo     3b

	   #endif
 #endif // not (defined MK20DX128) || (defined MK20DX256)

#endif // defined ( __CC_ARM   )
                

				/* Enter the C code  */
				
 #if (__GNUC__ == 4) && (__GNUC_MINOR__ == 6)	//  && (__GNUC_PATCHLEVEL__ == 0)
 				.extern main_embedded
 
                bl      main_embedded	// need to confuse the linker
 #elif defined ( __CC_ARM   )              
                bl      _main_start
 #else                
                bl      main
 #endif               
 
				b		.		// if main ever returns sit here and pout     

#endif //#ifndef CC3200

#ifdef FOR_BASIC
#include "../BASIC/startup_user.S"		// this forces it to look in the include path rather than current directory
#else	
#include "startup_user.S"		// this forces it to look in the include path rather than current directory
#endif
	
#if defined ( __CC_ARM   ) 
#else	
.endfunc
#endif

	END
