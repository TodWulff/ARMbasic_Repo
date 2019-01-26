'******************************************************************************
'lpc21&H.h - Register defs for Philips LPC210X: LPC2104, LPC2105 and LPC2106
'THE SOFTWARE IS DELIVERED "AS IS" WITHOUT WARRANTY OR CONDITION OF ANY KIND, 
'EITHER EXPRESS, IMPLIED OR STATUTORY. THIS INCLUDES WITHOUT LIMITATION ANY 
'WARRANTY OR CONDITION WITH RESPECT TO MERCHANTABILITY OR FITNESS FOR ANY 
'PARTICULAR PURPOSE, OR AGAINST THE INFRINGEMENTS OF INTELLECTUAL PROPERTY RIGHTS 
'OF OTHERS.
'This file may be freely used for commercial and non-commercial applications, 
'including being redistributed with any tools.
'If you find a problem with the file, please report it so that it can be fixed.
'Created by Sten Larsson (sten_larsson at yahoo com)
'Edited by Richard Barry.
'Modified by Bruce Eisenhard, Mike ray
'******************************************************************************

#ifndef LPC210x_INC
#define	LPC210x_INC

'## MISC

'EINT0 IO(14)
'EINT1 RTS
'EINT2 IO(15)

#ifdef LPC2103
  #define psfEINT0 &H00000001 'on PINSEL1
  #define psfEINT1 &H10000000 'on PINSEL0
  #define psfEINT2 &H40000000 'on PINSEL0
#endif

#ifdef LPC2106
  #define psfEINT0 &H00000001 'on PINSEL1
  #define psfEINT1 &H20000000 'on PINSEL0
  #define psfEINT2 &H80000000 'on PINSEL0
#endif

#ifdef LPC2138
  #define psfEINT0 &H00000001 'on PINSEL1
  #define psfEINT1 &H20000000 'on PINSEL0
  #define psfEINT2 &H80000000 'on PINSEL0
#endif


        ' Constants for data to put in IRQ/FIQ Exception Vectors 
#define VECTDATA_IRQ  &HE51FFFF0  ' LDR PC,[PC,#-&HFF0] 
#define VECTDATA_FIQ  ' __TODO 


'## VECTORED INTERRUPT CONTROLLER

#define VICIRQStatus    *&HFFFFF000
#define VICFIQStatus    *&HFFFFF004
#define VICRawIntr      *&HFFFFF008
#define VICIntSelect    *&HFFFFF00C
#define VICIntEnable    *&HFFFFF010
#define VICIntEnClear   *&HFFFFF014
#define VICSoftInt      *&HFFFFF018
#define VICSoftIntClear *&HFFFFF01C
#define VICProtection   *&HFFFFF020
#define VICVectAddr     *&HFFFFF030
#define VICDefVectAddr  *&HFFFFF034

#define VICVectAddr0    *&HFFFFF100
#define VICVectAddr1    *&HFFFFF104
#define VICVectAddr2    *&HFFFFF108
#define VICVectAddr3    *&HFFFFF10C
#define VICVectAddr4    *&HFFFFF110
#define VICVectAddr5    *&HFFFFF114
#define VICVectAddr6    *&HFFFFF118
#define VICVectAddr7    *&HFFFFF11C
#define VICVectAddr8    *&HFFFFF120
#define VICVectAddr9    *&HFFFFF124
#define VICVectAddr10   *&HFFFFF128
#define VICVectAddr11   *&HFFFFF12C
#define VICVectAddr12   *&HFFFFF130
#define VICVectAddr13   *&HFFFFF134
#define VICVectAddr14   *&HFFFFF138
#define VICVectAddr15   *&HFFFFF13C

#define VICVectCntl0    *&HFFFFF200
#define VICVectCntl1    *&HFFFFF204
#define VICVectCntl2    *&HFFFFF208
#define VICVectCntl3    *&HFFFFF20C
#define VICVectCntl4    *&HFFFFF210
#define VICVectCntl5    *&HFFFFF214
#define VICVectCntl6    *&HFFFFF218
#define VICVectCntl7    *&HFFFFF21C
#define VICVectCntl8    *&HFFFFF220
#define VICVectCntl9    *&HFFFFF224
#define VICVectCntl10   *&HFFFFF228
#define VICVectCntl11   *&HFFFFF22C
#define VICVectCntl12   *&HFFFFF230
#define VICVectCntl13   *&HFFFFF234
#define VICVectCntl14   *&HFFFFF238
#define VICVectCntl15   *&HFFFFF23C

#define VICITCR         *&HFFFFF300
#define VICITIP1        *&HFFFFF304
#define VICITIP2        *&HFFFFF308
#define VICITOP1        *&HFFFFF30C
#define VICITOP2        *&HFFFFF310
#define VICPeriphID0    *&HFFFFFFE0
#define VICPeriphID1    *&HFFFFFFE4
#define VICPeriphID2    *&HFFFFFFE8
#define VICPeriphID3    *&HFFFFFFEC


'## PCB - Pin Connect Block

#define PCB_PINSEL0     *&HE002C000
#define PCB_PINSEL1     *&HE002C004
' LPC2138
#define PCB_PINSEL2     *&HE002C014

#define PINSEL0     PCB_PINSEL0
#define PINSEL1     PCB_PINSEL1
' LPC2138
#define PINSEL2     PCB_PINSEL2

'## GPIO - General Purpose I/O

#if (defined LPC2106)
	' ignore earlier 2119, 2129, 2138 without fast ios

 #define GPIO_IOPIN      *&HE0028000 ' ALTERNATE NAME GPIO = GPIO0 
 #define GPIO_IOSET      *&HE0028004
 #define GPIO_IODIR      *&HE0028008
 #define GPIO_IOCLR      *&HE002800C
 
 #define GPIO0_IOPIN     *&HE0028000 ' ALTERNATE NAME GPIO = GPIO0 
 #define GPIO0_IOSET     *&HE0028004
 #define GPIO0_IODIR     *&HE0028008
 #define GPIO0_IOCLR     *&HE002800C
 
 #define GPIO1_IOPIN     *&HE0028010 
 #define GPIO1_IOSET     *&HE0028014
 #define GPIO1_IODIR     *&HE0028018
 #define GPIO1_IOCLR     *&HE002801C

#else
  	' high speed IOs
 #define SCB_SCS         *&HE01FC1A0	' set to 3 to enable highspeed IOs

 #define GPIO_IOPIN      *&H3FFFC014 ' ALTERNATE NAME GPIO = GPIO0 
 #define GPIO_IOSET      *&H3FFFC018
 #define GPIO_IODIR      *&H3FFFC000
 #define GPIO_IOCLR      *&H3FFFC01C
 
 #define GPIO0_IOPIN     *&H3FFFC014 ' ALTERNATE NAME GPIO = GPIO0 
 #define GPIO0_IOSET     *&H3FFFC018
 #define GPIO0_IODIR     *&H3FFFC000
 #define GPIO0_IOCLR     *&H3FFFC01C
 #define GPIO0_IOMASK    *&H3FFFC010
 
 ' LPC2148
 #define GPIO1_IOPIN     *&H3FFFC034 
 #define GPIO1_IOSET     *&H3FFFC038
 #define GPIO1_IODIR     *&H3FFFC020
 #define GPIO1_IOCLR     *&H3FFFC03C
 #define GPIO1_IOMASK    *&H3FFFC030
#endif

#define FIO0DIR			GPIO_IODIR
#define FIO0PIN			GPIO_IOPIN
#define FIO0SET			GPIO_IOSET
#define FIO0CLR			GPIO_IOCLR
#define FIO0MASK		GPIO_IOMASK

#define FIO1DIR			GPIO1_IODIR
#define FIO1PIN			GPIO1_IOPIN
#define FIO1SET			GPIO1_IOSET
#define FIO1CLR			GPIO1_IOCLR
#define FIO1MASK		GPIO1_IOMASK


'## UART0 / UART1

' ---- UART 0 --------------------------------------------- 
#define UART0_RBR       *&HE000C000
#define UART0_THR       *&HE000C000
#define UART0_IER       *&HE000C004
#define UART0_IIR       *&HE000C008
#define UART0_FCR       *&HE000C008
#define UART0_LCR       *&HE000C00C
#define UART0_LSR       *&HE000C014
#define UART0_SCR       *&HE000C01C
#define UART0_DLL       *&HE000C000
#define UART0_DLM       *&HE000C004

' ---- UART 1 --------------------------------------------- 
#define UART1_RBR       *&HE0010000
#define UART1_THR       *&HE0010000
#define UART1_IER       *&HE0010004
#define UART1_IIR       *&HE0010008
#define UART1_FCR       *&HE0010008
#define UART1_LCR       *&HE001000C
#define UART1_LSR       *&HE0010014
#define UART1_SCR       *&HE001001C
#define UART1_DLL       *&HE0010000
#define UART1_DLM       *&HE0010004
#define UART1_MCR       *&HE0010010
#define UART1_MSR       *&HE0010018

' use a pointer to save space 
#define UARTX_RBR       *(UARTBASE + &H00)
#define UARTX_THR       *(UARTBASE + &H00)
#define UARTX_IER       *(UARTBASE + &H04)
#define UARTX_IIR       *(UARTBASE + &H08)
#define UARTX_FCR       *(UARTBASE + &H08)
#define UARTX_LCR       *(UARTBASE + &H0C)
#define UARTX_LSR       *(UARTBASE + &H14)
#define UARTX_SCR       *(UARTBASE + &H1C)
#define UARTX_DLL       *(UARTBASE + &H00)
#define UARTX_DLM       *(UARTBASE + &H04)



'## I2C

#define I2C_I2CONSET    *&HE001C000
#define I2C_I2STAT      *&HE001C004
#define I2C_I2DAT       *&HE001C008
#define I2C_I2ADR       *&HE001C00C
#define I2C_I2SCLH      *&HE001C010
#define I2C_I2SCLL      *&HE001C014
#define I2C_I2CONCLR    *&HE001C018


'## SPI - Serial Peripheral Interface

#define SPI_SPCR        *&HE0020000
#define SPI_SPSR        *&HE0020004
#define SPI_SPDR        *&HE0020008
#define SPI_SPCCR       *&HE002000C
#define SPI_SPTCR       *&HE0020010
#define SPI_SPTSR       *&HE0020014
#define SPI_SPTOR       *&HE0020018
#define SPI_SPINT       *&HE002001C


'## Timer 0 and Timer 1

' ---- Timer 0 -------------------------------------------- 
#define T0_IR           *&HE0004000
#define T0_TCR          *&HE0004004
#define T0_TC           *&HE0004008
#define T0_PR           *&HE000400C
#define T0_PC           *&HE0004010
#define T0_MCR          *&HE0004014
#define T0_MR0          *&HE0004018
#define T0_MR1          *&HE000401C
#define T0_MR2          *&HE0004020
#define T0_MR3          *&HE0004024
#define T0_CCR          *&HE0004028
#define T0_CR0          *&HE000402C
#define T0_CR1          *&HE0004030
#define T0_CR2          *&HE0004034
#define T0_CR3          *&HE0004038
#define T0_EMR          *&HE000403C

' ---- Timer 1 -------------------------------------------- 
#define T1_IR           *&HE0008000
#define T1_TCR          *&HE0008004
#define T1_TC           *&HE0008008
#define T1_PR           *&HE000800C
#define T1_PC           *&HE0008010
#define T1_MCR          *&HE0008014
#define T1_MR0          *&HE0008018
#define T1_MR1          *&HE000801C
#define T1_MR2          *&HE0008020
#define T1_MR3          *&HE0008024
#define T1_CCR          *&HE0008028
#define T1_CR0          *&HE000802C
#define T1_CR1          *&HE0008030
#define T1_CR2          *&HE0008034
#define T1_CR3          *&HE0008038
#define T1_EMR          *&HE000803C

'  CPU TYPE == 2103  #if (defined ARM-mite) || (defined ARMexp-LITE)

#define T1_CTCR  		*&HE0008070 'Count Control Register T1CTCR 

#define PWM0CON       	*&HE0004074
#define PWM1CON       	*&HE0008074
#define PWM2CON       	*&HE0070074
#define PWM3CON       	*&HE0074074


' ---- Timer 2 -------------------------------------------- 
#define T2_IR           *&HE0070000
#define T2_TCR          *&HE0070004
#define T2_TC           *&HE0070008
#define T2_PR           *&HE007000C
#define T2_PC           *&HE0070010
#define T2_MCR          *&HE0070014
#define T2_MR0          *&HE0070018
#define T2_MR1          *&HE007001C
#define T2_MR2          *&HE0070020
#define T2_MR3          *&HE0070024
#define T2_CCR          *&HE0070028
#define T2_CR0          *&HE007002C
#define T2_CR1          *&HE0070030
#define T2_CR2          *&HE0070034
#define T2_CR3          *&HE0070038
#define T2_EMR          *&HE007003C

#define T2_CTCR  		*&HE0070070 

' ---- Timer 3 -------------------------------------------- 
#define T3_IR           *&HE0074000
#define T3_TCR          *&HE0074004
#define T3_TC           *&HE0074008
#define T3_PR           *&HE007400C
#define T3_PC           *&HE0074010
#define T3_MCR          *&HE0074014
#define T3_MR0          *&HE0074018
#define T3_MR1          *&HE007401C
#define T3_MR2          *&HE0074020
#define T3_MR3          *&HE0074024
#define T3_CCR          *&HE0074028
#define T3_CR0          *&HE007402C
#define T3_CR1          *&HE0074030
#define T3_CR2          *&HE0074034
#define T3_CR3          *&HE0074038
#define T3_EMR          *&HE007403C

#define T3_CTCR  		*&HE0074070 

'## PWM

#define PWM_IR          *&HE0014000
#define PWM_TCR         *&HE0014004
#define PWM_TC          *&HE0014008
#define PWM_PR          *&HE001400C
#define PWM_PC          *&HE0014010
#define PWM_MCR         *&HE0014014
#define PWM_MR0         *&HE0014018
#define PWM_MR1         *&HE001401C
#define PWM_MR2         *&HE0014020
#define PWM_MR3         *&HE0014024
#define PWM_MR4         *&HE0014040
#define PWM_MR5         *&HE0014044
#define PWM_MR6         *&HE0014048
#define PWM_EMR         *&HE001403C
#define PWM_PCR         *&HE001404C
#define PWM_LER         *&HE0014050
#define PWM_CCR         *&HE0014028
#define PWM_CR0         *&HE001402C
#define PWM_CR1         *&HE0014030
#define PWM_CR2         *&HE0014034
#define PWM_CR3         *&HE0014038

'## RTC

' ---- RTC: Miscellaneous Register Group ------------------ 
#define RTC_ILR         *&HE0024000
#define RTC_CTC         *&HE0024004
#define RTC_CCR         *&HE0024008  
#define RTC_CIIR        *&HE002400C
#define RTC_AMR         *&HE0024010
#define RTC_CTIME0      *&HE0024014
#define RTC_CTIME1      *&HE0024018
#define RTC_CTIME2      *&HE002401C

' ---- RTC: Timer Control Group --------------------------- 
#define RTC_SEC         *&HE0024020
#define RTC_MIN         *&HE0024024
#define RTC_HOUR        *&HE0024028
#define RTC_DAY         *&HE002402C
#define RTC_DOW         *&HE0024030
#define RTC_DOY         *&HE0024034
#define RTC_MONTH       *&HE0024038
#define RTC_YEAR        *&HE002403C

' ---- RTC: Alarm Control Group --------------------------- 
#define RTC_ALSEC       *&HE0024060
#define RTC_ALMIN       *&HE0024064
#define RTC_ALHOUR      *&HE0024068
#define RTC_ALDAY       *&HE002406C
#define RTC_ALDOW       *&HE0024070
#define RTC_ALDOY       *&HE0024074
#define RTC_ALMONTH     *&HE0024078
#define RTC_ALYEAR      *&HE002407C

' ---- RTC: Reference Clock Divider Group ----------------- 
#define RTC_PREINT      *&HE0024080
#define RTC_PREFRAC     *&HE0024084


'## WD - Watchdog

#define WD_WDMOD        *&HE0000000
#define WD_WDTC         *&HE0000004
#define WD_WDFEED       *&HE0000008
#define WD_WDTV         *&HE000000C


'## System Control Block

#define SCB_MEMMAP      *&HE01FC040
#define SCB_PLLCON      *&HE01FC080
#define SCB_PLLCFG      *&HE01FC084
#define SCB_PLLSTAT     *&HE01FC088
#define SCB_PLLFEED     *&HE01FC08C
#define SCB_PCON        *&HE01FC0C0
#define SCB_PCONP       *&HE01FC0C4
#define SCB_VPBDIV      *&HE01FC100
#define SCB_EXTINT      *&HE01FC140
#define SCB_EXTWAKE     *&HE01FC144
#define SCB_EXTMODE     *&HE01FC148
#define SCB_EXTPOLAR    *&HE01FC14C


'## Memory Accelerator Module (MAM)

#define MAM_TIM			*&HE01FC004
#define MAM_CR			*&HE01FC000

'## A/D controller (2103)

#define AD_ADCR			*&HE0034000
#define AD_ADGDR		*&HE0034004
#define AD_ADSTAT		*&HE0034030
#define AD_ADINTEN		*&HE003400C
#define AD_ADDR0		*&HE0034010
#define AD_ADDR1		*&HE0034014
#define AD_ADDR2		*&HE0034018
#define AD_ADDR3		*&HE003401C
#define AD_ADDR4		*&HE0034020
#define AD_ADDR5		*&HE0034024
#define AD_ADDR6		*&HE0034028
#define AD_ADDR7		*&HE003402C

#endif
