#ifndef MEX_H_USEFUL
#define MEX_H_USEFUL

#include <stdarg.h>

#include "structs.h"
#include "datatypes.h"
#include "fighter.h"
#include "devtext.h"

typedef s64 OSTime;

// OS Macros
#define OSRoundUp32B(x) (((u32)(x) + 32 - 1) & ~(32 - 1))
#define OSRoundDown32B(x) (((u32)(x)) & ~(32 - 1))
#define OSRoundUp512B(x) (((u32)(x) + 512 - 1) & ~(512 - 1)) // using this for card reads
#define OSRoundDown512B(x) (((u32)(x)) & ~(512 - 1))         // using this for card reads
#define OSTicksToMilliseconds(ticks) ((ticks) / ((os_info->bus_clock / 4) / 1000))
#define OSTicksToMicroseconds(ticks) ((ticks) / ((os_info->bus_clock / 4) / 1000000))
#define BitCheck(num, bit) !!((num) & (1 << (bit))) // returns 0 or 1
#define BitCheck(num, bit) !!((num) & (1 << (bit))) // returns 0 or 1
#define __FILENAME__ (strrchr(__FILE__, '\\') ? strrchr(__FILE__, '\\') + 1 : __FILE__)
#define assert(msg, ...) __assert(__FILENAME__, __LINE__, msg)
#define divide_roundup(dividend, divisor) ((dividend + (divisor / 2)) / divisor)
#define MTXDegToRad(a) ((a)*0.01745329252f)
#define MTXRadToDeg(a) ((a)*57.29577951f)
#define SYS_BASE_CACHED (0x80000000)
#define SYS_BASE_UNCACHED (0xC0000000)
#define MEM_VIRTUAL_TO_PHYSICAL(x) (((u32)(x)) & ~SYS_BASE_UNCACHED) /*!< Cast virtual address to physical address, e.g. 0x8xxxxxxx -> 0x0xxxxxxx */
#define MEM_PHYSICAL_TO_K0(x) (void *)((u32)(x) + SYS_BASE_CACHED)   /*!< Cast physical address to cached virtual address, e.g. 0x0xxxxxxx -> 0x8xxxxxxx */

/** Console Definitions */ //
#define OS_CONSOLE_RETAIL4 0x00000004
#define OS_CONSOLE_RETAIL3 0x00000003
#define OS_CONSOLE_RETAIL2 0x00000002
#define OS_CONSOLE_RETAIL1 0x00000001
#define OS_CONSOLE_DEVHW4 0x10000007
#define OS_CONSOLE_DEVHW3 0x10000006
#define OS_CONSOLE_DEVHW2 0x10000005
#define OS_CONSOLE_DEVHW1 0x10000004
#define OS_CONSOLE_MINNOW 0x10000003
#define OS_CONSOLE_ARTHUR 0x10000002
#define OS_CONSOLE_PC_EMULATOR 0x10000001
#define OS_CONSOLE_EMULATOR 0x10000000
#define OS_CONSOLE_DEVELOPMENT 0x10000000 // bit mask

#define CARD_MAX_FILE 127
#define CARD_FILENAME_MAX 32
#define CARD_ICON_MAX 8
#define CARD_COMMENT_SIZE 64
#define CARD_WORKAREA_SIZE (5 * 8 * 1024)
#define CARD_READ_SIZE 512
#define CARD_RESULT_UNLOCKED 1
#define CARD_RESULT_READY 0
#define CARD_RESULT_BUSY -1
#define CARD_RESULT_WRONGDEVICE -2
#define CARD_RESULT_NOCARD -3
#define CARD_RESULT_NOFILE -4
#define CARD_RESULT_IOERROR -5
#define CARD_RESULT_BROKEN -6
#define CARD_RESULT_EXIST -7
#define CARD_RESULT_NOENT -8
#define CARD_RESULT_INSSPACE -9
#define CARD_RESULT_NOPERM -10
#define CARD_RESULT_LIMIT -11
#define CARD_RESULT_NAMETOOLONG -12
#define CARD_RESULT_ENCODING -13
#define CARD_RESULT_CANCELED -14
#define CARD_RESULT_FATAL_ERROR -128

// VI
#define VI_XFBMODE_SF 0
#define VI_XFBMODE_DF 1
#define VI_MAX_WIDTH_NTSC 720
#define VI_MAX_HEIGHT_NTSC 480
#define VI_MAX_WIDTH_PAL 720
#define VI_MAX_HEIGHT_PAL 576
#define VI_MAX_WIDTH_MPAL 720
#define VI_MAX_HEIGHT_MPAL 480
#define VI_MAX_WIDTH_EURGB60 VI_MAX_WIDTH_NTSC
#define VI_MAX_HEIGHT_EURGB60 VI_MAX_HEIGHT_NTSC

#define VI_NTSC 0      /*!< Video standard used in North America and Japan */
#define VI_PAL 1       /*!< Video standard used in Europe */
#define VI_MPAL 2      /*!< Video standard, similar to NTSC, used in Brazil */
#define VI_DEBUG 3     /*!< Video standard, for debugging purpose, used in North America and Japan. Special decoder needed */
#define VI_DEBUG_PAL 4 /*!< Video standard, for debugging purpose, used in Europe. Special decoder needed */
#define VI_EURGB60 5   /*!< RGB 60Hz, 480 lines mode (same timing and aspect ratio as NTSC) used in Europe */

#define VI_INTERLACE 0     /*!< Video mode INTERLACED. */
#define VI_NON_INTERLACE 1 /*!< Video mode NON INTERLACED */
#define VI_PROGRESSIVE 2   /*!< Video mode PROGRESSIVE. Special mode for higher quality */

#define VI_TVMODE(fmt, mode) (((fmt) << 2) + (mode))
#define VI_TVMODE_NTSC_INT VI_TVMODE(VI_NTSC, VI_INTERLACE)
#define VI_TVMODE_NTSC_DS VI_TVMODE(VI_NTSC, VI_NON_INTERLACE)
#define VI_TVMODE_NTSC_PROG VI_TVMODE(VI_NTSC, VI_PROGRESSIVE)
#define VI_TVMODE_PAL_INT VI_TVMODE(VI_PAL, VI_INTERLACE)
#define VI_TVMODE_PAL_DS VI_TVMODE(VI_PAL, VI_NON_INTERLACE)
#define VI_TVMODE_PAL_PROG VI_TVMODE(VI_PAL, VI_PROGRESSIVE)
#define VI_TVMODE_EURGB60_INT VI_TVMODE(VI_EURGB60, VI_INTERLACE)
#define VI_TVMODE_EURGB60_DS VI_TVMODE(VI_EURGB60, VI_NON_INTERLACE)
#define VI_TVMODE_EURGB60_PROG VI_TVMODE(VI_EURGB60, VI_PROGRESSIVE)
#define VI_TVMODE_MPAL_INT VI_TVMODE(VI_MPAL, VI_INTERLACE)
#define VI_TVMODE_MPAL_DS VI_TVMODE(VI_MPAL, VI_NON_INTERLACE)
#define VI_TVMODE_MPAL_PROG VI_TVMODE(VI_MPAL, VI_PROGRESSIVE)
#define VI_TVMODE_DEBUG_INT VI_TVMODE(VI_DEBUG, VI_INTERLACE)
#define VI_TVMODE_DEBUG_PAL_INT VI_TVMODE(VI_DEBUG_PAL, VI_INTERLACE)
#define VI_TVMODE_DEBUG_PAL_DS VI_TVMODE(VI_DEBUG_PAL, VI_NON_INTERLACE)

/*** Structs ***/
struct OSInfo
{
    // info obtained from https://www.gc-forever.com/yagcd/chap4.html#sec4.2.1

    char gameName[4];      // 0x80000000
    char company[2];       // 0x80000004
    u8 disk_id;            // 0x80000006
    u8 disk_version;       // 0x80000007
    u8 is_audiostream;     // 0x80000008
    u8 streambuffer_size;  // 0x80000009
    int xc;                // 0x8000000C
    int x10;               // 0x80000010
    int x14;               // 0x80000014
    int x18;               // 0x80000018
    int dvd_magicword;     // 0x8000001C
    int boot_magicword;    // 0x80000020
    int sys_version;       // 0x80000024
    int mem_size;          // 0x80000028
    int console_type;      // 0x8000002C
    int arena_lo;          // 0x80000030
    int arena_hi;          // 0x80000034
    void *fst;             // 0x80000038
    int fst_maxsize;       // 0x8000003C
    int x40;               // 0x80000040
    int x44;               // 0x80000044
    int x48;               // 0x80000048
    int x4C;               // 0x8000004C
    int x50;               // 0x80000050
    int x54;               // 0x80000054
    int x58;               // 0x80000058
    int x5C;               // 0x8000005C
    int x60;               // 0x80000060
    int x64;               // 0x80000064
    int x68;               // 0x80000068
    int x6C;               // 0x8000006C
    int x70;               // 0x80000070
    int x74;               // 0x80000074
    int x78;               // 0x80000078
    int x7C;               // 0x8000007C
    int x80;               // 0x80000080
    int x84;               // 0x80000084
    int x88;               // 0x80000088
    int x8C;               // 0x8000008C
    int x90;               // 0x80000090
    int x94;               // 0x80000094
    int x98;               // 0x80000098
    int x9C;               // 0x8000009C
    int xA0;               // 0x800000A0
    int xA4;               // 0x800000A4
    int xA8;               // 0x800000A8
    int xAC;               // 0x800000AC
    int xB0;               // 0x800000B0
    int xB4;               // 0x800000B4
    int xB8;               // 0x800000B8
    int xBC;               // 0x800000BC
    int xC0;               // 0x800000C0
    int xC4;               // 0x800000C4
    int xC8;               // 0x800000C8
    int tv_mode;           // 0x800000CC
    int aram_size;         // 0x800000D0
    int xD4;               // 0x800000D4
    int xD8;               // 0x800000D8
    int xDC;               // 0x800000DC
    int xE0;               // 0x800000E0
    int curr_osthread;     // 0x800000E4
    int xE8;               // 0x800000E8
    int xEC;               // 0x800000EC
    int simulated_memsize; // 0x800000F0
    void *dvd_BI2;         // 0x800000F4
    int bus_clock;         // 0x800000F8
    int cpu_clock;         // 0x800000FC
};
struct OSCalendarTime
{
    int sec;  // seconds after the minute [0, 61]
    int min;  // minutes after the hour [0, 59]
    int hour; // hours since midnight [0, 23]
    int mday; // day of the month [1, 31]
    int mon;  // month since January [0, 11]
    int year; // years in AD [1, ...]
    int wday; // days since Sunday [0, 6]
    int yday; // days since January 1 [0, 365]

    int msec; // milliseconds after the second [0,999]
    int usec; // microseconds after the millisecond [0,999]
};
struct OSAlarm
{
    void *cb; // 0x0

    OSTime fire;
    OSAlarm *prev;
    OSAlarm *next;

    // Periodic alarm
    OSTime period;
    OSTime start;
};
struct CARDStat
{
    // read-only (Set by CARDGetStatus)
    char fileName[CARD_FILENAME_MAX];
    u32 length;
    u32 time; // seconds since midnight 01/01/2000
    u8 gameName[4];
    u8 company[2];

    // read/write (Set by CARDGetStatus/CARDSetStatus)
    u8 bannerFormat;
    u32 iconAddr;
    u16 iconFormat;
    u16 iconSpeed;
    u32 commentAddr;

    // read-only (Set by CARDGetStatus)
    u32 offsetBanner;
    u32 offsetBannerTlut;
    u32 offsetIcon[CARD_ICON_MAX];
    u32 offsetIconTlut;
    u32 offsetData;
};
struct CARDFileInfo
{
    s32 chan;
    s32 fileNo;

    s32 offset;
    s32 length;
    u16 iBlock;
    u16 __padding;
};
struct RGB565
{
    unsigned short r : 5;
    unsigned short g : 6;
    unsigned short b : 5;
};
struct MTHPlayParam
{
    int on_frame; // which mth frame to begin applying this frame
    int rate;     // in game frames per mth frame
};
struct MTHHeader
{
    char magic[4]; // 0x0, idk why they call this magic
    int x4;
    int version;        // 0x8
    int bufSize;        // 0xc
    int xSize;          // 0x10
    int ySize;          // 0x14
    int framerate;      //0x18
    int numFrames;      // 0x1c
    int firstFrame;     // 0x20
    int frameOffsets;   // 0x24
    int firstFrameSize; // 0x28
    void *x2c;          // 0x2c
    void *x30;          // 0x30
    void *x34;          // 0x34
    void *x38;          // 0x38
    void *x3c;          // 0x3c
};
struct MTHPlayback
{
    MTHHeader header;
    int numFrames;            // 0x40
    int xSize;                // 0x44
    int ySize;                // 0x48
    void **jpeg_lookup;       // 0x4c
    void *decoded_bright;     // 0x50
    void *decoded_chromeb;    // 0x54
    void *decoded_chromer;    // 0x58
    void *x5c;                // 0x5c
    void *x60;                // 0x60
    void *x64;                // 0x64
    int loop;                 // 0x68
    void *x6c;                // 0x6c
    void *x70;                // 0x70
    void *x74;                // 0x74
    void *x78;                // 0x78
    void *x7c;                // 0x7c
    void *x80;                // 0x80
    void *x84;                // 0x84
    void *x88;                // 0x88
    void *x8c;                // 0x8c
    void *x90;                // 0x90
    void *x94;                // 0x94
    void *x98;                // 0x98
    void *x9c;                // 0x9c
    void *xa0;                // 0xa0
    void *xa4;                // 0xa4
    void *xa8;                // 0xa8
    void *xac;                // 0xac
    void *xb0;                // 0xb0
    void *xb4;                // 0xb4
    void *xb8;                // 0xb8
    void *xbc;                // 0xbc
    void *xc0;                // 0xc0
    void *xc4;                // 0xc4
    void *xc8;                // 0xc8
    void *xcc;                // 0xcc
    void *xd0;                // 0xd0
    void *xd4;                // 0xd4
    void *xd8;                // 0xd8
    void *xdc;                // 0xdc
    void *xe0;                // 0xe0
    void *xe4;                // 0xe4
    void *xe8;                // 0xe8
    void *xec;                // 0xec
    void *xf0;                // 0xf0
    void *xf4;                // 0xf4
    void *xf8;                // 0xf8
    void *xfc;                // 0xfc
    int bufSize;              // 0x100
    int jpeg_cache_num;       // 0x104
    void *x108;               // 0x108
    void *x10c;               // 0x10c
    void *is_loading_frame;   // 0x110
    void *x114;               // 0x114
    void *x118;               // 0x118
    int x11c;                 // 0x11c
    int next_jpeg_offset;     // 0x120, next offset to read on disc
    void *x124;               // 0x124
    int entrynum;             // 0x128
    MTHPlayParam *play_param; // 0x12c
    void *x130;               // 0x130
    void *x134;               // 0x134
    void *x138;               // 0x138
    void *x13c;               // 0x13c
    void *x140;               // 0x140
    void *x144;               // 0x144
    void *x148;               // 0x148
    int power;                // 0x14C
    OSAlarm alarm;            // 0x150
};
struct JPEGHeader
{
    int nextSize;  // 0x0
    int prevSize;  // 0x4
    int imageSize; // 0x8
    int audioSize; // 0xc
};
struct GXRenderModeObj
{
    u32 viTVMode;             // 0x0
    u16 fbWidth;              // 0x4
    u16 efbHeight;            // 0x6
    u16 xfbHeight;            // 0x8
    u16 viXOrigin;            // 0xA
    u16 viYOrigin;            // 0xC
    u16 viWidth;              // 0xE
    u16 viHeight;             // 0x10
    u32 xfbMode;              // 0x14
    u8 field_rendering;       // 0x18
    u8 aa;                    // 0x19
    u8 sample_pattern[12][2]; // 0x1a
    u8 vfilter[7];
} GXRModeObj;

/*** Static Vars ***/
OSInfo *os_info = 0x80000000;

/*** OS Library ***/
int OSGetTick();
u64 OSGetTime();
void OSTicksToCalendarTime(u64 time, OSCalendarTime *td);
u64 cvt_dbl_usll(float num);
void OSCreateAlarm(OSAlarm *alarm);
void OSSetPeriodicAlarm(OSAlarm *alarm, OSTime start, OSTime period, void *handler);
void OSReport(char *, ...);
void __assert(char *file, int line, char *assert);
int OSCheckHeap(int heap);
int OSGetConsoleType();
int DVDConvertPathToEntrynum(char *file);
int DVDWaitForRead();
int File_Read(int entrynum, int file_offset, void *buffer, int length, int flags, int r8, void *cb, int r10);
void memcpy(void *dest, void *source, int size);
void memset(void *dest, int fill, int size);
s32 CARDGetStatus(s32 chan, s32 fileNo, CARDStat *stat);
s32 CARDMountAsync(s32 chan, void *workArea, void *detachCallback, void *attachCallback);
s32 CARDUnmount(s32 chan);
s32 CARDOpen(s32 chan, char *fileName, CARDFileInfo *fileInfo);
s32 CARDClose(CARDFileInfo *fileInfo);
s32 CARDProbeEx(s32 chan, s32 *memSize, s32 *sectorSize);
s32 CARDCheckAsync(s32 chan, void *callback);
s32 CARDFreeBlocks(s32 chan, s32 *byteNotUsed, s32 *filesNotUsed);
s32 CARDDeleteAsync(s32 chan, char *fileName, void *callback);
s32 CARDCreateAsync(s32 chan, char *fileName, u32 size, CARDFileInfo *fileInfo, void *callback);
s32 CARDSetStatusAsync(s32 chan, s32 fileNo, CARDStat *stat, void *callback);
s32 CARDRead(CARDFileInfo *fileInfo, void *buf, s32 length, s32 offset);

void GXSetColor(GXColor *color);
void GXSetZMode(int compare_enable, int func, int update_enable);
void GXSetLineWidth(u8 width, int tex_offsets);
void GXBegin(int type, int vtxfmt, u16 nverts);
void GXEnd();
void GXPixModeSync();
void GXInvalidateTexAll();
void DCFlushRange(void *startAddr, u32 nBytes);
void DCInvalidateRange(void *startAddr, u32 nBytes);
void TRK_FlushCache(void *startAddr, u32 nBytes);
int memcmp(void *buf1, void *buf2, u32 nBytes);
int GXGetTexBufferSize(u16 width, u16 height, u32 format, int mipmap, u8 max_lod);
void GXSetDrawDone();
void GXWaitDrawDone();
void blr();
void blr2();

/*** THP Functions ***/
void MTH_Init(char *filename, void *playback_param, void *buffer, int buffer_size, void *unk);
void MTH_Terminate();
void MTH_Render(GOBJ *gobj, int pass); // 8001f67c
void MTH_Advance();
int MTH_CheckEnd();

/*** HSD Library ***/
int HSD_GetHeapID();
void HSD_SetHeapID(int heap);

/** String Library **/
#define vsprintf(buffer, format, args) _vsprintf(buffer, -1, format, args)
int sprintf(char *s, const char *format, ...);
int _vsprintf(char *str, int unk, const char *format, va_list arg);
int strlen(char *str);
char *strchr(char *str, char c); // searches for the first occurrence of the character c (an unsigned char) in the string pointed to by the argument str.
int strcmp(char *str1, char *str2);
int strncmp(char *str1, char *str2, int size);
char *strcpy(char *dest, char *src);            // copies the string pointed to, by src to dest.
char *strncpy(char *dest, char *src, int size); // copies the string pointed to, by src to dest.
unsigned long int strtoul(const char *str, char **endptr, int base);
char *strcat(s, append) register char *s;
register const char *append;
{
    char *save = s;

    for (; *s; ++s)
        ;
    while (*s++ = *append++)
        ;
    return (save);
}

int SFX_Play(int sfxID);
int SFX_PlayRaw(int sfx, int volume, int pan, int unk, int unk2);
int SFX_PlayCommon(int sfxID);
int SFX_PlayCrowd(int sfxID);
void SFX_StopCrowd();
void SFX_StopAllFighterSFX(FighterData *fighter_data);
void BGM_Play(int hpsID);

void DevelopMode_ResetCursorXY(DevText *text, int x, int y);
void Develop_UpdateMatchHotkeys();

void Wind_StageCreate(Vec3 *pos, int duration, float radius, float lifetime, float angle);
void Wind_FighterCreate(Vec3 *pos, int duration, float radius, float lifetime, float angle);

int Pause_CheckStatus(int type);
#endif