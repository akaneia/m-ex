#ifndef MEX_H_PRELOAD
#define MEX_H_PRELOAD

#include "structs.h"
#include "datatypes.h"

struct PreloadChar
{
    int kind;
    u8 costume;
};

struct Preload
{
    int x0;
    int x4;
    u8 xc;
    int stage;
    PreloadChar fighters[8];
    int defragNum;
};

/*** Functions ***/

void Preload_Update();       // checks for new files to preload and begins loading them synchronously
void Preload_Invalidate();   // invalidates cache, this is usually used from scene prep on CSS's
Preload *Preload_GetTable(); // gets preload table

#endif
