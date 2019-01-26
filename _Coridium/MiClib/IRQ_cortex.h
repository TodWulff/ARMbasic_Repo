#ifndef GCC_ASM_STEP
#ifndef CORTEX_ISR_H
#define CORTEX_ISR_H

extern char FaultHappened;			// set this in the fault interrupt

void disableIRQ(void);
void enableIRQ(void);

#ifdef USE_WD_INT
//NOT YET void WDT_ISR(void);
#endif


#endif
#endif	// GCC_ASM_STEP
