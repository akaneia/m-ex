#ifndef MEX_H_ST_MEX
#define MEX_H_ST_MEX

#include "structs.h"
#include "datatypes.h"

struct PRIM
{
    int data;
};

struct Translation
{
    float frame;
    float value;
};

struct MEXPlaylist
{
    u16 bgm;
    u16 chance;
};

#endif