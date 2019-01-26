
#ifndef __SYSTEM_STM32F411_H
#define __SYSTEM_STM32F411_H

// TODO see what these do
#define  VDD_VALUE                    ((uint32_t)3300) /*!< Value of VDD in mv */
#define  TICK_INT_PRIORITY            ((uint32_t)0x0F) /*!< tick interrupt priority */          
#define  PREFETCH_ENABLE              1              
#define  INSTRUCTION_CACHE_ENABLE     1
#define  DATA_CACHE_ENABLE            1

#define START_USER_CODE_DEFINED

#if defined EMW3165
  #define MAX_VAR_COUNT   	1024
  #define CPU_NUM			0x0411
  #define BASIC_CODE_START	0x0C000>>4
  #define FLASH_END			0x10000>>4
  #define __FPU_PRESENT     1

#elif NUCLEO
  #define MAX_VAR_COUNT   	30720
  #define CPU_NUM			0x0411
  #define BASIC_CODE_START	0x10000>>4
  #define FLASH_END			0x80000>>4
  #define __FPU_PRESENT     1

#else
	#error Please Define NUCLEO or EMW3165 
#endif

// define these Flash constants here, as this file gets included in startup.S and to much stuff in lpc407x.h that assembler doesn't like
#define FLASHMAP_1758
#define WRFLASH_BLOCK_SIZE		0x1000	

#define USE_AD

#ifndef GCC_ASM_STEP


#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include "lpc_types.h"

extern int sector_erased;
extern uint32_t SystemCoreClock;      /*!< System Clock Frequency (Core Clock)  	*/
//extern uint32_t PeripheralClock;	    /*!< Peripheral Clock Frequency (Pclk) 	    */
//extern uint32_t EMCClock;			        /*!< EMC Clock                              */
//extern uint32_t USBClock;			        /*!< USB Frequency 						              */


/**
 * Initialize the system
 *
 * @param  none
 * @return none
 *
 * @brief  Setup the microcontroller system.
 *         Initialize the System and update the SystemCoreClock variable.
 */
extern void SystemInit (void);

/**
 * Update SystemCoreClock variable
 *
 * @param  none
 * @return none
 *
 * @brief  Updates the SystemCoreClock with current core Clock
 *         retrieved from cpu registers.
 */
extern void SystemCoreClockUpdate (void);

void IO2AD(int chan);
void alt_wrdirbit(int pinnum, int dirval) ;
int alt_rddirbit(int pinnum) ;
int alt_inbit(int pinnum) ;
void alt_outbit(int pinnum,int pinval) ;

extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);



//int  platform_erase_flash       ( uint16_t start_sector, uint16_t end_sector );
int  platform_erase_flash       ( uint16_t start_sector );
int  platform_write_flash_chunk ( uint32_t address, const void* data, uint32_t size );
//void init_adc(void);
//int do_adc(void);


#if defined EMW3165
void platform_init_system_clocks( void );
// HSE_VALUE = STM32 crystal frequency = 26MHz (needed to make UART work correctly) GLOBAL_DEFINES += HSE_VALUE=26000000
#define HSE_VALUE    ((uint32_t)26000000) /*!< Value of the External oscillator in Hz */
#define HSI_VALUE    ((uint32_t)16000000) /*!< Value of the Internal oscillator in Hz*/
#define HSE_STARTUP_TIMEOUT    ((uint16_t)0x0500)   /*!< Time out for HSE start up */

#define SysTick_CLKSource_HCLK_Div8    ((uint32_t)0xFFFFFFFB)
#define SysTick_CLKSource_HCLK         ((uint32_t)0x00000004)
#define FLASH_Latency_3                ((uint8_t)0x0003)  /*!< FLASH Three Latency cycles */

#define CPU_CLOCK_HZ            (100000000 )

#define HSE_SOURCE              ( RCC_HSE_ON )
#define AHB_CLOCK_DIVIDER       ( RCC_SYSCLK_Div1 )
#define APB1_CLOCK_DIVIDER      ( RCC_HCLK_Div2 )
#define APB2_CLOCK_DIVIDER      ( RCC_HCLK_Div1 )
#define PLL_SOURCE              ( RCC_PLLSource_HSE )
#define PLL_M_CONSTANT          ( 26 )
#define PLL_N_CONSTANT          ( 200 )
#define PLL_P_CONSTANT          ( 2 )
#define PPL_Q_CONSTANT          ( 4 )
#define SYSTEM_CLOCK_SOURCE     ( RCC_SYSCLKSource_PLLCLK )
#define SYSTICK_CLOCK_SOURCE    ( SysTick_CLKSource_HCLK )
#define INT_FLASH_WAIT_STATE    ( FLASH_Latency_3 )
#define PLATFORM_STM32_VOLTAGE_2V7_TO_3V6
#endif //EMW3165

typedef enum
{ 
  FLASH_BUSY = 1,
  FLASH_ERROR_PGS,
  FLASH_ERROR_PGP,
  FLASH_ERROR_PGA,
  FLASH_ERROR_WRP,
  FLASH_ERROR_PROGRAM,
  FLASH_ERROR_OPERATION,
  FLASH_COMPLETE
}FLASH_Status;

#define VoltageRange_3        ((uint8_t)0x02)  /*!<Device operating range: 2.7V to 3.6V */

//#elif defined( PLATFORM_STM32_VOLTAGE_2V7_TO_3V6 )
#define ERASE_VOLTAGE_RANGE ( VoltageRange_3 )
#define FLASH_WRITE_FUNC    ( FLASH_ProgramWord )
#define FLASH_WRITE_SIZE    ( 4 )
typedef unsigned int flash_write_t;

#define FLASH_KEY1               ((uint32_t)0x45670123)
#define FLASH_KEY2               ((uint32_t)0xCDEF89AB)
#define FLASH_FLAG_EOP                 ((uint32_t)0x00000001)  /*!< FLASH End of Operation flag */
#define FLASH_FLAG_OPERR               ((uint32_t)0x00000002)  /*!< FLASH operation Error flag */
#define FLASH_FLAG_WRPERR              ((uint32_t)0x00000010)  /*!< FLASH Write protected error flag */
#define FLASH_FLAG_PGAERR              ((uint32_t)0x00000020)  /*!< FLASH Programming Alignment error flag */
#define FLASH_FLAG_PGPERR              ((uint32_t)0x00000040)  /*!< FLASH Programming Parallelism error flag  */
#define FLASH_FLAG_PGSERR              ((uint32_t)0x00000080)  /*!< FLASH Programming Sequence error flag  */
#define FLASH_FLAG_BSY                 ((uint32_t)0x00010000)  /*!< FLASH Busy flag */ 

#define FLASH_Sector_0     ((uint16_t)0x0000) /*!< Sector Number 0 */
#define FLASH_Sector_1     ((uint16_t)0x0008) /*!< Sector Number 1 */
#define FLASH_Sector_2     ((uint16_t)0x0010) /*!< Sector Number 2 */
#define FLASH_Sector_3     ((uint16_t)0x0018) /*!< Sector Number 3 */
#define FLASH_Sector_4     ((uint16_t)0x0020) /*!< Sector Number 4 */
#define FLASH_Sector_5     ((uint16_t)0x0028) /*!< Sector Number 5 */
#define FLASH_Sector_6     ((uint16_t)0x0030) /*!< Sector Number 6 */
#define FLASH_Sector_7     ((uint16_t)0x0038) /*!< Sector Number 7 */
#define FLASH_Sector_8     ((uint16_t)0x0040) /*!< Sector Number 8 */
#define FLASH_Sector_9     ((uint16_t)0x0048) /*!< Sector Number 9 */
#define FLASH_Sector_10    ((uint16_t)0x0050) /*!< Sector Number 10 */
#define FLASH_Sector_11    ((uint16_t)0x0058) /*!< Sector Number 11 */

#define FLASH_PSIZE_WORD           ((uint32_t)0x00000200)
#define CR_PSIZE_MASK              ((uint32_t)0xFFFFFCFF)

#define UNUSED(x) ((void)(x))

// Enable or disable the AHB1 peripheral clock.
#define GPIOA_CLK_ENABLE()	do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIOAEN);\
                         /* Delay after an RCC peripheral clock enabling */ \
                         tmpreg = READ_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIOAEN);\
                         UNUSED(tmpreg); \
					} while(0)
#define GPIOB_CLK_ENABLE()	do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIOBEN);\
                         tmpreg = READ_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIOBEN);\
                         UNUSED(tmpreg); \
					} while(0)						  
#define GPIOC_CLK_ENABLE()	do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIOCEN);\
                         tmpreg = READ_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIOCEN);\
                         UNUSED(tmpreg); \
					} while(0)
#define GPIOD_CLK_ENABLE()	do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIODEN);\
                         tmpreg = READ_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIODEN);\
                         UNUSED(tmpreg); \
					} while(0)
#define GPIOH_CLK_ENABLE()	do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIOHEN);\
                         tmpreg = READ_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIOHEN);\
                         UNUSED(tmpreg); \
					} while(0)
#define DMA1_CLK_ENABLE() 	do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->AHB1ENR, RCC_AHB1ENR_DMA1EN);\
                         tmpreg = READ_BIT(RCC->AHB1ENR, RCC_AHB1ENR_DMA1EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define DMA2_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->AHB1ENR, RCC_AHB1ENR_DMA2EN);\
                         tmpreg = READ_BIT(RCC->AHB1ENR, RCC_AHB1ENR_DMA2EN);\
                         UNUSED(tmpreg); \
					} while(0)

// Enable or disable the Low Speed APB (APB1) peripheral clock.
#define TIM5_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB1ENR, RCC_APB1ENR_TIM5EN);\
                         tmpreg = READ_BIT(RCC->APB1ENR, RCC_APB1ENR_TIM5EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define WWDG_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB1ENR, RCC_APB1ENR_WWDGEN);\
                         tmpreg = READ_BIT(RCC->APB1ENR, RCC_APB1ENR_WWDGEN);\
                         UNUSED(tmpreg); \
					} while(0)
#define SPI2_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB1ENR, RCC_APB1ENR_SPI2EN);\
                         tmpreg = READ_BIT(RCC->APB1ENR, RCC_APB1ENR_SPI2EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define USART2_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB1ENR, RCC_APB1ENR_USART2EN);\
                         tmpreg = READ_BIT(RCC->APB1ENR, RCC_APB1ENR_USART2EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define I2C1_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB1ENR, RCC_APB1ENR_I2C1EN);\
                         tmpreg = READ_BIT(RCC->APB1ENR, RCC_APB1ENR_I2C1EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define I2C2_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB1ENR, RCC_APB1ENR_I2C2EN);\
                         tmpreg = READ_BIT(RCC->APB1ENR, RCC_APB1ENR_I2C2EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define PWR_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB1ENR, RCC_APB1ENR_PWREN);\
                         tmpreg = READ_BIT(RCC->APB1ENR, RCC_APB1ENR_PWREN);\
                         UNUSED(tmpreg); \
					} while(0)


// Enable or disable the High Speed APB (APB2) peripheral clock.
#define TIM1_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB2ENR, RCC_APB2ENR_TIM1EN);\
                         tmpreg = READ_BIT(RCC->APB2ENR, RCC_APB2ENR_TIM1EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define USART1_CLK_ENABLE()   do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB2ENR, RCC_APB2ENR_USART1EN);\
                         tmpreg = READ_BIT(RCC->APB2ENR, RCC_APB2ENR_USART1EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define USART6_CLK_ENABLE()   do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB2ENR, RCC_APB2ENR_USART6EN);\
                         tmpreg = READ_BIT(RCC->APB2ENR, RCC_APB2ENR_USART6EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define ADC1_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB2ENR, RCC_APB2ENR_ADC1EN);\
                         tmpreg = READ_BIT(RCC->APB2ENR, RCC_APB2ENR_ADC1EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define SPI1_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB2ENR, RCC_APB2ENR_SPI1EN);\
                         tmpreg = READ_BIT(RCC->APB2ENR, RCC_APB2ENR_SPI1EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define SYSCFG_CLK_ENABLE()   do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB2ENR, RCC_APB2ENR_SYSCFGEN);\
                         tmpreg = READ_BIT(RCC->APB2ENR, RCC_APB2ENR_SYSCFGEN);\
                         UNUSED(tmpreg); \
					} while(0)
#define TIM9_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB2ENR, RCC_APB2ENR_TIM9EN);\
                         tmpreg = READ_BIT(RCC->APB2ENR, RCC_APB2ENR_TIM9EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define TIM11_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB2ENR, RCC_APB2ENR_TIM11EN);\
                         tmpreg = READ_BIT(RCC->APB2ENR, RCC_APB2ENR_TIM11EN);\
                         UNUSED(tmpreg); \
					} while(0)
#define RCC_ADC1_CLK_ENABLE() do { \
                         __IO uint32_t tmpreg; \
                         SET_BIT(RCC->APB2ENR, RCC_APB2ENR_ADC1EN);\
                         /* Delay after an RCC peripheral clock enabling */ \
                         tmpreg = READ_BIT(RCC->APB2ENR, RCC_APB2ENR_ADC1EN);\
                         UNUSED(tmpreg); \
					} while(0)

typedef struct
{
  uint32_t PLLState;   /*!< The new state of the PLL.
                            This parameter can be a value of @ref RCC_PLL_Config                      */

  uint32_t PLLSource;  /*!< RCC_PLLSource: PLL entry clock source.
                            This parameter must be a value of @ref RCC_PLL_Clock_Source               */

  uint32_t PLLM;       /*!< PLLM: Division factor for PLL VCO input clock.
                            This parameter must be a number between Min_Data = 0 and Max_Data = 63    */

  uint32_t PLLN;       /*!< PLLN: Multiplication factor for PLL VCO output clock.
                            This parameter must be a number between Min_Data = 192 and Max_Data = 432 */

  uint32_t PLLP;       /*!< PLLP: Division factor for main system clock (SYSCLK).
                            This parameter must be a value of @ref RCC_PLLP_Clock_Divider             */

  uint32_t PLLQ;       /*!< PLLQ: Division factor for OTG FS, SDIO and RNG clocks.
                            This parameter must be a number between Min_Data = 4 and Max_Data = 15    */
}RCC_PLLInitTypeDef;

typedef struct
{
  uint32_t OscillatorType;       /*!< The oscillators to be configured.
                                      This parameter can be a value of @ref RCC_Oscillator_Type                   */

  uint32_t HSEState;             /*!< The new state of the HSE.
                                      This parameter can be a value of @ref RCC_HSE_Config                        */

  uint32_t LSEState;             /*!< The new state of the LSE.
                                      This parameter can be a value of @ref RCC_LSE_Config                        */
                                          
  uint32_t HSIState;             /*!< The new state of the HSI.
                                      This parameter can be a value of @ref RCC_HSI_Config                        */

  uint32_t HSICalibrationValue;  /*!< The calibration trimming value.
                                      This parameter must be a number between Min_Data = 0x00 and Max_Data = 0x1F */
                               
  uint32_t LSIState;             /*!< The new state of the LSI.
                                      This parameter can be a value of @ref RCC_LSI_Config                        */

  RCC_PLLInitTypeDef PLL;        /*!< PLL structure parameters                                                    */      

}RCC_OscInitTypeDef;

/**
  * @brief  RCC System, AHB and APB busses clock configuration structure definition  
  */
typedef struct
{
  uint32_t ClockType;             /*!< The clock to be configured.
                                       This parameter can be a value of @ref RCC_System_Clock_Type      */

  uint32_t SYSCLKSource;          /*!< The clock source (SYSCLKS) used as system clock.
                                       This parameter can be a value of @ref RCC_System_Clock_Source    */

  uint32_t AHBCLKDivider;         /*!< The AHB clock (HCLK) divider. This clock is derived from the system clock (SYSCLK).
                                       This parameter can be a value of @ref RCC_AHB_Clock_Source       */

  uint32_t APB1CLKDivider;        /*!< The APB1 clock (PCLK1) divider. This clock is derived from the AHB clock (HCLK).
                                       This parameter can be a value of @ref RCC_APB1_APB2_Clock_Source */

  uint32_t APB2CLKDivider;        /*!< The APB2 clock (PCLK2) divider. This clock is derived from the AHB clock (HCLK).
                                       This parameter can be a value of @ref RCC_APB1_APB2_Clock_Source */

}RCC_ClkInitTypeDef;

#define RCC_OSCILLATORTYPE_NONE            ((uint32_t)0x00000000)
#define RCC_OSCILLATORTYPE_HSE             ((uint32_t)0x00000001)
#define RCC_OSCILLATORTYPE_HSI             ((uint32_t)0x00000002)
#define RCC_OSCILLATORTYPE_LSE             ((uint32_t)0x00000004)
#define RCC_OSCILLATORTYPE_LSI             ((uint32_t)0x00000008)

#define RCC_HSE_OFF                      ((uint8_t)0x00)
#define RCC_HSE_ON                       ((uint8_t)0x01)
#define RCC_HSE_BYPASS                   ((uint8_t)0x05)
#define RCC_LSE_OFF                      ((uint8_t)0x00)
#define RCC_LSE_ON                       ((uint8_t)0x01)
#define RCC_LSE_BYPASS                   ((uint8_t)0x05)
#define RCC_HSI_OFF                      ((uint8_t)0x00)
#define RCC_HSI_ON                       ((uint8_t)0x01)
#define RCC_LSI_OFF                      ((uint8_t)0x00)
#define RCC_LSI_ON                       ((uint8_t)0x01)
#define RCC_PLL_NONE                      ((uint8_t)0x00)
#define RCC_PLL_OFF                       ((uint8_t)0x01)
#define RCC_PLL_ON                        ((uint8_t)0x02)

/* Flags in the CR register */
#define RCC_FLAG_HSIRDY                  ((uint8_t)0x21)
#define RCC_FLAG_HSERDY                  ((uint8_t)0x31)
#define RCC_FLAG_PLLRDY                  ((uint8_t)0x39)
#define RCC_FLAG_PLLI2SRDY               ((uint8_t)0x3B)

/* Flags in the BDCR register */
#define RCC_FLAG_LSERDY                  ((uint8_t)0x41)

/* Flags in the CSR register */
#define RCC_FLAG_LSIRDY                  ((uint8_t)0x61)
#define RCC_FLAG_BORRST                  ((uint8_t)0x79)
#define RCC_FLAG_PINRST                  ((uint8_t)0x7A)
#define RCC_FLAG_PORRST                  ((uint8_t)0x7B)
#define RCC_FLAG_SFTRST                  ((uint8_t)0x7C)
#define RCC_FLAG_IWDGRST                 ((uint8_t)0x7D)
#define RCC_FLAG_WWDGRST                 ((uint8_t)0x7E)
#define RCC_FLAG_LPWRRST                 ((uint8_t)0x7F)

#define RCC_CLOCKTYPE_SYSCLK             ((uint32_t)0x00000001)
#define RCC_CLOCKTYPE_HCLK               ((uint32_t)0x00000002)
#define RCC_CLOCKTYPE_PCLK1              ((uint32_t)0x00000004)
#define RCC_CLOCKTYPE_PCLK2              ((uint32_t)0x00000008)
#define RCC_SYSCLKSOURCE_HSI             RCC_CFGR_SW_HSI
#define RCC_SYSCLKSOURCE_HSE             RCC_CFGR_SW_HSE
#define RCC_SYSCLKSOURCE_PLLCLK          RCC_CFGR_SW_PLL
#define RCC_SYSCLKSOURCE_PLLRCLK         ((uint32_t)(RCC_CFGR_SW_0 | RCC_CFGR_SW_1))
#define RCC_SYSCLKSOURCE_STATUS_HSI      RCC_CFGR_SWS_HSI   /*!< HSI used as system clock */
#define RCC_SYSCLKSOURCE_STATUS_HSE      RCC_CFGR_SWS_HSE   /*!< HSE used as system clock */
#define RCC_SYSCLKSOURCE_STATUS_PLLCLK   RCC_CFGR_SWS_PLL   /*!< PLL used as system clock */
#define RCC_SYSCLKSOURCE_STATUS_PLLRCLK  ((uint32_t)(RCC_CFGR_SW_0 | RCC_CFGR_SW_1))   /*!< PLLR used as system clock */
#define RCC_PLLSOURCE_HSI                RCC_PLLCFGR_PLLSRC_HSI
#define RCC_PLLSOURCE_HSE                RCC_PLLCFGR_PLLSRC_HSE

#define RCC_HCLK_DIV1                    RCC_CFGR_PPRE1_DIV1
#define RCC_HCLK_DIV2                    RCC_CFGR_PPRE1_DIV2
#define RCC_HCLK_DIV4                    RCC_CFGR_PPRE1_DIV4
#define RCC_HCLK_DIV8                    RCC_CFGR_PPRE1_DIV8
#define RCC_HCLK_DIV16                   RCC_CFGR_PPRE1_DIV16

#define RCC_SYSCLK_DIV1                  RCC_CFGR_HPRE_DIV1
#define RCC_PLLP_DIV4                  ((uint32_t)0x00000004)

#define FLASH_LATENCY_3                FLASH_ACR_LATENCY_3WS   /*!< FLASH Three Latency cycles    */
#define ACR_BYTE0_ADDRESS           ((uint32_t)0x40023C00) 
#define __HAL_FLASH_SET_LATENCY(__LATENCY__) (*(__IO uint8_t *)ACR_BYTE0_ADDRESS = (uint8_t)(__LATENCY__))

/** @brief  Check RCC flag is set or not.
  * @param  __FLAG__: specifies the flag to check.
  *         This parameter can be one of the following values:
  *            @arg RCC_FLAG_HSIRDY: HSI oscillator clock ready.
  *            @arg RCC_FLAG_HSERDY: HSE oscillator clock ready.
  *            @arg RCC_FLAG_PLLRDY: Main PLL clock ready.
  *            @arg RCC_FLAG_PLLI2SRDY: PLLI2S clock ready.
  *            @arg RCC_FLAG_LSERDY: LSE oscillator clock ready.
  *            @arg RCC_FLAG_LSIRDY: LSI oscillator clock ready.
  *            @arg RCC_FLAG_BORRST: POR/PDR or BOR reset.
  *            @arg RCC_FLAG_PINRST: Pin reset.
  *            @arg RCC_FLAG_PORRST: POR/PDR reset.
  *            @arg RCC_FLAG_SFTRST: Software reset.
  *            @arg RCC_FLAG_IWDGRST: Independent Watchdog reset.
  *            @arg RCC_FLAG_WWDGRST: Window Watchdog reset.
  *            @arg RCC_FLAG_LPWRRST: Low Power reset.
  * @retval The new state of __FLAG__ (TRUE or FALSE).
  */
#define RCC_FLAG_MASK  ((uint8_t)0x1F)
#define __HAL_RCC_GET_FLAG(__FLAG__) (((((((__FLAG__) >> 5) == 1)? RCC->CR :((((__FLAG__) >> 5) == 2) ? RCC->BDCR :((((__FLAG__) >> 5) == 3)? RCC->CSR :RCC->CIR))) & ((uint32_t)1 << ((__FLAG__) & RCC_FLAG_MASK)))!= 0)? 1 : 0)

#define RCC_CR_BYTE2_ADDRESS       ((uint32_t)0x40023802)
#define __HAL_RCC_HSE_CONFIG(__STATE__) (*(__IO uint8_t *) RCC_CR_BYTE2_ADDRESS = (__STATE__))
#define __HAL_RCC_HSI_CALIBRATIONVALUE_ADJUST(__HSICalibrationValue__) (MODIFY_REG(RCC->CR, RCC_CR_HSITRIM, (uint32_t)(__HSICalibrationValue__) << POSITION_VAL(RCC_CR_HSITRIM)))

#define RCC_OFFSET                 (RCC_BASE - PERIPH_BASE)
#define RCC_CR_OFFSET              (RCC_OFFSET + 0x00)
#define RCC_HSION_BIT_NUMBER       0x00
#define RCC_CR_HSION_BB            (PERIPH_BB_BASE + (RCC_CR_OFFSET * 32) + (RCC_HSION_BIT_NUMBER * 4))
#define RCC_CSR_OFFSET             (RCC_OFFSET + 0x74)
#define RCC_LSION_BIT_NUMBER        0x00
#define RCC_CSR_LSION_BB           (PERIPH_BB_BASE + (RCC_CSR_OFFSET * 32) + (RCC_LSION_BIT_NUMBER * 4))
#define RCC_BDCR_OFFSET            (RCC_OFFSET + 0x70)
#define RCC_BDCR_BYTE0_ADDRESS     (PERIPH_BASE + RCC_BDCR_OFFSET)
#define RCC_PLLON_BIT_NUMBER       0x18
#define RCC_CR_PLLON_BB            (PERIPH_BB_BASE + (RCC_CR_OFFSET * 32) + (RCC_PLLON_BIT_NUMBER * 4))
#define __HAL_RCC_HSI_ENABLE() (*(__IO uint32_t *) RCC_CR_HSION_BB = ENABLE)
#define __HAL_RCC_HSI_DISABLE() (*(__IO uint32_t *) RCC_CR_HSION_BB = DISABLE)
#define __HAL_RCC_PLL_ENABLE() (*(__IO uint32_t *) RCC_CR_PLLON_BB = ENABLE)
#define __HAL_RCC_PLL_DISABLE() (*(__IO uint32_t *) RCC_CR_PLLON_BB = DISABLE)
#define __HAL_RCC_LSI_ENABLE() (*(__IO uint32_t *) RCC_CSR_LSION_BB = ENABLE)
#define __HAL_RCC_LSI_DISABLE() (*(__IO uint32_t *) RCC_CSR_LSION_BB = DISABLE)

#define __HAL_RCC_SYSCLK_CONFIG(__RCC_SYSCLKSOURCE__) MODIFY_REG(RCC->CFGR, RCC_CFGR_SW, (__RCC_SYSCLKSOURCE__))
#define __HAL_RCC_LSE_CONFIG(__STATE__)  (*(__IO uint8_t *) RCC_BDCR_BYTE0_ADDRESS = (__STATE__))




#define GPIO_PIN_0                 ((uint16_t)0x0001)  /* Pin 0 selected    */
#define GPIO_PIN_1                 ((uint16_t)0x0002)  /* Pin 1 selected    */
#define GPIO_PIN_2                 ((uint16_t)0x0004)  /* Pin 2 selected    */
#define GPIO_PIN_3                 ((uint16_t)0x0008)  /* Pin 3 selected    */
#define GPIO_PIN_4                 ((uint16_t)0x0010)  /* Pin 4 selected    */
#define GPIO_PIN_5                 ((uint16_t)0x0020)  /* Pin 5 selected    */
#define GPIO_PIN_6                 ((uint16_t)0x0040)  /* Pin 6 selected    */
#define GPIO_PIN_7                 ((uint16_t)0x0080)  /* Pin 7 selected    */
#define GPIO_PIN_8                 ((uint16_t)0x0100)  /* Pin 8 selected    */
#define GPIO_PIN_9                 ((uint16_t)0x0200)  /* Pin 9 selected    */
#define GPIO_PIN_10                ((uint16_t)0x0400)  /* Pin 10 selected   */
#define GPIO_PIN_11                ((uint16_t)0x0800)  /* Pin 11 selected   */
#define GPIO_PIN_12                ((uint16_t)0x1000)  /* Pin 12 selected   */
#define GPIO_PIN_13                ((uint16_t)0x2000)  /* Pin 13 selected   */
#define GPIO_PIN_14                ((uint16_t)0x4000)  /* Pin 14 selected   */
#define GPIO_PIN_15                ((uint16_t)0x8000)  /* Pin 15 selected   */
#define GPIO_PIN_All               ((uint16_t)0xFFFF)  /* All pins selected */

#define GPIO_NOPULL        ((uint32_t)0x00000000)   /*!< No Pull-up or Pull-down activation  */
#define GPIO_PULLUP        ((uint32_t)0x00000001)   /*!< Pull-up activation                  */
#define GPIO_PULLDOWN      ((uint32_t)0x00000002)   /*!< Pull-down activation                */
#define GPIO_SPEED_LOW     ((uint32_t)0x00000000)  /*!< IO works at 2 MHz, please refer to the product datasheet */
#define GPIO_SPEED_MEDIUM  ((uint32_t)0x00000001)  /*!< range 12,5 MHz to 50 MHz, please refer to the product datasheet */
#define GPIO_SPEED_FAST    ((uint32_t)0x00000002)  /*!< range 25 MHz to 100 MHz, please refer to the product datasheet  */

#define GPIO_MODE_INPUT                        ((uint32_t)0x00000000)   /*!< Input Floating Mode                   */
#define GPIO_MODE_OUTPUT_PP                    ((uint32_t)0x00000001)   /*!< Output Push Pull Mode                 */
#define GPIO_MODE_OUTPUT_OD                    ((uint32_t)0x00000011)   /*!< Output Open Drain Mode                */
#define GPIO_MODE_AF_PP                        ((uint32_t)0x00000002)   /*!< Alternate Function Push Pull Mode     */
#define GPIO_MODE_AF_OD                        ((uint32_t)0x00000012)   /*!< Alternate Function Open Drain Mode    */
#define GPIO_MODE_ANALOG                       ((uint32_t)0x00000003)   /*!< Analog Mode  */
    
#define GPIO_MODE        ((uint32_t)0x00000003)
#define EXTI_MODE        ((uint32_t)0x10000000)
#define GPIO_MODE_IT     ((uint32_t)0x00010000)
#define GPIO_MODE_EVT    ((uint32_t)0x00020000)
#define RISING_EDGE      ((uint32_t)0x00100000)
#define FALLING_EDGE     ((uint32_t)0x00200000)
#define GPIO_OUTPUT_TYPE ((uint32_t)0x00000010)

#define GPIO_NUMBER    ((uint32_t)16)


#define GPIO_GET_INDEX(__GPIOx__)    (uint8_t)(((__GPIOx__) == (GPIOA))? 0U :\
                                               ((__GPIOx__) == (GPIOB))? 1U :\
                                               ((__GPIOx__) == (GPIOC))? 2U :\
                                               ((__GPIOx__) == (GPIOD))? 3U :\
                                               ((__GPIOx__) == (GPIOE))? 4U : 5U)

typedef struct
{
  uint32_t Pin;       /*!< Specifies the GPIO pins to be configured.
                           This parameter can be any value of @ref GPIO_pins_define */
  uint32_t Mode;      /*!< Specifies the operating mode for the selected pins.
                           This parameter can be a value of @ref GPIO_mode_define */
  uint32_t Pull;      /*!< Specifies the Pull-up or Pull-Down activation for the selected pins.
                           This parameter can be a value of @ref GPIO_pull_define */
  uint32_t Speed;     /*!< Specifies the speed for the selected pins.
                           This parameter can be a value of @ref GPIO_speed_define */
  uint32_t Alternate;  /*!< Peripheral to be connected to the selected pins. 
                            This parameter can be a value of @ref GPIO_Alternate_function_selection */
}GPIO_InitTypeDef;

#if defined NUCLEO
void SystemClock_Config(void);
void STM_ClockConfig(RCC_ClkInitTypeDef  *RCC_ClkInitStruct, uint32_t FLatency);
void STM_OscConfig(RCC_OscInitTypeDef  *RCC_OscInitStruct);
#endif

//#warning I CAN NOT GET THIS TO SEE GPIO_TypeDef defined in stm32f411xe.h
// but it does see it in system_stm32f4xx.c
//#include "stm32f411xe.h"
//void STM_GPIO_Init(GPIO_TypeDef  *GPIOx, GPIO_InitTypeDef *GPIO_Init);
int WriteFlash (unsigned int flash_addr, unsigned int data_addr, unsigned int blksize);

/*----------------------------------------------------------------------------
  Define clocks
 *----------------------------------------------------------------------------*/
#define XTAL        (12000000UL)        /* Oscillator frequency               */
#define OSC_CLK     (      XTAL)        /* Main oscillator frequency          */
#define RTC_CLK     (   32768UL)        /* RTC oscillator frequency           */
#define IRC_OSC     (12000000UL)        /* Internal RC oscillator frequency   */
#define WDT_OSC		  (  500000UL)		/* Internal WDT oscillator frequency  */


typedef struct 
{
  uint32_t Channel;        /*!< The ADC channel to configure. 
                                This parameter can be a value of @ref ADC_channels */
  uint32_t Rank;           /*!< The rank in the regular group sequencer. 
                                This parameter must be a number between Min_Data = 1 and Max_Data = 16 */
  uint32_t SamplingTime;   /*!< The sample time value to be set for the selected channel.
                                This parameter can be a value of @ref ADC_sampling_times */
  uint32_t Offset;         /*!< Reserved for future use, can be set to 0 */
}ADC_ChannelConfTypeDef;

/** @defgroup ADC_flags_definition ADC Flags Definition
  * @{
  */ 
#define ADC_FLAG_AWD    ((uint32_t)ADC_SR_AWD)
#define ADC_FLAG_EOC    ((uint32_t)ADC_SR_EOC)
#define ADC_FLAG_JEOC   ((uint32_t)ADC_SR_JEOC)
#define ADC_FLAG_JSTRT  ((uint32_t)ADC_SR_JSTRT)
#define ADC_FLAG_STRT   ((uint32_t)ADC_SR_STRT)
#define ADC_FLAG_OVR    ((uint32_t)ADC_SR_OVR)

#define ADC_SQR1(_NbrOfConversion_) (((_NbrOfConversion_) - (uint8_t)1) << 20)
#define ADC_SMPR1(_SAMPLETIME_, _CHANNELNB_) ((_SAMPLETIME_) << (3 * (((uint32_t)((uint16_t)(_CHANNELNB_))) - 10)))
#define ADC_SMPR2(_SAMPLETIME_, _CHANNELNB_) ((_SAMPLETIME_) << (3 * ((uint32_t)((uint16_t)(_CHANNELNB_)))))
#define ADC_SQR3_RK(_CHANNELNB_, _RANKNB_) (((uint32_t)((uint16_t)(_CHANNELNB_))) << (5 * ((_RANKNB_) - 1)))
#define ADC_SQR2_RK(_CHANNELNB_, _RANKNB_) (((uint32_t)((uint16_t)(_CHANNELNB_))) << (5 * ((_RANKNB_) - 7)))
#define ADC_SQR1_RK(_CHANNELNB_, _RANKNB_) (((uint32_t)((uint16_t)(_CHANNELNB_))) << (5 * ((_RANKNB_) - 13)))

// left for possible future need
//void ADC_ConfigChannel(ADC_ChannelConfTypeDef* sConfig);
int AD(int channel);
void initAD(void);



/*
//-------- <<< end of configuration section >>> ------------------------------
*/
#endif	//#ifndef GCC_ASM_STEP


#ifdef __cplusplus
}
#endif

#endif /* __SYSTEM_STM32F411_H */
