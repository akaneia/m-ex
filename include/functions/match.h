#ifndef MEX_H_FN_MATCH
#define MEX_H_FN_MATCH

CameraBox *(*CameraBox_Alloc)() = (void *)0x80029020;
void (*KOCount_Init)(int updateCallback) = (void *)0x802fa5bc;
void (*KOCount_Update)(int KOs) = (void *)0x802fa2d0;
void (*Stage_CameraLimitInitialization)() = (void *)0x801c39c0;
void (*Stage_BlastzoneInitialization)() = (void *)0x801c3bb4;
void (*Match_SetEndGraphic)(int graphic) = (void *)0x8016b33c;
void (*Match_EndImmediate)() = (void *)0x8016b328;
void (*Match_EndVS)() = (void *)0x8016c7f0;
void (*Match_FadeScreen)(int time) = (void *)0x8002063c;
int (*Match_CheckIfTeams)() = (void *)0x8016b168;
int (*Match_CheckIfStock)() = (void *)0x8016b094;
void (*Match_SetPostMatchSFX)(int sfx) = (void *)0x8016b364;
void (*Match_FreezeGame)(int freeze_kind) = (void *)0x801a4634;
void (*Match_UnfreezeGame)(int freeze_kind) = (void *)0x801a4674;
void (*Match_CreateHUD)(int ply) = (void *)0x802f6e1c;
void (*Match_HideHUD)() = (void *)0x802f3394;
void (*Match_ShowHUD)() = (void *)0x802f33cc;
void (*Match_CorrectCamera)() = (void *)0x8002f3ac;
void (*Match_SetNormalCamera)() = (void *)0x801650e8;
void (*Match_SetFreeCamera)(int unk, int unk2) = (void *)0x801652b0;
void (*Match_SetZoomCamera)(int unk, int unk2) = (void *)0x80165190;
void (*Match_SetFixedCamera)() = (void *)0x80165290;
void (*Match_SetDevelopCamera)() = (void *)0x8003006c;
void (*DevCam_AdjustRotate)(COBJ *cobj, Vec3 *wobjpos, Vec3 *rotate, float stickX, float stickY) = (void *)0x802279e8;
void (*DevCam_AdjustPan)(COBJ *cobj, float stickX, float stickY) = (void *)0x80227fe0;
void (*DevCam_AdjustZoom)(COBJ *cobj, float stickY) = (void *)0x80227cac;
void (*ScreenFlash_Create)(int kind, int unk) = (void *)0x80021c48;
void (*ScreenRumble_Execute)(int kind, int unk) = (void *)0x80030e44;

#endif