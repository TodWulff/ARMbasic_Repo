 
''/****************************************************************************************************/'/**
' * @file     LPC43xx.bas -- derived from LPC43xx.h
' *
' * @status   EXPERIMENTAL
' *
' * @brief    CMSIS Cortex-M4 Core Peripheral Access Layer Header File for
' *           default LPC43xx Device Series
' *
' * @version  V0.10
' * @date     10. June 2011
' *
' * @note     Generated with SFDGen V2.6 Build 4f  on Friday, 10.06.2011 14:32:01
' *
' *
' *******************************************************************************************************/

#ifndef __LPC43XX_A_H__
#define __LPC43XX_A_H__

''// -------------------------  Cortex-M4 Processor Exceptions Numbers  -----------------------------
#define  Reset_ISR                        *&H10000004  ''/*!<   1  Reset Vector, invoked on Power up and warm reset */
#define  NonMaskableInt_ISR               *&H10000008  ''/*!<   2  Non maskable Interrupt, cannot be stopped or preempted */
#define  HardFault_ISR                    *&H1000000C  ''/*!<   3  Hard Fault, all classes of Fault */
#define  MemoryManagement_ISR             *&H10000010  ''/*!<   4  Memory Management, MPU mismatch, including Access Violation and No Match */
#define  BusFault_ISR                     *&H10000014  ''/*!<   5  Bus Fault, Pre-Fetch-, Memory Access Fault, other address/memory related Fault */
#define  UsageFault_ISR                   *&H10000018  ''/*!<   6  Usage Fault, i.e. Undef Instruction, Illegal State Transition */
#define  SVCall_ISR                       *&H1000002C  ''/*!<  11  System Service Call via SVC instruction */
#define  DebugMonitor_ISR                 *&H10000030  ''/*!<  12  Debug Monitor                  '  */
#define  PendSV_ISR                       *&H10000038  ''/*!<  14  Pendable request for system service */
#define  SYSTICK_ISR                      *&H1000003C  ''/*!<  15  System Tick Timer              '  */
''// ---------------------------  LPC43xx Specific Interrupt Numbers  -------------------------------
#define  DAC_ISR                          *&H10000040   ''/*!<   0  DAC                            '  */
#define  M0_ISR                           *&H10000044   ''/*!<   1  M0                             '  */
#define  DMA_ISR                          *&H10000048   ''/*!<   2  DMA                            '  */
#define  RESERVED0_ISR                    *&H1000004C   '
#define  RESERVED1_ISR                    *&H10000050   '
#define  ETH_ISR                          *&H10000054   ''/*!<   5  ETHERNET                       '  */
#define  SDIO_ISR                         *&H10000058   ''/*!<   6  SDIO                           '  */
#define  LCD_ISR                          *&H1000005C   ''/*!<   7  LCD                            '  */
#define  USB0_ISR                         *&H10000060   ''/*!<   8  USB0                           '  */
#define  USB1_ISR                         *&H10000064   ''/*!<   9  USB1                           '  */
#define  SCT_ISR                          *&H10000068   ''/*!<  10  SCT                            '  */
#define  RITIMER_ISR                      *&H1000006C   ''/*!<  11  RITIMER                        '  */
#define  TIMER0_ISR                       *&H10000070   ''/*!<  12  TIMER0                         '  */
#define  TIMER1_ISR                       *&H10000074   ''/*!<  13  TIMER1_INT                     '  */
#define  TIMER2_ISR                       *&H10000078   ''/*!<  14  TIMER2_INT                     '  */
#define  TIMER3_ISR                       *&H1000007C   ''/*!<  15  TIMER3_INT                     '  */
#define  MCPWM_ISR                        *&H10000080   ''/*!<  16  MCPWM                          '  */
#define  ADC0_ISR                         *&H10000084   ''/*!<  17  ADC0                           '  */
#define  I2C0_ISR                         *&H10000088   ''/*!<  18  I2C0                           '  */
#define  I2C1_ISR                         *&H1000008C   ''/*!<  19  I2C1                           '  */
#define  SPI_ISR                          *&H10000090   ''/*!<  20  SPI                            '  */
#define  ADC1_ISR                         *&H10000094   ''/*!<  21  ADC1                           '  */
#define  SSP0_ISR                         *&H10000098   ''/*!<  22  SSP0                           '  */
#define  SSP1_ISR                         *&H1000009C   ''/*!<  23  SSP1                           '  */
#define  USART0_ISR                       *&H100000A0   ''/*!<  24  USART0                         '  */
#define  UART1_ISR                        *&H100000A4   ''/*!<  25  UART1                          '  */
#define  USART2_ISR                       *&H100000A8   ''/*!<  26  USART2                         '  */
#define  USART3_ISR                       *&H100000AC   ''/*!<  27  USART3                         '  */
#define  I2S0_ISR                         *&H100000B0   ''/*!<  28  I2S0                           '  */
#define  I2S1_ISR                         *&H100000B4   ''/*!<  29  I2S1                           '  */
#define  SPIFI_ISR                        *&H100000B8   ''/*!<  30  SPIFI                          '  */
#define  SGPIO_ISR                        *&H100000BC   ''/*!<  31  SGPIO                          '  */
#define  PIN_INT0_ISR                     *&H100000C0   ''/*!<  32  PIN_INT0                       '  */
#define  PIN_INT1_ISR                     *&H100000C4   ''/*!<  33  PIN_INT1                       '  */
#define  PIN_INT2_ISR                     *&H100000C8   ''/*!<  34  PIN_INT2                       '  */
#define  PIN_INT3_ISR                     *&H100000CC   ''/*!<  35  PIN_INT3                       '  */
#define  PIN_INT4_ISR                     *&H100000D0   ''/*!<  36  PIN_INT4                       '  */
#define  PIN_INT5_ISR                     *&H100000D4   ''/*!<  37  PIN_INT5                       '  */
#define  PIN_INT6_ISR                     *&H100000D8   ''/*!<  38  PIN_INT6                       '  */
#define  PIN_INT7_ISR                     *&H100000DC   ''/*!<  39  PIN_INT7                       '  */
#define  GINT0_ISR                        *&H100000E0   ''/*!<  40  GINT0                          '  */
#define  GINT1_ISR                        *&H100000E4   ''/*!<  41  GINT1                          '  */
#define  EVENTROUTER_INT_ISR              *&H100000E8   ''/*!<  42  EVENTROUTER_INT                '  */
#define  C_CAN1_ISR                       *&H100000EC   ''/*!<  43  C_CAN1                         '  */
#define  RESERVED3_ISR                    *&H100000F0   '
#define  VADC_ISR                         *&H100000F4   ''/*!<  45  VADC                           '  */
#define  ATIMER_ISR                       *&H100000F8   ''/*!<  46  ATIMER                         '  */
#define  RTC_ISR                          *&H100000FC   ''/*!<  47  RTC                            '  */
#define  RESERVED4_ISR                    *&H10000100   '
#define  WWDT_ISR                         *&H10000104   ''/*!<  49  WDT                            '  */
#define  RESERVED5_ISR                    *&H10000108   '
#define  C_CAN0_ISR                       *&H1000010C   ''/*!<  51  C_CAN0                         '  */
#define  QEI_ISR                          *&H10000110   ''/*!<  52  QEI                            '  */

#define UART0_ISR USART0_ISR


' '/* Event Router Input (ERI) Number Definitions */
''typedef enum '{
#define  WAKEUP0_ERIn                       0
#define  WAKEUP1_ERIn                       1
#define  WAKEUP2_ERIn                       2
#define  WAKEUP3_ERIn                       3
#define  ATIMER_ERIn                        4
#define  RTC_ERIn                           5
#define  BOD1_ERIn                          6  '/* Bod trip 1 */
#define  WWDT_ERIn                          7
#define  ETH_ERIn                           8
#define  USB0_ERIn                          9
#define  USB1_ERIn                          10
#define  SDIO_ERIn                          11
#define  CAN_ERIn                           12 '/* CAN0/1 or'ed */
#define  TIM2_ERIn                          13
#define  TIM6_ERIn                          14
#define  QEI_ERIn                           15
#define  TIM14_ERIn                         16
#define  RESERVED1_ERI                      17 
#define  M4_ERIn                            18 '/* M4 */ 
#define  RESET_ERIn                         19
#define  BOD2_ERIn                          20 '/* Bod trip 2 */
#define  PMC_ERIn                           21 '/* Vd1_rst_req */
#define  REG_VD1_OK_ERIn                    22
#define  REG_VD2_OK_ERIn                    23
#define  REG_VD3_OK_ERIn                    24
#define  REG_VD8_OK_ERIn                    25
'}ERIn_Type


'/* Configuration of the Cortex-M4 Processor and Core Peripherals */

#if defined CORE_M0a || defined CORE_M0s
#define __CM0_REV              &H0101       '/*!< Cortex-M0 Core Revision             '  */
#define __MPU_PRESENT             0         '/*!< MPU present or not                  '  */
#define __NVIC_PRIO_BITS          2         '/*!< Number of Bits used for Priority Levels */
#define __Vendor_SysTickConfig    0         '/*!< Set to 1 if different SysTick Config is used */
#endif

#if defined CORE_M4 || defined LPC43xx
#define __CM4_REV              &H0001       '/*!< Cortex-M4 Core Revision             '  */
#define __MPU_PRESENT             0         '/*!< MPU present or not                  '  */
#define __NVIC_PRIO_BITS          3         '/*!< Number of Bits used for Priority Levels */
#define __Vendor_SysTickConfig    0         '/*!< Set to 1 if different SysTick Config is used */
#endif

'/** @} */ '/* End of group Configuration_of_CMSIS */



'// ------------------------------------------------------------------------------------------------
'// -----                                          SCT                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx State Configurable Timer (SCT) Modification date=1/18/2011 Major revision=0 Minor revision=7  (SCT)
'  */

#define CONFIG_SCT_nEV   (16)            '/* Number of events */
#define CONFIG_SCT_nRG   (16)            '/* Number of match/compare registers */
#define CONFIG_SCT_nOU   (16)            '/* Number of outputs */

'typedef struct
'{
    '__IO  uint32_t CONFIG              '/* &H000 Configuration Register */
    ''union '{
        '__IO uint32_t CTRL_U           '/* &H004 Control Register */
        'struct '{
            '__IO uint16_t CTRL_L       '/* &H004 low control register */
            '__IO uint16_t CTRL_H       '/* &H006 high control register */
        '}
    '}
    '__IO uint16_t LIMIT_L              '/* &H008 limit register for counter L */
    '__IO uint16_t LIMIT_H              '/* &H00A limit register for counter H */
    '__IO uint16_t HALT_L               '/* &H00C halt register for counter L */
    '__IO uint16_t HALT_H               '/* &H00E halt register for counter H */
    '__IO uint16_t STOP_L               '/* &H010 stop register for counter L */
    '__IO uint16_t STOP_H               '/* &H012 stop register for counter H */
    '__IO uint16_t START_L              '/* &H014 start register for counter L */
    '__IO uint16_t START_H              '/* &H016 start register for counter H */
    ''union '{
        '__IO uint32_t COUNT_U          '/* &H040 counter register */
        'struct '{
            '__IO uint16_t COUNT_L      '/* &H040 counter register for counter L */
            '__IO uint16_t COUNT_H      '/* &H042 counter register for counter H */
        '}
    '}
    '__IO uint16_t STATE_L              '/* &H044 state register for counter L */
    '__IO uint16_t STATE_H              '/* &H046 state register for counter H */
    '__I  uint32_t INPUT                '/* &H048 input register */
    '__IO uint16_t REGMODE_L            '/* &H04C match - capture registers mode register L */
    '__IO uint16_t REGMODE_H            '/* &H04E match - capture registers mode register H */
    '__IO uint32_t OUTPUT               '/* &H050 output register */
    '__IO uint32_t OUTPUTDIRCTRL        '/* &H054 Output counter direction Control Register */
    '__IO uint32_t RES                  '/* &H058 conflict resolution register */
    '__IO uint32_t DMA0REQUEST          '/* &H05C DMA0 Request Register */
    '__IO uint32_t DMA1REQUEST          '/* &H060 DMA1 Request Register */
    '__IO uint32_t EVEN                 '/* &H0F0 event enable register */
    '__IO uint32_t EVFLAG               '/* &H0F4 event flag register */
    '__IO uint32_t CONEN                '/* &H0F8 conflict enable register */
    '__IO uint32_t CONFLAG              '/* &H0FC conflict flag register */

    ''union '{
        '__IO 'union '{                    '/* &H100-... Match / Capture value */
            'uint32_t U                 '/*       SCTMATCH[i].U  Unified 32-bit register */
            'struct '{
                'uint16_t L             '/*       SCTMATCH[i].L  Access to L value */
                'uint16_t H             '/*       SCTMATCH[i].H  Access to H value */
            '}
        '} MATCH[CONFIG_SCT_nRG]
        '__I 'union '{
            'uint32_t U                 '/*       SCTCAP[i].U  Unified 32-bit register */
            'struct '{
                'uint16_t L             '/*       SCTCAP[i].L  Access to H value */
                'uint16_t H             '/*       SCTCAP[i].H  Access to H value */
            '}
        '} CAP[CONFIG_SCT_nRG]
    '}


    ''union '{
        '__IO uint16_t MATCH_L[CONFIG_SCT_nRG]       '/* &H180-... Match Value L counter */
        '__I  uint16_t CAP_L[CONFIG_SCT_nRG]         '/* &H180-... Capture Value L counter */
    '}
    ''union '{
        '__IO uint16_t MATCH_H[CONFIG_SCT_nRG]       '/* &H1C0-... Match Value H counter */
        '__I  uint16_t CAP_H[CONFIG_SCT_nRG]         '/* &H1C0-... Capture Value H counter */
    '}

    ''union '{
        '__IO 'union '{                    '/* &H200-... Match Reload / Capture Control value */
     '       uint32_t U                 '/*       SCTMATCHREL[i].U  Unified 32-bit register */
      '      struct '{
       '         uint16_t L             '/*       SCTMATCHREL[i].L  Access to L value */
        '        uint16_t H             '/*       SCTMATCHREL[i].H  Access to H value */
         '   }
        '} MATCHREL[CONFIG_SCT_nRG]
        '__IO 'union '{
         '   uint32_t U                 '/*       SCTCAPCTRL[i].U  Unified 32-bit register */
          '  struct '{
           '     uint16_t L             '/*       SCTCAPCTRL[i].L  Access to H value */
            '    uint16_t H             '/*       SCTCAPCTRL[i].H  Access to H value */
            '}
        '} CAPCTRL[CONFIG_SCT_nRG]
    '}


    ''union '{
        '__IO uint16_t MATCHREL_L[CONFIG_SCT_nRG]    '/* &H280-... Match Reload value L counter */
        '__IO uint16_t CAPCTRL_L[CONFIG_SCT_nRG]     '/* &H280-... Capture Control value L counter */
    '}
    ''union '{
        '__IO uint16_t MATCHREL_H[CONFIG_SCT_nRG]    '/* &H2C0-... Match Reload value H counter */
        '__IO uint16_t CAPCTRL_H[CONFIG_SCT_nRG]     '/* &H2C0-... Capture Control value H counter */
    '}

    '__IO struct '{                       '/* &H300-&H3FC  SCTEVENT[i].STATE / SCTEVENT[i].CTRL*/
    '    uint32_t STATE                 '/* Event State Register */
    '    uint32_t CTRL                  '/* Event Control Register */
    '} EVENT[CONFIG_SCT_nEV]


    '__IO struct '{                       '/* &H500-&H57C  SCTOUT[i].SET / SCTOUT[i].CLR */
    '    uint32_t SET                   '/* Output n Set Register */
    '    uint32_t CLR                   '/* Output n Clear Register */
    '} OUT[CONFIG_SCT_nOU]


    '__I  uint32_t MODULECONTENT        '/* &H7FC Module Content */

'} LPC_SCT_Type

'// ------------------------------------------------------------------------------------------------
'// -----                                         GPDMA                                        -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx General Purpose DMA (GPDMA) controller Modification date=1/19/2011 Major revision=0 Minor revision=7  (GPDMA)
'  */

'typedef struct '{                            '/*!< (* &H40002000) GPDMA Structure      '  */
#define  DMA_INTSTAT           * &H40002000 'DMA Interrupt Status Register */
#define  DMA_INTTCSTAT         * &H40002004 'DMA Interrupt Terminal Count Request Status Register */
#define  DMA_INTTCCLEAR        * &H40002008 'DMA Interrupt Terminal Count Request Clear Register */
#define  DMA_INTERRSTAT        * &H4000200C 'DMA Interrupt Error Status Register */
#define  DMA_INTERRCLR         * &H40002010 'DMA Interrupt Error Clear Register */
#define  DMA_RAWINTTCSTAT      * &H40002014 'DMA Raw Interrupt Terminal Count Status Register */
#define  DMA_RAWINTERRSTAT     * &H40002018 'DMA Raw Error Interrupt Status Register */
#define  DMA_ENBLDCHNS         * &H4000201C 'DMA Enabled Channel Register */
#define  DMA_SOFTBREQ          * &H40002020 'DMA Software Burst Request Register */
#define  DMA_SOFTSREQ          * &H40002024 'DMA Software Single Request Register */
#define  DMA_SOFTLBREQ         * &H40002028 'DMA Software Last Burst Request Register */
#define  DMA_SOFTLSREQ         * &H4000202C 'DMA Software Last Single Request Register */
#define  DMA_CONFIG            * &H40002030 'DMA Configuration Register */
#define  DMA_SYNC              * &H40002034 'DMA Synchronization Register */

#define  DMA_C0SRCADDR         * &H40002100 'DMA Channel Source Address Register */
#define  DMA_C0DESTADDR        * &H40002104 'DMA Channel Destination Address Register */
#define  DMA_C0LLI             * &H40002108 'DMA Channel Linked List Item Register */
#define  DMA_C0CONTROL         * &H4000210C 'DMA Channel Control Register */
#define  DMA_C0CONFIG          * &H40002110 'DMA Channel Configuration Register */

#define  DMA_C1SRCADDR         * &H40002120 'DMA Channel Source Address Register */
#define  DMA_C1DESTADDR        * &H40002124 'DMA Channel Destination Address Register */
#define  DMA_C1LLI             * &H40002128 'DMA Channel Linked List Item Register */
#define  DMA_C1CONTROL         * &H4000212C 'DMA Channel Control Register */
#define  DMA_C1CONFIG          * &H40002130 'DMA Channel Configuration Register */

#define  DMA_C2SRCADDR         * &H40002140 'DMA Channel Source Address Register */
#define  DMA_C2DESTADDR        * &H40002144 'DMA Channel Destination Address Register */
#define  DMA_C2LLI             * &H40002148 'DMA Channel Linked List Item Register */
#define  DMA_C2CONTROL         * &H4000214C 'DMA Channel Control Register */
#define  DMA_C2CONFIG          * &H40002150 'DMA Channel Configuration Register */

#define  DMA_C3SRCADDR         * &H40002160 'DMA Channel Source Address Register */
#define  DMA_C3DESTADDR        * &H40002164 'DMA Channel Destination Address Register */
#define  DMA_C3LLI             * &H40002168 'DMA Channel Linked List Item Register */
#define  DMA_C3CONTROL         * &H4000216C 'DMA Channel Control Register */
#define  DMA_C3CONFIG          * &H40002170 'DMA Channel Configuration Register */

#define  DMA_C4SRCADDR         * &H40002180 'DMA Channel Source Address Register */
#define  DMA_C4DESTADDR        * &H40002184 'DMA Channel Destination Address Register */
#define  DMA_C4LLI             * &H40002188 'DMA Channel Linked List Item Register */
#define  DMA_C4CONTROL         * &H4000218C 'DMA Channel Control Register */
#define  DMA_C4CONFIG          * &H40002190 'DMA Channel Configuration Register */

#define  DMA_C5SRCADDR         * &H400021A0 'DMA Channel Source Address Register */
#define  DMA_C5DESTADDR        * &H400021A4 'DMA Channel Destination Address Register */
#define  DMA_C5LLI             * &H400021A8 'DMA Channel Linked List Item Register */
#define  DMA_C5CONTROL         * &H400021AC 'DMA Channel Control Register */
#define  DMA_C5CONFIG          * &H400021B0 'DMA Channel Configuration Register */

#define  DMA_C6SRCADDR         * &H400021C0 'DMA Channel Source Address Register */
#define  DMA_C6DESTADDR        * &H400021C4 'DMA Channel Destination Address Register */
#define  DMA_C6LLI             * &H400021C8 'DMA Channel Linked List Item Register */
#define  DMA_C6CONTROL         * &H400021CC 'DMA Channel Control Register */
#define  DMA_C6CONFIG          * &H400021D0 'DMA Channel Configuration Register */

#define  DMA_C7SRCADDR         * &H400021E0 'DMA Channel Source Address Register */
#define  DMA_C7DESTADDR        * &H400021E4 'DMA Channel Destination Address Register */
#define  DMA_C7LLI             * &H400021E8 'DMA Channel Linked List Item Register */
#define  DMA_C7CONTROL         * &H400021EC 'DMA Channel Control Register */
#define  DMA_C7CONFIG          * &H400021F0 'DMA Channel Configuration Register */
'} LPC_GPDMA_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         SPIFI                                        -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx SPI Flash Interface (SPIFI) Modification date=1/19/2011 Major revision=0 Minor revision=7  (SPIFI)
'  */

'typedef struct '{                            '/*!< (* &H40003000) SPIFI Structure      '  */
  '__IO uint32_t CTRL                       '/*!< (* &H40003000) SPIFI control register */
  '__IO uint32_t CMD                        '/*!< (* &H40003004) SPIFI command register */
  '__IO uint32_t ADDR                       '/*!< (* &H40003008) SPIFI address register */
  '__IO uint32_t DATINTM                    '/*!< (* &H4000300C) SPIFI intermediate data register */
  '__IO uint32_t ADDRINTM                   '/*!< (* &H40003010) SPIFI address and intermediate data register */
  '__IO uint32_t DAT                        '/*!< (* &H40003014) SPIFI data register  '  */
  '__IO uint32_t MEMCMD                     '/*!< (* &H40003018) SPIFI memory command register */
  '__IO uint32_t STAT                       '/*!< (* &H4000301C) SPIFI status register'  */
'} LPC_SPIFI_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         SDMMC                                        -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10462 Chapter title=LPC43xx SD/MMC Modification date=n/a Major revision=n/a Minor revision=n/a  (SDMMC)
'  */

'typedef struct '{                            '/*!< (* &H40004000) SDMMC Structure      '  */
  '__IO uint32_t CTRL                       '/*!< (* &H40004000) Control Register     '  */
  '__IO uint32_t PWREN                      '/*!< (* &H40004004) Power Enable Register'  */
  '__IO uint32_t CLKDIV                     '/*!< (* &H40004008) Clock Divider Register */
  '__IO uint32_t CLKSRC                     '/*!< (* &H4000400C) SD Clock Source Register */
  '__IO uint32_t CLKENA                     '/*!< (* &H40004010) Clock Enable Register'  */
  '__IO uint32_t TMOUT                      '/*!< (* &H40004014) Timeout Register     '  */
  '__IO uint32_t CTYPE                      '/*!< (* &H40004018) Card Type Register   '  */
  '__IO uint32_t BLKSIZ                     '/*!< (* &H4000401C) Block Size Register  '  */
  '__IO uint32_t BYTCNT                     '/*!< (* &H40004020) Byte Count Register  '  */
  '__IO uint32_t INTMASK                    '/*!< (* &H40004024) Interrupt Mask Register */
  '__IO uint32_t CMDARG                     '/*!< (* &H40004028) Command Argument Register */
  '__IO uint32_t CMD                        '/*!< (* &H4000402C) Command Register     '  */
  '__I  uint32_t RESP0                      '/*!< (* &H40004030) Response Register 0  '  */
  '__I  uint32_t RESP1                      '/*!< (* &H40004034) Response Register 1  '  */
  '__I  uint32_t RESP2                      '/*!< (* &H40004038) Response Register 2  '  */
  '__I  uint32_t RESP3                      '/*!< (* &H4000403C) Response Register 3  '  */
  '__I  uint32_t MINTSTS                    '/*!< (* &H40004040) Masked Interrupt Status Register */
  '__IO uint32_t RINTSTS                    '/*!< (* &H40004044) Raw Interrupt Status Register */
  '__I  uint32_t STATUS                     '/*!< (* &H40004048) Status Register      '  */
  '__IO uint32_t FIFOTH                     '/*!< (* &H4000404C) FIFO Threshold Watermark Register */
  '__I  uint32_t CDETECT                    '/*!< (* &H40004050) Card Detect Register '  */
  '__I  uint32_t WRTPRT                     '/*!< (* &H40004054) Write Protect Register */
  '__IO uint32_t GPIO                       '/*!< (* &H40004058) General Purpose Input/Output Register */
  '__I  uint32_t TCBCNT                     '/*!< (* &H4000405C) Transferred CIU Card Byte Count Register */
  '__I  uint32_t TBBCNT                     '/*!< (* &H40004060) Transferred Host to BIU-FIFO Byte Count Register */
  '__IO uint32_t DEBNCE                     '/*!< (* &H40004064) Debounce Count Register */
  '__IO uint32_t USRID                      '/*!< (* &H40004068) User ID Register     '  */
  '__I  uint32_t VERID                      '/*!< (* &H4000406C) Version ID Register  '  */
  '__I  uint32_t RESERVED0
  '__IO uint32_t UHS_REG                    '/*!< (* &H40004074) UHS-1 Register       '  */
  '__IO uint32_t RST_N                      '/*!< (* &H40004078) Hardware Reset       '  */
  '__I  uint32_t RESERVED1
  '__IO uint32_t BMOD                       '/*!< (* &H40004080) Bus Mode Register    '  */
  '__O  uint32_t PLDMND                     '/*!< (* &H40004084) Poll Demand Register '  */
  '__IO uint32_t DBADDR                     '/*!< (* &H40004088) Descriptor List Base Address Register */
  '__IO uint32_t IDSTS                      '/*!< (* &H4000408C) Internal DMAC Status Register */
  '__IO uint32_t IDINTEN                    '/*!< (* &H40004090) Internal DMAC Interrupt Enable Register */
  '__I  uint32_t DSCADDR                    '/*!< (* &H40004094) Current Host Descriptor Address Register */
  '__I  uint32_t BUFADDR                    '/*!< (* &H40004098) Current Buffer Descriptor Address Register */
'} LPC_SDMMC_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                          EMC                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx External Memory Controller (EMC) Modification date=1/19/2011 Major revision=0 Minor revision=7  (EMC)
'  */

'typedef struct '{                            '/*!< (* &H40005000) EMC Structure        '  */
  '__IO uint32_t CONTROL                    '/*!< (* &H40005000) Controls operation of the memory controller. */
  '__I  uint32_t STATUS                     '/*!< (* &H40005004) Provides EMC status information. */
  '__IO uint32_t CONFIG                     '/*!< (* &H40005008) Configures operation of the memory controller. */
  '__IO uint32_t DYNAMICCONTROL             '/*!< (* &H40005020) Controls dynamic memory operation. */
  '__IO uint32_t DYNAMICREFRESH             '/*!< (* &H40005024) Configures dynamic memory refresh operation. */
  '__IO uint32_t DYNAMICREADCONFIG          '/*!< (* &H40005028) Configures the dynamic memory read strategy. */
  '__I  uint32_t RESERVED1
  '__IO uint32_t DYNAMICRP                  '/*!< (* &H40005030) Selects the precharge command period. */
  '__IO uint32_t DYNAMICRAS                 '/*!< (* &H40005034) Selects the active to precharge command period. */
  '__IO uint32_t DYNAMICSREX                '/*!< (* &H40005038) Selects the self-refresh exit time. */
  '__IO uint32_t DYNAMICAPR                 '/*!< (* &H4000503C) Selects the last-data-out to active command time. */
  '__IO uint32_t DYNAMICDAL                 '/*!< (* &H40005040) Selects the data-in to active command time. */
  '__IO uint32_t DYNAMICWR                  '/*!< (* &H40005044) Selects the write recovery time. */
  '__IO uint32_t DYNAMICRC                  '/*!< (* &H40005048) Selects the active to active command period. */
  '__IO uint32_t DYNAMICRFC                 '/*!< (* &H4000504C) Selects the auto-refresh period. */
  '__IO uint32_t DYNAMICXSR                 '/*!< (* &H40005050) Selects the exit self-refresh to active command time. */
  '__IO uint32_t DYNAMICRRD                 '/*!< (* &H40005054) Selects the active bank A to active bank B latency. */
  '__IO uint32_t DYNAMICMRD                 '/*!< (* &H40005058) Selects the load mode register to active command time. */
  '__IO uint32_t STATICEXTENDEDWAIT         '/*!< (* &H40005080) Selects time for long static memory read and write transfers. */
  '__IO uint32_t DYNAMICCONFIG0             '/*!< (* &H40005100) Selects the configuration information for dynamic memory chip select n. */
  '__IO uint32_t DYNAMICRASCAS0             '/*!< (* &H40005104) Selects the RAS and CAS latencies for dynamic memory chip select n. */
  '__IO uint32_t DYNAMICCONFIG1             '/*!< (* &H40005120) Selects the configuration information for dynamic memory chip select n. */
  '__IO uint32_t DYNAMICRASCAS1             '/*!< (* &H40005124) Selects the RAS and CAS latencies for dynamic memory chip select n. */
  '__IO uint32_t DYNAMICCONFIG2             '/*!< (* &H40005140) Selects the configuration information for dynamic memory chip select n. */
  '__IO uint32_t DYNAMICRASCAS2             '/*!< (* &H40005144) Selects the RAS and CAS latencies for dynamic memory chip select n. */
  '__IO uint32_t DYNAMICCONFIG3             '/*!< (* &H40005160) Selects the configuration information for dynamic memory chip select n. */
  '__IO uint32_t DYNAMICRASCAS3             '/*!< (* &H40005164) Selects the RAS and CAS latencies for dynamic memory chip select n. */
  '__IO uint32_t STATICCONFIG0              '/*!< (* &H40005200) Selects the memory configuration for static chip select n. */
  '__IO uint32_t STATICWAITWEN0             '/*!< (* &H40005204) Selects the delay from chip select n to write enable. */
  '__IO uint32_t STATICWAITOEN0             '/*!< (* &H40005208) Selects the delay from chip select n or address change, whichever is later, to output enable. */
  '__IO uint32_t STATICWAITRD0              '/*!< (* &H4000520C) Selects the delay from chip select n to a read access. */
  '__IO uint32_t STATICWAITPAG0             '/*!< (* &H40005210) Selects the delay for asynchronous page mode sequential accesses for chip select n. */
  '__IO uint32_t STATICWAITWR0              '/*!< (* &H40005214) Selects the delay from chip select n to a write access. */
  '__IO uint32_t STATICWAITTURN0            '/*!< (* &H40005218) Selects bus turnaround cycles */
  '__IO uint32_t STATICCONFIG1              '/*!< (* &H40005220) Selects the memory configuration for static chip select n. */
  '__IO uint32_t STATICWAITWEN1             '/*!< (* &H40005224) Selects the delay from chip select n to write enable. */
  '__IO uint32_t STATICWAITOEN1             '/*!< (* &H40005228) Selects the delay from chip select n or address change, whichever is later, to output enable. */
  '__IO uint32_t STATICWAITRD1              '/*!< (* &H4000522C) Selects the delay from chip select n to a read access. */
  '__IO uint32_t STATICWAITPAG1             '/*!< (* &H40005230) Selects the delay for asynchronous page mode sequential accesses for chip select n. */
  '__IO uint32_t STATICWAITWR1              '/*!< (* &H40005234) Selects the delay from chip select n to a write access. */
  '__I  uint32_t STATICWAITTURN1            '/*!< (* &H40005238) read-write           '  */
  '__IO uint32_t STATICCONFIG2              '/*!< (* &H40005240) Selects the memory configuration for static chip select n. */
  '__IO uint32_t STATICWAITWEN2             '/*!< (* &H40005244) Selects the delay from chip select n to write enable. */
  '__IO uint32_t STATICWAITOEN2             '/*!< (* &H40005248) Selects the delay from chip select n or address change, whichever is later, to output enable. */
  '__IO uint32_t STATICWAITRD2              '/*!< (* &H4000524C) Selects the delay from chip select n to a read access. */
  '__IO uint32_t STATICWAITPAG2             '/*!< (* &H40005250) Selects the delay for asynchronous page mode sequential accesses for chip select n. */
  '__IO uint32_t STATICWAITWR2              '/*!< (* &H40005254) Selects the delay from chip select n to a write access. */
  '__I  uint32_t STATICWAITTURN2            '/*!< (* &H40005258) read-write           '  */
  '__IO uint32_t STATICCONFIG3              '/*!< (* &H40005260) Selects the memory configuration for static chip select n. */
  '__IO uint32_t STATICWAITWEN3             '/*!< (* &H40005264) Selects the delay from chip select n to write enable. */
  '__IO uint32_t STATICWAITOEN3             '/*!< (* &H40005268) Selects the delay from chip select n or address change, whichever is later, to output enable. */
  '__IO uint32_t STATICWAITRD3              '/*!< (* &H4000526C) Selects the delay from chip select n to a read access. */
  '__IO uint32_t STATICWAITPAG3             '/*!< (* &H40005270) Selects the delay for asynchronous page mode sequential accesses for chip select n. */
  '__IO uint32_t STATICWAITWR3              '/*!< (* &H40005274) Selects the delay from chip select n to a write access. */
  '__I  uint32_t STATICWAITTURN3            '/*!< (* &H40005278) read-write           '  */
'} LPC_EMC_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         USB0                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx USB0 Host/Device/OTG controller Modification date=1/19/2011 Major revision=0 Minor revision=7  (USB0)
'  */

'typedef struct '{                            '/*!< (* &H40006000) USB0 Structure       '  */
  '__I  uint32_t CAPLENGTH                  '/*!< (* &H40006100) Capability register length */
  '__I  uint32_t HCSPARAMS                  '/*!< (* &H40006104) Host controller structural parameters */
  '__I  uint32_t HCCPARAMS                  '/*!< (* &H40006108) Host controller capability parameters */
  '__I  uint32_t DCIVERSION                 '/*!< (* &H40006120) Device interface version number */
  
  'union '{
    '__IO uint32_t USBCMD_H                 '/*!< (* &H40006140) USB command (host mode) */
    '__IO uint32_t USBCMD_D                 '/*!< (* &H40006140) USB command (device mode) */
  '}
  
  'union '{
    '__IO uint32_t USBSTS_H                 '/*!< (* &H40006144) USB status (host mode) */
    '__IO uint32_t USBSTS_D                 '/*!< (* &H40006144) USB status (device mode) */
  '}
  
  'union '{
    '__IO uint32_t USBINTR_H                '/*!< (* &H40006148) USB interrupt enable (host mode) */
    '__IO uint32_t USBINTR_D                '/*!< (* &H40006148) USB interrupt enable (device mode) */
  '}
  
  'union '{
    '__IO uint32_t FRINDEX_H                '/*!< (* &H4000614C) USB frame index (host mode) */
    '__IO uint32_t FRINDEX_D                '/*!< (* &H4000614C) USB frame index (device mode) */
  '}
  
  'union '{
    '__IO uint32_t PERIODICLISTBASE         '/*!< (* &H40006154) Frame list base address (host mode) */
    '__IO uint32_t DEVICEADDR               '/*!< (* &H40006154) USB device address (device mode) */
  '}
  
  'union '{
    '__IO uint32_t ASYNCLISTADDR            '/*!< (* &H40006158) Address of endpoint list in memory */
    '__IO uint32_t ENDPOINTLISTADDR         '/*!< (* &H40006158) Address of endpoint list in memory */
  '}
  '__IO uint32_t TTCTRL                     '/*!< (* &H4000615C) Asynchronous buffer status for embedded TT (host mode) */
  '__IO uint32_t BURSTSIZE                  '/*!< (* &H40006160) Programmable burst size */
  '__IO uint32_t TXFILLTUNING               '/*!< (* &H40006164) Host transmit pre-buffer packet tuning (host mode) */
  '__IO uint32_t BINTERVAL                  '/*!< (* &H40006174) Length of virtual frame */
  '__IO uint32_t ENDPTNAK                   '/*!< (* &H40006178) Endpoint NAK (device mode) */
  '__IO uint32_t ENDPTNAKEN                 '/*!< (* &H4000617C) Endpoint NAK Enable (device mode) */
  
  'union '{
    '__IO uint32_t PORTSC1_H                '/*!< (* &H40006184) Port 1 status/control (host mode) */
    '__IO uint32_t PORTSC1_D                '/*!< (* &H40006184) Port 1 status/control (device mode) */
  '}
  '__IO uint32_t OTGSC                      '/*!< (* &H400061A4) OTG status and control */
  
  'union '{
    '__IO uint32_t USBMODE_H                '/*!< (* &H400061A8) USB mode (host mode) '  */
    '__IO uint32_t USBMODE_D                '/*!< (* &H400061A8) USB device mode (device mode) */
  '}
  '__IO uint32_t ENDPTSETUPSTAT             '/*!< (* &H400061AC) Endpoint setup status'  */
  '__IO uint32_t ENDPTPRIME                 '/*!< (* &H400061B0) Endpoint initialization */
  '__IO uint32_t ENDPTFLUSH                 '/*!< (* &H400061B4) Endpoint de-initialization */
  '__I  uint32_t ENDPTSTAT                  '/*!< (* &H400061B8) Endpoint status      '  */
  '__IO uint32_t ENDPTCOMPLETE              '/*!< (* &H400061BC) Endpoint complete    '  */
  '__IO uint32_t ENDPTCTRL0                 '/*!< (* &H400061C0) Endpoint control 0   '  */
  '__IO uint32_t ENDPTCTRL[5]               '/*!< (* &H400061C4) Endpoint control     '  */
'} LPC_USB0_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         USB1                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx USB1 Host/Device controller Modification date=1/19/2011 Major revision=0 Minor revision=7  (USB1)
'  */

'typedef struct '{                            '/*!< (* &H40007000) USB1 Structure       '  */
  '__I  uint32_t CAPLENGTH                  '/*!< (* &H40007100) Capability register length */
  '__I  uint32_t HCSPARAMS                  '/*!< (* &H40007104) Host controller structural parameters */
  '__I  uint32_t HCCPARAMS                  '/*!< (* &H40007108) Host controller capability parameters */
  '__I  uint32_t DCIVERSION                 '/*!< (* &H40007120) Device interface version number */
  
  'union '{
    '__IO uint32_t USBCMD_H                 '/*!< (* &H40007140) USB command (host mode) */
    '__IO uint32_t USBCMD_D                 '/*!< (* &H40007140) USB command (device mode) */
  '}
  
  'union '{
    '__IO uint32_t USBSTS_H                 '/*!< (* &H40007144) USB status (host mode) */
    '__IO uint32_t USBSTS_D                 '/*!< (* &H40007144) USB status (device mode) */
  '}
  
  'union '{
    '__IO uint32_t USBINTR_H                '/*!< (* &H40007148) USB interrupt enable (host mode) */
    '__IO uint32_t USBINTR_D                '/*!< (* &H40007148) USB interrupt enable (device mode) */
  '}
  
  'union '{
    '__IO uint32_t FRINDEX_H                '/*!< (* &H4000714C) USB frame index (host mode) */
    '__I  uint32_t FRINDEX_D                '/*!< (* &H4000714C) USB frame index (device mode) */
  '}
  
  'union '{
    '__IO uint32_t PERIODICLISTBASE         '/*!< (* &H40007154) Frame list base address */
    '__IO uint32_t DEVICEADDR               '/*!< (* &H40007154) USB device address   '  */
  '}
  
  'union '{
    '__IO uint32_t ASYNCLISTADDR            '/*!< (* &H40007158) Address of endpoint list in memory (host mode) */
    '__IO uint32_t ENDPOINTLISTADDR         '/*!< (* &H40007158) Address of endpoint list in memory (device mode) */
  '}
  '__IO uint32_t TTCTRL                     '/*!< (* &H4000715C) Asynchronous buffer status for embedded TT (host mode) */
  '__IO uint32_t BURSTSIZE                  '/*!< (* &H40007160) Programmable burst size */
  '__IO uint32_t TXFILLTUNING               '/*!< (* &H40007164) Host transmit pre-buffer packet tuning (host mode) */
  '__IO uint32_t ULPIVIEWPORT               '/*!< (* &H40007170) ULPI viewport        '  */
  '__IO uint32_t BINTERVAL                  '/*!< (* &H40007174) Length of virtual frame */
  '__IO uint32_t ENDPTNAK                   '/*!< (* &H40007178) Endpoint NAK (device mode) */
  '__IO uint32_t ENDPTNAKEN                 '/*!< (* &H4000717C) Endpoint NAK Enable (device mode) */
  
  'union '{
    '__IO uint32_t PORTSC1_H                '/*!< (* &H40007184) Port 1 status/control (host mode) */
    '__IO uint32_t PORTSC1_D                '/*!< (* &H40007184) Port 1 status/control (device mode) */
  '}
  
  'union '{
    '__IO uint32_t USBMODE_H                '/*!< (* &H400071A8) USB mode (host mode) '  */
    '__IO uint32_t USBMODE_D                '/*!< (* &H400071A8) USB mode (device mode) */
  '}
  '__IO uint32_t ENDPTSETUPSTAT             '/*!< (* &H400071AC) Endpoint setup status'  */
  '__IO uint32_t ENDPTPRIME                 '/*!< (* &H400071B0) Endpoint initialization */
  '__IO uint32_t ENDPTFLUSH                 '/*!< (* &H400071B4) Endpoint de-initialization */
  '__I  uint32_t ENDPTSTAT                  '/*!< (* &H400071B8) Endpoint status      '  */
  '__IO uint32_t ENDPTCOMPLETE              '/*!< (* &H400071BC) Endpoint complete    '  */
  '__IO uint32_t ENDPTCTRL0                 '/*!< (* &H400071C0) Endpoint control 0   '  */
  '__IO uint32_t ENDPTCTRL[3]               '/*!< (* &H400071C4) Endpoint control     '  */
'} LPC_USB1_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                          LCD                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx LCD Modification date=1/19/2011 Major revision=0 Minor revision=7  (LCD)
'  */

'typedef struct '{                            '/*!< (* &H40008000) LCD Structure        '  */
  '__IO uint32_t TIMH                       '/*!< (* &H40008000) Horizontal Timing Control register */
  '__IO uint32_t TIMV                       '/*!< (* &H40008004) Vertical Timing Control register */
  '__IO uint32_t POL                        '/*!< (* &H40008008) Clock and Signal Polarity Control register */
  '__IO uint32_t LE                         '/*!< (* &H4000800C) Line End Control register */
  '__IO uint32_t UPBASE                     '/*!< (* &H40008010) Upper Panel Frame Base Address register */
  '__IO uint32_t LPBASE                     '/*!< (* &H40008014) Lower Panel Frame Base Address register */
  '__IO uint32_t CTRL                       '/*!< (* &H40008018) LCD Control register '  */
  '__IO uint32_t INTMSK                     '/*!< (* &H4000801C) Interrupt Mask register */
  '__I  uint32_t INTRAW                     '/*!< (* &H40008020) Raw Interrupt Status register */
  '__I  uint32_t INTSTAT                    '/*!< (* &H40008024) Masked Interrupt Status register */
  '__O  uint32_t INTCLR                     '/*!< (* &H40008028) Interrupt Clear register */
  '__I  uint32_t UPCURR                     '/*!< (* &H4000802C) Upper Panel Current Address Value register */
  '__I  uint32_t LPCURR                     '/*!< (* &H40008030) Lower Panel Current Address Value register */
  '__IO uint32_t PAL[256]                   '/*!< (* &H40008200) 256x16-bit Color Palette registers */
  '__IO uint32_t CRSR_IMG[256]              '/*!< (* &H40008800) Cursor Image registers */
  '__IO uint32_t CRSR_CTRL                  '/*!< (* &H40008C00) Cursor Control register */
  '__IO uint32_t CRSR_CFG                   '/*!< (* &H40008C04) Cursor Configuration register */
  '__IO uint32_t CRSR_PAL0                  '/*!< (* &H40008C08) Cursor Palette register 0 */
  '__IO uint32_t CRSR_PAL1                  '/*!< (* &H40008C0C) Cursor Palette register 1 */
  '__IO uint32_t CRSR_XY                    '/*!< (* &H40008C10) Cursor XY Position register */
  '__IO uint32_t CRSR_CLIP                  '/*!< (* &H40008C14) Cursor Clip Position register */
  '__IO uint32_t CRSR_INTMSK                '/*!< (* &H40008C20) Cursor Interrupt Mask register */
  '__O  uint32_t CRSR_INTCLR                '/*!< (* &H40008C24) Cursor Interrupt Clear register */
  '__I  uint32_t CRSR_INTRAW                '/*!< (* &H40008C28) Cursor Raw Interrupt Status register */
  '__I  uint32_t CRSR_INTSTAT               '/*!< (* &H40008C2C) Cursor Masked Interrupt Status register */
'} LPC_LCD_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                       ETHERNET                                       -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Ethernet Modification date=1/20/2011 Major revision=0 Minor revision=7  (ETHERNET)
'  */

'typedef struct '{                            '/*!< (* &H40010000) ETHERNET Structure   '  */
  '__IO uint32_t MAC_CONFIG                 '/*!< (* &H40010000) MAC configuration register */
  '__IO uint32_t MAC_FRAME_FILTER           '/*!< (* &H40010004) MAC frame filter     '  */
  '__IO uint32_t MAC_HASHTABLE_HIGH         '/*!< (* &H40010008) Hash table high register */
  '__IO uint32_t MAC_HASHTABLE_LOW          '/*!< (* &H4001000C) Hash table low register */
  '__IO uint32_t MAC_MII_ADDR               '/*!< (* &H40010010) MII address register '  */
  '__IO uint32_t MAC_MII_DATA               '/*!< (* &H40010014) MII data register    '  */
  '__IO uint32_t MAC_FLOW_CTRL              '/*!< (* &H40010018) Flow control register'  */
  '__IO uint32_t MAC_VLAN_TAG               '/*!< (* &H4001001C) VLAN tag register    '  */
  '__IO uint32_t MAC_RWAKE_FRFLT            '/*!< (* &H40010028) Remote wake-up frame filter */
  '__IO uint32_t MAC_PMT_CTRL_STAT          '/*!< (* &H4001002C) PMT control and status */
  '__IO uint32_t MAC_INTR                   '/*!< (* &H40010038) Interrupt status register */
  '__IO uint32_t MAC_INTR_MASK              '/*!< (* &H4001003C) Interrupt mask register */
  '__IO uint32_t MAC_ADDR0_HIGH             '/*!< (* &H40010040) MAC address 0 high register */
  '__IO uint32_t MAC_ADDR0_LOW              '/*!< (* &H40010044) MAC address 0 low register */
  '__IO uint32_t MAC_TIMESTP_CTRL           '/*!< (* &H40010700) Time stamp control register */
  '__IO uint32_t DMA_BUS_MODE               '/*!< (* &H40011000) Bus Mode Register    '  */
  '__IO uint32_t DMA_TRANS_POLL_DEMAND      '/*!< (* &H40011004) Transmit poll demand register */
  '__IO uint32_t DMA_REC_POLL_DEMAND        '/*!< (* &H40011008) Receive poll demand register */
  '__IO uint32_t DMA_REC_DES_ADDR           '/*!< (* &H4001100C) Receive descriptor list address register */
  '__IO uint32_t DMA_TRANS_DES_ADDR         '/*!< (* &H40011010) Transmit descriptor list address register */
  '__IO uint32_t DMA_STAT                   '/*!< (* &H40011014) Status register      '  */
  '__IO uint32_t DMA_OP_MODE                '/*!< (* &H40011018) Operation mode register */
  '__IO uint32_t DMA_INT_EN                 '/*!< (* &H4001101C) Interrupt enable register */
  '__IO uint32_t DMA_MFRM_BUFOF             '/*!< (* &H40011020) Missed frame and buffer overflow register */
  '__IO uint32_t DMA_REC_INT_WDT            '/*!< (* &H40011024) Receive interrupt watchdog timer register */
  '__IO uint32_t DMA_CURHOST_TRANS_DES      '/*!< (* &H40011048) Current host transmit descriptor register */
  '__IO uint32_t DMA_CURHOST_REC_DES        '/*!< (* &H4001104C) Current host receive descriptor register */
  '__IO uint32_t DMA_CURHOST_TRANS_BUF      '/*!< (* &H40011050) Current host transmit buffer address register */
  '__IO uint32_t DMA_CURHOST_REC_BUF        '/*!< (* &H40011054) Current host receive buffer address register */
'} LPC_ETHERNET_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                        ATIMER                                        -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Alarm timer Modification date=1/7/2011 Major revision=0 Minor revision=6  (ATIMER)
'  */

'typedef struct '{                            '/*!< (* &H40040000) ATIMER Structure     '  */
  '__IO uint32_t DOWNCOUNTER                '/*!< (* &H40040000) Downcounter register '  */
  '__IO uint32_t PRESET                     '/*!< (* &H40040004) Preset value register'  */
  '__O  uint32_t CLR_EN                     '/*!< (* &H40040FD8) Interrupt clear enable register */
  '__O  uint32_t SET_EN                     '/*!< (* &H40040FDC) Interrupt set enable register */
  '__I  uint32_t STATUS                     '/*!< (* &H40040FE0) Status register      '  */
  '__I  uint32_t ENABLE                     '/*!< (* &H40040FE4) Enable register      '  */
  '__O  uint32_t CLR_STAT                   '/*!< (* &H40040FE8) Clear register       '  */
  '__O  uint32_t SET_STAT                   '/*!< (* &H40040FEC) Set register         '  */
'} LPC_ATIMER_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                        REGFILE                                       -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx rtc/REGFILE date=1/20/2011 Major revision=0 Minor revision=7  (REGFILE)
'  */

'typedef struct '{                            '/*!< (* &H40041000) REGFILE Structure    '  */
  '__IO uint32_t REGFILE[64]                '/*!< (* &H40041000) General purpose storage register */
'} LPC_REGFILE_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                          PMC                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Power Management Controller (PMC) Modification date=1/20/2011 Major revision=0 Minor revision=7  (PMC)
'  */

'typedef struct '{                            '/*!< (* &H40042000) PMC Structure        '  */
  '__IO uint32_t PD0_SLEEP0_HW_ENA          '/*!< (* &H40042000) Hardware sleep event enable register */
  '__IO uint32_t PD0_SLEEP0_HW_EDG_LVL      '/* &H008 */
  '__IO uint32_t PD0_SLEEP0_CONFIG          '/* &H018 */
  '__IO uint32_t PD0_SLEEP0_MODE            '/*!< (* &H4004201C) Sleep power mode register */
  '__IO uint32_t PD0_WAKE0_HW_ENA           '/* &H080 */
  '__IO uint32_t PD0_WAKE0_HW_EDG_LVL       '/* &H088 */
  '__IO uint32_t PD0_PSU_OPT                '/* &H198 */
  '__IO uint32_t PD0_PSU_DELAY              '/* &H1A4 */
  '__IO uint32_t PD0_POST_PSU_DELAY			'/* &H1AC */
'} LPC_PMC_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         CREG                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Configuration Registers (CREG) Modification date=1/20/2011 Major revision=0 Minor revision=7  (CREG)
'  */

'typedef struct '{                            '/*!< (* &H40043000) CREG Structure       '  */
  '__IO uint32_t IRCTRM                     '/*!< (* &H40043000) IRC trim register    '  */
  '__IO uint32_t CREG0                      '/*!< (* &H40043004) Chip configuration register 32 kHz oscillator output and BOD control register. */
  '__IO uint32_t PMUCON                     '/*!< (* &H40043008) Power mode control register. */
  '__IO uint32_t M4MEMMAP                   '/*!< (* &H40043100) ARM Cortex-M4 memory mapping */
  '__IO uint32_t CREG5                      '/*!< (* &H40043118) Chip configuration register 5. Controls JTAG access. */
  '__IO uint32_t DMAMUX                     '/*!< (* &H4004311C) DMA muxing control   '  */
  '__IO uint32_t ETBCFG                     '/*!< (* &H40043128) ETB RAM configuration'  */
  '__IO uint32_t CREG6                      '/*!< (* &H4004312C) tbd.                 '  */
  '__I  uint32_t CHIPID                     '/*!< (* &H40043200) Part ID              '  */
'} LPC_CREG_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                      EVENTROUTER                                     -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Event router Modification date=1/20/2011 Major revision=0 Minor revision=7  (EVENTROUTER)
'  */

'typedef struct '{                            '/*!< (* &H40044000) EVENTROUTER Structure'  */
  '__IO uint32_t HILO                       '/*!< (* &H40044000) Level configuration register */
  '__IO uint32_t EDGE                       '/*!< (* &H40044004) Edge configuration   '  */
  '__O  uint32_t CLR_EN                     '/*!< (* &H40044FD8) Event clear enable register */
  '__O  uint32_t SET_EN                     '/*!< (* &H40044FDC) Event set enable register */
  '__I  uint32_t STATUS                     '/*!< (* &H40044FE0) Status register      '  */
  '__I  uint32_t ENABLE                     '/*!< (* &H40044FE4) Enable register      '  */
  '__O  uint32_t CLR_STAT                   '/*!< (* &H40044FE8) Clear register       '  */
  '__O  uint32_t SET_STAT                   '/*!< (* &H40044FEC) Set register         '  */
'} LPC_EVENTROUTER_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                          RTC                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Real-Time Clock (RTC) Modification date=1/20/2011 Major revision=0 Minor revision=7  (RTC)
'  */

'typedef struct '{                            '/*!< (* &H40046000) RTC Structure        '  */
  '__O  uint32_t ILR                        '/*!< (* &H40046000) Interrupt Location Register */
  '__IO uint32_t CCR                        '/*!< (* &H40046008) Clock Control Register */
  '__IO uint32_t CIIR                       '/*!< (* &H4004600C) Counter Increment Interrupt Register */
  '__IO uint32_t AMR                        '/*!< (* &H40046010) Alarm Mask Register  '  */
  '__I  uint32_t CTIME0                     '/*!< (* &H40046014) Consolidated Time Register 0 */
  '__I  uint32_t CTIME1                     '/*!< (* &H40046018) Consolidated Time Register 1 */
  '__I  uint32_t CTIME2                     '/*!< (* &H4004601C) Consolidated Time Register 2 */
  '__IO uint32_t SEC                        '/*!< (* &H40046020) Seconds Register     '  */
  '__IO uint32_t MIN                        '/*!< (* &H40046024) Minutes Register     '  */
  '__IO uint32_t HOUR                       '/*!< (* &H40046028) Hours Register       '  */
  '__IO uint32_t DOM                        '/*!< (* &H4004602C) Day of Month Register'  */
  '__IO uint32_t DOW                        '/*!< (* &H40046030) Day of Week Register '  */
  '__IO uint32_t DOY                        '/*!< (* &H40046034) Day of Year Register '  */
  '__IO uint32_t MONTH                      '/*!< (* &H40046038) Months Register      '  */
  '__IO uint32_t YEAR                       '/*!< (* &H4004603C) Years Register       '  */
  '__IO uint32_t CALIBRATION                '/*!< (* &H40046040) Calibration Value Register */
  '__IO uint32_t ASEC                       '/*!< (* &H40046060) Alarm value for Seconds */
  '__IO uint32_t AMIN                       '/*!< (* &H40046064) Alarm value for Minutes */
  '__IO uint32_t AHRS                       '/*!< (* &H40046068) Alarm value for Hours'  */
  '__IO uint32_t ADOM                       '/*!< (* &H4004606C) Alarm value for Day of Month */
  '__IO uint32_t ADOW                       '/*!< (* &H40046070) Alarm value for Day of Week */
  '__IO uint32_t ADOY                       '/*!< (* &H40046074) Alarm value for Day of Year */
  '__IO uint32_t AMON                       '/*!< (* &H40046078) Alarm value for Months */
  '__IO uint32_t AYRS                       '/*!< (* &H4004607C) Alarm value for Year '  */
'} LPC_RTC_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                          CGU                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10462 Chapter title=LPC43xx Clock Generation Unit (CGU) Modification date=6/1/2011 Major revision=0 Minor revision=1  (CGU)
'  */

'typedef struct '{                            '/*!< (* &H40050000) CGU Structure        '  */
#define CGU_FREQ_MON                   * &H40050014		' Frequency monitor register */
#define CGU_XTAL_OSC_CTRL              * &H40050018		' Crystal oscillator control register */
#define CGU_PLL0USB_STAT               * &H4005001C		' PLL0 (USB) status register */
#define CGU_PLL0USB_CTRL               * &H40050020		' PLL0 (USB) control register */
#define CGU_PLL0USB_MDIV               * &H40050024		' PLL0 (USB) M-divider register */
#define CGU_PLL0USB_NP_DIV             * &H40050028		' PLL0 (USB) N/P-divider register */
#define CGU_PLL0AUDIO_STAT             * &H4005002C		' PLL0 (audio) status register */
#define CGU_PLL0AUDIO_CTRL             * &H40050030		' PLL0 (audio) control register */
#define CGU_PLL0AUDIO_MDIV             * &H40050034		' PLL0 (audio) M-divider register */
#define CGU_PLL0AUDIO_NP_DIV           * &H40050038		' PLL0 (audio) N/P-divider register */
#define CGU_PLL0AUDIO_FRAC             * &H4005003C		' PLL0 (audio)         '  */
#define CGU_PLL1_STAT                  * &H40050040		' PLL1 status register '  */
#define CGU_PLL1_CTRL                  * &H40050044		' PLL1 control register'  */
#define CGU_IDIVA_CTRL                 * &H40050048		' Integer divider A control register */
#define CGU_IDIVB_CTRL                 * &H4005004C		' Integer divider B control register */
#define CGU_IDIVC_CTRL                 * &H40050050		' Integer divider C control register */
#define CGU_IDIVD_CTRL                 * &H40050054		' Integer divider D control register */
#define CGU_IDIVE_CTRL                 * &H40050058		' Integer divider E control register */
#define CGU_BASE_SAFE_CLK              * &H4005005C		' Output stage 0 control register for base clock BASE_SAFE_CLK */
#define CGU_BASE_USB0_CLK              * &H40050060		' Output stage 1 control register for base clock BASE_USB0_CLK */
#define CGU_BASE_M0_CLK                * &H40050064		' */
#define CGU_BASE_USB1_CLK              * &H40050068		' Output stage 3 control register for base clock BASE_USB1_CLK */
#define CGU_BASE_M4_CLK                * &H4005006C		' Output stage control register'  */
#define CGU_BASE_SPIFI0_CLK            * &H40050070		' Output stage control register'  */
#define CGU_BASE_SPI_CLK               * &H40050074		' Output stage control register'  */
#define CGU_BASE_PHY_RX_CLK            * &H40050078		' Output stage control register'  */
#define CGU_BASE_PHY_TX_CLK            * &H4005007C		' Output stage control register'  */
#define CGU_BASE_APB1_CLK              * &H40050080		' Output stage control register'  */
#define CGU_BASE_APB3_CLK              * &H40050084		' Output stage control register'  */
#define CGU_BASE_LCD_CLK               * &H40050088		' Output stage control register'  */
#define CGU_BASE_VADC_CLK         	   * &H4005008C		' Output stage control register'  */
#define CGU_BASE_SDIO_CLK              * &H40050090		' Output stage control register'  */
#define CGU_BASE_SSP0_CLK              * &H40050094		' Output stage control register'  */
#define CGU_BASE_SSP1_CLK              * &H40050098		' Output stage control register'  */
#define CGU_BASE_UART0_CLK             * &H4005009C		' Output stage control register'  */
#define CGU_BASE_UART1_CLK             * &H400500A0		' Output stage control register'  */
#define CGU_BASE_UART2_CLK             * &H400500A4		' Output stage control register'  */
#define CGU_BASE_UART3_CLK             * &H400500A8		' Output stage control register'  */
#define CGU_BASE_OUT_CLK               * &H400500AC		' Output stage 20 control register for base clock BASE_OUT_CLK */
#define CGU_BASE_AOTEST_CLK            * &H400500B0		' */
#define CGU_BASE_ISO_TCK               * &H400500B4		' */
#define CGU_BASE_BSR_TCK               * &H400500B8		' */
#define CGU_BASE_CLK_TESTSHELL         * &H400500BC		' */
#define CGU_BASE_APLL_CLK              * &H400500C0		' Output stage 25 control register for base clock BASE_APLL_CLK */
#define CGU_BASE_CGU_OUT0_CLK          * &H400500C4		' Output stage 26 control register for base clock BASE_CGU_OUT0_CLK */
#define CGU_BASE_CGU_OUT1_CLK          * &H400500C8		' Output stage 27 control register for base clock BASE_CGU_OUT1_CLK */
'} LPC_CGU_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         CCU1                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Clock Control Unit (CCU) Modification date=1/21/2011 Major revision=0 Minor revision=7  (CCU1)
'  */

'typedef struct '{                            '/*!< (* &H40051000) CCU1 Structure       '  */
#define CCU1_PM                        	*&H40051000		'	CCU1 power mode register */
#define CCU1_BASE_STAT                 	*&H40051004		'	CCU1 base clocks status register */
#define CCU1_CLK_APB3_BUS_CFG          	*&H40051100		'	CLK_APB3_BUS clock configuration register */
#define CCU1_CLK_APB3_BUS_STAT         	*&H40051104		'	CLK_APB3_BUS clock status register */
#define CCU1_CLK_APB3_I2C1_CFG         	*&H40051108		'	CLK_APB3_I2C1 clock configuration register */
#define CCU1_CLK_APB3_I2C1_STAT        	*&H4005110C		'	CLK_APB3_I2C1 clock status register */
#define CCU1_CLK_APB3_DAC_CFG          	*&H40051110		'	CLK_APB3_DAC clock configuration register */
#define CCU1_CLK_APB3_DAC_STAT         	*&H40051114		'	CLK_APB3_DAC clock status register */
#define CCU1_CLK_APB3_ADC0_CFG         	*&H40051118		'	CLK_APB3_ADC0 clock configuration register */
#define CCU1_CLK_APB3_ADC0_STAT        	*&H4005111C		'	CLK_APB3_ADC0 clock status register */
#define CCU1_CLK_APB3_ADC1_CFG         	*&H40051120		'	CLK_APB3_ADC1 clock configuration register */
#define CCU1_CLK_APB3_ADC1_STAT        	*&H40051124		'	CLK_APB3_ADC1 clock status register */
#define CCU1_CLK_APB3_CAN0_CFG         	*&H40051128		'	CLK_APB3_CAN0 clock configuration register */
#define CCU1_CLK_APB3_CAN0_STAT        	*&H4005112C		'	CLK_APB3_CAN0 clock status register */
#define CCU1_CLK_APB3_SPARE0_CFG       	*&H40051130		'	*/
#define CCU1_CLK_APB3_SPARE0_STAT      	*&H40051134		'	*/
#define CCU1_CLK_APB1_BUS_CFG          	*&H40051200		'	CLK_APB1_BUS clock configuration register */
#define CCU1_CLK_APB1_BUS_STAT         	*&H40051204		'	CLK_APB1_BUS clock status register */
#define CCU1_CLK_APB1_MOTOCONPWM_CFG   	*&H40051208		'	CLK_APB1_MOTOCONPWM clock configuration register */
#define CCU1_CLK_APB1_MOTOCONPWM_STAT  	*&H4005120C		'	CLK_APB1_MOTOCONPWM clock status register */
#define CCU1_CLK_ABP1_I2C0_CFG         	*&H40051210		'	CLK_ABP1_I2C0 clock configuration register */
#define CCU1_CLK_APB1_I2C0_STAT        	*&H40051214		'	CLK_APB1_I2C0 clock status register */
#define CCU1_CLK_APB1_I2S_CFG          	*&H40051218		'	CLK_APB1_I2S clock configuration register */
#define CCU1_CLK_APB1_I2S_STAT         	*&H4005121C		'	CLK_APB1_I2S clock status register */
#define CCU1_CLK_APB1_CAN1_CFG         	*&H40051220		'	CLK_APB1_CAN1 clock configuration register */
#define CCU1_CLK_APB1_CAN1_STAT        	*&H40051224		'	CLK_APB1_CAN1 clock status register */
#define CCU1_CLK_APB1_SPARE0_CFG       	*&H40051228		'	*/
#define CCU1_CLK_APB1_SPARE0_STAT      	*&H4005122C		'	*/
#define CCU1_CLK_SPIFI_CFG             	*&H40051300		'	CLK_SPIFI clock configuration register */
#define CCU1_CLK_SPIFI_STAT            	*&H40051304		'	CLK_APB1_SPIFI clock status register */
#define CCU1_CLK_M4_BUS_CFG            	*&H40051400		'	CLK_M4_BUS clock configuration register */
#define CCU1_CLK_M4_BUS_STAT           	*&H40051404		'	CLK_M4_BUSclock status register */
#define CCU1_CLK_M4_SPIFI_CFG          	*&H40051408		'	CLK_M4_SPIFI clock configuration register */
#define CCU1_CLK_M4_SPIFI_STAT         	*&H4005140C		'	CLK_M4_SPIFI clock status register */
#define CCU1_CLK_M4_GPIO_CFG           	*&H40051410		'	CLK_M4_GPIO clock configuration register */
#define CCU1_CLK_M4_GPIO_STAT          	*&H40051414		'	CLK_M4_GPIO clock status register */
#define CCU1_CLK_M4_LCD_CFG            	*&H40051418		'	CLK_M4_LCD clock configuration register */
#define CCU1_CLK_M4_LCD_STAT           	*&H4005141C		'	CLK_M4_LCD clock status register */
#define CCU1_CLK_M4_ETHERNET_CFG       	*&H40051420		'	CLK_M4_ETHERNET clock configuration register */
#define CCU1_CLK_M4_ETHERNET_STAT      	*&H40051424		'	CLK_M4_ETHERNET clock status register */
#define CCU1_CLK_M4_USB0_CFG           	*&H40051428		'	CLK_M4_USB0 clock configuration register */
#define CCU1_CLK_M4_USB0_STAT          	*&H4005142C		'	CLK_M4_USB0 clock status register */
#define CCU1_CLK_M4_EMC_CFG            	*&H40051430		'	CLK_M4_EMC clock configuration register */
#define CCU1_CLK_M4_EMC_STAT           	*&H40051434		'	CLK_M4_EMC clock status register */
#define CCU1_CLK_M4_SDIO_CFG           	*&H40051438		'	CLK_M4_SDIO clock configuration register */
#define CCU1_CLK_M4_SDIO_STAT          	*&H4005143C		'	CLK_M4_SDIO clock status register */
#define CCU1_CLK_M4_DMA_CFG            	*&H40051440		'	CLK_M4_DMA clock configuration register */
#define CCU1_CLK_M4_DMA_STAT           	*&H40051444		'	CLK_M4_DMA clock status register */
#define CCU1_CLK_M4_M4CORE_CFG         	*&H40051448		'	CLK_M4_M4CORE clock configuration register */
#define CCU1_CLK_M4_M4CORE_STAT        	*&H4005144C		'	CLK_M4_M4CORE clock status register */
#define CCU1_CLK_M4_USART_CFG          	*&H40051450		'	Reserved for Eagle */
#define CCU1_CLK_M4_USART_STAT         	*&H40051454		'	Reserved for Eagle */
#define CCU1_CLK_M4_EVENTHANDLER_CFG   	*&H40051458		'	Reserved for Eagle */
#define CCU1_CLK_M4_EVENTHANDLER_STAT  	*&H4005145C		'	Reserved for Eagle */
#define CCU1_CLK_M4_AES_CFG            	*&H40051460		'	CLK_M4_AES clock configuration register */
#define CCU1_CLK_M4_AES_STAT           	*&H40051464		'	CLK_M4_AES clock status register */
#define CCU1_CLK_M4_SCT_CFG            	*&H40051468		'	CLK_M4_SCT clock configuration register */
#define CCU1_CLK_M4_SCT_STAT           	*&H4005146C		'	CLK_M4_SCT clock status register */
#define CCU1_CLK_M4_USB1_CFG           	*&H40051470		'	CLK_M4_USB1 clock configuration register */
#define CCU1_CLK_M4_USB1_STAT          	*&H40051474		'	CLK_M4_USB1 clock status register */
#define CCU1_CLK_M4_EMCDIV_CFG         	*&H40051478		'	CLK_M4_EMCDIV clock configuration register */
#define CCU1_CLK_M4_EMCDIV_STAT        	*&H4005147C		'	CLK_M4_EMCDIV clock status register */
#define CCU1_CLK_M4_FLASH0_CFG         	*&H40051480		'	  */
#define CCU1_CLK_M4_FLASH0_STAT        	*&H40051484		'	  */
#define CCU1_CLK_M4_FLASH1_CFG         	*&H40051488		'	  */
#define CCU1_CLK_M4_FLASH1_STAT        	*&H4005148C		'	  */
#define CCU1_CLK_M4_M0ACORE_CFG	       	*&H40051490		'	  */
#define CCU1_CLK_M4_M0ACORE_STAT		*&H40051494		'	  */
#define CCU1_CLK_M4_VADC_CFG			*&H40051498		'	  */
#define CCU1_CLK_M4_VADC_STAT			*&H4005149C		'	  */
#define CCU1_CLK_M4_EEPROM_CFG         	*&H400514A0		'	  */
#define CCU1_CLK_M4_EEPROM_STAT        	*&H400514A4		'	  */
#define CCU1_CLK_M4_SPARE0_CFG         	*&H400514A8		'	  */
#define CCU1_CLK_M4_SPARE0_STAT        	*&H400514AC		'	  */
#define CCU1_CLK_M4_SPARE1_CFG         	*&H400514B0		'	  */
#define CCU1_CLK_M4_SPARE1_STAT        	*&H400514B4		'	  */
#define CCU1_CLK_M4_WWDT_CFG           	*&H40051500		'	CLK_M4_WWDT clock configuration register */
#define CCU1_CLK_M4_WWDT_STAT          	*&H40051504		'	CLK_M4_WWDT clock status register */
#define CCU1_CLK_M4_USART0_CFG         	*&H40051508		'	CLK_M4_USART0 clock configuration register */
#define CCU1_CLK_M4_USART0_STAT        	*&H4005150C		'	CLK_M4_USART0 clock status register */
#define CCU1_CLK_M4_UART1_CFG          	*&H40051510		'	CLK_M4_UART1 clock configuration register */
#define CCU1_CLK_M4_UART1_STAT         	*&H40051514		'	CLK_M4_UART1 clock status register */
#define CCU1_CLK_M4_SSP0_CFG           	*&H40051518		'	CLK_M4_SSP0 clock configuration register */
#define CCU1_CLK_M4_SSP0_STAT          	*&H4005151C		'	CLK_M4_SSP0 clock status register */
#define CCU1_CLK_M4_TIMER0_CFG         	*&H40051520		'	CLK_M4_TIMER0 clock configuration register */
#define CCU1_CLK_M4_TIMER0_STAT        	*&H40051524		'	CLK_M4_TIMER0 clock status register */
#define CCU1_CLK_M4_TIMER1_CFG         	*&H40051528		'	CLK_M4_TIMER1clock configuration register */
#define CCU1_CLK_M4_TIMER1_STAT        	*&H4005152C		'	CLK_M4_TIMER1 clock status register */
#define CCU1_CLK_M4_SCU_CFG            	*&H40051530		'	CLK_M4_SCU clock configuration register */
#define CCU1_CLK_M4_SCU_STAT           	*&H40051534		'	CLK_SCU_XXX clock status register */
#define CCU1_CLK_M4_CREG_CFG           	*&H40051538		'	CLK_M4_CREGclock configuration register */
#define CCU1_CLK_M4_CREG_STAT          	*&H4005153C		'	CLK_M4_CREG clock status register */
#define CCU1_CLK_APB0_SPARE1_CFG       	*&H40051540		'	  */
#define CCU1_CLK_APB0_SPARE1_STAT      	*&H40051544		'	  */
#define CCU1_CLK_M4_RITIMER_CFG        	*&H40051600		'	CLK_M4_RITIMER clock configuration register */
#define CCU1_CLK_M4_RITIMER_STAT       	*&H40051604		'	CLK_M4_RITIMER clock status register */
#define CCU1_CLK_M4_USART2_CFG         	*&H40051608		'	CLK_M4_USART2 clock configuration register */
#define CCU1_CLK_M4_USART2_STAT        	*&H4005160C		'	CLK_M4_USART2 clock status register */
#define CCU1_CLK_M4_USART3_CFG         	*&H40051610		'	CLK_M4_USART3 clock configuration register */
#define CCU1_CLK_M4_USART3_STAT        	*&H40051614		'	CLK_M4_USART3 clock status register */
#define CCU1_CLK_M4_TIMER2_CFG         	*&H40051618		'	CLK_M4_TIMER2 clock configuration register */
#define CCU1_CLK_M4_TIMER2_STAT        	*&H4005161C		'	CLK_M4_TIMER2 clock status register */
#define CCU1_CLK_M4_TIMER3_CFG         	*&H40051620		'	CLK_M4_TIMER3 clock configuration register */
#define CCU1_CLK_M4_TIMER3_STAT        	*&H40051624		'	CLK_M4_TIMER3 clock status register */
#define CCU1_CLK_M4_SSP1_CFG           	*&H40051628		'	CLK_M4_SSP1 clock configuration register */
#define CCU1_CLK_M4_SSP1_STAT          	*&H4005162C		'	CLK_M4_SSP1 clock status register */
#define CCU1_CLK_M4_QEI_CFG            	*&H40051630		'	CLK_M4_QEIclock configuration register */
#define CCU1_CLK_M4_QEI_STAT           	*&H40051634		'	CLK_M4_QEI clock status register */
#define CCU1_CLK_APB2_SPARE1_CFG       	*&H40051638		'	  */
#define CCU1_CLK_APB2_SPARE1_STAT      	*&H4005163C		'	  */
#define CCU1_CLK_M0_BUS_CFG            	*&H40051700		'	  */
#define CCU1_CLK_M0_BUS_STAT           	*&H40051704		'	  */
#define CCU1_CLK_M0_GPIO_CFG           	*&H40051708		'	  */
#define CCU1_CLK_M0_GPIO_STAT          	*&H4005170C		'	  */
#define CCU1_CLK_M0_M0SCORE_CFG        	*&H40051710		'	  */
#define CCU1_CLK_M0_M0SCORE_STAT       	*&H40051714		'	  */
#define CCU1_CLK_M0_SGPIO_CFG          	*&H40051718		'	  */
#define CCU1_CLK_M0_SGPIO_STAT         	*&H4005171C		'	  */
#define CCU1_CLK_M0_EDM_CFG            	*&H40051720		'	  */
#define CCU1_CLK_M0_EDM_STAT           	*&H40051724		'	  */
#define CCU1_CLK_USB0_CFG              	*&H40051800		'	CLK_M4_USB0 clock configuration register */
#define CCU1_CLK_USB0_STAT             	*&H40051804		'	CLK_USB0 clock status register */
#define CCU1_CLK_USB1_CFG              	*&H40051900		'	CLK_USB1 clock configuration register */
#define CCU1_CLK_USB1_STAT             	*&H40051904		'	CLK_USB1 clock status register */
#define CCU1_CLK_VADC_CFG              	*&H40051B00		'	CLK_VADC clock configuration register */
#define CCU1_CLK_VADC_STAT             	*&H40051B04		'	CLK_VADC clock status register */
'} LPC_CCU1_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         CCU2                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Clock Control Unit (CCU) Modification date=1/21/2011 Major revision=0 Minor revision=7  (CCU2)
'  */

'typedef struct '{                            '/*!< (* &H40052000) CCU2 Structure       '  */
  '__IO uint32_t PM                         '/*!< (* &H40052000) Power mode register  '  */
  '__I  uint32_t BASE_STAT                  '/*!< (* &H40052004) CCU base clocks status register */
  '__IO uint32_t CLK_APLL_CFG               '/*!< (* &H40052100) CLK_APLL clock configuration register */
  '__I  uint32_t CLK_APLL_STAT              '/*!< (* &H40052104) CLK_APLL clock status register */
  '__IO uint32_t CLK_APB2_USART3_CFG        '/*!< (* &H40052200) CLK_APB2_USART3 clock configuration register */
  '__I  uint32_t CLK_APB2_USART3_STAT       '/*!< (* &H40052204) CLK_APB2_USART3 clock status register */
  '__IO uint32_t CLK_APB2_USART2_CFG        '/*!< (* &H40052300) CLK_APB2_USART2 clock configuration register */
  '__I  uint32_t CLK_APB2_USART2_STAT       '/*!< (* &H40052304) CLK_APB2_USART clock status register */
  '__IO uint32_t CLK_APB0_UART1_CFG     '/*!< (* &H40052400) CLK_APB2_UART1 clock configuration register */
  '__I  uint32_t CLK_APB0_UART1_STAT        '/*!< (* &H40052404) CLK_APB0_UART1 clock status register */
  '__IO uint32_t CLK_APB0_USART0_CFG        '/*!< (* &H40052500) CLK_APB2_USART0 clock configuration register */
  '__I  uint32_t CLK_APB0_USART0_STAT       '/*!< (* &H40052504) CLK_APB0_USART0 clock status register */
  '__IO uint32_t CLK_APB2_SSP1_CFG          '/*!< (* &H40052600) CLK_APB2_SSP1 clock configuration register */
  '__I  uint32_t CLK_APB2_SSP1_STAT         '/*!< (* &H40052604) CLK_APB2_SSP1 clock status register */
  '__IO uint32_t CLK_APB0_SSP0_CFG          '/*!< (* &H40052700) CLK_APB0_SSP0 clock configuration register */
  '__I  uint32_t CLK_APB0_SSP0_STAT         '/*!< (* &H40052704) CLK_APB0_SSP0 clock status register */
  '__IO uint32_t CLK_SDIO_CFG               '/*!< (* &H40052800) CLK_SDIO clock configuration register */
  '__I  uint32_t CLK_SDIO_STAT              '/*!< (* &H40052804) CLK_SDIO clock status register */
'} LPC_CCU2_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                          RGU                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Reset Generation Unit (RGU) Modification date=1/21/2011 Major revision=0 Minor revision=7  (RGU)
'  */

'typedef struct '{                            '/*!< (* &H40053000) RGU Structure        '  */
  '__O  uint32_t RESET_CTRL0                '/*!< (* &H40053100) Reset control register 0 */
  '__O  uint32_t RESET_CTRL1                '/*!< (* &H40053104) Reset control register 1 */
  '__IO uint32_t RESET_STATUS0              '/*!< (* &H40053110) Reset status register 0 */
  '__IO uint32_t RESET_STATUS1              '/*!< (* &H40053114) Reset status register 1 */
  '__IO uint32_t RESET_STATUS2              '/*!< (* &H40053118) Reset status register 2 */
  '__IO uint32_t RESET_STATUS3              '/*!< (* &H4005311C) Reset status register 3 */
  '__I  uint32_t RESET_ACTIVE_STATUS0       '/*!< (* &H40053150) Reset active status register 0 */
  '__I  uint32_t RESET_ACTIVE_STATUS1       '/*!< (* &H40053154) Reset active status register 1 */
  '__IO uint32_t RESET_EXT_STAT0            '/*!< (* &H40053400) Reset external status register 0 for CORE_RST */
  '__IO uint32_t RESET_EXT_STAT1            '/*!< (* &H40053404) Reset external status register 1 for PERIPH_RST */
  '__IO uint32_t RESET_EXT_STAT2            '/*!< (* &H40053408) Reset external status register 2 for MASTER_RST */
  '__IO uint32_t RESET_EXT_STAT4            '/*!< (* &H40053410) Reset external status register 4 for WWDT_RST */
  '__IO uint32_t RESET_EXT_STAT5            '/*!< (* &H40053414) Reset external status register 5 for CREG_RST */
  '__IO uint32_t RESET_EXT_STAT8            '/*!< (* &H40053420) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT9            '/*!< (* &H40053424) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT13           '/*!< (* &H40053434) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT16           '/*!< (* &H40053440) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT17           '/*!< (* &H40053444) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT18           '/*!< (* &H40053448) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT19           '/*!< (* &H4005344C) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT20           '/*!< (* &H40053450) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT21           '/*!< (* &H40053454) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT22           '/*!< (* &H40053458) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT23           '/*!< (* &H4005345C) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT28           '/*!< (* &H40053470) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT32           '/*!< (* &H40053480) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT33           '/*!< (* &H40053484) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT34           '/*!< (* &H40053488) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT35           '/*!< (* &H4005348C) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT36           '/*!< (* &H40053490) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT37           '/*!< (* &H40053494) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT38           '/*!< (* &H40053498) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT39           '/*!< (* &H4005349C) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT40           '/*!< (* &H400534A0) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT41           '/*!< (* &H400534A4) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT42           '/*!< (* &H400534A8) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT44           '/*!< (* &H400534B0) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT45           '/*!< (* &H400534B4) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT46           '/*!< (* &H400534B8) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT47           '/*!< (* &H400534BC) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT48           '/*!< (* &H400534C0) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT49           '/*!< (* &H400534C4) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT50           '/*!< (* &H400534C8) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT51           '/*!< (* &H400534CC) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT52           '/*!< (* &H400534D0) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT53           '/*!< (* &H400534D4) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT55           '/*!< (* &H400534DC) Reset external status register */
  '__IO uint32_t RESET_EXT_STAT56           '/*!< (* &H400534E0) Reset external status register */
'} LPC_RGU_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         WWDT                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Windowed Watchdog timer (WWDT) Modification date=1/14/2011 Major revision=0 Minor revision=7  (WWDT)
'  */

'typedef struct '{                            '/*!< (* &H40080000) WWDT Structure       '  */
  '__IO uint32_t MOD                        '/*!< (* &H40080000) Watchdog mode register. This register contains the basic mode and status of the Watchdog Timer. */
  '__IO uint32_t TC                         '/*!< (* &H40080004) Watchdog timer constant register. This register determines the time-out value. */
  '__O  uint32_t FEED                       '/*!< (* &H40080008) Watchdog feed sequence register. Writing &HAA followed by &H55 to this register reloads the Watchdog timer with the value contained in WDTC. */
  '__I  uint32_t TV                         '/*!< (* &H4008000C) Watchdog timer value register. This register reads out the current value of the Watchdog timer. */
  '__IO uint32_t WARNINT                    '/*!< (* &H40080014) Watchdog warning interrupt register. This register contains the Watchdog warning interrupt compare value. */
  '__IO uint32_t WINDOW                     '/*!< (* &H40080018) Watchdog timer window register. This register contains the Watchdog window value. */
'} LPC_WWDT_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                        USARTn                                        -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx USART0_2_3 Modification date=1/14/2011 Major revision=0 Minor revision=7  (USARTn)
'  */

'typedef struct '{                            '/*!< (* &H40&Hx000) USARTn Structure     '  */

  'union '{
    '__IO uint32_t DLL                      '/*!< (* &H40&Hx000) Divisor Latch LSB. Least significant byte of the baud rate divisor value. The full divisor is used to generate a baud rate from the fractional rate divider (DLAB = 1). */
    '__O  uint32_t THR                      '/*!< (* &H40&Hx000) Transmit Holding Register. The next character to be transmitted is written here (DLAB = 0). */
    '__I  uint32_t RBR                      '/*!< (* &H40&Hx000) Receiver Buffer Register. Contains the next received character to be read (DLAB = 0). */
  '}

  'union '{
    '__IO uint32_t IER                      '/*!< (* &H40&Hx004) Interrupt Enable Register. Contains individual interrupt enable bits for the 7 potential UART interrupts (DLAB = 0). */
    '__IO uint32_t DLM                      '/*!< (* &H40&Hx004) Divisor Latch MSB. Most significant byte of the baud rate divisor value. The full divisor is used to generate a baud rate from the fractional rate divider (DLAB = 1). */
  '}

  'union '{
    '__O  uint32_t FCR                      '/*!< (* &H40&Hx008) FIFO Control Register. Controls UART FIFO usage and modes. */
    '__I  uint32_t IIR                      '/*!< (* &H40&Hx008) Interrupt ID Register. Identifies which interrupt(s) are pending. */
  '}
  '__IO uint32_t LCR                        '/*!< (* &H40&Hx00C) Line Control Register. Contains controls for frame formatting and break generation. */
  '__I  uint32_t LSR                        '/*!< (* &H40&Hx014) Line Status Register. Contains flags for transmit and receive status, including line errors. */
  '__IO uint32_t SCR                        '/*!< (* &H40&Hx01C) Scratch Pad Register. Eight-bit temporary storage for software. */
  '__IO uint32_t ACR                        '/*!< (* &H40&Hx020) Auto-baud Control Register. Contains controls for the auto-baud feature. */
  '__IO uint32_t ICR                        '/*!< (* &H40&Hx024) IrDA control register (UART3 only) */
  '__IO uint32_t FDR                        '/*!< (* &H40&Hx028) Fractional Divider Register. Generates a clock input for the baud rate divider. */
  '__IO uint32_t HDEN                       '/*!< (* &H40&Hx03C) Half-duplex enable Register */
  '__IO uint32_t SCICTRL                    '/*!< (* &H40&Hx048) Smart card interface control register */
  '__IO uint32_t RS485CTRL                  '/*!< (* &H40&Hx04C) RS-485/EIA-485 Control. Contains controls to configure various aspects of RS-485/EIA-485 modes. */
  '__IO uint32_t RS485ADRMATCH              '/*!< (* &H40&Hx050) RS-485/EIA-485 address match. Contains the address match value for RS-485/EIA-485 mode. */
  '__IO uint32_t RS485DLY                   '/*!< (* &H40&Hx054) RS-485/EIA-485 direction control delay. */
  '__IO uint32_t SYNCCTRL                   '/*!< (* &H40&Hx058) Synchronous mode control register. */
  '__IO uint32_t TER                        '/*!< (* &H40&Hx05C) Transmit Enable Register. Turns off UART transmitter for use with software flow control. */
'} LPC_USARTn_Type

#define LPC_UART_'typedef LPC_USARTn_Type		'// for BASIC

'// ------------------------------------------------------------------------------------------------
'// -----                                         UART1                                        -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx UART1 Modification date=1/14/2011 Major revision=0 Minor revision=7  (UART1)
'  */

'typedef struct '{                            '/*!< (* &H40082000) UART1 Structure      '  */

  'union '{
    '__IO uint32_t DLL                      '/*!< (* &H40082000) Divisor Latch LSB. Least significant byte of the baud rate divisor value. The full divisor is used to generate a baud rate from the fractional rate divider. (DLAB=1) */
    '__O  uint32_t THR                      '/*!< (* &H40082000) Transmit Holding Register. The next character to be transmitted is written here. (DLAB=0) */
    '__I  uint32_t RBR                      '/*!< (* &H40082000) Receiver Buffer Register. Contains the next received character to be read. (DLAB=0) */
  '}

  'union '{
    '__IO uint32_t IER                      '/*!< (* &H40082004) Interrupt Enable Register. Contains individual interrupt enable bits for the 7 potential UART1 interrupts. (DLAB=0) */
    '__IO uint32_t DLM                      '/*!< (* &H40082004) Divisor Latch MSB. Most significant byte of the baud rate divisor value. The full divisor is used to generate a baud rate from the fractional rate divider.(DLAB=1) */
  '}

  'union '{
    '__O  uint32_t FCR                      '/*!< (* &H40082008) FIFO Control Register. Controls UART1 FIFO usage and modes. */
    '__I  uint32_t IIR                      '/*!< (* &H40082008) Interrupt ID Register. Identifies which interrupt(s) are pending. */
  '}
  '__IO uint32_t LCR                        '/*!< (* &H4008200C) Line Control Register. Contains controls for frame formatting and break generation. */
  '__IO uint32_t MCR                        '/*!< (* &H40082010) Modem Control Register. Contains controls for flow control handshaking and loopback mode. */
  '__I  uint32_t LSR                        '/*!< (* &H40082014) Line Status Register. Contains flags for transmit and receive status, including line errors. */
  '__I  uint32_t MSR                        '/*!< (* &H40082018) Modem Status Register. Contains handshake signal status flags. */
  '__IO uint32_t SCR                        '/*!< (* &H4008201C) Scratch Pad Register. 8-bit temporary storage for software. */
  '__IO uint32_t ACR                        '/*!< (* &H40082020) Auto-baud Control Register. Contains controls for the auto-baud feature. */
  '__IO uint32_t FDR                        '/*!< (* &H40082028) Fractional Divider Register. Generates a clock input for the baud rate divider. */
  '__IO uint32_t TER                        '/*!< (* &H40082030) Transmit Enable Register. Turns off UART transmitter for use with software flow control. */
  '__IO uint32_t RS485CTRL                  '/*!< (* &H4008204C) RS-485/EIA-485 Control. Contains controls to configure various aspects of RS-485/EIA-485 modes. */
  '__IO uint32_t RS485ADRMATCH              '/*!< (* &H40082050) RS-485/EIA-485 address match. Contains the address match value for RS-485/EIA-485 mode. */
  '__IO uint32_t RS485DLY                   '/*!< (* &H40082054) RS-485/EIA-485 direction control delay. */
  '__I  uint32_t FIFOLVL                    '/*!< (* &H40082058) FIFO Level register. Provides the current fill levels of the transmit and receive FIFOs.'  */
'} LPC_UART1_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         SSPn                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx SSP0/1 Modification date=1/14/2011 Major revision=0 Minor revision=7  (SSP0)
'  */

'typedef struct '{                            '/*!< (* &H40&Hx000) SSPn Structure       '  */
#define SSP0_CR0            * &H40083000    'Control Register 0. Selects the serial clock rate, bus type, and data size. */
#define SSP0_CR1            * &H40083004    'Control Register 1. Selects master/slave and other modes. */
#define SSP0_DR             * &H40083008    'Data Register. Writes fill the transmit FIFO, and reads empty the receive FIFO. */
#define SSP0_SR             * &H4008300C    'Status Register      '  */
#define SSP0_CPSR           * &H40083010    'Clock Prescale Register */
#define SSP0_IMSC           * &H40083014    'Interrupt Mask Set and Clear Register */
#define SSP0_RIS            * &H40083018    'Raw Interrupt Status Register */
#define SSP0_MIS            * &H4008301C    'Masked Interrupt Status Register */
#define SSP0_ICR            * &H40083020    'SSPICR Interrupt Clear Register */
#define SSP0_DMACR          * &H40083024    'SSPn DMA control register */
'} LPC_SSPn_Type

#define SSP1_CR0            * &H400C5000    'Control Register 0. Selects the serial clock rate, bus type, and data size. */
#define SSP1_CR1            * &H400C5004    'Control Register 1. Selects master/slave and other modes. */
#define SSP1_DR             * &H400C5008    'Data Register. Writes fill the transmit FIFO, and reads empty the receive FIFO. */
#define SSP1_SR             * &H400C500C    'Status Register      '  */
#define SSP1_CPSR           * &H400C5010    'Clock Prescale Register */
#define SSP1_IMSC           * &H400C5014    'Interrupt Mask Set and Clear Register */
#define SSP1_RIS            * &H400C5018    'Raw Interrupt Status Register */
#define SSP1_MIS            * &H400C501C    'Masked Interrupt Status Register */
#define SSP1_ICR            * &H400C5020    'SSPICR Interrupt Clear Register */
#define SSP1_DMACR          * &H400C5024    'SSPn DMA control register */


'// ------------------------------------------------------------------------------------------------
'// -----                                        TIMERn                                        -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Timer0/1/2/3 Modification date=1/14/2011 Major revision=0 Minor revision=7  (TIMERn)
'  */

'typedef struct '{                            '/*!< (* &H40&Hx000) TIMERn Structure     '  */
#define T0_IR                * &H40084000 	'Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending. */
#define T0_TCR               * &H40084004 	'Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR. */
#define T0_TC                * &H40084008 	'Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR. */
#define T0_PR                * &H4008400C 	'Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC. */
#define T0_PC                * &H40084010 	'Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface. */
#define T0_MCR               * &H40084014 	'Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs. */
#define T0_MR0             * &H40084018 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T0_MR1             * &H4008401C 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T0_MR2             * &H40084020 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T0_MR3             * &H40084024 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T0_CCR               * &H40084028 	'Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place. */
#define T0_CR0             * &H4008402C 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T0_CR1             * &H40084030 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T0_CR2             * &H40084034 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T0_CR3             * &H40084038 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T0_EMR               * &H4008403C 	'External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively). */
                                            	'
#define T0_CTCR              * &H40084070 	'Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting. */
'} LPC_TIMERn_Type

#define T1_IR                * &H40085000 	'Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending. */
#define T1_TCR               * &H40085004 	'Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR. */
#define T1_TC                * &H40085008 	'Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR. */
#define T1_PR                * &H4008500C 	'Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC. */
#define T1_PC                * &H40085010 	'Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface. */
#define T1_MCR               * &H40085014 	'Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs. */
#define T1_MR0             * &H40085018 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T1_MR1             * &H4008501C 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T1_MR2             * &H40085020 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T1_MR3             * &H40085024 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T1_CCR               * &H40085028 	'Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place. */
#define T1_CR0             * &H4008502C 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T1_CR1             * &H40085030 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T1_CR2             * &H40085034 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T1_CR3             * &H40085038 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T1_EMR               * &H4008503C 	'External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively). */
                                            	'
#define T1_CTCR              * &H40085070 	'Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting. */

#define T2_IR                * &H400C3000 	'Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending. */
#define T2_TCR               * &H400C3004 	'Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR. */
#define T2_TC                * &H400C3008 	'Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR. */
#define T2_PR                * &H400C300C 	'Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC. */
#define T2_PC                * &H400C3010 	'Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface. */
#define T2_MCR               * &H400C3014 	'Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs. */
#define T2_MR0             * &H400C3018 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T2_MR1             * &H400C301c 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T2_MR2             * &H400C3020 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T2_MR3             * &H400C3024 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T2_CCR               (* &H400C3028 	'Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place. */
#define T2_CR0             * &H400C302C 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T2_CR1             * &H400C3030 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T2_CR2             * &H400C3034 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T2_CR3             * &H400C3038 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T2_EMR               * &H400C303C 	'External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively). */
                                            	'
#define T2_CTCR              * &H400C3070 	'Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting. */

#define T3_IR                * &H400C4000 	'Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending. */
#define T3_TCR               * &H400C4004 	'Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR. */
#define T3_TC                * &H400C4008 	'Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR. */
#define T3_PR                * &H400C400C 	'Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC. */
#define T3_PC                * &H400C4010 	'Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface. */
#define T3_MCR               * &H400C4014 	'Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs. */
#define T3_MR0             * &H400C4018 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T3_MR1             * &H400C401C 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T3_MR2             * &H400C4020 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T3_MR3             * &H400C4024 	'Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
#define T3_CCR               * &H400C4028 	'Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place. */
#define T3_CR0             * &H400C402C 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T3_CR1             * &H400C4030 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T3_CR2             * &H400C4034 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T3_CR3             * &H400C4038 	'Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
#define T3_EMR               * &H400C403C 	'External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively). */
                                            	'
#define T3_CTCR              * &H400C4070 	'Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting. */



'// ------------------------------------------------------------------------------------------------
'// -----                                          SCU                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx System Control Unit (SCU) Modification date=6/8/2011 Major revision=0 Minor revision=10  (SCU)
'  */

'typedef struct '{                             '/*!< (* &H40086000) SCU Structure        '  */
#define SCU_SFSP0_0                    * &H40086000 'Pin configuration register for pins P0 */
#define SCU_SFSP0_1                    * &H40086004 'Pin configuration register for pins P0 */
                                                    '
#define SCU_SFSP1_0                    * &H40086080 'Pin configuration register for pins P1 */
#define SCU_SFSP1_1                    * &H40086084 'Pin configuration register for pins P1 */
#define SCU_SFSP1_2                    * &H40086088 'Pin configuration register for pins P1 */
#define SCU_SFSP1_3                    * &H4008608C 'Pin configuration register for pins P1 */
#define SCU_SFSP1_4                    * &H40086090 'Pin configuration register for pins P1 */
#define SCU_SFSP1_5                    * &H40086094 'Pin configuration register for pins P1 */
#define SCU_SFSP1_6                    * &H40086098 'Pin configuration register for pins P1 */
#define SCU_SFSP1_7                    * &H4008609C 'Pin configuration register for pins P1 */
#define SCU_SFSP1_8                    * &H400860A0 'Pin configuration register for pins P1 */
#define SCU_SFSP1_9                    * &H400860A4 'Pin configuration register for pins P1 */
#define SCU_SFSP1_10                   * &H400860A8 'Pin configuration register for pins P1 */
#define SCU_SFSP1_11                   * &H400860AC 'Pin configuration register for pins P1 */
#define SCU_SFSP1_12                   * &H400860B0 'Pin configuration register for pins P1 */
#define SCU_SFSP1_13                   * &H400860B4 'Pin configuration register for pins P1 */
#define SCU_SFSP1_14                   * &H400860B8 'Pin configuration register for pins P1 */
#define SCU_SFSP1_15                   * &H400860BC 'Pin configuration register for pins P1 */
#define SCU_SFSP1_16                   * &H400860C0 'Pin configuration register for pins P1 */
#define SCU_SFSP1_17                   * &H400860C4 'Pin configuration register for pins P1 */
#define SCU_SFSP1_18                   * &H400860C8 'Pin configuration register for pins P1 */
#define SCU_SFSP1_19                   * &H400860CC 'Pin configuration register for pins P1 */
#define SCU_SFSP1_20                   * &H400860D0 'Pin configuration register for pins P1 */
                                                    '
#define SCU_SFSP2_0                    * &H40086100 'Pin configuration register for pins P2 */
#define SCU_SFSP2_1                    * &H40086104 'Pin configuration register for pins P2 */
#define SCU_SFSP2_2                    * &H40086108 'Pin configuration register for pins P2 */
#define SCU_SFSP2_3                    * &H4008610C 'Pin configuration register for pins P2 */
#define SCU_SFSP2_4                    * &H40086110 'Pin configuration register for pins P2 */
#define SCU_SFSP2_5                    * &H40086114 'Pin configuration register for pins P2 */
#define SCU_SFSP2_6                    * &H40086118 'Pin configuration register for pins P2 */
#define SCU_SFSP2_7                    * &H4008611C 'Pin configuration register for pins P2 */
#define SCU_SFSP2_8                    * &H40086120 'Pin configuration register for pins P2 */
#define SCU_SFSP2_9                    * &H40086124 'Pin configuration register for pins P2 */
#define SCU_SFSP2_10                   * &H40086128 'Pin configuration register for pins P2 */
#define SCU_SFSP2_11                   * &H4008612C 'Pin configuration register for pins P2 */
#define SCU_SFSP2_12                   * &H40086130 'Pin configuration register for pins P2 */
#define SCU_SFSP2_13                   * &H40086134 'Pin configuration register for pins P2 */
                                                    '
#define SCU_SFSP3_0                    * &H40086180 'Pin configuration register for pins P3 */
#define SCU_SFSP3_1                    * &H40086184 'Pin configuration register for pins P3 */
#define SCU_SFSP3_2                    * &H40086188 'Pin configuration register for pins P3 */
#define SCU_SFSP3_3                    * &H4008618C 'Pin configuration register for pins P3 */
#define SCU_SFSP3_4                    * &H40086190 'Pin configuration register for pins P3 */
#define SCU_SFSP3_5                    * &H40086194 'Pin configuration register for pins P3 */
#define SCU_SFSP3_6                    * &H40086198 'Pin configuration register for pins P3 */
#define SCU_SFSP3_7                    * &H4008619C 'Pin configuration register for pins P3 */
#define SCU_SFSP3_8                    * &H400861A0 'Pin configuration register for pins P3 */
                                                    '
#define SCU_SFSP4_0                    * &H40086200 'Pin configuration register for pins P4 */
#define SCU_SFSP4_1                    * &H40086204 'Pin configuration register for pins P4 */
#define SCU_SFSP4_2                    * &H40086208 'Pin configuration register for pins P4 */
#define SCU_SFSP4_3                    * &H4008620C 'Pin configuration register for pins P4 */
#define SCU_SFSP4_4                    * &H40086210 'Pin configuration register for pins P4 */
#define SCU_SFSP4_5                    * &H40086214 'Pin configuration register for pins P4 */
#define SCU_SFSP4_6                    * &H40086218 'Pin configuration register for pins P4 */
#define SCU_SFSP4_7                    * &H4008621C 'Pin configuration register for pins P4 */
#define SCU_SFSP4_8                    * &H40086220 'Pin configuration register for pins P4 */
#define SCU_SFSP4_9                    * &H40086224 'Pin configuration register for pins P4 */
#define SCU_SFSP4_10                   * &H40086228 'Pin configuration register for pins P4 */
                                                    '
#define SCU_SFSP5_0                    * &H40086280 'Pin configuration register for pins P5 */
#define SCU_SFSP5_1                    * &H40086284 'Pin configuration register for pins P5 */
#define SCU_SFSP5_2                    * &H40086288 'Pin configuration register for pins P5 */
#define SCU_SFSP5_3                    * &H4008628C 'Pin configuration register for pins P5 */
#define SCU_SFSP5_4                    * &H40086290 'Pin configuration register for pins P5 */
#define SCU_SFSP5_5                    * &H40086294 'Pin configuration register for pins P5 */
#define SCU_SFSP5_6                    * &H40086298 'Pin configuration register for pins P5 */
#define SCU_SFSP5_7                    * &H4008629C 'Pin configuration register for pins P5 */
                                                    '
#define SCU_SFSP6_0                    * &H40086300 'Pin configuration register for pins P6 */
#define SCU_SFSP6_1                    * &H40086304 'Pin configuration register for pins P6 */
#define SCU_SFSP6_2                    * &H40086308 'Pin configuration register for pins P6 */
#define SCU_SFSP6_3                    * &H4008630C 'Pin configuration register for pins P6 */
#define SCU_SFSP6_4                    * &H40086310 'Pin configuration register for pins P6 */
#define SCU_SFSP6_5                    * &H40086314 'Pin configuration register for pins P6 */
#define SCU_SFSP6_6                    * &H40086318 'Pin configuration register for pins P6 */
#define SCU_SFSP6_7                    * &H4008631C 'Pin configuration register for pins P6 */
#define SCU_SFSP6_8                    * &H40086320 'Pin configuration register for pins P6 */
#define SCU_SFSP6_9                    * &H40086324 'Pin configuration register for pins P6 */
#define SCU_SFSP6_10                   * &H40086328 'Pin configuration register for pins P6 */
#define SCU_SFSP6_11                   * &H4008632C 'Pin configuration register for pins P6 */
#define SCU_SFSP6_12                   * &H40086330 'Pin configuration register for pins P6 */
                                                    '
#define SCU_SFSP7_0                    * &H40086380 'Pin configuration register for pins P7 */
#define SCU_SFSP7_1                    * &H40086384 'Pin configuration register for pins P7 */
#define SCU_SFSP7_2                    * &H40086388 'Pin configuration register for pins P7 */
#define SCU_SFSP7_3                    * &H4008638C 'Pin configuration register for pins P7 */
#define SCU_SFSP7_4                    * &H40086390 'Pin configuration register for pins P7 */
#define SCU_SFSP7_5                    * &H40086394 'Pin configuration register for pins P7 */
#define SCU_SFSP7_6                    * &H40086398 'Pin configuration register for pins P7 */
#define SCU_SFSP7_7                    * &H4008639C 'Pin configuration register for pins P7 */
                                                    '
#define SCU_SFSP8_0                    * &H40086400 'Pin configuration register for pins P8 */
#define SCU_SFSP8_1                    * &H40086404 'Pin configuration register for pins P8 */
#define SCU_SFSP8_2                    * &H40086408 'Pin configuration register for pins P8 */
#define SCU_SFSP8_3                    * &H4008640C 'Pin configuration register for pins P8 */
#define SCU_SFSP8_4                    * &H40086410 'Pin configuration register for pins P8 */
#define SCU_SFSP8_5                    * &H40086414 'Pin configuration register for pins P8 */
#define SCU_SFSP8_6                    * &H40086418 'Pin configuration register for pins P8 */
#define SCU_SFSP8_7                    * &H4008641C 'Pin configuration register for pins P8 */
#define SCU_SFSP8_8                    * &H40086420 'Pin configuration register for pins P8 */
                                                    '
#define SCU_SFSP9_0                    * &H40086480 'Pin configuration register for pins P9 */
#define SCU_SFSP9_1                    * &H40086484 'Pin configuration register for pins P9 */
#define SCU_SFSP9_2                    * &H40086488 'Pin configuration register for pins P9 */
#define SCU_SFSP9_3                    * &H4008648C 'Pin configuration register for pins P9 */
#define SCU_SFSP9_4                    * &H40086490 'Pin configuration register for pins P9 */
#define SCU_SFSP9_5                    * &H40086494 'Pin configuration register for pins P9 */
#define SCU_SFSP9_6                    * &H40086498 'Pin configuration register for pins P9 */
                                                    '
#define SCU_SFSPA_0                    * &H40086500 'Pin configuration register for pins PA */
#define SCU_SFSPA_1                    * &H40086504 'Pin configuration register for pins PA */
#define SCU_SFSPA_2                    * &H40086508 'Pin configuration register for pins PA */
#define SCU_SFSPA_3                    * &H4008650C 'Pin configuration register for pins PA */
#define SCU_SFSPA_4                    * &H40086510 'Pin configuration register for pins PA */
                                                    '
#define SCU_SFSPB_0                    * &H40086580 'Pin configuration register for pins PB */
#define SCU_SFSPB_1                    * &H40086584 'Pin configuration register for pins PB */
#define SCU_SFSPB_2                    * &H40086588 'Pin configuration register for pins PB */
#define SCU_SFSPB_3                    * &H4008658C 'Pin configuration register for pins PB */
#define SCU_SFSPB_4                    * &H40086590 'Pin configuration register for pins PB */
#define SCU_SFSPB_5                    * &H40086594 'Pin configuration register for pins PB */
#define SCU_SFSPB_6                    * &H40086598 'Pin configuration register for pins PB */
                                                    '
#define SCU_SFSPC_0                    * &H40086600 'Pin configuration register for pins PC */
#define SCU_SFSPC_1                    * &H40086604 'Pin configuration register for pins PC */
#define SCU_SFSPC_2                    * &H40086608 'Pin configuration register for pins PC */
#define SCU_SFSPC_3                    * &H4008660C 'Pin configuration register for pins PC */
#define SCU_SFSPC_4                    * &H40086610 'Pin configuration register for pins PC */
#define SCU_SFSPC_5                    * &H40086614 'Pin configuration register for pins PC */
#define SCU_SFSPC_6                    * &H40086618 'Pin configuration register for pins PC */
#define SCU_SFSPC_7                    * &H4008661C 'Pin configuration register for pins PC */
#define SCU_SFSPC_8                    * &H40086620 'Pin configuration register for pins PC */
#define SCU_SFSPC_9                    * &H40086624 'Pin configuration register for pins PC */
#define SCU_SFSPC_10                   * &H40086628 'Pin configuration register for pins PC */
#define SCU_SFSPC_11                   * &H4008662C 'Pin configuration register for pins PC */
#define SCU_SFSPC_12                   * &H40086630 'Pin configuration register for pins PC */
#define SCU_SFSPC_13                   * &H40086634 'Pin configuration register for pins PC */
#define SCU_SFSPC_14                   * &H40086638 'Pin configuration register for pins PC */
                                                    '
#define SCU_SFSPD_0                    * &H40086680 'Pin configuration register for pins PD */
#define SCU_SFSPD_1                    * &H40086684 'Pin configuration register for pins PD */
#define SCU_SFSPD_2                    * &H40086688 'Pin configuration register for pins PD */
#define SCU_SFSPD_3                    * &H4008668C 'Pin configuration register for pins PD */
#define SCU_SFSPD_4                    * &H40086690 'Pin configuration register for pins PD */
#define SCU_SFSPD_5                    * &H40086694 'Pin configuration register for pins PD */
#define SCU_SFSPD_6                    * &H40086698 'Pin configuration register for pins PD */
#define SCU_SFSPD_7                    * &H4008669C 'Pin configuration register for pins PD */
#define SCU_SFSPD_8                    * &H400866A0 'Pin configuration register for pins PD */
#define SCU_SFSPD_9                    * &H400866A4 'Pin configuration register for pins PD */
#define SCU_SFSPD_10                   * &H400866A8 'Pin configuration register for pins PD */
#define SCU_SFSPD_11                   * &H400866AC 'Pin configuration register for pins PD */
#define SCU_SFSPD_12                   * &H400866B0 'Pin configuration register for pins PD */
#define SCU_SFSPD_13                   * &H400866B4 'Pin configuration register for pins PD */
#define SCU_SFSPD_14                   * &H400866B8 'Pin configuration register for pins PD */
#define SCU_SFSPD_15                   * &H400866BC 'Pin configuration register for pins PD */
#define SCU_SFSPD_16                   * &H400866C0 'Pin configuration register for pins PD */
                                                    '
#define SCU_SFSPE_0                    * &H40086700 'Pin configuration register for pins PE */
#define SCU_SFSPE_1                    * &H40086704 'Pin configuration register for pins PE */
#define SCU_SFSPE_2                    * &H40086708 'Pin configuration register for pins PE */
#define SCU_SFSPE_3                    * &H4008670C 'Pin configuration register for pins PE */
#define SCU_SFSPE_4                    * &H40086710 'Pin configuration register for pins PE */
#define SCU_SFSPE_5                    * &H40086714 'Pin configuration register for pins PE */
#define SCU_SFSPE_6                    * &H40086718 'Pin configuration register for pins PE */
#define SCU_SFSPE_7                    * &H4008671C 'Pin configuration register for pins PE */
#define SCU_SFSPE_8                    * &H40086720 'Pin configuration register for pins PE */
#define SCU_SFSPE_9                    * &H40086724 'Pin configuration register for pins PE */
#define SCU_SFSPE_10                   * &H40086728 'Pin configuration register for pins PE */
#define SCU_SFSPE_11                   * &H4008672C 'Pin configuration register for pins PE */
#define SCU_SFSPE_12                   * &H40086730 'Pin configuration register for pins PE */
#define SCU_SFSPE_13                   * &H40086734 'Pin configuration register for pins PE */
#define SCU_SFSPE_14                   * &H40086738 'Pin configuration register for pins PE */
#define SCU_SFSPE_15                   * &H4008673C 'Pin configuration register for pins PE */
                                                    '
#define SCU_SFSPF_0                    * &H40086780 'Pin configuration register for pins PF */
#define SCU_SFSPF_1                    * &H40086784 'Pin configuration register for pins PF */
#define SCU_SFSPF_2                    * &H40086788 'Pin configuration register for pins PF */
#define SCU_SFSPF_3                    * &H4008678C 'Pin configuration register for pins PF */
#define SCU_SFSPF_4                    * &H40086790 'Pin configuration register for pins PF */
#define SCU_SFSPF_5                    * &H40086794 'Pin configuration register for pins PF */
#define SCU_SFSPF_6                    * &H40086798 'Pin configuration register for pins PF */
#define SCU_SFSPF_7                    * &H4008679C 'Pin configuration register for pins PF */
#define SCU_SFSPF_8                    * &H400867A0 'Pin configuration register for pins PF */
#define SCU_SFSPF_9                    * &H400867A4 'Pin configuration register for pins PF */
#define SCU_SFSPF_10                   * &H400867A8 'Pin configuration register for pins PF */
#define SCU_SFSPF_11                   * &H400867AC 'Pin configuration register for pins PF */
                                                    '
#define SCU_SFSCLK_0                   * &H40086C00 'Pin configuration register for pin CLK0 */
#define SCU_SFSCLK_1                   * &H40086C04 'Pin configuration register for pin CLK1 */
#define SCU_SFSCLK_2                   * &H40086C08 'Pin configuration register for pin CLK2 */
#define SCU_SFSCLK_3                   * &H40086C0C 'Pin configuration register for pin CLK3 */
                                                    '
#define SCU_SFSUSB                     * &H40086C80 'Pin configuration register for */
#define SCU_SFSI2C0                    * &H40086C84 'Pin configuration register for I 2C0-bus pins */
#define SCU_ENAIO0                     * &H40086C88 'ADC0 function select register */
#define SCU_ENAIO1                     * &H40086C8C 'ADC1 function select register */
#define SCU_ENAIO2                     * &H40086C90 'Analog function select register */
                                                    '
#define SCU_EMCCLKDELAY                * &H40086D00 'EMC clock delay register */
#define SCU_EMCCTRLDELAY               * &H40086D04 'EMC control delay register */
#define SCU_EMCCSDELAY                 * &H40086D08 'EMC chip select delay register */
#define SCU_EMCDOUTDELAY               * &H40086D0C 'EMC data out delay register */
#define SCU_EMCFBCLKDELAY              * &H40086D10 'EMC FBCLK delay register */
#define SCU_EMCADDRDELAY0              * &H40086D14 'EMC address line delay register 0 */
#define SCU_EMCADDRDELAY1              * &H40086D18 'EMC address line delay register 1 */
#define SCU_EMCADDRDELAY2              * &H40086D1C 'EMC address line delay register 2 */
#define SCU_EMCDINDELAY                * &H40086D24 'EMC data delay register */
                                                    '
#define SCU_PINTSEL0                   * &H40086E00 'Pin interrupt select register for pin interrupts 0 to 3. */
#define SCU_PINTSEL1                   * &H40086E04 'Pin interrupt select register for pin interrupts 4 to 7. */
'} LPC_SCU_Type

'// ------------------------------------------------------------------------------------------------
'// -----                                         MCPWM                                        -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Motor Control PWM (MOTOCONPWM) Modification date=1/14/2011 Major revision=0 Minor revision=7  (MCPWM)
'  */

'typedef struct '{                            '/*!< (* &H400A0000) MCPWM Structure      '  */
  '__I  uint32_t CON                        '/*!< (* &H400A0000) PWM Control read address */
  '__O  uint32_t CON_SET                    '/*!< (* &H400A0004) PWM Control set address */
  '__O  uint32_t CON_CLR                    '/*!< (* &H400A0008) PWM Control clear address */
  '__I  uint32_t CAPCON                     '/*!< (* &H400A000C) Capture Control read address */
  '__O  uint32_t CAPCON_SET                 '/*!< (* &H400A0010) Capture Control set address */
  '__O  uint32_t CAPCON_CLR                 '/*!< (* &H400A0014) Event Control clear address */
  '__IO uint32_t TC[3]                      '/*!< (* &H400A0018) Timer Counter register */
  '__IO uint32_t LIM[3]                     '/*!< (* &H400A0024) Limit register       '  */
  '__IO uint32_t MAT[3]                     '/*!< (* &H400A0030) Match register       '  */
  '__IO uint32_t DT                         '/*!< (* &H400A003C) Dead time register   '  */
  '__IO uint32_t CCP                        '/*!< (* &H400A0040) Communication Pattern register */
  '__I  uint32_t CAP[3]                     '/*!< (* &H400A0044) Capture register     '  */
  '__I  uint32_t INTEN                      '/*!< (* &H400A0050) Interrupt Enable read address */
  '__O  uint32_t INTEN_SET                  '/*!< (* &H400A0054) Interrupt Enable set address */
  '__O  uint32_t INTEN_CLR                  '/*!< (* &H400A0058) Interrupt Enable clear address */
  '__I  uint32_t CNTCON                     '/*!< (* &H400A005C) Count Control read address */
  '__O  uint32_t CNTCON_SET                 '/*!< (* &H400A0060) Count Control set address */
  '__O  uint32_t CNTCON_CLR                 '/*!< (* &H400A0064) Count Control clear address */
  '__I  uint32_t INTF                       '/*!< (* &H400A0068) Interrupt flags read address */
  '__O  uint32_t INTF_SET                   '/*!< (* &H400A006C) Interrupt flags set address */
  '__O  uint32_t INTF_CLR                   '/*!< (* &H400A0070) Interrupt flags clear address */
  '__O  uint32_t CAP_CLR                    '/*!< (* &H400A0074) Capture clear address'  */
'} LPC_MCPWM_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         I2Cn                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx I2C0/1-bus interface Modification date=1/14/2011 Major revision=0 Minor revision=7  (I2Cn)
'  */

'typedef struct '{                            '/*!< (* &H40&Hx000) I2C0 Structure       '  */
  '__IO uint32_t CONSET                     '/*!< (* &H40&Hx000) I2C Control Set Register. When a one is written to a bit of this register, the corresponding bit in the I2C control register is set. Writing a zero has no effect on the corresponding bit in the I2C control register. */
  '__I  uint32_t STAT                       '/*!< (* &H40&Hx004) I2C Status Register. During I2C operation, this register provides detailed status codes that allow software to determine the next action needed. */
  '__IO uint32_t DAT                        '/*!< (* &H40&Hx008) I2C Data Register. During master or slave transmit mode, data to be transmitted is written to this register. During master or slave receive mode, data that has been received may be read from this register. */
  '__IO uint32_t ADR0                       '/*!< (* &H40&Hx00C) I2C Slave Address Register 0. Contains the 7-bit slave address for operation of the I2C interface in slave mode, and is not used in master mode. The least significant bit determines whether a slave responds to the General Call address. */
  '__IO uint32_t SCLH                       '/*!< (* &H40&Hx010) SCH Duty Cycle Register High Half Word. Determines the high time of the I2C clock. */
  '__IO uint32_t SCLL                       '/*!< (* &H40&Hx014) SCL Duty Cycle Register Low Half Word. Determines the low time of the I2C clock. SCLL and SCLH together determine the clock frequency generated by an I2C master and certain times used in slave mode. */
  '__O  uint32_t CONCLR                     '/*!< (* &H40&Hx018) I2C Control Clear Register. When a one is written to a bit of this register, the corresponding bit in the I2C control register is cleared. Writing a zero has no effect on the corresponding bit in the I2C control register. */
  '__IO uint32_t MMCTRL                     '/*!< (* &H40&Hx01C) Monitor mode control register. */
  '__IO uint32_t ADR1                       '/*!< (* &H40&Hx020) I2C Slave Address Register. Contains the 7-bit slave address for operation of the I2C interface in slave mode, and is not used in master mode. The least significant bit determines whether a slave responds to the General Call address. */
  '__IO uint32_t ADR2                       '/*!< (* &H40&Hx024) I2C Slave Address Register. Contains the 7-bit slave address for operation of the I2C interface in slave mode, and is not used in master mode. The least significant bit determines whether a slave responds to the General Call address. */
  '__IO uint32_t ADR3                       '/*!< (* &H40&Hx028) I2C Slave Address Register. Contains the 7-bit slave address for operation of the I2C interface in slave mode, and is not used in master mode. The least significant bit determines whether a slave responds to the General Call address. */
  '__I  uint32_t DATA_BUFFER                '/*!< (* &H40&Hx02C) Data buffer register. The contents of the 8 MSBs of the DAT shift register will be transferred to the DATA_BUFFER automatically after every nine bits (8 bits of data plus ACK or NACK) has been received on the bus. */
  '__IO uint32_t MASK[4]                    '/*!< (* &H40&Hx030) I2C Slave address mask register */
'} LPC_I2Cn_Type

'// ------------------------------------------------------------------------------------------------
'// -----                                         I2Sn                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx I2S interface Modification date=1/14/2011 Major revision=0 Minor revision=7  (I2Sn)
'    &H400A2000 / &H400A3000
'  */

'typedef struct '{                            '/*!< (* &H400Ax000) I2S Structure       '  */
  '__IO uint32_t DAO                        '/*!< (* &H400Ax000) I2S Digital Audio Output Register. Contains control bits for the I2S transmit channel. */
  '__IO uint32_t DAI                        '/*!< (* &H400Ax004) I2S Digital Audio Input Register. Contains control bits for the I2S receive channel. */
  '__O  uint32_t TXFIFO                     '/*!< (* &H400Ax008) I2S Transmit FIFO. Access register for the 8 x 32-bit transmitter FIFO. */
  '__I  uint32_t RXFIFO                     '/*!< (* &H400Ax00C) I2S Receive FIFO. Access register for the 8 x 32-bit receiver FIFO. */
  '__I  uint32_t STATE                      '/*!< (* &H400Ax010) I2S Status Feedback Register. Contains status information about the I2S interface. */
  '__IO uint32_t DMA1                       '/*!< (* &H400Ax014) I2S DMA Configuration Register 1. Contains control information for DMA request 1. */
  '__IO uint32_t DMA2                       '/*!< (* &H400Ax018) I2S DMA Configuration Register 2. Contains control information for DMA request 2. */
  '__IO uint32_t IRQ                        '/*!< (* &H400Ax01C) I2S Interrupt Request Control Register. Contains bits that control how the I2S interrupt request is generated. */
  '__IO uint32_t TXRATE                     '/*!< (* &H400Ax020) I2S Transmit MCLK divider. This register determines the I2S TX MCLK rate by specifying the value to divide PCLK by in order to produce MCLK. */
  '__IO uint32_t RXRATE                     '/*!< (* &H400Ax024) I2S Receive MCLK divider. This register determines the I2S RX MCLK rate by specifying the value to divide PCLK by in order to produce MCLK. */
  '__IO uint32_t TXBITRATE                  '/*!< (* &H400Ax028) I2S Transmit bit rate divider. This register determines the I2S transmit bit rate by specifying the value to divide TX_MCLK by in order to produce the transmit bit clock. */
  '__IO uint32_t RXBITRATE                  '/*!< (* &H400Ax02C) I2S Receive bit rate divider. This register determines the I2S receive bit rate by specifying the value to divide RX_MCLK by in order to produce the receive bit clock. */
  '__IO uint32_t TXMODE                     '/*!< (* &H400Ax030) I2S Transmit mode control. */
  '__IO uint32_t RXMODE                     '/*!< (* &H400Ax034) I2S Receive mode control. */
'} LPC_I2Sn_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                        RITIMER                                       -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Repetitive Interrupt Timer (RIT) Modification date=1/14/2011 Major revision=0 Minor revision=7  (RITIMER)
'  */

'typedef struct '{                            '/*!< (* &H400C0000) RITIMER Structure    '  */
  '__IO uint32_t COMPVAL                    '/*!< (* &H400C0000) Compare register     '  */
  '__IO uint32_t MASK                       '/*!< (* &H400C0004) Mask register. This register holds the 32-bit mask value. A 1 written to any bit will force a compare on the corresponding bit of the counter and compare register. */
  '__IO uint32_t CTRL                       '/*!< (* &H400C0008) Control register.    '  */
  '__IO uint32_t COUNTER                    '/*!< (* &H400C000C) 32-bit counter       '  */
'} LPC_RITIMER_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                          QEI                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx Quadrature Encoder Interface (QEI) Modification date=1/18/2011 Major revision=0 Minor revision=7  (QEI)
'  */

'typedef struct '{                            '/*!< (* &H400C6000) QEI Structure        '  */
  '__O  uint32_t CON                        '/*!< (* &H400C6000) Control register     '  */
  '__I  uint32_t STAT                       '/*!< (* &H400C6004) Encoder status register */
  '__IO uint32_t CONF                       '/*!< (* &H400C6008) Configuration register */
  '__I  uint32_t POS                        '/*!< (* &H400C600C) Position register    '  */
  '__IO uint32_t MAXPOS                     '/*!< (* &H400C6010) Maximum position register */
  '__IO uint32_t CMPOS0                     '/*!< (* &H400C6014) position compare register 0 */
  '__IO uint32_t CMPOS1                     '/*!< (* &H400C6018) position compare register 1 */
  '__IO uint32_t CMPOS2                     '/*!< (* &H400C601C) position compare register 2 */
  '__I  uint32_t INXCNT                     '/*!< (* &H400C6020) Index count register '  */
  '__IO uint32_t INXCMP0                    '/*!< (* &H400C6024) Index compare register 0 */
  '__IO uint32_t LOAD                       '/*!< (* &H400C6028) Velocity timer reload register */
  '__I  uint32_t TIME                       '/*!< (* &H400C602C) Velocity timer register */
  '__I  uint32_t VEL                        '/*!< (* &H400C6030) Velocity counter register */
  '__I  uint32_t CAP                        '/*!< (* &H400C6034) Velocity capture register */
  '__IO uint32_t VELCOMP                    '/*!< (* &H400C6038) Velocity compare register */
  '__IO uint32_t FILTERPHA                  '/*!< (* &H400C603C) Digital filter register on input phase A (QEI_A) */
  '__IO uint32_t FILTERPHB                  '/*!< (* &H400C6040) Digital filter register on input phase B (QEI_B) */
  '__IO uint32_t FILTERINX                  '/*!< (* &H400C6044) Digital filter register on input index (QEI_IDX) */
  '__IO uint32_t WINDOW                     '/*!< (* &H400C6048) Index acceptance window register */
  '__IO uint32_t INXCMP1                    '/*!< (* &H400C604C) Index compare register 1 */
  '__IO uint32_t INXCMP2                    '/*!< (* &H400C6050) Index compare register 2 */
  '__O  uint32_t IEC                        '/*!< (* &H400C6FD8) Interrupt enable clear register */
  '__O  uint32_t IES                        '/*!< (* &H400C6FDC) Interrupt enable set register */
  '__I  uint32_t INTSTAT                    '/*!< (* &H400C6FE0) Interrupt status register */
  '__I  uint32_t IE                         '/*!< (* &H400C6FE4) Interrupt enable register */
  '__O  uint32_t CLR                        '/*!< (* &H400C6FE8) Interrupt status clear register */
  '__O  uint32_t SET                        '/*!< (* &H400C6FEC) Interrupt status set register */
'} LPC_QEI_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         GIMA                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=Falcon Chapter title=Global Input Multiplexer Array (GIMA) Modification date=3/25/2011 Major revision=0 Minor revision=4  (GIMA)
'  */

'typedef struct '{                            '/*!< (* &H400C7000) GIMA Structure       '  */
  '__IO uint32_t CAP0_0_IN                  '/*!< (* &H400C7000) Timer 0 CAP0_0 capture input multiplexer */
  '__IO uint32_t CAP0_1_IN                  '/*!< (* &H400C7004) Timer 0 CAP0_1 capture input multiplexer */
  '__IO uint32_t CAP0_2_IN                  '/*!< (* &H400C7008) Timer 0 CAP0_2 capture input multiplexer */
  '__IO uint32_t CAP0_3_IN                  '/*!< (* &H400C700C) Timer 0 CAP0_3 capture input multiplexer */
  '__IO uint32_t CAP1_0_IN                  '/*!< (* &H400C7010) Timer 1 CAP1_0 capture input multiplexer */
  '__IO uint32_t CAP1_1_IN                  '/*!< (* &H400C7014) Timer 1 CAP1_1 capture input multiplexer */
  '__IO uint32_t CAP1_2_IN                  '/*!< (* &H400C7018) Timer 1 CAP1_2 capture input multiplexer */
  '__IO uint32_t CAP1_3_IN                  '/*!< (* &H400C701C) Timer 1 CAP1_3 capture input multiplexer */
  '__IO uint32_t CAP2_0_IN                  '/*!< (* &H400C7020) Timer 2 CAP2_0 capture input multiplexer */
  '__IO uint32_t CAP2_1_IN                  '/*!< (* &H400C7024) Timer 2 CAP2_1 capture input multiplexer */
  '__IO uint32_t CAP2_2_IN                  '/*!< (* &H400C7028) Timer 2 CAP2_2 capture input multiplexer */
  '__IO uint32_t CAP2_3_IN                  '/*!< (* &H400C702C) Timer 2 CAP2_3 capture input multiplexer */
  '__IO uint32_t CAP3_0_IN                  '/*!< (* &H400C7030) Timer 3 CAP3_0 capture input multiplexer */
  '__IO uint32_t CAP3_1_IN                  '/*!< (* &H400C7034) Timer 3 CAP3_1 capture input multiplexer */
  '__IO uint32_t CAP3_2_IN                  '/*!< (* &H400C7038) Timer 3 CAP3_2 capture input multiplexer */
  '__IO uint32_t CAP3_3_IN                  '/*!< (* &H400C703C) Timer 3 CAP3_3 capture input multiplexer */
  '__IO uint32_t CTIN_0_IN                  '/*!< (* &H400C7040) SCT CTIN_0 capture input multiplexer */
  '__IO uint32_t CTIN_1_IN                  '/*!< (* &H400C7044) SCT CTIN_1 capture input multiplexer */
  '__IO uint32_t CTIN_2_IN                  '/*!< (* &H400C7048) SCT CTIN_2 capture input multiplexer */
  '__IO uint32_t CTIN_3_IN                  '/*!< (* &H400C704C) SCT CTIN_3 capture input multiplexer */
  '__IO uint32_t CTIN_4_IN                  '/*!< (* &H400C7050) SCT CTIN_4 capture input multiplexer */
  '__IO uint32_t CTIN_5_IN                  '/*!< (* &H400C7054) SCT CTIN_5 capture input multiplexer */
  '__IO uint32_t CTIN_6_IN                  '/*!< (* &H400C7058) SCT CTIN_6 capture input multiplexer */
  '__IO uint32_t CTIN_7_IN                  '/*!< (* &H400C705C) SCT CTIN_7 capture input multiplexer */
  '__IO uint32_t VADC_TRIGGER_IN            '/*!< (* &H400C7060) ADC trigger input multiplexer */
  '__IO uint32_t EVENTROUTER_13_IN          '/*!< (* &H400C7064) Event router input 13 multiplexer */
  '__IO uint32_t EVENTROUTER_14_IN          '/*!< (* &H400C7068) Event router input 14 multiplexer */
  '__IO uint32_t EVENTROUTER_16_IN          '/*!< (* &H400C706C) Event router input 16 multiplexer */
  '__IO uint32_t ADCSTART0_IN               '/*!< (* &H400C7070) ADC start0 input multiplexer */
  '__IO uint32_t ADCSTART1_IN               '/*!< (* &H400C7074) ADC start1 input multiplexer */
'} LPC_GIMA_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                          DAC                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx DAC Modification date=1/18/2011 Major revision=0 Minor revision=7  (DAC)
'  */

'typedef struct '{                            '/*!< (* &H400E1000) DAC Structure        '  */
  '__IO uint32_t CR                         '/*!< (* &H400E1000) DAC register. Holds the conversion data. */
  '__IO uint32_t CTRL                       '/*!< (* &H400E1004) DAC control register.'  */
  '__IO uint32_t CNTVAL                     '/*!< (* &H400E1008) DAC counter value register. */
'} LPC_DAC_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                        C_CANn                                        -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx C_CAN Modification date=1/18/2011 Major revision=0 Minor revision=7  (C_CANn)
   ' &H400A4000 / &H400E2000
'  */

'typedef struct '{                            '/*!< (* &H400E2000) C_CAN Structure     '  */
  '__IO uint32_t CNTL                       '/*!< (* &H400E2000) CAN control          '  */
  '__IO uint32_t STAT                       '/*!< (* &H400E2004) Status register      '  */
  '__I  uint32_t EC                         '/*!< (* &H400E2008) Error counter        '  */
  '__IO uint32_t BT                         '/*!< (* &H400E200C) Bit timing register  '  */
  '__I  uint32_t INT                        '/*!< (* &H400E2010) Interrupt register   '  */
  '__IO uint32_t TEST                       '/*!< (* &H400E2014) Test register        '  */
  '__IO uint32_t BRPE                       '/*!< (* &H400E2018) Baud rate prescaler extension register */
  '__IO uint32_t IF1_CMDREQ                 '/*!< (* &H400E2020) Message interface command request'  */
  
'  'union '{
    '__IO uint32_t IF1_CMDMSK_R             '/*!< (* &H400E2024) Message interface command mask (read direction) */
    '__IO uint32_t IF1_CMDMSK_W             '/*!< (* &H400E2024) Message interface command mask (write direction) */
  '}
  '__IO uint32_t IF1_MSK1                   '/*!< (* &H400E2028) Message interface mask 1 */
  '__IO uint32_t IF1_MSK2                   '/*!< (* &H400E202C) Message interface 1 mask 2 */
  '__IO uint32_t IF1_ARB1                   '/*!< (* &H400E2030) Message interface 1 arbitration 1 */
  '__IO uint32_t IF1_ARB2                   '/*!< (* &H400E2034) Message interface 1 arbitration 2 */
  '__IO uint32_t IF1_MCTRL                  '/*!< (* &H400E2038) Message interface 1 message control */
  '__IO uint32_t IF1_DA1                    '/*!< (* &H400E203C) Message interface data A1 */
  '__IO uint32_t IF1_DA2                    '/*!< (* &H400E2040) Message interface 1 data A2 */
  '__IO uint32_t IF1_DB1                    '/*!< (* &H400E2044) Message interface 1 data B1 */
  '__IO uint32_t IF1_DB2                    '/*!< (* &H400E2048) Message interface 1 data B2 */
  '__IO uint32_t IF2_CMDREQ                 '/*!< (* &H400E2080) Message interface command request'  */

  'union '{
    '__IO uint32_t IF2_CMDMSK_R             '/*!< (* &H400E2084) Message interface command mask (read direction) */
    '__IO uint32_t IF2_CMDMSK_W             '/*!< (* &H400E2084) Message interface command mask (write direction) */
  '}
  '__IO uint32_t IF2_MSK1                   '/*!< (* &H400E2088) Message interface mask 1 */
  '__IO uint32_t IF2_MSK2                   '/*!< (* &H400E208C) Message interface 1 mask 2 */
  '__IO uint32_t IF2_ARB1                   '/*!< (* &H400E2090) Message interface 1 arbitration 1 */
  '__IO uint32_t IF2_ARB2                   '/*!< (* &H400E2094) Message interface 1 arbitration 2 */
  '__IO uint32_t IF2_MCTRL                  '/*!< (* &H400E2098) Message interface 1 message control */
  '__IO uint32_t IF2_DA1                    '/*!< (* &H400E209C) Message interface data A1 */
  '__IO uint32_t IF2_DA2                    '/*!< (* &H400E20A0) Message interface 1 data A2 */
  '__IO uint32_t IF2_DB1                    '/*!< (* &H400E20A4) Message interface 1 data B1 */
  '__IO uint32_t IF2_DB2                    '/*!< (* &H400E20A8) Message interface 1 data B2 */
  '__I  uint32_t TXREQ1                     '/*!< (* &H400E2100) Transmission request 1 */
  '__I  uint32_t TXREQ2                     '/*!< (* &H400E2104) Transmission request 2 */
  '__I  uint32_t ND1                        '/*!< (* &H400E2120) New data 1           '  */
  '__I  uint32_t ND2                        '/*!< (* &H400E2124) New data 2           '  */
  '__I  uint32_t IR1                        '/*!< (* &H400E2140) Interrupt pending 1  '  */
  '__I  uint32_t IR2                        '/*!< (* &H400E2144) Interrupt pending 2  '  */
  '__I  uint32_t MSGV1                      '/*!< (* &H400E2160) Message valid 1      '  */
  '__I  uint32_t MSGV2                      '/*!< (* &H400E2164) Message valid 2      '  */
  '__IO uint32_t CLKDIV                     '/*!< (* &H400E2180) CAN clock divider register */
'} LPC_C_CANn_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                         ADCn                                         -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief Product name title=UM10430 Chapter title=LPC43xx 10-bit ADC0/1 Modification date=1/18/2011 Major revision=0 Minor revision=7  (ADCn)
  ' &H400E3000 / &H400E4000
'  */

'typedef struct '{                            '/*!< (* &H400Ex000) ADCn Structure       '  */
#define ADC_CR                         * &H400Ex000 'A/D Control Register. The AD0CR register must be written to select the operating mode before A/D conversion can occur. */
#define ADC_GDR                        * &H400Ex004 'A/D Global Data Register. Contains the result of the most recent A/D conversion. */
#define ADC_INTEN                      * &H400Ex00C 'A/D Interrupt Enable Register. This register contains enable bits that allow the DONE flag of each A/D channel to be included or excluded from contributing to the generation of an A/D interrupt. */
#define ADC_DR0                      * &H400Ex010 'A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
#define ADC_DR1                      * &H400Ex014 'A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
#define ADC_DR2                      * &H400Ex018 'A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
#define ADC_DR3                      * &H400Ex01c 'A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
#define ADC_DR4                      * &H400Ex020 'A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
#define ADC_DR5                      * &H400Ex024 'A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
#define ADC_DR6                      * &H400Ex028 'A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
#define ADC_DR7                      * &H400Ex02c 'A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
#define ADC_STAT                       * &H400Ex030 'A/D Status Register. This register contains DONE and OVERRUN flags for all of the A/D channels, as well as the A/D interrupt flag. */
'} LPC_ADCn_Type



'// ------------------------------------------------------------------------------------------------
'// -----                                         Video ADC                                    -----
'// ------------------------------------------------------------------------------------------------
'/**
'  * 
   ' &H400F0000
'  */

'typedef struct '{                            
  '__O  uint32_t FLUSH                      '/*!< (* &H400F0000) A/D Flush FIFO       '  */
  '__IO uint32_t DMA_REQ                    '/*!< (* &H400F0004) A/D DMA request a DMA write to load a descriptor table from memory */
  '__I  uint32_t FIFO_STS                   '/*!< (* &H400F0008) A/D Full / count / empty status */
  '__IO uint32_t FIFO_CFG                   '/*!< (* &H400F000C) A/D FIFO configuration - regular or packed samples */
  '__O  uint32_t TRIGGER                    '/*!< (* &H400F0010) A/D Trigger to initiate timer and descriptor table processing */
  '__IO uint32_t DSCR_STS                   '/*!< (* &H400F0014) A/D Descriptor processing status register */
  '__IO uint32_t POWER_DOWN                 '/*!< (* &H400F0018) A/D ADC power down control */
  '__IO uint32_t CONFIG                     '/*!< (* &H400F001C) A/D ADC configuration register */
  '__IO uint32_t THR_A                      '/*!< (* &H400F0020) A/D Threshold register A */
  '__IO uint32_t THR_B                      '/*!< (* &H400F0024) A/D Threshold register B */
  '__I  uint32_t LAST_SAMPLE[6]             '/*!< (* &H400F0028 to &H400F003C) A/D Last sample registers - sample data and results of window comparator */
  '__IO uint32_t ADC_DEBUG                  '/*!< (* &H400F0100) A/D Debug Register*/
  '__IO uint32_t ADC_SPEED                  '/*!< (* &H400F0104) A/D Speed setting register */
  '__IO uint32_t POWER_CONTROL              '/*!< (* &H400F0108) A/D Power control register*/
  '__I  uint32_t FIFO_OUTPUT[16]            '/*!< (* &H400F0200) A/D FIFO output results */
  '__IO uint32_t DESCRIPTOR_0[8]            '/*!< (* &H400F0300) A/D Descriptor entries table 0 */
  '__IO uint32_t DESCRIPTOR_1[8]            '/*!< (* &H400F0320) A/D Descriptor entries table 1 */
  '__O  uint32_t CLR_EN0                    '/*!< (* &H400F0F00) A/D Interupt 0 bit mask fields Clear enable */
  '__O  uint32_t SET_EN0                    '/*!< (* &H400F0F04) A/D Interrupt 0 bit mask fields Set enable */
  '__I  uint32_t MASK0                      '/*!< (* &H400F0F08) A/D Interrupt 0 enable register */
  '__I  uint32_t STATUS0                    '/*!< (* &H400F0F0C) A/D Interrtpt 0 status register */
  '__O  uint32_t CLR_STAT0                  '/*!< (* &H400F0F10) A/D Interrupt 0 Clear Status */
  '__O  uint32_t SET_STAT0                  '/*!< (* &H400F0F14) A/D Interrupt 0 set status */
  '__O  uint32_t CLR_EN1                    '/*!< (* &H400F0F20) A/D Interrupt 1 clear mask */
  '__O  uint32_t SET_EN1                    '/*!< (* &H400F0F24) A/D Interrupt 1 bit mask fields Set enable */
  '__I  uint32_t MASK1                      '/*!< (* &H400F0F28) A/D Interrupt 1 enable register */
  '__I  uint32_t STATUS1                    '/*!< (* &H400F0F2C) A/D Interrtpt 1 status register */
  '__O  uint32_t CLR_STAT1                  '/*!< (* &H400F0F30) A/D Interrupt 1 Clear Status */
  '__O  uint32_t SET_STAT1                  '/*!< (* &H400F0F34) A/D Interrupt 1 set status */
'} LPC_VADC_Type

'// ------------------------------------------------------------------------------------------------
'// -----                                       GPIO_PORT                                      -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief GPIO port  (GPIO_PORT)
    'Note: it is not a generic gpio but a high speed gpio (hs gpio)!
'  */

'typedef struct '{                            '/*!< (* &H400F4000) GPIO_PORT Structure  '  */
  '__IO uint8_t B[256]                      '/*!< (* &H400F4000) Byte pin registers port 0 to 5 pins PIOn_0 to PIOn_31 */
  '__IO uint32_t W[256]                     '/*!< (* &H400F5000) Word pin registers port 0 to 5 */
  '__IO uint32_t DIR[8]                     '/*!< (* &H400F6000) Direction registers port n */
  '__IO uint32_t MASK[8]                    '/*!< (* &H400F6080) Mask register port n '  */
  '__IO uint32_t PIN[8]                     '/*!< (* &H400F6100) Portpin register port n */
  '__IO uint32_t MPIN[8]                    '/*!< (* &H400F6180) Masked port register port n */
  '__IO uint32_t SET[8]                     '/*!< (* &H400F6200) Write: Set register for port n Read: output bits for port n */
  '__O  uint32_t CLR[8]                     '/*!< (* &H400F6280) Clear port n         '  */
  '__O  uint32_t NOT[8]                     '/*!< (* &H400F6300) Toggle port n        '  */
'} LPC_GPIO_PORT_Type

'// ------------------------------------------------------------------------------------------------
'// -----                                         GPIOn (same as GPIO_PORT, backward compatibility)                                        -----
'// ------------------------------------------------------------------------------------------------

'// Is a backward compatibility for struct members important: DIR/MASK/PIN/SET/CLR??? NOT is new.

'typedef struct '{
  '__IO uint32_t DIR                       '/*!< (* &H400F6000) Direction registers port n */
  '__IO uint32_t MASK                      '/*!< (* &H400F6080) Mask register port n */
  '__IO uint32_t PIN                       '/*!< (* &H400F6180) Masked port register port n */
  '__IO uint32_t SET                       '/*!< (* &H400F6200) Write: Set register for port n Read: output bits for port n */
  '__O  uint32_t CLR                       '/*!< (* &H400F6280) Clear port n */
  '__O  uint32_t NOT                       '/*!< (* &H400F6300) Toggle port n */
  '//to be expanded
'} LPC_GPIOn_Type

'// ------------------------------------------------------------------------------------------------
'// -----                                     GPIO_PIN_INT                                     -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief GPIO pin interrupt (GPIO_PIN_INT)
'  */

'typedef struct '{                            '/*!< (* &H40087000) GPIO_PIN_INT Structure */
  '__IO uint32_t ISEL                       '/*!< (* &H40087000) Pin Interrupt Mode register */
  '__IO uint32_t IENR                       '/*!< (* &H40087004) Pin Interrupt Enable (Rising) register */
  '__O  uint32_t SIENR                      '/*!< (* &H40087008) Set Pin Interrupt Enable (Rising) register */
  '__O  uint32_t CIENR                      '/*!< (* &H4008700C) Clear Pin Interrupt Enable (Rising) register */
  '__IO uint32_t IENF                       '/*!< (* &H40087010) Pin Interrupt Enable Falling Edge / Active Level register */
  '__O  uint32_t SIENF                      '/*!< (* &H40087014) Set Pin Interrupt Enable Falling Edge / Active Level register */
  '__O  uint32_t CIENF                      '/*!< (* &H40087018) Clear Pin Interrupt Enable Falling Edge / Active Level address */
  '__IO uint32_t RISE                       '/*!< (* &H4008701C) Pin Interrupt Rising Edge register */
  '__IO uint32_t FALL                       '/*!< (* &H40087020) Pin Interrupt Falling Edge register */
  '__IO uint32_t IST                        '/*!< (* &H40087024) Pin Interrupt Status register */
'} LPC_GPIO_PIN_INT_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                    GPIO_GROUP_INTn                                   -----
'// ------------------------------------------------------------------------------------------------


'/**
'  * @brief GPIO group interrupt 0/1 (GPIO_GROUP_INTn) 
    '&H40088000/&H40089000
'  */

'typedef struct '{                            '/*!< (* &H4008x000) GPIO_GROUP_INT0 Structure */
  '__IO uint32_t CTRL                       '/*!< (* &H4008x000) GPIO grouped interrupt control register */
  '__IO uint32_t PORT_POL[8]                '/*!< (* &H4008x020) GPIO grouped interrupt port polarity register */
  '__IO uint32_t PORT_ENA[8]                '/*!< (* &H4008x040) GPIO grouped interrupt port 0/1 enable register */
'} LPC_GPIO_GROUP_INTn_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                  Random number generation (RNG)                      -----
'// ------------------------------------------------------------------------------------------------

'typedef struct
'{
  '__I	uint32_t RANDOM_NUMBER     '/*!< (* &H40054000) Random number */
  '__I	uint32_t STATISTIC         '/*!< (* &H40054004) Statistic */
  '__IO	uint32_t COUNTER_SEL_RNG   '/*!< (* &H40054008) Select for statistics */
  '__IO	uint32_t POWERDOWN         '/*!< (* &H40054FF4) Powerdown mode */
'} LPC_RNG_Type


'// ------------------------------------------------------------------------------------------------
'// -----                                  Serial GPIO (SGPIO)                                 -----
'// ------------------------------------------------------------------------------------------------

'typedef struct
'{
#define SGPIO_OUT_MUX_CFG(x)  	*(&H40101000+(x<<2)) 	'[16] Pin output multiplexer configuration */
#define SGPIO_SGPIO_MUX_CFG(x)	*(&H40101040+(x<<2)) 	'[16] SGPIO input multiplexer configuration */
#define SGPIO_SLICE_MUX_CFG(x)	*(&H40101080+(x<<2)) 	'[16] Slice multiplexer configuration */
#define SGPIO_REG(x)          	*(&H401010C0+(x<<2)) 	'[16] Register */
#define SGPIO_REG_SS(x)       	*(&H40101100+(x<<2)) 	'[16] Shadow register */
#define SGPIO_PRESET(x)       	*(&H40101140+(x<<2)) 	'[16] Reload value of  COUNT0, loaded when COUNT0 reaches &H0 */
#define SGPIO_COUNT(x)        	*(&H40101180+(x<<2)) 	'[16] Down counter, counts down each clock cycle */
#define SGPIO_POS(x)          	*(&H401011C0+(x<<2)) 	'[16] Each time COUNT0 reaches &H0 POS counts down */
#define SGPIO_MASK_A           	*&H40101200 	'Mask for pattern match function of slice A */
#define SGPIO_MASK_H           	*&H40101204 	'Mask for pattern match function of slice H */
#define SGPIO_MASK_I           	*&H40101208 	'Mask for pattern match function of slice I */
#define SGPIO_MASK_P           	*&H4010120C 	'Mask for pattern match function of slice P */
#define SGPIO_GPIO_INREG       	*&H40101210 	'GPIO input status register */
#define SGPIO_GPIO_OUTREG      	*&H40101214 	'GPIO output control register */
#define SGPIO_GPIO_OEREG       	*&H40101218 	'GPIO OE control register */
#define SGPIO_CTRL_ENABLE      	*&H4010121C 	'Enables the slice COUNT counter */
#define SGPIO_CTRL_DISABLE     	*&H40101220 	'Disables the slice COUNT counter */
#define SGPIO_CLR_EN0          	*&H40101F00 	'Shift clock interrupt clear mask */
#define SGPIO_SET_EN0          	*&H40101F04 	'Shift clock interrupt set mask */
#define SGPIO_ENABLE0          	*&H40101F08 	'Shift clock interrupt enable */
#define SGPIO_STATUS0          	*&H40101F0C 	'Shift clock interrupt status */
#define SGPIO_CLR_STAT0        	*&H40101F10 	'Shift clock interrupt clear status */
#define SGPIO_SET_STAT0        	*&H40101F14 	'Shift clock interrupt set status */
#define SGPIO_CLR_EN1          	*&H40101F20 	'Capture clock interrupt clear mask */
#define SGPIO_SET_EN1          	*&H40101F24 	'Capture clock interrupt set mask */
#define SGPIO_ENABLE1          	*&H40101F28 	'Capture clock interrupt enable */
#define SGPIO_STATUS1          	*&H40101F2C 	'Capture clock interrupt status */
#define SGPIO_CLR_STAT1        	*&H40101F30 	'Capture clock interrupt clear status */
#define SGPIO_SET_STAT1        	*&H40101F34 	'Capture clock interrupt set status */
#define SGPIO_CLR_EN2          	*&H40101F40 	'Pattern match interrupt clear mask */
#define SGPIO_SET_EN2          	*&H40101F44 	'Pattern match interrupt set mask */
#define SGPIO_ENABLE2          	*&H40101F48 	'Pattern match interrupt enable */
#define SGPIO_STATUS2          	*&H40101F4C 	'Pattern match interrupt status */
#define SGPIO_CLR_STAT2        	*&H40101F50 	'Pattern match interrupt clear status */
#define SGPIO_SET_STAT2        	*&H40101F54 	'Pattern match interrupt set status */
#define SGPIO_CLR_EN3          	*&H40101F60 	'Input interrupt clear mask */
#define SGPIO_SET_EN3          	*&H40101F64 	'Input bit match interrupt set mask */
#define SGPIO_ENABLE3          	*&H40101F68 	'Input bit match interrupt enable */
#define SGPIO_STATUS3          	*&H40101F6C 	'Input bit match interrupt status */
#define SGPIO_CLR_STAT3        	*&H40101F70 	'Input bit match interrupt clear status */
#define SGPIO_SET_STAT3        	*&H40101F74 	'Input bit match interrupt set status */
'} LPC_SGPIO_Type



'// ------------------------------------------------------------------------------------------------
'// -----                                 Peripheral memory map                                -----
'// ------------------------------------------------------------------------------------------------

#define LPC_SCT_BASE              (&H40000000)
#define LPC_GPDMA_BASE            (&H40002000)
#define LPC_SPIFI_BASE            (&H40003000)
#define LPC_SDMMC_BASE            (&H40004000)
#define LPC_EMC_BASE              (&H40005000)
#define LPC_USB0_BASE             (&H40006000)
#define LPC_USB1_BASE             (&H40007000)
#define LPC_LCD_BASE              (&H40008000)
#define LPC_ETHERNET_BASE         (&H40010000)
#define LPC_ATIMER_BASE           (&H40040000)
#define LPC_REGFILE_BASE          (&H40041000)
#define LPC_PMC_BASE              (&H40042000)
#define LPC_CREG_BASE             (&H40043000)
#define LPC_EVENTROUTER_BASE      (&H40044000)
#define LPC_RTC_BASE              (&H40046000)
#define LPC_CGU_BASE              (&H40050000)
#define LPC_CCU1_BASE             (&H40051000)
#define LPC_CCU2_BASE             (&H40052000)
#define LPC_RGU_BASE              (&H40053000)
#define LPC_WWDT_BASE             (&H40080000)
#define LPC_USART0_BASE           (&H40081000)
#define LPC_USART2_BASE           (&H400C1000)
#define LPC_USART3_BASE           (&H400C2000)
#define LPC_UART1_BASE            (&H40082000)
#define LPC_SSP0_BASE             (&H40083000)
#define LPC_SSP1_BASE             (&H400C5000)
#define LPC_TIMER0_BASE           (&H40084000)
#define LPC_TIMER1_BASE           (&H40085000)
#define LPC_TIMER2_BASE           (&H400C3000)
#define LPC_TIMER3_BASE           (&H400C4000)
#define LPC_SCU_BASE              (&H40086000)
#define LPC_GPIO_PIN_INT_BASE     (&H40087000)
#define LPC_GPIO_GROUP_INT0_BASE  (&H40088000)
#define LPC_GPIO_GROUP_INT1_BASE  (&H40089000)
#define LPC_MCPWM_BASE            (&H400A0000)
#define LPC_I2C0_BASE             (&H400A1000)
#define LPC_I2C1_BASE             (&H400E0000)
#define LPC_I2S0_BASE             (&H400A2000)
#define LPC_I2S1_BASE             (&H400A3000)
#define LPC_C_CAN1_BASE           (&H400A4000)
#define LPC_RITIMER_BASE          (&H400C0000)
#define LPC_QEI_BASE              (&H400C6000)
#define LPC_GIMA_BASE             (&H400C7000)
#define LPC_DAC_BASE              (&H400E1000)
#define LPC_C_CAN0_BASE           (&H400E2000)
#define LPC_ADC0_BASE             (&H400E3000)
#define LPC_ADC1_BASE             (&H400E4000)
#define LPC_GPIO_PORT_BASE        (&H400F4000)
'//The following are applied to have a backward compitability with existing Eagle/Raptor GPIOs
#define LPC_GPIO0_BASE            (&H400F4000)
#define LPC_GPIO1_BASE            (&H400F4004)
#define LPC_GPIO2_BASE            (&H400F4008)
#define LPC_GPIO3_BASE            (&H400F400C)
#define LPC_GPIO4_BASE            (&H400F4010)
#define LPC_GPIO5_BASE            (&H400F4014)
#define LPC_GPIO6_BASE            (&H400F4018)
#define LPC_GPIO7_BASE            (&H400F401C)
#define LPC_RNG_BASE              (&H40054000)
#define LPC_SGPIO_BASE            (&H40101000)
#define LPC_VADC_BASE             (&H400F0000)


'// ------------------------------------------------------------------------------------------------
'// -----                                Peripheral declaration                                -----
'// ------------------------------------------------------------------------------------------------

#define LPC_SCT                   ((LPC_SCT_Type          '  *) LPC_SCT_BASE)
#define LPC_GPDMA                 ((LPC_GPDMA_Type        '  *) LPC_GPDMA_BASE)
#define LPC_SPIFI                 ((LPC_SPIFI_Type        '  *) LPC_SPIFI_BASE)
#define LPC_SDMMC                 ((LPC_SDMMC_Type        '  *) LPC_SDMMC_BASE)
#define LPC_EMC                   ((LPC_EMC_Type          '  *) LPC_EMC_BASE)
#define LPC_USB0                  ((LPC_USB0_Type         '  *) LPC_USB0_BASE)
#define LPC_USB1                  ((LPC_USB1_Type         '  *) LPC_USB1_BASE)
#define LPC_LCD                   ((LPC_LCD_Type          '  *) LPC_LCD_BASE)
#define LPC_ETHERNET              ((LPC_ETHERNET_Type     '  *) LPC_ETHERNET_BASE)
#define LPC_ATIMER                ((LPC_ATIMER_Type       '  *) LPC_ATIMER_BASE)
#define LPC_REGFILE               ((LPC_REGFILE_Type      '  *) LPC_REGFILE_BASE)
#define LPC_PMC                   ((LPC_PMC_Type          '  *) LPC_PMC_BASE)
#define LPC_CREG                  ((LPC_CREG_Type         '  *) LPC_CREG_BASE)
#define LPC_EVENTROUTER           ((LPC_EVENTROUTER_Type  '  *) LPC_EVENTROUTER_BASE)
#define LPC_RTC                   ((LPC_RTC_Type          '  *) LPC_RTC_BASE)
#define LPC_CGU                   ((LPC_CGU_Type          '  *) LPC_CGU_BASE)
#define LPC_CCU1                  ((LPC_CCU1_Type         '  *) LPC_CCU1_BASE)
#define LPC_CCU2                  ((LPC_CCU2_Type         '  *) LPC_CCU2_BASE)
#define LPC_RGU                   ((LPC_RGU_Type          '  *) LPC_RGU_BASE)
#define LPC_WWDT                  ((LPC_WWDT_Type         '  *) LPC_WWDT_BASE)
#define LPC_USART0                ((LPC_USARTn_Type       '  *) LPC_USART0_BASE)
#define LPC_UART0                 ((LPC_USARTn_Type       '  *) LPC_USART0_BASE)		'// for BASIC
#define LPC_USART2                ((LPC_USARTn_Type       '  *) LPC_USART2_BASE)
#define LPC_USART3                ((LPC_USARTn_Type       '  *) LPC_USART3_BASE)
#define LPC_UART1                 ((LPC_UART1_Type        '  *) LPC_UART1_BASE)
#define LPC_SSP0                  ((LPC_SSPn_Type         '  *) LPC_SSP0_BASE)
#define LPC_SSP1                  ((LPC_SSPn_Type         '  *) LPC_SSP1_BASE)
#define LPC_TIMER0                ((LPC_TIMERn_Type       '  *) LPC_TIMER0_BASE)
#define LPC_TIM0                  ((LPC_TIMERn_Type       '  *) LPC_TIMER0_BASE)		'// for BASIC
#define LPC_TIMER1                ((LPC_TIMERn_Type       '  *) LPC_TIMER1_BASE)
#define LPC_TIM1                  ((LPC_TIMERn_Type       '  *) LPC_TIMER1_BASE)		'// for BASIC
#define LPC_TIMER2                ((LPC_TIMERn_Type       '  *) LPC_TIMER2_BASE)
#define LPC_TIMER3                ((LPC_TIMERn_Type       '  *) LPC_TIMER3_BASE)
#define LPC_SCU                   ((LPC_SCU_Type          '  *) LPC_SCU_BASE)
#define LPC_GPIO_PIN_INT          ((LPC_GPIO_PIN_INT_Type '  *) LPC_GPIO_PIN_INT_BASE)
#define LPC_GPIO_GROUP_INT0       ((LPC_GPIO_GROUP_INT0_Type*) LPC_GPIO_GROUP_INT0_BASE)
#define LPC_GPIO_GROUP_INT1       ((LPC_GPIO_GROUP_INT1_Type*) LPC_GPIO_GROUP_INT1_BASE)
#define LPC_MCPWM                 ((LPC_MCPWM_Type        '  *) LPC_MCPWM_BASE)
#define LPC_I2C0                  ((LPC_I2Cn_Type         '  *) LPC_I2C0_BASE)
#define LPC_I2C1                  ((LPC_I2Cn_Type         '  *) LPC_I2C1_BASE)
#define LPC_I2S0                  ((LPC_I2Sn_Type         '  *) LPC_I2S0_BASE)
#define LPC_I2S1                  ((LPC_I2Sn_Type         '  *) LPC_I2S1_BASE)
#define LPC_C_CAN1                ((LPC_C_CANn_Type       '  *) LPC_C_CAN1_BASE)
#define LPC_RITIMER               ((LPC_RITIMER_Type      '  *) LPC_RITIMER_BASE)
#define LPC_QEI                   ((LPC_QEI_Type          '  *) LPC_QEI_BASE)
#define LPC_GIMA                  ((LPC_GIMA_Type         '  *) LPC_GIMA_BASE)
#define LPC_DAC                   ((LPC_DAC_Type          '  *) LPC_DAC_BASE)
#define LPC_C_CAN0                ((LPC_C_CANn_Type       '  *) LPC_C_CAN0_BASE)
#define LPC_ADC0                  ((LPC_ADCn_Type         '  *) LPC_ADC0_BASE)
#define LPC_ADC1                  ((LPC_ADCn_Type         '  *) LPC_ADC1_BASE)
#define LPC_GPIO_PORT             ((LPC_GPIO_PORT_Type    '  *) LPC_GPIO_PORT_BASE) '//Short name: HSGPIO???
#define LPC_GPIO0                 ((LPC_GPIOn_Type        '  *) LPC_GPIO0_BASE)     '//Backward compitable for all GPIOs
#define LPC_GPIO1                 ((LPC_GPIOn_Type        '  *) LPC_GPIO1_BASE)
#define LPC_GPIO2                 ((LPC_GPIOn_Type        '  *) LPC_GPIO2_BASE)
#define LPC_GPIO3                 ((LPC_GPIOn_Type        '  *) LPC_GPIO3_BASE)
#define LPC_GPIO4                 ((LPC_GPIOn_Type        '  *) LPC_GPIO4_BASE)
#define LPC_GPIO5                 ((LPC_GPIOn_Type        '  *) LPC_GPIO5_BASE)
#define LPC_GPIO6                 ((LPC_GPIOn_Type        '  *) LPC_GPIO6_BASE)
#define LPC_GPIO7                 ((LPC_GPIOn_Type        '  *) LPC_GPIO7_BASE)
#define LPC_SGPIO                 ((LPC_SGPIO_Type        '  *) LPC_SGPIO_BASE)
#define LPC_RNG                   ((LPC_RNG_Type          '  *) LPC_RNG_BASE)
#define LPC_VADC                  ((LPC_VADC_Type         '  *) LPC_VADC_BASE)

#define LPC_ADC LPC_ADC0



#endif  '// __LPC43XX_A_H__
