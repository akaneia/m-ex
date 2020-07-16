#ifndef MEX_H_TEXT
#define MEX_H_TEXT

#include "structs.h"
#include "datatypes.h"
#include "obj.h"
#include "color.h"

struct TextAllocInfo
{
    u8 *curr;
    u8 *start;
    int size;
};

struct Text
{
    Vec3 trans; // 0x0-0xC
    Vec2 limit; // 0xC-0x14
    int x14;
    int x18;
    int x1c;
    int x20;
    Vec2 scale; // 0x24-0x2C
    int x2C;
    GXColor color;
    Vec2 stretch;   // 0x34-0x3C
    int x3c;        // 0x3c
    int x40;        // 0x40
    int x44;        // 0x44
    u8 fixed_width; // 0x48
    u8 kerning;     // 0x49
    u8 align;       // 0x4a
    u8 x4b;
    u8 x4c;
    u8 hidden; // 0x4D
    u8 x4e;
    u8 x4f;
    int x50;
    GOBJ *gobj;               // 0x54
    void *callback;           // 0x58, read at 803a878c
    u8 *textAlloc;            // 0x5C
    u8 *textAlloc2;           // 0x60
    TextAllocInfo *allocInfo; // 0x64
};

#endif