.syntax unified
isrStart:	mrs r0, psp					
	isb							
	ldr	r3, pxCurrentTCBConst	
	ldr	r2, [r3]				
	tst r14, #0x10				
	it eq						
	vstmdbeq r0!, {s16-s31}		
	stmdb r0!, {r4-r11, r14}	
	str r0, [r2]				
	stmdb sp!, {r3}				
	mov r0, #0 					
	msr basepri, r0				
	bl vTaskSwitchContext		
	mov r0, #0 					
	msr basepri, r0				
	ldmia sp!, {r3}				
	ldr r1, [r3]				
	ldr r0, [r1]				
	ldmia r0!, {r4-r11, r14}	
	tst r14, #0x10				
	it eq						
	vldmiaeq r0!, {s16-s31}		
	msr psp, r0					
	isb							
	bx r14							
pxCurrentTCBConst:	.word pxCurrentTCB	
