#ifndef MEX_H_TEXT
#define MEX_H_TEXT

#include "structs.h"
#include "datatypes.h"
#include "obj.h"
#include "color.h"

/*** Structs ***/

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

/*** Functions ***/

int (*Text_CreateCanvas)(int unk, GOBJ *gobj, int text_gobjkind, int text_gobjsubclass, int text_gobjflags, int text_gxlink, int text_gxpri, int cobj_gxpri) = (void *)0x803a611c; // the optional gobj and cobj_gxlink are used to create a cobj as well. set gobj = -1 to bypass this behavior
Text *(*Text_CreateText)(int unk, int canvasID) = (void *)0x803a6754;
void (*Text_FreeText)(Text *text) = (void *)0x803a5cc4;
int (*Text_AddSubtext)(Text *text, float xPos, float yPos, char *string, ...) = (void *)0x803a6b98;
void (*Text_SetScale)(Text *text, int subtext, float x, float y) = (void *)0x803a7548;
void (*Text_SetColor)(Text *text, int subtext, GXColor *color) = (void *)0x803a74f0;
void (*Text_SetPosition)(Text *text, int subtext, float x, float y) = (void *)0x803a746c;
void (*Text_SetText)(Text *text, int subtext, char *string, ...) = (void *)0x803a70a0;
int (*Text_ConvertToMenuText)(char *buffer, char *string) = (void *)0x803a67ec;
u8 *(*Text_Alloc)(int size) = (void *)0x803A5798;
void (*Text_DestroyAlloc)(u8 *alloc) = (void *)0x803a594c;
void (*Text_DestroyAllAlloc)(Text *text) = (void *)0x803a5a2c;
int (*Text_StringToMenuText)(u8 *out, char *in) = (void *)0x803a67ec;
void (*Text_GX)(GOBJ *gobj, int pass) = (void *)0x803a84bc;

#endif