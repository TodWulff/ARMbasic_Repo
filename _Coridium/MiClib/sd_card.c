
#ifdef FOR_BASIC
  #include "basic_pcb.h"	// this one is required and configures for the proper CPU
#else
  #include "coridium_pcb.h"	// this one is required and configures for the proper CPU
#endif

#if defined MK20DX128 || defined MK20DX256
  #include "usb_serial.h"
#elif defined LPC54618
  #include "uart_lpc546xx.h"
#else   
  #include "uart.h"
#endif

#include "printf.h"			
//#include "string.h"			

//#include "ff.h"
#include "sd_card.h"


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* Definitions for MMC/SDC command */
#define CMD0     (0x40+0 )    /* 40 GO_IDLE_STATE */
#define CMD1     (0x40+1 )    /* 41 SEND_OP_COND */
#define CMD8     (0x40+8 )    /* 48 SEND_IF_COND */
#define CMD9     (0x40+9 )    /* 49 SEND_CSD */
#define CMD10    (0x40+10)    /* 4A SEND_CID */
#define CMD12    (0x40+12)    /* 4C STOP_TRANSMISSION */
#define CMD16    (0x40+16)    /* 50 SET_BLOCKLEN */
#define CMD17    (0x40+17)    /* 51 READ_SINGLE_BLOCK */
#define CMD18    (0x40+18)    /* 52 READ_MULTIPLE_BLOCK */
#define CMD23    (0x40+23)    /* 57 SET_BLOCK_COUNT */
#define CMD24    (0x40+24)    /* 58 WRITE_BLOCK */
#define CMD25    (0x40+25)    /* 59 WRITE_MULTIPLE_BLOCK */
#define CMD41    (0x40+41)    /* 69 SEND_OP_COND (ACMD) */
#define CMD55    (0x40+55)    /* 77 APP_CMD */
#define CMD58    (0x40+58)    /* 7A READ_OCR */

/* Peripheral definitions for EK-LM3S6965 board */
// SSI port
#define SDC_SSI_BASE            0//SSI0_BASE
#define SDC_SSI_SYSCTL_PERIPH   0//SYSCTL_PERIPH_SSI0

// GPIO for SSI pins
#define SDC_GPIO_PORT_BASE      0//GPIO_PORTA_BASE
#define SDC_GPIO_SYSCTL_PERIPH  0//SYSCTL_PERIPH_GPIOA
#define SDC_SSI_CLK             0//GPIO_PIN_2
#define SDC_SSI_TX              0//GPIO_PIN_5
#define SDC_SSI_RX              0//GPIO_PIN_4
#define SDC_SSI_FSS             0//GPIO_PIN_3
#define SDC_SSI_PINS            0//(SDC_SSI_TX | SDC_SSI_RX | SDC_SSI_CLK)

// GPIO for card chip select
#define SDC_CS_GPIO_PORT_BASE      0//GPIO_PORTD_BASE
#define SDC_CS_GPIO_SYSCTL_PERIPH  0//SYSCTL_PERIPH_GPIOD
#define SDC_CS                     0//GPIO_PIN_0

// Define the SPI pins to be used
#if defined MK20DX128 || defined MK20DX256

//#define CLK_pin  14 // SCK  (D1) never used directly
//#define MISO_pin 12 // DIN  (C7) never used directly
//#define CS_pin     10 // CS0  (C4) driven manually
#define MOSI_pin   11 // DOUT (C6) only used in power_on set up

#define SPI_select   GPIOC_PCOR = 1 << 4           /* CS = L */
#define SPI_deselect GPIOC_PSOR = 1 << 4           /* CS = H */

#elif defined LPC4330

//#define CLK_pin  xx // CLK0 SSP1_SCK
//#define MISO_pin 3 // 1.3 GPIO0[10] => SP1_MISO  never used directly          (aka SGPIO10)
//#define MOSI_pin 4 // 1.4 GPIO0[11] => SSP1_MOSI only used in power_on set up (aka SGPIO11)
//#define CS_pin   5 // 1.5 GPIO1[8]  => SD_SEL    driven manually              (aka SGPIO15)

#define SPI_select   LPC_GPIO1->CLR = 1 << 8           /* CS = L */
#define SPI_deselect LPC_GPIO1->SET = 1 << 8           /* CS = H */


#elif defined LPC11U67 || defined LPC11U68
// TEMP TESTING P1_29 Func1 #define CLK_pin  
// TEMP TESTING P0_2  Func1 #define CS_pin 2 

#define CLK_pi    6 // P0_6 Func2
#define CS_pin    7 // P0_7 manual drive
#define MISO_pin   8 // P0_8 Func1
#define MOSI_pin   9 // P0_9 Func1

#define SPI_select   LPC_GPIO->CLR[0] = 1 << CS_pin           /* CS = L */
#define SPI_deselect LPC_GPIO->SET[0] = 1 << CS_pin           /* CS = H */


#elif defined SDCARD_SSP1

#define CS_pin     6 // SSEL1 driven manually
//#define CLK_pin  7 // SCK1 never used directly
//#define MISO_pin 8 // MISO1 never used directly
#define MOSI_pin   9 // MOSI1 only used in power_on set up

#define SPI_select   LPC_GPIO0->CLR = 1 << CS_pin           /* CS = L */
#define SPI_deselect LPC_GPIO0->SET = 1 << CS_pin           /* CS = H */

#else

//#define CLK_pin  15 // SCK0 never used directly
//#define MISO_pin 17 // MISO0 never used directly
#define CS_pin     16 // SSEL0 driven manually
#define MOSI_pin   18 // MOSI0 only used in power_on set up

#define SPI_select   LPC_GPIO0->CLR = 1 << CS_pin           /* CS = L */
#define SPI_deselect LPC_GPIO0->SET = 1 << CS_pin           /* CS = H */

#endif

/*--------------------------------------------------------------------------

   Module Private Functions

---------------------------------------------------------------------------*/

static volatile unsigned char DiskStatus = STA_NOINIT;    /* Disk status */

static
unsigned char CardType;            /* b0:MMC, b1:SDC, b2:Block addressing */

static
unsigned char PowerFlag = 0;     /* NOTE: NEVER USED indicates if "power" is on */

void sdcard_init(void)
{
	DiskStatus = STA_NOINIT;
}



#if defined MK20DX128 || defined MK20DX256

#include "pins_teensy.h"
#include "system_MK20DX128.h"

static
void xmit_spi (unsigned char dat)
{
    unsigned int rcvdat;

	SPI0_PUSHR = dat;            // write data
	while ((SPI0_SR & SPI_SR_TCF) == 0);// wait for not busy
	SPI0_SR = SPI_SR_TCF;        // clear not busy
	rcvdat = SPI0_POPR;          // read dummy data
}

static
unsigned char rcvr_spi (void)
{
	SPI0_PUSHR = 0xFF;         // write dummy data
	while ((SPI0_SR & SPI_SR_TCF) == 0);// wait for not busy
	SPI0_SR = SPI_SR_TCF;        // clear not busy
	return SPI0_POPR;         // read the data
}

static
unsigned char wait_ready (void)
{
    unsigned char res;
	unsigned int Timer2;

    Timer2 = TIMER;    /* Wait for ready in timeout of 500ms */
    rcvr_spi();
// BEWARE TIMER may not be working but this returns the first time every time
    do
        res = rcvr_spi();
    while ((res != 0xFF) && ((TIMER - Timer2) < 500000));/* Wait for ready in timeout of 500ms */

    return res;
}

//static
void power_on (void)
{
	int i;

    // initialize the SSI port and pins needed to talk to the card.

	pinDirMode(10, 1); // manually manipulating SSEL0 PC4 teensy 10
	SPI_deselect;      // deselect

	SIM_SCGC6 |=  SIM_SCGC6_SPI0; // enable the clock

	CORE_PIN14_CONFIG = PORT_PCR_MUX(2);    // enable SSP0 pin functions SCK = 14 (PTD1)

	SPI0_MCR = SPI_MCR_MDIS | SPI_MCR_HALT; // SPI disable and halt
	SPI0_CTAR0 = 7 << 27;      // Set data to 8-bit
	SPI0_MCR = SPI_MCR_MSTR;   // Master mode

	pinDirMode(MOSI_pin, 1);   // manual output
	digitalWrite(MOSI_pin, 1); // set data out high
	SPI0_SR = SPI_SR_TCF;      // clear not busy flag

    for(i = 0 ; i < 10 ; i++)  // Send 10 bytes over the SSI.
		rcvr_spi();            // This causes the clock to wiggle the required number of times.

	CORE_PIN11_CONFIG = PORT_PCR_DSE | PORT_PCR_MUX(2); // DOUT/MOSI = 11 (PTC6)
	CORE_PIN12_CONFIG = PORT_PCR_MUX(2);                // DIN/MISO = 12 (PTC7)
	
    PowerFlag = 1;
}

/*---------------------------------------------------------*/
/* User Provided Timer Function for FatFs module           */
/*---------------------------------------------------------*/
/* This is a real time clock service to be called from     */
/* FatFs module. Any valid time must be returned even if   */
/* the system does not support a real time clock.          */

unsigned int get_fattime (void)
{
			  // Jan 14, 2014 at 11:39
    return    (2014 << 25)// Year
            | (1    << 21)// Month
            | (23   << 16)// Day
            | (11   << 11)// Hour
            | (39   << 5) // Min
            | (0    >> 1) // Sec
            ;

}

#else // not MK20DX128 or MK20DX256

#if defined LPC4330 || defined SDCARD_SSP1
	#define LPC_SSP LPC_SSP1
#else
	#define LPC_SSP LPC_SSP0
#endif

/*-----------------------------------------------------------------------*/
/* Transmit a byte to MMC via SPI  (Platform dependent)                  */
/*-----------------------------------------------------------------------*/
static
int xmit_spi (unsigned char dat)
{
    unsigned int rcvdat;

	LPC_SSP->DR = dat;          // write data
	while (LPC_SSP->SR & 0x10); // wait for not busy
	rcvdat = LPC_SSP->DR;       // read dummy data
	return rcvdat;// dummy return to clear warning
}

/*-----------------------------------------------------------------------*/
/* Receive a byte from MMC via SPI  (Platform dependent)                 */
/*-----------------------------------------------------------------------*/
static
unsigned char rcvr_spi (void)
{
	LPC_SSP->DR = 0xFF;         // write dummy data
	while (LPC_SSP->SR & 0x10); // wait for not busy
	return  LPC_SSP->DR; // read the data
}


/*-----------------------------------------------------------------------*/
/* Wait for card ready                                                   */
/*-----------------------------------------------------------------------*/

static
unsigned char wait_ready (void)
{
    unsigned char res;
	unsigned int Timer2;

    Timer2 = TIMER;    /* Wait for ready in timeout of 500ms */

    rcvr_spi();
// BEWARE TIMER may not be working but this returns the first time every time
    do
        res = rcvr_spi();
    while ((res != 0xFF) && ((TIMER - Timer2) < 500000));/* Wait for ready in timeout of 500ms */

    return res;
}


/*-----------------------------------------------------------------------*/
/* Power Control  (Platform dependent)                                   */
/*-----------------------------------------------------------------------*/

static
void power_on (void)
{
	volatile int i;
    // initialize the SSI port and pins needed to talk to the card.

#ifdef LPC4330 

    // A9 LED P2_7 GPIO0[7]
//  LPC_SCU->SFSP2_7 = 0;
//  LPC_GPIO0->DIR |= 1 << 7;
//  while(1){
//  	LPC_GPIO0->SET = 1 << 7;
//  	wait(5);//for(i=0;i<100000;i++);
//  	LPC_GPIO0->CLR = 1 << 7;
//  	wait(5);//for(i=0;i<100000;i++);
//  }

	LPC_SCU->SFSP1_4 = 0; // 1.4 GPIO0[11] => SSP1_MOSI manual output during power_on
	LPC_GPIO0->DIR |= 1 << 11;
	
	LPC_SCU->SFSP1_5 = 0; // 1.5 GPIO1[8]  => SD_SEL    manual output
	LPC_GPIO1->DIR |= 1 << 8;

	SPI_deselect;    // deselect

	LPC_SCU->SFSCLK_0 = 0xd6; 

	LPC_CGU->BASE_SSP1_CLK = (6 << 24);  // 6 - 12 MHz,  or 9 for 200 MHz

	LPC_CCU1->CLK_M4_SSP1_CFG = 1;
	LPC_CCU2->CLK_APB2_SSP1_CFG = 1;

	LPC_SSP1->CR0  = 7; // Set DSS data to 8-bit, Frame format SPI, CPOL = 0, CPHA = 0, and SCR is 0
	LPC_SSP1->CPSR = 2; // SSPCPSR clock prescale register, master mode, minimum divisor is 0x02
	LPC_SSP1->CR1  = 2; // Enable SSP Master mode

    // Set DI and CS high and apply more than 74 pulses to SCLK for the card to be able to accept a native command.
	// Send 80 or so clock transitions with CS and DI held high.
	// This is required after card power up to get it into SPI mode.
    // Send 10 bytes over the SSI. This causes the clock to wiggle the required number of times.
	LPC_GPIO0->SET = 1 << 11;  // 1.4 GPIO0[11] => SSP1_MOSI

    for(i = 0 ; i < 10 ; i++)
        rcvr_spi();

	// now switch to pin functions MOSI0, MISO0	
	LPC_SCU->SFSP1_3 = 0xd5; //1.3  GPIO0[10] => SSP1_MISO 
	LPC_SCU->SFSP1_4 = 0xd5; //1.4  GPIO0[11] => SSP1_MOSI



#elif defined LPC11U67 || defined LPC11U68

// #elif defined LPC11U68
// #define CLK_pin  // TEMP TESTING P1_29 Func1
// #define CS_pin 2 // TEMP TESTING P0_2 Func1

// //#define CLK_pin   6 // P0_6 Func2
// //#define CS_pin    7 // P0_7 manual drive
// #define MISO_pin   8 // P0_8 Func1
// #define MOSI_pin   9 // P0_9 Func1

	LPC_GPIO->DIR[0] |= 1 << CS_pin; // manually manipulating SSEL0 P0.16 
	SPI_deselect;    // deselect

	// Turn On SSP0
    LPC_SYSCON->SYSAHBCLKCTRL |= 1 << 11;
    LPC_SYSCON->SSP0CLKDIV = 0x01;
    LPC_SYSCON->PRESETCTRL |= 1 << 0;
	LPC_IOCON->PIO0_6 = 2; // CLK_pin P0_6 Func2
//TEMP TESTING LPC_IOCON->PIO1_29 = 1;
	
//CHECK THIS
 	LPC_SSP->CPSR = 2; // SSPCPSR clock prescale register, master mode, minimum divisor is 0x02
	
	LPC_SSP->CR0  = 7; // Set DSS data to 8-bit, Frame format SPI, CPOL = 0, CPHA = 0, and SCR is 0
	LPC_SSP->CR1  = 2; // Enable SSP Master mode
	
	LPC_GPIO->DIR[0] |= 1 << MOSI_pin; 
	LPC_GPIO->SET[0] = 1 << MOSI_pin;
	
    // Set DI and CS high and apply more than 74 pulses to SCLK for the card to be able to accept a native command.
	// Send 80 or so clock transitions with CS and DI held high.
	// This is required after card power up to get it into SPI mode.
    // Send 10 bytes over the SSI. This causes the clock to wiggle the required number of times.
    for(i = 0 ; i < 10 ; i++)
		rcvr_spi();
// now switch to pin functions MOSI0, MISO0	
	LPC_IOCON->PIO0_8 = 1;// MISO0 P0_8
	LPC_IOCON->PIO0_9 = 1;// MOSI0 P0_9



#else // not LPC LPC4330, must be LPC407x or LPC17xx or LPC11U68
	// This is just for some example, doesn't matter
	LPC_GPIO4->DIR |= 0x20000000; // SW1 output
	LPC_GPIO4->SET  = 0x20000000; // set SW1

	LPC_GPIO0->DIR |= 1 << CS_pin; // manually manipulating SSEL0 P0.16 
	SPI_deselect;    // deselect

//'	SCB_PCONP or= (1 << 10)    ' Turn On SSP1
//'	PCB_PINSEL0 or= &H000A8000 ' enable SSP1 pin functions SCK1 P0.7, MISO1 P0.8, MOSI1 P0.9

#ifdef LPC407x
	LPC_SC->PCONP |= (1 << 21);    // Turn On SSP0
	LPC_IOCON->P0_15 = 2;

#else
  #if defined SDCARD_SSP1
	LPC_SC->PCONP |= (1 << 10);    // Turn On SSP1
	LPC_PINCON->PINSEL0 |= 0x00008000; // enable SSP1  SCK1 P0.7
  #else
	LPC_SC->PCONP |= (1 << 21);    // Turn On SSP0
	LPC_PINCON->PINSEL0 |= 0x80000000; // enable SSP0 pin functions SCK0 P0.15
  #endif
#endif
	
  #ifdef LPC407x
	LPC_SSP->CPSR = 24; // SSPCPSR clock prescale register, master mode, minimum divisor is 0x02
  #else
	LPC_SSP->CPSR = 2; // SSPCPSR clock prescale register, master mode, minimum divisor is 0x02
  #endif
	
	LPC_SSP->CR0  = 7; // Set DSS data to 8-bit, Frame format SPI, CPOL = 0, CPHA = 0, and SCR is 0
	LPC_SSP->CR1  = 2; // Enable SSP Master mode
	
	LPC_GPIO0->DIR |= 1 << MOSI_pin; 
	LPC_GPIO0->SET = 1 << MOSI_pin;
	
    // Set DI and CS high and apply more than 74 pulses to SCLK for the card to be able to accept a native command.
	// Send 80 or so clock transitions with CS and DI held high.
	// This is required after card power up to get it into SPI mode.
    // Send 10 bytes over the SSI. This causes the clock to wiggle the required number of times.
    for(i = 0 ; i < 10 ; i++)
		rcvr_spi();
// now switch to pin functions MOSI0, MISO0	
#ifdef LPC407x
	LPC_IOCON->P0_17 = 2;// MISO0 P0.17
	LPC_IOCON->P0_18 = 2;// MOSI0 P0.18
#else
  #if defined SDCARD_SSP1
	LPC_PINCON->PINSEL0 |= 0x000A8000; // enable SSP1  SCK1 P0.7, MISO1 P0.8, MOSI1 P0.9
  #else
	LPC_PINCON->PINSEL1 |= 0x00000028; // enable SSP0 pin functionsMOSI0 P0.18, MISO0 P0.17
  #endif
#endif

#endif // LPC407x or LPC17xx

    PowerFlag = 1;
}

/*---------------------------------------------------------*/
/* User Provided Timer Function for FatFs module           */
/*---------------------------------------------------------*/
/* This is a real time clock service to be called from     */
/* FatFs module. Any valid time must be returned even if   */
/* the system does not support a real time clock.          */

unsigned int get_fattime (void)
{

  #if defined LPC11U67 || defined LPC11U68
    return 0 ;//GET THIS
  #else
    return    ((LPC_RTC->YEAR-1980) << 25)// Year
            | (LPC_RTC->MONTH << 21)      // Month
            | (LPC_RTC->DOM << 16)        // Day
            | (LPC_RTC->HOUR << 11)       // Hour
            | (LPC_RTC->MIN << 5)         // Min
            | (LPC_RTC->SEC >> 1)         // Sec
            ;
  #endif
}

#endif // not MK20DX128 or MK20DX256


static
void rcvr_spi_m (unsigned char *dst)
{
    *dst = rcvr_spi();
}

/*-----------------------------------------------------------------------*/
/* Receive a data packet from MMC                                        */
/*-----------------------------------------------------------------------*/

static
unsigned char rcvr_datablock (
    unsigned char *buff,            /* Data buffer to store received data */
    unsigned int btr            /* Byte count (must be even number) */
)
{

    unsigned char token;
	//unsigned int Timer1, t1,t2;
	int i;
//usually 1.3ms, 23 sectors(?) takes 30.5ms
//LPC_GPIO0->SET = 1 << 26;			// mbed DIP18 only takes 336ms, maybe 192 tries
	
	//Timer1 = TIMER;
	//t1=Timer1;
	for (i = 0; i < 1000; i++){ //i'll make it about 1.75 ms
		token = rcvr_spi();//1.75us
		if(token == 0xFE)
			break;
	}

//    do {                            /* Wait for data packet in timeout of 100ms */
//        token = rcvr_spi();//1.75us
//		//count++;
//    } while ((token == 0xFF) && ((TIMER - Timer1) < 100000));
//	//} while ((token == 0xFF) && (count < 1000));
    
	//t2=TIMER;
	//if((t2-t1) >= 100000)//printf("RCVR TIME OUT\r\n");
	//	printf("t= %dus (0x%04X) 0x%04X 0x%04X\r\n",t2-t1,t2-t1,t1,t2);

	if(token != 0xFE) {
		//LPC_GPIO1->CLR = 1 << 30;
		//printf("token 0x%02X != 0xFE, t= %dus (0x%04X) 0x%04X 0x%04X\r\n",token,t2-t1,t2-t1,t1,t2);
		return 0;    /* If not valid data token, return with error */
	}
    do {                            /* Receive the data block into buffer */
        rcvr_spi_m(buff++);
        rcvr_spi_m(buff++);
    } while (btr -= 2);
    rcvr_spi();                        /* Discard CRC */
    rcvr_spi();
//LPC_GPIO0->CLR = 1 << 26;

    return 1;                    /* Return with success */

}



/*-----------------------------------------------------------------------*/
/* Send a data packet to MMC                                             */
/*-----------------------------------------------------------------------*/

static
unsigned char xmit_datablock (
    const unsigned char *buff,    /* 512 byte data block to be transmitted */
    unsigned char token            /* Data/Stop token */
)
{
    unsigned char resp, wc;


    if (wait_ready() != 0xFF) return 0;

    xmit_spi(token);                    /* Xmit data token */
    if (token != 0xFD) {    /* Is data token */
        wc = 0;
        do {                            /* Xmit the 512 byte data block to MMC */
            xmit_spi(*buff++);
            xmit_spi(*buff++);
        } while (--wc);
        xmit_spi(0xFF);                    /* CRC (Dummy) */
        xmit_spi(0xFF);
        resp = rcvr_spi();                /* Reveive data response */
        if ((resp & 0x1F) != 0x05)        /* If not accepted, return with error */
            return 0;
    }

    return 1;
}



/*-----------------------------------------------------------------------*/
/* Send a command packet to MMC                                          */
/*-----------------------------------------------------------------------*/

static
unsigned char send_cmd (
    unsigned char cmd,        /* Command byte */
    unsigned int arg        /* Argument */
)
{
    unsigned char n, res;

    if (wait_ready() != 0xFF) return 0xFF;

    /* Send command packet */
    xmit_spi(cmd);                        /* Command */
    xmit_spi((unsigned char)(arg >> 24));        /* Argument[31..24] */
    xmit_spi((unsigned char)(arg >> 16));        /* Argument[23..16] */
    xmit_spi((unsigned char)(arg >> 8));            /* Argument[15..8] */
    xmit_spi((unsigned char)arg);                /* Argument[7..0] */
    n = 0;
    if (cmd == CMD0) n = 0x95;            /* CRC for CMD0(0) */
    if (cmd == CMD8) n = 0x87;            /* CRC for CMD8(0x1AA) */
    xmit_spi(n);

    /* Receive command response */
    if (cmd == CMD12) rcvr_spi();        /* Skip a stuff byte when stop reading */
    n = 10;                                /* Wait for a valid response in timeout of 10 attempts */
    do
        res = rcvr_spi();
    while ((res & 0x80) && --n);

    return res;            /* Return with the response value */
}

/*--------------------------------------------------------------------------

   Public Functions

---------------------------------------------------------------------------*/


/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive                                                 */
/*-----------------------------------------------------------------------*/

unsigned char disk_initialize (void)
{
    unsigned char n, ty, ocr[4], done;
	unsigned int Timer1;

//STA_NODISK is never set
//    if (DiskStatus & STA_NODISK) return DiskStatus;    /* No card in the socket */
//printf("DiskStatus 0x%X\r\n",DiskStatus);

    power_on();                            /* Force socket power on */

    SPI_select;                /* CS = L */
    ty = 0;
    if (send_cmd(CMD0, 0) == 1) {            /* Enter Idle state */

        Timer1 = TIMER;               /* Initialization timeout of 1000 msec */
		done = 0;
        if (send_cmd(CMD8, 0x1AA) == 1) {    /* SDC Ver2+ */
            for (n = 0; n < 4; n++) ocr[n] = rcvr_spi();
            if (ocr[2] == 0x01 && ocr[3] == 0xAA) {    /* The card can work at vdd range of 2.7-3.6V */
                do {
                    if (send_cmd(CMD55, 0) <= 1 && send_cmd(CMD41, 1UL << 30) == 0) done = 1;    /* ACMD41 with HCS bit */
                } while (!done && ((TIMER - Timer1) < 1000000));/* timeout of 1000 msec */
                if (done && send_cmd(CMD58, 0) == 0) {    /* Check CCS bit */
                    for (n = 0; n < 4; n++) ocr[n] = rcvr_spi();
                    ty = (ocr[0] & 0x40) ? 6 : 2;
                }
				
            }
        } else {                            /* SDC Ver1 or MMC */
            ty = (send_cmd(CMD55, 0) <= 1 && send_cmd(CMD41, 0) <= 1) ? 2 : 1;    /* SDC : MMC */
            do {
                if (ty == 2) {
                    if (send_cmd(CMD55, 0) <= 1 && send_cmd(CMD41, 0) == 0) done = 1;    /* ACMD41 */
                } else {
                    if (send_cmd(CMD1, 0) == 0) done = 1;                                /* CMD1 */
                }
                } while (!done && ((TIMER - Timer1) < 1000000)); /* timeout of 1000 msec */
            if (!done || send_cmd(CMD16, 512) != 0)    /* Select R/W block length */
			{
                ty = 0;
				//printf("disk_initialize 2 not done\r\n");
			}
        }
    }
    CardType = ty;
    SPI_deselect;            /* CS = H */
    rcvr_spi();            /* Idle (Release DO) */

    if (ty) {            /* Initialization succeded */
        DiskStatus &= ~STA_NOINIT;        /* Clear STA_NOINIT */
    } else {            /* Initialization failed */
        PowerFlag = 0;
    }

    return DiskStatus;
}



/*-----------------------------------------------------------------------*/
/* Get Disk Status                                                       */
/*-----------------------------------------------------------------------*/

unsigned char disk_status (void)
{
    return DiskStatus;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT disk_read (
    unsigned char *buff,            /* Pointer to the data buffer to store read data */
    unsigned int sector,        /* Start sector number (LBA) */
    unsigned char count            /* Sector count (1..255) */
)
{
    if (!count) return RES_PARERR;
    if (DiskStatus & STA_NOINIT) return RES_NOTRDY;

    if (!(CardType & 4)) sector *= 512;    /* Convert to byte address if needed */

    SPI_select;            /* CS = L */

    if (count == 1) {    /* Single block read */
        if ((send_cmd(CMD17, sector) == 0)    /* READ_SINGLE_BLOCK */
            && rcvr_datablock(buff, 512))
            count = 0;
    }
    else {                /* Multiple block read */
        if (send_cmd(CMD18, sector) == 0) {    /* READ_MULTIPLE_BLOCK */
            do {
                if (!rcvr_datablock(buff, 512)) break;
                buff += 512;
            } while (--count);
            send_cmd(CMD12, 0);                /* STOP_TRANSMISSION */
        }
    }

    SPI_deselect;            /* CS = H */
    rcvr_spi();            /* Idle (Release DO) */

    return count ? RES_ERROR : RES_OK;
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

DRESULT disk_write (
    const unsigned char *buff,    /* Pointer to the data to be written */
    unsigned int sector,          /* Start sector number (LBA) */
    unsigned char count           /* Sector count (1..255) */
)
{
    if (!count) return RES_PARERR;
    if (DiskStatus & STA_NOINIT) return RES_NOTRDY;
//STA_PROTECT is never set
//    if (DiskStatus & STA_PROTECT) return RES_WRPRT;
//printf("DiskStatus 0x%X\r\n",DiskStatus);
    if (!(CardType & 4)) sector *= 512;    /* Convert to byte address if needed */

    SPI_select;            /* CS = L */

    if (count == 1) {    /* Single block write */
        if ((send_cmd(CMD24, sector) == 0)    /* WRITE_BLOCK */
            && xmit_datablock(buff, 0xFE))
            count = 0;
    }
    else {                /* Multiple block write */
        if (CardType & 2) {
            send_cmd(CMD55, 0); send_cmd(CMD23, count);    /* ACMD23 */
        }
        if (send_cmd(CMD25, sector) == 0) {    /* WRITE_MULTIPLE_BLOCK */
            do {
                if (!xmit_datablock(buff, 0xFC)) break;
                buff += 512;
            } while (--count);
            if (!xmit_datablock(0, 0xFD))    /* STOP_TRAN token */
                count = 1;
        }
    }

    SPI_deselect;            /* CS = H */
    rcvr_spi();            /* Idle (Release DO) */

    return count ? RES_ERROR : RES_OK;
}



/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

DRESULT disk_ioctl (
    unsigned char ctrl,        /* Control code */
    void *buff        /* Buffer to send/receive control data */
)
{
    DRESULT res;
    //unsigned char n, csd[16], *ptr = buff;

    res = RES_ERROR;

    if (DiskStatus & STA_NOINIT) return RES_NOTRDY;

    SPI_select;        /* CS = L */

    switch (ctrl) {
    case GET_SECTOR_SIZE :    /* Get sectors on the disk (unsigned short) */
        *(unsigned short*)buff = 512;
        res = RES_OK;
        break;

    case CTRL_SYNC :    /* Make sure that data has been written */
        if (wait_ready() == 0xFF)
            res = RES_OK;
        break;

    default:
        res = RES_PARERR;
    }

    SPI_deselect;            /* CS = H */
    rcvr_spi();            /* Idle (Release DO) */

    return res;
}

