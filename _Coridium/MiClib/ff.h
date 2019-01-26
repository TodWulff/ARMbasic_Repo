/*--------------------------------------------------------------------------/
/  FatFs - FAT file system module include file  R0.04b       (C)ChaN, 2007
/---------------------------------------------------------------------------/
/ FatFs module is an experimenal project to implement FAT file system to
/ cheap microcontrollers. This is a free software and is opened for education,
/ research and development under license policy of following trems.
/
/  Copyright (C) 2007, ChaN, all right reserved.
/
/ * The FatFs module is a free software and there is no warranty.
/ * You can use, modify and/or redistribute it for personal, non-profit or
/   profit use without any restriction under your responsibility.
/ * Redistributions of source code must retain the above copyright notice.
/
/---------------------------------------------------------------------------*/

#ifndef _FATFS

#define _MCU_ENDIAN        1
/* The _MCU_ENDIAN defines which access method is used to the FAT structure.
/  1: Enable word access.
/  2: Disable word access and use byte-by-byte access instead.
/  When the architectural byte order of the MCU is big-endian and/or address
/  miss-aligned access is prohibited, the _MCU_ENDIAN must be set to 2.
/  If it is not the case, it can be set to 1 for good code efficiency. */

#define _DRIVES        1 //2
/* Number of logical drives to be used. This affects the size of internal table. */

#define    _USE_SJIS    1
/* When _USE_SJIS is set to 1, Shift-JIS code transparency is enabled, otherwise
/  only US-ASCII(7bit) code can be accepted as file/directory name. */

#define    _USE_NTFLAG    1
/* When _USE_NTFLAG is set to 1, upper/lower case of the file name is preserved.
/  Note that the files are always accessed in case insensitive. */





/* Definitions corresponds to multiple sector size (not tested) */
#define    S_MAX_SIZ    512            /* Do not change */
#if S_MAX_SIZ > 512
#define    S_SIZ    (fs->s_size)
#else
#define    S_SIZ    512
#endif


/* File system object structure */
typedef struct _FATFS {
    unsigned short    id;                /* File system mount ID */
    unsigned short    n_rootdir;        /* Number of root directory entries */
    unsigned int    winsect;        /* Current sector appearing in the win[] */
    unsigned int    sects_fat;        /* Sectors per fat */
    unsigned int    max_clust;        /* Maximum cluster# + 1 */
    unsigned int    fatbase;        /* FAT start sector */
    unsigned int    dirbase;        /* Root directory start sector (cluster# for FAT32) */
    unsigned int    database;        /* Data start sector */
    unsigned int    last_clust;        /* Last allocated cluster */
    unsigned int    free_clust;        /* Number of free clusters */
    unsigned char    fs_type;        /* FAT sub type */
    unsigned char    sects_clust;    /* Sectors per cluster */
    unsigned char    n_fats;            /* Number of FAT copies */
    unsigned char    winflag;        /* win[] dirty flag (1:must be written back) */
    unsigned char    pad1;
	unsigned char    win[S_MAX_SIZ];
} FATFS;

/* Directory object structure */
typedef struct _DIR {
    unsigned short    id;            /* Owner file system mount ID */
    unsigned short    index;        /* Current index */
    unsigned int    sclust;        /* Start cluster */
    unsigned int    clust;        /* Current cluster */
    unsigned int    sect;        /* Current sector */
} DIR;


/* File object structure */
typedef struct _FIL {
    unsigned short    id;                /* Owner file system mount ID */
    unsigned char    flag;            /* File status flags */
    unsigned char    sect_clust;        /* Left sectors in cluster */
    FATFS*    fs;                /* Pointer to the owner file system object */
    unsigned int    fptr;            /* File R/W pointer */
    unsigned int    fsize;            /* File size */
    unsigned int    org_clust;        /* File start cluster */
    unsigned int    curr_clust;        /* Current cluster */
    unsigned int    curr_sect;        /* Current sector */
    unsigned int    dir_sect;        /* Sector containing the directory entry */
    unsigned char*    dir_ptr;        /* Ponter to the directory entry in the window */
    unsigned char    buffer[S_MAX_SIZ];    /* File R/W buffer */
} FIL;

/* File status structure */
typedef struct _FILINFO {
    unsigned int fsize;            /* Size */
    unsigned short fdate;                /* Date */
    unsigned short ftime;                /* Time */
    unsigned char fattrib;            /* Attribute */
    char fname[8+1+3+1];    /* Name (8.3 format) */
} FILINFO;


extern FATFS g_FatFs;
extern FIL g_FileObject;
extern int g_FileSystemMounted;
extern DIR g_DirObject;
extern FILINFO g_FileInfo;

/* Definitions corresponds to multi partition */
#define LD2PD(drv) (drv)        /* Physical drive# is equal to logical drive# */
#define LD2PT(drv) 0            /* Always mounts the 1st partition */


/* File function return code (FRESULT) */

typedef enum {
    FR_OK = 0,            /* 0 */
    FR_NOT_READY,        /* 1 */
    FR_NO_FILE,            /* 2 */
    FR_NO_PATH,            /* 3 */
    FR_INVALID_NAME,    /* 4 */
    FR_INVALID_DRIVE,    /* 5 */
    FR_DENIED,            /* 6 */
    FR_EXIST,            /* 7 */
    FR_RW_ERROR,        /* 8 */
    FR_WRITE_PROTECTED,    /* 9 */
    FR_NOT_ENABLED,        /* 10 */
    FR_NO_FILESYSTEM,    /* 11 */
    FR_INVALID_OBJECT    /* 12 */
} FRESULT;


/*-----------------------------------------------------*/
/* FatFs module application interface                  */

FRESULT file_mount ();                      /* Mount/Unmount a logical drive */
FRESULT file_open (const char*, unsigned char);            /* Open or create a file */
FRESULT file_read  ( void*, unsigned short, unsigned short*);/* Read data from a file */
FRESULT file_write ( const void*, unsigned short, unsigned short*);/* Write data to a file */
FRESULT file_lseek ( unsigned int);                   /* Move file pointer of a file object */
FRESULT file_close ();                                 /* Close an open file object */
FRESULT file_opendir ();                /* Open an existing directory */
FRESULT file_readdir ();                    /* Read a directory item */


/*
open mode
    C string containing a file access mode. It can be:
    "r"	read: Open file for input operations. The file must exist.
    "w"	write: Create an empty file for output operations.
        If a file with the same name already exists, its contents are discarded and the file is treated as a new empty file.
    "a"	append: Open file for output at the end of a file. Output operations always write data at the end of the file, expanding it.
        Repositioning operations (fseek, fsetpos, rewind) are ignored. The file is created if it does not exist.
    "r+" read/update: Open a file for update (both for input and output). The file must exist.
    "w+" write/update: Create an empty file and open it for update (both for input and output).
         If a file with the same name already exists its contents are discarded and the file is treated as a new empty file.
    "a+" append/update: Open a file for update (both for input and output) with all output operations writing data at the end of the file.
         Repositioning operations (fseek, fsetpos, rewind) affects the next input operations, but output operations move the
         position back to the end of file. The file is created if it does not exist.
*/

unsigned int get_fattime (void);    /* 31-25: Year(0-127 org.1980), 24-21: Month(1-12), 20-16: Day(1-31) */
                            /* 15-11: Hour(0-23), 10-5: Minute(0-59), 4-0: Second(0-29 *2) */



/* File access control and file status flags (FIL.flag) */
//FA_READ	Specifies read access to the object. Data can be read from the file. Combine with FA_WRITE for read-write access.
//FA_WRITE	Specifies write access to the object. Data can be written to the file. Combine with FA_READ for read-write access.
//FA_OPEN_EXISTING	Opens the file. The function fails if the file is not existing. (Default)
//FA_OPEN_ALWAYS	Opens the file if it is existing. If not, a new file is created.
//                  To append data to the file, use file_lseek() function after file open in this method.
//FA_CREATE_NEW	Creates a new file. The function fails with FR_EXIST if the file is existing.
//FA_CREATE_ALWAYS	Creates a new file. If the file is existing, it is truncated and overwritten.
#define    FA_READ                0x01
#define    FA_OPEN_EXISTING    0x00
#define    FA_WRITE            0x02
#define    FA_CREATE_NEW        0x04
#define    FA_CREATE_ALWAYS    0x08
#define    FA_OPEN_ALWAYS        0x10
#define FA__WRITTEN            0x20
#define FA__DIRTY            0x40
#define FA__ERROR            0x80


/* FAT sub type (FATFS.fs_type) */

#define FS_FAT12    1
#define FS_FAT16    2
#define FS_FAT32    3


/* File attribute bits for directory entry */

#define    AM_RDO    0x01    /* Read only */
#define    AM_HID    0x02    /* Hidden */
#define    AM_SYS    0x04    /* System */
#define    AM_VOL    0x08    /* Volume label */
#define AM_LFN    0x0F    /* LFN entry */
#define AM_DIR    0x10    /* Directory */
#define AM_ARC    0x20    /* Archive */



//typedef struct boot_sec {
//    uint32_t    BootSecOffset;             /* Offset of the boot sector from sector 0                     */
//    uint16_t    BytsPerSec;                /* Bytes per sector                                            */
//    uint8_t     SecPerClus;                /* Sectors per cluster                                         */
//    uint32_t    BytsPerClus;               /* Bytes per cluster                                           */
//    uint16_t    RsvdSecCnt;                /* Reserved sector count                                       */
//    uint8_t     NumFATs;                   /* Number of FAT copies                                        */
//    uint16_t    RootEntCnt;                /* Root entry count                                            */
//    uint16_t    TotSec16;                  /* Total sectors in the disk. !=0 if TotSec32 = 0              */
//    uint32_t    TotSec32;                  /* Total sectors in the disk. !=0 if TotSec16 = 0              */
//    uint16_t    FATSz16;                   /* Sectors occupied by single FAT table                        */
//    uint8_t     FATType;                   /* File system type                                            */
//    uint32_t    RootDirSec;                /* Sectors occupied by root directory                          */
//    uint32_t    RootDirStartSec;           /* Starting sector of the root directory                       */
//    uint32_t    FirstDataSec;              /* Starting sector of the first data cluster                   */
//} BOOT_SEC;

//typedef  struct  file_entry {
//    uint32_t  FileSize;                    /* Total size of the file                                      */
//    uint16_t  CurrClus;                    /* Current cluster of the cluster offset                       */
//    uint32_t  CurrClusOffset;              /* Current cluster offset                                      */
//    uint32_t  EntrySec;                    /* Sector where the file entry is located                      */
//    uint32_t  EntrySecOffset;              /* Offset in the entry sector from where the file is located   */
//	uint8_t   FileStatus;                  /* File's open status                                          */
//} FILE_ENTRY;
/* Offset of FAT structure members */

#define BS_jmpBoot            0
#define BS_OEMName            3
#define BPB_BytsPerSec        11
#define BPB_SecPerClus        13
#define BPB_RsvdSecCnt        14
#define BPB_NumFATs            16
#define BPB_RootEntCnt        17
#define BPB_TotSec16        19
#define BPB_Media            21
#define BPB_FATSz16            22
#define BPB_SecPerTrk        24
#define BPB_NumHeads        26
#define BPB_HiddSec            28
#define BPB_TotSec32        32
#define BS_55AA                510

#define BS_DrvNum            36
#define BS_BootSig            38
#define BS_VolID            39
#define BS_VolLab            43
#define BS_FilSysType        54

#define BPB_FATSz32            36
#define BPB_ExtFlags        40
#define BPB_FSVer            42
#define BPB_RootClus        44
#define BPB_FSInfo            48
#define BPB_BkBootSec        50
#define BS_DrvNum32            64
#define BS_BootSig32        66
#define BS_VolID32            67
#define BS_VolLab32            71
#define BS_FilSysType32        82

#define    FSI_LeadSig            0
#define    FSI_StrucSig        484
#define    FSI_Free_Count        488
#define    FSI_Nxt_Free        492

#define MBR_Table            446

#define    DIR_Name            0
#define    DIR_Attr            11
#define    DIR_NTres            12
#define    DIR_CrtTime            14
#define    DIR_CrtDate            16
#define    DIR_FstClusHI        20
#define    DIR_WrtTime            22
#define    DIR_WrtDate            24
#define    DIR_FstClusLO        26
#define    DIR_FileSize        28



/* Multi-byte word access macros  */

#if _MCU_ENDIAN == 1    /* Use word access */
#define    LD_WORD(ptr)        (unsigned short)(*(unsigned short*)(unsigned char*)(ptr))
#define    LD_DWORD(ptr)        (unsigned int)(*(unsigned int*)(unsigned char*)(ptr))
#define    ST_WORD(ptr,val)    *(unsigned short*)(unsigned char*)(ptr)=(unsigned short)(val)
#define    ST_DWORD(ptr,val)    *(unsigned int*)(unsigned char*)(ptr)=(unsigned int)(val)
#else
#if _MCU_ENDIAN == 2    /* Use byte-by-byte access */
#define    LD_WORD(ptr)        (unsigned short)(((unsigned short)*(unsigned char*)((ptr)+1)<<8)|(unsigned short)*(unsigned char*)(ptr))
#define    LD_DWORD(ptr)        (unsigned int)(((unsigned int)*(unsigned char*)((ptr)+3)<<24)|((unsigned int)*(unsigned char*)((ptr)+2)<<16)|((unsigned short)*(unsigned char*)((ptr)+1)<<8)|*(unsigned char*)(ptr))
#define    ST_WORD(ptr,val)    *(unsigned char*)(ptr)=(unsigned char)(val); *(unsigned char*)((ptr)+1)=(unsigned char)((unsigned short)(val)>>8)
#define    ST_DWORD(ptr,val)    *(unsigned char*)(ptr)=(unsigned char)(val); *(unsigned char*)((ptr)+1)=(unsigned char)((unsigned short)(val)>>8); *(unsigned char*)((ptr)+2)=(unsigned char)((unsigned int)(val)>>16); *(unsigned char*)((ptr)+3)=(unsigned char)((unsigned int)(val)>>24)
#else
#error Do not forget to set _MCU_ENDIAN properly!
#endif
#endif


#define _FATFS
#endif /* _FATFS */
