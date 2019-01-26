
_vectors:       
				ldr     PC, Reset_Addr         
                ldr     PC, Undef_Addr
                ldr     PC, SWI_Addr
                ldr     PC, PAbt_Addr
                ldr     PC, DAbt_Addr
                nop							/* Reserved Vector (holds Philips ISP checksum) */
   #if (defined LPC2368)
                ldr     PC, [PC,#-0x120]	/* see page 71 of "Insiders Guide to the Philips ARM7-Based Microcontrollers" by Trevor Martin  */
   #else                
                ldr     PC, [PC,#-0xFF0]	/* see page 71 of "Insiders Guide to the Philips ARM7-Based Microcontrollers" by Trevor Martin  */
   #endif               
                ldr     PC, FIQ_Addr
                

.global FaultUSE		//UNDEF_Routine
.global SWI_ISR			//SWI_Routine
.global FaultMPU		//PAbt_Routine
.global FaultBUS		//DAbt_Routine
.global FIQ_ISR			//FIQ_Routine
                

Reset_Addr:     .word   ARM7startup			// Reset_Handler		/* defined in this module below  */
Undef_Addr:     .word   FaultUSE			// UNDEF_Routine		/* defined in IRQ_arm7tdmi.c  */
SWI_Addr:       .word   SWI_ISR				// SWI_Routine			/* defined in IRQ_arm7tdmi.c  */
PAbt_Addr:      .word   FaultMPU			// PAbt_Routine		prefetch abort /* defined in IRQ_arm7tdmi.c  */
DAbt_Addr:      .word   FaultBUS			// DAbt_Routine		data abort     /* defined in IRQ_arm7tdmi.c   */
FIQ_Addr:       .word   FIQ_ISR				// FIQ_Routine			/* defined in IRQ_arm7tdmi.c  */


			/* Stack Sizes */
				.set  UND_STACK_SIZE, 0x00000004		/* stack for "undefined instruction" interrupts is 4 bytes  */
				.set  ABT_STACK_SIZE, 0x00000004		/* stack for "abort" interrupts is 4 bytes                  */
				.set  FIQ_STACK_SIZE, 0x00000004		/* stack for "FIQ" interrupts  is 4 bytes         			*/
 	#if (defined ARMweb) 
				.set  IRQ_STACK_SIZE, 0X00000400		/* stack for "IRQ" normal interrupts is 4 bytes    			*/
 	#else
				.set  IRQ_STACK_SIZE, 0X00000100		/* stack for "IRQ" normal interrupts is 4 bytes    			*/
 	#endif
				.set  SVC_STACK_SIZE, 0x00000004		/* stack for "SVC" supervisor mode is 4 bytes  				*/



	/* Standard definitions of Mode bits and Interrupt (I & F) flags in PSRs (program status registers) */
				.set  MODE_USR, 0x10            		/* Normal User Mode 										*/
				.set  MODE_FIQ, 0x11            		/* FIQ Processing Fast Interrupts Mode 						*/
				.set  MODE_IRQ, 0x12            		/* IRQ Processing Standard Interrupts Mode 					*/
				.set  MODE_SVC, 0x13            		/* Supervisor Processing Software Interrupts Mode 			*/
				.set  MODE_ABT, 0x17            		/* Abort Processing memory Faults Mode 						*/
				.set  MODE_UND, 0x1B            		/* Undefined Processing Undefined Instructions Mode 		*/
				.set  MODE_SYS, 0x1F            		/* System Running Priviledged Operating System Tasks  Mode	*/
			
				.set  I_BIT, 0x80               		/* when I bit is set, IRQ is disabled (program status registers) */
				.set  F_BIT, 0x40               		/* when F bit is set, FIQ is disabled (program status registers) */

ARM7startup:				    			  
    			ldr   r0, =_stack_end
    			msr   CPSR_c, #MODE_UND|I_BIT|F_BIT 	/* Undefined Instruction Mode  */
    			mov   sp, r0
    			sub   r0, r0, #UND_STACK_SIZE
    			msr   CPSR_c, #MODE_ABT|I_BIT|F_BIT 	/* Abort Mode */
    			mov   sp, r0
    			sub   r0, r0, #ABT_STACK_SIZE
    			msr   CPSR_c, #MODE_FIQ|I_BIT|F_BIT 	/* FIQ Mode */
    			mov   sp, r0	
   				sub   r0, r0, #FIQ_STACK_SIZE
    			msr   CPSR_c, #MODE_IRQ|I_BIT|F_BIT 	/* IRQ Mode */
    			mov   sp, r0
    			sub   r0, r0, #IRQ_STACK_SIZE
    			msr   CPSR_c, #MODE_SVC|I_BIT|F_BIT 	/* Supervisor Mode */
    			mov   sp, r0
    			sub   r0, r0, #SVC_STACK_SIZE
    			msr   CPSR_c, #MODE_SYS|I_BIT|F_BIT 	/* User Mode */
    			mov   sp, r0

//    			b	  Reset_Handler		// falls thru


//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	ARM7tdmi have to setup stacks
//

