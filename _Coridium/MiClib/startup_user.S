
#if !defined ( __CC_ARM   ) 
	
 #if	(defined LPC21xx) 			// ARM7
			.org	0x1FC
 #else
			.org	0x2FC
 #endif			
 #if 	(defined READ_PROTECT)		// patch the #define here or at compile time to read protect the code
		    DCD	0x87654321 		// 0x1FC/2FC  -- code protection flag
 #else			
			DCD 0
 #endif		    
	 
#endif
