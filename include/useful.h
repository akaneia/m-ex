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

void OSReport(char *, ...);
void memcpy(void *dest, void *source, int size);
void memset(void *dest, int fill, int size);
void blr();

void SFX_Play(int sfxID);
void SFX_PlayCommon(int sfxID);
void SFX_PlayCrowd(int sfxID);
void SFX_StopCrowd();
void SFX_StopAllFighterSFX(FighterData *fighter_data);
void Music_Play(int hpsID);
void BGM_Play(int hpsID);

void DevelopMode_ResetCursorXY(DevText *text, int x, int y);
void Develop_UpdateMatchHotkeys();

void Wind_Create(Vec3 *pos, int radius, float x, float y, float z);
void Wind_StageCreate(Vec3 *pos, int duration, float radius, float lifetime, float angle);
void Wind_FighterCreate(Vec3 *pos, int duration, float radius, float lifetime, float angle);

int Pause_CheckStatus(int type);

#endif
