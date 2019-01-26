/*
 * @brief LPC5460x SD/SDIO driver
 *
 * @note
 * Copyright(C) NXP Semiconductors, 2012
 * All rights reserved.
 *
 * @par
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * LPC products.  This software is supplied "AS IS" without any warranties of
 * any kind, and NXP Semiconductors and its licensor disclaim any and
 * all warranties, express or implied, including all implied warranties of
 * merchantability, fitness for a particular purpose and non-infringement of
 * intellectual property rights.  NXP Semiconductors assumes no responsibility
 * or liability for the use of the software, conveys no license or rights under any
 * patent, copyright, mask work right, or any other intellectual property rights in
 * or to any products. NXP Semiconductors reserves the right to make changes
 * in the software without notification. NXP Semiconductors also makes no
 * representation or warranty that such application will be suitable for the
 * specified use without further testing or modification.
 *
 * @par
 * Permission to use, copy, modify, and distribute this software and its
 * documentation is hereby granted, under NXP Semiconductors' and its
 * licensor's relevant copyrights in the software, without fee, provided that it
 * is used in conjunction with NXP Semiconductors microcontrollers.  This
 * copyright, permission, and disclaimer notice must appear in all copies of
 * this code.
 */

#ifndef __SDIF_5460X_H_
#define __SDIF_5460X_H_

#ifdef __cplusplus
extern "C" {
#endif

/** @defgroup SDIF_5460X CHIP: LPC5460x SD/SDIO driver
 * @ingroup CHIP_5460X_Drivers
 * @{
 */


/** @brief  SDIO DMA descriptor control (des0) register defines
 */
#define MCI_DMADES0_OWN         (1UL << 31)		/*!< DMA owns descriptor bit */
#define MCI_DMADES0_CES         (1 << 30)		/*!< Card Error Summary bit */
#define MCI_DMADES0_ER          (1 << 5)		/*!< End of descriptopr ring bit */
#define MCI_DMADES0_CH          (1 << 4)		/*!< Second address chained bit */
#define MCI_DMADES0_FS          (1 << 3)		/*!< First descriptor bit */
#define MCI_DMADES0_LD          (1 << 2)		/*!< Last descriptor bit */
#define MCI_DMADES0_DIC         (1 << 1)		/*!< Disable interrupt on completion bit */

/** @brief  SDIO DMA descriptor size (des1) register defines
 */
#define MCI_DMADES1_BS1(x)      (x)				/*!< Size of buffer 1 */
#define MCI_DMADES1_BS2(x)      ((x) << 13)		/*!< Size of buffer 2 */
#define MCI_DMADES1_MAXTR       4096			/*!< Max transfer size per buffer */

/** @brief  SDIO control register defines
 */
#define MCI_CTRL_USE_INT_DMAC   (1 << 25)		/*!< Use internal DMA */
#define MCI_CTRL_CARDV_MASK     (0x7 << 16)		/*!< SD_VOLT[2:0} pins output state mask */
#define MCI_CTRL_CEATA_INT_EN   (1 << 11)		/*!< Enable CE-ATA interrupts */
#define MCI_CTRL_SEND_AS_CCSD   (1 << 10)		/*!< Send auto-stop */
#define MCI_CTRL_SEND_CCSD      (1 << 9)		/*!< Send CCSD */
#define MCI_CTRL_ABRT_READ_DATA (1 << 8)		/*!< Abort read data */
#define MCI_CTRL_SEND_IRQ_RESP  (1 << 7)		/*!< Send auto-IRQ response */
#define MCI_CTRL_READ_WAIT      (1 << 6)		/*!< Assert read-wait for SDIO */
#define MCI_CTRL_INT_ENABLE     (1 << 4)		/*!< Global interrupt enable */
#define MCI_CTRL_DMA_RESET      (1 << 2)		/*!< Reset internal DMA */
#define MCI_CTRL_FIFO_RESET     (1 << 1)		/*!< Reset data FIFO pointers */
#define MCI_CTRL_RESET          (1 << 0)		/*!< Reset controller */

/** @brief SDIO Power Enable register defines
 */
#define MCI_POWER_ENABLE        0x1				/*!< Enable slot power signal (SD_POW) */

/** @brief SDIO Clock divider register defines
 */
#define MCI_CLOCK_DIVIDER(dn, d2) ((d2) << ((dn) * 8))	/*!< Set cklock divider */

/** @brief SDIO Clock source register defines
 */
#define MCI_CLKSRC_CLKDIV0      0
#define MCI_CLKSRC_CLKDIV1      1
#define MCI_CLKSRC_CLKDIV2      2
#define MCI_CLKSRC_CLKDIV3      3
#define MCI_CLK_SOURCE(clksrc)  (clksrc)		/*!< Set cklock divider source */

/** @brief SDIO Clock Enable register defines
 */
#define MCI_CLKEN_LOW_PWR       (1 << 16)		/*!< Enable clock idle for slot */
#define MCI_CLKEN_ENABLE        (1 << 0)		/*!< Enable slot clock */

/** @brief SDIO time-out register defines
 */
#define MCI_TMOUT_DATA(clks)    ((clks) << 8)	/*!< Data timeout clocks */
#define MCI_TMOUT_DATA_MSK      0xFFFFFF00
#define MCI_TMOUT_RESP(clks)    ((clks) & 0xFF)	/*!< Response timeout clocks */
#define MCI_TMOUT_RESP_MSK      0xFF

/** @brief SDIO card-type register defines
 */
#define MCI_CTYPE_8BIT          (1 << 16)		/*!< Enable 4-bit mode */
#define MCI_CTYPE_4BIT          (1 << 0)		/*!< Enable 8-bit mode */

/** @brief SDIO Interrupt status & mask register defines
 */
#define MCI_INT_SDIO            (1 << 16)		/*!< SDIO interrupt */
#define MCI_INT_EBE             (1 << 15)		/*!< End-bit error */
#define MCI_INT_ACD             (1 << 14)		/*!< Auto command done */
#define MCI_INT_SBE             (1 << 13)		/*!< Start bit error */
#define MCI_INT_HLE             (1 << 12)		/*!< Hardware locked error */
#define MCI_INT_FRUN            (1 << 11)		/*!< FIFO overrun/underrun error */
#define MCI_INT_HTO             (1 << 10)		/*!< Host data starvation error */
#define MCI_INT_DTO             (1 << 9)		/*!< Data timeout error */
#define MCI_INT_RTO             (1 << 8)		/*!< Response timeout error */
#define MCI_INT_DCRC            (1 << 7)		/*!< Data CRC error */
#define MCI_INT_RCRC            (1 << 6)		/*!< Response CRC error */
#define MCI_INT_RXDR            (1 << 5)		/*!< RX data ready */
#define MCI_INT_TXDR            (1 << 4)		/*!< TX data needed */
#define MCI_INT_DATA_OVER       (1 << 3)		/*!< Data transfer over */
#define MCI_INT_CMD_DONE        (1 << 2)		/*!< Command done */
#define MCI_INT_RESP_ERR        (1 << 1)		/*!< Command response error */
#define MCI_INT_CD              (1 << 0)		/*!< Card detect */

/** @brief SDIO Command register defines
 */
#define MCI_CMD_START           (1UL << 31)		/*!< Start command */
#define MCI_CMD_USE_HOLD_REG    (1UL << 29)     /*!< Use command hold register */
#define MCI_CMD_VOLT_SWITCH     (1 << 28)		/*!< Voltage switch bit */
#define MCI_CMD_BOOT_MODE       (1 << 27)		/*!< Boot mode */
#define MCI_CMD_DISABLE_BOOT    (1 << 26)		/*!< Disable boot */
#define MCI_CMD_EXPECT_BOOT_ACK (1 << 25)		/*!< Expect boot ack */
#define MCI_CMD_ENABLE_BOOT     (1 << 24)		/*!< Enable boot */
#define MCI_CMD_CCS_EXP         (1 << 23)		/*!< CCS expected */
#define MCI_CMD_CEATA_RD        (1 << 22)		/*!< CE-ATA read in progress */
#define MCI_CMD_UPD_CLK         (1 << 21)		/*!< Update clock register only */
#define MCI_CMD_INIT            (1 << 15)		/*!< Send init sequence */
#define MCI_CMD_STOP            (1 << 14)		/*!< Stop/abort command */
#define MCI_CMD_PRV_DAT_WAIT    (1 << 13)		/*!< Wait before send */
#define MCI_CMD_SEND_STOP       (1 << 12)		/*!< Send auto-stop */
#define MCI_CMD_STRM_MODE       (1 << 11)		/*!< Stream transfer mode */
#define MCI_CMD_DAT_WR          (1 << 10)		/*!< Read(0)/Write(1) selection */
#define MCI_CMD_DAT_EXP         (1 << 9)		/*!< Data expected */
#define MCI_CMD_RESP_CRC        (1 << 8)		/*!< Check response CRC */
#define MCI_CMD_RESP_LONG       (1 << 7)		/*!< Response length */
#define MCI_CMD_RESP_EXP        (1 << 6)		/*!< Response expected */
#define MCI_CMD_INDX(n)         ((n) & 0x1F)

/** @brief SDIO status register definess
 */
#define MCI_STS_GET_FCNT(x)     (((x) >> 17) & 0x1FF)

/** @brief SDIO FIFO threshold defines
 */
#define MCI_FIFOTH_TX_WM(x)     ((x) & 0xFFF)
#define MCI_FIFOTH_RX_WM(x)     (((x) & 0xFFF) << 16)
#define MCI_FIFOTH_DMA_MTS_1    (0UL << 28)
#define MCI_FIFOTH_DMA_MTS_4    (1UL << 28)
#define MCI_FIFOTH_DMA_MTS_8    (2UL << 28)
#define MCI_FIFOTH_DMA_MTS_16   (3UL << 28)
#define MCI_FIFOTH_DMA_MTS_32   (4UL << 28)
#define MCI_FIFOTH_DMA_MTS_64   (5UL << 28)
#define MCI_FIFOTH_DMA_MTS_128  (6UL << 28)
#define MCI_FIFOTH_DMA_MTS_256  (7UL << 28)

/** @brief Bus mode register defines
 */
#define MCI_BMOD_PBL1           (0 << 8)		/*!< Burst length = 1 */
#define MCI_BMOD_PBL4           (1 << 8)		/*!< Burst length = 4 */
#define MCI_BMOD_PBL8           (2 << 8)		/*!< Burst length = 8 */
#define MCI_BMOD_PBL16          (3 << 8)		/*!< Burst length = 16 */
#define MCI_BMOD_PBL32          (4 << 8)		/*!< Burst length = 32 */
#define MCI_BMOD_PBL64          (5 << 8)		/*!< Burst length = 64 */
#define MCI_BMOD_PBL128         (6 << 8)		/*!< Burst length = 128 */
#define MCI_BMOD_PBL256         (7 << 8)		/*!< Burst length = 256 */
#define MCI_BMOD_DE             (1 << 7)		/*!< Enable internal DMAC */
#define MCI_BMOD_DSL(len)       ((len) << 2)	/*!< Descriptor skip length */
#define MCI_BMOD_FB             (1 << 1)		/*!< Fixed bursts */
#define MCI_BMOD_SWR            (1 << 0)		/*!< Software reset of internal registers */

/** @brief Commonly used definitions
 */
#define SD_FIFO_SZ              32				/*!< Size of SDIO FIFOs (32-bit wide) */

/** Function prototype for SD interface IRQ callback */
typedef uint32_t (*MCI_IRQ_CB_FUNC_T)(uint32_t);

/** Function prototype for SD detect and write protect status check */
typedef int32_t (*PSCHECK_FUNC_T)(void);

/** Function prototype for SD slot power enable or slot reset */
typedef void (*PS_POWER_FUNC_T)(int32_t enable);

/** @brief  SDIO chained DMA descriptor
 */
typedef struct {
	volatile uint32_t des0;						/*!< Control and status */
	volatile uint32_t des1;						/*!< Buffer size(s) */
	volatile uint32_t des2;						/*!< Buffer address pointer 1 */
	volatile uint32_t des3;						/*!< Buffer address pointer 2 */
} pSDMMC_DMA_T;

/** @brief  SDIO device type
 */
typedef struct _sdif_device {
	/* MCI_IRQ_CB_FUNC_T irq_cb; */
	pSDMMC_DMA_T mci_dma_dd[1 + (0x10000 / MCI_DMADES1_MAXTR)];
	/* uint32_t sdio_clk_rate; */
	/* uint32_t sdif_slot_clk_rate; */
	/* int32_t clock_enabled; */
} sdif_device;

/** @brief Setup options for the SDIO driver
 */
#define US_TIMEOUT            1000000		/*!< give 1 atleast 1 sec for the card to respond */
#define MS_ACQUIRE_DELAY      (10)			/*!< inter-command acquire oper condition delay in msec*/
#define INIT_OP_RETRIES       50			/*!< initial OP_COND retries */
#define SET_OP_RETRIES        1000			/*!< set OP_COND retries */
#define SDIO_BUS_WIDTH        4				/*!< Max bus width supported */
#define SD_MMC_ENUM_CLOCK       400000		/*!< Typical enumeration clock rate */
#define MMC_MAX_CLOCK           20000000	/*!< Max MMC clock rate */
#define MMC_LOW_BUS_MAX_CLOCK   26000000	/*!< Type 0 MMC card max clock rate */
#define MMC_HIGH_BUS_MAX_CLOCK  52000000	/*!< Type 1 MMC card max clock rate */
#define SD_MAX_CLOCK            25000000	/*!< Max SD clock rate */

////////////////////////// HERE DOWN //////////////////////////

/** @defgroup SDMMC_5460X CHIP: LPC5460x SD/MMC driver
 * @ingroup CHIP_5460X_Drivers
 * @{
 */

#define CMD_MASK_RESP       (0x3UL << 28)
#define CMD_RESP(r)         (((r) & 0x3) << 28)
#define CMD_RESP_R0         (0 << 28)
#define CMD_RESP_R1         (1 << 28)
#define CMD_RESP_R2         (2 << 28)
#define CMD_RESP_R3         (3 << 28)
#define CMD_BIT_AUTO_STOP   (1 << 24)
#define CMD_BIT_APP         (1 << 23)
#define CMD_BIT_INIT        (1 << 22)
#define CMD_BIT_BUSY        (1 << 21)
#define CMD_BIT_LS          (1 << 20)	/* Low speed, used during acquire */
#define CMD_BIT_DATA        (1 << 19)
#define CMD_BIT_WRITE       (1 << 18)
#define CMD_BIT_STREAM      (1 << 17)
#define CMD_MASK_CMD        (0xff)
#define CMD_SHIFT_CMD       (0)

#define CMD(c, r)        ( ((c) &  CMD_MASK_CMD) | CMD_RESP((r)) )

#define CMD_IDLE            CMD(MMC_GO_IDLE_STATE, 0) | CMD_BIT_LS    | CMD_BIT_INIT
#define CMD_SD_OP_COND      CMD(SD_APP_OP_COND, 1)      | CMD_BIT_LS | CMD_BIT_APP
#define CMD_SD_SEND_IF_COND CMD(SD_CMD8, 1)      | CMD_BIT_LS
#define CMD_MMC_OP_COND     CMD(MMC_SEND_OP_COND, 3)    | CMD_BIT_LS | CMD_BIT_INIT
#define CMD_ALL_SEND_CID    CMD(MMC_ALL_SEND_CID, 2)    | CMD_BIT_LS
#define CMD_MMC_SET_RCA     CMD(MMC_SET_RELATIVE_ADDR, 1) | CMD_BIT_LS
#define CMD_SD_SEND_RCA     CMD(SD_SEND_RELATIVE_ADDR, 1) | CMD_BIT_LS
#define CMD_SEND_CSD        CMD(MMC_SEND_CSD, 2) | CMD_BIT_LS
#define CMD_SEND_EXT_CSD    CMD(MMC_SEND_EXT_CSD, 1) | CMD_BIT_LS | CMD_BIT_DATA
#define CMD_DESELECT_CARD   CMD(MMC_SELECT_CARD, 0)
#define CMD_SELECT_CARD     CMD(MMC_SELECT_CARD, 1)
#define CMD_SET_BLOCKLEN    CMD(MMC_SET_BLOCKLEN, 1)
#define CMD_SEND_STATUS     CMD(MMC_SEND_STATUS, 1)
#define CMD_READ_SINGLE     CMD(MMC_READ_SINGLE_BLOCK, 1) | CMD_BIT_DATA
#define CMD_READ_MULTIPLE   CMD(MMC_READ_MULTIPLE_BLOCK, 1) | CMD_BIT_DATA | CMD_BIT_AUTO_STOP
#define CMD_SD_SET_WIDTH    CMD(SD_APP_SET_BUS_WIDTH, 1) | CMD_BIT_APP
#define CMD_STOP            CMD(MMC_STOP_TRANSMISSION, 1) | CMD_BIT_BUSY
#define CMD_WRITE_SINGLE    CMD(MMC_WRITE_BLOCK, 1) | CMD_BIT_DATA | CMD_BIT_WRITE
#define CMD_WRITE_MULTIPLE  CMD(MMC_WRITE_MULTIPLE_BLOCK, 1) | CMD_BIT_DATA | CMD_BIT_WRITE | CMD_BIT_AUTO_STOP

/**
 * @brief SD/MMC Card specific setup data structure
 */
typedef struct {
	uint32_t response[4];						/*!< Most recent response */
	uint32_t cid[4];							/*!< CID of acquired card  */
	uint32_t csd[4];							/*!< CSD of acquired card */
	uint32_t ext_csd[512 / 4];					/*!< Ext CSD */
	uint32_t card_type;							/*!< Card Type */
	uint16_t rca;								/*!< Relative address assigned to card */
	uint32_t speed;								/*!< Speed */
	uint32_t block_len;							/*!< Card sector size */
	uint64_t device_size;						/*!< Device Size */
	uint32_t blocknr;							/*!< Block Number */
	uint32_t clk_rate;							/*! Clock rate */
//	SDMMC_EVSETUP_FUNC_T evsetup_cb;			/*!< Function to setup event information */
//	SDMMC_EVWAIT_FUNC_T waitfunc_cb;			/*!< Function to wait for event */
//	SDMMC_MSDELAY_FUNC_T msdelay_func;			/*!< Function to sleep in ms */
} SDMMC_CARD_T;

/* Card specific setup data */
typedef struct _mci_card_struct {
	sdif_device sdif_dev;
	SDMMC_CARD_T card_info;
} mci_card_struct;

typedef mci_card_struct CARD_HANDLE_T;

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

/**
 * @brief SD/MMC commands, arguments and responses
 * Standard SD/MMC commands (3.1)       type  argument     response
 */
/* class 1 */
#define MMC_GO_IDLE_STATE         0		/* bc                          */
#define MMC_SEND_OP_COND          1		/* bcr  [31:0]  OCR        R3  */
#define MMC_ALL_SEND_CID          2		/* bcr                     R2  */
#define MMC_SET_RELATIVE_ADDR     3		/* ac   [31:16] RCA        R1  */
#define MMC_SET_DSR               4		/* bc   [31:16] RCA            */
#define MMC_SELECT_CARD           7		/* ac   [31:16] RCA        R1  */
#define MMC_SEND_EXT_CSD          8		/* bc                      R1  */
#define MMC_SEND_CSD              9		/* ac   [31:16] RCA        R2  */
#define MMC_SEND_CID             10		/* ac   [31:16] RCA        R2  */
#define MMC_STOP_TRANSMISSION    12		/* ac                      R1b */
#define MMC_SEND_STATUS          13		/* ac   [31:16] RCA        R1  */
#define MMC_GO_INACTIVE_STATE    15		/* ac   [31:16] RCA            */

/* class 2 */
#define MMC_SET_BLOCKLEN         16		/* ac   [31:0]  block len  R1  */
#define MMC_READ_SINGLE_BLOCK    17		/* adtc [31:0]  data addr  R1  */
#define MMC_READ_MULTIPLE_BLOCK  18		/* adtc [31:0]  data addr  R1  */

/* class 3 */
#define MMC_WRITE_DAT_UNTIL_STOP 20		/* adtc [31:0]  data addr  R1  */

/* class 4 */
#define MMC_SET_BLOCK_COUNT      23		/* adtc [31:0]  data addr  R1  */
#define MMC_WRITE_BLOCK          24		/* adtc [31:0]  data addr  R1  */
#define MMC_WRITE_MULTIPLE_BLOCK 25		/* adtc                    R1  */
#define MMC_PROGRAM_CID          26		/* adtc                    R1  */
#define MMC_PROGRAM_CSD          27		/* adtc                    R1  */

/* class 6 */
#define MMC_SET_WRITE_PROT       28		/* ac   [31:0]  data addr  R1b */
#define MMC_CLR_WRITE_PROT       29		/* ac   [31:0]  data addr  R1b */
#define MMC_SEND_WRITE_PROT      30		/* adtc [31:0]  wpdata addr R1  */

/* class 5 */
#define MMC_ERASE_GROUP_START    35		/* ac   [31:0]  data addr  R1  */
#define MMC_ERASE_GROUP_END      36		/* ac   [31:0]  data addr  R1  */
#define MMC_ERASE                37		/* ac                      R1b */
#define SD_ERASE_WR_BLK_START    32		/* ac   [31:0]  data addr  R1  */
#define SD_ERASE_WR_BLK_END      33		/* ac   [31:0]  data addr  R1  */
#define SD_ERASE                 38		/* ac                      R1b */

/* class 9 */
#define MMC_FAST_IO              39		/* ac   <Complex>          R4  */
#define MMC_GO_IRQ_STATE         40		/* bcr                     R5  */

/* class 7 */
#define MMC_LOCK_UNLOCK          42		/* adtc                    R1b */

/* class 8 */
#define MMC_APP_CMD              55		/* ac   [31:16] RCA        R1  */
#define MMC_GEN_CMD              56		/* adtc [0]     RD/WR      R1b */

/* SD commands                           type  argument     response */
/* class 8 */
/* This is basically the same command as for MMC with some quirks. */
#define SD_SEND_RELATIVE_ADDR     3		/* ac                      R6  */
#define SD_CMD8                   8		/* bcr  [31:0]  OCR        R3  */

/* Application commands */
#define SD_APP_SET_BUS_WIDTH      6		/* ac   [1:0]   bus width  R1   */
#define SD_APP_OP_COND           41		/* bcr  [31:0]  OCR        R1 (R4)  */
#define SD_APP_SEND_SCR          51		/* adtc                    R1   */

/**
 * @brief MMC status in R1<br>
 * Type<br>
 *   e : error bit<br>
 *   s : status bit<br>
 *   r : detected and set for the actual command response<br>
 *   x : detected and set during command execution. the host must poll
 *       the card by sending status command in order to read these bits.
 * Clear condition<br>
 *   a : according to the card state<br>
 *   b : always related to the previous command. Reception of
 *       a valid command will clear it (with a delay of one command)<br>
 *   c : clear by read<br>
 */

#define R1_OUT_OF_RANGE         (1UL << 31)	/* er, c */
#define R1_ADDRESS_ERROR        (1 << 30)	/* erx, c */
#define R1_BLOCK_LEN_ERROR      (1 << 29)	/* er, c */
#define R1_ERASE_SEQ_ERROR      (1 << 28)	/* er, c */
#define R1_ERASE_PARAM          (1 << 27)	/* ex, c */
#define R1_WP_VIOLATION         (1 << 26)	/* erx, c */
#define R1_CARD_IS_LOCKED       (1 << 25)	/* sx, a */
#define R1_LOCK_UNLOCK_FAILED   (1 << 24)	/* erx, c */
#define R1_COM_CRC_ERROR        (1 << 23)	/* er, b */
#define R1_ILLEGAL_COMMAND      (1 << 22)	/* er, b */
#define R1_CARD_ECC_FAILED      (1 << 21)	/* ex, c */
#define R1_CC_ERROR             (1 << 20)	/* erx, c */
#define R1_ERROR                (1 << 19)	/* erx, c */
#define R1_UNDERRUN             (1 << 18)	/* ex, c */
#define R1_OVERRUN              (1 << 17)	/* ex, c */
#define R1_CID_CSD_OVERWRITE    (1 << 16)	/* erx, c, CID/CSD overwrite */
#define R1_WP_ERASE_SKIP        (1 << 15)	/* sx, c */
#define R1_CARD_ECC_DISABLED    (1 << 14)	/* sx, a */
#define R1_ERASE_RESET          (1 << 13)	/* sr, c */
#define R1_STATUS(x)            (x & 0xFFFFE000)
#define R1_CURRENT_STATE(x)     ((x & 0x00001E00) >> 9)	/* sx, b (4 bits) */
#define R1_READY_FOR_DATA       (1 << 8)	/* sx, a */
#define R1_APP_CMD              (1 << 5)	/* sr, c */

/**
 * @brief SD/MMC card OCR register bits
 */
#define OCR_ALL_READY           (1UL << 31)	/* Card Power up status bit */
#define OCR_HC_CCS              (1 << 30)	/* High capacity card */
#define OCR_VOLTAGE_RANGE_MSK   (0x00FF8000)

#define SD_SEND_IF_ARG          0x000001AA
#define SD_SEND_IF_ECHO_MSK     0x000000FF
#define SD_SEND_IF_RESP         0x000000AA

/**
 * @brief R3 response definitions
 */
#define CMDRESP_R3_OCR_VAL(n)           (((uint32_t) n) & 0xFFFFFF)
#define CMDRESP_R3_S18A                 (((uint32_t) 1 ) << 24)
#define CMDRESP_R3_HC_CCS               (((uint32_t) 1 ) << 30)
#define CMDRESP_R3_INIT_COMPLETE        (((uint32_t) 1 ) << 31)

/**
 * @brief R6 response definitions
 */
#define CMDRESP_R6_RCA_VAL(n)           (((uint32_t) (n >> 16)) & 0xFFFF)
#define CMDRESP_R6_CARD_STATUS(n)       (((uint32_t) (n & 0x1FFF)) | \
										 ((n & (1 << 13)) ? (1 << 19) : 0) | \
										 ((n & (1 << 14)) ? (1 << 22) : 0) | \
										 ((n & (1 << 15)) ? (1 << 23) : 0))

/**
 * @brief R7 response definitions
 */
/** Echo-back of check-pattern */
#define CMDRESP_R7_CHECK_PATTERN(n)     (((uint32_t) n ) & 0xFF)
/** Voltage accepted */
#define CMDRESP_R7_VOLTAGE_ACCEPTED     (((uint32_t) 1 ) << 8)

/**
 * @brief CMD3 command definitions
 */
/** Card Address */
#define CMD3_RCA(n)         (((uint32_t) (n & 0xFFFF) ) << 16)

/**
 * @brief CMD7 command definitions
 */
/** Card Address */
#define CMD7_RCA(n)         (((uint32_t) (n & 0xFFFF) ) << 16)

/**
 * @brief CMD8 command definitions
 */
/** Check pattern */
#define CMD8_CHECKPATTERN(n)            (((uint32_t) (n & 0xFF) ) << 0)
/** Recommended pattern */
#define CMD8_DEF_PATTERN                    (0xAA)
/** Voltage supplied.*/
#define CMD8_VOLTAGESUPPLIED_27_36     (((uint32_t) 1 ) << 8)

/**
 * @brief CMD9 command definitions
 */
#define CMD9_RCA(n)         (((uint32_t) (n & 0xFFFF) ) << 16)

/**
 * @brief CMD13 command definitions
 */
#define CMD13_RCA(n)            (((uint32_t) (n & 0xFFFF) ) << 16)

/**
 * @brief APP_CMD command definitions
 */
#define CMD55_RCA(n)            (((uint32_t) (n & 0xFFFF) ) << 16)

/**
 * @brief ACMD41 command definitions
 */
#define ACMD41_OCR(n)                   (((uint32_t) n) & 0xFFFFFF)
#define ACMD41_S18R                     (((uint32_t) 1 ) << 24)
#define ACMD41_XPC                      (((uint32_t) 1 ) << 28)
#define ACMD41_HCS                      (((uint32_t) 1 ) << 30)

/**
 * @brief ACMD6 command definitions
 */
#define ACMD6_BUS_WIDTH(n)              ((uint32_t) n & 0x03)
#define ACMD6_BUS_WIDTH_1               (0)
#define ACMD6_BUS_WIDTH_4               (2)

/** @brief Card type defines
 */
#define CARD_TYPE_SD    (1 << 0)
#define CARD_TYPE_4BIT  (1 << 1)
#define CARD_TYPE_8BIT  (1 << 2)
#define CARD_TYPE_HC    (OCR_HC_CCS)/*!< high capacity card > 2GB */

/**
 * @brief SD/MMC sector size in bytes
 */
#define MMC_SECTOR_SIZE     512

/**
 * @brief Typical enumeration clock rate
 */
#define SD_MMC_ENUM_CLOCK       400000

/**
 * @brief Max MMC clock rate
 */
#define MMC_MAX_CLOCK           20000000

/**
 * @brief Type 0 MMC card max clock rate
 */
#define MMC_LOW_BUS_MAX_CLOCK   26000000

/**
 * @brief Type 1 MMC card max clock rate
 */
#define MMC_HIGH_BUS_MAX_CLOCK  52000000

/**
 * @brief Max SD clock rate
 */
#define SD_MAX_CLOCK            25000000


/** @defgroup CHIP_SDMMC_Definitions CHIP: Common SD/MMC definitions
 * @ingroup CHIP_Common
 * @{
 */

/**
 * @brief OCR Register definitions
 */
/** Support voltage range 2.0-2.1 (this bit is reserved in SDC)*/
#define SDC_OCR_20_21               (((uint32_t) 1) << 8)
/** Support voltage range 2.1-2.2 (this bit is reserved in SDC)*/
#define SDC_OCR_21_22               (((uint32_t) 1) << 9)
/** Support voltage range 2.2-2.3 (this bit is reserved in SDC)*/
#define SDC_OCR_22_23               (((uint32_t) 1) << 10)
/** Support voltage range 2.3-2.4 (this bit is reserved in SDC)*/
#define SDC_OCR_23_24               (((uint32_t) 1) << 11)
/** Support voltage range 2.4-2.5 (this bit is reserved in SDC)*/
#define SDC_OCR_24_25               (((uint32_t) 1) << 12)
/** Support voltage range 2.5-2.6 (this bit is reserved in SDC)*/
#define SDC_OCR_25_26               (((uint32_t) 1) << 13)
/** Support voltage range 2.6-2.7 (this bit is reserved in SDC)*/
#define SDC_OCR_26_27               (((uint32_t) 1) << 14)
/** Support voltage range 2.7-2.8 */
#define SDC_OCR_27_28               (((uint32_t) 1) << 15)
/** Support voltage range 2.8-2.9*/
#define SDC_OCR_28_29               (((uint32_t) 1) << 16)
/** Support voltage range 2.9-3.0 */
#define SDC_OCR_29_30               (((uint32_t) 1) << 17)
/** Support voltage range 3.0-3.1 */
#define SDC_OCR_30_31               (((uint32_t) 1) << 18)
/** Support voltage range 3.1-3.2 */
#define SDC_OCR_31_32               (((uint32_t) 1) << 19)
/** Support voltage range 3.2-3.3 */
#define SDC_OCR_32_33               (((uint32_t) 1) << 20)
/** Support voltage range 3.3-3.4 */
#define SDC_OCR_33_34               (((uint32_t) 1) << 21)
/** Support voltage range 3.4-3.5 */
#define SDC_OCR_34_35               (((uint32_t) 1) << 22)
/** Support voltage range 3.5-3.6 */
#define SDC_OCR_35_36               (((uint32_t) 1) << 23)
/** Support voltage range 2.7-3.6 */
#define SDC_OCR_27_36               ((uint32_t) 0x00FF8000)
/** Card Capacity Status (CCS). (this bit is reserved in MMC) */
#define SDC_OCR_HC_CCS              (((uint32_t) 1) << 30)
/** Card power up status bit */
#define SDC_OCR_IDLE                (((uint32_t) 1) << 31)
#define SDC_OCR_BUSY                (((uint32_t) 0) << 31)

/* SD/MMC commands - this matrix shows the command, response types, and
   supported card type for that command.
   Command                 Number Resp  SD  MMC
   ----------------------- ------ ----- --- ---
   Reset (go idle)         CMD0   NA    x   x
   Send op condition       CMD1   R3        x
   All send CID            CMD2   R2    x   x
   Send relative address   CMD3   R1        x
   Send relative address   CMD3   R6    x
   Program DSR             CMD4   NA        x
   Select/deselect card    CMD7   R1b       x
   Select/deselect card    CMD7   R1    x
   Send CSD                CMD9   R2    x   x
   Send CID                CMD10  R2    x   x
   Read data until stop    CMD11  R1    x   x
   Stop transmission       CMD12  R1/b  x   x
   Send status             CMD13  R1    x   x
   Go inactive state       CMD15  NA    x   x
   Set block length        CMD16  R1    x   x
   Read single block       CMD17  R1    x   x
   Read multiple blocks    CMD18  R1    x   x
   Write data until stop   CMD20  R1        x
   Setblock count          CMD23  R1        x
   Write single block      CMD24  R1    x   x
   Write multiple blocks   CMD25  R1    x   x
   Program CID             CMD26  R1        x
   Program CSD             CMD27  R1    x   x
   Set write protection    CMD28  R1b   x   x
   Clear write protection  CMD29  R1b   x   x
   Send write protection   CMD30  R1    x   x
   Erase block start       CMD32  R1    x
   Erase block end         CMD33  R1    x
   Erase block start       CMD35  R1        x
   Erase block end         CMD36  R1        x
   Erase blocks            CMD38  R1b       x
   Fast IO                 CMD39  R4        x
   Go IRQ state            CMD40  R5        x
   Lock/unlock             CMD42  R1b       x
   Application command     CMD55  R1        x
   General command         CMD56  R1b       x

 *** SD card application commands - these must be preceded with ***
 *** MMC CMD55 application specific command first               ***
   Set bus width           ACMD6  R1    x
   Send SD status          ACMD13 R1    x
   Send number WR blocks   ACMD22 R1    x
   Set WR block erase cnt  ACMD23 R1    x
   Send op condition       ACMD41 R3    x
   Set clear card detect   ACMD42 R1    x
   Send CSR                ACMD51 R1    x */

/**
 * @brief  SD/MMC application specific commands for SD cards only - these
 * must be preceded by the SDMMC CMD55 to work correctly
 */
typedef enum {
	SD_SET_BUS_WIDTH,		/*!< Set the SD bus width */
	SD_SEND_STATUS,			/*!< Send the SD card status */
	SD_SEND_WR_BLOCKS,		/*!< Send the number of written clocks */
	SD_SET_ERASE_COUNT,		/*!< Set the number of blocks to pre-erase */
	SD_SENDOP_COND,			/*!< Send the OCR register (init) */
	SD_CLEAR_CARD_DET,		/*!< Set or clear the 50K detect pullup */
	SD_SEND_SCR,			/*!< Send the SD configuration register */
	SD_INVALID_APP_CMD		/*!< Invalid SD application command */
} SD_APP_CMD_T;

/**
 * @brief  Possible SDMMC response types
 */
typedef enum {
	SDMMC_RESPONSE_R1,		/*!< Typical status */
	SDMMC_RESPONSE_R1B,		/*!< Typical status with busy */
	SDMMC_RESPONSE_R2,		/*!< CID/CSD registers (CMD2 and CMD10) */
	SDMMC_RESPONSE_R3,		/*!< OCR register (CMD1, ACMD41) */
	SDMMC_RESPONSE_R4,		/*!< Fast IO response word */
	SDMMC_RESPONSE_R5,		/*!< Go IRQ state response word */
	SDMMC_RESPONSE_R6,		/*!< Published RCA response */
	SDMMC_RESPONSE_NONE		/*!< No response expected */
} SDMMC_RESPONSE_T;

/**
 * @brief  Possible SDMMC card state types
 */
typedef enum {
	SDMMC_IDLE_ST = 0,	/*!< Idle state */
	SDMMC_READY_ST,		/*!< Ready state */
	SDMMC_IDENT_ST,		/*!< Identification State */
	SDMMC_STBY_ST,		/*!< standby state */
	SDMMC_TRAN_ST,		/*!< transfer state */
	SDMMC_DATA_ST,		/*!< Sending-data State */
	SDMMC_RCV_ST,		/*!< Receive-data State */
	SDMMC_PRG_ST,		/*!< Programming State */
	SDMMC_DIS_ST		/*!< Disconnect State */
} SDMMC_STATE_T;

//typedef enum {
//	SYSCON_SDIOCLKSRC_MAINCLK,
//	SYSCON_SDIOCLKSRC_PLL,
//	SYSCON_SDIOCLKSRC_USBPLL,
//	SYSCON_SDIOCLKSRC_FROHF,
//	SYSCON_SDIOCLKSRC_AUDIOPLL,
//	SYSCON_SDIOCLKSRC_DISABLED = 7
//}CHIP_SYSCON_SDIOCLKSRC_T;


#ifdef __cplusplus
}
#endif

#endif /* __SDIF_5460X_H_ */
