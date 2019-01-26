/**************************************************************************//**
 * $Id: lpc12xx_adc.c 5070 2010-09-29 05:56:16Z cnh20509 $
 *
 * @file     lpc12xx_adc.c
 * @brief    Contains all functions support for ADC firmware library on LPC12xx.
 * @version  1.0
 * @date     26. Sep. 2010
 * @author   NXP MCU Team
 *
 * @note
 * Copyright (C) 2010 NXP Semiconductors(NXP). All rights reserved.
 *
 * @par
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
 *
 * modified by Coridium Corp, 2011
 *
 ******************************************************************************/
 
/* Peripheral group --------------------------------------------------------- */
/** @addtogroup ADC
 * @{
 */

/* Includes ----------------------------------------------------------------- */
#ifdef __cplusplus
#include "CoridiumSketch.h"
#else
 #ifdef FOR_BASIC
  #include "basic_pcb.h"
 #else  
  #include "coridium_pcb.h"
 #endif
#include "adc.h"
#endif


/** @defgroup ADC_Private_Macros
  * @{
  */

/* bit offset */
#define BIT_PDRUNCFG_ADC            4
#if  defined LPC111x || defined LPC11U35 || defined LPC11U37
#define BIT_SYSAHBCLKCTRL_ADC       13
#else
#define BIT_SYSAHBCLKCTRL_ADC       14
#endif

#define BIT_ADCR_CLKDIV             8
#define BIT_ADCR_BURST              16
#define BIT_ADCR_PDN                21

/* CLKDIV bits mask in Reg. ADCR. */
#define CR_CLKDIV_MASK          ((uint32_t) 0x0000FF00)
/* START bits mask in Reg. ADCR. */
#define CR_START_MASK           ((uint32_t) 0x07000000)



/**
 * @}
 */

#if !(defined LPC54102) && !(defined FOR_BASIC)
 
/** @defgroup ADC_Private_Functions
 * @{
 */

/**
  * @brief  Enables or disables the Burst mode.
  *             
  * @param  NewState: new state of the burst mode.
  *         This parameter can be: ENABLE or DISABLE.
  * @retval None
  */
void ADC_BurstCmd (FunctionalState NewState)
{
    /* Check the parameters */
    CHECK_PARAM(PARAM_FUNCTIONALSTATE(NewState)); 
    
    if (NewState == ENABLE)
    {
        LPC_ADC->CR |= (1 << BIT_ADCR_BURST);   /* burst mode */
    }
    else
    {   
        LPC_ADC->CR &= ~(1 << BIT_ADCR_BURST);  /* software controlled */
    }
        
}

/**
  * @brief  Enables or disables the specified ADC channel.
  *
  * @param  ADC_CHANNEL: specifies ADC channle to be enabled or disabled. 
  *         This parameter can be one of the following values:
  *             @arg ADC_CHANNEL_0: ADC channel 0
  *             @arg ADC_CHANNEL_1: ADC channel 1
  *             @arg ADC_CHANNEL_2: ADC channel 2
  *             @arg ADC_CHANNEL_3: ADC channel 3
  *             @arg ADC_CHANNEL_4: ADC channel 4
  *             @arg ADC_CHANNEL_5: ADC channel 5
  *             @arg ADC_CHANNEL_6: ADC channel 6
  *             @arg ADC_CHANNEL_7: ADC channel 7              
  * @param  NewState: new state of the selected ADC channel.
  *         This parameter can be: ENABLE or DISABLE.
  * @retval None
  */
void ADC_ChannelCmd (uint32_t ADC_CHANNEL, FunctionalState NewState)
{
    /* Check the parameters */
    CHECK_PARAM(PARAM_ADC_CHANNEL(ADC_CHANNEL));
    CHECK_PARAM(PARAM_FUNCTIONALSTATE(NewState)); 
    
    if (NewState == ENABLE)
    {
        LPC_ADC->CR |= (1<<ADC_CHANNEL);
    }
    else
    {
        LPC_ADC->CR &= ~(1<<ADC_CHANNEL);
    }        
}

/**
  * @brief  Deinitializes the ADC peripheral.
  *
  * @param  None
  * @retval None    
  */
void ADC_DeInit(void)
{
    /* Put ADC on power down mode */
    LPC_ADC->CR &= ~ (1<<BIT_ADCR_PDN);
    
  #if defined LPC1751 || LPC1756 || LPC1768
	LPC_SC->PCONP &= ~(1 << 12);//disable power for AD
  #elif defined STM32F411 // I'm not sure if NUCLEO even needs to include adc.h, its done in system_xxx
	// TODO but why
  #elif defined LPC21xx
   #ifdef LPC2138
	PCB_PINSEL0 &= ~0x00000f00;	// disable AD6-7
	PCB_PINSEL1 &= ~0x3ffc0000;	// make AD0-5 the GPIOs
   #else
    PCB_PINSEL0 &= ~0x03f00000;
    PCB_PINSEL1 &= ~0x003ff000;
   #endif
  #elif defined LPC178x
#warning need to fix adc power down  LPC178x
	LPC_SC->PCONP &= ~(1 << 12);//disable power for AD
  #elif defined LPC407x
	LPC_SC->PCONP &= ~(1 << 12);//disable power for AD
  #else
#warning need to fix adc power down  
    /* Disable AHB clock to the ADC. */
    LPC_SYSCON->SYSAHBCLKCTRL &= ~(1<<BIT_SYSAHBCLKCTRL_ADC);  
    
    /* Enable Power down bit to the ADC block. */  
    LPC_SYSCON->PDRUNCFG |= 1<<BIT_PDRUNCFG_ADC; 
  #endif
}

/**
  * @brief  Specified the start conversion on a falling or rising edge.
  *
  * @param  ADC_EDGE: specifies the edge type. 
  *         This parameter can be one of the following values:
  *             @arg ADC_EDGE_RISING
  *             @arg ADC_EDGE_FALLING
  * @retval None
  */
void ADC_EdgeConfig(uint32_t ADC_EDGE)
{
    /* Check the parameters */
    CHECK_PARAM(PARAM_ADC_EDGE(ADC_EDGE));
      
    if (ADC_EDGE == ADC_EDGE_RISING)
        LPC_ADC->CR &= ADC_EDGE_RISING;
    else
        LPC_ADC->CR |= ADC_EDGE_FALLING;
}

/**
  * @brief  Get the specified ADC channel conversion result.
  *
  * @param  ADC_CHANNEL: specifies ADC channle value. 
  *         This parameter can be one of the following values:
  *             @arg ADC_CHANNEL_0: ADC channel 0
  *             @arg ADC_CHANNEL_1: ADC channel 1
  *             @arg ADC_CHANNEL_2: ADC channel 2
  *             @arg ADC_CHANNEL_3: ADC channel 3
  *             @arg ADC_CHANNEL_4: ADC channel 4
  *             @arg ADC_CHANNEL_5: ADC channel 5
  *             @arg ADC_CHANNEL_6: ADC channel 6
  *             @arg ADC_CHANNEL_7: ADC channel 7              
  * @retval ADC converstion result.
  */
uint32_t ADC_GetData (uint8_t ADC_CHANNEL)
{
    /* Check the parameters */
    CHECK_PARAM(PARAM_ADC_CHANNEL(ADC_CHANNEL));

    return ((LPC_ADC->DR[ADC_CHANNEL] >> 6) & 0x3FF);         
} 

/**
  * @brief  Checks whether the specified ADC flag is set or not.
  *
  * @param  ADC_CHANNEL: specifies ADC channle value. 
  *         This parameter can be one of the following values:
  *             @arg ADC_CHANNEL_0: ADC channel 0
  *             @arg ADC_CHANNEL_1: ADC channel 1
  *             @arg ADC_CHANNEL_2: ADC channel 2
  *             @arg ADC_CHANNEL_3: ADC channel 3
  *             @arg ADC_CHANNEL_4: ADC channel 4
  *             @arg ADC_CHANNEL_5: ADC channel 5
  *             @arg ADC_CHANNEL_6: ADC channel 6
  *             @arg ADC_CHANNEL_7: ADC channel 7   
  * @param  ADC_FLAG: specifies the ADC flag to check. 
  *         This parameter can be one of the following values:
  *             @arg ADC_FLAG_OVERRUN: Overrun bit in burst mode.
  *             @arg ADC_FLAG_DONE: Done bit.
  * @retval New State of specified ADC flag (SET or RESET).
  */
FlagStatus ADC_GetStatus(uint8_t ADC_CHANNEL, uint32_t ADC_FLAG)
{
    /* Check the parameters */
    CHECK_PARAM(PARAM_ADC_CHANNEL(ADC_CHANNEL));
    CHECK_PARAM(PARAM_ADC_FLAG(ADC_FLAG));
    
    return ( (uint32_t)(LPC_ADC->DR[ADC_CHANNEL] & ADC_FLAG) ? SET : RESET);    
}

/**
  * @brief  Specifies which ADC channels generate interrupt(s).
  *
  * @param  ADC_INT: specifies the interrupt source. 
  *         This parameter can be one of the following values:
  *             @arg ADC_INT_CHANNEL0
  *             @arg ADC_INT_CHANNEL1
  *             @arg ADC_INT_CHANNEL2
  *             @arg ADC_INT_CHANNEL3
  *             @arg ADC_INT_CHANNEL4
  *             @arg ADC_INT_CHANNEL5
  *             @arg ADC_INT_CHANNEL6
  *             @arg ADC_INT_CHANNEL7
  *             @arg ADC_INT_GLOBAL              
  * @retval None
  */
void ADC_IntConfig (uint16_t ADC_INT, FunctionalState NewState)
{
    /* Check the parameters */
    CHECK_PARAM(PARAM_ADC_INT(ADC_INT));
    CHECK_PARAM(PARAM_FUNCTIONALSTATE(NewState)); 
      
    if (NewState == ENABLE)            
        LPC_ADC->INTEN |= (1<<ADC_INT);
    else
        LPC_ADC->INTEN &= ~(1<<ADC_INT);
}

/**
  * @brief  Enables or disables the PowerDown mode.
  *             
  * @param  NewState: new state of the power down mode.
  *         This parameter can be: ENABLE or DISABLE.
  * @retval None
  */
void ADC_PowerDownCmd (FunctionalState NewState)
{
    /* Check the parameters */
    CHECK_PARAM(PARAM_FUNCTIONALSTATE(NewState)); 
    
    if (NewState == DISABLE)
    {
        LPC_ADC->CR |= (1 << BIT_ADCR_PDN);     /* Operational mode */
    }
    else
    {
        LPC_ADC->CR &= ~(1 << BIT_ADCR_PDN);    /* Power down mode */
    }        
}


#endif  // FOR_BASIC

/**
  * @brief  Initializes the ADC peripheral.
  *
  * @param  ADC_ClockRate: Specify the clock rate (in Hz) for A/D converter,
  *                         should be no more than 9000000Hz.
  * @retval None 
  *
  * Note: Due to the integer division, the actual ADC clock rate might be not
  * same with the value (ADC_ClockRate) use specified.
  *
  * Actural ADC conversion rate is ADC_ClockRate / 36.
  * ADC will be on operational mode after ADC_Init().
  */
void ADC_Init(int ADC_ClockRate)
{ 
    int  adc_pclk;
    int  clk_div;

    /* check the parameters */
    CHECK_PARAM (ADC_ClockRate <= ADC_CLOCKRATE_MAX);
        
    /* The ADC clock is derived from the system clock. */
    
  #if defined LPC1751 || LPC1756 || LPC1768
	LPC_SC->PCONP |= (1 << 12);//enable power for AD
  
    adc_pclk = SystemCoreClock / 
		((LPC_SC->PCLKSEL0>>24)&3)==0 ? 4 : (((LPC_SC->PCLKSEL0>>24)&3)==3 ? 8 : (LPC_SC->PCLKSEL0>>24)&3) ;	
  #elif defined STM32F411 // I'm not sure if NUCLEO even needs to include adc.h, its done in system_xxx
	// TODO
  #elif defined LPC407x	
	LPC_SC->PCONP |= (1 << 12);//enable power for AD
    adc_pclk = SystemCoreClock / (LPC_SC->PCLKSEL & 0xF);
  #elif defined LPC4330	 || defined LPC1850			
	LPC_CGU->BASE_APB3_CLK = (6<<24) + (1<<11);		// use 12 MHz oscillator
  	LPC_CCU1->CLK_APB3_BUS_CFG = 1;
  	LPC_CCU1->CLK_APB3_ADC0_CFG = 1;
//  	LPC_CCU1->CLK_APB3_ADC1_CFG = 1;			// useless in BASIC builting
    adc_pclk = 12000000;
  #elif defined LPC178x				
     #warning -- need ADC def for 177x 
  #elif defined LPC12xx			
    adc_pclk = SystemCoreClock / LPC_SYSCON->SYSAHBCLKDIV;
#warning -- need to turn on ADC and select pins for 12xx parts
  #elif defined LPC111x
    int  ahbdiv;
  	
    ahbdiv = LPC_SYSCON->SYSAHBCLKDIV;
    adc_pclk = SystemCoreClock / ahbdiv;		// get rid of unsigned integer divide call
    /* Disable Power down bit to the ADC block. */  
    LPC_SYSCON->PDRUNCFG &= ~(1<<BIT_PDRUNCFG_ADC);  
      
    /* Enable AHB clock to the ADC. */
    LPC_SYSCON->SYSAHBCLKCTRL |= (1<<BIT_SYSAHBCLKCTRL_ADC);
// these pins are now default IO inputs -- switched on call to AD    
//    LPC_IOCON->R_PIO0_11 = 0x02;	//AD0     
//    LPC_IOCON->R_PIO1_0  = 0x02;	//AD1     
//    LPC_IOCON->R_PIO1_1  = 0x02;	//AD2     
//    LPC_IOCON->R_PIO1_2  = 0x02;	//AD3     
//    LPC_IOCON->SWDIO_PIO1_3  = 0x02;	//AD4   	// if using SW debug need to comment this one out  
#warning -- reassigning SW debug IO to AD4
//    LPC_IOCON->PIO1_4    = 0x01;	//AD5     
//    LPC_IOCON->PIO1_10   = 0x01;	//AD6     
//    LPC_IOCON->PIO1_11   = 0x01;	//AD7     
  #elif defined LPC21xx
    adc_pclk = SystemCoreClock / 4;		// Coridium always runs 21xx at 1/4 PCLK rate
   #ifdef LPC2138
//	PCB_PINSEL0 |= 0x00000f00;	// enable AD6-7		-- leave these as GPIO
	PCB_PINSEL1  = (PCB_PINSEL1 & ~0x3ffc0000) |0x15540000;	// make AD0-5 the default
   #elif defined LPC2103 || defined UNO32		// default is IOs for speed -- convert to AD in AD read
   #else
    PCB_PINSEL0 |= 0x03f00000;
    PCB_PINSEL1 |= 0x003ff000;
   #endif

  #elif defined LPC824
	LPC_ADC->INTEN = 0;    // Disable ADC interrupts, not necessary
	LPC_SYSCON->PDRUNCFG &= ~(1 << 4);     // Power up ADC
	LPC_SYSCON->SYSAHBCLKCTRL |= (1 << 24);// Enable Periph Clock
	
	LPC_SWM->PINENABLE0 &= ~(1 << (13+2)); // AD2 on IO14
	LPC_SWM->PINENABLE0 &= ~(1 << (13+3)); // AD3 on IO23
	LPC_SWM->PINENABLE0 &= ~(1 << (13+9)); // AD9 on IO17
	LPC_SWM->PINENABLE0 &= ~(1 << (13+10));// AD10 on IO13

	LPC_ADC->CR = (1<<30) | 59; // Callibrate, 30MHz / (59+1) = .5MHz right?
	while(LPC_ADC->CR & (1<<30)){}

	#warning NOT actually using parameter ADC_CLOCKRATE_MAX
	adc_pclk = SystemCoreClock; // just to get rid of warning
// these pins are default IO inputs -- switched on call to AD    
//LPC_IOCON->PIO0_14 AD2
//LPC_IOCON->PIO0_23 AD3
//LPC_IOCON->PIO0_17 AD9
//LPC_IOCON->PIO0_13 AD10

  #elif defined LPC11U35 || defined LPC11U37
    int ahbdiv = LPC_SYSCON->SYSAHBCLKDIV;
    adc_pclk = SystemCoreClock / ahbdiv;		    // get rid of unsigned integer divide call
    LPC_SYSCON->PDRUNCFG &= ~(1<<BIT_PDRUNCFG_ADC); // Disable Power down bit to the ADC block.
    LPC_SYSCON->SYSAHBCLKCTRL |= (1<<BIT_SYSAHBCLKCTRL_ADC); // Enable AHB clock to the ADC.
	
  #elif defined LPC11U67 || defined LPC11U68
	LPC_SYSCON->PDRUNCFG &= ~(1<<4);        // Disable Power down bit to the ADC block.
 	LPC_SYSCON->SYSAHBCLKCTRL |= (1 << 13); // Enable AHB clock to the ADC.
	LPC_ADC->CTRL = 1<<30 | 0x5F;           // start calibration, clockdiv = 5F
	while (LPC_ADC->CTRL & (1<<30) );       // wait for Calibration Done
	LPC_ADC->CTRL = 0x5F;                   // set clockdiv = 5F

  #elif defined LPC54102 || defined LPC54618
	volatile int i;
	
	//ADC Init
	#if defined LPC54102
 	LPC_SYSCTL->PDRUNCFG &= ~(1<<10|1<<19|1<<23); // Disable Power down bit to the ADC block.
	#else
	LPC_SYSCTL->PDRUNCFG[0] &= ~(1<<10|1<<19|1<<9|1<<23); // Disable Power down bit to the ADC block.
	#endif
	#if defined LPC54102
	LPC_SYSCTL->SYSAHBCLKCTRLSET[0] = (1 << 27);  // Enable AHB clock to the ADC.
	#else
	LPC_SYSCTL->AHBCLKCTRLSET[0] = (1 << 27);  // Enable AHB clock to the ADC.
	#endif
	LPC_ADC->INTEN = 0;               // Disable ADC interrupts
	LPC_ADC->CTRL = (2<<9) | (5<<12); // Control - 10 bit resolution, sample time 7.5
	for(i=0;i<200;i++);               // wait 10us, 200 is 21us

	//ADC Calibration at 1 MHz
	LPC_ADC->STARTUP = 1; // ADC_STARTUP_ENABLE;
	for ( i = 0; i < 0x10; i++ ) {}
	LPC_ADC->CTRL = 0x545F;
	LPC_ADC->CALIBR = 1; // ADC_CALIB;
	i = 0xF0000;
	while ( (LPC_ADC->CALIBR & 1) && --i ) {}
	LPC_ADC->CTRL = 1 | (2<<9) | (5<<12); // clkdiv=2, 10 bit, sample time 7.5ctrl;

  #elif defined LPC4330 || defined LPC4337 || defined LPC1850             
  #elif defined LPC15xx             
  #elif defined LPC412x
  #else
    #error   Unknown CPU type in adc.h
  #endif  

#if ! (defined LPC54102 || defined LPC54618 || defined LPC11U67 || defined LPC11U68 )
    /* Clear register */
    LPC_ADC->CR = 0x0;
     
    /* Calculate clock divider. */
    clk_div = (adc_pclk / ADC_ClockRate); 
	
    /* Configure CLKDIV and put ADC in operational mode. */
//    LPC_ADC->CR = (((clk_div-1) << BIT_ADCR_CLKDIV) & CR_CLKDIV_MASK ) | (1<<BIT_ADCR_PDN);
	// need to round clk_div up, don't subtract 1
  #if defined LPC111x || defined LPC11U37  // -- no power down bit
    LPC_ADC->CR = (((clk_div) << BIT_ADCR_CLKDIV) & CR_CLKDIV_MASK );
  #elif defined LPC824
	LPC_ADC->CR = 0; // Max Clock Rate, 30MHz / (0+1) = 30MHz//  #elif defined LPC4330 || defined LPC4337             
// now way to use secondary analog inputs  on 4330
//    LPC_ADC0->CR = (((clk_div) << BIT_ADCR_CLKDIV) & CR_CLKDIV_MASK ) | (1<<BIT_ADCR_PDN);
//    LPC_ADC1->CR = (((clk_div) << BIT_ADCR_CLKDIV) & CR_CLKDIV_MASK ) | (1<<BIT_ADCR_PDN);
  
  #else
    LPC_ADC->CR = (((clk_div) << BIT_ADCR_CLKDIV) & CR_CLKDIV_MASK ) | (1<<BIT_ADCR_PDN);
  #endif

#endif // LPC54102 || LPC54618// || defined LPC11U67 || defined LPC11U68
}


/**
  * @brief  Start the ADC with sepecified mode.
  *
  * @param  ADC_START: specifies ADC start mode. 
  *         This parameter can be one of the following values:
  *             @arg ADC_START_CONTINUOUS: Continuous mode
  *             @arg ADC_START_NOW: Start conversion now
  *             @arg ADC_START_ON_CT16B0_CAP0: Start conversion when the edge selected by 
  *                                            bit 27 occurs on PIO0_2/SSEL/CT16B0_CAP0.
  *             @arg ADC_START_ON_CT32B0_CAP0: Start conversion when the edge selected by 
  *                                            bit 27 occurs on PIO1_5/DIR/CT32B0_CAP0.
  *             @arg ADC_START_ON_CT32B0_MAT0: Start conversion when the edge selected by 
  *                                            bit 27 occurs on CT32B0_MAT0.
  *             @arg ADC_START_ON_CT32B0_MAT1: Start conversion when the edge selected by 
  *                                            bit 27 occurs on CT32B0_MAT1.
  *             @arg ADC_START_ON_CT16B0_MAT0: Start conversion when the edge selected by 
  *                                            bit 27 occurs on CT16B0_MAT0.
  *             @arg ADC_START_ON_CT16B0_MAT1: Start conversion when the edge selected by                              
  *                                            bit 27 occurs on CT16B0_MAT1.              
  * @retval None
  */
#if ! (defined LPC54102 || defined LPC54618 || defined LPC11U67 || defined LPC11U68 )
void ADC_StartCmd (uint32_t ADC_START, uint32_t channels)
{
    LPC_ADC->CR &= ~(CR_START_MASK | 0xff);
    LPC_ADC->CR |= channels;        
    LPC_ADC->CR |= ADC_START;        
}
#endif

////////////////////////////////////////////////////////////////////
//
//  added AD and initAD for compatibility with earlier Coridium code
//

void initAD() {
	ADC_Init(ADC_CLOCKRATE_MAX);
}

int AD(int channel) {
  #if 0	//  defined LPC4330 || defined LPC4337 
    if (channel > 7) {
	    channel -= 8;
	    
	    LPC_ADC1->CR &= ~(CR_START_MASK | 0xff);
    	LPC_ADC1->CR |= (1<<channel);        
    	LPC_ADC1->CR |= ADC_START_NOW;        
	
		while ((LPC_ADC1->STAT & 0xff) == 0);	// wait for AD to finish
	
    	return (LPC_ADC1->DR[channel] & 0xFFFF);         	
    }
  #endif
  
  #if defined LPC824
	if( (channel!=2) && (channel!=3) && (channel!=9) && (channel!=10) )
		return 0;

	LPC_ADC->SEQA_CTRL = (1<<channel) | (1<<26) | (1<<31) | (1<<18); //channel | start | enable | trig_pol
	while( !(LPC_ADC->SEQA_GDAT & (1<<31) ) ){}  // takes 3 or 4 micros
	return (LPC_ADC->DR[channel] & 0xFFFF);

  #elif defined LPC54102 || defined LPC54618 || defined LPC11U67 || defined LPC11U68
	int i;

	LPC_ADC->SEQ_CTRL[0] = 0; // channel can only change when SEQA_ENA is 0
	LPC_ADC->SEQ_CTRL[0] = (1<<channel)| (1<<26) | (1<<30)| (1<<31); // channel | start | mode1 | enable //Chip_ADC_SetupSequencer(LPC_ADC, ADC_SEQA_IDX, (ADC_SEQ_CTRL_CHANSEL(BOARD_ADC_CH) | ADC_SEQ_CTRL_CHANSEL(BOARD_ADC_CH) | ADC_SEQ_CTRL_MODE_EOS));

	do { i = LPC_ADC->DAT[channel];
	} while( (i>>31) == 0 );

	return i & 0xFFF0; // using DAT[channel] didn't work ???

  #else
	
	ADC_StartCmd(ADC_START_NOW, 1 << channel);
	
	while ((LPC_ADC->STAT & 0xff) == 0);	// wait for AD to finish
	
    return (LPC_ADC->DR[channel] & 0xFFFF);         	
  #endif	
}

/**
 * @}
 */


/**
 * @}
 */
  
/* --------------------------------- End Of File ------------------------------ */
