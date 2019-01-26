/*-----------------------------------------------------------------------
/  Low level disk interface modlue include file  R0.04a   (C)ChaN, 2007
/-----------------------------------------------------------------------*/

#ifndef SD_CARD_H




/* Status of Disk Functions */
typedef unsigned char	DSTATUS;

/* Results of Disk Functions */
typedef enum {
	RES_OK = 0,		/* 0: Successful */
	RES_ERROR,		/* 1: R/W Error */
	RES_WRPRT,		/* 2: Write Protected */
	RES_NOTRDY,		/* 3: Not Ready */
	RES_PARERR		/* 4: Invalid Parameter */
} DRESULT;


//unsigned int spi_loop (unsigned int cout);
//void power_on (void);

/*---------------------------------------*/
/* Prototypes for disk control functions */

DSTATUS disk_initialize ();
DSTATUS disk_status ();
DRESULT disk_read (unsigned char*, unsigned int, unsigned char);
DRESULT disk_write (const unsigned char*, unsigned int, unsigned char);
DRESULT disk_ioctl (unsigned char, void*);
//void	disk_timerproc (void);
void	sdcard_init (void);




/* Disk Status Bits (DSTATUS) */

#define STA_NOINIT		0x01	/* Drive not initialized */
#define STA_NODISK		0x02	/* No medium in the drive */
#define STA_PROTECT		0x04	/* Write protected */


/* Command code for disk_ioctrl() */

#define GET_SECTOR_COUNT	1
#define GET_SECTOR_SIZE		2
#define CTRL_SYNC			3
#define CTRL_POWER			4 //na
#define CTRL_LOCK			5 //na
#define CTRL_EJECT			6 //na
#define GET_BLOCK_SIZE	  7	
#define CTRL_ERASE_SECTOR 8	

#define MMC_GET_CSD			10
#define MMC_GET_CID			11
#define MMC_GET_OCR			12
#define MMC_GET_TYPE   13
#define MMC_GET_SDSTAT 14

#define ATA_GET_REV			20
#define ATA_GET_MODEL		21
#define ATA_GET_SN			22

/* MMC card type flags (MMC_GET_TYPE) */
#define CT_MMC		0x01		/* MMC ver 3 */
#define CT_SD1		0x02		/* SD ver 1 */
#define CT_SD2		0x04		/* SD ver 2 */
#define CT_SDC		(CT_SD1|CT_SD2)	/* SD */
#define CT_BLOCK	0x08		/* Block addressing */


#define SD_CARD_H
#endif
