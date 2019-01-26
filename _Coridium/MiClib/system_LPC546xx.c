/******************************************************************************
 * @file     system_LPC546xx.c
 * @purpose  CMSIS Cortex-M5 Device Peripheral Access Layer Source File
 *           for the NXP LPC546xx Device Series
 * @version  V1.10
 * @date     24. November 2016
 *
 * @note
 * Copyright (C) 2009-2010 ARM Limited. All rights reserved.
 *
 * @par
 * ARM Limited (ARM) is supplying this software for use with Cortex-M 
 * processor based microcontrollers.  This file can be freely distributed 
 * within development tools that are supporting such ARM based processors. 
 *
 * @par
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 ******************************************************************************/


#include <stdint.h>
#include "LPC546xx.h"
#include "uart_lpc546xx.h"
#include "system_LPC546xx.h"

int sector_erased;

uint32_t SystemCoreClock = 96000000;//__SYSTEM_CLOCK;/*!< System Clock Frequency (Core Clock)*/

void fpu_init(void);

//// LPC_TIMER0 interrupt for testing
//void CT32B0_IRQHandler(void)
//{
//	if ( LPC_TIMER0->IR & (1<<1) ) {
//		LPC_TIMER0->IR &= (1<<1); // Clear interrupt channel 1
//		LPC_GPIO->NOT[0] = 1 << 4;
//	}
//}



/**
 * Initialize the system
 *
 * @param  none
 * @return none
 *
 * @brief  Setup the microcontroller system.
 *         Initialize the System.
 */

void SystemInit (void) {
	fpu_init();

	// Enable All SRAMs 
	LPC_SYSCON->PDRUNCFGCLR[0] = SYSCON_PDRUNCFG_PD_SRAM0 | SYSCON_PDRUNCFG_PD_SRAM1;// | SYSCON_PDRUNCFG_PD_USB_RAM;

	LPC_SYSCON->AHBCLKCTRLSET[0] = 1 << 13; // Enable the clock for the IOCON block

	// What Bridge Is This? MAR
	//ConfigureBridgeSSEL();

	LPC_SYSCON->AHBCLKCTRLSET[0] = 1 << 4; // Enables the clock for SRAM2.

	// Use 12MHz FRO as the default base clock 
	LPC_SYSCON->MAINCLKSELA = 0; // 12MHz FRO
	#warning check MAINCLKSELA also set to 3 below
	LPC_SYSCON->MAINCLKSELB = 0; // main clock A


	// Set Flash wait states,  4 = SYSCON_FLASH_5CYCLE
	LPC_SYSCON->FLASHCFG = (LPC_SYSCON->FLASHCFG & ~(0xF << 12)) | (4 << 12);

	LPC_SYSCON->ASYNCAPBCTRL = 0x01; // Chip_SYSCON_Enable_ASYNC_Syscon

	LPC_ASYNC_SYSCON->ASYNCAPBCLKSELA = 1; // SYSCON_ASYNC_FRO12MHZ

	LPC_SYSCON->FROCTRL = (LPC_SYSCON->FROCTRL & ~SYSCON_FROCTRL_MASK) | SYSCON_FROCTRL_WRTRIM | SYSCON_FROCTRL_HSPDCLK | SYSCON_FROCTRL_SEL96MHZ;

	LPC_SYSCON->MAINCLKSELA = 3; // 48MHz or 96-MHz HF-FRO
	LPC_SYSCON->MAINCLKSELB = 0; // main clock A

	LPC_SYSCON->CLKOUTSELA = 0; // Main system clock for CLKOUT
	LPC_SYSCON->CLKOUTDIV = 0;

	LPC_SYSCON->AHBCLKCTRLSET[2] = 1 << 7; // Enable the clock for the EMC interface.
	LPC_EMC->CONFIG = 0;
	LPC_EMC->CONTROL = 1;
	LPC_SYSCON->EMCCLKDIV = 1;

	// Init EMC Dynamic Controller 
	//TODO Chip_EMC_Dynamic_Init(LPC_EMC, &MT48LC8M16_config, Chip_Clock_GetEMCRate());

	SystemCoreClock = 96000000;

	// Initialize GPIO
	LPC_SYSCON->AHBCLKCTRLSET[0] = 1 << 11; // SYSCON_CLOCK_INPUTMUX
	LPC_SYSCON->AHBCLKCTRLSET[0] = 1 << 13; // SYSCON_CLOCK_IOCON
	LPC_SYSCON->AHBCLKCTRLSET[0] = 1 << 14; // GPIO0
	LPC_SYSCON->AHBCLKCTRLSET[0] = 1 << 15; // GPIO1
	LPC_SYSCON->AHBCLKCTRLSET[0] = 1 << 16; // GPIO2
	LPC_SYSCON->AHBCLKCTRLSET[0] = 1 << 17; // GPIO3
	LPC_SYSCON->AHBCLKCTRLSET[2] = 1 << 9;  // GPIO4
	LPC_SYSCON->AHBCLKCTRLSET[2] = 1 << 10; // GPIO5

	LPC_SYSCON->PRESETCTRLSET[0] = 1 << 14;
	LPC_SYSCON->PRESETCTRLSET[0] = 1 << 15;
	LPC_SYSCON->PRESETCTRLSET[0] = 1 << 16;
	LPC_SYSCON->PRESETCTRLSET[0] = 1 << 17;
	LPC_SYSCON->PRESETCTRLSET[2] = 1 << 9;
	LPC_SYSCON->PRESETCTRLSET[2] = 1 << 10;

	LPC_SYSCON->PRESETCTRLCLR[0] = 1 << 14;
	LPC_SYSCON->PRESETCTRLCLR[0] = 1 << 15;
	LPC_SYSCON->PRESETCTRLCLR[0] = 1 << 16;
	LPC_SYSCON->PRESETCTRLCLR[0] = 1 << 17;
	LPC_SYSCON->PRESETCTRLCLR[2] = 1 << 9;
	LPC_SYSCON->PRESETCTRLCLR[2] = 1 << 10;

	//// ClkOut, 960 KHz, P1_27 at J1.3
	//LPC_SYSCON->CLKOUTSELA = 0;//(uint32_t) src & 0x07;
	//LPC_SYSCON->CLKOUTDIV = 100-1;//(div - 1);
	//LPC_IOCON->PIO[1][27] = IOCON_MODE_PULLUP | IOCON_FUNC4 | IOCON_DIGITAL_EN | IOCON_INPFILT_OFF;

	//LPC_GPIO->DIR[1] |= 1 << 27; // CLKOUT as wiggler 
	//LPC_GPIO->DIR[3] |= 1 << 14; // a pin on the edge, P3_14 at J5.18

	//LPC_GPIO->CLR[1] |= 1 << 27;
	//LPC_GPIO->CLR[3] |= 1 << 14;

	//// LPC_TIMER0 interrupt test, setup is all very sloppy but its how they did it, clean someday if it matters
	//LPC_GPIO->DIR[0] |= 1 << 4;		// turn port 0 pin 4  -- LED on sh
	//LPC_SYSCON->AHBCLKCTRLSET[1] = 1 << 26;
	//LPC_SYSCON->PRESETCTRLSET[1] = 1 << 26;
	//LPC_SYSCON->PRESETCTRLCLR[1] = 1 << 26;
	//LPC_TIMER0->PR = 0;
	//LPC_TIMER0->TCR = 0;
	//LPC_TIMER0->TC = 1;
	//LPC_TIMER0->TCR = 1<<1;
	//while (LPC_TIMER0->TC != 0) {}
	//LPC_TIMER0->TCR = 0;
	//LPC_TIMER0->MCR = (LPC_TIMER0->MCR & 0xFFF) | (1<<3); // Interrupt on MR1
	//LPC_TIMER0->MR[1] = 20000000;
	//LPC_TIMER0->MCR = (LPC_TIMER0->MCR & 0xFFF) | (1<<4); // Reset on MR1
	//LPC_TIMER0->TCR = (LPC_TIMER0->TCR & 3) | 1;
	//NVIC->ICPR[0] = (1 << 10); /* Clear pending interrupt */
	//NVIC->ISER[0] = (1 << 10);

#ifdef FOR_BASIC
	MEMCPY((void *)0x20000000, (void *)0x00000000, 72<<2);
	SCB->VTOR = 0x20000000; //assign new vector table in RAM, so interrupts can be patched by BASIC
#endif	
	
}


void IO2AD(int chan) {
	if(chan==0 )LPC_IOCON->PIO[0][10] = 0; else // PIO0_10 ADC_0 
	if(chan==1 )LPC_IOCON->PIO[0][11] = 0; else // PIO0_11 ADC_1 
	if(chan==2 )LPC_IOCON->PIO[0][12] = 0; else // PIO0_12 ADC_2 
	if(chan==3 )LPC_IOCON->PIO[0][15] = 0; else // PIO0_15 ADC_3 
	if(chan==4 )LPC_IOCON->PIO[0][16] = 0; else // PIO0_16 ADC_4 
	if(chan==5 )LPC_IOCON->PIO[0][31] = 0; else // PIO0_31 ADC_5 
	if(chan==6 )LPC_IOCON->PIO[1][0 ] = 0; else // PIO1_0  ADC_6 
	if(chan==7 )LPC_IOCON->PIO[2][0 ] = 0; else // PIO2_0  ADC_7 
	if(chan==8 )LPC_IOCON->PIO[2][1 ] = 0; else // PIO2_1  ADC_8 
	if(chan==9 )LPC_IOCON->PIO[3][21] = 0; else // PIO3_21 ADC_9 
	if(chan==10)LPC_IOCON->PIO[3][22] = 0; else // PIO3_22 ADC_10
	if(chan==11)LPC_IOCON->PIO[0][23] = 0;      // PIO0_23 ADC_11
}

 
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
