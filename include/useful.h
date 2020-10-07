#ifndef MEX_H_USEFUL
#define MEX_H_USEFUL

#include "structs.h"
#include "datatypes.h"
#include "fighter.h"
#include "devtext.h"

// Align
#define OSRoundUp32B(x) (((u32)(x) + 32 - 1) & ~(32 - 1))
#define OSRoundDown32B(x) (((u32)(x)) & ~(32 - 1))

/*** Functions ***/

void (*OSReport)(char *, ...) = (void *)0x803456A8;
void (*memcpy)(void *dest, void *source, int size) = (void *)0x800031f4;
void (*memset)(void *dest, int fill, int size) = (void *)0x80003100;
void (*blr)() = (void *)0x80005358;

void (*SFX_Play)(int sfxID) = (void *)0x801c53ec;
void (*SFX_PlayCommon)(int sfxID) = (void *)0x80024030;
void (*SFX_PlayCrowd)(int sfxID) = (void *)0x8002411c;
void (*SFX_StopCrowd)() = (void *)0x80321ce8;
void (*SFX_StopAllFighterSFX)(FighterData *fighter_data) = (void *)0x80088a50;
void (*Music_Play)(int hpsID) = (void *)0x80023f28;
void (*BGM_Play)(int hpsID) = (void *)0x80023f28;

void (*DevelopMode_ResetCursorXY)(DevText *text, int x, int y) = (void *)0x80302a3c;
void (*Develop_UpdateMatchHotkeys)() = (void *)0x80225754;

void (*Wind_Create)(Vec3 *pos, int radius, float x, float y, float z) = (void *)0x800119dc;
void (*Wind_StageCreate)(Vec3 *pos, int duration, float radius, float lifetime, float angle) = (void *)0x80011a50;
void (*Wind_FighterCreate)(Vec3 *pos, int duration, float radius, float lifetime, float angle) = (void *)0x800119dc;

int (*Pause_CheckStatus)(int type) = (void *)0x801a45e8;

#endif