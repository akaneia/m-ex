#ifndef MEX_H_ST_CSS
#define MEX_H_ST_CSS

#include "structs.h"
#include "datatypes.h"

struct PreloadChar
{
    int kind;
    u8 costume;
};

struct Preload
{
    int unk1;
    int unk2;
    int unk3;
    u8 unk4;
    int stage;
    PreloadChar fighters[8];
    int defragNum;
};

struct CSSBackup
{
    u8 fighter_prev; //0x0
    u8 x1;           //0x1
    u8 fighter;      //0x2
    u8 costume;      //0x3
    u8 nametag;      //0x4
    u8 event;        //0x5
    u8 port;         //0x6
    u8 x7;           //0x7
    u8 x8;           //0x8
    u8 x9;           //0x9
    u8 xA;           //0xA
};

#endif