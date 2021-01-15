#ifndef MEX_H_USEFUL
#define MEX_H_USEFUL

#include <stdarg.h>

#include "structs.h"
#include "datatypes.h"
#include "fighter.h"
#include "devtext.h"

// Align
#define OSRoundUp32B(x) (((u32)(x) + 32 - 1) & ~(32 - 1))
#define OSRoundDown32B(x) (((u32)(x)) & ~(32 - 1))
#define __FILENAME__ (strrchr(__FILE__, '\\') ? strrchr(__FILE__, '\\') + 1 : __FILE__)
#define assert(msg, ...) __assert(__FILENAME__, __LINE__, msg, __VA_ARGS__)

/** String Library **/
#define vsprintf(buffer, format, args) _vsprintf(buffer, -1, format, args)

int sprintf(char *s, const char *format, ...);
int _vsprintf(char *str, int unk, const char *format, va_list arg);
int strlen(char *str);
char *strchr(char *str, char c); // searches for the first occurrence of the character c (an unsigned char) in the string pointed to by the argument str.
int strcmp(char *str1, char *str2);
int strncmp(char *str1, char *str2, int size);
char *strcpy(char *dest, char *src);            // copies the string pointed to, by src to dest.
char *strncpy(char *dest, char *src, int size); // copies the string pointed to, by src to dest.
unsigned long int strtoul(const char *str, char **endptr, int base);
char *strcat(s, append) register char *s;
register const char *append;
{
    char *save = s;

    for (; *s; ++s)
        ;
    while (*s++ = *append++)
        ;
    return (save);
}

/*** Functions ***/

void OSReport(char *, ...);
void __assert(char *file, int line, char *assert, ...);
void memcpy(void *dest, void *source, int size);
void memset(void *dest, int fill, int size);
void blr();

void SFX_Play(int sfxID);
void SFX_PlayCommon(int sfxID);
void SFX_PlayCrowd(int sfxID);
void SFX_StopCrowd();
void SFX_StopAllFighterSFX(FighterData *fighter_data);
void Music_Play(int hpsID);

void DevelopMode_ResetCursorXY(DevText *text, int x, int y);
void Develop_UpdateMatchHotkeys();

void Wind_Create(Vec3 *pos, int radius, float x, float y, float z);
void Wind_StageCreate(Vec3 *pos, int duration, float radius, float lifetime, float angle);
void Wind_FighterCreate(Vec3 *pos, int duration, float radius, float lifetime, float angle);

int Pause_CheckStatus(int type);

#endif
