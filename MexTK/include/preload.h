#ifndef MEX_H_PRELOAD
#define MEX_H_PRELOAD

#include "structs.h"
#include "datatypes.h"

struct PreloadChar
{
    int kind;
    u8 costume;
};
struct PreloadTable
{
    int x4;
    u8 xc;
    int stage;               // 0x10
    PreloadChar fighters[8]; // 0x14
    int defrag_num;          // 0x54
};

struct PreloadAllocData
{
    PreloadAllocData *next;
    void *alloc; // 0x4
    int size;    // 0x8
};
struct PreloadEntry
{
    u8 load_state; // 0x0, 0 = none, 1 = queued, 2 = loading, 3 = loaded
    u8 x1;
    s8 heap_id; // 0x2
    u8 x3;
    u8 x4;
    u16 file_entry_num;            // 0x6
    s16 status;                    // 0x8, is -9999 when marked for unload, 9999 when needed
    int file_size;                 // 0xc
    PreloadAllocData *file_data;   // 0x10
    PreloadAllocData *header_data; // 0x14
    int x18;
};

struct Preload
{
    int heap_kind;          // 0x0, copied from current MinorScene struct,
    PreloadTable queued;    // 0x4, modify this to request files to preload
    PreloadTable updated;   // 0x?
    PreloadEntry entry[80]; // 0xac
};

/*** Functions ***/
void Preload_Update();       // checks for new files to preload and begins loading them synchronously
void Preload_Invalidate();   // invalidates cache, this is usually used from scene prep on CSS's
Preload *Preload_GetTable(); // gets preload table

#endif
