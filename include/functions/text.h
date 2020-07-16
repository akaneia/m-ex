#ifndef MEX_H_FN_TEXT
#define MEX_H_FN_TEXT

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