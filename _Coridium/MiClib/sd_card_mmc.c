
#ifdef FOR_BASIC
  #include "basic_pcb.h"	// this one is required and configures for the proper CPU
#else
  #include "coridium_pcb.h"	// this one is required and configures for the proper CPU
#endif

#if defined LPC54618
  #include "uart_lpc546xx.h"
  #include "sdif_5460x.h"
#else   
  #eror Undefined Part
#endif

#include "printf.h"			

#include "sd_card_mmc.h"


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
static volatile unsigned char DiskStatus = STA_NOINIT;    /* Disk status */

volatile unsigned int sdio_wait_exit;

/* 100Hz decrement timer stopped at zero (disk_timerproc()) */
static volatile unsigned short Timer2;

static CARD_HANDLE_T *hCard;
mci_card_struct sdcardinfo;



/*--------------------------------------------------------------------------

   Module Private Functions

---------------------------------------------------------------------------*/

void SDIO_IRQHandler(void)
{
	/* All SD based register handling is done in the callback
	   function. The SDIO interrupt is not enabled as part of this
	   driver and needs to be enabled/disabled in the callbacks or
	   application as needed. This is to allow flexibility with IRQ
	   handling for applicaitons and RTOSes. */
	/* Set wait exit flag to tell wait function we are ready. In an RTOS,
	   this would trigger wakeup of a thread waiting for the IRQ. */
	NVIC->ICER[((uint32_t)(SDIO_IRQn) >> 5)] = (1 << ((uint32_t)(SDIO_IRQn) & 0x1F)); /* disable interrupt */ //NVIC_DisableIRQ(SDIO_IRQn);
	sdio_wait_exit = 1;
}


////////////////////////////////// TEMPORARY DEBUG TESTING //////////////////////////////////
#include "ff.h"
void die(FRESULT rc)
{
	printf("Failed with rc=%u ", rc);
	switch(rc) {
	case 1: printf("FR_NOT_READY"); break;			/* (1) The physical drive cannot work */
	case 2: printf("FR_NO_FILE"); break;			/* (2) Could not find the file */
	case 3: printf("FR_NO_PATH"); break;			/* (3) Could not find the path */
	case 4: printf("FR_INVALID_NAME"); break;		/* (4) The path name format is invalid */
	case 5: printf("FR_DENIED"); break;				/* (5) Access denied due to prohibited access or directory full */
	case 6: printf("FR_EXIST"); break;				/* (6) Access denied due to prohibited access */
	case 7: printf("FR_RW_ERROR"); break;	    	/* (7) R\W */
	case 8: printf("FR_WRITE_PROTECTED"); break;	/* (8) The physical drive is write protected */
	case 9: printf("FR_NOT_ENABLED"); break;		/* (9) The volume has no work area */
	case 10: printf("FR_NO_FILESYSTEM"); break;		/* (10) There is no valid FAT volume */
	case 11: printf("FR_INVALID_OBJECT"); break;	/* (11) The file/directory object is invalid */
	default: printf("unknown error %d",rc);
	};
	printf("\n");
/*	for (;; ) {} */
}
#define BUFFER_SIZE     128
static uint32_t Buff[BUFFER_SIZE/sizeof(uint32_t)];

int read_message(int print_it) {
	FRESULT rc;		/* Result code */
	char *cbuf = (char *) Buff;
	unsigned int bw, br, i;

	rc = file_open ("message.txt", FA_READ);
	if (print_it) printf("Opening MESSAGE.TXT from SD Card...");
	if (rc) {
		if (print_it) printf("Failed.\r\n");
		die(rc);
		return -1;
	} else {
		if (print_it) printf("Done.\r\n");
	}

	if (print_it) printf("Printing contents of MESSAGE.TXT...\r\n\r\n");
	for (;; ) {
		/* Read a chunk of file */
		rc = file_read ((void *)cbuf, BUFFER_SIZE, &br);
		if (rc || !br) {
			break;					/* Error or end of file */
		}
		if (print_it) {
			for (i = 0; i < br; i++)	/* Type the data */
				{printf("%c", cbuf[i]); }
		}
	}
	if (rc) {
		die(rc);
		return -1;
	}

	if (print_it) printf("\r\nClose the file.\r\n");
	rc = file_close();
	if (rc) {
		die(rc);
		return -1;		
	}
	return 0;
}
////////////////////////////////// TEMPORARY DEBUG TESTING //////////////////////////////////



void sdcard_init(void)
{
	DiskStatus = STA_NOINIT;
	//disk_initialize();


////////////////////////////////// TEMPORARY DEBUG TESTING //////////////////////////////////
 	FRESULT rc;		/* Result code */
	char *cbuf = (char *) Buff;
	unsigned int bw, br;
	printf("Hello NXP Semiconductors\r\n\r\n***SDCARD demo***\r\n");

//	NVIC->ICER[((uint32_t)(SDIO_IRQn) >> 5)] = (1 << ((uint32_t)(SDIO_IRQn) & 0x1F)); /* disable interrupt */ //NVIC_DisableIRQ(SDIO_IRQn);
	/* Enable SD/MMC Interrupt */
//	NVIC->ISER[(uint32_t)((int32_t)SDIO_IRQn) >> 5] = (uint32_t)(1 << ((uint32_t)((int32_t)SDIO_IRQn) & (uint32_t)0x1F)); /* enable interrupt *///NVIC_EnableIRQ(SDIO_IRQn);
	
	file_mount();		/* Register volume work area (never fails) */
	
	read_message(1);
	
	//readtest();

	printf("\r\nCreate a new file (hello.txt).\r\n");
	rc = file_open ("HELLO.TXT", FA_WRITE | FA_CREATE_ALWAYS);
	if (rc) {
		die(rc);
	}

	printf("Write text data \"Hello world!\" to HELLO.TXT\r\n");

	rc = file_write( "Hello world!\r\n", 14, &bw);
	if (rc) {
		die(rc);
	}

	//sprintf(debugBuf, "%u bytes written.\r\n", bw);
	printf("%d bytes written.\r\n", bw);

			printf("Close the file.\r\n");
	rc = file_close();
	if (rc) {
		die(rc);
	}

	//printf("\r\nOpen root directory.\r\n");
	//rc = file_opendir();
	//if (rc) {
	//	die(rc);
	//}

	//printf("Directory listing...\r\n");
	//for (;; ) {
	//	/* Read a directory item */
	//	rc = file_readdir();
	//	if (rc || !fno.fname[0]) {
	//		break;					/* Error or end of dir */
	//	}
	//	if (fno.fattrib & AM_DIR) {
	//		sprintf(debugBuf, "   <dir>  %s\r\n", fno.fname);
	//	}
	//	else {
	//		sprintf(debugBuf, "   %8lu  %s\r\n", fno.fsize, fno.fname);
	//	}
	//	printf(debugBuf);
	//}
	if (rc) {
		die(rc);
	}
////////////////////////////////// TEMPORARY DEBUG TESTING //////////////////////////////////
}


static mci_card_struct *g_card_info;


/* Function to send command to Card interface unit (CIU) */
int32_t SDIF_SendCmd(LPC_SDMMC_T *pSDMMC, uint32_t cmd, uint32_t arg)
{
	volatile int32_t tmo = 50;
	volatile int delay;

	/* set command arg reg*/
	pSDMMC->CMDARG = arg;
	pSDMMC->CMD = MCI_CMD_USE_HOLD_REG | MCI_CMD_START | cmd;

	/* poll untill command is accepted by the CIU */
	while (--tmo && (pSDMMC->CMD & MCI_CMD_START)) {
		if (tmo & 1) {
			delay = 50;
		}
		else {
			delay = 18000;
		}

		while (--delay > 1) {}
	}

	return (tmo < 1) ? 1 : 0;
}

/* Function to clear interrupt & FIFOs */
void SDIF_SetClearIntFifo(LPC_SDMMC_T *pSDMMC)
{
	/* reset all blocks */
	pSDMMC->CTRL |= MCI_CTRL_FIFO_RESET;

	/* wait till resets clear */
	while (pSDMMC->CTRL & MCI_CTRL_FIFO_RESET) {}

	/* Clear interrupt status */
	pSDMMC->RINTSTS = 0xFFFFFFFF;
}

/* Sets the SD bus clock speed */
void SDIF_SetClock(LPC_SDMMC_T *pSDMMC, uint32_t clk_rate, uint32_t speed)
{
	/* compute SD/MMC clock dividers */
	uint32_t div;

	//div = ((clk_rate / speed) + 2) >> 1;
	//	div = ((clk_rate + speed - 1)/speed + 3) >> 2;	// adding speed rounds down, adding 3 rounds /4
	div = ((clk_rate + speed - 1)/speed + 7) >> 3;	// adding speed rounds down, adding 3 rounds /4

	if ((div == pSDMMC->CLKDIV) && pSDMMC->CLKENA) {
		return;	/* Closest speed is already set */

	}
	/* disable clock */
	pSDMMC->CLKENA = 0;

	/* User divider 0 */
	pSDMMC->CLKSRC = MCI_CLKSRC_CLKDIV0;

	/* inform CIU */
	SDIF_SendCmd(pSDMMC, MCI_CMD_UPD_CLK | MCI_CMD_PRV_DAT_WAIT, 0);

	/* set divider 0 to desired value */
	pSDMMC->CLKDIV = MCI_CLOCK_DIVIDER(0, div);

	/* inform CIU */
	SDIF_SendCmd(pSDMMC, MCI_CMD_UPD_CLK | MCI_CMD_PRV_DAT_WAIT, 0);

	/* enable clock */
	pSDMMC->CLKENA = MCI_CLKEN_ENABLE;

	/* inform CIU */
	SDIF_SendCmd(pSDMMC, MCI_CMD_UPD_CLK | MCI_CMD_PRV_DAT_WAIT, 0);
}


/* Read the response from the last command */
void SDIF_GetResponse(LPC_SDMMC_T *pSDMMC, uint32_t *resp)
{
	/* on this chip response is not a fifo so read all 4 regs */
	resp[0] = pSDMMC->RESP0;
	resp[1] = pSDMMC->RESP1;
	resp[2] = pSDMMC->RESP2;
	resp[3] = pSDMMC->RESP3;
}

/* Setup DMA descriptors */
void SDIF_DmaSetup(LPC_SDMMC_T *pSDMMC, sdif_device *psdif_dev, uint32_t addr, uint32_t size)
{
	int i = 0;
	uint32_t ctrl, maxs;

	/* Reset DMA */
	pSDMMC->CTRL |= MCI_CTRL_DMA_RESET | MCI_CTRL_FIFO_RESET;
	while (pSDMMC->CTRL & MCI_CTRL_DMA_RESET) {}

	/* Build a descriptor list using the chained DMA method */
	while (size > 0) {
		/* Limit size of the transfer to maximum buffer size */
		maxs = size;
		if (maxs > MCI_DMADES1_MAXTR) {
			maxs = MCI_DMADES1_MAXTR;
		}
		size -= maxs;

		/* Set buffer size */
		psdif_dev->mci_dma_dd[i].des1 = MCI_DMADES1_BS1(maxs);

		/* Setup buffer address (chained) */
		psdif_dev->mci_dma_dd[i].des2 = addr + (i * MCI_DMADES1_MAXTR);

		/* Setup basic control */
		ctrl = MCI_DMADES0_OWN | MCI_DMADES0_CH;
		if (i == 0) {
			ctrl |= MCI_DMADES0_FS;	/* First DMA buffer */
		}
		/* No more data? Then this is the last descriptor */
		if (!size) {
			ctrl |= MCI_DMADES0_LD;
		}
		else {
			ctrl |= MCI_DMADES0_DIC;
		}

		/* Another descriptor is needed */
		psdif_dev->mci_dma_dd[i].des3 = (uint32_t) &psdif_dev->mci_dma_dd[i + 1];
		psdif_dev->mci_dma_dd[i].des0 = ctrl;

		i++;
	}

	/* Set DMA derscriptor base address */
	pSDMMC->DBADDR = (uint32_t) &psdif_dev->mci_dma_dd[0];
}

/* Helper definition: all SD error conditions in the status word */
#define SD_INT_ERROR (MCI_INT_RESP_ERR | MCI_INT_RCRC | MCI_INT_DCRC | \
					  MCI_INT_RTO | MCI_INT_DTO | MCI_INT_HTO | MCI_INT_FRUN | MCI_INT_HLE | \
					  MCI_INT_SBE | MCI_INT_EBE)

/**
 * @brief	Sets up the SD event driven wakeup
 * @param	bits : Status bits to poll for command completion
 * @return	Nothing
 */
//static void sdmmc_setup_wakeup(void *bits)
static void evsetup_cb(void *bits)
{
	uint32_t bit_mask = *((uint32_t *)bits);
	/* Wait for IRQ - for an RTOS, you would pend on an event here with a IRQ based wakeup. */
	NVIC->ICPR[((uint32_t)(SDIO_IRQn) >> 5)] = (1 << ((uint32_t)(SDIO_IRQn) & 0x1F)); /* Clear pending interrupt */ 
	//NVIC_ClearPendingIRQ(SDIO_IRQn);
	sdio_wait_exit = 0;
	LPC_SDIO->INTMASK = bit_mask;
	NVIC->ISER[(uint32_t)((int32_t)SDIO_IRQn) >> 5] = (uint32_t)(1 << ((uint32_t)((int32_t)SDIO_IRQn) & (uint32_t)0x1F)); /* enable interrupt */
	 //NVIC_EnableIRQ(SDIO_IRQn);
}

/**
 * @brief	A better wait callback for SDMMC driven by the IRQ flag
 * @return	0 on success, or failure condition (-1)
 */
//static uint32_t sdmmc_irq_driven_wait(void)
static uint32_t waitfunc_cb(void)
{
	volatile uint32_t status;//, i;

	/* Wait for event, would be nice to have a timeout, but keep it  simple */
	//i=100000;
	//while ( (sdio_wait_exit == 0) && (i--)){}
	while (sdio_wait_exit == 0){}

	/* Get status and clear interrupts */
	status = LPC_SDIO->RINTSTS;
	LPC_SDIO->RINTSTS = status;
	LPC_SDIO->INTMASK = 0;

	return status;
}

/* Function to execute a command */
static int32_t sdmmc_execute_command(LPC_SDMMC_T *pSDMMC, uint32_t cmd, uint32_t arg, uint32_t wait_status)
{
	int32_t step = (cmd & CMD_BIT_APP) ? 2 : 1;
	int32_t status = 0;
	uint32_t cmd_reg = 0;
//int i;
	if (!wait_status) {
		wait_status = (cmd & CMD_MASK_RESP) ? MCI_INT_CMD_DONE : MCI_INT_DATA_OVER;
	}

	/* Clear the interrupts & FIFOs*/
	if (cmd & CMD_BIT_DATA) {
		SDIF_SetClearIntFifo(pSDMMC);
	}

	/* also check error conditions */
	wait_status |= MCI_INT_EBE | MCI_INT_SBE | MCI_INT_HLE | MCI_INT_RTO | MCI_INT_RCRC | MCI_INT_RESP_ERR;
	if (wait_status & MCI_INT_DATA_OVER) {
		wait_status |= MCI_INT_FRUN | MCI_INT_HTO | MCI_INT_DTO | MCI_INT_DCRC;
	}

	while (step) {
		//i=Clock_GetSDIOClockRate();// 96000000
		SDIF_SetClock(pSDMMC, /*Clock_GetSDIOClockRate()*/ 96000000 , g_card_info->card_info.speed);

		/* Clear the interrupts */
		pSDMMC->RINTSTS = 0xFFFFFFFF;//SDIF_ClrIntStatus(pSDMMC, 0xFFFFFFFF);

		/*g_card_info->card_info.*/evsetup_cb((void *) &wait_status);

		switch (step) {
		case 1:	/* Execute command */
			cmd_reg = ((cmd & CMD_MASK_CMD) >> CMD_SHIFT_CMD) |
					  ((cmd & CMD_BIT_INIT)  ? MCI_CMD_INIT : 0) |
					  ((cmd & CMD_BIT_DATA)  ? (MCI_CMD_DAT_EXP | MCI_CMD_PRV_DAT_WAIT) : 0) |
					  (((cmd & CMD_MASK_RESP) == CMD_RESP_R2) ? MCI_CMD_RESP_LONG : 0) |
					  ((cmd & CMD_MASK_RESP) ? MCI_CMD_RESP_EXP : 0) |
					  ((cmd & CMD_BIT_WRITE)  ? MCI_CMD_DAT_WR : 0) |
					  ((cmd & CMD_BIT_STREAM) ? MCI_CMD_STRM_MODE : 0) |
					  ((cmd & CMD_BIT_BUSY) ? MCI_CMD_STOP : 0) |
					  ((cmd & CMD_BIT_AUTO_STOP)  ? MCI_CMD_SEND_STOP : 0) |
					  MCI_CMD_START;

			/* wait for previos data finsh for select/deselect commands */
			if (((cmd & CMD_MASK_CMD) >> CMD_SHIFT_CMD) == MMC_SELECT_CARD) {
				cmd_reg |= MCI_CMD_PRV_DAT_WAIT;
			}

			/* wait for command to be accepted by CIU */
			if (SDIF_SendCmd(pSDMMC, cmd_reg, arg) == 0) {
				--step;
			}
			break;

		case 0:
			return 0;

		case 2:	/* APP prefix */
			cmd_reg = MMC_APP_CMD | MCI_CMD_RESP_EXP |
					  ((cmd & CMD_BIT_INIT)  ? MCI_CMD_INIT : 0) |
					  MCI_CMD_START;

			if (SDIF_SendCmd(pSDMMC, cmd_reg, g_card_info->card_info.rca << 16) == 0) {
				--step;
			}
			break;
		}

		/* wait for command response */
		status = /*g_card_info->card_info.*/waitfunc_cb();

		/* We return an error if there is a timeout, even if we've fetched  a response */
		if (status & SD_INT_ERROR) {
			return status;
		}

		if (status & MCI_INT_CMD_DONE) {
			switch (cmd & CMD_MASK_RESP) {
			case 0:
				break;

			case CMD_RESP_R1:
			case CMD_RESP_R3:
			case CMD_RESP_R2:
				SDIF_GetResponse(pSDMMC, &g_card_info->card_info.response[0]);
				break;
			}
		}
	}

	return 0;
}

/* Checks whether card is acquired properly or not */
static int32_t prv_card_acquired(void)
{
	return g_card_info->card_info.cid[0] != 0;
}

/* Helper function to get a bit field withing multi-word  buffer. Used to get
   fields with-in CSD & EXT-CSD */
static uint32_t prv_get_bits(int32_t start, int32_t end, uint32_t *data)
{
	uint32_t v;
	uint32_t i = end >> 5;
	uint32_t j = start & 0x1f;

	if (i == (start >> 5)) {
		v = (data[i] >> j);
	}
	else {
		v = ((data[i] << (32 - j)) | (data[start >> 5] >> j));
	}

	return v & ((1 << (end - start + 1)) - 1);
}

/* Function to process the CSD & EXT-CSD of the card */
static void prv_process_csd(LPC_SDMMC_T *pSDMMC)
{
	int32_t status = 0;
	int32_t c_size = 0;
	int32_t c_size_mult = 0;
	int32_t mult = 0;

	/* compute block length based on CSD response */
	g_card_info->card_info.block_len = 1 << prv_get_bits(80, 83, g_card_info->card_info.csd);

	if ((g_card_info->card_info.card_type & CARD_TYPE_HC) && (g_card_info->card_info.card_type & CARD_TYPE_SD)) {
		/* See section 5.3.3 CSD Register (CSD Version 2.0) of SD2.0 spec  an explanation for the calculation of these values */
		c_size = prv_get_bits(48, 69, (uint32_t *) g_card_info->card_info.csd) + 1;
		g_card_info->card_info.blocknr = c_size << 10;	/* 512 byte blocks */
	}
	else {
		/* See section 5.3 of the 4.1 revision of the MMC specs for  an explanation for the calculation of these values */
		c_size = prv_get_bits(62, 73, (uint32_t *) g_card_info->card_info.csd);
		c_size_mult = prv_get_bits(47, 49, (uint32_t *) g_card_info->card_info.csd);
		mult = 1 << (c_size_mult + 2);
		g_card_info->card_info.blocknr = (c_size + 1) * mult;

		/* adjust blocknr to 512/block */
		if (g_card_info->card_info.block_len > MMC_SECTOR_SIZE) {
			g_card_info->card_info.blocknr = g_card_info->card_info.blocknr * (g_card_info->card_info.block_len >> 9);
		}

		/* get extended CSD for newer MMC cards CSD spec >= 4.0*/
		if (((g_card_info->card_info.card_type & CARD_TYPE_SD) == 0) &&
			(prv_get_bits(122, 125, (uint32_t *) g_card_info->card_info.csd) >= 4)) {
			/* put card in trans state */
			status = sdmmc_execute_command(pSDMMC, CMD_SELECT_CARD, g_card_info->card_info.rca << 16, 0);

			/* set block size and byte count */
			//SDIF_SetBlkSizeByteCnt(pSDMMC, MMC_SECTOR_SIZE);
			pSDMMC->BLKSIZ = MMC_SECTOR_SIZE;
			pSDMMC->BYTCNT = MMC_SECTOR_SIZE;

			/* send EXT_CSD command */
			SDIF_DmaSetup(pSDMMC,
							  &g_card_info->sdif_dev,
							  (uint32_t) g_card_info->card_info.ext_csd,
							  MMC_SECTOR_SIZE);

			status = sdmmc_execute_command(pSDMMC, CMD_SEND_EXT_CSD, 0, 0 | MCI_INT_DATA_OVER);
			if ((status & SD_INT_ERROR) == 0) {
				/* check EXT_CSD_VER is greater than 1.1 */
				if ((g_card_info->card_info.ext_csd[48] & 0xFF) > 1) {
					g_card_info->card_info.blocknr = g_card_info->card_info.ext_csd[53];/* bytes 212:215 represent sec count */

				}
				/* switch to 52MHz clock if card type is set to 1 or else set to 26MHz */
				if ((g_card_info->card_info.ext_csd[49] & 0xFF) == 1) {
					/* for type 1 MMC cards high speed is 52MHz */
					g_card_info->card_info.speed = MMC_HIGH_BUS_MAX_CLOCK;
				}
				else {
					/* for type 0 MMC cards high speed is 26MHz */
					g_card_info->card_info.speed = MMC_LOW_BUS_MAX_CLOCK;
				}
			}
		}
	}

	g_card_info->card_info.device_size = (uint64_t) g_card_info->card_info.blocknr << 9;	/* blocknr * 512 */
}

/* Puts current selected card in trans state */
static int32_t prv_set_trans_state(LPC_SDMMC_T *pSDMMC)
{
	uint32_t status;

	/* get current state of the card */
	status = sdmmc_execute_command(pSDMMC, CMD_SEND_STATUS, g_card_info->card_info.rca << 16, 0);
	if (status & MCI_INT_RTO) {
		/* unable to get the card state. So return immediatly. */
		return -1;
	}

	/* check card state in response */
	status = R1_CURRENT_STATE(g_card_info->card_info.response[0]);
	switch (status) {
	case SDMMC_STBY_ST:
		/* put card in 'Trans' state */
		status = sdmmc_execute_command(pSDMMC, CMD_SELECT_CARD, g_card_info->card_info.rca << 16, 0);
		if (status != 0) {
			/* unable to put the card in Trans state. So return immediatly. */
			return -1;
		}
		break;

	case SDMMC_TRAN_ST:
		/*do nothing */
		break;

	default:
		/* card shouldn't be in other states so return */
		return -1;
	}

	return 0;
}

/* Sets card data width and block size */
static int32_t prv_set_card_params(LPC_SDMMC_T *pSDMMC)
{
	int32_t status;

#if SDIO_BUS_WIDTH > 1
	if (g_card_info->card_info.card_type & CARD_TYPE_SD) {
		status = sdmmc_execute_command(pSDMMC, CMD_SD_SET_WIDTH, 2, 0);
		if (status != 0) {
			return -1;
		}

		/* if positive response */
		pSDMMC->CTYPE = MCI_CTYPE_4BIT;//SDIF_SetCardType(pSDMMC, MCI_CTYPE_4BIT);
	}
#elif SDIO_BUS_WIDTH > 4
#error 8-bit mode not supported yet!
#endif

	/* set block length */
	pSDMMC->BLKSIZ = MMC_SECTOR_SIZE;//SDIF_SetBlkSize(pSDMMC, MMC_SECTOR_SIZE);
	status = sdmmc_execute_command(pSDMMC, CMD_SET_BLOCKLEN, MMC_SECTOR_SIZE, 0);
	if (status != 0) {
		return -1;
	}

	return 0;
}


/* Get card's current state (idle, transfer, program, etc.) */
int32_t SDMMC_GetState(LPC_SDMMC_T *pSDMMC)
{
	uint32_t status;

	/* get current state of the card */
	status = sdmmc_execute_command(pSDMMC, CMD_SEND_STATUS, g_card_info->card_info.rca << 16, 0);
	if (status & MCI_INT_RTO) {
		return -1;
	}

	/* check card state in response */
	return (int32_t) R1_CURRENT_STATE(g_card_info->card_info.response[0]);
}

/* Function to enumerate the SD/MMC/SDHC/MMC+ cards */
uint32_t SDMMC_Acquire(LPC_SDMMC_T *pSDMMC, mci_card_struct *pcardinfo)
{
	int32_t status;
	int32_t tries = 0;
	uint32_t ocr = OCR_VOLTAGE_RANGE_MSK;
	uint32_t r;
	int32_t state = 0;
	uint32_t command = 0;

	g_card_info = pcardinfo;

	/* clear card type */
	pSDMMC->CTYPE = 0;//SDIF_SetCardType(pSDMMC, 0);

	/* set high speed for the card as 20MHz */
	g_card_info->card_info.speed = MMC_MAX_CLOCK;

	status = sdmmc_execute_command(pSDMMC, CMD_IDLE, 0, MCI_INT_CMD_DONE);

	while (state < 100) {
		switch (state) {
		case 0:	/* Setup for SD */
			/* check if it is SDHC card */
			status = sdmmc_execute_command(pSDMMC, CMD_SD_SEND_IF_COND, SD_SEND_IF_ARG, 0);
			if (!(status & MCI_INT_RTO)) {
				/* check response has same echo pattern */
				if ((g_card_info->card_info.response[0] & SD_SEND_IF_ECHO_MSK) == SD_SEND_IF_RESP) {
					ocr |= OCR_HC_CCS;
				}
			}

			++state;
			command = CMD_SD_OP_COND;
			tries = INIT_OP_RETRIES;

			/* assume SD card */
			g_card_info->card_info.card_type |= CARD_TYPE_SD;
			g_card_info->card_info.speed = SD_MAX_CLOCK;
			break;

		case 10:	/* Setup for MMC */
			/* start fresh for MMC crds */
			g_card_info->card_info.card_type &= ~CARD_TYPE_SD;
			status = sdmmc_execute_command(pSDMMC, CMD_IDLE, 0, MCI_INT_CMD_DONE);
			command = CMD_MMC_OP_COND;
			tries = INIT_OP_RETRIES;
			ocr |= OCR_HC_CCS;
			++state;

			/* for MMC cards high speed is 20MHz */
			g_card_info->card_info.speed = MMC_MAX_CLOCK;
			break;

		case 1:
		case 11:
			status = sdmmc_execute_command(pSDMMC, command, 0, 0);
			if (status & MCI_INT_RTO) {
				state += 9;	/* Mode unavailable */
			}
			else {
				++state;
			}
			break;

		case 2:		/* Initial OCR check  */
		case 12:
			ocr = g_card_info->card_info.response[0] | (ocr & OCR_HC_CCS);
			if (ocr & OCR_ALL_READY) {
				++state;
			}
			else {
				state += 2;
			}
			break;

		case 3:		/* Initial wait for OCR clear */
		case 13:
			while ((ocr & OCR_ALL_READY) && --tries > 0) {
				delay_ms(MS_ACQUIRE_DELAY);//10 ms
				status = sdmmc_execute_command(pSDMMC, command, 0, 0);
				ocr = g_card_info->card_info.response[0] | (ocr & OCR_HC_CCS);
			}
			if (ocr & OCR_ALL_READY) {
				state += 7;
			}
			else {
				++state;
			}
			break;

		case 14:
			/* for MMC cards set high capacity bit */
			ocr |= OCR_HC_CCS;

		case 4:	/* Assign OCR */
			tries = SET_OP_RETRIES;
			ocr &= OCR_VOLTAGE_RANGE_MSK | OCR_HC_CCS;	/* Mask for the bits we care about */
			do {
				delay_ms(MS_ACQUIRE_DELAY);//10 ms
				status = sdmmc_execute_command(pSDMMC, command, ocr, 0);
				r = g_card_info->card_info.response[0];
			} while (!(r & OCR_ALL_READY) && --tries > 0);

			if (r & OCR_ALL_READY) {
				/* is it high capacity card */
				g_card_info->card_info.card_type |= (r & OCR_HC_CCS);
				++state;
			}
			else {
				state += 6;
			}
			break;

		case 5:	/* CID polling */
		case 15:
			status = sdmmc_execute_command(pSDMMC, CMD_ALL_SEND_CID, 0, 0);
			memcpy(&g_card_info->card_info.cid, &g_card_info->card_info.response[0], 16);
			++state;
			break;

		case 6:	/* RCA send, for SD get RCA */
			status = sdmmc_execute_command(pSDMMC, CMD_SD_SEND_RCA, 0, 0);
			g_card_info->card_info.rca = (g_card_info->card_info.response[0]) >> 16;
			++state;
			break;

		case 16:	/* RCA assignment for MMC set to 1 */
			g_card_info->card_info.rca = 1;
			status = sdmmc_execute_command(pSDMMC, CMD_MMC_SET_RCA, g_card_info->card_info.rca << 16, 0);
			++state;
			break;

		case 7:
		case 17:
			status = sdmmc_execute_command(pSDMMC, CMD_SEND_CSD, g_card_info->card_info.rca << 16, 0);
			memcpy(&g_card_info->card_info.csd, &g_card_info->card_info.response[0], 16);
			state = 100;
			break;

		default:
			state += 100;	/* break from while loop */
			break;
		}
	}

	/* Compute card size, block size and no. of blocks  based on CSD response recived. */
	if (prv_card_acquired()) {
		prv_process_csd(pSDMMC);

		/* Setup card data width and block size (once) */
		if (prv_set_trans_state(pSDMMC) != 0) {
			return 0;
		}
		if (prv_set_card_params(pSDMMC) != 0) {
			return 0;
		}
	}else
		state = 999;

	return prv_card_acquired();
}

/* Performs write of data to the SD/MMC card */
int32_t SDMMC_WriteBlocks(LPC_SDMMC_T *pSDMMC, void *buffer, int32_t start_block, int32_t num_blocks)
{
	int32_t cbWrote = num_blocks *  MMC_SECTOR_SIZE;
	int32_t status;
	int32_t index;

	/* if card is not acquired return immediately */
	if (( start_block < 0) || ( (start_block + num_blocks) > g_card_info->card_info.blocknr) ) {
		return 0;
	}

	/*Wait for card program to finish*/
	while (SDMMC_GetState(pSDMMC) != SDMMC_TRAN_ST) {}

	/* put card in trans state */
	if (prv_set_trans_state(pSDMMC) != 0) {
		return 0;
	}

	/* set number of bytes to write */
	pSDMMC->BYTCNT = cbWrote;//SDIF_SetByteCnt(pSDMMC, cbWrote);

	/* if high capacity card use block indexing */
	if (g_card_info->card_info.card_type & CARD_TYPE_HC) {
		index = start_block;
	}
	else {	/*fix at 512 bytes*/
		index = start_block << 9;	// * g_card_info->card_info.block_len;

	}

	SDIF_DmaSetup(pSDMMC, &g_card_info->sdif_dev, (uint32_t) buffer, cbWrote);

	/* Select single or multiple write based on number of blocks */
	if (num_blocks == 1) {
		status = sdmmc_execute_command(pSDMMC, CMD_WRITE_SINGLE, index, 0 | MCI_INT_DATA_OVER);
	}
	else {
		status = sdmmc_execute_command(pSDMMC, CMD_WRITE_MULTIPLE, index, 0 | MCI_INT_DATA_OVER);
	}

	/*Wait for card program to finish*/
	while (SDMMC_GetState(pSDMMC) != SDMMC_TRAN_ST) {}

	if (status != 0) {
		cbWrote = 0;
	}

	return cbWrote;
}

/* Performs the read of data from the SD/MMC card */
int32_t SDMMC_ReadBlocks(LPC_SDMMC_T *pSDMMC, void *buffer, int32_t start_block, int32_t num_blocks)
{
	int32_t cbRead = (num_blocks) * MMC_SECTOR_SIZE;
	int32_t status = 0;
	int32_t index;

	/* if card is not acquired return immediately */
	if (( start_block < 0) || ( (start_block + num_blocks) > g_card_info->card_info.blocknr) ) {
		return 0;
	}

	/* put card in trans state */
	if (prv_set_trans_state(pSDMMC) != 0) {
		return 0;
	}

	/* set number of bytes to read */
	pSDMMC->BYTCNT = cbRead;//SDIF_SetByteCnt(pSDMMC, cbRead);

	/* if high capacity card use block indexing */
	if (g_card_info->card_info.card_type & CARD_TYPE_HC) {
		index = start_block;
	}
	else {	/*fix at 512 bytes*/
		index = start_block << 9;	// \* g_card_info->card_info.block_len;

	}
	SDIF_DmaSetup(pSDMMC, &g_card_info->sdif_dev, (uint32_t) buffer, cbRead);

	/* Select single or multiple read based on number of blocks */
	if (num_blocks == 1) {
		status = sdmmc_execute_command(pSDMMC, CMD_READ_SINGLE, index, 0 | MCI_INT_DATA_OVER);
	}
	else {
		status = sdmmc_execute_command(pSDMMC, CMD_READ_MULTIPLE, index, 0 | MCI_INT_DATA_OVER);
	}

	if (status != 0) {
		cbRead = 0;
	}
	/*Wait for card program to finish*/
	while (SDMMC_GetState(pSDMMC) != SDMMC_TRAN_ST) {}

	return cbRead;
}

/*****************************************************************************
 * Private types/enumerations/variables
 ****************************************************************************/

/*****************************************************************************
 * Public types/enumerations/variables
 ****************************************************************************/

/*****************************************************************************
 * Private functions
 ****************************************************************************/

/*****************************************************************************
 * Public functions
 ****************************************************************************/


/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive                                                 */
/*-----------------------------------------------------------------------*/

unsigned char disk_initialize (void)
{
	if (DiskStatus != STA_NOINIT) {
		return DiskStatus;					/* card is already enumerated */

	}

	sdio_wait_exit = 0;
	
	memset(&sdcardinfo, 0, sizeof(sdcardinfo));

	/*  SD/MMC initialization */
	//Board_SDMMC_Init();
	/* SDIO interface pins */
	LPC_IOCON->PIO[4][19] = (IOCON_FUNC2 | IOCON_MODE_INACT | IOCON_DIGITAL_EN | IOCON_HIGH_SPEED_EN);    /* SD_CLK */
	LPC_IOCON->PIO[4][20] = (IOCON_FUNC2 | IOCON_MODE_INACT | IOCON_DIGITAL_EN | IOCON_HIGH_SPEED_EN);    /* SD_CMD */
	LPC_IOCON->PIO[4][21] = (IOCON_FUNC2 | IOCON_MODE_INACT | IOCON_DIGITAL_EN);    /* SD_PWR_EN */			// NOT used
	LPC_IOCON->PIO[4][25] = (IOCON_FUNC2 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN | IOCON_HIGH_SPEED_EN);    /* SD DAT0 */
	LPC_IOCON->PIO[4][26] = (IOCON_FUNC2 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN | IOCON_HIGH_SPEED_EN);    /* SD DAT1 */
	LPC_IOCON->PIO[4][27] = (IOCON_FUNC2 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN | IOCON_HIGH_SPEED_EN);    /* SD DAT2 */
	LPC_IOCON->PIO[4][28] = (IOCON_FUNC2 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN | IOCON_HIGH_SPEED_EN);    /* SD DAT3 */
	LPC_IOCON->PIO[4][22] = (IOCON_FUNC2 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN);   /* SD CARD DET */
	LPC_IOCON->PIO[4][23] = (IOCON_FUNC2 | IOCON_MODE_PULLDOWN | IOCON_DIGITAL_EN);   /* SD WRITE PROT */  // actually always OK
	LPC_IOCON->PIO[3][16] = (IOCON_FUNC2 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN | IOCON_HIGH_SPEED_EN);    /* SD DAT4 */
	LPC_IOCON->PIO[3][17] = (IOCON_FUNC2 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN | IOCON_HIGH_SPEED_EN);    /* SD DAT5 */
	LPC_IOCON->PIO[3][18] = (IOCON_FUNC2 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN | IOCON_HIGH_SPEED_EN);    /* SD DAT6 */
	LPC_IOCON->PIO[3][19] = (IOCON_FUNC2 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN | IOCON_HIGH_SPEED_EN);    /* SD DAT7 */


	LPC_SYSCON->SDIOCLKCTRL =0x9f9f008d;// 0x9F9F0086;

	/* Set to 32 MHz clock */
	LPC_SYSCON->SDIOCLKSEL = 3;//SYSCON_SDIOCLKSRC_FROHF;
	LPC_SYSCON->SDIOCLKDIV = 0;// (div - 1) & 0xFF;
//Chip_Clock_SetSDIOClockSource(SYSCON_SDIOCLKSRC_FROHF, 1);	//bte
//	Chip_Clock_SetSDIOClockSource(SYSCON_SDIOCLKSRC_FROHF, 2);

	/* The SDIO driver needs to know the SDIO clock rate */

	//Chip_SDIF_Init(LPC_SDMMC);
	/* If Clock source is disabled set it to main clock */
	//if (Chip_Clock_GetSDIOClockSource() == SYSCON_SDIOCLKSRC_DISABLED) {
	//	Chip_Clock_SetSDIOClockSource(SYSCON_SDIOCLKSRC_MAINCLK, 1);
	//}

    /* Enable SDIO module clock */
	//Chip_Clock_EnablePeriphClock(SYSCON_CLOCK_SDIO);
	LPC_SYSCON->AHBCLKCTRLSET[(uint32_t) 67 >> 5] = 1 << ((uint32_t) 67 & 31);

    /* Software reset */
	LPC_SDIO->BMOD = MCI_BMOD_SWR;

	/* reset all blocks */
	LPC_SDIO->CTRL = MCI_CTRL_RESET | MCI_CTRL_FIFO_RESET | MCI_CTRL_DMA_RESET;
	while (LPC_SDIO->CTRL & (MCI_CTRL_RESET | MCI_CTRL_FIFO_RESET | MCI_CTRL_DMA_RESET)) {}

	/* Power ON the card */
	//Chip_SDIF_PowerOn(LPC_SDMMC);
	LPC_SDIO->PWREN = 1;

	/* Internal DMA setup for control register */
	LPC_SDIO->CTRL = MCI_CTRL_USE_INT_DMAC | MCI_CTRL_INT_ENABLE;
	LPC_SDIO->INTMASK = 0;

	/* Clear the interrupts for the host controller */
	LPC_SDIO->RINTSTS = 0xFFFFFFFF;

	/* Put in max timeout */
	LPC_SDIO->TMOUT = 0xFFFFFFFF;

	/* FIFO threshold settings for DMA, DMA burst of 4,   FIFO watermark at 16 */
	LPC_SDIO->FIFOTH = MCI_FIFOTH_DMA_MTS_4 | MCI_FIFOTH_RX_WM((SD_FIFO_SZ / 2) - 1) | MCI_FIFOTH_TX_WM(SD_FIFO_SZ / 2);

	/* Enable internal DMA, burst size of 4, fixed burst */
	LPC_SDIO->BMOD = MCI_BMOD_DE | MCI_BMOD_PBL4 | MCI_BMOD_DSL(4);

	/* disable clock to CIU (needs latch) */
	LPC_SDIO->CLKENA = 0;
	LPC_SDIO->CLKSRC = 0;

	NVIC->ICER[((uint32_t)(SDIO_IRQn) >> 5)] = (1 << ((uint32_t)(SDIO_IRQn) & 0x1F)); /* disable interrupt */ //NVIC_DisableIRQ(SDIO_IRQn);
	/* Enable SD/MMC Interrupt */
	NVIC->ISER[(uint32_t)((int32_t)SDIO_IRQn) >> 5] = (uint32_t)(1 << ((uint32_t)((int32_t)SDIO_IRQn) & (uint32_t)0x1F)); /* enable interrupt *///NVIC_EnableIRQ(SDIO_IRQn);

	#if !_FS_READONLY
	//GET THIS rtc_initialize();
	#endif

	/* Initialize the Card Data Strucutre */
	hCard = &sdcardinfo;

	/* Reset -- why, it came in here STA_NOINIT*/
	DiskStatus = STA_NOINIT;

	while (LPC_SDIO->CDETECT & 1);

	/* Enumerate the card once detected. Note this function may block for a little while. */
	if (!SDMMC_Acquire(LPC_SDIO, hCard)) {
		printf("Card Acquire failed...\r\n");
		return DiskStatus;
	}

	DiskStatus &= ~STA_NOINIT;
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
	if (DiskStatus & STA_NOINIT) {
		return RES_NOTRDY;
	}

	if (SDMMC_ReadBlocks(LPC_SDIO, buff, sector, count)) {
		return RES_OK;
	}

	return RES_ERROR;
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

	if (DiskStatus & STA_NOINIT) {
		return RES_NOTRDY;
	}

	if ( SDMMC_WriteBlocks(LPC_SDIO, (void *) buff, sector, count)) {
		return RES_OK;
	}

	return RES_ERROR;
}

/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

// GET THISint CardReadyWait(CARD_HANDLE_T *hCrd, int tout)
// GET THIS{
// GET THIS	int32_t curr = (int32_t) LPC_RITIMER->COUNTER;
// GET THIS	int32_t final = curr + ((SystemCoreClock / 1000) * tout);

// GET THIS	if ((final < 0) && (curr > 0)) {
// GET THIS		while (LPC_RITIMER->COUNTER < (uint32_t) final) { if (SDMMC_GetState(LPC_SDIO) != -1) break; }
// GET THIS	}
// GET THIS	else {
// GET THIS		while ((int32_t) LPC_RITIMER->COUNTER < final) { if (SDMMC_GetState(LPC_SDIO) != -1) break; }
// GET THIS	}

// GET THIS	return SDMMC_GetState(LPC_SDIO) != -1;
// GET THIS}

int CardGetState(CARD_HANDLE_T *hCrd, uint8_t *buff)
{
	int state;
	state = SDMMC_GetState(LPC_SDIO);
	if (state == -1) return 0;
	memcpy(buff, &state, sizeof(int));
	return 1;
}


DRESULT disk_ioctl(
    unsigned char ctrl,        /* Control code */
    void *buff        /* Buffer to send/receive control data */
)
{
	DRESULT res;
	unsigned char *ptr = buff;

	if (DiskStatus & STA_NOINIT) {
		return RES_NOTRDY;
	}

	res = RES_ERROR;

	switch (ctrl) {
	case CTRL_SYNC:	/* Make sure that no pending write process */
		delay_ms(50); // GET THIS
		// GET THISif (CardReadyWait(hCard, 50)) {
		// GET THIS	res = RES_OK;
		// GET THIS}
		break;

	case GET_SECTOR_COUNT:	/* Get number of sectors on the disk (unsigned int) */
		*(unsigned int *) buff = hCard->card_info.blocknr;
		res = RES_OK;
		break;

	case GET_SECTOR_SIZE:	/* Get R/W sector size (unsigned short) */
		*(unsigned short *) buff = hCard->card_info.block_len;
		res = RES_OK;
		break;

	case GET_BLOCK_SIZE:/* Get erase block size in unit of sector (unsigned int) */
		*(unsigned int *) buff = 4096;
		res = RES_OK;
		break;

	case MMC_GET_TYPE:		/* Get card type flags (1 byte) */
		*ptr = hCard->card_info.card_type;
		res = RES_OK;
		break;

	case MMC_GET_CSD:		/* Receive CSD as a data block (16 bytes) */
		*((uint32_t *) buff + 0) = hCard->card_info.csd[0];
		*((uint32_t *) buff + 1) = hCard->card_info.csd[1];
		*((uint32_t *) buff + 2) = hCard->card_info.csd[2];
		*((uint32_t *) buff + 3) = hCard->card_info.csd[3];
		res = RES_OK;
		break;

	case MMC_GET_CID:		/* Receive CID as a data block (16 bytes) */
		*((uint32_t *) buff + 0) = hCard->card_info.cid[0];
		*((uint32_t *) buff + 1) = hCard->card_info.cid[1];
		*((uint32_t *) buff + 2) = hCard->card_info.cid[2];
		*((uint32_t *) buff + 3) = hCard->card_info.cid[3];
		res = RES_OK;
		break;

	case MMC_GET_SDSTAT:/* Receive SD status as a data block (64 bytes) */
		if (CardGetState(hCard, (uint8_t *) buff)) {
			res = RES_OK;
		}
	break;

	default:
		res = RES_PARERR;
		break;
	}

	return res;
}

/*---------------------------------------------------------*/
/* User Provided Timer Function for FatFs module           */
/*---------------------------------------------------------*/
/* This is a real time clock service to be called from     */
/* FatFs module. Any valid time must be returned even if   */
/* the system does not support a real time clock.          */

unsigned int get_fattime (void)
{
	#warning GET THIS ConvertRtcTime() 
    //return    ((LPC_RTC->YEAR-1980) << 25)// Year
             //| (LPC_RTC->MONTH << 21)      // Month
             //| (LPC_RTC->DOM << 16)        // Day
             //| (LPC_RTC->HOUR << 11)       // Hour
             //| (LPC_RTC->MIN << 5)         // Min
             //| (LPC_RTC->SEC >> 1)         // Sec
             //;
    return  ((/*YEAR */ 2017 -1980) << 25)// Year
           | (/*MONTH*/ 1 << 21)          // Month
           | (/*DOM  */ 1 << 16)          // Day
           | (/*HOUR */ 1 << 11)          // Hour
           | (/*MIN  */ 1 << 5)           // Min
           | (/*SEC  */ 0 >> 1)           // Sec
           ;

}
