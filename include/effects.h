#ifndef MEX_H_EFFECTS
#define MEX_H_EFFECTS

#include "structs.h"
#include "datatypes.h"
#include "obj.h"

/*** Structs ***/

struct Effect
{
    GOBJ *child;
    GOBJ *gobj;
    int x8;
    int xc;
    void *callback;
    int x14;
    int x18;
    int x1c;
    float x20;
    short lifetime;
    char x26;
    char x27;
    char x28;
    char x29;
};

struct Particle
{
    int x0;
    int x4;
    int x8;
    int xc;
    int x10;
    int x14;
    int x18;
    int x1c;
    int x20;
    int x24;
    int x28;
    int x2c;
    int x30;
    int x34;
    int x38;
    int x3c;
    int x40;
    int x44;
    int x48;
    int x4c;
    int x50;
    float *properties;
};

struct Particle2 // created at 80398c90. dont feel like labelling this, offsets are @ 80398de4
{
    int x0;
    int x4;
    u8 x8;
    u8 x9;
    u8 xa;
    u8 xb;
    int xc;
    int x10;
    int x14;
    u8 x18;
    u8 x19;
    u16 x1a;
    u8 x1c;
    u8 x1d;
    int x20;
    int x24;
    u16 x28;
    u16 x2a;
    float x2c;
    float x30;
    float x34;
    float x38;
    float x3c;
    float x40;
    float x44;
    float x48;
    float x4c;
};

/*** Functions ***/

Effect *(*Effect_SpawnSync)(int gfx_id, ...) = (void *)0x8005fddc;
void (*Effect_SpawnAsync)(GOBJ *fighter, Effect *ptr, int type, int gfx_id, ...) = (void *)0x800676f0;
void (*Effect_SpawnFtEffectLookup)(GOBJ *gobj, int gfx_id, int bone, int unk, int destroy_on_leave, ...) = (void *)0x8009f834;
void (*Effect_SpawnItEffectLookup)(GOBJ *gobj, int gfx_id, ...) = (void *)0x80278800;
void (*Effect_SpawnItEffect)(GOBJ *gobj, int gfx_id) = (void *)0x802787b4;
void (*Effect_DestroyAll)(GOBJ *fighter) = (void *)0x8005b880;
void (*Effect_PauseAll)(GOBJ *fighter) = (void *)0x8005ba40;
void (*Effect_ResumeAll)(GOBJ *fighter) = (void *)0x8005bac4;

#endif