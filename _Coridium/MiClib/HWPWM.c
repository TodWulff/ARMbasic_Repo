
#include "coridium_pcb.h"

#if defined  LPC1751 || defined LPC1756 || defined LPC1768

void HWPWM (int cycle, int cnt, int *list) {
	//PCONP defaults PWM1 = 1
	//PCLK is half CCLK, approx 50 MHz

	int turnOn, val, prescale, divider,j;
	
	LPC_SC->PCONP |= 1<<6;				 // turn PWM on

	prescale = SystemCoreClock/(4)/1000000;  // coulde replace 4 with PCLKSEL bits
	divider = 0;

	// timer 0,1 are 32 bit,  but 2,3 are 16
	
	while (cycle > 0x10000) {
		cycle >>= 1;
		prescale <<= 1;
		divider++;
	}
	--prescale;						// counts to n-1


	LPC_PWM1->TCR = 0;   // Disable counter and PWM
	LPC_PWM1->PR  = prescale;							
	LPC_PWM1->TC  = 0;
	LPC_PWM1->MCR = 2;      // reset on match MR0
	LPC_PWM1->PCR = 0x7E00; // enable PWM outputs, single edge

	LPC_PWM1->MR0 = cycle;
	LPC_PWM1->TCR = 0x09;   // Enable counter and PWM

	j = 0;
	while (cnt--) {
		val = list[j++];
		
		if (val >= 0) {
			val >>= divider;
			turnOn = cycle - val;
			switch (j) {
			case 6:
	#ifdef LPC178x
	  #warning need IOCON setup in HWPWM -- LPC178x
	#else			
				LPC_PINCON->PINSEL4 |= 0x00000400;		//PC5
	#endif				
				LPC_PWM1->MR6 = turnOn;
				break;
			case 5:
	#ifdef LPC178x
	#else			
				LPC_PINCON->PINSEL4 |= 0x00000100;		//PC4
	#endif				
				LPC_PWM1->MR5 = turnOn;
				break;
			case 4:
	#ifdef LPC178x
	#else			
				LPC_PINCON->PINSEL4 |= 0x00000040;		//PC3
				
	#endif				
				LPC_PWM1->MR4 = turnOn;
				break;
			case 3:
	#ifdef LPC178x
	#else			
				LPC_PINCON->PINSEL4 |= 0x00000010;		//PC2
	#endif				
				LPC_PWM1->MR3 = turnOn;
				break;
			case 2:
	#ifdef LPC178x
	#else			
				LPC_PINCON->PINSEL4 |= 0x00000004;		//PC1
	#endif				
				LPC_PWM1->MR2 = turnOn;
				break;
			case 1:
	#ifdef LPC178x
	#else			
				LPC_PINCON->PINSEL4 |= 0x00000001;		//PC0
	#endif				
				LPC_PWM1->MR1 = turnOn;
				break;
			}
//	FIXME	-- is this turn off necessary ???			
		} else {
	#ifdef LPC178x
	  #warning need IOCON turnoff in HWPWM -- LPC178x
	#else			
			switch (j) {
			case 6:
				if((LPC_PINCON->PINSEL4 & 0x00000C00) == 0x00000400 )		//PC5
					LPC_PINCON->PINSEL4 &= ~0x00000C00;		
				break;
			case 5:
				if((LPC_PINCON->PINSEL4 & 0x00000300) == 0x00000100 )		//PC4
					LPC_PINCON->PINSEL4 &= ~0x00000300;		
				break;
			case 4:
				if((LPC_PINCON->PINSEL4 & 0x000000C0) == 0x00000040 )		//PC3
					LPC_PINCON->PINSEL4 &= ~0x000000C0;		
				break;
			case 3:
				if((LPC_PINCON->PINSEL4 & 0x00000030) == 0x00000010 )		//PC2
					LPC_PINCON->PINSEL4 &= ~0x00000030;		
				break;
			case 2:
				if((LPC_PINCON->PINSEL4 & 0x0000000C) == 0x00000004 )		//PC1
					LPC_PINCON->PINSEL4 &= ~0x0000000C;		
				break;
			case 1:
				if((LPC_PINCON->PINSEL4 & 0x00000003) == 0x00000001 )		//PC0
					LPC_PINCON->PINSEL4 &= ~0x00000003;		
				break;
			}
	#endif				
		}
	}
	

}


#else


#define TxTCR_COUNTER_ENABLE (1<<0)
#define TxTCR_COUNTER_RESET  (1<<1)
#define TxMCR_INT_ON_MR0     (1<<0)
#define TxMCR_RESET_ON_MR0   (1<<1)
#define VICVectCntl0_ENABLE (1<<5)
#define VIC_Channel_Timer0  4
#define VIC_Channel_Timer1  5

void HWPWM (int cycle, int cnt, int *list) {
		
	int turnOn, val, prescale, divider,j;
	
  #if  defined LPC1114
	prescale = 48000000;
  #else
	prescale = SystemCoreClock/((SCB_APBDIV&3) == 0? 4 : (SCB_APBDIV&3))/1000000;	// 15  as the peripherals run at 15 MHz
  #endif
  
	divider = 0;

	// timer 0,1 are 32 bit,  but 2,3 are 16
	
	while (cycle > 0x10000) {
		cycle >>= 1;
		prescale <<= 1;
		divider++;
	}
	--prescale;						// counts to n-1

		
	LPC_TIM2->PR  = prescale;							
	LPC_TIM2->TC  = 0;
	LPC_TIM2->TCR = TxTCR_COUNTER_ENABLE;          // Timer1 Enable
	 
	LPC_TIM2->MR[3] = cycle -1;
	LPC_TIM2->MCR = 0x400;		// rollover when count reaches MR3
	LPC_TIM2->TC  = 0;			// need to get into the proper range
  #if  defined LPC1114
	LPC_TIM2->PWMC = 0xF;
  #else
	PWM2CON = 0xF;
  #endif
	
	if (cnt > 2) {
		LPC_TIM3->PR  = prescale;							
		LPC_TIM3->TC  = 0;
		LPC_TIM3->TCR = TxTCR_COUNTER_ENABLE;          // Timer2 Enable
		 
		LPC_TIM3->MR[1] = cycle -1;
		LPC_TIM3->MCR = 0x10;		// rollover when count reaches MR1
		LPC_TIM3->TC  = 0;			// need to get into the proper range
  #if  defined LPC1114
		LPC_TIM3->PWMC = 0xF;
  #else
		PWM3CON = 0xF;
  #endif
	}

  #if  defined LPC1114
  #else
	if (cnt > 4) {
		LPC_TIM1->PR  = prescale;							
		LPC_TIM1->TC  = 0;
		LPC_TIM1->TCR = TxTCR_COUNTER_ENABLE;          // Timer3 Enable
		 
		LPC_TIM1->MR[0] = cycle -1;
		LPC_TIM1->MCR = 0x2;		// rollover when count reaches MR0
		LPC_TIM1->TC  = 0;			// need to get into the proper range
		PWM1CON = 0xF;
	}
  #endif
  
	j = 0;
	while (cnt--) {
		val = list[j++];
		
		if (val >= 0) {
			val >>= divider;
			turnOn = cycle - val;
			switch (j) {
			case 8:
  #if  defined LPC1114
  #else
				PCB_PINSEL1 |= 0x00000080;		//IO(11)
  #endif				
				LPC_TIM1->MR[2] = turnOn;
				break;
			case 7:
  #if  defined LPC1114
  #else
				PCB_PINSEL0 |= 0x08000000;		//IO(10)
  #endif				
				LPC_TIM1->MR[1] = turnOn;
				break;
			case 6:
  #if  defined LPC1114
  #else
				PCB_PINSEL0 |= 0x00008000;		//IO(9)
  #endif				
				LPC_TIM2->MR[0] = turnOn;
				break;
			case 5:
  #if  defined LPC1114
  #else
				PCB_PINSEL1 |= 0x00000200;		//IO(4)
  #endif				
				LPC_TIM1->MR[3] = turnOn;
				break;
			case 4:
  #if  defined LPC1114
				LPC_IOCON->PIO1_9 |= 0x00000001;			//	'P1.9
  #else
				PCB_PINSEL1 |= 0x00000800;		//IO(3)
  #endif				
				LPC_TIM3->MR[0] = turnOn;
				break;
			case 3:
  #if  defined LPC1114
			  	LPC_IOCON->SWCLK_PIO0_10 |= 0x00000003	// 'P0.10
  #else
				PCB_PINSEL1 |= 0x20000000;		//IO(2)
  #endif				
				LPC_TIM3->MR[3] = turnOn;
				break;
			case 2:
  #if  defined LPC1114
			  	LPC_IOCON->PIO0_9 |= 0x00000002;			//	'P0.9
  #else
				PCB_PINSEL0 |= 0x00020000;		//IO(1)
  #endif				
				LPC_TIM2->MR[1] = turnOn;
				break;
			case 1:
  #if  defined LPC1114
			  	LPC_IOCON->PIO0_8 |= 0x00000002;			//	'P0.8
  #else
				PCB_PINSEL0 |= 0x00080000;		//IO(0)
  #endif				
				LPC_TIM2->MR[2] = turnOn;
				break;
			}
//	FIXME	-- is this turn off necessary ???			
		} else {
  #if  defined LPC1114
	  // turn off not yet implimented
  #else	  
			switch (j) {
			case 8:
				if((PCB_PINSEL1 & 0x000000c0) == 0x00000080 )		//IO(11)
					PCB_PINSEL1 &= ~0x000000c0;		
				break;
			case 7:
				if((PCB_PINSEL0 & 0x0c000000) == 0x08000000 )		//IO(10)
					PCB_PINSEL0 &= ~0x0c000000;		
				break;
			case 6:
				if((PCB_PINSEL0 & 0x0000c000) == 0x00008000 )		//IO(9)
					PCB_PINSEL0 &= ~0x0000c000;		
				break;
			case 5:
				if((PCB_PINSEL1 & 0x00000300) == 0x00000200 )		//IO(4)
					PCB_PINSEL1 &= ~0x00000300;		
				break;
			case 4:
				if((PCB_PINSEL1 & 0x00000c00) == 0x00000800 )		//IO(3)
					PCB_PINSEL1 &= ~0x00000c00;		
				break;
			case 3:
				if((PCB_PINSEL1 & 0x30000000) == 0x20000000 )		//IO(2)
					PCB_PINSEL1 &= ~0x30000000;		
				break;
			case 2:
				if((PCB_PINSEL0 & 0x00030000) == 0x00020000 )		//IO(1)
					PCB_PINSEL0 &= ~0x00030000;		
				break;
			case 1:
				if((PCB_PINSEL0 & 0x000c0000) == 0x00080000 )		//IO(0)
					PCB_PINSEL0 &= ~0x000c0000;		
				break;
			}
  #endif				
		}
	}
}
#endif


