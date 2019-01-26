/**************************************************************************//**
 * $Id: lpc12xx_flash.c 5070 2010-09-29 05:56:16Z cnh20509 $
 *
 * @file     lpc12xx_flash.c
 * @brief    Contains all functions support for FLASH firmware library on LPC12xx.
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
 * modified by Coridium corp, 2011
 ******************************************************************************/
  
/* Peripheral group --------------------------------------------------------- */
/** @addtogroup FLASH
 * @{
 */

/* Includes ----------------------------------------------------------------- */
#include "flash.h"

/** @defgroup FLASH_Private_Macros
  * @{
  */


#define IAP_CLK SystemCoreClock
#define IAP_CLK_KHZ     (IAP_CLK / 1000)

#if defined LPC21xx
 #define IAP_LOCATION	0x7FFFFFF1            // IAP entry point
#elif defined LPC15xx
 #undef IAP_CLK_KHZ
 #define IAP_CLK_KHZ 12000
 #define IAP_LOCATION	0x03000205            // IAP entry point	-- you've got to be kidding
#elif defined LPC54102 || defined LPC54618
 #define IAP_LOCATION	0x03000205            // IAP entry point	
#elif defined LPC4337
 #define IAP_LOCATION	(*(int *)0x10400100)            // IAP entry point -- why not	
#else
 #define IAP_LOCATION	0x1FFF1FF1            // IAP entry point
#endif

#define iap_entry(a, b)     ((void (*)())(IAP_LOCATION))(a, b)

/**
 * @}
 */
 
/** @defgroup FLASH_Private_Variables
  * @{
  */
  
IAP_U32 IAPcommand[5] = {0,0,0,0,0};
IAP_U32 IAPresult[5]  = {0,0,0,0,0};

/**
 * @}
 */
 
/** @defgroup FLASH_Private_Functions
 * @{
 */
 
/**
  * @brief  Prepare sector(s) for erase/write operation.
  *
  * @param  Start: The start sector number.
  * @param  End  : The end sector number.
  *         It should be greater than or equal to start sector number.
  * @retval Status code of this operation, see @ref IAP_Status_Codes.
  *         This parameter can be one of the following values:
  *             @arg IAP_STAT_CMD_SUCCESS
  *             @arg IAP_STAT_INVALID_SECTOR    
  *             @arg IAP_STAT_BUSY  
  *
  * This IAPcommand must be executed before executing "Copy RAM to flash" 
  * or "Erase Sector(s)" IAPcommand.
  */ 
IAP_Status IAP_PrepareSector (IAP_U32 Start,  IAP_U32 End)
{
	IAPcommand[0] = IAP_CMD_PrepareSecor;
	IAPcommand[1] = Start;
	IAPcommand[2] = End;
	IAPcommand[3] = 0;					// don't care for most, 0= Bank A for 43xx parts
	
	iap_entry(IAPcommand, IAPresult);

	return IAPresult[0];
}

/**
  * @brief  Program the flash program.
  *
  * @param  Dst: Destination flash address. Should be a 4 byte boundary.
  * @param  Src: Source RAM address. Should be a word boundary.   
  * @param  Number: Number of byte to be written. Must be a multiple of 4 bytes.
  * @retval Status code of this operation, see @ref IAP_Status_Codes.
  *         This parameter can be one of the following values:  
  *             @arg IAP_STAT_CMD_SUCCESS
  *             @arg IAP_STAT_SRC_ADDR_ERROR
  *             @arg IAP_STAT_DST_ADDR_ERROR
  *             @arg IAP_STAT_SRC_ADDR_NOT_MAPPED
  *             @arg IAP_STAT_DST_ADDR_NOT_MAPPED
  *             @arg IAP_STAT_COUNT_ERROR
  *             @arg IAP_STAT_SECTOR_NOT_PREPARED_FOR_WRITE_OPERATION  
  *             @arg IAP_STAT_BUSY   
  *
  * The affected sectors should be prepared first by calling 
  * "Prepare Sector for Write Operation" IAPcommand. 
  * The boot sector can not be written by this IAPcommand.
  */
IAP_Status IAP_CopyRAMToFlash (IAP_U32 Dst,  IAP_U32 Src, IAP_U32 Number)
{
	IAPcommand[0] = IAP_CMD_CopyRAMToFlash;
	IAPcommand[1] = Dst;
	IAPcommand[2] = Src;
	IAPcommand[3] = Number;
	IAPcommand[4] = IAP_CLK_KHZ;	// Fcclk in KHz
	iap_entry(IAPcommand, IAPresult);

	return IAPresult[0];
}

/**
  * @brief   Erase a sector or multiple sectors of on-chip flash memory..
  *
  * @param  Start: The start sector number.
  * @param  End  : The end sector number.
  *         It should be greater than or equal to start sector number.
  * @retval Status code of this operation, see @ref IAP_Status_Codes.
  *         This parameter can be one of the following values:
  *             @arg IAP_STAT_CMD_SUCCESS
  *             @arg IAP_STAT_INVALID_SECTOR  
  *             @arg IAP_STAT_SECTOR_NOT_PREPARED_FOR_WRITE_OPERATION     
  *             @arg IAP_STAT_BUSY  
  *
  * The boot sector can not be erased by this IAPcommand. To erase a single 
  * sector use the same "Start" and "End" sector numbers.
  */ 
IAP_Status IAP_EraseSector (IAP_U32 Start,  IAP_U32 End)
{
	IAPcommand[0] = IAP_CMD_EraseSecor;
	IAPcommand[1] = Start;
	IAPcommand[2] = End;
#ifdef LPC4337
	IAPcommand[3] = 0;				// don't care for most, 0= Bank A for 43xx parts
#else	
	IAPcommand[3] = IAP_CLK_KHZ;    // IAP_CLK / 1000;
#endif	
	
//printf("erase %x %x %x %x %x \n",IAPcommand[0],IAPcommand[1],IAPcommand[2],IAPcommand[3],IAPcommand[4]);
//int i;
//for (i=0;i<100;i++) {delay_us(20000);delay_us(20000);delay_us(20000);}

	disableIRQ();
	iap_entry(IAPcommand, IAPresult);
	enableIRQ();

//printf("we are back");

	return IAPresult[0];
}

#ifndef FOR_BASIC

/**
  * @brief  Blank check a sector or multiple sectors of on-chip flash memory.
  *
  * @param  Start: The start sector number.
  * @param  End  : The end sector number.
  *         It should be greater than or equal to start sector number.
  * @param  NonBlank: Pointer to buffer which contains the offset of the first 
  *         non blank word location if the Status Code is SECTOR_NOT_BLANK and 
  *         Contents of non blank word location.
  * @retval Status code of this operation, see @ref IAP_Status_Codes.
  *         This parameter can be one of the following values:
  *             @arg IAP_STAT_CMD_SUCCESS
  *             @arg IAP_STAT_INVALID_SECTOR  
  *             @arg IAP_STAT_SECTOR_NOT_BLANK     
  *             @arg IAP_STAT_BUSY  
  *
  * The boot sector can not be erased by this IAPcommand. To erase a single 
  * sector use the same "Start" and "End" sector numbers.
  */
IAP_Status IAP_BlankCheckSecor (IAP_U32 Start,  IAP_U32 End, IAP_U32 * NonBlank)
{
	IAPcommand[0] = IAP_CMD_BlankCheckSecor;
	IAPcommand[1] = Start;
	IAPcommand[2] = End;

	iap_entry(IAPcommand, IAPresult);

	if (IAPresult[0] == IAP_STAT_SECTOR_NOT_BLANK)
	{
		*NonBlank = IAPresult[1];
		*(NonBlank+1) = IAPresult[2];
	}

	return IAPresult[0];
}

/**
  * @brief  Read the part identification number.
  *
  * @param  PartID: Pointer to one-word Part Identification Number
  * @retval Status code of this operation, see @ref IAP_Status_Codes.
  *         This parameter can be one of the following values:
  *             @arg IAP_STAT_CMD_SUCCESS 
  */
IAP_Status IAP_ReadParID (IAP_U32 * PartID)
{

	IAPcommand[0] = IAP_CMD_ReadPartID;
	iap_entry(IAPcommand, IAPresult);
	*PartID = IAPresult[1];

	return IAPresult[0];
}

/**
  * @brief  Read  the boot code version number.
  *
  * @param  Version: Pointer to one-word boot code version number in ASCII format. 
  *         It is to be interpreted as <byte1(Major)>.<byte0(Minor)>.
  * @retval Status code of this operation, see @ref IAP_Status_Codes.
  *         This parameter can be one of the following values:
  *             @arg IAP_STAT_CMD_SUCCESS 
  */
IAP_Status IAP_ReadBootVersion (IAP_U32 *Version)
{
	IAPcommand[0] = IAP_CMD_ReadBootVersion;
	iap_entry(IAPcommand, IAPresult);
    *Version = IAPresult[1] & 0xFFFF;

	return IAPresult[0];
}

/**
  * @brief  Compare the memory contents at two locations.
  *
  * @param  Dst: Starting flash or RAM address of data bytes to be compared. 
  *         This address should be a word boundary.
  * @param  Src: Starting flash or RAM address of data bytes to be compared. 
  *         This address should be a word boundary.
  * @param  Number: Number of bytes to be compared; should be a multiple of 4.
  * @param  Offset: Pointer to one-word offset of the first mismatch if the Status Code 
  *         is COMPARE_ERROR.
  * @retval Status code of this operation, see @ref IAP_Status_Codes.
  *         This parameter can be one of the following values:
  *             @arg IAP_STAT_CMD_SUCCESS
  *             @arg IAP_STAT_COMPARE_ERROR
  *             @arg IAP_STAT_COUNT_ERROR
  *             @arg IAP_STAT_SRC_ADDR_NOT_MAPPED
  *             @arg IAP_STAT_DST_ADDR_NOT_MAPPED
  *             @arg IAP_STAT_SRC_ADDR_NOT_MAPPED
  *             @arg IAP_STAT_DST_ADDR_NOT_MAPPED 
  *
  * The IAPresult may not be correct when the source or destination includes any 
  * of the first 512 bytes starting from address zero. The first 512 bytes can 
  * be re-mapped to RAM.
  */
IAP_Status IAP_Compare (IAP_U32 Dst,  IAP_U32 Src, IAP_U32 Number, IAP_U32 *Offset)
{
	IAPcommand[0] = IAP_CMD_Compare;
	IAPcommand[1] = Dst;
	IAPcommand[2] = Src;
	IAPcommand[3] = Number;
	iap_entry(IAPcommand, IAPresult);

	if (IAPresult[0] == IAP_STAT_COMPARE_ERROR)
		*Offset = IAPresult[1];

	return IAPresult[0];
}

/**
  * @brief  Invoke the bootloader in ISP mode.
  *
  * @param  None
  * @retval None 
  */
void  IAP_ReinvokeISP(void)
{
	IAPcommand[0] = IAP_CMD_ReinvokeISP;					
	iap_entry(IAPcommand, IAPresult);	
}

/**
  * @brief  Read the unique ID.
  *
  * @param  UID: Pointer to a 4-word unique ID.
  * @retval Status code of this operation, see @ref IAP_Status_Codes.
  *         This parameter can be one of the following values:
  *             @arg IAP_STAT_CMD_SUCCESS 
  */
IAP_Status IAP_ReadUID (IAP_U32 * UID)
{
    IAPcommand[0] = IAP_CMD_ReadUID;
    iap_entry(IAPcommand, IAPresult);	

    *(UID + 0) = IAPresult[1];
    *(UID + 1) = IAPresult[2];
    *(UID + 2) = IAPresult[3];
    *(UID + 3) = IAPresult[4];

    return IAPresult[0];
}

/**
  * @brief  Erase page(s).
  *
  * @param  Start: The start page number.
  * @param  End  : The end page number.
  *         It should be greater than or equal to start sector number.
  * @retval Status code of this operation, see @ref IAP_Status_Codes.
  *         This parameter can be one of the following values:
  *             @arg IAP_STAT_CMD_SUCCESS
  *             @arg IAP_STAT_INVALID_SECTOR  
  *             @arg IAP_STAT_SECTOR_NOT_PREPARED_FOR_WRITE_OPERATION     
  *             @arg IAP_STAT_BUSY  
  *
  * To erase a single page use the same "Start" and "End" sector numbers.
  */ 
IAP_Status IAP_ErasePage (IAP_U32 Start,  IAP_U32 End)
{
	IAPcommand[0] = IAP_CMD_ErasePage;
	IAPcommand[1] = Start;
	IAPcommand[2] = End;
	IAPcommand[3] = IAP_CLK_KHZ;   // IAP_CLK / 1000;
	iap_entry(IAPcommand, IAPresult);

	return IAPresult[0];
}

/**
  * @brief  Erase a page or multiple pages of the information block. .
  *
  * @param  Start: The start page number.
  * @param  End  : The end page number.
  *         It should be greater than or equal to start sector number.
  * @retval Status code of this operation, see @ref IAP_Status_Codes.
  *         This parameter can be one of the following values:
  *             @arg IAP_STAT_CMD_SUCCESS
  *             @arg IAP_STAT_INVALID_SECTOR  
  *             @arg IAP_STAT_SECTOR_NOT_PREPARED_FOR_WRITE_OPERATION     
  *             @arg IAP_STAT_BUSY  
  *
  * To erase a single page use the same "Start" and "End" sector numbers.
  */ 
IAP_Status IAP_EraseInfoPage (IAP_U32 Start,  IAP_U32 End)
{
	IAPcommand[0] = IAP_CMD_EraseInfoPage;
	IAPcommand[1] = Start;
	IAPcommand[2] = End;
	IAPcommand[3] = IAP_CLK_KHZ;   // IAP_CLK / 1000;
	iap_entry(IAPcommand, IAPresult);

	return IAPresult[0];
}

/**
 * @}
 */
 
#endif // FOR_BASIC 

////////////////////////////////////////////////////////////////////////////////////////
//
// Coridium flash interface

// the following variable is used by WriteFlash to determine if the sector needs to be erased
// if you are writing linearly through the sector, it should be left alone
// if you are re-writing the sector then set this to -1
int sector_erased = -1;

#if defined LPC824 || defined LPC802 || defined LPC812 || defined LPC15xx

int WriteFlash (unsigned int flash_addr, unsigned int data_addr, unsigned int blksize)
{
	char sector;
	volatile int a;
	unsigned int NVIC_Save;
	int result;
	
  #ifdef LPC_EE_BASE	
	if (flash_addr >= LPC_EE_BASE) {		// write to EEPROM
		IAPcommand[0] = 61;
		IAPcommand[1] = flash_addr - LPC_EE_BASE;
		IAPcommand[2] = data_addr;
		IAPcommand[3] = blksize;
		IAPcommand[4] = IAP_CLK_KHZ;   		// IAP_CLK / 1000;
		iap_entry(IAPcommand, IAPresult);

		return IAPresult[0];
	}
  #endif
	
  #ifdef LPC1349
  	*(int *) 0x40074384 = 0xC0DE0400;	// secret sauce -- turn off autoclock on FMC
  	*(int *) 0x40074380 = 0x00000000;	// works 0 at 12 MHz
  	*(int *) 0x4007438c = 0x00000000;	// works 0 at 12 MHz
  #endif		

	sector = COMPUTE_FLASH_SECTOR(flash_addr);
  	
	NVIC_Save = NVIC->ISER[0]; //save current interrupt sources
	NVIC->ICER[0] = 0xFFFFFFFF;//clear interrupt sources
	SysTick->CTRL  = 0;        //disable SysTick
	result = 0;
	if( flash_addr & 1);									// user says do nothing
	else if((sector != sector_erased) || (flash_addr & 2)){	// bit 1 forces erase
//	if( sector != sector_erased){
		result = IAP_PrepareSector (sector,  sector);
		if (result) result = 0x82000000 + result;				// was -2
		else{
			for(a=0;a<60000;a++); // 50 ms delay
			result = IAP_EraseSector (sector,  sector);
			if (result) result = 0x83000000 + result;			// was -3
			for(a=0;a<60000;a++); // 50 ms delay
		}
	}
	
	sector_erased = sector;

	if(result == 0){
		result = IAP_PrepareSector (sector,  sector);
		if (result) result = 0x84000000 + result;				// was -4
		else{
			for(a=0;a<60000;a++); // 50 ms delay
			result = IAP_CopyRAMToFlash (flash_addr & (~3),  data_addr, blksize);
			if (result) result = 0x85000000 + result;			// was -5
		}
	}
	
	SysTick->CTRL  = 4 | 2 | 1; //enable SysTick CLKSOURCE=CPU clock | TICKINT | ENABLE
	NVIC->ISER[0] = NVIC_Save;  //restore interrupt sources
	
	return result;
}

#elif defined LPC4330 || defined LPC1850

 #if defined CORE_M4 || defined CORE_M3

void spifi_enter_memory_mode(void) {
  #ifdef CORE_M4	
	SCnSCB->ACTLR &= ~2; // disable Cortex write buffer to avoid exceptions when switching back to SPIFI for execution
  #endif
	
	LPC_SPIFI->STAT = 0x10;	// reset memory mode
	while(LPC_SPIFI->STAT & 0x10);	// wait for reset to complete

	LPC_SPIFI->CTRL = // set up new CTRL register with high speed options
		(0x100 << 0) | // timeout
		(0x1 << 16) | // cs high, this parameter is dependent on the SPI Flash part and is in SPIFI_CLK cycles. A lower cs high performs faster
		(1 << 29) | // receive full clock (rfclk) - allows for higher speeds
		(1 << 30); // feedback clock (fbclk) - allows for higher speeds
	
	// put part in high speed mode (skipping opcodes)
	LPC_SPIFI->DATINTM = 0xa5; // 0xAx will cause part to use high performace reads (skips opcode on subsequent accesses)
	LPC_SPIFI->CMD =
		(0xebul << 24) | // opcode 0xeb Quad IO High Performance Read for Spansion
		(0x4 << 21) | // frame form indicating opcode and 3 address bytes
		(0x2 << 19) | // field form indicating serial opcode and dual/quad other fields
		(0x3 << 16); // 3 intermediate data bytes
	while(LPC_SPIFI->STAT & 2); // wait for command to complete

	LPC_SPIFI->MEMCMD =
		(0xebul << 24) | // opcode 0xeb Quad IO High Performance Read for Spansion
		(0x6 << 21) | // frame form indicating no opcode and 3 address bytes
		(0x2 << 19) | // field form indicating serial opcode and dual/quad other fields
		(0x3 << 16); // 3 intermediate data bytes
	
  #ifdef CORE_M4	
	SCnSCB->ACTLR |= 2; // reenable Cortex write buffer
  #endif
}

void spifi_exit_memory_mode(void) {
	LPC_SPIFI->STAT = 0x10;	// reset memory mode
	while(LPC_SPIFI->STAT & 0x10);	// wait for reset to complete

	LPC_SPIFI->ADDR = 0xffffffff;
	LPC_SPIFI->DATINTM = 0xffffffff;
	LPC_SPIFI->CMD = // send all ones for a while to hopefully reset SPI Flash
		(0xfful << 24) | // opcode 0xff
		(0x5 << 21) | // frame form indicating opcode and 4 address bytes
		(0x0 << 19) | // field form indicating all serial fields
		(0x4 << 16); // 3 intermediate data bytes
	while(LPC_SPIFI->STAT & 2); // wait for command to complete
}

void spifi_update_const(int address, int * copy) {
	int aligned_address = address & ~(0xfff);
	int offset = (address & 0xfff)>>2;
	int i, j;

	LPC_SPIFI->DATINTM = 0x0; // next read command will remove high performance mode
	LPC_SPIFI->ADDR = aligned_address;

	LPC_SPIFI->CMD =
		(0x06ul << 24) | // opcode 0x06 Write Enable for Spansion
		(0x1 << 21) | // frame form indicating opcode only
		(0x0 << 19); // field form indicating all serial
	while(LPC_SPIFI->STAT & 2); // wait for command to complete
	LPC_SPIFI->CMD =
		(0x20 << 24) | // opcode 0x20 Sector Erase for Spansion
		(0x4 << 21) | // frame form indicating opcode and 3 address bytes
		(0x0 << 19); // field form indicating all serial
	while(LPC_SPIFI->STAT & 2); // wait for command to complete
	LPC_SPIFI->CMD =
		(0x05ul << 24) | // opcode 0x05 Read Status for Spansion
		(0x1 << 21) | // frame form indicating opcode only
		(0x0 << 19) | // field form indicating all serial
		(0x1 << 14) | // POLLRS polling command
		(0x0 << 2) | // check bit 0
		(0x0 << 0); // wait till 0
	while(LPC_SPIFI->STAT & 2); // wait for command to complete
	*(volatile char*)&LPC_SPIFI->DAT;
	
	for(j = 0; j < 1024; j += 64) {
		LPC_SPIFI->CMD =
			(0x06ul << 24) | // opcode 0x06 Write Enable for Spansion
			(0x1 << 21) | // frame form indicating opcode only
			(0x0 << 19); // field form indicating all serial
		while(LPC_SPIFI->STAT & 2); // wait for command to complete
#if 0		
		LPC_SPIFI->CMD =
			(0x32ul << 24) | // opcode 0x32 Quad Page Programming for Spansion
			(0x4 << 21) | // frame form indicating opcode and 3 address bytes
			(0x1 << 19) | // field form indicating quad data field, others serial
			(0x0 << 16) | // 0 intermediate data bytes
			(0x1 << 15) | // dout indicates that it is a write
			(256); // datalen
#elif defined QUAD_WRITE		
		LPC_SPIFI->CMD =
			(0x32ul << 24) | // opcode 0x32 Quad Page Programming for Spansion
			(0x4 << 21) | 	// frame form indicating opcode and 3 address bytes
			(0x1 << 19) | 	// field form indicating quad data field, others serial
			(0x0 << 16) | 	// 0 intermediate data bytes
			(0x1 << 15) | 	// dout indicates that it is a write
			(256); 					// datalen
#else	// SPI Serial WRITE
		LPC_SPIFI->CMD =
			(0x02ul << 24) | // opcode 0x02 Page Programming for Spansion
			(0x4 << 21) | 	// frame form indicating opcode and 3 address bytes
			(0x0 << 19) |		// field form indicating all serial
			(0x0 << 16) | 	// 0 intermediate data bytes
			(0x1 << 15) | 	// dout indicates that it is a write
			(256); 					// datalen
#endif		

		for(i = 0; i < 64; i++) {
			if (j+i >= offset) {
				*(volatile int*)&LPC_SPIFI->DAT = copy[j + i - offset];
			} else {
				*(volatile int*)&LPC_SPIFI->DAT = 0;
			}
		}
		while(LPC_SPIFI->STAT & 2); // wait for command to complete
		LPC_SPIFI->CMD =
			(0x05ul << 24) | // opcode 0x05 Read Status for Spansion
			(0x1 << 21) | // frame form indicating opcode only
			(0x0 << 19) | // field form indicating all serial
			(0x1 << 14) | // POLLRS polling command
			(0x0 << 2) | // check bit 0
			(0x0 << 0); // wait till 0
		while(LPC_SPIFI->STAT & 2); // wait for command to complete
		*(volatile char*)&LPC_SPIFI->DAT;
		LPC_SPIFI->ADDR += 256;
	}
}

#ifdef FOR_BASIC
extern void * MEMCPY(void *dst0, void *src0, int len0);
#else
void * MEMCPY(void *dst0, void *src0, int len0)
{
  char *dst = (char *) dst0;
  char *src = (char *) src0;

  void * save = dst0;

  while (len0--)
    {
      *dst++ = *src++;
    }

  return save;
}
#endif

int WriteFlash (unsigned int flash_addr, unsigned int data_addr, unsigned int blksize)
{
	if ((flash_addr & 0x000FFFFF) <= 0x18000) {
		MEMCPY((void *)((flash_addr & 0x0001FFFF) + M4_CODE_RAM),(void *) data_addr, blksize);		// copy into the working RAM image for M4
	} else if (((flash_addr & 0x000FFFFF) >= 0x20000) && ((flash_addr & 0x000FFFFF) <= 0x30000)) {
		MEMCPY((void *)((flash_addr & 0x0000FFFF) + M0_CODE_RAM),(void *) data_addr, blksize);		// copy into the working RAM image M0
	} else if (((flash_addr & 0x000FFFFF) >= 0x30000) && ((flash_addr & 0x000FFFFF) <= 0x40000)) {
		MEMCPY((void *)((flash_addr & 0x00003FFF) + IOH_CODE_RAM),(void *) data_addr, blksize);		// copy into the working RAM image for IOH
	}
	
	spifi_exit_memory_mode();
	spifi_update_const(flash_addr, (int *) data_addr);
#warning not handling different block sizes yet	
	spifi_enter_memory_mode();
	
	__ASM ("	nop");			// allows me to start on a WORD boundary
	return 0;		// assume it works for now
}


  #if defined ( __CC_ARM   ) 		// Keil Realview

__ASM int whereAmI(void) {
	
	IMPORT	g_var_seg
	
	mov	r0,pc
	bx	lr
}

  #else
int whereAmI(void) {
	__ASM("	mov r0,pc");
	__ASM("	bx	lr");
	return 0;			// fake out the compiler
	__ASM(" ALIGN 4");
} 
  #endif
 
void CopyRAMtoSPIFI(void) {		// used to program over ISP serial
	unsigned int i, base;
	
	LPC_CGU->BASE_SPIFI0_CLK  = 1<<24;
	
	LPC_CCU1->CLK_SPIFI_CFG = 1;	
	LPC_CCU1->CLK_M4_SPIFI_CFG = 1;	
	
	LPC_SCU->SFSP3_3 = 0xf3;		// set high speed drive rate -- someday use a fast clock 
	LPC_SCU->SFSP3_4 = 0xd3;	
	LPC_SCU->SFSP3_5 = 0xd3;	
	LPC_SCU->SFSP3_6 = 0xd3;	
	LPC_SCU->SFSP3_7 = 0xd3;	
	LPC_SCU->SFSP3_8 = 0xd3;	
	
	spifi_exit_memory_mode();
	
	base = whereAmI() & 0xFFFFC000;
	
#ifdef SPIFI_LOAD	
	for (i=0; i<0x8000; i+= 0x1000) 
		spifi_update_const(0x14000000+i, (int *)(0x20000000+i));		// for SPIFI bases loadLPC
#else
	for (i=0; i<0x8000; i+= 0x1000) 
		spifi_update_const(M4_FIRMWARE+i, (int *)(base+i));
		
	for (i=0; i<0x4000; i+= 0x1000) 
		spifi_update_const(M0_FIRMWARE+i,  (int *)(base + 0x8000+i));
	for (i=0; i<0x2000; i+= 0x1000) 
		spifi_update_const(IOH_FIRMWARE+i, (int *)(base + 0xC000+i));
#endif		
	
	spifi_enter_memory_mode();

#ifdef USE_WIGGLE
	while(1) wiggle(5);
#else			
	while(1);
#endif
}	

 #else
// dummy routines not supported for M0 in 4330 
int WriteFlash (unsigned int flash_addr, unsigned int data_addr, unsigned int blksize) {}
void CopyRAMtoSPIFI(void) {}
 #endif

#else

int WriteFlash (unsigned int flash_addr, unsigned int data_addr, unsigned int blksize)
{
	char sector, result;
#ifdef NVIC	
	unsigned int NVIC_Save;
#endif
#ifdef SysTick
	unsigned int Systic_Save;
#endif

	result = 0;
	
#ifdef NVIC	
	NVIC_Save = NVIC->ISER[0]; //save current interrupt sources
	NVIC->ICER[0] = 0xFFFFFFFF;//clear interrupt sources
#endif
#ifdef SysTick
	Systic_Save = SysTick->CTRL;
	SysTick->CTRL  = 0;        //disable SysTick
#endif
	
	sector = COMPUTE_FLASH_SECTOR(flash_addr);
	
	if( flash_addr & 1);									// user says do nothing
	else if((sector != sector_erased) || (flash_addr & 2)){	// bit 1 forces erase
		result = IAP_PrepareSector (sector,  sector);
//printf("%x 1result\n",result); 
		if (result == 0) {
			result = IAP_EraseSector (sector,  sector);
		}
	}
	sector_erased = sector;

//printf("%x flash addr\n",flash_addr); 
	
	if (result == 0) {
		result = IAP_PrepareSector (sector,  sector);
//printf("%x flash addr %x %x %x\n",flash_addr,sector,data_addr,blksize); 
		if (result == 0) {
#ifdef FLASHMAP_4337
			result = IAP_CopyRAMToFlash ((0x1a000000 + flash_addr) & (~3),  data_addr, blksize);
#else		
			result = IAP_CopyRAMToFlash (flash_addr & (~3),  data_addr, blksize);
#endif
		}
	}
	
//printf("%x result\n",result); 
#ifdef SysTick
	SysTick->CTRL = Systic_Save; 		//re-enable SysTick if it was in use CLKSOURCE=CPU clock | TICKINT | ENABLE
#endif
#ifdef NVIC	
	NVIC->ISER[0] = NVIC_Save;  //restore interrupt sources
#endif
	
	return result;
}

#endif
/**
 * @}
 */

/* --------------------------------- End Of File ------------------------------ */
