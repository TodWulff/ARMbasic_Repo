#ifndef ABRTOS_DEFS_SUPPORT
#define ABRTOS_DEFS_SUPPORT

#pragma filepp UseModule maths.pm
#pragma filepp Function::RemoveFunction abs

#if 1	' ABRTOS FUNCTION MODULE ENABLES

	#define	ABRTOS_OPTION_USE_SEMAPHORES		1						' 1 TO USE, 0 TO NOT USE...
	#define	ABRTOS_OPTION_USE_MUTEX			1						' 1 TO USE, 0 TO NOT USE...
	#define	ABRTOS_OPTION_USE_MSGS			1						' 1 TO USE, 0 TO NOT USE...
	#define	ABRTOS_OPTION_USE_LOGGING		1						' 1 TO USE, 0 TO NOT USE...
	#define	ABRTOS_OPTION_USE_WDT				1

#endif

#if	0	' MCU REGISTER & PERIPHERIAL REGISTER DEFS

	' VECTORED INTERRUPT CONTROLLER (VIC) 
	#define VICIRQSTATUS	*$FFFFF000
	#define VICFIQSTATUS	*$FFFFF004
	#define VICRAWINTR		*$FFFFF008
	#define VICINTSELECT	*$FFFFF00C
	#define VICINTENABLE	*$FFFFF010
	#define VICINTENCLR		*$FFFFF014
	#define VICSOFTINT		*$FFFFF018
	#define VICSOFTINTCLR	*$FFFFF01C
	#define VICPROTECTION	*$FFFFF020
	#define VICVECTADDR		*$FFFFF030
	#define VICDEFVECTADDR	*$FFFFF034
	#define VICVECTADDR0	*$FFFFF100
	#define VICVECTADDR1	*$FFFFF104
	#define VICVECTADDR2	*$FFFFF108
	#define VICVECTADDR3	*$FFFFF10C
	#define VICVECTADDR4	*$FFFFF110
	#define VICVECTADDR5	*$FFFFF114
	#define VICVECTADDR6	*$FFFFF118
	#define VICVECTADDR7	*$FFFFF11C
	#define VICVECTADDR8	*$FFFFF120
	#define VICVECTADDR9	*$FFFFF124
	#define VICVECTADDR10	*$FFFFF128
	#define VICVECTADDR11	*$FFFFF12C
	#define VICVECTADDR12	*$FFFFF130
	#define VICVECTADDR13	*$FFFFF134
	#define VICVECTADDR14	*$FFFFF138
	#define VICVECTADDR15	*$FFFFF13C
	#define VICVECTCNTL0	*$FFFFF200
	#define VICVECTCNTL1	*$FFFFF204
	#define VICVECTCNTL2	*$FFFFF208
	#define VICVECTCNTL3	*$FFFFF20C
	#define VICVECTCNTL4	*$FFFFF210
	#define VICVECTCNTL5	*$FFFFF214
	#define VICVECTCNTL6	*$FFFFF218
	#define VICVECTCNTL7	*$FFFFF21C
	#define VICVECTCNTL8	*$FFFFF220
	#define VICVECTCNTL9	*$FFFFF224
	#define VICVECTCNTL10	*$FFFFF228
	#define VICVECTCNTL11	*$FFFFF22C
	#define VICVECTCNTL12	*$FFFFF230
	#define VICVECTCNTL13	*$FFFFF234
	#define VICVECTCNTL14	*$FFFFF238
	#define VICVECTCNTL15	*$FFFFF23C

	' PIN FUNCTION SELECT 
	#define PINSEL0		*$E002C000
	#define PINSEL1		*$E002C004

	' LEGACY GENERAL PURPOSE INPUT/OUTPUT (GPIO) 
	#define IOPIN		*$E0028000
	#define IOSET		*$E0028004
	#define IODIR		*$E0028008
	#define IOCLR		*$E002800C

	' FAST GENERAL PURPOSE INPUT/OUTPUT (GPIO) 
	#define FIODIR		*$3FFFC000
	#define FIOMASK		*$3FFFC010
	#define FIOPIN		*$3FFFC014
	#define FIOSET		*$3FFFC018
	#define FIOCLR		*$3FFFC01C

	#define FIO0DIR0	*$3FFFC000
	#define FIO0DIR1	*$3FFFC001
	#define FIO0DIR2	*$3FFFC002
	#define FIO0DIR3	*$3FFFC003
	#define FIO0DIRL	*$3FFFC000
	#define FIO0DIRU	*$3FFFC002

	#define FIO0MASK0	*$3FFFC010
	#define FIO0MASK1	*$3FFFC011
	#define FIO0MASK2	*$3FFFC012
	#define FIO0MASK3	*$3FFFC013
	#define FIO0MASKL	*$3FFFC010
	#define FIO0MASKU	*$3FFFC012

	#define FIO0PIN0	*$3FFFC014
	#define FIO0PIN1	*$3FFFC015
	#define FIO0PIN2	*$3FFFC016
	#define FIO0PIN3	*$3FFFC017
	#define FIO0PINL	*$3FFFC014
	#define FIO0PINU	*$3FFFC016

	#define FIO0SET0	*$3FFFC018
	#define FIO0SET1	*$3FFFC019
	#define FIO0SET2	*$3FFFC01A
	#define FIO0SET3	*$3FFFC01B
	#define FIO0SETL	*$3FFFC018
	#define FIO0SETU	*$3FFFC01A

	#define FIO0CLR0	*$3FFFC01C
	#define FIO0CLR1	*$3FFFC01D
	#define FIO0CLR2	*$3FFFC01E
	#define FIO0CLR3	*$3FFFC01F
	#define FIO0CLRL	*$3FFFC01C
	#define FIO0CLRU	*$3FFFC01E

	' UNIVERSAL ASYNCHRONOUS RECEIVER/TRANSMITTER 0 (UART0) 
	#define U0RBR		*$E000C000 ' RX BUFFER REG. (R/O WHEN DLAB=0) 
	#define U0THR		*$E000C000 ' TX HOLDING REG. (W/O WHEN DLAB=0) 
	#define U0DLL		*$E000C000 ' DIVISOR LATCH LSB (R/W WHEN DLAB=1) 
	#define U0DLM		*$E000C004 ' DIVISOR LATCH MSB (R/W WHEN DLAB=1) 
	#define U0IER		*$E000C004 ' INTERRUPT ENABLE REG. (R/W WHEN DLAB=0) 
	#define U0IIR		*$E000C008 ' INTERRUPT ID REG. 
	#define U0FCR		*$E000C008 ' FIFO CONTROL REG. 
	#define U0LCR		*$E000C00C ' LINE CONTROL REG. 
	#define U0LSR		*$E000C014 ' LINE STATUS REG. 
	#define U0SCR		*$E000C01C ' SCRATCH PAD REG. 
	#define U0ACR		*$E000C020 ' AUTO-BAUD CONTROL REG. 
	#define U0FDR		*$E000C028 ' FRACTIONAL DIVIDER REG. 
	#define U0TER		*$E000C030 ' TX ENABLE REG. 

	' UNIVERSAL ASYNCHRONOUS RECEIVER/TRANSMITTER 1 (UART1) 
	#define U1RBR		*$E0010000 ' RX BUFFER REG. (R/O WHEN DLAB=0) 
	#define U1THR		*$E0010000 ' TX HOLDING REG. (W/O WHEN DLAB=0) 
	#define U1DLL		*$E0010000 ' DIVISOR LATCH LSB (R/W WHEN DLAB=1) 
	#define U1DLM		*$E0010004 ' DIVISOR LATCH MSB (R/W WHEN DLAB=1) 
	#define U1IER		*$E0010004 ' INTERRUPT ENABLE REG. (R/W WHEN DLAB=0) 
	#define U1IIR		*$E0010008 ' INTERRUPT ID REG. 
	#define U1FCR		*$E0010008 ' FIFO CONTROL REG. 
	#define U1LCR		*$E001000C ' LINE CONTROL REG. 
	#define U1MCR		*$E0010010 ' MODEM CONTROL REG. 
	#define U1LSR		*$E0010014 ' LINE STATUS REG. 
	#define U1MSR		*$E0010018 ' MODEM STATUS REG. 
	#define U1SCR		*$E001001C ' SCRATCH PAD REG. 
	#define U1ACR		*$E0010020 ' AUTO-BAUD CONTROL REG. 
	#define U1FDR		*$E0010028 ' FRACTIONAL DIVIDER REG. 
	#define U1TER		*$E0010030 ' TX ENABLE REG. 

	' I2C INTERFACE 0 
	#define I2C0CONSET	*$E001C000 ' CONTROL SET REG. 
	#define I2C0STAT	*$E001C004 ' STATUS REG. 
	#define I2C0DAT	*$E001C008 ' DATA REG. 
	#define I2C0ADR	*$E001C00C ' SLAVE ADDRESS REG. 
	#define I2C0SCLH	*$E001C010 ' DUTY CYCLE REG. (MSW) 
	#define I2C0SCLL	*$E001C014 ' DUTY CYCLE REG. (LSW) 
	#define I2C0CONCLR	*$E001C018 ' CONTROL CLEAR REG. W/O 

	' I2C INTERFACE 1 
	#define I2C1CONSET	*$E005C000 ' CONTROL SET REG. 
	#define I2C1STAT	*$E005C004 ' STATUS REG. 
	#define I2C1DAT		*$E005C008 ' DATA REG. 
	#define I2C1ADR		*$E005C00C ' SLAVE ADDRESS REG. 
	#define I2C1SCLH	*$E005C010 ' DUTY CYCLE REG. (MSW) 
	#define I2C1SCLL	*$E005C014 ' DUTY CYCLE REG. (LSW) 
	#define I2C1CONCLR	*$E005C018 ' CONTROL CLEAR REG. W/O 

	' SERIAL PERIPHERAL INTERFACE (SPI) 
	#define S0SPCR		*$E0020000 ' CONTROL REG. 
	#define S0SPSR		*$E0020004 ' STATUS REG. 
	#define S0SPDR		*$E0020008 ' DATA REG. 
	#define S0SPCCR		*$E002000C ' CLOCK COUNTER REG. 
	#define S0SPINT		*$E002001C ' INTERRUPT FLAG 

	' SYNCHRONOUS SERIAL PORT (SSP) 
	#define SSPCR0		*$E0068000 ' CONTROL REG. 0 
	#define SSPCR1		*$E0068004 ' CONTROL REG. 1 
	#define SSPDR		*$E0068008 ' DATA REG. 
	#define SSPSR		*$E006800C ' STATUS REG. 
	#define SSPCPSR		*$E0068010 ' CLOCK PRESCALE REG. 
	#define SSPIMSC		*$E0068014 ' INTERRUPT MASK SET AND CLEAR REG. 
	#define SSPRIS		*$E0068018 ' RAW INTERRUPT STATUS REG. 
	#define SSPMIS		*$E006801C ' MASKED INTERRUPT STATUS REG. 
	#define SSPICR		*$E0068020 ' INTERRUPT CLEAR REG. 

	' MEMORY ACCELERATOR MODULE (MAM) 
	#define MAMCR		*$E01FC000 ' MAM CONTROL REG. 
	#define MAMTIM		*$E01FC004 ' MAM TIMING CONTROL 

	' EXTERNAL INTERRUPTS 
	#define EXTINT		*$E01FC140 ' EXTERNAL INTERRUPT FLAG REG. 
	#define INTWAKE		*$E01FC144 ' INTERRUPT WAKE-UP REG. 
	#define EXTMODE		*$E01FC148 ' EXTERNAL INTERRUPT MODE REG. 
	#define EXTPOLAR	*$E01FC14C ' EXTERNAL INTERRUPT POLARITY REG. 

	' MEMORY MAPPING CONTROL 
	#define MEMMAP		*$E01FC040 ' MEMORY MAPPING CONTROL 

	' PHASE LOCKED LOOP (PLL) 
	#define PLLCON		*$E01FC080 ' PLL CONTROL REG. (PROTECTED BY PLLFEED) 
	#define PLLCFG		*$E01FC084 ' PLL CONFIGURATION REG. (PROTECTED BY PLLFEED) 
	#define PLLSTAT		*$E01FC088 ' PLL STATUS REG. 
	#define PLLFEED		*$E01FC08C ' PLL FEED REG 

	' POWER CONTROL 
	#define PCON		*$E01FC0C0 ' POWER CONTROL REG. 
	#define PCONP		*$E01FC0C4 ' POWER CONTROL FOR PERIPHERALS 

	' APB DIVIDER 
	#define APBDIV		*$E01FC100 ' APB DIVIDER CONTROL 

	' RESET 
	#define RSIR		*$E01FC180 ' RESET SOURCE IDENTIFICATION REG. 

	' CODE SECURITY/DEBUGGING 
	#define CSPR		*$E01FC184 ' CODE SECURITY PROTECTION REG. (R/O) 

	' SYSTEM CONTROL AND STATUS FLAGS REGISTER 
	#define SCS			*$E01FC1A0

	' TIMER 0 
	#define T0IR		*$E0004000 ' INTERRUPT REG. 
	#define T0TCR		*$E0004004 ' TIMER CONTROL REG. 
	#define T0TC		*$E0004008 ' TIMER COUNTER 
	#define T0PR		*$E000400C ' PRESCALE REG. 
	#define T0PC		*$E0004010 ' PRESCALE COUNTER 
	#define T0MCR		*$E0004014 ' MATCH CONTROL REG. 
	#define T0MR0		*$E0004018 ' MATCH REG. 0 
	#define T0MR1		*$E000401C ' MATCH REG. 1 
	#define T0MR2		*$E0004020 ' MATCH REG. 2 
	#define T0MR3		*$E0004024 ' MATCH REG. 3 
	#define T0CCR		*$E0004028 ' CAPTURE CONTROL REG. 
	#define T0CR0		*$E000402C ' CAPTURE REG. 0 
	#define T0CR1		*$E0004030 ' CAPTURE REG. 1 
	#define T0CR2		*$E0004034 ' CAPTURE REG. 2 
	#define T0CR3      	*$E0004038 ' ??????
	#define T0EMR		*$E000403C ' EXTERNAL MATCH REG. 
	#define T0CTCR		*$E0004070 ' COUNT CONTROL REG. 
	#define T0PWMCON	*$E0004074 ' PWM CONTROL REG. 

	' TIMER 1 
	#define T1IR		*$E0008000 ' INTERRUPT REG. 
	#define T1TCR		*$E0008004 ' TIMER CONTROL REG. 
	#define T1TC		*$E0008008 ' TIMER COUNTER 
	#define T1PR		*$E000800C ' PRESCALE REG. 
	#define T1PC		*$E0008010 ' PRESCALE COUNTER 
	#define T1MCR		*$E0008014 ' MATCH CONTROL REG. 
	#define T1MR0		*$E0008018 ' MATCH REG. 0 
	#define T1MR1		*$E000801C ' MATCH REG. 1 
	#define T1MR2		*$E0008020 ' MATCH REG. 2 
	#define T1MR3		*$E0008024 ' MATCH REG. 3 
	#define T1CCR		*$E0008028 ' CAPTURE CONTROL REG. 
	#define T1CR0		*$E000802C ' CAPTURE REG. 0 
	#define T1CR1		*$E0008030 ' CAPTURE REG. 1 
	#define T1CR2		*$E0008034 ' CAPTURE REG. 2 
	#define T1CR3      	*$E0008038 ' ??????
	#define T1EMR		*$E000803C ' EXTERNAL MATCH REG. 
	#define T1CTCR		*$E0008070 ' COUNT CONTROL REG. 
	#define T1PWMCON	*$E0008074 ' PWM CONTROL REG. 

	' TIMER 2 
	#define T2IR		*$E0070000 ' INTERRUPT REG. 
	#define T2TCR		*$E0070004 ' TIMER CONTROL REG. 
	#define T2TC		*$E0070008 ' TIMER COUNTER 
	#define T2PR		*$E007000C ' PRESCALE REG. 
	#define T2PC		*$E0070010 ' PRESCALE COUNTER 
	#define T2MCR		*$E0070014 ' MATCH CONTROL REG. 
	#define T2MR0		*$E0070018 ' MATCH REG. 0 
	#define T2MR1		*$E007001C ' MATCH REG. 1 
	#define T2MR2		*$E0070020 ' MATCH REG. 2 
	#define T2MR3		*$E0070024 ' MATCH REG. 3 
	#define T2CCR		*$E0070028 ' CAPTURE CONTROL REG. 
	#define T2CR0		*$E007002C ' CAPTURE REG. 0 
	#define T2CR1		*$E0070030 ' CAPTURE REG. 1 
	#define T2CR2		*$E0070034 ' CAPTURE REG. 2 
	#define T2CR3      	*$E0070038 ' ??????
	#define T2EMR		*$E007003C ' EXTERNAL MATCH REG. 
	#define T2CTCR		*$E0070070 ' COUNT CONTROL REG. 
	#define T2PWMCON	*$E0070074 ' PWM CONTROL REG. 

	' TIMER 3 
	#define T3IR		*$E0074000 ' INTERRUPT REG. 
	#define T3TCR		*$E0074004 ' TIMER CONTROL REG. 
	#define T3TC		*$E0074008 ' TIMER COUNTER 
	#define T3PR		*$E007400C ' PRESCALE REG. 
	#define T3PC		*$E0074010 ' PRESCALE COUNTER 
	#define T3MCR		*$E0074014 ' MATCH CONTROL REG. 
	#define T3MR0		*$E0074018 ' MATCH REG. 0 
	#define T3MR1		*$E007401C ' MATCH REG. 1 
	#define T3MR2		*$E0074020 ' MATCH REG. 2 
	#define T3MR3		*$E0074024 ' MATCH REG. 3 
	#define T3CCR		*$E0074028 ' CAPTURE CONTROL REG. 
	#define T3CR0		*$E007402C ' CAPTURE REG. 0 
	#define T3CR1		*$E0074030 ' CAPTURE REG. 1 
	#define T3CR2		*$E0074034 ' CAPTURE REG. 2 
	#define T3CR3      	*$E0074038 ' ????
	#define T3EMR		*$E007403C ' EXTERNAL MATCH REG. 
	#define T3CTCR		*$E0074070 ' COUNT CONTROL REG. 
	#define T3PWMCON	*$E0074074 ' PWM CONTROL REG. 

	' REAL-TIME CLOCK (RTC) MISC. 
	#define ILR			*$E0024000 ' INTERRUPT LOCATION 
	#define CTC			*$E0024004 ' CLOCK TICK COUNTER 
	#define CCR			*$E0024008 ' CLOCK CONTROL REG. 
	#define CIIR		*$E002400C ' COUNTER INCREMENT INTERRUPT 
	#define AMR			*$E0024010 ' ALARM MASK REG. 
	#define CTIME0		*$E0024014 ' CONSOLIDATED TIME REG. 0 
	#define CTIME1		*$E0024018
	#define CTIME2		*$E002401C

	' RTC TIME COUNTER 
	#define SEC			*$E0024020
	#define MIN			*$E0024024
	#define HOUR		*$E0024028
	#define DOM			*$E002402C
	#define DOW			*$E0024030
	#define DOY			*$E0024034
	#define MONTH		*$E0024038
	#define YEAR		*$E002403C

	' RTC ALARM 
	#define ALSEC		*$E0024060
	#define ALMIN		*$E0024064
	#define ALHOUR		*$E0024068
	#define ALDOM		*$E002406C
	#define ALDOW		*$E0024070
	#define ALDOY		*$E0024074
	#define ALMON		*$E0024078
	#define ALYEAR		*$E002407C

	' RTC REFERENCE CLOCK DIVIDER 
	#define PREINT		*$E0024080
	#define PREFRAC		*$E0024084

	' WATCHDOG TIMER (WDT) 
	#define WDMOD		*$E0000000 ' MODE REG. 
	#define WDTC		*$E0000004 ' TIME-OUT INTERVAL 
	#define WDFEED		*$E0000008
	#define WDTV		*$E000000C ' TIMER VALUE 

	' ANALOG TO DIGITAL CONVERTER (ADC) 
	#define ADCR		*$E0034000 ' A/D CONTROL REG. 
	#define ADGDR		*$E0034004 
	#define ADSTAT		*$E0034030 
	#define ADINTEN		*$E003400C 
	#define ADDR0		*$E0034010 
	#define ADDR1		*$E0034014 
	#define ADDR2		*$E0034018 
	#define ADDR3		*$E003401C 
	#define ADDR4		*$E0034020 
	#define ADDR5		*$E0034024
	#define ADDR6		*$E0034028
	#define ADDR7		*$E003402C

#endif

#if	1	' MCU & PERIPHERIAL FUNCTIONAL DEFS

	#if ABRTOS_OPTION_USE_WDT == 1		' WDT SPECIFIC DEFS AND INITIALIZATION...

		'==============================================================================
		' WATCHDOG REGISTER POINTERS
		'==============================================================================
		#define ABRTOS_WDT_MODE_REG					WDMOD	' mode reg
		#define ABRTOS_WDT_TC_REG					WDTC	' time-out interval (TIME CONSTANT)
		#define ABRTOS_WDT_FEED_REG					WDFEED	' the dog's bowl
		#define ABRTOS_WDT_TIME_REG					WDTV	' timer value

		'==============================================================================
		' WATCHDOG MODE DEFINITIONS, REGISTER BIT MASK, & BIT POINTERS
		'==============================================================================
		#define ABRTOS_WDT_MODE_BIT_MASK				$03
		' BITS 7:4 ARE RESERVED, SHOULD NOT BE WRITTEN TO, & AREN'T DEFINED ON READ...
		' BITS 31:8 ARE NOT USED, SHOULD NOT BE WRITTEN TO, & AREN'T DEFINED ON READ...

		#define ABRTOS_WDT_MODE_INT_EN_PTR				$01
		#define ABRTOS_WDT_MODE_RST_EN_PTR 				$02

		#define ABRTOS_WDT_MODE_DISABLED				$00		
		#define ABRTOS_WDT_MODE_INTERRUPT				ABRTOS_WDT_MODE_INT_EN_PTR
		#define ABRTOS_WDT_MODE_RESET					(ABRTOS_WDT_MODE_INT_EN_PTR + ABRTOS_WDT_MODE_RST_EN_PTR)

		'==============================================================================
		' WATCHDOG STATUS DEFINITIONS, REGISTER BIT MASK, & BIT POINTERS
		'==============================================================================
		#define ABRTOS_WDT_FLAG_BIT_MASK				$0C

		#define ABRTOS_WDT_STATUS_TO_FLG_PTR			$04
		#define ABRTOS_WDT_STATUS_INT_FLG_PTR			$08

		#define	ABRTOS_WDT_STATUS_TIME_OUT_FLAG			ABRTOS_WDT_MODE_TO_FLG_PTR
		#define	ABRTOS_WDT_STATUS_INTERRUPT_FLAG		ABRTOS_WDT_MODE_INT_FLG_PTR

		'==============================================================================
		' WATCHDOG TIMER FOOD
		'==============================================================================
		#define ABRTOS_WDT_F00D_BYTE1					$AA
		#define ABRTOS_WDT_F00D_BYTE2					$55

		'==============================================================================
		' WATCHDOG TIMER OTHER VALUES
		'==============================================================================
		#define ABRTOS_WDT_TC_RSTVAL					$FF
		#define ABRTOS_WDT_MS_RESOLUTION_MULTIPLIER		$EA6		' MULTIPLIER FOR mS ABRTOS_WDT RES

		'==============================================================================
		' WATCHDOG TIMER ***PRIVATE*** LIBRARY SUPPORT ROUTINES
		'==============================================================================

	#endif

	#define TIMER_INT_OFF	VICINTENCLR = $20
	#define EINT0OFF		VICINTENCLR = $4000 
	#define EINT1OFF		VICINTENCLR = $8000 
	#define EINT2OFF		VICINTENCLR = $10000 

#endif

#if	1	' ABRTOS OPERAND DEFS & OPERATIONAL LIMITS PART A

' THESE VALUES AFFECT ROOT FUNCTIONALITY OF THE RTOS
' ALTER AT YOUR OWN RISK - NO SUPPORT...

' SCHED MODES
#define	ABRTOS_SCHED_PREEMPTIVE		1	' FORCES CONTEXT SWITCHES - TASKS EXECUTED BASED ON STATES, EVENTS, AND PRIORITIES
#define	ABRTOS_SCHED_ROUNDROBIN		0	' FORCES CONTEXT SWITCHES - TASKS EXECUTED BASED ON SEQUENCE, STATES, AND EVENTS - NO PRIORITIES
#define	ABRTOS_SCHED_COOPERATIVE	-1	' VOLUNTARY TASK-DRIVEN CONTEXT SWITCHING, NOT SCHED DRIVEN...

' TASK STATES
#define ABRTOS_TASK_STATE_INACTIVE	0		' CREATED BUT NOT KICKED OFF, OR SUSPENDED/KILLED POST CREATION AND EXECUTION
#define ABRTOS_TASK_STATE_RUNNING	1		' USED TO INDICATE THE TASK IS RUNNING
#define ABRTOS_TASK_STATE_READY		2		' USED TO INDICATE THAT THE TASK IS READY TO RUN
#define ABRTOS_TASK_STATE_WAIT_DLY	3		' WAIT X MS
#define ABRTOS_TASK_STATE_WAIT_ITV	4		' INTERVAL - REPETATIVE DLY/WAKE CYCLE - I.E. WAKE ONCE EVERY 1000MS
#define ABRTOS_TASK_STATE_WAIT_OR	5		' WAIT FOR A SINGLE EVENT TO TAKE PLACE
#define ABRTOS_TASK_STATE_WAIT_AND	6		' WAIT FOR ALL OF A SPECIFIC # OF EVENTS TO TAKE PLACE
#define ABRTOS_TASK_STATE_WAIT_SEM	7		' WAIT ON A SEMAPHORE BEING RELEASED
#define ABRTOS_TASK_STATE_WAIT_MUT	8		' WAIT ON A MUTEX BEING RELEASED
#define ABRTOS_TASK_STATE_WAIT_MSG	9		' WAIT FOR A MSG ,OR MSGBOX TO BECOME UN-FULL

' CONFIG LIMITS
#define ABRTOS_TASK_MAX_TASK_LIMIT	32
#define ABRTOS_TASK_MAX_STACK_SIZE	127
#define ABRTOS_TASK_TCB_SIZE		8
#define ABRTOS_SEMA_MAX_SEMA_LIMIT	6

' LOG LIMITS & RELATED
#define ABRTOS_LOG_MAX_LOG_CNT		32
#define	ABRTOS_LOG_TRIP_LOG_SWI		$2

' LOG MODULES - UP TO 32 TOTAL TO FACILITATE BIT MAPPING IN A SINGLE UNSIGNED INT
#define ABRTOS_LOG_MOD_CORE			0
#define ABRTOS_LOG_MOD_LOG			1
#define ABRTOS_LOG_MOD_WDT			2
#define ABRTOS_LOG_MOD_DEBUG		3
#define ABRTOS_LOG_MOD_STACK		4
#define ABRTOS_LOG_MOD_MUTEX		5
#define ABRTOS_LOG_MOD_MEM			6
#define ABRTOS_LOG_MOD_MSGS			7
#define ABRTOS_LOG_MOD_SEMA			8
#define ABRTOS_LOG_MOD_SCHED		9
#define ABRTOS_LOG_MOD_TASKS		10
#define ABRTOS_LOG_MOD_EVENT		11
#define ABRTOS_LOG_MOD_INT			12
#define ABRTOS_LOG_MOD_INIT			13
' #define ABRTOS_LOG_MOD_			14
' #define ABRTOS_LOG_MOD_			15

' LOG EVENTS - DEFINED IN EACH OF THE MODULES - UP TO 32 PER MODULE FOR BIT MAPPING
#define	ABRTOS_LOG_EVENT_OK			0

#endif

#if	1	' ABRTOS APPLICATION DEFAULTS

	' THESE VALUES ARE THE DEFAULT VALUE USED IN THE CONFIG DEFS
	' ALTER AT YOUR OWN RISK - NO SUPPORT...

	' DEFAULT WATCHDOG SETTINGS
	#define ABRTOS_INIT_WDT_TEST_TC		10000 	'MS
	#define ABRTOS_INIT_WDT_MODE_CNTL	ABRTOS_WDT_MODE_RESET

	#define ABRTOS_INIT_TIME_SLICE		10		'MS
	#define ABRTOS_INIT_SEMA_COUNT		6
	#define ABRTOS_INIT_MAX_TASKS		16

	#define ABRTOS_TASK_INIT_STACK_SIZE	16

#endif

#if 1	' ABRTOS CONFIGURATION DEFINITIONS

	#define ABRTOS_TIME_SLICE			ABRTOS_INIT_TIME_SLICE
	#define	ABRTOS_SCHED_MODE			ABRTOS_SCHED_PREEMPTIVE

	' #DEFS TO CAUSE A DEVICE RESET AFTER 1 SECOND IF THE WATCHDOG ISN'T FED
	#define ABRTOS_WDT_TEST_TC			ABRTOS_INIT_WDT_TEST_TC
	#define ABRTOS_WDT_MODE_CNTL		ABRTOS_INIT_WDT_MODE_CNTL

	#define ABRTOS_TASK_MAX_TASKS		ABRTOS_INIT_MAX_TASKS		' USE POWER OF 2 - 1 DUE TO SEMA MGMT
	#define ABRTOS_TASK_STACK_SIZE		ABRTOS_TASK_INIT_STACK_SIZE
	
	#if ABRTOS_OPTION_USE_SEMAPHORES == 1
		#define ABRTOS_SEMA_SEMAPHORE_COUNT	ABRTOS_INIT_SEMA_COUNT		' PUT VERBOSE DEFS BELOW...
	#endif

	' 		VVV DON'T CHAGE VVV			VVV VERBOSE NAMES HERE VVV
	' #define	ABROTS_SEMA_NAME1			SEMA1
	' #define	ABROTS_SEMA_NAME2			SEMA2
	' #define	ABROTS_SEMA_NAME3			SEMA3
	' #define	ABROTS_SEMA_NAME4			SEMA4
	' #define	ABROTS_SEMA_NAME5			SEMA5
	' #define	ABROTS_SEMA_NAME6			SEMA6

#endif

#if	1	' ABRTOS OPERATIONAL LIMITS PART B, VALIDATION, & BOUNDING

	' THESE VALUES AFFECT ROOT FUNCTIONALITY OF THE RTOS
	' ALTER AT YOUR OWN RISK - NO SUPPORT...


	
	
#endif

#if	1	' ABRTOS GLOBAL INSTANTIATION

	DIM ABRTOS_STOP_FLAG AS INTEGER
	DIM ABRTOS_TASK_ACTIVEID AS INTEGER
	DIM ABRTOS_TASK_TCB_BLOCK(mul(ABRTOS_TASK_TCB_SIZE, sub(ABRTOS_TASK_MAX_TASKS,1))) AS INTEGER	'*
	DIM ABRTOS_TASK_TCB_POINTER(sub(ABRTOS_TASK_MAX_TASKS,1)) AS INTEGER	'*
	DIM ABRTOS_TASK_STACK_BLOCK(mul(ABRTOS_TASK_STACK_SIZE, sub(ABRTOS_TASK_MAX_TASKS,1))) AS INTEGER	'*
	DIM ABRTOS_TASK_STACKBASE_POINTER(sub(ABRTOS_TASK_MAX_TASKS,1)) AS INTEGER	'*
	DIM ABRTOS_ROOT_TEMP_REG AS INTEGER
	
#if ABRTOS_OPTION_USE_MUTEX == 1
	DIM	ABRTOS_MUTEX_MUTEXQUEUE AS INTEGER
#endif

	' DIM ABRTOS_TIME_SLICE AS INTEGER

	

#endif

#if	1	' ABRTOS INITIALIZATION OF GLOBALS


' ABRTOS_TIME_SLICE = ABRTOS_INIT_TIME_SLICE

#endif

#endif
