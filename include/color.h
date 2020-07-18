#ifndef MEX_H_COLOR
#define MEX_H_COLOR

#include "structs.h"
#include "datatypes.h"

/*** Structs ***/

struct GXColor
{
    u8 r;
    u8 g;
    u8 b;
    u8 a;
};

struct ColorOverlay
{
    int timer;                // 0x0
    int x4;                   // 0x4
    int *ptr1;                // 0x8
    int loop;                 // 0xc
    int *ptr2;                // 0x10
    int x14;                  // 0x14
    int *alloc;               // 0x18
    int x1c;                  // 0x1c
    int x20;                  // 0x20
    int x24;                  // 0x24
    int x28;                  // 0x28
    GXColor hex;              // 0x2C
    float red;                // 0x34
    float blue;               // 0x34
    float green;              // 0x38
    float alpha;              // 0x3C
    float redblink;           // 0x40
    float blueblink;          // 0x44
    float greenblink;         // 0x48
    float alphablink;         // 0x4C
    int x50;                  // 0x50
    int x54;                  // 0x54
    int x58;                  // 0x58
    int x5c;                  // 0x5c
    int x60;                  // 0x60
    int x64;                  // 0x64
    int x68;                  // 0x68
    int x6c;                  // 0x6c
    int x70;                  // 0x70
    int x74;                  // 0x74
    int x78;                  // 0x78
    unsigned char enable : 1; // 0x7c
    unsigned char flag2 : 1;  // 0x7c
    unsigned char flag3 : 1;  // 0x7c
    unsigned char flag4 : 1;  // 0x7c
    unsigned char flag5 : 1;  // 0x7c
    unsigned char flag6 : 1;  // 0x7c
    unsigned char flag7 : 1;  // 0x7c
    unsigned char flag8 : 1;  // 0x7c
};

#endif