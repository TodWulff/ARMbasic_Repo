/***********************************************************************
 * $Id: system_LPC43xx.c 8389 2011-10-19 13:53:14Z nxp28536 $
 *
 * Project: LPC43xx Common
 *
 * Description:
 *     CMSIS Cortex-M4 Device Peripheral Access Layer Source File
 *     for the NXP LPC43xx Device Series 
 *
 ***********************************************************************
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * products. This software is supplied "AS IS" without any warranties.
 * NXP Semiconductors assumes no responsibility or liability for the
 * use of the software, conveys no license or title under any patent,
 * copyright, or mask work right to the product. NXP Semiconductors
 * reserves the right to make changes in the software without
 * notification. NXP Semiconductors also make no representation or
 * warranty that such application will be suitable for the specified
 * use without further testing or modification.
 **********************************************************************/

#include <stdint.h>
#include "uart.h"



//#include "type.h"


uint32_t SystemCoreClock = 0; 



/**
 * Set PLL USB (PL550M)
 *
 * @param  enable
 * @return none
 *
 * @brief  	Setup the USB PLL to 480 MHz 
 *		   	If enable equals 0 then disable PLL
 *		   	Only clock sources IRC and XTAL are valid
 *			Mode1a only: Normal operating mode without post- and pre-divider				
 *			Fclkout = 2 * M * Fclkin
 *			msel+1 = feedback-divider value M 	(1 to 2^15)	
 */
void SetPLLUSB(void)
{
	// Setup PLL550 to generate 480MHz from 12 MHz crystal
	LPC_CGU->PLL0USB_CTRL |= PD_ENABLE; 	// Power down PLL
							//	P			N
	LPC_CGU->PLL0USB_NP_DIV = (98<<0) | (514<<12);
							//	SELP	SELI	SELR	MDEC	 
	LPC_CGU->PLL0USB_MDIV = (0xB<<17)|(0x10<<22)|(0<<28)|(0x7FFA<<0); 					
	LPC_CGU->PLL0USB_CTRL =(6<<24) | (0x3<<2) | CLKEN;  
		
	// Set the USB0 clock source to PLL550 (480MHz)
	LPC_CGU->BASE_USB0_CLK = (0<<0) | (1<<11) | (SRC_PL550M_0<<24);	
		
	while((LPC_CGU->PLL0USB_STAT&1) == 0x0);	// Wait for PLL lock 
}

/**
 * Initialize the system
 *
 * @param  none
 * @return none
 *
 * @brief  Setup the microcontroller system.
 *         
 */
 
 
#if defined CORE_M4

#define	LPC_CPACR	        0xE000ED88               

#define SCB_MVFR0           0xE000EF40
#define SCB_MVFR0_RESET     0x10110021

#define SCB_MVFR1           0xE000EF44
#define SCB_MVFR1_RESET     0x11000011

void fpu_init(void)
{
// from arm trm manual:
//                ; CPACR is located at address 0xE000ED88
//                LDR.W R0, =0xE000ED88
//                ; Read CPACR
//                LDR R1, [R0]
//                ; Set bits 20-23 to enable CP10 and CP11 coprocessors
//                ORR R1, R1, #(0xF << 20)
//                ; Write back the modified value to the CPACR
//                STR R1, [R0]

                
    volatile uint32_t* regCpacr = (uint32_t*) LPC_CPACR;
    volatile uint32_t* regMvfr0 = (uint32_t*) SCB_MVFR0;
    volatile uint32_t* regMvfr1 = (uint32_t*) SCB_MVFR1;
    volatile uint32_t Cpacr;
    volatile uint32_t Mvfr0;
    volatile uint32_t Mvfr1;    
    char vfpPresent = 0;

    Mvfr0 = *regMvfr0;
    Mvfr1 = *regMvfr1;

    vfpPresent = ((SCB_MVFR0_RESET == Mvfr0) && (SCB_MVFR1_RESET == Mvfr1));
    
    if(vfpPresent)
    {
        Cpacr = *regCpacr;
        Cpacr |= (0xF << 20);
        *regCpacr = Cpacr;   // enable CP10 and CP11 for full access
    }

}

#endif



/*----------------------------------------------------------------------------
  Clock Variable definitions
 *----------------------------------------------------------------------------*/

#define __IRC            (12000000UL)    /* IRC Oscillator frequency          */




/**
 * Initialize the system
 *
 * @param  none
 * @return none
 *
 * @brief  Setup the microcontroller system.
 *         Initialize the System.
 */
#if   (defined __CC_ARM)
#else
void * MEMCPY(void *dst0, void *src0, int len0);
void * MEMSET(void *m, char c, int n);
#endif
 
extern int g_var_seg;

#define M0APPMEMMAP	 0x40043404


#ifdef LPC4337

int whereAmI(void) {
	__ASM("	mov r0,pc");
	__ASM("	bx	lr");
	return 0;			// fake out the compiler
} 
#endif

#ifndef CORE_M0

void M0_init(void) {
	
  #ifdef FOR_BASIC

//	int i;
	
	LPC_RGU->RESET_CTRL1 = (1 << 24);		// reset the M0a

   #ifdef LPC4337    
   #else
		
	MEMCPY((void *)M0_CODE_RAM, (void *) M0_FIRMWARE, 0x00010000);		// this is where the M0 BASIC firmware is and user code
//	MEMCPY((void *)0x20000000, (void *) 0x10000000, 0x00008000);		// this is where the M0 BASIC firmware is

//	*(int *) M0_CODE_RAM = 0x10091fec;		// SP for M0
//	*(int *) 0x10083000 = 0xffffffff;		// "erase" BASIC program for M0 -- for now
	
	*(volatile uint32_t *) M0APPMEMMAP = M0_CODE_RAM;
   #endif	
  #endif	
}
	
void M0_start(void) {
  #ifdef FOR_BASIC
	if (((*(int *) (M0_USER_CODE)) & 0xF800F800) == 0xF800F000)
		LPC_RGU->RESET_CTRL1 = 0;		// start the M0a	
  #else
//  while(1);
  #endif
}


void M4_init(void) {		// this sets clocks, copies SPIFI to RAM fpu and goes
	int i;
	
    SystemCoreClock = __IRC;
        	
  
   #ifdef LPC4337    
		LPC_CREG->M4MEMMAP = whereAmI() & 0xffff0000;		// map the memory to 0
   #else		
  
	// where the heck are we?  if running in SPIFI Flash copy the image to SRAM a 0x10000000
	//void * MEMCPY(void *dst0, void *src0, int len0)

	if ((LPC_CREG->M4MEMMAP == 0x80000000) || (LPC_CREG->M4MEMMAP == 0x14000000) || (LPC_CREG->M4MEMMAP == 0x1A000000)) {	// run in either SPIFI or internal Flash 
		MEMCPY((void *)M4_CODE_RAM, (void *) LPC_CREG->M4MEMMAP, 0x0008000);				// copy the firmware area
	}
		
	LPC_CREG->M4MEMMAP = M4_CODE_RAM;		// and switch to running from that -- boy does this work? -- seems to
				
		// now we are running from SRAM -- speedy
   #endif
	
	// make all IOs GPIO inputs -- when possible
	
	for (i = 0x40086000; i <= 0x400860D0; i+=4) {		// port 0 1
		*(int *) i = 0xD0;			// function 0 normally input, disable pullup, glitch filter; enable input buffer
	}
	for (i = 0x40086108; i <= 0x40086118; i+=4) {		// port 2
		*(int *) i = 0xD4;			// function 4 normally input, disable pullup, glitch filter; enable input buffer
	}
	for (i = 0x4008611C; i <= 0x40086134; i+=4) {		// port 2
		*(int *) i = 0xD0;			// function 0 normally input, disable pullup, glitch filter; enable input buffer
	}
	*(int *) 0x40086120 = 0xD4;							// port 2_8 is an oddball
	*(int *) 0x40086184 = 0xD4;							// port 3_1 is an oddball
	*(int *) 0x40086188 = 0xD4;							// port 3_2 is an oddball
	// leave SPIFI pins alone P3_3-8
	for (i = 0x40086200; i <= 0x4008650C; i+=4) {
		*(int *) i = 0xD0;			// function 0 normally input, disable pullup, glitch filter; enable input buffer
	}
	*(int *) 0x40086220 = 0xD4;							// port 4_8 is an oddball
	*(int *) 0x40086224 = 0xD4;							// port 4_9 is an oddball
	*(int *) 0x40086228 = 0xD4;							// port 4_10 is an oddball
	*(int *) 0x4008631C = 0xD4;							// port 6_7 is an oddball
	*(int *) 0x40086320 = 0xD4;							// port 6_8 is an oddball
	*(int *) 0x40086490 = 0xD4;							// port 9_4 is an oddball
	*(int *) 0x40086494 = 0xD4;							// port 9_5 is an oddball
	for (i = 0x40086510; i <= 0x400867AC; i+=4) {
		*(int *) i = 0xD4;			// function 4 input, disable pullup, glitch filter; enable input buffer
	}

	#ifdef LPC4330
	fpu_init();
	#endif
	
	LPC_CGU->XTAL_OSC_CTRL = 0;			// enable crystal oscillator
	
	/* Set PL160M @ 12*50/3/2=100 MHz */
//	CGU_SetPLL1(9);
//	LPC_CGU->PLL1_CTRL |= (msel<<16) | (nsel<<12) | (psel<<8) |CGU_PLL1_DIRECT_MASK | CGU_PLL1_FBSEL_MASK;
	LPC_CGU->PLL1_CTRL = (6 << 24) | (49<<16) | (2<<12) | (1<<8) ;		// 12 * 50 / 3 / 2  = 100  -- crystal osc
	while ((LPC_CGU->PLL1_STAT & 1)== 0);		// wait for lock
	
	delay_ms(10);

//    SystemCoreClock = 200000000;		// while true the peripherals are running off 12 MHz

	/* Change the clock to 180 MHz */
	/* Set PL160M @ 12*50/3=180 MHz */
//	CGU_SetPLL1(15);
	LPC_CGU->PLL1_CTRL = (6 << 24) | (49<<16) | (2<<12) | (1<<8) | 0x80;		// switch to direct mode, ie. 2P = 1

	delay_ms(10);

	LPC_CGU->BASE_M4_CLK = (9<<24) | 0x800;		// run M4 from PLL at 200 MHz
	
  #ifdef FOR_BASIC	
	MEMCPY((void *)M4_USER_CODE, (void *) (M4_FIRMWARE+0x8000), 0x00010000);		// copy the User BASIC code, should be running fast now
  #endif	

return;
/////////////////////////////////////// SDcard setup

	LPC_SCU->SFSP1_3 = 0xd5;	
	LPC_SCU->SFSP1_4 = 0xd5;	
	LPC_SCU->SFSP1_5 = 0xd5;		// if you want to control it as an IO  -- = 0xd0;  then it is GPIO1->PIN (1<<8) -- ignor the P1_5 the EUguys were ???
	
	LPC_SCU->SFSCLK_0 = 0xd6;	
	
	LPC_CGU->BASE_SSP1_CLK = (9 << 24);		// 6 - 12 MHz(osc), or 9 for 200 MHz
	
	LPC_CCU1->CLK_M4_SSP1_CFG = 1;
	LPC_CCU2->CLK_APB2_SSP1_CFG = 1;	
}
#endif  


void SystemInit (void)
{

	systick_init();		// delays in M4 init and M0 init require this here -- potential IRQ on startup before M4 init -- 
						// --- could that be an issue ???

#if defined LPC4330
//	if ((SCB->CPUID & 0xf0) == 0x40) {
		M4_init();
//	#warning -- not starting M0 now
//		spifi_exit_memory_mode();
		M0_init();
		
//		while(1);	 
//	} else {
#elif defined LPC1850
		M4_init();		// really the M3
#else	
//	}
#endif  
	
}

int  checksumREGFILE63(void) {
	return (LPC_REGFILE->REGFILE[63]>>24)+(LPC_REGFILE->REGFILE[63]>>16)+(LPC_REGFILE->REGFILE[63]>>8)+(LPC_REGFILE->REGFILE[63]);
}

int  PORhappened(void) {	// power on reset

	if ((LPC_REGFILE->REGFILE[63] == 0xbe415555) || (LPC_REGFILE->REGFILE[63]== 0x41beAAAA)) {
		return 0;			// powerup must have set this before -- so no it was not a power on
	}
	
	if (checksumREGFILE63() & 1) {
		LPC_REGFILE->REGFILE[63] = 0xbe415555;
	} else {
		LPC_REGFILE->REGFILE[63] = 0x41beAAAA;
	}
	
	return 1;
	
#if 0		// this does not seem to be reliable -- user manual wrong
printf("\n%x %x\n", LPC_EVENTROUTER->STATUS, LPC_REGFILE->REGFILE[63]);

	if (LPC_EVENTROUTER->STATUS == 0x0379F77F) {			// it was a power on or reset pin
		LPC_EVENTROUTER->CLR_STAT = 0x0039ffff;				// clear reset, bod and dpdreset bits
		FaultHappened = 0;
		return 1;
	}
	
	return 0; 
#endif	
}



void IO2AD(int chan) {	// chan is the AD channel
	if (chan == 8) 		 { LPC_SCU->SFSP4_3 = 0x10; LPC_SCU->ENAIO0 |= (1<<1);}	// convert AD8/0 from P4.3
	else if (chan == 9)	 { LPC_SCU->SFSP4_1 = 0x10; LPC_SCU->ENAIO0 |= (1<<0);}	// convert AD9/1 from P4.1
	else if (chan == 11) { LPC_SCU->SFSP7_5 = 0x10; LPC_SCU->ENAIO0 |= (1<<4);}	// convert AD11/3 from P7.5
	else if (chan == 12) { LPC_SCU->SFSP7_4 = 0x10; LPC_SCU->ENAIO0 |= (1<<3);}	// convert AD12/4 from P7.4
	else if (chan == 14) { LPC_SCU->SFSP7_7 = 0x10; LPC_SCU->ENAIO1 |= (1<<6);}	// convert AD14/6 from P7.7
}





#ifdef NXP_TEST

/*****************************************************************************
 * Private functions
 ****************************************************************************/
 
#define MAX_CLOCK_FREQ (204000000)
 
#define PLL_MIN_CCO_FREQ 156000000  /**< Min CCO frequency of main PLL */
#define PLL_MAX_CCO_FREQ 320000000  /**< Max CCO frequency of main PLL */

#define CLKIN_CRYSTAL     6
#define CLKIN_MAINPLL     9

#define CLK_BASE_MX		 4


/**
 * @brief	PLL Parameter strucutre
 */
typedef struct {
	int ctrl;       /**< Control register value */
	int nsel;       /**< Pre-Div value */
	int psel;       /**< Post-Div Value */
	int msel;       /**< M-Div value */
	uint32_t fin;   /**< Input frequency */
	uint32_t fout;  /**< Output frequency */
	uint32_t fcco;  /**< CCO frequency */
} PLL_PARAM_T;


 uint32_t ABS(int val)
{
	if (val < 0)
		return -val;
	return val;
}

static void pll_calc_divs(uint32_t freq, PLL_PARAM_T *ppll)
{

	uint32_t prev = freq;
	int n, m, p;

	/* When direct mode is set FBSEL should be a don't care */
	if (ppll->ctrl & (1 << 7)) {
		ppll->ctrl &= ~(1 << 6);
	}
	for (n = 1; n <= 4; n++) {
		for (p = 0; p < 4; p ++) {
			for (m = 1; m <= 256; m++) {
				uint32_t fcco, fout;
				if (ppll->ctrl & (1 << 6)) {
					fcco = ((m << (p + 1)) * ppll->fin) / n;
				} else {
					fcco = (m * ppll->fin) / n;
				}
				if (fcco < PLL_MIN_CCO_FREQ) continue;
				if (fcco > PLL_MAX_CCO_FREQ) break;
				if (ppll->ctrl & (1 << 7)) {
					fout = fcco;
				} else {
					fout = fcco >> (p + 1);
				}

				if (ABS(freq - fout) < prev) {
					ppll->nsel = n;
					ppll->psel = p + 1;
					ppll->msel = m;
					ppll->fout = fout;
					ppll->fcco = fcco;
					prev = ABS(freq - fout);
				}
			}
		}
	}
}


static void pll_get_frac(uint32_t freq, PLL_PARAM_T *ppll)
{
	int diff[3];
//	PLL_PARAM_T pll[3] = {{0},{0},{0}};		// compiler pulls in memset here
	PLL_PARAM_T pll[3];  // = {{0},{0},{0}};		// compiler pulls in memset here
	pll[0].ctrl=0;      
	pll[1].ctrl=0;      
	pll[2].ctrl=0;      

	
	/* Try direct mode */
	pll[0].ctrl |= (1 << 7);
	pll[0].fin = ppll->fin;
	pll_calc_divs(freq, &pll[0]);
	if (pll[0].fout == freq) {
		*ppll = pll[0];
		return ;
	}
	diff[0] = ABS(freq - pll[0].fout);

	/* Try non-Integer mode */
	pll[2].ctrl &= ~(1 << 6);			// need to set FBSEL to 0
	pll[2].fin = ppll->fin;
	pll_calc_divs(freq, &pll[2]);
	if (pll[2].fout == freq) {
		*ppll = pll[2];
		return ;
	}
	diff[2] = ABS(freq - pll[2].fout);
	
	if (freq <= 110000000) {
		/* Try integer mode */
		pll[1].ctrl = (1 << 6);
		pll[1].fin = ppll->fin;
		pll_calc_divs(freq, &pll[1]);
		if (pll[1].fout == freq) {
			*ppll = pll[1];
			return ;
		}
	}
	diff[1] = ABS(freq - pll[1].fout);

	/* Find the min of 3 and return */
	if (diff[0] <= diff[1]) {
		if (diff[0] <= diff[2]) {
			*ppll = pll[0];
		} else {
			*ppll = pll[2];
		}
	} else {
		if (diff[1] <= diff[2]) {
			*ppll = pll[1];
		} else {
			*ppll = pll[2];
		}
	}
}

/* Test PLL input values for a specific frequency range */
static uint32_t Chip_Clock_TestMainPLLMultiplier(uint32_t InputHz, uint32_t TestMult, uint32_t MinHz, uint32_t MaxHz)
{
	uint32_t TestHz = TestMult * InputHz;

	if ((TestHz < MinHz) || (TestHz > MAX_CLOCK_FREQ) || (TestHz > MaxHz)) {
		TestHz = 0;
	}

	return TestHz;
}


/* Calculate the Main PLL div values */
int Chip_Clock_CalcMainPLLValue(uint32_t freq, PLL_PARAM_T *ppll)
{
	ppll->fin = 12000000;

	/* Do sanity check on frequency */
	if (freq > MAX_CLOCK_FREQ || freq < (PLL_MIN_CCO_FREQ / 16) || !ppll->fin) {
		return -1;
	}

	ppll->ctrl = 1 << 7; /* Enable direct mode [If possible] */
	ppll->nsel = 0;
	ppll->psel = 0;
	ppll->msel = freq / ppll->fin;

	if (freq < PLL_MIN_CCO_FREQ || ppll->msel * ppll->fin != freq) {
		pll_get_frac(freq, ppll);
		if (!ppll->nsel) {
			return -1;
		}
		ppll->nsel --;
	}

	if (ppll->msel == 0) {
		return - 1;
	}

	if (ppll->psel) {
		ppll->psel --;
	}

	ppll->msel --;

	return 0;
}



/*****************************************************************************
 * Public functions
 ****************************************************************************/
 int Chip_Clock_MainPLLLocked(void)
{
	/* Return true if locked */
	return (LPC_CGU->PLL1_STAT & 1) != 0;
}
 
 void Chip_Clock_DisableMainPLL(void)
{
	/* power down main PLL */
	LPC_CGU->PLL1_CTRL |= 1;
}

/**
 * @brief	Enbles the main PLL
 * @return	none
 * Make sure the main PLL is enabled.
 */
void Chip_Clock_EnableMainPLL(void)
{
	/* power up main PLL */
	LPC_CGU->PLL1_CTRL &= ~1;
}

 
 
 void Chip_Clock_SetupMainPLL(const PLL_PARAM_T *ppll)
{
	/* power up main PLL */
	LPC_CGU->PLL1_CTRL = ppll->ctrl | (6 << 24) | (ppll->msel << 16) | (ppll->nsel << 12) | (ppll->psel << 8);
}

/* Setup Chip Core clock */
void Chip_SetupCoreClock(int clkin, uint32_t core_freq, int setbase)
{
	int i;
	volatile uint32_t delay = 500;
	uint32_t direct = 0, pdivide = 0;
	PLL_PARAM_T ppll;

//	Chip_Clock_SetBaseClock(CLK_BASE_MX, CLKIN_CRYSTAL, 1, 0);
	LPC_CGU->BASE_M4_CLK = (CLKIN_CRYSTAL<<24) | 0x800;		// run M4 from crystal

	Chip_Clock_DisableMainPLL(); /* Disable PLL */

	/* Calculate the PLL Parameters */
	Chip_Clock_CalcMainPLLValue(core_freq, &ppll);

	if (core_freq > 110000000UL) {
		if (ppll.ctrl & (1 << 6)) {
//			while(1);									// to run in integer mode above 110 MHz, you need to use IDIV clock to boot strap CPU to that freq
		} else if (ppll.ctrl & (1 << 7)){
			direct = 1;
			ppll.ctrl &= ~(1 << 7);
		} else {
			pdivide = 1;
			ppll.psel++;
		}
	}

	/* Setup and start the PLL */
	Chip_Clock_SetupMainPLL(&ppll);

	/* Wait for the PLL to lock */
	while(!Chip_Clock_MainPLLLocked()) {}

	/* Set core clock base as PLL1 */
//	Chip_Clock_SetBaseClock(CLK_BASE_MX, CLKIN_MAINPLL, 1, 0);
	LPC_CGU->BASE_M4_CLK = (CLKIN_MAINPLL<<24) | 0x800;		// run M4 from PLL at 200 MHz

	while(delay --){} /* Wait for approx 50 uSec */
	if (direct) {
		delay = 1000;
		ppll.ctrl |= 1 << 7;
LPC_GPIO_PORT->SET[0] = 0x10;		//P1_0 wiggles for wait time		 -- that means GPIO0.4
		while(delay --){} /* Wait for approx 50 uSec */
LPC_GPIO_PORT->CLR[0] = 0x10;		//P1_0 wiggles for wait time
		Chip_Clock_SetupMainPLL(&ppll); /* Set DIRECT to operate at full frequency */
	} else if (pdivide) {
		delay = 1000;
		ppll.psel--;
LPC_GPIO_PORT->SET[0] = 0x10;		//P1_0 wiggles for wait time
		while(delay --){} /* Wait for approx 50 uSec */
LPC_GPIO_PORT->CLR[0] = 0x10;		//P1_0 wiggles for wait time
		Chip_Clock_SetupMainPLL(&ppll); /* Set PDIV to operate at full frequency */
	}

}

int PLLtest(void) {
	int freq,len;
	
	LPC_CGU->IDIVB_CTRL = (0x9<<24) | (9<<2) | 0;	// PLL1 divided by 10
	LPC_CGU->BASE_OUT_CLK = (0xD<<24) | 0;		// for CLKOUT -- IDIVB
	LPC_SCU->SFSP1_19 = 0xd4;					// CLKOUT to P1.19
	
	LPC_GPIO_PORT->DIR[0] |= 0x10;		//P1_0 wiggles for wait time
	
	printf("this is a test\n\n");
while(1){
	for (freq = 500; freq < 2040; freq += 1) {
		len = 10000000; while (len--);
		Chip_SetupCoreClock(CLKIN_CRYSTAL, freq * 100000, 0);
		
// insert breaks into the next to spot check frequencies, the sweep sees the div by 2 too much		
		if (LPC_CGU->PLL1_CTRL & (1<<7)) {printf(".");}						// direct
		else if (LPC_CGU->PLL1_CTRL & (3<<8) == 0) {printf("-"); /*break;*/}// post divide by 1 -- never happens
		else if (LPC_CGU->PLL1_CTRL & (1<<6)) {printf("I"); /*break;*/}		// integer 
		else {printf("n"); /*break;*/}										// non-integer
		if ((freq & 0x7F) == 0) printf("freq is %d.%d MHz\n",freq/10,freq%10);
	}
	printf("freq is %d.%d MHz\n",freq/10,freq%10);
}	
	printf("Bruce's debugger start\n");
	breakpoint();
}

#endif
