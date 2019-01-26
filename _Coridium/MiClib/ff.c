/*--------------------------------------------------------------------------/
/  FatFs - FAT file system module  R0.04b                    (C)ChaN, 2007
/---------------------------------------------------------------------------/
/ The FatFs module is an experimenal project to implement FAT file system to
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
/---------------------------------------------------------------------------/
/  Feb 26, 2006  R0.00  Prototype.
/  Apr 29, 2006  R0.01  First stable version.
/  Jun 01, 2006  R0.02  Added FAT12 support.
/                       Removed unbuffered mode.
/                       Fixed a problem on small (<32M) patition.
/  Jun 10, 2006  R0.02a Added a configuration option (_FS_MINIMUM).
/  Sep 22, 2006  R0.03  Added f_rename().
/                       Changed option _FS_MINIMUM to _FS_MINIMIZE.
/  Dec 11, 2006  R0.03a Improved cluster scan algolithm to write files fast.
/                       Fixed f_mkdir() creates incorrect directory on FAT32.
/  Feb 04, 2007  R0.04  Supported multiple drive system.
/                       Changed some interfaces for multiple drive system.
/                       Changed f_mountdrv() to file_mount().
/                       Added f_mkfs().
/  Apr 01, 2007  R0.04a Supported multiple partitions on a plysical drive.
/                       Added a capability of extending file size to file_lseek().
/                       Added minimization level 3.
/                       Fixed an endian sensitive code in f_mkfs().
/  May 05, 2007  R0.04b Added a configuration option _USE_NTFLAG.
/                       Added FSInfo support.
/                       Fixed DBCS name can result FR_INVALID_NAME.
/                       Fixed short seek (<= csize) collapses the file object.
/
/ May 2013 modified by Coridium
/---------------------------------------------------------------------------*/

#include "ff.h"            // FatFs declarations
#if defined LPC54618
  #include "sd_card_mmc.h"       // Include file for user provided disk functions
#else
#include "sd_card.h"       // Include file for user provided disk functions
#endif

#include "mem.h"
//#include "string.h"
#include "printf.h"

/*--------------------------------------------------------------------------

   Module Private Functions

---------------------------------------------------------------------------*/

static unsigned short fsid;                /* File system mount ID */

FATFS g_FatFs;
FIL g_FileObject;
int g_FileSystemMounted;
DIR g_DirObject;
FILINFO g_FileInfo;


/*-----------------------------------------------------------------------*/
/* Change window offset                                                  */
/*-----------------------------------------------------------------------*/

static
unsigned char move_window (        /* 1: successful, 0: failed */
    FATFS *fs,            /* File system object */
    unsigned int sector        /* Sector number to make apperance in the g_FatFs.win[] */
)                        /* Move to zero only writes back dirty window */
{
    unsigned int wsect;


    wsect = fs->winsect;
    if (wsect != sector) {    /* Changed current window */
        unsigned char n;
        if (fs->winflag) {    /* Write back dirty window if needed */
            if (disk_write( g_FatFs.win, wsect, 1) != RES_OK)
                return 0;
            fs->winflag = 0;
            if (wsect < (fs->fatbase + fs->sects_fat)) {    /* In FAT area */
                for (n = fs->n_fats; n >= 2; n--) {    /* Refrect the change to FAT copy */
                    wsect += fs->sects_fat;
                    disk_write( g_FatFs.win, wsect, 1);
                }
            }
        }
        if (sector) {
            if (disk_read( g_FatFs.win, sector, 1) != RES_OK)
                return 0;
            fs->winsect = sector;
        }
    }
    return 1;
}




/*-----------------------------------------------------------------------*/
/* Clean-up cached data                                                  */
/*-----------------------------------------------------------------------*/





/*-----------------------------------------------------------------------*/
/* Get a cluster status                                                  */
/*-----------------------------------------------------------------------*/

static
unsigned int get_cluster (        /* 0,>=2: successful, 1: failed */
    FATFS *fs,            /* File system object */
    unsigned int clust            /* Cluster# to get the link information */
)
{
//    unsigned short wc, bc;
    unsigned int fatsect;


    if (clust >= 2 && clust < fs->max_clust) {        /* Valid cluster# */
        fatsect = fs->fatbase;
        switch (fs->fs_type) {

        case FS_FAT16 :
            if (!move_window(fs, fatsect + (clust / (S_SIZ / 2)))) break;
            return LD_WORD(&g_FatFs.win[((unsigned short)clust * 2) & (S_SIZ - 1)]);

        case FS_FAT32 :
            if (!move_window(fs, fatsect + (clust / (S_SIZ / 4)))) break;
            return LD_DWORD(&g_FatFs.win[((unsigned short)clust * 4) & (S_SIZ - 1)]) & 0x0FFFFFFF;
        }
    }

    return 1;    /* There is no cluster information, or an error occured */
}




/*-----------------------------------------------------------------------*/
/* Change a cluster status                                               */
/*-----------------------------------------------------------------------*/

static
unsigned char put_cluster (        /* 1: successful, 0: failed */
    FATFS *fs,            /* File system object */
    unsigned int clust,        /* Cluster# to change */
    unsigned int val            /* New value to mark the cluster */
)
{
//    unsigned short bc;
//    unsigned char *p;
    unsigned int fatsect;


    fatsect = fs->fatbase;
    switch (fs->fs_type) {

    case FS_FAT16 :
        if (!move_window(fs, fatsect + (clust / (S_SIZ / 2)))) return 0;
        ST_WORD(&g_FatFs.win[((unsigned short)clust * 2) & (S_SIZ - 1)], (unsigned short)val);
        break;

    case FS_FAT32 :
        if (!move_window(fs, fatsect + (clust / (S_SIZ / 4)))) return 0;
        ST_DWORD(&g_FatFs.win[((unsigned short)clust * 4) & (S_SIZ - 1)], val);
        break;

    default :
        return 0;
    }
    fs->winflag = 1;
    return 1;
}




/*-----------------------------------------------------------------------*/
/* Remove a cluster chain                                                */
/*-----------------------------------------------------------------------*/

static
unsigned char remove_chain (        /* 1: successful, 0: failed */
    FATFS *fs,            /* File system object */
    unsigned int clust            /* Cluster# to remove chain from */
)
{
    unsigned int nxt;


    while (clust >= 2 && clust < fs->max_clust) {
        nxt = get_cluster(fs, clust);
        if (nxt == 1) return 0;
        if (!put_cluster(fs, clust, 0)) return 0;
        if (fs->free_clust != 0xFFFFFFFF) {
            fs->free_clust++;
        }
        clust = nxt;
    }
    return 1;
}




/*-----------------------------------------------------------------------*/
/* Stretch or create a cluster chain                                     */
/*-----------------------------------------------------------------------*/

static
unsigned int create_chain (    /* 0: no free cluster, 1: error, >=2: new cluster number */
    FATFS *fs,            /* File system object */
    unsigned int clust            /* Cluster# to stretch, 0 means create new */
)
{
    unsigned int cstat, ncl, scl, mcl = fs->max_clust;


    if (clust == 0) {        /* Create new chain */
        scl = fs->last_clust;            /* Get suggested start point */
        if (scl == 0 || scl >= mcl) scl = 1;
    }
    else {                    /* Stretch existing chain */
        cstat = get_cluster(fs, clust);    /* Check the cluster status */
        if (cstat < 2) return 1;        /* It is an invalid cluster */
        if (cstat < mcl) return cstat;    /* It is already followed by next cluster */
        scl = clust;
    }

    ncl = scl;                /* Start cluster */
    for (;;) {
        ncl++;                            /* Next cluster */
        if (ncl >= mcl) {                /* Wrap around */
            ncl = 2;
            if (ncl > scl) return 0;    /* No free custer */
        }
        cstat = get_cluster(fs, ncl);    /* Get the cluster status */
        if (cstat == 0) break;            /* Found a free cluster */
        if (cstat == 1) return 1;        /* Any error occured */
        if (ncl == scl) return 0;        /* No free custer */
    }

    if (!put_cluster(fs, ncl, 0x0FFFFFFF)) return 1;        /* Mark the new cluster "in use" */
    if (clust && !put_cluster(fs, clust, ncl)) return 1;    /* Link it to previous one if needed */

    fs->last_clust = ncl;                /* Update fsinfo */
    if (fs->free_clust != 0xFFFFFFFF) {
        fs->free_clust--;
    }

    return ncl;        /* Return new cluster number */
}




/*-----------------------------------------------------------------------*/
/* Get sector# from cluster#                                             */
/*-----------------------------------------------------------------------*/

static
unsigned int clust2sect (    /* !=0: sector number, 0: failed - invalid cluster# */
    FATFS *fs,        /* File system object */
    unsigned int clust        /* Cluster# to be converted */
)
{
    clust -= 2;
    if (clust >= (fs->max_clust - 2)) return 0;        /* Invalid cluster# */
    return clust * fs->sects_clust + fs->database;
}




/*-----------------------------------------------------------------------*/
/* Move directory pointer to next                                        */
/*-----------------------------------------------------------------------*/

static
unsigned char next_dir_entry (    /* 1: successful, 0: could not move next */
    DIR *dirobj            /* Pointer to directory object */
)
{
    unsigned int clust;
    unsigned short idx;
    FATFS *fs = &g_FatFs;//dirobj->fs;


    idx = dirobj->index + 1;
    if ((idx & ((S_SIZ - 1) / 32)) == 0) {        /* Table sector changed? */
        dirobj->sect++;            /* Next sector */
        if (!dirobj->clust) {        /* In static table */
            if (idx >= fs->n_rootdir) return 0;    /* Reached to end of table */
        } else {                    /* In dynamic table */
            if (((idx / (S_SIZ / 32)) & (fs->sects_clust - 1)) == 0) {    /* Cluster changed? */
                clust = get_cluster(fs, dirobj->clust);        /* Get next cluster */
                if (clust < 2 || clust >= fs->max_clust)    /* Reached to end of table */
                    return 0;
                dirobj->clust = clust;                /* Initialize for new cluster */
                dirobj->sect = clust2sect(fs, clust);
            }
        }
    }
    dirobj->index = idx;    /* Lower 4 bit of dirobj->index indicates offset in dirobj->sect */
    return 1;
}


///*-----------------------------------------------------------------------*/
///* Pick a paragraph and create the name in format of directory entry     */
///*-----------------------------------------------------------------------*/

static
char make_dirfile (            /* 1: error - detected an invalid format, '\0'or'/': next character */
    const char **path,        /* Pointer to the file path pointer */
    char *dirname            /* Pointer to directory name buffer {Name(8), Ext(3), NT flag(1)} */
)
{
    unsigned char n, t, c, a, b;


    memset(dirname, ' ', 8+3);    /* Fill buffer with spaces */
    a = 0; b = 0x18;    /* NT flag */
    n = 0; t = 8;
    for (;;) {
        c = *(*path)++;
        if (c == '\0' || c == '/') {        /* Reached to end of str or directory separator */
            if (n == 0) break;
            dirname[11] = _USE_NTFLAG ? (a & b) : 0;
            return c;
        }
        if (c <= ' ' || c == 0x7F) break;        /* Reject invisible chars */
        if (c == '.') {
            if (!(a & 1) && n >= 1 && n <= 8) {    /* Enter extension part */
                n = 8; t = 11; continue;
            }
            break;
        }
        if (_USE_SJIS &&
            ((c >= 0x81 && c <= 0x9F) ||    /* Accept S-JIS code */
            (c >= 0xE0 && c <= 0xFC))) {
            if (n == 0 && c == 0xE5)        /* Change heading \xE5 to \x05 */
                c = 0x05;
            a ^= 1; goto md_l2;
        }
        if (c == '"') break;                /* Reject " */
        if (c <= ')') goto md_l1;            /* Accept ! # $ % & ' ( ) */
        if (c <= ',') break;                /* Reject * + , */
        if (c <= '9') goto md_l1;            /* Accept - 0-9 */
        if (c <= '?') break;                /* Reject : ; < = > ? */
        if (!(a & 1)) {    /* These checks are not applied to S-JIS 2nd byte */
            if (c == '|') break;            /* Reject | */
            if (c >= '[' && c <= ']') break;/* Reject [ \ ] */
            if (_USE_NTFLAG && c >= 'A' && c <= 'Z')
                (t == 8) ? (b &= ~0x08) : (b &= ~0x10);
            if (c >= 'a' && c <= 'z') {        /* Convert to upper case */
                c -= 0x20;
                if (_USE_NTFLAG) (t == 8) ? (a |= 0x08) : (a |= 0x10);
            }
        }
    md_l1:
        a &= ~1;
    md_l2:
        if (n >= t) break;
        dirname[n++] = c;
    }
    return 1;
}




/*-----------------------------------------------------------------------*/
/* Trace a file path                                                     */
/*-----------------------------------------------------------------------*/

static
FRESULT trace_path (    /* FR_OK(0): successful, !=0: error code */
    DIR *dirobj,        /* Pointer to directory object to return last directory */
    char *fn,            /* Pointer to last segment name to return {file(8),ext(3),attr(1)} */
    const char *path,    /* Full-path string to trace a file or directory */
    unsigned char **dir            /* Directory pointer in Win[] to retutn */
)
{
    unsigned int clust;
    char ds;
    unsigned char *dptr = 0;
    FATFS *fs = &g_FatFs;//dirobj->fs;    /* Get logical drive from the given DIR structure */

    /* Initialize directory object */
    clust = fs->dirbase;
    if (fs->fs_type == FS_FAT32) {
        dirobj->clust = dirobj->sclust = clust;
        dirobj->sect = clust2sect(fs, clust);
    } else {
        dirobj->clust = dirobj->sclust = 0;
        dirobj->sect = clust;
    }
    dirobj->index = 0;

    if (*path == '\0') {                    /* Null path means the root directory */
        *dir = 0; return FR_OK;
    }

    for (;;) {
        ds = make_dirfile(&path, fn);            /* Get a paragraph into fn[] */
        if (ds == 1) return FR_INVALID_NAME;
        for (;;) {
            if (!move_window(fs, dirobj->sect)) return FR_RW_ERROR;
            dptr = &g_FatFs.win[(dirobj->index & ((S_SIZ - 1) / 32)) * 32];    /* Pointer to the directory entry */
            if (dptr[DIR_Name] == 0)                        /* Has it reached to end of dir? */
                return !ds ? FR_NO_FILE : FR_NO_PATH;
            if (dptr[DIR_Name] != 0xE5                        /* Matched? */
                && !(dptr[DIR_Attr] & AM_VOL)
                && !memcmp(&dptr[DIR_Name], fn, 8+3) ) break;
            if (!next_dir_entry(dirobj))                    /* Next directory pointer */
                return !ds ? FR_NO_FILE : FR_NO_PATH;
        }
        if (!ds) { *dir = dptr; return FR_OK; }                /* Matched with end of path */
        if (!(dptr[DIR_Attr] & AM_DIR)) return FR_NO_PATH;    /* Cannot trace because it is a file */
        clust = ((unsigned int)LD_WORD(&dptr[DIR_FstClusHI]) << 16) | LD_WORD(&dptr[DIR_FstClusLO]); /* Get cluster# of the directory */
        dirobj->clust = dirobj->sclust = clust;                /* Restart scanning at the new directory */
        dirobj->sect = clust2sect(fs, clust);
        dirobj->index = 2;
    }
}




/*-----------------------------------------------------------------------*/
/* Reserve a directory entry                                             */
/*-----------------------------------------------------------------------*/

static
FRESULT reserve_direntry (    /* FR_OK: successful, FR_DENIED: no free entry, FR_RW_ERROR: a disk error occured */
    DIR *dirobj,            /* Target directory to create new entry */
    unsigned char **dir                /* Pointer to pointer to created entry to retutn */
)
{
    unsigned int clust, sector;
    unsigned char c, n, *dptr;
    FATFS *fs = &g_FatFs;//dirobj->fs;


    /* Re-initialize directory object */
    clust = dirobj->sclust;
    if (clust) {    /* Dyanmic directory table */
        dirobj->clust = clust;
        dirobj->sect = clust2sect(fs, clust);
    } else {        /* Static directory table */
        dirobj->sect = fs->dirbase;
    }
    dirobj->index = 0;

    do {
        if (!move_window(fs, dirobj->sect)) return FR_RW_ERROR;
        dptr = &g_FatFs.win[(dirobj->index & ((S_SIZ - 1) / 32)) * 32];    /* Pointer to the directory entry */
        c = dptr[DIR_Name];
        if (c == 0 || c == 0xE5) {            /* Found an empty entry! */
            *dir = dptr; return FR_OK;
        }
    } while (next_dir_entry(dirobj));                /* Next directory pointer */
    /* Reached to end of the directory table */

    /* Abort when static table or could not stretch dynamic table */
    if (!clust || !(clust = create_chain(fs, dirobj->clust))) return FR_DENIED;
    if (clust == 1 || !move_window(fs, 0)) return FR_RW_ERROR;

    fs->winsect = sector = clust2sect(fs, clust);        /* Cleanup the expanded table */
    memset(g_FatFs.win, 0, S_SIZ);
    for (n = fs->sects_clust; n; n--) {
        if (disk_write( g_FatFs.win, sector, 1) != RES_OK)
            return FR_RW_ERROR;
        sector++;
    }
    fs->winflag = 1;
    *dir = g_FatFs.win;
    return FR_OK;
}




/*-----------------------------------------------------------------------*/
/* Load boot record and check if it is a FAT boot record                 */
/*-----------------------------------------------------------------------*/

static
unsigned char check_fs (        /* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record or error */
    unsigned int sect        /* Sector# (lba) to check if it is a FAT boot record or not */
)
{
    
	if (disk_read(g_FatFs.win, sect, 1) != RES_OK)    /* Load boot record */
        return 2;
    if (LD_WORD(&g_FatFs.win[BS_55AA]) != 0xAA55)                /* Check record signature (always offset 510) */
        return 2;

    if (!memcmp(&g_FatFs.win[BS_FilSysType], "FAT", 3))            /* Check FAT signature */
        return 0;
    if (!memcmp(&g_FatFs.win[BS_FilSysType32], "FAT32", 5) && !(g_FatFs.win[BPB_ExtFlags] & 0x80))
        return 0;

    return 1;
}




/*-----------------------------------------------------------------------*/
/* Make sure that the file system is valid                               */
/*-----------------------------------------------------------------------*/

static
FRESULT auto_mount (        /* FR_OK(0): successful, !=0: any error occured */
    const char **path        /* Pointer to pointer to the path name (drive number) */
)
{
    unsigned char fmt, *tbl; //drv, 
    unsigned char stat;
    unsigned int bootsect, fatsize, totalsect, maxclust;
    const char *p = *path;


    /* Get drive number from the path name */
    while (*p == ' ') p++;        /* Strip leading spaces */
    //drv = p[0] - '0';            /* Is there a drive number? */
    //if (drv <= 9 && p[1] == ':')
    //    p += 2;            /* Found a drive number, get and strip it */
    //else
    //drv = 0;        /* No drive number is given, select drive 0 in default */
    //if (*p == '/') p++;    /* Strip heading slash */
    *path = p;            /* Return pointer to the path name */


    /* Check if the logical drive has been mounted or not */
    if (g_FatFs.fs_type) {
        stat = disk_status();
        if (!(stat & STA_NOINIT))                 /* If the physical drive is kept initialized */
            return FR_OK;                        /* The file system object is valid */
    }

    /* The logical drive has not been mounted, following code attempts to mount the logical drive */

    memset((void*)&g_FatFs, 0, sizeof(FATFS));        /* Clean-up the file system object */
    stat = disk_initialize();    /* Initialize low level disk I/O layer */
    if (stat & STA_NOINIT)                /* Check if the drive is ready */
	{
        printf("not ready 1\r\n");
		return FR_NOT_READY;
	}
    fmt = check_fs(bootsect = 0);    /* Check sector 0 as an SFD format */
    if (fmt == 1) {                        /* Not a FAT boot record, it may be patitioned */
		//printf("fmt == 1\r\n");// this is true
		/* Check a partition listed in top of the partition table */
	    //drv = 0;        /* No drive number is given, select drive 0 in default */
        //tbl = &g_FatFs.win[MBR_Table + LD2PT(drv) * 16];    /* Partition table */
        tbl = &g_FatFs.win[MBR_Table];    /* Partition table */
        if (tbl[4]) {                                /* Is the partition existing? */
            bootsect = LD_DWORD(&tbl[8]);            /* Partition offset in LBA */
            fmt = check_fs(bootsect);            /* Check the partition */
        }
    }
    if (fmt || LD_WORD(&g_FatFs.win[BPB_BytsPerSec]) != S_SIZ)    /* No valid FAT patition is found */
        return FR_NO_FILESYSTEM;

    /* Initialize the file system object */
    fatsize = LD_WORD(&g_FatFs.win[BPB_FATSz16]);            /* Number of sectors per FAT */
    if (!fatsize) fatsize = LD_DWORD(&g_FatFs.win[BPB_FATSz32]);
    g_FatFs.sects_fat = fatsize;
    g_FatFs.n_fats = g_FatFs.win[BPB_NumFATs];                    /* Number of FAT copies */
    fatsize *= g_FatFs.n_fats;                                /* (Number of sectors in FAT area) */
    g_FatFs.fatbase = bootsect + LD_WORD(&g_FatFs.win[BPB_RsvdSecCnt]); /* FAT start sector (lba) */
    g_FatFs.sects_clust = g_FatFs.win[BPB_SecPerClus];            /* Number of sectors per cluster */
    g_FatFs.n_rootdir = LD_WORD(&g_FatFs.win[BPB_RootEntCnt]);    /* Nmuber of root directory entries */
    totalsect = LD_WORD(&g_FatFs.win[BPB_TotSec16]);        /* Number of sectors on the file system */
    if (!totalsect) totalsect = LD_DWORD(&g_FatFs.win[BPB_TotSec32]);
    g_FatFs.max_clust = maxclust = (totalsect                /* Last cluster# + 1 */
        - LD_WORD(&g_FatFs.win[BPB_RsvdSecCnt]) - fatsize - g_FatFs.n_rootdir / (S_SIZ/32)
        ) / g_FatFs.sects_clust + 2;

    fmt = FS_FAT12;                                        /* Determine the FAT sub type */
    if (maxclust > 0xFF7) fmt = FS_FAT16;
    if (maxclust > 0xFFF7) fmt = FS_FAT32;
    g_FatFs.fs_type = fmt;

    if (fmt == FS_FAT32)
        g_FatFs.dirbase = LD_DWORD(&g_FatFs.win[BPB_RootClus]);    /* Root directory start cluster */
    else
        g_FatFs.dirbase = g_FatFs.fatbase + fatsize;            /* Root directory start sector (lba) */
    g_FatFs.database = g_FatFs.fatbase + fatsize + g_FatFs.n_rootdir / (S_SIZ/32);    /* Data start sector (lba) */

    g_FatFs.free_clust = 0xFFFFFFFF;
    g_FatFs.id = ++fsid;                                    /* File system mount ID */
    return FR_OK;


}




/*-----------------------------------------------------------------------*/
/* Check if the file/dir object is valid or not                          */
/*-----------------------------------------------------------------------*/

static
FRESULT validate (void)       /* FR_OK(0): The object is valid, !=0: Not valid */
{
    if (g_FatFs.id != g_FileObject.id)
        return FR_INVALID_OBJECT;
    if (disk_status() & STA_NOINIT)
	{
        printf("not ready 2\r\n");
        return FR_NOT_READY;
	}
    return FR_OK;
}




/*--------------------------------------------------------------------------

   Public Functions

--------------------------------------------------------------------------*/



/*-----------------------------------------------------------------------*/
/* Mount/Unmount a Locical Drive                                         */
/*-----------------------------------------------------------------------*/

FRESULT file_mount ()
{
	memset((void*)&g_FatFs, 0, sizeof(FATFS));
	g_FileSystemMounted = 1;
    return FR_OK;
}




/*-----------------------------------------------------------------------*/
/* Open or Create a File                                                 */
/*-----------------------------------------------------------------------*/

FRESULT file_open (
    const char *path,    /* Pointer to the file name */
    unsigned char mode            /* Access mode and file open mode flags */
)
{
    FRESULT res;
    unsigned char *dir;
    DIR dirobj;
    char fn[8+3+1];

// TO DO fix NULL
    g_FileObject.fs = 0; //NULL
    mode &= (FA_READ|FA_WRITE|FA_CREATE_ALWAYS|FA_OPEN_ALWAYS|FA_CREATE_NEW);
    res = auto_mount(&path);
    if (res != FR_OK)
	{
		//printf("fail 1\r\n");
		return res;
	}

    /* Trace the file path */
    res = trace_path(&dirobj, fn, path, &dir);

    /* Create or Open a file */
    if (mode & (FA_CREATE_ALWAYS|FA_OPEN_ALWAYS|FA_CREATE_NEW)) {
        unsigned int ps, rs;
        if (res != FR_OK) {        /* No file, create new */
            if (res != FR_NO_FILE)
			{
				//printf("fail 2\r\n");
				return res;
			}
            res = reserve_direntry(&dirobj, &dir);
            if (res != FR_OK)
			{
				//printf("fail 3\r\n");
				return res;
			}
			
            memset(dir, 0, 32);                        /* Initialize the new entry with open name */
            memcpy(&dir[DIR_Name], fn, 8+3);
            dir[DIR_NTres] = fn[11];
            mode |= FA_CREATE_ALWAYS;
        }
        else {                    /* Any object is already existing */
            if (mode & FA_CREATE_NEW)            /* Cannot create new */
			{
				//printf("fail 4\r\n");
				return FR_EXIST;
			}
            if (dir == 0 || (dir[DIR_Attr] & (AM_RDO|AM_DIR)))    /* Cannot overwrite it (R/O or DIR) */
			{
				//printf("fail 5\r\n");
				return FR_DENIED;
			}
            if (mode & FA_CREATE_ALWAYS) {        /* Resize it to zero if needed */
                rs = ((unsigned int)LD_WORD(&dir[DIR_FstClusHI]) << 16) | LD_WORD(&dir[DIR_FstClusLO]);    /* Get start cluster */
                ST_WORD(&dir[DIR_FstClusHI], 0);    /* cluster = 0 */
                ST_WORD(&dir[DIR_FstClusLO], 0);
                ST_DWORD(&dir[DIR_FileSize], 0);    /* size = 0 */
                g_FatFs.winflag = 1;
                ps = g_FatFs.winsect;                /* Remove the cluster chain */
                if (!remove_chain(&g_FatFs, rs) || !move_window(&g_FatFs, ps))
				{
					//printf("fail 6\r\n");
					return FR_RW_ERROR;
				}
                g_FatFs.last_clust = rs - 1;        /* Reuse the cluster hole */
            }
        }
        if (mode & FA_CREATE_ALWAYS) {
            dir[DIR_Attr] = AM_ARC;                /* New attribute */
            ps = get_fattime();
            ST_DWORD(&dir[DIR_WrtTime], ps);    /* Updated time */
            ST_DWORD(&dir[DIR_CrtTime], ps);    /* Created time */
            g_FatFs.winflag = 1;
        }
    }
    /* Open an existing file */
    else {
		//printf("else\r\n");
        if (res != FR_OK)
			return res;        /* Trace failed */
        if (dir == 0 || (dir[DIR_Attr] & AM_DIR))    /* It is a directory */
            return FR_NO_FILE;
        if ((mode & FA_WRITE) && (dir[DIR_Attr] & AM_RDO)) /* R/O violation */
            return FR_DENIED;
    }

    g_FileObject.dir_sect = g_FatFs.winsect;            /* Pointer to the directory entry */
    g_FileObject.dir_ptr = dir;
    g_FileObject.flag = mode;                    /* File access mode */
    g_FileObject.org_clust =                        /* File start cluster */
        ((unsigned int)LD_WORD(&dir[DIR_FstClusHI]) << 16) | LD_WORD(&dir[DIR_FstClusLO]);
    g_FileObject.fsize = LD_DWORD(&dir[DIR_FileSize]);    /* File size */
    g_FileObject.fptr = 0;                        /* File ptr */
    g_FileObject.sect_clust = 1;                    /* Sector counter */
    g_FileObject.fs = &g_FatFs; g_FileObject.id = g_FatFs.id;        /* Owner file system object of the file */

    return FR_OK;
}



/*-----------------------------------------------------------------------*/
/* Read File                                                             */
/*-----------------------------------------------------------------------*/

FRESULT file_read (
    void *buff,        /* Pointer to data buffer */
    unsigned short btr,        /* Number of bytes to read */
    unsigned short *br        /* Pointer to number of bytes read */
)
{
    unsigned int clust, sect, remain;
    unsigned short rcnt;
    unsigned char cc, *rbuff = buff;
    FRESULT res;
    FATFS *fs = g_FileObject.fs;

    *br = 0;
    res = validate();                        /* Check validity of the object */
    if (res) return res;

    if (g_FileObject.flag & FA__ERROR) return FR_RW_ERROR;    /* Check error flag */
    if (!(g_FileObject.flag & FA_READ)) return FR_DENIED;    /* Check access mode */
    remain = g_FileObject.fsize - g_FileObject.fptr;
    if (btr > remain) btr = (unsigned short)remain;            /* Truncate read count by number of bytes left */

    for ( ;  btr;                                    /* Repeat until all data transferred */
        rbuff += rcnt, g_FileObject.fptr += rcnt, *br += rcnt, btr -= rcnt) {
        if ((g_FileObject.fptr & (S_SIZ - 1)) == 0) {        /* On the sector boundary */
            if (--g_FileObject.sect_clust) {                    /* Decrement left sector counter */
                sect = g_FileObject.curr_sect + 1;            /* Get current sector */
            } else {                                /* On the cluster boundary, get next cluster */
                clust = (g_FileObject.fptr == 0) ?
                    g_FileObject.org_clust : get_cluster(fs, g_FileObject.curr_clust);
                if (clust < 2 || clust >= fs->max_clust)
                    goto fr_error;
                g_FileObject.curr_clust = clust;                /* Current cluster */
                sect = clust2sect(fs, clust);        /* Get current sector */
                g_FileObject.sect_clust = fs->sects_clust;    /* Re-initialize the left sector counter */
            }
            if (g_FileObject.flag & FA__DIRTY) {                /* Flush file I/O buffer if needed */
                if (disk_write( g_FileObject.buffer, g_FileObject.curr_sect, 1) != RES_OK)
                    goto fr_error;
                g_FileObject.flag &= ~FA__DIRTY;
            }
            g_FileObject.curr_sect = sect;                    /* Update current sector */
            cc = btr / S_SIZ;                        /* When left bytes >= S_SIZ, */
            if (cc) {                                /* Read maximum contiguous sectors directly */
                if (cc > g_FileObject.sect_clust) cc = g_FileObject.sect_clust;
                if (disk_read( rbuff, sect, cc) != RES_OK)
                    goto fr_error;
                g_FileObject.sect_clust -= cc - 1;
                g_FileObject.curr_sect += cc - 1;
                rcnt = cc * S_SIZ; continue;
            }
            if (disk_read( g_FileObject.buffer, sect, 1) != RES_OK)    /* Load the sector into file I/O buffer */
                goto fr_error;
        }
        rcnt = S_SIZ - ((unsigned short)g_FileObject.fptr & (S_SIZ - 1));                /* Copy fractional bytes from file I/O buffer */
        if (rcnt > btr) rcnt = btr;
        memcpy(rbuff, &g_FileObject.buffer[g_FileObject.fptr & (S_SIZ - 1)], rcnt);
    }

    return FR_OK;

fr_error:    /* Abort this file due to an unrecoverable error */
    g_FileObject.flag |= FA__ERROR;
    return FR_RW_ERROR;
}


/*-----------------------------------------------------------------------*/
/* Clean-up cached data                                                  */
/*-----------------------------------------------------------------------*/

static
FRESULT sync (void)            /* FR_OK: successful, FR_RW_ERROR: failed */
{
    g_FatFs.winflag = 1;
    if (!move_window(&g_FatFs, 0)) return FR_RW_ERROR;
    if (disk_ioctl( CTRL_SYNC, 0) != RES_OK) return FR_RW_ERROR;
    return FR_OK;
}


/*-----------------------------------------------------------------------*/
/* Synchronize between File and Disk                                     */
/*-----------------------------------------------------------------------*/

FRESULT file_sync ()
{
    unsigned int tim;
    unsigned char *dir;
    FRESULT res;


    res = validate();            /* Check validity of the object */
    if (res == FR_OK) {
        if (g_FileObject.flag & FA__WRITTEN) {    /* Has the file been written? */
            /* Write back data buffer if needed */
            if (g_FileObject.flag & FA__DIRTY) {
                if (disk_write( g_FileObject.buffer, g_FileObject.curr_sect, 1) != RES_OK)
				{
                    return FR_RW_ERROR;
				}
                g_FileObject.flag &= ~FA__DIRTY;
            }
            /* Update the directory entry */
            if (!move_window(&g_FatFs, g_FileObject.dir_sect))
                return FR_RW_ERROR;
            dir = g_FileObject.dir_ptr;
            dir[DIR_Attr] |= AM_ARC;                        /* Set archive bit */
            ST_DWORD(&dir[DIR_FileSize], g_FileObject.fsize);        /* Update file size */
            ST_WORD(&dir[DIR_FstClusLO], g_FileObject.org_clust);    /* Update start cluster */
            ST_WORD(&dir[DIR_FstClusHI], g_FileObject.org_clust >> 16);
            tim = get_fattime();                    /* Updated time */
            ST_DWORD(&dir[DIR_WrtTime], tim);
            g_FileObject.flag &= ~FA__WRITTEN;
            //res = sync(fs);
            res = sync();
        }
    }
    return res;
}

//#define SAVE_FILE_ON_WRITE

/*-----------------------------------------------------------------------*/
/* Write File                                                            */
/*-----------------------------------------------------------------------*/

FRESULT file_write (
    const void *buff,    /* Pointer to the data to be written */
    unsigned short btw,            /* Number of bytes to write */
    unsigned short *bw            /* Pointer to number of bytes written */
)
{
    unsigned int clust, sect;
    unsigned short wcnt;
    unsigned char cc;
    FRESULT res;
    const unsigned char *wbuff = buff;
    FATFS *fs = g_FileObject.fs;

    *bw = 0;
    res = validate();                        /* Check validity of the object */
    if (res) return res;
    if (g_FileObject.flag & FA__ERROR) return FR_RW_ERROR;    /* Check error flag */
    if (!(g_FileObject.flag & FA_WRITE)) return FR_DENIED;    /* Check access mode */
    if (g_FileObject.fsize + btw < g_FileObject.fsize) return FR_OK;    /* File size cannot reach 4GB */

    for ( ;  btw;                                    /* Repeat until all data transferred */
        wbuff += wcnt, g_FileObject.fptr += wcnt, *bw += wcnt, btw -= wcnt) {
        if ((g_FileObject.fptr & (S_SIZ - 1)) == 0) {        /* On the sector boundary */
            if (--g_FileObject.sect_clust) {                    /* Decrement left sector counter */
                sect = g_FileObject.curr_sect + 1;            /* Get current sector */
            } else {                                /* On the cluster boundary, get next cluster */
                if (g_FileObject.fptr == 0) {                /* Is top of the file */
                    clust = g_FileObject.org_clust;
                    if (clust == 0)                    /* No cluster is created yet */
                        g_FileObject.org_clust = clust = create_chain(fs, 0);    /* Create a new cluster chain */
                } else {                            /* Middle or end of file */
                    clust = create_chain(fs, g_FileObject.curr_clust);            /* Trace or streach cluster chain */
                }
                if (clust == 0) break;                /* Disk full */
                if (clust == 1 || clust >= fs->max_clust) goto fw_error;
                g_FileObject.curr_clust = clust;                /* Current cluster */
                sect = clust2sect(fs, clust);        /* Get current sector */
                g_FileObject.sect_clust = fs->sects_clust;    /* Re-initialize the left sector counter */
            }
            if (g_FileObject.flag & FA__DIRTY) {                /* Flush file I/O buffer if needed */
                if (disk_write( g_FileObject.buffer, g_FileObject.curr_sect, 1) != RES_OK)
                    goto fw_error;
//printf("disk_write from FA__DIRTY\r\n");
                g_FileObject.flag &= ~FA__DIRTY;
#ifdef SAVE_FILE_ON_WRITE    			
				res = file_sync();
    			if (res != FR_OK)
    			    return res;
#endif
            }
            g_FileObject.curr_sect = sect;                    /* Update current sector */
            cc = btw / S_SIZ;                        /* When left bytes >= S_SIZ, */
            if (cc) {                                /* Write maximum contiguous sectors directly */
                if (cc > g_FileObject.sect_clust) cc = g_FileObject.sect_clust;
                if (disk_write( wbuff, sect, cc) != RES_OK)
                    goto fw_error;
//printf("disk_write from cc\r\n");
                g_FileObject.sect_clust -= cc - 1;
                g_FileObject.curr_sect += cc - 1;
                wcnt = cc * S_SIZ; continue;
            }
            if (g_FileObject.fptr < g_FileObject.fsize &&              /* Fill sector buffer with file data if needed */
                disk_read( g_FileObject.buffer, sect, 1) != RES_OK)
                    goto fw_error;
        }
        wcnt = S_SIZ - ((unsigned short)g_FileObject.fptr & (S_SIZ - 1));    /* Copy fractional bytes to file I/O buffer */
        if (wcnt > btw) wcnt = btw;
        memcpy(&g_FileObject.buffer[g_FileObject.fptr & (S_SIZ - 1)], (void *)wbuff, wcnt);
        g_FileObject.flag |= FA__DIRTY;
    }

    if (g_FileObject.fptr > g_FileObject.fsize) g_FileObject.fsize = g_FileObject.fptr;    /* Update file size if needed */
    g_FileObject.flag |= FA__WRITTEN;                        /* Set file changed flag */
//printf("write flag now 0x%X\r\n",g_FileObject.flag);
    return FR_OK;

fw_error:    /* Abort this file due to an unrecoverable error */
    g_FileObject.flag |= FA__ERROR;
    return FR_RW_ERROR;

}



/*-----------------------------------------------------------------------*/
/* Close File                                                            */
/*-----------------------------------------------------------------------*/

FRESULT file_close ()
{
    FRESULT res;

    res = file_sync();
    if (res == FR_OK)
        g_FileObject.fs = 0;
    return res;

}



/*-----------------------------------------------------------------------*/
/* Seek File R/W Pointer                                                 */
/*-----------------------------------------------------------------------*/

FRESULT file_lseek (
    unsigned int ofs        /* File pointer from top of file */
)
{
    unsigned int clust, csize;
    unsigned char csect;
    FRESULT res;
    FATFS *fs = g_FileObject.fs;


    res = validate();            /* Check validity of the object */
    if (res) return res;
    if (g_FileObject.flag & FA__ERROR) return FR_RW_ERROR;
    if (g_FileObject.flag & FA__DIRTY) {            /* Write-back dirty buffer if needed */
        if (disk_write( g_FileObject.buffer, g_FileObject.curr_sect, 1) != RES_OK)
            goto fk_error;
        g_FileObject.flag &= ~FA__DIRTY;
    }
    if (ofs > g_FileObject.fsize && !(g_FileObject.flag & FA_WRITE))
        ofs = g_FileObject.fsize;
    g_FileObject.fptr = 0; g_FileObject.sect_clust = 1;        /* Set file R/W pointer to top of the file */

    /* Move file R/W pointer if needed */
    if (ofs) {
        clust = g_FileObject.org_clust;    /* Get start cluster */
        if (!clust) {            /* If the file does not have a cluster chain, create new cluster chain */
            clust = create_chain(fs, 0);
            if (clust == 1) goto fk_error;
            g_FileObject.org_clust = clust;
        }
        if (clust) {            /* If the file has a cluster chain, it can be followed */
            csize = (unsigned int)fs->sects_clust * S_SIZ;        /* Cluster size in unit of byte */
            for (;;) {                                    /* Loop to skip leading clusters */
                g_FileObject.curr_clust = clust;                    /* Update current cluster */
                if (ofs <= csize) break;
                if (g_FileObject.flag & FA_WRITE)                /* Check if in write mode or not */
                    clust = create_chain(fs, clust);    /* Force streached if in write mode */
                else
                    clust = get_cluster(fs, clust);        /* Only follow cluster chain if not in write mode */
                if (clust == 0) {                        /* Stop if could not follow the cluster chain */
                    ofs = csize; break;
                }
                if (clust == 1 || clust >= fs->max_clust) goto fk_error;
                g_FileObject.fptr += csize;                        /* Update R/W pointer */
                ofs -= csize;
            }
            csect = (unsigned char)((ofs - 1) / S_SIZ);            /* Sector offset in the cluster */
            g_FileObject.curr_sect = clust2sect(fs, clust) + csect;    /* Current sector */
            if ((ofs & (S_SIZ - 1)) &&                    /* Load current sector if needed */
                disk_read( g_FileObject.buffer, g_FileObject.curr_sect, 1) != RES_OK)
                goto fk_error;
            g_FileObject.sect_clust = fs->sects_clust - csect;    /* Left sector counter in the cluster */
            g_FileObject.fptr += ofs;                            /* Update file R/W pointer */
        }
    }
    if ((g_FileObject.flag & FA_WRITE) && g_FileObject.fptr > g_FileObject.fsize) {    /* Set updated flag if in write mode */
        g_FileObject.fsize = g_FileObject.fptr;
        g_FileObject.flag |= FA__WRITTEN;
    }

    return FR_OK;

fk_error:    /* Abort this file due to an unrecoverable error */
    g_FileObject.flag |= FA__ERROR;
    return FR_RW_ERROR;

}

FRESULT file_opendir ()
{
	FRESULT res;
	unsigned int clust;
	char c[1];
	char *path = (char *)c;
	
	c[0] = '\0';

	res = auto_mount((const char **)&path);
	if (res != FR_OK) return res;

	/* Initialize directory object */
	clust = g_FatFs.dirbase;

	if (g_FatFs.fs_type == FS_FAT32) {
		g_DirObject.clust = g_DirObject.sclust = clust;
		g_DirObject.sect = clust2sect(&g_FatFs, clust);
	} else {
		g_DirObject.clust = g_DirObject.sclust = 0;
		g_DirObject.sect = clust;
	}
	g_DirObject.index = 0;
	return res;
}


/*-----------------------------------------------------------------------*/
/* Read Directory Entry in Sequense									  */
/*-----------------------------------------------------------------------*/

FRESULT file_readdir (int num
)
{
	unsigned char *dir;
	unsigned char n, c, a;
	int p, i;

	FRESULT res;
	res = file_opendir();
	if(res){
		//printf("file_opendir failed %d\r\n",res);
		return res;
	}
	i = 0;

	g_FileInfo.fname[0] = 0;

	while (g_DirObject.sect ) {
		if (!move_window(&g_FatFs, g_DirObject.sect))
			return FR_RW_ERROR;
		dir = &g_FatFs.win[(g_DirObject.index & ((S_SIZ - 1) >> 5)) * 32];	/* pointer to the directory entry */
		c = *dir;
		
		if (c == 0) break;								/* Has it reached to end of dir? */
		if (c != 0xE5 && !(dir[DIR_Attr] & AM_VOL)){		/* Is it a valid entry? */
			if(i==num){
				//get_fileinfo(dir);
				p=0;
				a = _USE_NTFLAG ? dir[DIR_NTres] : 0;		/* NT flag */
				for (n = 0; n < 8; n++) {	/* Convert file name (body) */
					c = dir[n];

					if (c == ' ') break;
					if (c == 0x05) c = 0xE5;
					if (a & 0x08 && c >= 'A' && c <= 'Z') c += 0x20;
					g_FileInfo.fname[p++]=c; //*p++ = c;
				}
				if (dir[8] != ' ') {		/* Convert file name (extension) */
					g_FileInfo.fname[p++]='.'; //*p++ = '.';
					for (n = 8; n < 11; n++) {
						c = dir[n];
						if (c == ' ') break;
						if (a & 0x10 && c >= 'A' && c <= 'Z') c += 0x20;
						g_FileInfo.fname[p++]=c; //*p++ = c;
					}
				}
				g_FileInfo.fname[p] = '\0'; //*p = '\0';

				g_FileInfo.fattrib = dir[DIR_Attr];					/* Attribute */
				g_FileInfo.fsize = LD_DWORD(&dir[DIR_FileSize]);	/* Size */
				g_FileInfo.fdate = LD_WORD(&dir[DIR_WrtDate]);		/* Date */
				g_FileInfo.ftime = LD_WORD(&dir[DIR_WrtTime]);		/* Time */
			}
			i++;
		}
		if (!next_dir_entry(&g_DirObject))g_DirObject.sect = 0;	/* Next entry */

		if (g_FileInfo.fname[0]) break;						/* Found valid entry */
	}

	return FR_OK;
}

