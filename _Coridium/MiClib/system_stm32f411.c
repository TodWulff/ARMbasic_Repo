
#include <stdint.h>
#include "uart_stm.h"

#if defined EMW3165
#include "stm32f4xx_rcc.h" // for external clock setup
#endif

#include "STM32F411.h"
//#include "stm32f4xx_hal_adc.h"

int sector_erased;

uint32_t SystemCoreClock = 100000000;
  __I unsigned char AHBPrescTable[16] = {0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9};

void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    SCB->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff); } /* set Priority for Cortex-M  System Interrupts */
  else {
    NVIC->IP[(uint32_t)(IRQn)] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff);    }        /* set Priority for device specific Interrupts  */
}

uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);          /* only values 0..7 are used          */
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > __NVIC_PRIO_BITS) ? __NVIC_PRIO_BITS : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;

  return (
           ((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
           ((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
         );
}

// forwards
void STM_ClockConfig(RCC_ClkInitTypeDef  *RCC_ClkInitStruct, uint32_t FLatency);
void STM_OscConfig(RCC_OscInitTypeDef  *RCC_OscInitStruct);
void SystemClock_Config(void);


void SystemCoreClockUpdate(void)
{
	SystemCoreClock = 100000000;//MAR
}


  /* Determine clock frequency according to clock register values             */

//void fpu_init(void)
//{
//}

//#ifdef FOR_BASIC

#include "cor_runtime.h"
#include "basic_pcb.h"
extern int g_var_seg[] ;
extern void flt_printR(void);
extern void b_sprintfR(void);
extern char *str_aptr;
#define str_accum (int)(g_var_seg + (MAX_VAR_COUNT<<2))
#define varsize   (int)(MAX_VAR_COUNT>>2)
#define TBL_TODO 0

//?[a]
//083[a]
//[a]
//008C[a]
//0411[a]

//?[a]
//?0835[a]
//00[a]
//C[a]
//0411[a]
//F800[a]

unsigned int f_table[] = 
{
0x0836,//0x0835, //  0 idx_version
0x008C, //  1 idx_count
0x0411, //  2 idx_cpu
0xF800, //  3 idx_datastart NOT USED ?
BASIC_CODE_START, //  4 idx_codestart
0x0000, //  5 idx_boardtype

(unsigned int) g_var_seg  , // idx_var       6
(unsigned int) 0          , // idx_var>>16   7
(unsigned int) f_abs      , // f_abs         8
(unsigned int) f_addsbyte , // f_addsbyte    9
(unsigned int) f_addstr   , // f_addstr      10
(unsigned int) 0          , // f_bitin       11  eliminate someday, by calling f_wrdir and pb_input
(unsigned int) 0          , // f_bitout      12
(unsigned int) 0          , //               13
(unsigned int) f_dec2str  , // f_dec2str     14
(unsigned int) f_div      , // f_div         15
(unsigned int) 0          , // f_dup         16
(unsigned int) f_eq       , // f_eq          17
(unsigned int) f_ge       , // f_ge          18
(unsigned int) 0          , // f_getbaud     19
(unsigned int) 0          , // mac_high      20
(unsigned int) 0          , // mac_mid       21
(unsigned int) 0          , // mac_low       22
(unsigned int) flt_print  , // flt_print     23
(unsigned int) f_getrxd   , // f_getrxd      24
(unsigned int) flt_2int   , // flt_2int      25
(unsigned int) f_getstr   , // f_getstr      26
(unsigned int) f_gettimer , // f_gettimer    27
(unsigned int) flt_2float , // flt_2float    28
(unsigned int) flt_n2float, // flt_n2float   29
(unsigned int) f_gt       , // f_gt          30
(unsigned int) f_hex2str  , // f_hex2str     31
(unsigned int) flt_2str   , // flt_2str      32
(unsigned int) f_le       , // f_le          33
(unsigned int) f_left     , // f_left        34
(unsigned int) f_logand   , // f_logand      35
(unsigned int) f_lognot   , // f_lognot      36
(unsigned int) f_logor    , // f_logor       37
(unsigned int) f_logxor   , // f_logxor      38
(unsigned int) f_lt       , // f_lt          39
(unsigned int) varsize    , // varsize       40   data size  >>4
(unsigned int) FLASH_END  , // flashend      41   flash end  >>4
(unsigned int) f_mod      , // f_mod         42
(unsigned int) f_ne       , // f_ne          43
(unsigned int) f_newstr   , // f_newstr      44
(unsigned int) flt_printR , // flt_printR    45
(unsigned int) flt_add    , // flt_add       46
(unsigned int) flt_sub    , // flt_sub       47
(unsigned int) f_pbinbit  , // f_pbinbit     48
(unsigned int) flt_neg    , // flt_neg       49
(unsigned int) flt_div    , // flt_div       50
(unsigned int) flt_mul    , // flt_mul       51
(unsigned int) f_pboutbit , // f_pboutbit    52
(unsigned int) 0          , // f_peekw       53
(unsigned int) 0          , // f_pokew       54
(unsigned int) f_print    , // f_print       55
(unsigned int) f_printch  , // f_printch     56
(unsigned int) f_printCR  , // f_printCR     57
(unsigned int) WRFLASH_BLOCK_SIZE, // blksize       58
(unsigned int) f_printstr , // f_printstr    59
(unsigned int) f_printTAB , // f_printTAB    60
(unsigned int) f_rddirbit , // f_rddirbit    61
(unsigned int) b_sprintf  , // b_sprintf     62
(unsigned int) b_sprintfR , // b_sprintfR    63
(unsigned int) 0          , // f_read        64
(unsigned int) 0          , // f_restore     65
(unsigned int) f_rev      , // f_rev         66
(unsigned int) f_right    , // f_right       67
(unsigned int) f_savestr  , // f_savestr     68
(unsigned int) f_setbaud  , // f_setbaud     69
(unsigned int) 0          , //               70
(unsigned int) 0          , // f_setDTpt     71
(unsigned int) flt_lt     , // flt_lt        72
(unsigned int) flt_gt     , // flt_gt        73
(unsigned int) flt_le     , // flt_le        74
(unsigned int) flt_ge     , // flt_ge        75
(unsigned int) f_settimer , // f_settimer    76
(unsigned int) f_settxd   , // f_settxd      77
(unsigned int) flt_ne     , // flt_ne        78
(unsigned int) flt_n2int  , // flt_n2int     79
(unsigned int) flt_eq     , // flt_eq        80
(unsigned int) f_str2dec  , // f_str2dec     81
(unsigned int) f_strcmp   , // f_strcmp      82
(unsigned int) f_strlen   , // f_strlen      83
(unsigned int) 0          , // f_swap        84
(unsigned int) f_waitmicro, // f_waitmicro   85
(unsigned int) f_wait     , // f_wait        86
(unsigned int) f_wrdirbit , // f_wrdirbit    87
(unsigned int) 0          , // fileeof       88
(unsigned int) 0          , // n_call        89
(unsigned int) 0          , // n_callfwd     90
(unsigned int) 0          , // n_loadc       91
(unsigned int) 0          , // n_loadi       92
(unsigned int) 0          , // n_loadnc      93
(unsigned int) 0          , // n_loadni      94
(unsigned int) 0          , // n_opend       95  used by very old ARM code -- now being used for file calls
(unsigned int) 0          , // n_ret         96  used by very old ARM code -- now being used for file calls
(unsigned int) 0          , // n_storei      97
(unsigned int) 0          , // n_tjmpfwd     98
(unsigned int) 0          , // n_tjzfwd      99
0,//(unsigned int) f_adin     , // f_adin        100 added for LPC2103
(unsigned int) 0          , // f_fread       101 ARMweb diagnostics used to check SPI-ethernet for now
(unsigned int) 0          , // f_hwout       102 ARMweb diagnostics used to check SPI-ethernet for now
(unsigned int) f_bytein   , // f_bytein      103 ARMweb read a byte
(unsigned int) f_byteout  , // f_byteout     104 ARMweb write a byte
(unsigned int) 0          , // f_strchr      105 ARMweb write a byte
(unsigned int) &str_aptr  , // str_aptr      106
(unsigned int) 0          , // str_aptr>>16  107
(unsigned int) 0          , // f_sort        108 random
(unsigned int) 0          , // f_fwrite      109
(unsigned int) f_intsw    , // f_intsw       110
(unsigned int) f_stop     , // f_stop        111
(unsigned int) TBL_TODO   , // f_cgiin       112 these could move someday but will break ARMweb
(unsigned int) TBL_TODO   , // f_email       113
(unsigned int) TBL_TODO   , // f_udpin       114
(unsigned int) TBL_TODO   , // f_udpout      115
(unsigned int) 0          , // f_intTIMER    116
(unsigned int) 0          , // f_intEINT0    117
(unsigned int) 0          , // f_intEINT2    118
(unsigned int) 0          , // f_intEINT1    119
(unsigned int) TBL_TODO   , // f_lastip      120  these could move someday but will break ARMweb
(unsigned int) TBL_TODO   , // f_http        121  overlays old getrxd1
(unsigned int) f_txfree   , // f_txfree      122  overlays old settxd1
(unsigned int) 0          , // f_genINT      123  serial # goes here
(unsigned int) str_accum  , // str_accum     124
(unsigned int) 0          , // str_accum>>16 125
(unsigned int) TBL_TODO   , // f_getmyip     126
(unsigned int) // ModbusTCP stuff
(unsigned int) TBL_TODO   , // f_setmyip     127 not yet implimented
(unsigned int) TBL_TODO   , // f_enet_rcv    128
(unsigned int) TBL_TODO   , // f_enet_send   129
(unsigned int) TBL_TODO   , // f_enet_init   130  not yet implimented
(unsigned int) 0          , // fileeof       131
(unsigned int) 0          , // filechdir     132  not yet implimented
(unsigned int) 0          , // filereaddir   133
(unsigned int) 0          , // fileopen      134
(unsigned int) 0          , // filewritech   135
(unsigned int) 0          , // filereadch    136
(unsigned int) 0          , // fileclose     137
(unsigned int) 0          , // f_sort        138
(unsigned int) 0          , // reserved      139
(unsigned int) 0            // get warning <=140
};
//#endif // FOR_BASIC

void SystemInit (void)
{
	/* FPU settings ------------------------------------------------------------*/
	#if (__FPU_PRESENT == 1) && (__FPU_USED == 1)
		SCB->CPACR |= ((3UL << 10*2)|(3UL << 11*2));  /* set CP10 and CP11 Full Access */
	#endif
	
	// Configure Flash prefetch, Instruction cache, Data cache
	FLASH->ACR |= 0x00000100;//FLASH_ACR_PRFTEN
	FLASH->ACR |= 0x00000200;//FLASH_ACR_ICEN
	FLASH->ACR |= 0x00000400;//FLASH_ACR_DCEN
 
	NVIC_SetPriorityGrouping(3); // Set Interrupt Group Priority NVIC_PRIORITYGROUP_4, 4 bits for pre-emption priority
	
	#if defined EMW3165
	platform_init_system_clocks(); // EXTERNAL
	#else
	SystemClock_Config();// INTERNAL Configure the system clock to 100 MHz
	#endif
	
	GPIOA_CLK_ENABLE();  // Enable GPIOA Clock (to be able to program the configuration registers)
	GPIOB_CLK_ENABLE();
	GPIOC_CLK_ENABLE();
	GPIOD_CLK_ENABLE();
	
	sector_erased = -1;
	
#ifdef FOR_BASIC
	MEMCPY((void *)0x20000000, (void *)0x00000000, 87<<2);
	SCB->VTOR = 0x20000000; //assign new vector table in RAM, so interrupts can be patched by BASIC
#endif	

	// fix f_table
	f_table[  7] = f_table[  6]>>16; // g_var_seg
	f_table[107] = f_table[106]>>16; // str_aptr
	f_table[125] = f_table[124]>>16; // str_accum
	
	int i;
	//NOTE &0xFFFe because functions return offset+1, variables do not but this is OK
	for(i=6;i<=140;i++) {f_table[i] = f_table[i] & 0xFFFe;}
}

#if defined NUCLEO
/** NOTE this is the setup for internal 16MHz
  * @brief  System Clock Configuration
  *         The system Clock is configured as follow : 
  *            System Clock source            = PLL (HSI)
  *            SYSCLK(Hz)                     = 100000000
  *            HCLK(Hz)                       = 100000000
  *            AHB Prescaler                  = 1
  *            APB1 Prescaler                 = 2
  *            APB2 Prescaler                 = 1
  *            HSI Frequency(Hz)              = 16000000
  *            PLL_M                          = 16
  *            PLL_N                          = 400
  *            PLL_P                          = 4
  *            PLL_Q                          = 7
  *            VDD(V)                         = 3.3
  *            Main regulator output voltage  = Scale2 mode
  *            Flash Latency(WS)              = 3
  * @param  None
  * @retval None
  */
void SystemClock_Config(void)
{
	RCC_ClkInitTypeDef RCC_ClkInitStruct;
	RCC_OscInitTypeDef RCC_OscInitStruct;

	/* Enable Power Control clock */
	PWR_CLK_ENABLE();
	
	//The voltage scaling allows optimizing the power consumption when the device is clocked below the maximum system 
	//frequency, to update the voltage scaling value regarding system frequency refer to product datasheet.
	//__HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);
				                            
	/* Enable HSI Oscillator and activate PLL with HSI as source */
//#ifdef NUCLEO	
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
	RCC_OscInitStruct.HSICalibrationValue = 0x10; // ?? no calibration value for HSE ??
	RCC_OscInitStruct.PLL.PLLM = 16;
	RCC_OscInitStruct.PLL.PLLN = 400;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV4;
//#else
//	/* -1- Select HSI as system clock source to allow modification of the PLL configuration */
//	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_SYSCLK;
//	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
//	STM_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3);
//	
//	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
//	RCC_OscInitStruct.HSEState = RCC_HSE_ON;
//	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
//	RCC_OscInitStruct.PLL.PLLM = 25;
//	RCC_OscInitStruct.PLL.PLLN = 336;
//	RCC_OscInitStruct.PLL.PLLP = 2;
//#endif
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLQ = 7;
	STM_OscConfig(&RCC_OscInitStruct);
	
	/* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2 clocks dividers */
	RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;  
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;  
	STM_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3);
}


/**
  * @brief  Initializes the RCC Oscillators according to the specified parameters in the RCC_OscInitTypeDef.
  * @param  RCC_OscInitStruct: pointer to an RCC_OscInitTypeDef structure that
  *         contains the configuration information for the RCC Oscillators.
  * @note   The PLL is not disabled when used as system clock.
  * @retval HAL status
  */
void STM_OscConfig(RCC_OscInitTypeDef  *RCC_OscInitStruct)
{
 
	/*------------------------------- HSE Configuration ------------------------*/ 
	if(((RCC_OscInitStruct->OscillatorType) & RCC_OSCILLATORTYPE_HSE) == RCC_OSCILLATORTYPE_HSE)
	{
		/* When the HSE is used as system clock or clock source for PLL in these cases HSE will not be disabled */
		if(((RCC->CFGR & RCC_CFGR_SWS) == RCC_CFGR_SWS_HSE)                                                                     ||\
			(((RCC->CFGR & RCC_CFGR_SWS) == RCC_CFGR_SWS_PLL) && ((RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC) == RCC_PLLCFGR_PLLSRC_HSE)))
		{
			if((__HAL_RCC_GET_FLAG(RCC_FLAG_HSERDY) != 0) && (RCC_OscInitStruct->HSEState == RCC_HSE_OFF))
			{
			  return ;// HAL_ERROR;
			}
		}
		else
		{
			/* Reset HSEON and HSEBYP bits before configuring the HSE --------------*/
			__HAL_RCC_HSE_CONFIG(RCC_HSE_OFF);
			
			/* Wait till HSE is disabled */  
			while(__HAL_RCC_GET_FLAG(RCC_FLAG_HSERDY) != 0){} // hang
			
			/* Set the new HSE configuration ---------------------------------------*/
			__HAL_RCC_HSE_CONFIG(RCC_OscInitStruct->HSEState);
			
			/* Check the HSE State */
			if((RCC_OscInitStruct->HSEState) != RCC_HSE_OFF)
			{
			  /* Wait till HSE is ready */  
			  while(__HAL_RCC_GET_FLAG(RCC_FLAG_HSERDY) == 0){} // hang
			}
			else
			{
			  /* Wait till HSE is bypassed or disabled */
			  while(__HAL_RCC_GET_FLAG(RCC_FLAG_HSERDY) != 0){} // hang
			}
		}
	}
	/*----------------------------- HSI Configuration --------------------------*/
	if(((RCC_OscInitStruct->OscillatorType) & RCC_OSCILLATORTYPE_HSI) == RCC_OSCILLATORTYPE_HSI)
	{
		/* Check if HSI is used as system clock or as PLL source when PLL is selected as system clock */
		if(((RCC->CFGR & RCC_CFGR_SWS) == RCC_CFGR_SWS_HSI)                                                                     ||\
			(((RCC->CFGR & RCC_CFGR_SWS) == RCC_CFGR_SWS_PLL) && ((RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC) == RCC_PLLCFGR_PLLSRC_HSI)))
		{
			/* When HSI is used as system clock it will not disabled */
			if((__HAL_RCC_GET_FLAG(RCC_FLAG_HSIRDY) != 0) && (RCC_OscInitStruct->HSIState != RCC_HSI_ON))
			{
			  return ;// HAL_ERROR;
			}
			/* Otherwise, just the calibration is allowed */
			else
			{
			  /* Adjusts the Internal High Speed oscillator (HSI) calibration value.*/
			  __HAL_RCC_HSI_CALIBRATIONVALUE_ADJUST(RCC_OscInitStruct->HSICalibrationValue);
			}
		}
		else
		{
			/* Check the HSI State */
			if((RCC_OscInitStruct->HSIState)!= RCC_HSI_OFF)
			{
			  /* Enable the Internal High Speed oscillator (HSI). */
			  __HAL_RCC_HSI_ENABLE();

			  /* Wait till HSI is ready */  
			  while(__HAL_RCC_GET_FLAG(RCC_FLAG_HSIRDY) == 0){} // hang
			          
			  /* Adjusts the Internal High Speed oscillator (HSI) calibration value.*/
			  __HAL_RCC_HSI_CALIBRATIONVALUE_ADJUST(RCC_OscInitStruct->HSICalibrationValue);
			}
			else
			{
			  /* Disable the Internal High Speed oscillator (HSI). */
			  __HAL_RCC_HSI_DISABLE();

			  /* Wait till HSI is ready */  
			  while(__HAL_RCC_GET_FLAG(RCC_FLAG_HSIRDY) != 0){} // hang
			}
		}
	}
	/*------------------------------ LSI Configuration -------------------------*/
	if(((RCC_OscInitStruct->OscillatorType) & RCC_OSCILLATORTYPE_LSI) == RCC_OSCILLATORTYPE_LSI)
	{
		/* Check the LSI State */
		if((RCC_OscInitStruct->LSIState)!= RCC_LSI_OFF)
		{
			/* Enable the Internal Low Speed oscillator (LSI). */
			__HAL_RCC_LSI_ENABLE();
			
			/* Wait till LSI is ready */
			while(__HAL_RCC_GET_FLAG(RCC_FLAG_LSIRDY) == 0){} // hang
		}
		else
		{
			/* Disable the Internal Low Speed oscillator (LSI). */
			__HAL_RCC_LSI_DISABLE();
			
			/* Wait till LSI is ready */  
			while(__HAL_RCC_GET_FLAG(RCC_FLAG_LSIRDY) != 0){} // hang
		}
	}
	/*------------------------------ LSE Configuration -------------------------*/ 
	if(((RCC_OscInitStruct->OscillatorType) & RCC_OSCILLATORTYPE_LSE) == RCC_OSCILLATORTYPE_LSE)
	{
		/* Enable Power Clock*/
		PWR_CLK_ENABLE();
		
		/* Enable write access to Backup domain */
		PWR->CR |= PWR_CR_DBP;
		
		/* Wait for Backup domain Write protection disable */
		while((PWR->CR & PWR_CR_DBP) == 0){} // hang
		
		/* Reset LSEON and LSEBYP bits before configuring the LSE ----------------*/
		__HAL_RCC_LSE_CONFIG(RCC_LSE_OFF);
		
		/* Wait till LSE is ready */  
		while(__HAL_RCC_GET_FLAG(RCC_FLAG_LSERDY) != 0){} // hang
		
		/* Set the new LSE configuration -----------------------------------------*/
		__HAL_RCC_LSE_CONFIG(RCC_OscInitStruct->LSEState);
		/* Check the LSE State */
		if((RCC_OscInitStruct->LSEState) != RCC_LSE_OFF)
		{
			/* Wait till LSE is ready */  
			while(__HAL_RCC_GET_FLAG(RCC_FLAG_LSERDY) == 0){} // hang
		}
		else
		{
			/* Wait till LSE is ready */  
			while(__HAL_RCC_GET_FLAG(RCC_FLAG_LSERDY) != 0){} // hang
		}
	}
	/*-------------------------------- PLL Configuration -----------------------*/
	if ((RCC_OscInitStruct->PLL.PLLState) != RCC_PLL_NONE)
	{
		/* Check if the PLL is used as system clock or not */
		if((RCC->CFGR & RCC_CFGR_SWS) != RCC_CFGR_SWS_PLL)
		{ 
			if((RCC_OscInitStruct->PLL.PLLState) == RCC_PLL_ON)
			{
			  /* Disable the main PLL. */
			  __HAL_RCC_PLL_DISABLE();
			  
			  /* Wait till PLL is ready */  
			  while(__HAL_RCC_GET_FLAG(RCC_FLAG_PLLRDY) != 0){} // hang

			  /* Configure the main PLL clock source, multiplication and division factors. */
			  WRITE_REG(RCC->PLLCFGR, (RCC_OscInitStruct->PLL.PLLSource                                            | \
			                           RCC_OscInitStruct->PLL.PLLM                                                 | \
			                           (RCC_OscInitStruct->PLL.PLLN << POSITION_VAL(RCC_PLLCFGR_PLLN))             | \
			                           (((RCC_OscInitStruct->PLL.PLLP >> 1) -1) << POSITION_VAL(RCC_PLLCFGR_PLLP)) | \
			                           (RCC_OscInitStruct->PLL.PLLQ << POSITION_VAL(RCC_PLLCFGR_PLLQ))));
			  /* Enable the main PLL. */
			  __HAL_RCC_PLL_ENABLE();

			  /* Wait till PLL is ready */  
			  while(__HAL_RCC_GET_FLAG(RCC_FLAG_PLLRDY) == 0){} // hang
			}
			else
			{
			  /* Disable the main PLL. */
			  __HAL_RCC_PLL_DISABLE();
 
			  /* Wait till PLL is ready */  
			  while(__HAL_RCC_GET_FLAG(RCC_FLAG_PLLRDY) != 0){} // hang
			}
		}
		else
		{
			return ;// HAL_ERROR;
		}
	}
	//return HAL_OK;
}
 
/**
	* @brief  Initializes the CPU, AHB and APB busses clocks according to the specified 
	*		     parameters in the RCC_ClkInitStruct.
	* @param  RCC_ClkInitStruct: pointer to an RCC_OscInitTypeDef structure that
	*		     contains the configuration information for the RCC peripheral.
	* @param  FLatency: FLASH Latency, this parameter depend on device selected
	* 
	* @note   The SystemCoreClock CMSIS variable is used to store System Clock Frequency 
	*		     and updated by HAL_RCC_GetHCLKFreq() function called within this function
	*
	* @note   The HSI is used (enabled by hardware) as system clock source after
	*		     startup from Reset, wake-up from STOP and STANDBY mode, or in case
	*		     of failure of the HSE used directly or indirectly as system clock
	*		     (if the Clock Security System CSS is enabled).
	*		       
	* @note   A switch from one clock source to another occurs only if the target
	*		     clock source is ready (clock stable after startup delay or PLL locked). 
	*		     If a clock source which is not yet ready is selected, the switch will
	*		     occur when the clock source will be ready. 
	*		       
	* @note   Depending on the device voltage range, the software has to set correctly
	*		     HPRE[3:0] bits to ensure that HCLK not exceed the maximum allowed frequency
	*		     (for more details refer to section above "Initialization/de-initialization functions")
	* @retval None
	*/
void STM_ClockConfig(RCC_ClkInitTypeDef  *RCC_ClkInitStruct, uint32_t FLatency)
{
	/* To correctly read data from FLASH memory, the number of wait states (LATENCY) 
		must be correctly programmed according to the frequency of the CPU clock 
		(HCLK) and the supply voltage of the device. */
	
	/* Increasing the CPU frequency */
	if(FLatency > (FLASH->ACR & FLASH_ACR_LATENCY))
	{		
		/* Program the new number of wait states to the LATENCY bits in the FLASH_ACR register */
		__HAL_FLASH_SET_LATENCY(FLatency);
		
		/* Check that the new number of wait states is taken into account to access the Flash
		memory by reading the FLASH_ACR register */
		if((FLASH->ACR & FLASH_ACR_LATENCY) != FLatency)
		{
			return ;// HAL_ERROR;
		}

		/*-------------------------- HCLK Configuration --------------------------*/
		if(((RCC_ClkInitStruct->ClockType) & RCC_CLOCKTYPE_HCLK) == RCC_CLOCKTYPE_HCLK)
		{
			MODIFY_REG(RCC->CFGR, RCC_CFGR_HPRE, RCC_ClkInitStruct->AHBCLKDivider);
		}

		/*------------------------- SYSCLK Configuration ---------------------------*/ 
		if(((RCC_ClkInitStruct->ClockType) & RCC_CLOCKTYPE_SYSCLK) == RCC_CLOCKTYPE_SYSCLK)
		{	  
			/* HSE is selected as System Clock Source */
			if(RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_HSE)
			{
			  /* Check the HSE ready flag */  
			  if(__HAL_RCC_GET_FLAG(RCC_FLAG_HSERDY) == 0)
			  {
			    return ;// HAL_ERROR;
			  }
			}
			/* PLL is selected as System Clock Source */
			else if((RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_PLLCLK)   || 
			        (RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_PLLRCLK))
			{
			  /* Check the PLL ready flag */  
			  if(__HAL_RCC_GET_FLAG(RCC_FLAG_PLLRDY) == 0)
			  {
			    return ;// HAL_ERROR;
			  }
			}
			/* HSI is selected as System Clock Source */
			else
			{
			  /* Check the HSI ready flag */  
			  if(__HAL_RCC_GET_FLAG(RCC_FLAG_HSIRDY) == 0)
			  {
			    return ;// HAL_ERROR;
			  }
			}

			__HAL_RCC_SYSCLK_CONFIG(RCC_ClkInitStruct->SYSCLKSource);
			if(RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_HSE)
			{
			  while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_SYSCLKSOURCE_STATUS_HSE){} // hang
			}
			else if(RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_PLLCLK)
			{
			  while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_SYSCLKSOURCE_STATUS_PLLCLK){} // hang
			}
			else if(RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_PLLRCLK)
			{
			  while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_SYSCLKSOURCE_STATUS_PLLRCLK){} // hang
			}
			else
			{
			  while((RCC->CFGR & RCC_CFGR_SWS) != RCC_SYSCLKSOURCE_STATUS_HSI){} // hang
			}
		}	  
	}
	/* Decreasing the CPU frequency */
	else
	{
		/*-------------------------- HCLK Configuration --------------------------*/
		if(((RCC_ClkInitStruct->ClockType) & RCC_CLOCKTYPE_HCLK) == RCC_CLOCKTYPE_HCLK)
		{
			MODIFY_REG(RCC->CFGR, RCC_CFGR_HPRE, RCC_ClkInitStruct->AHBCLKDivider);
		}

		/*------------------------- SYSCLK Configuration -------------------------*/
		if(((RCC_ClkInitStruct->ClockType) & RCC_CLOCKTYPE_SYSCLK) == RCC_CLOCKTYPE_SYSCLK)
		{	  
			/* HSE is selected as System Clock Source */
			if(RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_HSE)
			{
			  /* Check the HSE ready flag */  
			  if(__HAL_RCC_GET_FLAG(RCC_FLAG_HSERDY) == 0)
			  {
			    return ;// HAL_ERROR;
			  }
			}
			/* PLL is selected as System Clock Source */
			else if((RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_PLLCLK) || 
			        (RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_PLLRCLK))
			{
			  /* Check the PLL ready flag */  
			  if(__HAL_RCC_GET_FLAG(RCC_FLAG_PLLRDY) == 0)
			  {
			    return ;// HAL_ERROR;
			  }
			}
			/* HSI is selected as System Clock Source */
			else
			{
			  /* Check the HSI ready flag */  
			  if(__HAL_RCC_GET_FLAG(RCC_FLAG_HSIRDY) == 0)
			  {
			    return ;// HAL_ERROR;
			  }
			}
			__HAL_RCC_SYSCLK_CONFIG(RCC_ClkInitStruct->SYSCLKSource);
			
			if(RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_HSE)
			{
			  while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_SYSCLKSOURCE_STATUS_HSE){} // hang
			}
			else if(RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_PLLCLK)
			{
			  while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_SYSCLKSOURCE_STATUS_PLLCLK){} // hang
			}
			else if(RCC_ClkInitStruct->SYSCLKSource == RCC_SYSCLKSOURCE_PLLRCLK)
			{
			  while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_SYSCLKSOURCE_STATUS_PLLRCLK){} // hang
			}
			else
			{
			  while((RCC->CFGR & RCC_CFGR_SWS) != RCC_SYSCLKSOURCE_STATUS_HSI){} // hang
			}
		}
		
		/* Program the new number of wait states to the LATENCY bits in the FLASH_ACR register */
		__HAL_FLASH_SET_LATENCY(FLatency);
		
		/* Check that the new number of wait states is taken into account to access the Flash
		memory by reading the FLASH_ACR register */
		if((FLASH->ACR & FLASH_ACR_LATENCY) != FLatency)
		{
			return ;// HAL_ERROR;
		}
	}

	/*-------------------------- PCLK1 Configuration ---------------------------*/ 
	if(((RCC_ClkInitStruct->ClockType) & RCC_CLOCKTYPE_PCLK1) == RCC_CLOCKTYPE_PCLK1)
	{
		MODIFY_REG(RCC->CFGR, RCC_CFGR_PPRE1, RCC_ClkInitStruct->APB1CLKDivider);
	}
	
	/*-------------------------- PCLK2 Configuration ---------------------------*/ 
	if(((RCC_ClkInitStruct->ClockType) & RCC_CLOCKTYPE_PCLK2) == RCC_CLOCKTYPE_PCLK2)
	{
		MODIFY_REG(RCC->CFGR, RCC_CFGR_PPRE2, ((RCC_ClkInitStruct->APB2CLKDivider) << 3));
	}

	systick_init();

	/*Configure the SysTick IRQ priority */
	//HAL_NVIC_SetPriority(SysTick_IRQn, TICK_INT_PRIORITY ,0); // CHECK THIS FOR DUPLICATION
	uint32_t prioritygroup = NVIC_GetPriorityGrouping();
	NVIC_SetPriority(SysTick_IRQn, NVIC_EncodePriority(prioritygroup, TICK_INT_PRIORITY, 0));

	
	//return HAL_OK;
}
#endif // NUCLEO

#if defined EMW3165
/**
  * @brief  Configures the SysTick clock source.
  * @param  SysTick_CLKSource: specifies the SysTick clock source.
  *   This parameter can be one of the following values:
  *     @arg SysTick_CLKSource_HCLK_Div8: AHB clock divided by 8 selected as SysTick clock source.
  *     @arg SysTick_CLKSource_HCLK: AHB clock selected as SysTick clock source.
  * @retval None
  */
void SysTick_CLKSourceConfig(uint32_t SysTick_CLKSource)
{
  /* Check the parameters */
//  assert_param(IS_SYSTICK_CLK_SOURCE(SysTick_CLKSource));
  if (SysTick_CLKSource == SysTick_CLKSource_HCLK)
  {
    SysTick->CTRL |= SysTick_CLKSource_HCLK;
  }
  else
  {
    SysTick->CTRL &= SysTick_CLKSource_HCLK_Div8;
  }
}

void FLASH_PrefetchBufferCmd(FunctionalState NewState)
{
  /* Check the parameters */
  //assert_param(IS_FUNCTIONAL_STATE(NewState));
  
  /* Enable or disable the Prefetch Buffer */
  if(NewState != DISABLE)
  {
    FLASH->ACR |= FLASH_ACR_PRFTEN;
  }
  else
  {
    FLASH->ACR &= (~FLASH_ACR_PRFTEN);
  }
}
void FLASH_SetLatency(uint32_t FLASH_Latency)
{
  /* Check the parameters */
  //assert_param(IS_FLASH_LATENCY(FLASH_Latency));
  
  /* Perform Byte access to FLASH_ACR[8:0] to set the Latency value */
  *(__IO uint8_t *)ACR_BYTE0_ADDRESS = (uint8_t)FLASH_Latency;
}

void platform_init_system_clocks( void )
{
#if 0   /* If this is enabled, the LSE PA8 output will be disabled and never comes up again */
    RCC_DeInit( );
#endif /* if 0 */

    /* Configure Clocks */

    RCC_HSEConfig( HSE_SOURCE );
    RCC_WaitForHSEStartUp( );

    RCC_HCLKConfig( AHB_CLOCK_DIVIDER );
    RCC_PCLK2Config( APB2_CLOCK_DIVIDER );
    RCC_PCLK1Config( APB1_CLOCK_DIVIDER );

    /* Enable the PLL */
    FLASH_SetLatency( INT_FLASH_WAIT_STATE );
	FLASH_PrefetchBufferCmd( ENABLE );

    /* Use the clock configuration utility from ST to calculate these values
     * http://www.st.com/st-web-ui/static/active/en/st_prod_software_internet/resource/technical/software/utility/stsw-stm32090.zip
     */
    RCC_PLLConfig( PLL_SOURCE, PLL_M_CONSTANT, PLL_N_CONSTANT, PLL_P_CONSTANT, PPL_Q_CONSTANT ); /* NOTE: The CPU Clock Frequency is independently defined in <WICED-SDK>/WICED/platform/<platform>/<platform>.mk */
    RCC_PLLCmd( ENABLE );

    while ( RCC_GetFlagStatus( RCC_FLAG_PLLRDY ) == RESET )
    {
    }
    RCC_SYSCLKConfig( SYSTEM_CLOCK_SOURCE );

    while ( RCC_GetSYSCLKSource( ) != 0x08 )
    {
    }

    /* Configure HCLK clock as SysTick clock source. */
    SysTick_CLKSourceConfig( SYSTICK_CLOCK_SOURCE );

}
#endif // EMW3165 
#if defined EMW3165
/**
  * @brief  Configures the SysTick clock source.
  * @param  SysTick_CLKSource: specifies the SysTick clock source.
  *   This parameter can be one of the following values:
  *     @arg SysTick_CLKSource_HCLK_Div8: AHB clock divided by 8 selected as SysTick clock source.
  *     @arg SysTick_CLKSource_HCLK: AHB clock selected as SysTick clock source.
  * @retval None
  */
void SysTick_CLKSourceConfig(uint32_t SysTick_CLKSource)
{
  /* Check the parameters */
//  assert_param(IS_SYSTICK_CLK_SOURCE(SysTick_CLKSource));
  if (SysTick_CLKSource == SysTick_CLKSource_HCLK)
  {
    SysTick->CTRL |= SysTick_CLKSource_HCLK;
  }
  else
  {
    SysTick->CTRL &= SysTick_CLKSource_HCLK_Div8;
  }
}

void FLASH_PrefetchBufferCmd(FunctionalState NewState)
{
  /* Check the parameters */
  //assert_param(IS_FUNCTIONAL_STATE(NewState));
  
  /* Enable or disable the Prefetch Buffer */
  if(NewState != DISABLE)
  {
    FLASH->ACR |= FLASH_ACR_PRFTEN;
  }
  else
  {
    FLASH->ACR &= (~FLASH_ACR_PRFTEN);
  }
}
void FLASH_SetLatency(uint32_t FLASH_Latency)
{
  /* Check the parameters */
  //assert_param(IS_FLASH_LATENCY(FLASH_Latency));
  
  /* Perform Byte access to FLASH_ACR[8:0] to set the Latency value */
  *(__IO uint8_t *)ACR_BYTE0_ADDRESS = (uint8_t)FLASH_Latency;
}

void platform_init_system_clocks( void )
{
#if 0   /* If this is enabled, the LSE PA8 output will be disabled and never comes up again */
    RCC_DeInit( );
#endif /* if 0 */

    /* Configure Clocks */

    RCC_HSEConfig( HSE_SOURCE );
    RCC_WaitForHSEStartUp( );

    RCC_HCLKConfig( AHB_CLOCK_DIVIDER );
    RCC_PCLK2Config( APB2_CLOCK_DIVIDER );
    RCC_PCLK1Config( APB1_CLOCK_DIVIDER );

    /* Enable the PLL */
    FLASH_SetLatency( INT_FLASH_WAIT_STATE );
	FLASH_PrefetchBufferCmd( ENABLE );

    /* Use the clock configuration utility from ST to calculate these values
     * http://www.st.com/st-web-ui/static/active/en/st_prod_software_internet/resource/technical/software/utility/stsw-stm32090.zip
     */
    RCC_PLLConfig( PLL_SOURCE, PLL_M_CONSTANT, PLL_N_CONSTANT, PLL_P_CONSTANT, PPL_Q_CONSTANT ); /* NOTE: The CPU Clock Frequency is independently defined in <WICED-SDK>/WICED/platform/<platform>/<platform>.mk */
    RCC_PLLCmd( ENABLE );

    while ( RCC_GetFlagStatus( RCC_FLAG_PLLRDY ) == RESET )
    {
    }
    RCC_SYSCLKConfig( SYSTEM_CLOCK_SOURCE );

    while ( RCC_GetSYSCLKSource( ) != 0x08 )
    {
    }

    /* Configure HCLK clock as SysTick clock source. */
    SysTick_CLKSourceConfig( SYSTICK_CLOCK_SOURCE );

}
#endif // EMW3165 

/**
  * @brief  Initializes the GPIOx peripheral according to the specified parameters in the GPIO_Init.
  * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F429X device or
  *                      x can be (A..I) to select the GPIO peripheral for STM32F40XX and STM32F427X devices.
  * @param  GPIO_Init: pointer to a GPIO_InitTypeDef structure that contains
  *         the configuration information for the specified GPIO peripheral.
  * @retval None
  */
void STM_GPIO_Init(GPIO_TypeDef  *GPIOx, GPIO_InitTypeDef *GPIO_Init)
{
	uint32_t position;
	uint32_t ioposition = 0x00;
	uint32_t iocurrent = 0x00;
	uint32_t temp = 0x00;

	/* Configure the port pins */
	for(position = 0; position < GPIO_NUMBER; position++)
	{
		/* Get the IO position */
		ioposition = ((uint32_t)0x01) << position;
		/* Get the current IO position */
		iocurrent = (uint32_t)(GPIO_Init->Pin) & ioposition;

		if(iocurrent == ioposition)
		{
			/*--------------------- GPIO Mode Configuration ------------------------*/
			/* In case of Alternate function mode selection */
			if((GPIO_Init->Mode == GPIO_MODE_AF_PP) || (GPIO_Init->Mode == GPIO_MODE_AF_OD))
			{
				/* Check the Alternate function parameter */
				/* Configure Alternate function mapped with the current IO */
				temp = GPIOx->AFR[position >> 3];
				temp &= ~((uint32_t)0xF << ((uint32_t)(position & (uint32_t)0x07) * 4)) ;
				temp |= ((uint32_t)(GPIO_Init->Alternate) << (((uint32_t)position & (uint32_t)0x07) * 4));
				GPIOx->AFR[position >> 3] = temp;
			}

			/* Configure IO Direction mode (Input, Output, Alternate or Analog) */
			temp = GPIOx->MODER;
			temp &= ~(GPIO_MODER_MODER0 << (position * 2));
			temp |= ((GPIO_Init->Mode & GPIO_MODE) << (position * 2));
			GPIOx->MODER = temp;

			/* In case of Output or Alternate function mode selection */
			if((GPIO_Init->Mode == GPIO_MODE_OUTPUT_PP) || (GPIO_Init->Mode == GPIO_MODE_AF_PP) ||
				 (GPIO_Init->Mode == GPIO_MODE_OUTPUT_OD) || (GPIO_Init->Mode == GPIO_MODE_AF_OD))
			{
				/* Check the Speed parameter */
				/* Configure the IO Speed */
				temp = GPIOx->OSPEEDR; 
				temp &= ~(GPIO_OSPEEDER_OSPEEDR0 << (position * 2));
				temp |= (GPIO_Init->Speed << (position * 2));
				GPIOx->OSPEEDR = temp;

				/* Configure the IO Output Type */
				temp = GPIOx->OTYPER;
				temp &= ~(GPIO_OTYPER_OT_0 << position) ;
				temp |= (((GPIO_Init->Mode & GPIO_OUTPUT_TYPE) >> 4) << position);
				GPIOx->OTYPER = temp;
			}

			/* Activate the Pull-up or Pull down resistor for the current IO */
			temp = GPIOx->PUPDR;
			temp &= ~(GPIO_PUPDR_PUPDR0 << (position * 2));
			temp |= ((GPIO_Init->Pull) << (position * 2));
			GPIOx->PUPDR = temp;

			/*--------------------- EXTI Mode Configuration ------------------------*/
			/* Configure the External Interrupt or event for the current IO */
			if((GPIO_Init->Mode & EXTI_MODE) == EXTI_MODE)
			{
				/* Enable SYSCFG Clock */
				SYSCFG_CLK_ENABLE();

				temp = SYSCFG->EXTICR[position >> 2];
				temp &= ~(((uint32_t)0x0F) << (4 * (position & 0x03)));
				temp |= ((uint32_t)(GPIO_GET_INDEX(GPIOx)) << (4 * (position & 0x03)));
				SYSCFG->EXTICR[position >> 2] = temp;

				/* Clear EXTI line configuration */
				temp = EXTI->IMR;
				temp &= ~((uint32_t)iocurrent);
				if((GPIO_Init->Mode & GPIO_MODE_IT) == GPIO_MODE_IT)
				{
					temp |= iocurrent;
				}
				EXTI->IMR = temp;

				temp = EXTI->EMR;
				temp &= ~((uint32_t)iocurrent);
				if((GPIO_Init->Mode & GPIO_MODE_EVT) == GPIO_MODE_EVT)
				{
					temp |= iocurrent;
				}
				EXTI->EMR = temp;

				/* Clear Rising Falling edge configuration */
				temp = EXTI->RTSR;
				temp &= ~((uint32_t)iocurrent);
				if((GPIO_Init->Mode & RISING_EDGE) == RISING_EDGE)
				{
					temp |= iocurrent;
				}
				EXTI->RTSR = temp;

				temp = EXTI->FTSR;
				temp &= ~((uint32_t)iocurrent);
				if((GPIO_Init->Mode & FALLING_EDGE) == FALLING_EDGE)
				{
					temp |= iocurrent;
				}
				EXTI->FTSR = temp;
			}
		}
	}
}

#define MAX_IO 128 // 64 ?? 65 for C1

GPIO_TypeDef* Get_GPIO_Port(int pinnum){
	int i = pinnum & 0x70;
	return 
		i == 0x00 ? GPIOA :
		i == 0x20 ? GPIOB :
		i == 0x40 ? GPIOC :
		            GPIOD ; //i == 0x60
}

void alt_wrdirbit(int pinnum, int dirval) {
	GPIO_InitTypeDef  GPIO_InitStruct;
	if(pinnum > MAX_IO) return;
	// THIS SHOULD WORK BUT I GET STARNGE RESULTS
	//GPIO_TypeDef * GPIOx = (GPIO_TypeDef *) ( GPIOA + ( (pinnum & 0x70) << 5) );
	GPIO_TypeDef * GPIOx  = Get_GPIO_Port(pinnum);
	GPIO_InitStruct.Pin   = 1<<(pinnum & 0xF);// NOTE F and not 1F because pins go 0 to 15, not 31
	GPIO_InitStruct.Speed = GPIO_SPEED_FAST;
	GPIO_InitStruct.Pull  = GPIO_PULLUP;
	GPIO_InitStruct.Alternate = 0;

	if (dirval)	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	else        GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	STM_GPIO_Init(GPIOx, &GPIO_InitStruct); 
}

int alt_rddirbit(int pinnum) {
	if(pinnum > MAX_IO) return pinnum;
	GPIO_TypeDef * GPIOx = Get_GPIO_Port(pinnum);
	return 0;//(GPIOx->MODER >> (pinnum & 0xF)) & 1;
}


int alt_inbit(int pinnum) {
	if(pinnum > MAX_IO) return pinnum;
	GPIO_TypeDef * GPIOx = Get_GPIO_Port(pinnum);
	if((GPIOx->IDR >> (pinnum & 0x1F)) & 1)
		return -1;
	else
		return 0;
}

void alt_outbit(int pinnum,int pinval) {
	GPIO_TypeDef * GPIOx = Get_GPIO_Port(pinnum);
	if(pinnum > MAX_IO) return;
	if(pinval) GPIOx->BSRR = 1 << (pinnum & 0xF);
	else       GPIOx->BSRR = 1 << ((pinnum & 0xF)+16);
	//if(pinval) GPIOx->ODR |= 1 << (pinnum & 0xF);
	//else       GPIOx->ODR &= ~(1 << (pinnum & 0xF));
}


#ifndef BREAK_WAIT
#define BREAK_WAIT	1000
#endif

int startUserCode(int isRUNcommand) {
	int ch;
	int RCC_CSR;
	
	// check to see if code is valid
#warning -- need to check code validity
#if 0	
	if (((*(unsigned int *) (f_table[4]<<4)) == 0xFFFFFFFF) || ((*(unsigned int *) (f_table[4]<<4)) == 0)){
		return 0;
	}
#endif
	
	if (isRUNcommand) {	
	    return 1;
    } else {					// got here on RESET/Power on/Fault/BOD/WDT
	
#warning this code needs to change, as firmware name is not here	
//  #ifdef INSERT_USERNAME
//		if (checkNameValid() != (* (int *) 0x01f4 & 0xffff)) return 0;		// check for a valid firmware copy 
//  #endif
		
	 #ifdef UART_NOBUFFER	
		return 0;				// don't restart on reset for this test mode
		
	 #else
		// if we got here and the reset indicators show false, and not RUN command then its a Fault IRQ restart, so return 0
		RCC_CSR = RCC->CSR; // save status
		RCC->CSR = 1<<24; // Bit 24 RMVF: Clear the reset flags
		
		//RCC clock control & status register (RCC_CSR)
		//Bit 31 LPWRRSTF: Low-power management reset occurs.
		//Bit 30 WWDGRSTF: window watchdog reset occurs.
		//Bit 29 IWDGRSTF: independent watchdog reset from VDD domain occurs.
		//Bit 28 SFTRSTF:  software reset occurs.
		//Bit 27 PORRSTF:  POR/PDR reset occurs.
		//Bit 26 PINRSTF:  reset from the NRST pin occurs.
		//Bit 25 BORRSTF:  POR/PDR or BOR reset occurs.
		// NOTE BORRSTF and PORRSTF both include POR/PDR

		       if (RCC_CSR & 1<<27) { // power on occurred
		} else if (RCC_CSR & 1<<26) { // reset occurred
		} else if (RCC_CSR & 1<<30) { // watchdog -- user code must have enabled it so go to the user code
		} else if (RCC_CSR & 1<<25) { // brown out-- user code must have enabled it so go to the user code
		} else {
			return 0;			// must have got here by Fault ISR
		}	
	  #endif	
	}	
#warning MIKE -- above looks OK, BRUCE Please review -- but next statement needs to go once code seems good
return 0;
		
	// now wait to see if a BREAK happens -- ctlC or ESC received on UART	
		
	delay_ms(BREAK_WAIT);
	
	while ((ch = getchar()) != -1) {
	    if ((ch == ESC) || (ch == CTRLC)) {
		    return 0;
	    }
    }

	// if we got here its good to go	
	return 1;	
}	







#define ADC_CLOCKPRESCALER_PCLK_DIV4    ADC_CLOCK_SYNC_PCLK_DIV4
#define ADC_RESOLUTION12b               ADC_RESOLUTION_12B
#define EOC_SINGLE_CONV                 ADC_EOC_SINGLE_CONV
#define HAL_MAX_DELAY      0xFFFFFFFF
#define HAL_IS_BIT_SET(REG, BIT)         (((REG) & (BIT)) != RESET)
#define HAL_IS_BIT_CLR(REG, BIT)         (((REG) & (BIT)) == RESET)


unsigned char AD_Pins[] = {
0  , // 0 PA0
1  , // 1 PA1
2  , // 2 PA2
3  , // 3 PA3
4  , // 4 PA4
5  , // 5 PA5
6  , // 6 PA6
7  , // 7 PA7
32 , // 8 PB0
33 , // 9 PB1
64 , // 10 PC0
65 , // 11 PC1
66 , // 12 PC2
67 , // 13 PC3
68 , // 14 PC4
69 , // 15 PC5
};

void IO2AD(int chan)
{
	if(chan>15) return;
	GPIO_InitTypeDef  GPIO_InitStruct;
	GPIO_InitStruct.Mode = GPIO_MODE_ANALOG; // Configure the selected ADC Channel as analog input
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Pin = 1<<(AD_Pins[chan] & 31);
	GPIO_TypeDef* GPIOx = Get_GPIO_Port(AD_Pins[chan]);
	STM_GPIO_Init(GPIOx, &GPIO_InitStruct);
}


void initAD(void)//ADC_HandleTypeDef* hadc)
{
	RCC_ADC1_CLK_ENABLE();

	// Set the ADC clock prescaler
	//ADC->CCR &= ~(ADC_CCR_ADCPRE);
	//ADC->CCR |=	hadc->Init.ClockPrescaler;
	ADC->CCR = 0x00010000 ; // ClockPrescaler ADC_CLOCKPRESCALER_PCLK_DIV4 must not exceed 36MHz

	// Set ADC scan mode TODO MAYBE multiple channels
	ADC1->CR1 &= ~(ADC_CR1_SCAN); // 0 Single mode (one channel)
	//ADC1->CR1 |=	ADC_CR1_SCANCONV(hadc->Init.ScanConvMode);
	
	// Set ADC resolution
	ADC1->CR1 &= ~(ADC_CR1_RES); // 0 ADC_RESOLUTION12b
	//ADC1->CR1 |=	hadc->Init.Resolution;
	
	// Set ADC data alignment
	ADC1->CR2 &= ~(ADC_CR2_ALIGN); // 0 ALIGN_RIGHT
	//ADC1->CR2 |= hadc->Init.DataAlign;

	// Reset the external trigger
	ADC1->CR2 &= ~(ADC_CR2_EXTSEL);
	ADC1->CR2 &= ~(ADC_CR2_EXTEN);
	 
	// Enable or disable ADC continuous conversion mode
	ADC1->CR2 &= ~(ADC_CR2_CONT); // 0 DISABLE
	//ADC1->CR2 |= ADC_CR2_CONTINUOUS(hadc->Init.ContinuousConvMode);

// TODO MAYBE: multiple channels 	
//	if(hadc->Init.DiscontinuousConvMode != DISABLE)//DiscontinuousConvMode = 0; // DISABLE;
//	{
//		// Enable the selected ADC regular discontinuous mode
//		ADC1->CR1 |= (uint32_t)ADC_CR1_DISCEN;
//		
//		// Set the number of channels to be converted in discontinuous mode
//		ADC1->CR1 &= ~(ADC_CR1_DISCNUM);
//		// TODO ADC1->CR1 |=	ADC_CR1_DISCONTINUOUS(hadc->Init.NbrOfDiscConversion);
//	}
//	else
		ADC1->CR1 &= ~(ADC_CR1_DISCEN); // Disable discontinuous mode
	
	// Set ADC number of conversion
	ADC1->SQR1 &= ~(ADC_SQR1_L);
	ADC1->SQR1 |=	1<<20; //ADC_SQR1(hadc->Init.NbrOfConversion); // reset = 0, this would be += 1 for multiple channels MAR

	// Enable or disable ADC DMA continuous request
	ADC1->CR2 &= ~(ADC_CR2_DDS); // 0 DISABLE
	//ADC1->CR2 |= ADC_CR2_DMAContReq(hadc->Init.DMAContinuousRequests);
	
	// Enable or disable ADC end of conversion selection
	ADC1->CR2 &= ~(ADC_CR2_EOCS);
	ADC1->CR2 |= 1<<10;//ADC_CR2_EOCSelection(hadc->Init.EOCSelection);
}

int AD(int channel)
{
	//int adc_value = -1;
	
	if((ADC1->CR2 & ADC_CR2_ADON) != ADC_CR2_ADON)
	{	
		ADC1->CR2 |= ADC_CR2_ADON; // ADC_ENABLE
		// Delay for ADC stabilization time, actual time was 12.375 us
		delay_us(15);
	}
	
	ADC1->SQR3 = channel; // always 1 conversion, sequence 0
	ADC1->CR2 |= (uint32_t)ADC_CR2_SWSTART; // start it up
	
	// Check End of conversion flag
	// assume success, takes about 0.875 us
	while((ADC1->SR & ADC_FLAG_EOC) != ADC_FLAG_EOC){
		// if timeout return -1 or continue to return -1 below
	}
	//if((ADC1->SR & ADC_FLAG_EOC) == ADC_FLAG_EOC)
	//	adc_value = ADC1->DR;
	return ADC1->DR; // adc_value;
}


// I left this for possible future need. MAR
//@brief	Configures for the selected ADC regular channel its corresponding
//				rank in the sequencer and its sample time.
//@param	hadc: pointer to a ADC_HandleTypeDef structure that contains
//				the configuration information for the specified ADC.
//@param	sConfig: ADC configuration structure. 
//void ADC_ConfigChannel(ADC_ChannelConfTypeDef* sConfig)
//{
//	uint32_t counter = 0;
	// SMPR all default 0, sample times are 3 cycles
	//if (sConfig->Channel > 9)
	//{
	//	// Clear the old sample time
	//	ADC1->SMPR1 &= ~ADC_SMPR1(ADC_SMPR1_SMP10, sConfig->Channel);
	//	
	//	// Set the new sample time
	//	ADC1->SMPR1 |= ADC_SMPR1(sConfig->SamplingTime, sConfig->Channel);
	//}
	//else // ADC_Channel include in ADC_Channel_[0..9]
	//{
	//	// Clear the old sample time
	//	ADC1->SMPR2 &= ~ADC_SMPR2(ADC_SMPR2_SMP0, sConfig->Channel);
	//	
	//	// Set the new sample time
	//	ADC1->SMPR2 |= ADC_SMPR2(sConfig->SamplingTime, sConfig->Channel);
	//}
	
	// There is only one conversion per, rank is set in AD()
	// SQR1 L[3:0] = 0, 1 conversion
	// // For Rank 1 to 6
	// if (sConfig->Rank < 7)
	// {
	// 	// Clear the old SQx bits for the selected rank
	// 	ADC1->SQR3 &= ~ADC_SQR3_RK(ADC_SQR3_SQ1, sConfig->Rank);
	// 	
	// 	// Set the SQx bits for the selected rank
	// 	ADC1->SQR3 |= ADC_SQR3_RK(sConfig->Channel, sConfig->Rank);
	// }
	// // For Rank 7 to 12
	// else if (sConfig->Rank < 13)
	// {
	// 	// Clear the old SQx bits for the selected rank
	// 	ADC1->SQR2 &= ~ADC_SQR2_RK(ADC_SQR2_SQ7, sConfig->Rank);
	// 	
	// 	// Set the SQx bits for the selected rank
	// 	ADC1->SQR2 |= ADC_SQR2_RK(sConfig->Channel, sConfig->Rank);
	// }
	// // For Rank 13 to 16
	// else
	// {
	// 	// Clear the old SQx bits for the selected rank
	// 	ADC1->SQR1 &= ~ADC_SQR1_RK(ADC_SQR1_SQ13, sConfig->Rank);
	// 	
	// 	// Set the SQx bits for the selected rank
	// 	ADC1->SQR1 |= ADC_SQR1_RK(sConfig->Channel, sConfig->Rank);
	// }
	
	//na ?? // if ADC1 Channel_18 is selected enable VBAT Channel
	// if (sConfig->Channel == 18) // 18 is VBAT
	// {
	// 	// Enable the VBAT channel*/
	// 	ADC->CCR |= ADC_CCR_VBATE;
	// }
	
	//na ?? // if ADC1 Channel_16 or Channel_17 is selected enable TSVREFE Channel(Temperature sensor and VREFINT)
	// if ((sConfig->Channel == 16) || (sConfig->Channel == 17)) // 17 is VREFINT
	// {
	// 	// Enable the TSVREFE channel
	// 	ADC->CCR |= ADC_CCR_TSVREFE;
	// 	if(sConfig->Channel == 16) // TEMPSENSOR
	// 	{
	// 		// Delay for temperature sensor stabilization time. Compute number of CPU cycles to wait for
	// 		counter = (10*(SystemCoreClock / 1000000)); // 10 is ADC_TEMPSENSOR_DELAY_US
	// 		while(counter != 0){counter--;}
	// 	}
	// }
//}


void FLASH_Unlock(void)
{
  if((FLASH->CR & FLASH_CR_LOCK) != 0)
  {
    /* Authorize the FLASH Registers access */
    FLASH->KEYR = FLASH_KEY1;
    FLASH->KEYR = FLASH_KEY2;
  }  
}

/**
  * @brief  Locks the FLASH control register access
  * @param  None
  * @retval None
  */
void FLASH_Lock(void)
{
  /* Set the LOCK Bit to lock the FLASH Registers access */
  FLASH->CR |= FLASH_CR_LOCK;
}

/**
  * @brief  Returns the FLASH Status.
  * @param  None
  * @retval FLASH Status: The returned value can be: FLASH_BUSY, FLASH_ERROR_PROGRAM,
  *                       FLASH_ERROR_WRP, FLASH_ERROR_OPERATION or FLASH_COMPLETE.
  */
FLASH_Status FLASH_GetStatus(void)
{
  FLASH_Status flashstatus = FLASH_COMPLETE;
  
  if((FLASH->SR & FLASH_FLAG_BSY) == FLASH_FLAG_BSY) 
  {
    flashstatus = FLASH_BUSY;
  }
  else 
  {  
    if((FLASH->SR & FLASH_FLAG_WRPERR) != (uint32_t)0x00)
    { 
      flashstatus = FLASH_ERROR_WRP;
    }
    else 
    {
      if((FLASH->SR & (uint32_t)0xEF) != (uint32_t)0x00)
      {
        flashstatus = FLASH_ERROR_PROGRAM; 
      }
      else
      {
        if((FLASH->SR & FLASH_FLAG_OPERR) != (uint32_t)0x00)
        {
          flashstatus = FLASH_ERROR_OPERATION;
        }
        else
        {
          flashstatus = FLASH_COMPLETE;
        }
      }
    }
  }
  /* Return the FLASH Status */
  return flashstatus;
}

/**
  * @brief  Waits for a FLASH operation to complete.
  * @param  None
  * @retval FLASH Status: The returned value can be: FLASH_BUSY, FLASH_ERROR_PROGRAM,
  *                       FLASH_ERROR_WRP, FLASH_ERROR_OPERATION or FLASH_COMPLETE.
  */
FLASH_Status FLASH_WaitForLastOperation(void)
{ 
  __IO FLASH_Status status = FLASH_COMPLETE;
   
  /* Check for the FLASH Status */
  status = FLASH_GetStatus();

  /* Wait for the FLASH operation to complete by polling on BUSY flag to be reset.
     Even if the FLASH operation fails, the BUSY flag will be reset and an error
     flag will be set */
  while(status == FLASH_BUSY)
  {
    status = FLASH_GetStatus();
  }
  /* Return the operation status */
  return status;
}

#define SECTOR_MASK               ((uint32_t)0xFFFFFF07)

FLASH_Status FLASH_EraseSector(uint32_t FLASH_Sector, uint8_t VoltageRange)
{
  uint32_t tmp_psize = 0x0;
  FLASH_Status status = FLASH_COMPLETE;

  /* Check the parameters */
  //assert_param(IS_FLASH_SECTOR(FLASH_Sector));
  //assert_param(IS_VOLTAGERANGE(VoltageRange));
  
  //if(VoltageRange == VoltageRange_1)
  //{
  //   tmp_psize = FLASH_PSIZE_BYTE;
  //}
  //else if(VoltageRange == VoltageRange_2)
  //{
  //  tmp_psize = FLASH_PSIZE_HALF_WORD;
  //}
  //else if(VoltageRange == VoltageRange_3)
  //{
  tmp_psize = FLASH_PSIZE_WORD; // 0x200
  //}
  //else
  //{
  //  tmp_psize = FLASH_PSIZE_DOUBLE_WORD;
  //}
  /* Wait for last operation to be completed */
  status = FLASH_WaitForLastOperation();
  
  if(status == FLASH_COMPLETE)
  { 
    /* if the previous operation is completed, proceed to erase the sector */
    FLASH->CR &= CR_PSIZE_MASK;
    FLASH->CR |= tmp_psize;
    FLASH->CR &= SECTOR_MASK;
    FLASH->CR |= FLASH_CR_SER | FLASH_Sector;
    FLASH->CR |= FLASH_CR_STRT;
    
    /* Wait for last operation to be completed */
    status = FLASH_WaitForLastOperation();
    
    /* if the erase operation is completed, disable the SER Bit */
    FLASH->CR &= (~FLASH_CR_SER);
    FLASH->CR &= SECTOR_MASK; 
  }
  /* Return the Erase Status */
  return status;
}

/**
  * @brief  Programs a word (32-bit) at a specified address.
  * @param  Address: specifies the address to be programmed.
  *         This parameter can be any address in Program memory zone or in OTP zone.  
  * @note   This function must be used when the device voltage range is from 2.7V to 3.6V. 
  * @param  Data: specifies the data to be programmed.
  * @retval FLASH Status: The returned value can be: FLASH_BUSY, FLASH_ERROR_PROGRAM,
  *                       FLASH_ERROR_WRP, FLASH_ERROR_OPERATION or FLASH_COMPLETE.
  */
int FLASH_ProgramWord(uint32_t Address, uint32_t Data)
{
  FLASH_Status status = FLASH_COMPLETE;

  /* Check the parameters */
  //assert_param(IS_FLASH_ADDRESS(Address));

  /* Wait for last operation to be completed */
  status = FLASH_WaitForLastOperation();
  
  if(status == FLASH_COMPLETE)
  {
    /* if the previous operation is completed, proceed to program the new data */
    FLASH->CR &= CR_PSIZE_MASK;
    FLASH->CR |= FLASH_PSIZE_WORD;
    FLASH->CR |= FLASH_CR_PG;
  
    *(__IO uint32_t*)Address = Data;
        
    /* Wait for last operation to be completed */
    status = FLASH_WaitForLastOperation();

    /* if the program operation is completed, disable the PG Bit */
    FLASH->CR &= (~FLASH_CR_PG);
  } 
  /* Return the Program Status */
  return (int)status;
}

//int platform_erase_flash( uint16_t start_sector, uint16_t end_sector )
int platform_erase_flash( uint16_t start_sector )
{
    /* Unlock the STM32 Flash */
    FLASH_Unlock( );

    /* Clear any error flags */
    //FLASH_ClearFlag( FLASH_FLAG_EOP | FLASH_FLAG_OPERR | FLASH_FLAG_WRPERR | FLASH_FLAG_PGAERR | FLASH_FLAG_PGPERR | FLASH_FLAG_PGSERR );
	FLASH->SR = FLASH_FLAG_EOP | FLASH_FLAG_OPERR | FLASH_FLAG_WRPERR | FLASH_FLAG_PGAERR | FLASH_FLAG_PGPERR | FLASH_FLAG_PGSERR ;
    //platform_watchdog_kick( );

//    for ( i = start_sector; i <= end_sector; i += 8 ){
         // FLASH_Sector_3 is (3<<3), FLASH_Sector_4 is(4<<3), etc
		if ( FLASH_EraseSector( (start_sector<<3), ERASE_VOLTAGE_RANGE ) != FLASH_COMPLETE )
        {
            /* Error occurred during erase. */
            /* TODO: Handle error */
            printf("Error during EraseFlash" );
			return 1;
        }
//    }

    FLASH_Lock( );
//printf("\nErased sector %d\n",start_sector);

    return 0;
}

int platform_write_flash_chunk( uint32_t address, const void* data, uint32_t size )
{
    int result = 0;//PLATFORM_SUCCESS;
    uint32_t write_address   = address;
    flash_write_t* data_ptr  = (flash_write_t*) data;
    flash_write_t* end_ptr   = (flash_write_t*) &((char*)data)[size];

    FLASH_Unlock( );

    /* Clear any error flags */
	FLASH->SR = FLASH_FLAG_EOP | FLASH_FLAG_OPERR | FLASH_FLAG_WRPERR | FLASH_FLAG_PGAERR | FLASH_FLAG_PGPERR | FLASH_FLAG_PGSERR ;

    /* Write data to STM32 flash memory */
    while ( data_ptr < end_ptr )
    {
        FLASH_Status status;

        int tries = 0;
        /* enough data available to write as the largest size allowed by supply voltage */
        while ( ( FLASH_COMPLETE != ( status = FLASH_WRITE_FUNC( write_address, *data_ptr ) ) ) && ( tries < 10 ) )
        {
            tries++;
        }
        if ( FLASH_COMPLETE != status )
        {
            /* TODO: Handle error properly */
            printf("Error during WriteFlash" );
			result = 1;
			data_ptr = end_ptr; // might as well bail now
        }
        write_address += FLASH_WRITE_SIZE;
        data_ptr++;
    }
    if ( memcmp( (void*)address, (void*)data, size) != 0 )
    {
        result = 1;
    }
    FLASH_Lock();
//printf("\nWrote addr %08X\n",address);

    return result;
}

//Sector 0 0x0800 0000 - 0x0800 3FFF 16 Kbytes BASIC uses 12K
//Sector 1 0x0800 4000 - 0x0800 7FFF 16 Kbytes
//Sector 2 0x0800 8000 - 0x0800 BFFF 16 Kbytes
//Sector 3 0x0800 C000 - 0x0800 FFFF 16 Kbytes
//Sector 4 0x0801 0000 - 0x0801 FFFF 64 Kbytes
//Sector 5 0x0802 0000 - 0x0803 FFFF 128 Kbytes
//Sector 6 0x0804 0000 - 0x0805 FFFF 128 Kbytes
//Sector 7 0x0806 0000 - 0x0807 FFFF 128 Kbytes
#define COMPUTE_FLASH_SECTOR(flash_addr) (flash_addr<0x10000?(flash_addr>>14):(flash_addr<0x20000?4:((flash_addr&0x60000)>>17)+4))

int WriteFlash (unsigned int flash_addr, unsigned int data_addr, unsigned int blksize)
{
	char sector, result=0;

//// NOTE: I see nothing about disabling interrupts for ST

//	unsigned int NVIC_Save;
//	unsigned int Systic_Save;
//	NVIC_Save = NVIC->ISER[0]; //save current interrupt sources
//	NVIC->ICER[0] = 0xFFFFFFFF;//clear interrupt sources
//	Systic_Save = SysTick->CTRL;
//	SysTick->CTRL  = 0;        //disable SysTick

	flash_addr &= 0x7FFFF;
	sector = COMPUTE_FLASH_SECTOR(flash_addr);

	if( flash_addr & 1);									// user says do nothing
	else if((sector != sector_erased) || (flash_addr & 2)){	// bit 1 forces erase
		result = platform_erase_flash (sector);
//printf("%x 1result\n",result); 
	}
	sector_erased = sector;

//printf("%x flash addr\n",flash_addr); 
	if (result == 0) {
		result = platform_write_flash_chunk ( (flash_addr&(~3)),  data_addr, blksize);
	}
	
////printf("%x result\n",result); 
//	SysTick->CTRL = Systic_Save; 		//re-enable SysTick if it was in use CLKSOURCE=CPU clock | TICKINT | ENABLE
//	NVIC->ISER[0] = NVIC_Save;  //restore interrupt sources

	return result;
}

