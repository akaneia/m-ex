#ifndef MEX_H
#define MEX_H

// Data types
typedef char s8;
typedef short s16;
typedef int s32;
typedef long long s64;
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;
typedef float f;
typedef float f32;
typedef double f64;

// Matrix definition
typedef float Mtx[3][4];
typedef float (*MtxPtr)[4];

// Ghidrish
#define undefined8 long
#define undefined4 int
#define byte char
#define uint unsigned int

// bool lingo
#define true 1
#define false 0

// facing direction lingo
#define left -1
#define right 1

// Structs
typedef struct GOBJProc GOBJProc;
typedef struct GOBJ GOBJ;
typedef struct MoveLogic MoveLogic;
typedef struct FighterData FighterData;
typedef struct ItemData ItemData;
typedef struct map_gobjData map_gobjData;
typedef struct SpawnItem SpawnItem;
typedef struct FighterBone FighterBone;
typedef struct ftData ftData;
typedef struct itData itData;
typedef struct JOBJ JOBJ;
typedef struct CameraBox CameraBox;
typedef struct Stage Stage;
typedef struct itCommonAttr itCommonAttr;
typedef struct ItemState ItemState;
typedef struct CollData CollData;
typedef struct Hitbox Hitbox;
typedef struct Hurtbox Hurtbox;
typedef struct Vec2 Vec2;
typedef struct Vec3 Vec3;
typedef struct Vec4 Vec4;
typedef struct DevText DevText;
typedef struct DynamicBoneset DynamicBoneset;
typedef struct Effect Effect;
typedef struct Reflect Reflect;
typedef struct PRIM PRIM;

// Math Functions
float (*atan2)(float x, float y) = (void *)0x80022c30;
float (*sin)(float x) = (void *)0x803263d4;
float (*cos)(float x) = (void *)0x80326240;
void (*C_MTXLookAt)(Mtx* dest, Vec3* eye, Vec3* up, Vec3* target) = (void *)0x80342734;
void (*PSVECNormalize)(Vec3* src, Vec3* dest) = (void *)0x80342db8;
void (*PSVECAdd)(Vec3* a, Vec3* b, Vec3* ab) = (void *)0x80342d54;
void (*PSVECSubtract)(Vec3* a, Vec3* b, Vec3* a_b) = (void *)0x80342d78;
float (*PSVECDotProduct)(Vec3* a, Vec3* b) = (void *)0x80342e38;
void (*PSVECCrossProduct)(Vec3* a, Vec3* b, Vec3* axb) = (void *)0x80342e58;
void (*PSMTXQuat)(Vec4* dest, Mtx* m) = (void *)0x80342690;
void (*HSD_MtxGetRotation)(Mtx* m, Vec3* dest) = (void *)0x80379c24;
void (*MatToQuat)(Mtx* m, Vec3* dest) = (void *)0x8037e708;
float (*sqrtf)(float num) = (void *)0x8000d5bc;

// Useful functions
void (*OSReport)(char*, ...) = (void *)0x803456A8;
int (*JOBJ_CopyPosition)(JOBJ* source, int unk, Vec3* dest) = (void *)0x8000b1cc;
void (*HSD_JObjSetMtxDirtySub)(JOBJ* jobj) = (void *)0x803732e8;
void (*JOBJ_GetChild)(JOBJ* joint, int ptr, int index, int type, ...) = (void *)0x80011e24;
void (*JOBJ_BillBoard)(JOBJ* joint, Mtx* m, Mtx* mx) = (void *)0x803740e8;
void (*memcpy)(void *dest, void *source, int size) = (void *)0x800031f4;
void (*memset)(void *dest, int fill, int size) = (void *)0x80003100;
void (*blr)() = (void *)0x80005358;
int (*HSD_Randi)(int max) = (void *)0x80380580;
float (*HSD_Randf)() = (float *)0x80380528;
void *(*HSD_MemAlloc)(int size) = (void *)0x8037f1e4;
void (*HSD_Free)(void *ptr) = (void *)0x8037f1b0;
void (*SFX_Play)(int sfxID) = (void *)0x801c53ec;
void (*Music_Play)(int hpsID) = (void *)0x80023f28;
GOBJ *(*GObj_Create)(int type, int subclass, int flags) = (void *)0x803901f0;
void (*GObj_Destroy)(GOBJ *gobj) = (void *)0x80390228;
void (*GObj_AddGXLink)(GOBJ *gobj, void *callback, int renderType, int priority) = (void *)0x8039069c;
void (*GObj_DestroyGXLink)(GOBJ *gobj) = (void *)0x8039084c;
void (*GObj_AddProc)(GOBJ *gobj, void *callback, int priority) = (void *)0x8038fd54;
void (*GObj_AddObject)(GOBJ *gobj, int unk, void *object) = (void *)0x80390a70;
void (*GObj_AddUserData)(GOBJ *gobj, int userDataKind, void *destructor, void *userData) = (void *)0x80390b68;
DevText* (*DevelopText_CreateDataTable)(int unk1, int unk2, int unk3, int width, int height, void *alloc) = (void *)0x80302834;
void (*DevelopText_Activate)(void* unk, DevText* text) = (void *)0x80302810;
void (*DevelopText_AddString)(DevText* text, ...) = (void *)0x80302d4c;
void (*DevelopText_EraseAllText)(DevText* text) = (void *)0x80302bb0;
void (*DevelopMode_ResetCursorXY)(DevText* text, int x, int y) = (void *)0x80302a3c;
void (*DevelopText_StoreBGColor)(DevText* text, int* RGBA) = (void *)0x80302b90;
void (*DevelopText_HideText)(DevText* text) = (void *)0x80302b00;
void (*DevelopText_HideBG)(DevText* text) = (void *)0x80302ae0;
void (*DevelopText_StoreTextScale)(DevText* text, float x, float y) = (void *)0x80302b10;
Effect* (*Effect_SpawnSync)(int gfx_id, ...) = (void *)0x8005fddc;
void (*Effect_SpawnAsync)(GOBJ* fighter, Effect* ptr, int type, int gfx_id, ...) = (void *)0x800676f0;
void (*Effect_PauseAll)(GOBJ* fighter) = (void *)0x8005ba40;
void (*Effect_ResumeAll)(GOBJ* fighter) = (void *)0x8005bac4;
void (*Wind_Create)(Vec3* pos, int radius, float x, float y, float z) = (void *)0x800119dc;

// Match Functions
CameraBox *(*CameraBox_Alloc)() = (void *)0x80029020;
void (*KOCount_Init)(int updateCallback) = (void *)0x802fa5bc;
void (*KOCount_Update)(int KOs) = (void *)0x802fa2d0;
void (*Stage_CameraLimitInitialization)() = (void *)0x801c39c0;
void (*Stage_BlastzoneInitialization)() = (void *)0x801c3bb4;
void (*Match_SetEndGraphic)(int graphic) = (void *)0x8016b33c;
void (*Match_EndGame)() = (void *)0x8016b328;
void (*Match_FadeScreen)(int time) = (void *)0x8002063c;

// Fighter Functions
void (*ActionStateChange)(float startFrame,float animSpeed,float animBlend,GOBJ *fighter,int stateID,int flags1, int flags2) = (void *)0x800693ac;
void (*Subaction_Update)(GOBJ *fighter) = (void *)0x8006eba4;
int (*Animation_GetAddress)(FighterData *fighter, int animID) = (void *)0x80085e50;
float (*Animation_GetLength)(int animAddress) = (void *)0x8001e8f8;
void (*Fighter_EnterLightThrow)(GOBJ *fighter, int stateID) = (void *)0x800957f4;
void (*Fighter_EnterDamageFall)(GOBJ *fighter) = (void *)0x80090780;
void (*Fighter_EnterWait)(GOBJ *fighter) = (void *)0x8008a2bc;
void (*Fighter_EnterFall)(GOBJ *fighter) = (void *)0x800cc730;
void (*Fighter_EnterSpecialFall)(GOBJ *fighter, int can_fastfall, int can_not_noimpactland, int can_not_interrupt, float aerialDriftMultipler, float landing_frames) = (void *)0x80096900;
void (*Fighter_EnterLanding)(GOBJ *fighter) = (void *)0x80082b1c;
void (*Fighter_EnterSpecialLanding)(GOBJ *fighter, int unk, float state_length) = (void *)0x800d5cb0;
GOBJ *(*Fighter_GetGObj)(int fighterindex) = (void *)0x80034110;
void (*Fighter_ApplyIntang)(GOBJ *fighter, int duration) = (void *)0x8007b760;
int (*Fighter_GetSlotType)(int index) = (void *)0x8003241c;
void (*Fighter_EnableECBBottomUpdate)(FighterData *fighter) = (void *)0x8007d5bc;
void (*Fighter_EnterDamageState)(GOBJ *fighter, int stateID, float frame) = (void *)0x8008dce0;
int (*Fighter_BoneLookup)(FighterData *fighter, int boneID) = (void *)0x8007500c;
void (*Fighter_ApplyDamage)(FighterData *fighter, float damage) = (void *)0x8006cc7c;
void (*Fighter_RunOnHitCallbacks)(GOBJ *fighter) = (void *)0x8007db58;
int (*FrameTimerCheck)(GOBJ *fighter) = (void *)0x8006f238;
void (*Fighter_EnterMiscPassState)(float start_frame, GOBJ *fighter,int state, int flags) = (void *)0x8009a184;
int (*Fighter_CollGround_PassLedge)(GOBJ *fighter) = (void *)0x80082708;
void (*Fighter_CollGround_StopLedge)(GOBJ *fighter) = (void *)0x80084104;
int (*Fighter_CollAir_GrabLedgeWalljump)(GOBJ *fighter, void* perFrame, void* onLand) = (void *)0x800831cc;
int (*Fighter_CollAir_GrabLedge)(GOBJ *fighter, int grab_direction) = (void *)0x800822a4;
void (*Fighter_CollAir_IgnoreLedge)(GOBJ *fighter,void* callback) = (void *)0x80082c74;
int (*Fighter_CollAir_IgnoreLedge_NoCB)(GOBJ *fighter) = (void *)0x80081d0c;
int (*Fighter_IASACheck_CliffCatch)(GOBJ *fighter) = (void *)0x80081298;
int (*Fighter_IASACheck_JumpAerial)(GOBJ *fighter) = (void *)0x800cb870;
int (*Fighter_IASACheck_JumpF)(GOBJ *fighter) = (void *)0x800caed0;
int (*Fighter_IASACheck_PassConditions)(GOBJ *fighter) = (void *)0x80099f1c;
int (*Fighter_IASACheck_Turn)(GOBJ *fighter) = (void *)0x800c97a8;
void (*Fighter_PhysGround_ApplyFriction)(GOBJ *fighter) = (void *)0x80084f3c;
void (*Fighter_PhysAir_ApplyGravity)(FighterData *fighter, float gravity, float limit) = (void *)0x8007d494;
void (*Fighter_PhysAir_LimitVelocity)(FighterData *fighter) = (void *)0x8007cf58;
void (*Fighter_Phys_UseAnimPos)(FighterData *fighter) = (void *)0x80085134;
void (*Fighter_Phys_UseAnimPosAndStick)(FighterData *fighter) = (void *)0x80085154;
void (*Fighter_SetGrounded)(FighterData *fighter) = (void *)0x8007d7fc;
void (*Fighter_SetAirborne)(FighterData *fighter) = (void *)0x8007d5d4;
void (*Fighter_KillAllVelocity)(GOBJ* fighter) = (void *)0x8007e2fc;
void (*Fighter_AdvanceScript)(GOBJ *fighter) = (void *)0x8006eba4;
void (*Fighter_GFXRemoveAll)(GOBJ *fighter) = (void *)0x8007db24;
void (*Fighter_EnableReflectUpdate)(GOBJ *fighter) = (void *)0x8007aef8;
void (*Fighter_CreateReflect)(GOBJ *fighter, Reflect* reflect, void* cb_OnReflectHit) = (void *)0x8007b23c;
float (*Fighter_GetBoneRotation)(FighterData* fighter, int bone) = (void*)0x80075f48;
float (*Fighter_RotateBone_Pitch)(FighterData* fighter, int bone, float angle) = (void*)0x80075af0;
float (*Fighter_RotateBone_Yaw)(FighterData* fighter, int bone, float angle) = (void*)0x8007592c;
float (*Fighter_RotateBone_Roll)(FighterData* fighter, int bone, float angle) = (void*)0x80075cb4;
void (*Fighter_PlayVoiceSFX)(FighterData *fighter, int sfxID, int volume, int balance) = (void *)0x800881d8;

// Item Functions
void (*Item_Hold)(GOBJ *item, GOBJ *fighter, int boneID) = (void *)0x8026ab54;
void (*Item_Catch)(GOBJ *fighter, int unk) = (void *)0x80094818;
void (*Items_StoreItemDataToCharItemTable)(undefined4, int) = (void *)0x8026B3F8;
void (*Items_StoreItemDataToCharItemTable2)(int articleData,int articleID) = (void *)0x8026B3F8;
void (*Items_StoreTimeout)(GOBJ *item,float timeout) = (void *)0x80275158;
GOBJ *(*CreateItem)(SpawnItem *item_spawn) = (void *)0x80268b18;
GOBJ *(*CreateItem2)(SpawnItem *item_spawn) = (void *)0x80268b5c;
GOBJ *(*CreateItem3)(SpawnItem *item_spawn) = (void *)0x80268b9c;
int (*Item_CollGround_PassLedge)(GOBJ *item, void *callback) = (void *)0x8026d62c;
int (*Item_CollGround_StopLedge)(GOBJ *item, void *callback) = (void *)0x8026d8a4;
int (*Item_CollAir)(GOBJ *item, void *callback) = (void *)0x8026e15c;
void (*ItemStateChange)(GOBJ *item, int stateID, int flags) = (void *)0x80268e5c;
int (*ItemFrameTimer)(GOBJ *item) = (void *)0x80272c6c;
void (*Item_PlaceOnGroundBelow)(GOBJ *item) = (void *)0x80276174;
int (*Item_CheckIfTouchingWall)(GOBJ *item, float* unk[]) = (void *)0x80276348;
void (*Item_InitGrab)(ItemData *item, int unk, void* OnItem, void* OnFighter) = (void *)0x80274f28;
void (*Item_ResetAllHitPlayers)(ItemData *item) = (void *)0x8027146c;
int (*Item_CountActiveItems)(int itemID) = (void *)0x8026b3c0;
void (*Item_CopyDevelopState)(GOBJ* item, GOBJ* fighter) = (void *)0x80225dd8;
int (*Items_DecLife)(GOBJ* item) = (void *)0x80273130;


// Map Functions
void (*MapStateChange)(GOBJ *map, int stateID, int animID) = (void *)0x801c8138;
void (*Dynamics_DecayWind)() = (void *)0x800115f4;
GOBJ *(*Stage_CreateMapGObj)(int mapgobjID) = (void *)0x80223908;
void *(*GXLink_Stage)(GOBJ *gobj, int pass) = (void *)0x801c5db0;
void *(*GXLink_Item)(GOBJ *gobj, int pass) = (void *)0x8026eecc;

// MEX functions
void (*LoadMEXItem)(GOBJ *player_gobj, int article_pointer, int item_id) = (void *)0x803d7058;
void (*SpawnMEXEffect)(int effectID, int fighter, int arg1, int arg2, int arg3, int arg4, int arg5) = (void*)0x803d7060;
int (*MEX_GetItemExtID)(GOBJ *player_gobj, int item_id) = (void *)0x803d7064;
void (*SFX_PlayStageSFX)(int sfx_id) = (void *)0x803d7078;
void *(*calloc)(int size) = (void *)0x803d706C;
PRIM *(*PRIM_NEW)(int vert_count, int params1, int params2) = (void *)0x804DD84C;
void (*PRIM_CLOSE)() = (void *)0x804DD848;


// Struct Definitions
struct Vec2
{
    float X;
    float Y;
};
struct Vec3
{
    float X;
    float Y;
    float Z;
};
struct Vec4
{
    float X;
    float Y;
    float Z;
    float W;
};
struct Effect
{
    GOBJ* child;
    GOBJ* gobj;
    int x8;
    int xc;
    void* callback;
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
struct DynamicBoneset
{
    int apply_phys_num;
    int bones_num;
    float x8;
    float xC;
    float x10;
    int x14;
    int x18;
    int x1c;
    int x20;
    int x24;
};
struct DevText
{
    int x0; // 0x0
    int x4; // 0x4
    int x8; // 0x8
    int xc; // 0xc
    int x10; // 0x10
    int x14; // 0x14
    int x18; // 0x18
    int x1c; // 0x1c
    int x20; // 0x20
    char x24; // 0x24
    char x25; // 0x25
    char cursorBlink; // 0x26
    char x27; // 0x27
    int x28; // 0x28
    int x2c; // 0x2c
    int x30; // 0x30
    int x34; // 0x34
    int x38; // 0x38
    int x3c; // 0x3c
    int x40; // 0x40
    int x44; // 0x44
    int x48; // 0x48
    int x4c; // 0x4c
    int x50; // 0x50
    int x54; // 0x54
    int x58; // 0x58
    int x5c; // 0x5c

};
struct Reflect
{
    int bone;
    int max_damage;
    Vec3 pos;
    float radius;
    float damage_mult;
    float velocity_mult;
    int flags;
};
struct map_gobjDesc
{
    void* onCreation;
    void* onDeletion;
    void* onFrame;
    void* onUnk;
    int flags;
};
struct CollData
{
    GOBJ *gobj;                             // 0x0
    float topN_CurrX;                             // 0x4
    float topN_CurrY;                             // 0x8
    float topN_CurrZ;                             // 0xc
    float topN_CurrCorrectX;                             // 0x10
    float topN_CurrCorrectY;                             // 0x14
    float topN_CurrCorrectZ;                             // 0x18
    float topN_PrevX;                             // 0x1c
    float topN_PrevY;                             // 0x20
    float topN_PrevZ;                             // 0x24
    float topN_ProjX;                             // 0x28
    float topN_ProjY;                             // 0x2C
    float topN_ProjZ;                             // 0x30
    int x34;                             // 0x34
    int x38;                             // 0x38
    int x3c;                             // 0x3c
    int x40;                             // 0x40
    int x44;                             // 0x44
    int x48;                             // 0x48
    int x4c;                             // 0x4c
    int x50;                             // 0x50
    int x54;                             // 0x54
    int x58;                             // 0x58
    int x5c;                             // 0x5c
    int x60;                             // 0x60
    int x64;                             // 0x64
    int x68;                             // 0x68
    int x6c;                             // 0x6c
    int x70;                             // 0x70
    int x74;                             // 0x74
    int x78;                             // 0x78
    int x7c;                             // 0x7c
    int x80;                             // 0x80
    int x84;                             // 0x84
    int x88;                             // 0x88
    int x8c;                             // 0x8c
    int x90;                             // 0x90
    int x94;                             // 0x94
    int x98;                             // 0x98
    int x9c;                             // 0x9c
    int xa0;                             // 0xa0
    int xa4;                             // 0xa4
    int xa8;                             // 0xa8
    int xac;                             // 0xac
    int xb0;                             // 0xb0
    int xb4;                             // 0xb4
    int xb8;                             // 0xb8
    int xbc;                             // 0xbc
    int xc0;                             // 0xc0
    int xc4;                             // 0xc4
    int xc8;                             // 0xc8
    int xcc;                             // 0xcc
    int xd0;                             // 0xd0
    int xd4;                             // 0xd4
    int xd8;                             // 0xd8
    int xdc;                             // 0xdc
    int xe0;                             // 0xe0
    int xe4;                             // 0xe4
    int xe8;                             // 0xe8
    int xec;                             // 0xec
    int xf0;                             // 0xf0
    int xf4;                             // 0xf4
    int xf8;                             // 0xf8
    int xfc;                             // 0xfc
    int x100;                             // 0x100
    int x104;                             // 0x104
    int x108;                             // 0x108
    int x10c;                             // 0x10c
    int x110;                             // 0x110
    int x114;                             // 0x114
    int x118;                             // 0x118
    int x11c;                             // 0x11c
    int x120;                             // 0x120
    int x124;                             // 0x124
    int x128;                             // 0x128
    int x12c;                             // 0x12c
    int flags;                             // 0x130
    int envFlags;                             // 0x134
    int x138;                             // 0x138
    int x13c;                             // 0x13c
    int x140;                             // 0x140
    int x144;                             // 0x144
    int x148;                             // 0x148
    int x14c;                             // 0x14c
    int x150;                             // 0x150
    int x154;                             // 0x154
    int x158;                             // 0x158
    int x15c;                             // 0x15c
    int x160;                             // 0x160
    int x164;                             // 0x164
    int x168;                             // 0x168
    int x16c;                             // 0x16c
    int x170;                             // 0x170
    int x174;                             // 0x174
    int x178;                             // 0x178
    int x17c;                             // 0x17c
    int x180;                             // 0x180
    int x184;                             // 0x184
    int x188;                             // 0x188
    int x18c;                             // 0x18c
    int x190;                             // 0x190
    int x194;                             // 0x194
    int x198;                             // 0x198
    int x19c;                             // 0x19c
};
struct Hitbox
{
    int x0;                             // 0x0
    int x4;                             // 0x4
    int x8;                             // 0x8
    int xc;                             // 0xc
    int x10;                             // 0x10
    int x14;                             // 0x14
    int x18;                             // 0x18
    int x1c;                             // 0x1c
    int x20;                             // 0x20
    int x24;                             // 0x24
    int x28;                             // 0x28
    int x2c;                             // 0x2c
    int x30;                             // 0x30
    int x34;                             // 0x34
    int x38;                             // 0x38
    int x3c;                             // 0x3c
    int x40;                             // 0x40
    int x44;                             // 0x44
    int x48;                             // 0x48
    int x4c;                             // 0x4c
    int x50;                             // 0x50
    int x54;                             // 0x54
    int x58;                             // 0x58
    int x5c;                             // 0x5c
    int x60;                             // 0x60
    int x64;                             // 0x64
    int x68;                             // 0x68
    int x6c;                             // 0x6c
    int x70;                             // 0x70
    int x74;                             // 0x74
    int x78;                             // 0x78
    int x7c;                             // 0x7c
    int x80;                             // 0x80
    int x84;                             // 0x84
    int x88;                             // 0x88
    int x8c;                             // 0x8c
    int x90;                             // 0x90
    int x94;                             // 0x94
    int x98;                             // 0x98
    int x9c;                             // 0x9c
    int xa0;                             // 0xa0
    int xa4;                             // 0xa4
    int xa8;                             // 0xa8
    int xac;                             // 0xac
    int xb0;                             // 0xb0
    int xb4;                             // 0xb4
    int xb8;                             // 0xb8
    int xbc;                             // 0xbc
    int xc0;                             // 0xc0
    int xc4;                             // 0xc4
    int xc8;                             // 0xc8
    int xcc;                             // 0xcc
    int xd0;                             // 0xd0
    int xd4;                             // 0xd4
    int xd8;                             // 0xd8
    int xdc;                             // 0xdc
    int xe0;                             // 0xe0
    int xe4;                             // 0xe4
    int xe8;                             // 0xe8
    int xec;                             // 0xec
    int xf0;                             // 0xf0
    int xf4;                             // 0xf4
    int xf8;                             // 0xf8
    int xfc;                             // 0xfc
    int x100;                             // 0x100
    int x104;                             // 0x104
    int x108;                             // 0x108
    int x10c;                             // 0x10c
    int x110;                             // 0x110
    int x114;                             // 0x114
    int x118;                             // 0x118
    int x11c;                             // 0x11c
    int x120;                             // 0x120
    int x124;                             // 0x124
    int x128;                             // 0x128
    int x12c;                             // 0x12c
    int x130;                             // 0x130
    int x134;                             // 0x134



};
struct Hurtbox
{
    int x0;                             // 0x0
    int x4;                             // 0x4
    int x8;                             // 0x8
    int xc;                             // 0xc
    int x10;                             // 0x10
    int x14;                             // 0x14
    int x18;                             // 0x18
    int x1c;                             // 0x1c
    int x20;                             // 0x20
    int x24;                             // 0x24
    int x28;                             // 0x28
    int x2c;                             // 0x2c
    int x30;                             // 0x30
    int x34;                             // 0x34
    int x38;                             // 0x38
    int x3c;                             // 0x3c
    int x40;                             // 0x40
    int x44;                             // 0x44
    int x48;                             // 0x48
};
struct MoveLogic
{
    int animation_id;
    int flags;
    char move_id;
    char bitflags1;
    void* animation_callback;
    void* iasa_callback;
    void* physics_callback;
    void* collision_callback;
    void* camera_callback;
};
struct ftData
{
    char footBoneL;
    char footBoneR;
    int *charAttributes;
    int archive;
    int animFlags;
    int animDynamics;
    int x14;
    int x18;
    int x1C;
    int x20;
    int x24;
    int x28;
    int dynamics;
    int hurtbox;
    int *center_bubble;
    int x38;
    int x3C;
    int x40;
    int coll;
    int *items;
    int *x4C;
    int x50;
    int x54;
    int boneLookup;
};
struct itData
{
    int x0;
    int *itemAttributes;
    int archive;
    int animFlags;
    int animDynamics;
    int x14;
    int x18;
    int x1C;
    int x20;
    int x24;
    int x28;
    int dynamics;
    int hurtbox;
    int x34;
    int x38;
    int x3C;
    int x40;
    int coll;
    int *items;
    int x4C;
    int x50;
    int x54;
    int boneLookup;
};
struct JOBJ
{
    int hsd_info;                             //0x0
    int class_parent;                             //0x4
    JOBJ* sibling;                             //0x08
    JOBJ* parent;                             //0x0C
    JOBJ* child;                             //0x10
    int flags;                             //0x14
    int DOBJDesc;                             //0x18
    Vec4 rot;                            //0x1C 0x20 0x24 0x28
    Vec3 scale;
    Vec3 trans;
    Mtx rotMtx;
    Vec3* VEC;
    Mtx* MTX;
    int* AObj;
    int* RObj;
};
struct CameraBox
{
    GOBJ *item;                             // 0x0
    int x4;                             // 0x4
    int x8;                             // 0x8
    int xC;                             // 0xC
    int itemID;                             // 0x10
    int x14;                             // 0x14
    int x18;                             // 0x18
    int x1c;                             // 0x1c
    int x20;                             // 0x20
    int x24;                             // 0x24
    int stateID;                             // 0x28
    int facingDirection;                             // 0x2c
    int x30;                             // 0x30
    int x34;                             // 0x34
    float scale;                             // 0x38
    int x3c;                             // 0x3c
    float boundleft;                             // 0x40
    float boundright;                             // 0x44
    float boundwidth;                             // 0x48
    float boundunk;                             // 0x4c
};
struct GOBJProc
{
    GOBJ* parent;
    GOBJProc* next;
    GOBJProc* prev;
    char s_link;
    char flags;
    GOBJ* parentGOBJ;
    int procFunction;
};
struct GOBJ
{
    short entity_class;
    char p_link;
    char gx_link;
    char p_priority;
    char gx_priority;
    char obj_kind;
    char data_kind;
    GOBJ* next;
    GOBJ* previous;
    GOBJ* nextOrdered;
    GOBJ* previousOrdered;
    GOBJProc* gobj_proc;
    void* GXCallbackRenderFunction;
    int render_priorities;
    int unknown;
    int* hsd_object;
    void* userdata;
    int destructor_function;
    int unk_linked_list;
};
struct FighterBone
{
    JOBJ* joint;
    JOBJ* joint2;
    int flags;
    int flags2;
};
struct FighterData
{
    GOBJ *fighter;                             // 0x0
    int kind;                             // 0x4
    int spawn_num;                             // 0x8
    char ply;                             // 0xC
    char unknown;                             // 0xD
    char unknownE;                             // 0xE
    char unknownF;                             // 0xF
    int state_id;                             // 0x10
    int anim_id;                             // 0x14
    int state_num;                             // 0x18
    MoveLogic* common_states;                             // 0x1C
    MoveLogic* special_states;                              // 0x20
    int* anim_flags;                             // 0x24
    int* ragdoll_data;                             // 0x28
    float facing_direction;                             // 0x2C
    float facing_direction_repeated;                             // 0x30
    Vec3 scale;                             // 0x3C
    int pointer_to_next_linked_list;                             // 0x40
    int pointer_to_0x40__pointer_to_prev_linked_list;                             // 0x44
    int length_of_linked_list;                             // 0x48
    int unknown4C;                             // 0x4C
    int unknown50;                             // 0x50
    int unknown54;                             // 0x54
    int unknown58;                             // 0x58
    int unknown5C;                             // 0x5C
    int unknown60;                             // 0x60
    int unknown64;                             // 0x64
    int unknown68;                             // 0x68
    int unknown6C;                             // 0x6C
    int unknown70;                             // 0x70
    Vec3 animVel;                            // 0x74
    Vec3 selfVel;                            // 0x80
    Vec3 kbVel;                             // 0x8C
    int x98;                             // 0x98
    int x9c;                             // 0x9C
    int xa0;                             // 0xA0
    int xa4;                             // 0xA4
    int xa8;                             // 0xA8
    int xac;                             // 0xAC
    Vec3 pos;
    Vec3 pos_prev;                             // 0xBC
    Vec3 pos_delta;                             // 0xC8
    Vec3 unknownD4;                             // 0xD4
    int air_state;                             // 0xE0
    float horzitonal_velocity_queue_will_be_added_to_0xec;                             // 0xE4
    float vertical_velocity_queue_will_be_added_to_0xec;                             // 0xE8
    Vec3 selfVelGround;                             // 0xEC
    int unknownF8;                             // 0xF8
    int unknownFC;                             // 0xFC
    int unknown100;                             // 0x100
    int* costume_JObjDesc;                             // 0x104
    int* costume_archive;                             // 0x108
    ftData *ftData;                             // 0x10C
    float walk_initial_velocity;                             // 0x110
    float walk_acceleration;                             // 0x114
    float walk_maximum_velocity;                             // 0x118
    float slow_walk_max;                             // 0x11C
    float mid_walk_point;                             // 0x120
    float fast_walk_min;                             // 0x124
    float ground_friction;                             // 0x128
    float dash_initial_velocity;                             // 0x12C
    float dashrun_acceleration_a;                             // 0x130
    float dashrun_acceleration_b;                             // 0x134
    float dashrun_terminal_velocity;                             // 0x138
    float run_animation_scaling;                             // 0x13C
    float max_runbrake_frames;                             // 0x140
    float grounded_max_horizontal_velocity;                             // 0x144
    float jump_startup_time;                             // 0x148
    float jump_h_initial_velocity;                             // 0x14C
    float jump_v_initial_velocity;                             // 0x150
    float ground_to_air_jump_momentum_multiplier;                             // 0x154
    float jump_h_max_velocity;                             // 0x158
    float hop_v_initial_velocity;                             // 0x15C
    float air_jump_v_multiplier;                             // 0x160
    float air_jump_h_multiplier;                             // 0x164
    int max_jumps;                             // 0x168
    float gravity;                             // 0x16C
    float terminal_velocity;                             // 0x170
    float aerialDriftStickMult;                             // 0x174
    float aerialDriftBase;                             // 0x178
    float aerialDriftMax;                             // 0x17C
    float aerialFriction;                             // 0x180
    float fastfall_velocity;                             // 0x184
    float horizontal_air_mobility_constant;                             // 0x188
    int jab_2_input_window;                             // 0x18C
    int jab_3_input_window;                             // 0x190
    int frames_to_change_direction_on_standing_turn;                             // 0x194
    float weight;                             // 0x198
    float model_scaling;                             // 0x19C
    float initial_shield_size;                             // 0x1A0
    float shield_break_initial_velocity;                             // 0x1A4
    int rapid_jab_window;                             // 0x1A8
    int unknown1AC;                             // 0x1AC
    int unknown1B0;                             // 0x1B0
    int unknown1B4;                             // 0x1B4
    float ledge_jump_horizontal_velocity;                             // 0x1B8
    float ledge_jump_vertical_velocity;                             // 0x1BC
    float item_throw_velocity_multiplier;                             // 0x1C0
    int unknown1C4;                             // 0x1C4
    int unknown1C8;                             // 0x1C8
    int unknown1CC;                             // 0x1CC
    int unknown1D0;                             // 0x1D0
    int unknown1D4;                             // 0x1D4
    int unknown1D8;                             // 0x1D8
    int unknown1DC;                             // 0x1DC
    int unknown1E0;                             // 0x1E0
    int unknown1E4;                             // 0x1E4
    int unknown1E8;                             // 0x1E8
    int unknown1EC;                             // 0x1EC
    float kirby_b_star_damage;                             // 0x1F0
    float normal_landing_lag;                             // 0x1F4
    float n_air_landing_lag;                             // 0x1F8
    float f_air_landing_lag;                             // 0x1FC
    float b_air_landing_lag;                             // 0x200
    float u_air_landing_lag;                             // 0x204
    float d_air_landing_lag;                             // 0x208
    float nametag_height;                             // 0x20C
    int unknown210;                             // 0x210
    float wall_jump_horizontal_velocity;                             // 0x214
    float wall_jump_vertical_velocity;                             // 0x218
    int unknown21C;                             // 0x21C
    int unknown220;                             // 0x220
    int unknown224;                             // 0x224
    int unknown228;                             // 0x228
    int unknown22C;                             // 0x22C
    int unknown230;                             // 0x230
    int unknown234;                             // 0x234
    int unknown238;                             // 0x238
    int unknown23C;                             // 0x23C
    int unknown240;                             // 0x240
    int unknown244;                             // 0x244
    int unknown248;                             // 0x248
    int unknown24C;                             // 0x24C
    int unknown250;                             // 0x250
    int unknown254;                             // 0x254
    int unknown258;                             // 0x258
    float bubble_ratio;                             // 0x25C
    int unknown260;                             // 0x260
    int unknown264;                             // 0x264
    int unknown268;                             // 0x268
    int unknown26C;                             // 0x26C
    float respawn_platform_scale;                             // 0x270
    int unknown274;                             // 0x274
    int unknown278;                             // 0x278
    int camera_zoom_target_bone;                             // 0x27C
    int unknown280;                             // 0x280
    int unknown284;                             // 0x284
    int unknown288;                             // 0x288
    int special_jump_action___1;                             // 0x28C
    int weight_dependent_throw_speed_flags;                             // 0x290
    int unknown294;                             // 0x294
    int unknown298;                             // 0x298
    int unknown29C;                             // 0x29C
    int unknown2A0;                             // 0x2A0
    int unknown2A4;                             // 0x2A4
    int unknown2A8;                             // 0x2A8
    int unknown2AC;                             // 0x2AC
    int unknown2B0;                             // 0x2B0
    int unknown2B4;                             // 0x2B4
    int unknown2B8;                             // 0x2B8
    int unknown2BC;                             // 0x2BC
    int unknown2C0;                             // 0x2C0
    int unknown2C4;                             // 0x2C4
    int unknown2C8;                             // 0x2C8
    int unknown2CC;                             // 0x2CC
    int unknown2D0;                             // 0x2D0
    int *special_attributes;                             // 0x2D4
    int *special_attributes2;                             // 0x2D8
    int unknown2DC;                             // 0x2DC
    int unknown2E0;                             // 0x2E0
    int unknown2E4;                             // 0x2E4
    int unknown2E8;                             // 0x2E8
    int unknown2EC;                             // 0x2EC
    DynamicBoneset dynamics_boneset[5];           //0x2f0
    int unknown3B8;                             // 0x3B8
    int unknown3BC;                             // 0x3BC
    int unknown3C0;                             // 0x3C0
    int unknown3C4;                             // 0x3C4
    int unknown3C8;                             // 0x3C8
    int unknown3CC;                             // 0x3CC
    int unknown3D0;                             // 0x3D0
    int unknown3D4;                             // 0x3D4
    int unknown3D8;                             // 0x3D8
    int unknown3DC;                             // 0x3DC
    int dynamic_boneset_num;                             // 0x3E0
    int script_event_timer;                             // 0x3E4
    int script_frame_timer;                             // 0x3E8
    int* script_current;                             // 0x3EC
    int script_loop_num;                             // 0x3F0
    int* script_return;                             // 0x3F4
    int unk;                             // 0x3F8
    int unk3FC;                             // 0x3FC
    int pointer_to_0x460;                             // 0x400
    int pointer_to_0x3c0;                             // 0x404
    int unknown408;                             // 0x408
    int unknown40C;                             // 0x40C
    int unknown410;                             // 0x410
    int unknown414;                             // 0x414
    int unknown418;                             // 0x418
    int unknown41C;                             // 0x41C
    int unknown420;                             // 0x420
    int unknown424;                             // 0x424
    int unknown428;                             // 0x428
    int unknown42C;                             // 0x42C
    int unknown430;                             // 0x430
    int unknown434;                             // 0x434
    int unknown438;                             // 0x438
    int unknown43C;                             // 0x43C
    int unknown440;                             // 0x440
    int unknown444;                             // 0x444
    int unknown448;                             // 0x448
    int unknown44C;                             // 0x44C
    int unknown450;                             // 0x450
    int unknown454;                             // 0x454
    int unknown458;                             // 0x458
    int unknown45C;                             // 0x45C
    int unknown460;                             // 0x460
    int unknown464;                             // 0x464
    int unknown468;                             // 0x468
    int unknown46C;                             // 0x46C
    int unknown470;                             // 0x470
    int unknown474;                             // 0x474
    int unknown478;                             // 0x478
    int unknown47C;                             // 0x47C
    int unknown480;                             // 0x480
    int unknown484;                             // 0x484
    int unknown488;                             // 0x488
    int unknown48C;                             // 0x48C
    int unknown490;                             // 0x490
    int unknown494;                             // 0x494
    int unknown498;                             // 0x498
    int pointer_to_0x4b0__color_blend_pointer;                             // 0x49C
    int unknown4A0;                             // 0x4A0
    int unknown4A4;                             // 0x4A4
    int unknown4A8;                             // 0x4A8
    int unknown4AC;                             // 0x4AC
    int unknown4B0;                             // 0x4B0
    int rrggbbaa_color;                             // 0x4B4
    int red_value;                             // 0x4B8
    int green_value;                             // 0x4BC
    int blue_value;                             // 0x4C0
    int alpha_value;                             // 0x4C4
    int red_blink_rate;                             // 0x4C8
    int green_blink_rate;                             // 0x4CC
    int blue_blink_rate;                             // 0x4D0
    int alpha_blink_rate;                             // 0x4D4
    int unknown4D8;                             // 0x4D8
    int unknown4DC;                             // 0x4DC
    int unknown4E0;                             // 0x4E0
    int unknown4E4;                             // 0x4E4
    int unknown4E8;                             // 0x4E8
    int unknown4EC;                             // 0x4EC
    int unknown4F0;                             // 0x4F0
    int unknown4F4;                             // 0x4F4
    int unknown4F8;                             // 0x4F8
    int unknown4FC;                             // 0x4FC
    int unknown500;                             // 0x500
    int color_tint_onoff;                             // 0x504
    int unknown508;                             // 0x508
    int unknown50C;                             // 0x50C
    int unknown510;                             // 0x510
    int unknown514;                             // 0x514
    int unknown518;                             // 0x518
    int unknown51C;                             // 0x51C
    int unknown520;                             // 0x520
    int unknown524;                             // 0x524
    int unknown528;                             // 0x528
    int unknown52C;                             // 0x52C
    int unknown530;                             // 0x530
    int unknown534;                             // 0x534
    int unknown538;                             // 0x538
    int unknown53C;                             // 0x53C
    int unknown540;                             // 0x540
    int unknown544;                             // 0x544
    int unknown548;                             // 0x548
    int unknown54C;                             // 0x54C
    int unknown550;                             // 0x550
    int unknown554;                             // 0x554
    int unknown558;                             // 0x558
    int unknown55C;                             // 0x55C
    int unknown560;                             // 0x560
    int unknown564;                             // 0x564
    int unknown568;                             // 0x568
    int unknown56C;                             // 0x56C
    int unknown570;                             // 0x570
    int unknown574;                             // 0x574
    int unknown578;                             // 0x578
    int unknown57C;                             // 0x57C
    int unknown580;                             // 0x580
    int unknown584;                             // 0x584
    int unknown588;                             // 0x588
    int anim_num;                             // 0x58C
    int* anim_curr_flags_ptr;                             // 0x590
    int anim_curr_flags;                             // 0x594
    int* anim_requested;                             // 0x598
    int* anim_cache_curr;                             // 0x59C
    int* anim_cache_persist;                             // 0x5A0
    int* anim_curr_ARAM;                             // 0x5A4
    int* anim_persist_ARAM;                             // 0x5A8
    int unknown5AC;                             // 0x5AC
    int unknown5B0;                             // 0x5B0
    int unknown5B4;                             // 0x5B4
    int unknown5B8;                             // 0x5B8
    int unknown5BC;                             // 0x5BC
    int unknown5C0;                             // 0x5C0
    int unknown5C4;                             // 0x5C4
    int unknown5C8;                             // 0x5C8
    int unknown5CC;                             // 0x5CC
    int unknown5D0;                             // 0x5D0
    int unknown5D4;                             // 0x5D4
    int unknown5D8;                             // 0x5D8
    int unknown5DC;                             // 0x5DC
    int unknown5E0;                             // 0x5E0
    int unknown5E4;                             // 0x5E4
    FighterBone *bones;                             // 0x5E8
    int bone_num;                             // 0x5EC
    int unknown5F0;                             // 0x5F0
    int unknown5F4;                             // 0x5F4
    int item_held_bool;                             // 0x5F8
    int unknown5FC;                             // 0x5FC
    int unknown600;                             // 0x600
    int unknown604;                             // 0x604
    int unknown608;                             // 0x608
    Effect* gfx;                             // 0x60C
    int unknown610;                             // 0x610
    int unknown614;                             // 0x614
    char player_controller_number;                             // 0x618
    char costume_id;                             // 0x619
    char color_overlay_id;                             // 0x61A
    char team_id_red;                             // 0x61B
    char team_id_blue;                             // 0x61C
    char team_id_green;                             // 0x61D
    char unknown61E;                             // 0x61E
    char unknown61F;                             // 0x61F

    // input data
    float input_lstick_x;                             // 0x620
    float input_lstick_y;                             // 0x624
    float input_lstick_prev_x;                             // 0x628
    float input_lstick_prev_y;                             // 0x62C
    int unknown630;                             // 0x630
    int unknown634;                             // 0x634
    float input_cstick_x;                             // 0x638
    float input_cstick_y;                             // 0x63C
    int x640;                             // 0x640
    int unknown644;                             // 0x644
    int unknown648;                             // 0x648
    int unknown64C;                             // 0x64C
    float input_trigger;                             // 0x650
    int unknown654;                             // 0x654
    int unknown658;                             // 0x658
    int input_held;                             // 0x65C
    int input_held_prev;                             // 0x660
    int unknown664;                             // 0x664
    int input_pressed;                             // 0x668
    int unknown66C;                             // 0x66C
    char inputtimer_lstick_tilt_x;                             // 0x670
    char inputtimer_lstick_tilt_y;                             // 0x671
    char inputtimer_trigger_analog;                                   // 0x672
    char inputtimer_lstick_smash_x;                            // 0x673
    char inputtimer_lstick_smash_y;                            // 0x674
    char inputtimer_trigger_digital;                             // 0x675
    char inputtimer_lstick_any_x;                             // 0x676
    char inputtimer_lstick_any_y;                             // 0x677
    char inputtimer_trigger_any;                             // 0x678
    char x679;                             // 0x679
    char x67A;                             // 0x67A
    char x67B;                             // 0x67B
    char inputtimer_a;                             // 0x67C
    char inputtimer_b;                             // 0x67D
    char inputtimer_xy;                             // 0x67E
    char inputtimer_z;                             // 0x67F
    char inputtimer_LR;                             // 0x680
    char inputtimer_padup;                             // 0x681
    char inputtimer_paddown;                             // 0x682
    char timer_item_release;                             // 0x683
    char timer_unk;                             // 0x684
    char timer_unk2;                             // 0x685
    char timer_unk3;                             // 0x686
    char timer_unk4;                             // 0x687
    char inputtimer_sideb;                             // 0x688
    char inputtimer_neutralb;                             // 0x689
    char inputtimer_unk;                             // 0x68A
    char inputtimer_unk2;                             // 0x68B
    Vec3 animOffset;
    int x698;
    int x69C;
    int x6A0;
    int x6A4;
    float unk_y_offset_from_double_jump_position;                             // 0x6A8
    float unk6AC;                             // 0x6AC
    int unknown6B0;                             // 0x6B0
    int unknown6B4;                             // 0x6B4
    int unknown6B8;                             // 0x6B8
    float input_stickangle;                             // 0x6BC
    int unknown6C0;                             // 0x6C0
    int unknown6C4;                             // 0x6C4
    int unknown6C8;                             // 0x6C8
    int unknown6CC;                             // 0x6CC
    int unknown6D0;                             // 0x6D0
    int unknown6D4;                             // 0x6D4
    int unknown6D8;                             // 0x6D8
    int unknown6DC;                             // 0x6DC
    int unknown6E0;                             // 0x6E0
    int unknown6E4;                             // 0x6E4
    int unknown6E8;                             // 0x6E8
    int unknown6EC;                             // 0x6EC
    CollData collData;                             // 0x6F0 -> 0x88C
    CameraBox *cameraBox;                             // 0x890
    float stateFrame;                             // 0x894
    int unknown898;                             // 0x898
    float stateSpeed;                             // 0x89C
    int x8a0;                                      // 0x8a0
    float stateBlend;                                      // 0x8a4
    int x8a8;                                      // 0x8a8
    int x8ac;                             // 0x8ac
    int x8b0;                             // 0x8b0
    int x8b4;                             // 0x8b4
    int x8b8;                             // 0x8b8
    int x8bc;                             // 0x8bc
    int x8c0;                             // 0x8c0
    int x8c4;                             // 0x8c4
    int x8c8;                             // 0x8c8
    int x8cc;                             // 0x8cc
    int x8d0;                             // 0x8d0
    int x8d4;                             // 0x8d4
    int x8d8;                             // 0x8d8
    int x8dc;                             // 0x8dc
    int x8e0;                             // 0x8e0
    int x8e4;                             // 0x8e4
    int x8e8;                             // 0x8e8
    int x8ec;                             // 0x8ec
    int x8f0;                             // 0x8f0
    int x8f4;                             // 0x8f4
    int x8f8;                             // 0x8f8
    int x8fc;                             // 0x8fc
    int x900;                             // 0x900
    int x904;                             // 0x904
    int x908;                             // 0x908
    int x90c;                             // 0x90c
    int x910;                             // 0x910
    Hitbox hitbox[4];                             //0x914
    int xdf4;                             // 0xdf4
    int xdf8;                             // 0xdf8
    int xdfc;                             // 0xdfc
    int xe00;                             // 0xe00
    int xe04;                             // 0xe04
    int xe08;                             // 0xe08
    int xe0c;                             // 0xe0c
    int xe10;                             // 0xe10
    int xe14;                             // 0xe14
    int xe18;                             // 0xe18
    int xe1c;                             // 0xe1c
    int xe20;                             // 0xe20
    int xe24;                             // 0xe24
    int xe28;                             // 0xe28
    int xe2c;                             // 0xe2c
    int xe30;                             // 0xe30
    int xe34;                             // 0xe34
    int xe38;                             // 0xe38
    int xe3c;                             // 0xe3c
    int xe40;                             // 0xe40
    int xe44;                             // 0xe44
    int xe48;                             // 0xe48
    int xe4c;                             // 0xe4c
    int xe50;                             // 0xe50
    int xe54;                             // 0xe54
    int xe58;                             // 0xe58
    int xe5c;                             // 0xe5c
    int xe60;                             // 0xe60
    int xe64;                             // 0xe64
    int xe68;                             // 0xe68
    int xe6c;                             // 0xe6c
    int xe70;                             // 0xe70
    int xe74;                             // 0xe74
    int xe78;                             // 0xe78
    int xe7c;                             // 0xe7c
    int xe80;                             // 0xe80
    int xe84;                             // 0xe84
    int xe88;                             // 0xe88
    int xe8c;                             // 0xe8c
    int xe90;                             // 0xe90
    int xe94;                             // 0xe94
    int xe98;                             // 0xe98
    int xe9c;                             // 0xe9c
    int xea0;                             // 0xea0
    int xea4;                             // 0xea4
    int xea8;                             // 0xea8
    int xeac;                             // 0xeac
    int xeb0;                             // 0xeb0
    int xeb4;                             // 0xeb4
    int xeb8;                             // 0xeb8
    int xebc;                             // 0xebc
    int xec0;                             // 0xec0
    int xec4;                             // 0xec4
    int xec8;                             // 0xec8
    int xecc;                             // 0xecc
    int xed0;                             // 0xed0
    int xed4;                             // 0xed4
    int xed8;                             // 0xed8
    int xedc;                             // 0xedc
    int xee0;                             // 0xee0
    int xee4;                             // 0xee4
    int xee8;                             // 0xee8
    int xeec;                             // 0xeec
    int xef0;                             // 0xef0
    int xef4;                             // 0xef4
    int xef8;                             // 0xef8
    int xefc;                             // 0xefc
    int xf00;                             // 0xf00
    int xf04;                             // 0xf04
    int xf08;                             // 0xf08
    int xf0c;                             // 0xf0c
    int xf10;                             // 0xf10
    int xf14;                             // 0xf14
    int xf18;                             // 0xf18
    int xf1c;                             // 0xf1c
    int xf20;                             // 0xf20
    int xf24;                             // 0xf24
    int xf28;                             // 0xf28
    int xf2c;                             // 0xf2c
    int xf30;                             // 0xf30
    int xf34;                             // 0xf34
    int xf38;                             // 0xf38
    int xf3c;                             // 0xf3c
    int xf40;                             // 0xf40
    int xf44;                             // 0xf44
    int xf48;                             // 0xf48
    int xf4c;                             // 0xf4c
    int xf50;                             // 0xf50
    int xf54;                             // 0xf54
    int xf58;                             // 0xf58
    int xf5c;                             // 0xf5c
    int xf60;                             // 0xf60
    int xf64;                             // 0xf64
    int xf68;                             // 0xf68
    int xf6c;                             // 0xf6c
    int xf70;                             // 0xf70
    int xf74;                             // 0xf74
    int xf78;                             // 0xf78
    int xf7c;                             // 0xf7c
    int xf80;                             // 0xf80
    int xf84;                             // 0xf84
    int xf88;                             // 0xf88
    int xf8c;                             // 0xf8c
    int xf90;                             // 0xf90
    int xf94;                             // 0xf94
    int xf98;                             // 0xf98
    int xf9c;                             // 0xf9c
    int xfa0;                             // 0xfa0
    int xfa4;                             // 0xfa4
    int xfa8;                             // 0xfa8
    int xfac;                             // 0xfac
    int xfb0;                             // 0xfb0
    int xfb4;                             // 0xfb4
    int xfb8;                             // 0xfb8
    int xfbc;                             // 0xfbc
    int xfc0;                             // 0xfc0
    int xfc4;                             // 0xfc4
    int xfc8;                             // 0xfc8
    int xfcc;                             // 0xfcc
    int xfd0;                             // 0xfd0
    int xfd4;                             // 0xfd4
    int xfd8;                             // 0xfd8
    int xfdc;                             // 0xfdc
    int xfe0;                             // 0xfe0
    int xfe4;                             // 0xfe4
    int xfe8;                             // 0xfe8
    int xfec;                             // 0xfec
    int xff0;                             // 0xff0
    int xff4;                             // 0xff4
    int xff8;                             // 0xff8
    int xffc;                             // 0xffc
    int x1000;                             // 0x1000
    int x1004;                             // 0x1004
    int x1008;                             // 0x1008
    int x100c;                             // 0x100c
    int x1010;                             // 0x1010
    int x1014;                             // 0x1014
    int x1018;                             // 0x1018
    int x101c;                             // 0x101c
    int x1020;                             // 0x1020
    int x1024;                             // 0x1024
    int x1028;                             // 0x1028
    int x102c;                             // 0x102c
    int x1030;                             // 0x1030
    int x1034;                             // 0x1034
    int x1038;                             // 0x1038
    int x103c;                             // 0x103c
    int x1040;                             // 0x1040
    int x1044;                             // 0x1044
    int x1048;                             // 0x1048
    int x104c;                             // 0x104c
    int x1050;                             // 0x1050
    int x1054;                             // 0x1054
    int x1058;                             // 0x1058
    int x105c;                             // 0x105c
    int x1060;                             // 0x1060
    int center_status;                             // 0x1064
    int x1068;                             // 0x1068
    int x106c;                             // 0x106c
    int x1070;                             // 0x1070
    int x1074;                             // 0x1074
    int x1078;                             // 0x1078
    int x107c;                             // 0x107c
    int x1080;                             // 0x1080
    int x1084;                             // 0x1084
    int x1088;                             // 0x1088
    int x108c;                             // 0x108c
    int x1090;                             // 0x1090
    int x1094;                             // 0x1094
    int x1098;                             // 0x1098
    int x109c;                             // 0x109c
    int x10a0;                             // 0x10a0
    int x10a4;                             // 0x10a4
    int x10a8;                             // 0x10a8
    int x10ac;                             // 0x10ac
    Vec3 center_pos;                             // 0x10b0
    Vec3 center_pos_prev;                           // 0x10bc
    int x10c8;                             // 0x10c8
    int x10cc;                             // 0x10cc
    int x10d0;                             // 0x10d0
    int x10d4;                             // 0x10d4
    int x10d8;                             // 0x10d8
    int x10dc;                             // 0x10dc
    int x10e0;                             // 0x10e0
    int x10e4;                             // 0x10e4
    int x10e8;                             // 0x10e8
    int x10ec;                             // 0x10ec
    int x10f0;                             // 0x10f0
    int x10f4;                             // 0x10f4
    int x10f8;                             // 0x10f8
    int x10fc;                             // 0x10fc
    int x1100;                             // 0x1100
    int x1104;                             // 0x1104
    int x1108;                             // 0x1108
    int x110c;                             // 0x110c
    int x1110;                             // 0x1110
    int x1114;                             // 0x1114
    int x1118;                             // 0x1118
    int x111c;                             // 0x111c
    int x1120;                             // 0x1120
    int x1124;                             // 0x1124
    int x1128;                             // 0x1128
    int x112c;                             // 0x112c
    int x1130;                             // 0x1130
    int x1134;                             // 0x1134
    int x1138;                             // 0x1138
    int x113c;                             // 0x113c
    int x1140;                             // 0x1140
    int x1144;                             // 0x1144
    int x1148;                             // 0x1148
    int x114c;                             // 0x114c
    int x1150;                             // 0x1150
    int x1154;                             // 0x1154
    int x1158;                             // 0x1158
    int x115c;                             // 0x115c
    int x1160;                             // 0x1160
    int x1164;                             // 0x1164
    int x1168;                             // 0x1168
    int x116c;                             // 0x116c
    int x1170;                             // 0x1170
    int x1174;                             // 0x1174
    int x1178;                             // 0x1178
    int x117c;                             // 0x117c
    int x1180;                             // 0x1180
    int x1184;                             // 0x1184
    int x1188;                             // 0x1188
    int x118c;                             // 0x118c
    int x1190;                             // 0x1190
    int x1194;                             // 0x1194
    GOBJ* hitException;                             // 0x1198, gobj this fighter cannot hit
    char teamID;                             // 0x119c, friendly fire related
    char grabbersID;                             //0x119D, slot ID of the person grabbing this fighter
    char hurtboxNum;                             //0x119E, number of hurtboxesz
    Hurtbox hurtbox[15];                             //0x0x11A0
    int x1614;                             // 0x1614
    int x1618;                             // 0x1618
    int x161c;                             // 0x161c
    int x1620;                             // 0x1620
    int x1624;                             // 0x1624
    int x1628;                             // 0x1628
    int x162c;                             // 0x162c
    int x1630;                             // 0x1630
    int x1634;                             // 0x1634
    int x1638;                             // 0x1638
    int x163c;                             // 0x163c
    int x1640;                             // 0x1640
    int x1644;                             // 0x1644
    int x1648;                             // 0x1648
    int x164c;                             // 0x164c
    int x1650;                             // 0x1650
    int x1654;                             // 0x1654
    int x1658;                             // 0x1658
    int x165c;                             // 0x165c
    int x1660;                             // 0x1660
    int x1664;                             // 0x1664
    int x1668;                             // 0x1668
    int dynamics_hit_num;                             // 0x166c
    int dynamics_hit_num_unk;                             // 0x1670
    int x1674;                             // 0x1674
    int x1678;                             // 0x1678
    int x167c;                             // 0x167c
    JOBJ* dynamics_hit_joint;                             // 0x1680
    int x1684;                             // 0x1684
    Vec3 dynamics_hit_pos;                             // 0x1688
    int x1694;                             // 0x1694
    int x1698;                             // 0x1698
    int x169c;                             // 0x169c
    int x16a0;                             // 0x16a0
    int x16a4;                             // 0x16a4
    int x16a8;                             // 0x16a8
    int x16ac;                             // 0x16ac
    int x16b0;                             // 0x16b0
    int x16b4;                             // 0x16b4
    int x16b8;                             // 0x16b8
    int x16bc;                             // 0x16bc
    int x16c0;                             // 0x16c0
    int x16c4;                             // 0x16c4
    int x16c8;                             // 0x16c8
    int x16cc;                             // 0x16cc
    int x16d0;                             // 0x16d0
    int x16d4;                             // 0x16d4
    int x16d8;                             // 0x16d8
    int x16dc;                             // 0x16dc
    int x16e0;                             // 0x16e0
    int x16e4;                             // 0x16e4
    int x16e8;                             // 0x16e8
    int x16ec;                             // 0x16ec
    int x16f0;                             // 0x16f0
    int x16f4;                             // 0x16f4
    int x16f8;                             // 0x16f8
    int x16fc;                             // 0x16fc
    int x1700;                             // 0x1700
    int x1704;                             // 0x1704
    int x1708;                             // 0x1708
    int x170c;                             // 0x170c
    int x1710;                             // 0x1710
    int x1714;                             // 0x1714
    int x1718;                             // 0x1718
    int x171c;                             // 0x171c
    int x1720;                             // 0x1720
    int x1724;                             // 0x1724
    int x1728;                             // 0x1728
    int x172c;                             // 0x172c
    int x1730;                             // 0x1730
    int x1734;                             // 0x1734
    int x1738;                             // 0x1738
    int x173c;                             // 0x173c
    int x1740;                             // 0x1740
    int x1744;                             // 0x1744
    int x1748;                             // 0x1748
    int x174c;                             // 0x174c
    int x1750;                             // 0x1750
    int x1754;                             // 0x1754
    int x1758;                             // 0x1758
    int x175c;                             // 0x175c
    int x1760;                             // 0x1760
    int x1764;                             // 0x1764
    int x1768;                             // 0x1768
    int x176c;                             // 0x176c
    int x1770;                             // 0x1770
    int x1774;                             // 0x1774
    int x1778;                             // 0x1778
    int x177c;                             // 0x177c
    int x1780;                             // 0x1780
    int x1784;                             // 0x1784
    int x1788;                             // 0x1788
    int x178c;                             // 0x178c
    int x1790;                             // 0x1790
    int x1794;                             // 0x1794
    int x1798;                             // 0x1798
    int x179c;                             // 0x179c
    int x17a0;                             // 0x17a0
    int x17a4;                             // 0x17a4
    int x17a8;                             // 0x17a8
    int x17ac;                             // 0x17ac
    int x17b0;                             // 0x17b0
    int x17b4;                             // 0x17b4
    int x17b8;                             // 0x17b8
    int x17bc;                             // 0x17bc
    int x17c0;                             // 0x17c0
    int x17c4;                             // 0x17c4
    int x17c8;                             // 0x17c8
    int x17cc;                             // 0x17cc
    int x17d0;                             // 0x17d0
    int x17d4;                             // 0x17d4
    int x17d8;                             // 0x17d8
    int x17dc;                             // 0x17dc
    int x17e0;                             // 0x17e0
    int x17e4;                             // 0x17e4
    int x17e8;                             // 0x17e8
    int x17ec;                             // 0x17ec
    int x17f0;                             // 0x17f0
    int x17f4;                             // 0x17f4
    int x17f8;                             // 0x17f8
    int x17fc;                             // 0x17fc
    int x1800;                             // 0x1800
    int x1804;                             // 0x1804
    int x1808;                             // 0x1808
    int x180c;                             // 0x180c
    int x1810;                             // 0x1810
    int x1814;                             // 0x1814
    int x1818;                             // 0x1818
    int x181c;                             // 0x181c
    int x1820;                             // 0x1820
    int x1824;                             // 0x1824
    int x1828;                             // 0x1828
    int damage_Behavior;                             // 0x182c
    float damage_Percent;                             // 0x1830
    int x1834;                             // 0x1834
    float damage_PercentTemp;                             // 0x1838
    float damage_DamageApplied;                             // 0x183c
    int x1840;                             // 0x1840
    float damage_Direction;                             // 0x1844
    int damage_KBAngle;                             // 0x1848
    int damage_DamagedHurtbox;                             // 0x184c
    float damage_ForceApplied;                             // 0x1850
    float damage_CollisionX;                             // 0x1854
    float damage_CollisionY;                             // 0x1858
    float damage_CollisionZ;                             // 0x185c
    int damage_Dealt;                             // 0x1860
    int x1864;                             // 0x1864
    GOBJ* damage_SourceGOBJ;                             // 0x1868
    int x186c;                             // 0x186c
    int x1870;                             // 0x1870
    int x1874;                             // 0x1874
    int x1878;                             // 0x1878
    int x187c;                             // 0x187c
    int x1880;                             // 0x1880
    int x1884;                             // 0x1884
    int x1888;                             // 0x1888
    int x188c;                             // 0x188c
    int x1890;                             // 0x1890
    int x1894;                             // 0x1894
    int x1898;                             // 0x1898
    int x189c;                             // 0x189c
    int x18a0;                             // 0x18a0
    float damage_KBMagnitude;                             // 0x18a4
    int x18a8;                             // 0x18a8
    int damage_FramesSinceHit;                             // 0x18ac
    int x18b0;                             // 0x18b0
    float damage_Armor;                             // 0x18b4
    int x18b8;                             // 0x18b8
    int x18bc;                             // 0x18bc
    int x18c0;                             // 0x18c0
    int damage_SourceFighterID;                             // 0x18c4
    int x18c8;                             // 0x18c8
    int x18cc;                             // 0x18cc
    int x18d0;                             // 0x18d0
    int x18d4;                             // 0x18d4
    int x18d8;                             // 0x18d8
    int x18dc;                             // 0x18dc
    int x18e0;                             // 0x18e0
    int x18e4;                             // 0x18e4
    int x18e8;                             // 0x18e8
    int x18ec;                             // 0x18ec
    int x18f0;                             // 0x18f0
    int x18f4;                             // 0x18f4
    int x18f8;                             // 0x18f8
    int x18fc;                             // 0x18fc
    int x1900;                             // 0x1900
    int x1904;                             // 0x1904
    int x1908;                             // 0x1908
    int x190c;                             // 0x190c
    int x1910;                             // 0x1910
    int x1914;                             // 0x1914
    int x1918;                             // 0x1918
    int x191c;                             // 0x191c
    int x1920;                             // 0x1920
    int x1924;                             // 0x1924
    int x1928;                             // 0x1928
    int x192c;                             // 0x192c
    int x1930;                             // 0x1930
    int x1934;                             // 0x1934
    int x1938;                             // 0x1938
    int x193c;                             // 0x193c
    int x1940;                             // 0x1940
    int x1944;                             // 0x1944
    int x1948;                             // 0x1948
    int x194c;                             // 0x194c
    int x1950;                             // 0x1950
    int x1954;                             // 0x1954
    int x1958;                             // 0x1958
    int x195c;                             // 0x195c
    int x1960;                             // 0x1960
    int x1964;                             // 0x1964
    char jumps_used;                             // 0x1968
    int x196c;                             // 0x196c
    int x1970;                             // 0x1970
    GOBJ *heldItem;                             // 0x1974
    int x1978;                             // 0x1978
    int x197c;                             // 0x197c
    GOBJ *headItem;                             // 0x1980
    GOBJ *heldItemSpecial;                             // 0x1984
    int bodystate_script;                             // 0x1988
    int bodystate_game;                             // 0x198c
    int x1990;                             // 0x1990
    int x1994;                             // 0x1994
    int x1998;                             // 0x1998
    int x199c;                             // 0x199c
    int x19a0;                             // 0x19a0
    int x19a4;                             // 0x19a4
    int x19a8;                             // 0x19a8
    int x19ac;                             // 0x19ac
    int x19b0;                             // 0x19b0
    int x19b4;                             // 0x19b4
    int x19b8;                             // 0x19b8
    int x19bc;                             // 0x19bc
    int x19c0;                             // 0x19c0
    int x19c4;                             // 0x19c4
    int x19c8;                             // 0x19c8
    int x19cc;                             // 0x19cc
    int x19d0;                             // 0x19d0
    int x19d4;                             // 0x19d4
    int x19d8;                             // 0x19d8
    int x19dc;                             // 0x19dc
    int x19e0;                             // 0x19e0
    int x19e4;                             // 0x19e4
    int x19e8;                             // 0x19e8
    int x19ec;                             // 0x19ec
    int x19f0;                             // 0x19f0
    int x19f4;                             // 0x19f4
    int x19f8;                             // 0x19f8
    int x19fc;                             // 0x19fc
    int x1a00;                             // 0x1a00
    int x1a04;                             // 0x1a04
    int x1a08;                             // 0x1a08
    int x1a0c;                             // 0x1a0c
    int x1a10;                             // 0x1a10
    int x1a14;                             // 0x1a14
    int x1a18;                             // 0x1a18
    int x1a1c;                             // 0x1a1c
    int x1a20;                             // 0x1a20
    int x1a24;                             // 0x1a24
    int x1a28;                             // 0x1a28
    float reflect_hitDirection;                             // 0x1a2c
    int x1a30;                             // 0x1a30
    int x1a34;                             // 0x1a34
    int x1a38;                             // 0x1a38
    int x1a3c;                             // 0x1a3c
    int x1a40;                             // 0x1a40
    int x1a44;                             // 0x1a44
    int x1a48;                             // 0x1a48
    float grab_timer;                             // 0x1a4c
    int x1a50;                             // 0x1a50
    int x1a54;                             // 0x1a54
    GOBJ* grab_attacker;                             // 0x1a58
    GOBJ* grab_victim;                            // 0x1a5c
    int x1a60;                             // 0x1a60
    int x1a64;                             // 0x1a64
    int x1a68;                             // 0x1a68
    int x1a6c;                             // 0x1a6c
    int x1a70;                             // 0x1a70
    int x1a74;                             // 0x1a74
    int x1a78;                             // 0x1a78
    int x1a7c;                             // 0x1a7c
    int x1a80;                             // 0x1a80
    int x1a84;                             // 0x1a84
    int x1a88;                             // 0x1a88
    int x1a8c;                             // 0x1a8c
    int x1a90;                             // 0x1a90
    int x1a94;                             // 0x1a94
    int x1a98;                             // 0x1a98
    int x1a9c;                             // 0x1a9c
    int x1aa0;                             // 0x1aa0
    int x1aa4;                             // 0x1aa4
    int x1aa8;                             // 0x1aa8
    int x1aac;                             // 0x1aac
    int x1ab0;                             // 0x1ab0
    int x1ab4;                             // 0x1ab4
    int x1ab8;                             // 0x1ab8
    int x1abc;                             // 0x1abc
    int x1ac0;                             // 0x1ac0
    int x1ac4;                             // 0x1ac4
    int x1ac8;                             // 0x1ac8
    int x1acc;                             // 0x1acc
    int x1ad0;                             // 0x1ad0
    int x1ad4;                             // 0x1ad4
    int x1ad8;                             // 0x1ad8
    int x1adc;                             // 0x1adc
    int x1ae0;                             // 0x1ae0
    int x1ae4;                             // 0x1ae4
    int x1ae8;                             // 0x1ae8
    int x1aec;                             // 0x1aec
    int x1af0;                             // 0x1af0
    int x1af4;                             // 0x1af4
    int x1af8;                             // 0x1af8
    int x1afc;                             // 0x1afc
    int x1b00;                             // 0x1b00
    int x1b04;                             // 0x1b04
    int x1b08;                             // 0x1b08
    int x1b0c;                             // 0x1b0c
    int x1b10;                             // 0x1b10
    int x1b14;                             // 0x1b14
    int x1b18;                             // 0x1b18
    int x1b1c;                             // 0x1b1c
    int x1b20;                             // 0x1b20
    int x1b24;                             // 0x1b24
    int x1b28;                             // 0x1b28
    int x1b2c;                             // 0x1b2c
    int x1b30;                             // 0x1b30
    int x1b34;                             // 0x1b34
    int x1b38;                             // 0x1b38
    int x1b3c;                             // 0x1b3c
    int x1b40;                             // 0x1b40
    int x1b44;                             // 0x1b44
    int x1b48;                             // 0x1b48
    int x1b4c;                             // 0x1b4c
    int x1b50;                             // 0x1b50
    int x1b54;                             // 0x1b54
    int x1b58;                             // 0x1b58
    int x1b5c;                             // 0x1b5c
    int x1b60;                             // 0x1b60
    int x1b64;                             // 0x1b64
    int x1b68;                             // 0x1b68
    int x1b6c;                             // 0x1b6c
    int x1b70;                             // 0x1b70
    int x1b74;                             // 0x1b74
    int x1b78;                             // 0x1b78
    int x1b7c;                             // 0x1b7c
    int x1b80;                             // 0x1b80
    int x1b84;                             // 0x1b84
    int x1b88;                             // 0x1b88
    int x1b8c;                             // 0x1b8c
    int x1b90;                             // 0x1b90
    int x1b94;                             // 0x1b94
    int x1b98;                             // 0x1b98
    int x1b9c;                             // 0x1b9c
    int x1ba0;                             // 0x1ba0
    int x1ba4;                             // 0x1ba4
    int x1ba8;                             // 0x1ba8
    int x1bac;                             // 0x1bac
    int x1bb0;                             // 0x1bb0
    int x1bb4;                             // 0x1bb4
    int x1bb8;                             // 0x1bb8
    int x1bbc;                             // 0x1bbc
    int x1bc0;                             // 0x1bc0
    int x1bc4;                             // 0x1bc4
    int x1bc8;                             // 0x1bc8
    int x1bcc;                             // 0x1bcc
    int x1bd0;                             // 0x1bd0
    int x1bd4;                             // 0x1bd4
    int x1bd8;                             // 0x1bd8
    int x1bdc;                             // 0x1bdc
    int x1be0;                             // 0x1be0
    int x1be4;                             // 0x1be4
    int x1be8;                             // 0x1be8
    int x1bec;                             // 0x1bec
    int x1bf0;                             // 0x1bf0
    int x1bf4;                             // 0x1bf4
    int x1bf8;                             // 0x1bf8
    int x1bfc;                             // 0x1bfc
    int x1c00;                             // 0x1c00
    int x1c04;                             // 0x1c04
    int x1c08;                             // 0x1c08
    int x1c0c;                             // 0x1c0c
    int x1c10;                             // 0x1c10
    int x1c14;                             // 0x1c14
    int x1c18;                             // 0x1c18
    int x1c1c;                             // 0x1c1c
    int x1c20;                             // 0x1c20
    int x1c24;                             // 0x1c24
    int x1c28;                             // 0x1c28
    int x1c2c;                             // 0x1c2c
    int x1c30;                             // 0x1c30
    int x1c34;                             // 0x1c34
    int x1c38;                             // 0x1c38
    int x1c3c;                             // 0x1c3c
    int x1c40;                             // 0x1c40
    int x1c44;                             // 0x1c44
    int x1c48;                             // 0x1c48
    int x1c4c;                             // 0x1c4c
    int x1c50;                             // 0x1c50
    int x1c54;                             // 0x1c54
    int x1c58;                             // 0x1c58
    int x1c5c;                             // 0x1c5c
    int x1c60;                             // 0x1c60
    int x1c64;                             // 0x1c64
    int x1c68;                             // 0x1c68
    int x1c6c;                             // 0x1c6c
    int x1c70;                             // 0x1c70
    int x1c74;                             // 0x1c74
    int x1c78;                             // 0x1c78
    int x1c7c;                             // 0x1c7c
    int x1c80;                             // 0x1c80
    int x1c84;                             // 0x1c84
    int x1c88;                             // 0x1c88
    int x1c8c;                             // 0x1c8c
    int x1c90;                             // 0x1c90
    int x1c94;                             // 0x1c94
    int x1c98;                             // 0x1c98
    int x1c9c;                             // 0x1c9c
    int x1ca0;                             // 0x1ca0
    int x1ca4;                             // 0x1ca4
    int x1ca8;                             // 0x1ca8
    int x1cac;                             // 0x1cac
    int x1cb0;                             // 0x1cb0
    int x1cb4;                             // 0x1cb4
    int x1cb8;                             // 0x1cb8
    int x1cbc;                             // 0x1cbc
    int x1cc0;                             // 0x1cc0
    int x1cc4;                             // 0x1cc4
    int x1cc8;                             // 0x1cc8
    int x1ccc;                             // 0x1ccc
    int x1cd0;                             // 0x1cd0
    int x1cd4;                             // 0x1cd4
    int x1cd8;                             // 0x1cd8
    int x1cdc;                             // 0x1cdc
    int x1ce0;                             // 0x1ce0
    int x1ce4;                             // 0x1ce4
    int x1ce8;                             // 0x1ce8
    int x1cec;                             // 0x1cec
    int x1cf0;                             // 0x1cf0
    int x1cf4;                             // 0x1cf4
    int x1cf8;                             // 0x1cf8
    int x1cfc;                             // 0x1cfc
    int x1d00;                             // 0x1d00
    int x1d04;                             // 0x1d04
    int x1d08;                             // 0x1d08
    int x1d0c;                             // 0x1d0c
    int x1d10;                             // 0x1d10
    int x1d14;                             // 0x1d14
    int x1d18;                             // 0x1d18
    int x1d1c;                             // 0x1d1c
    int x1d20;                             // 0x1d20
    int x1d24;                             // 0x1d24
    int x1d28;                             // 0x1d28
    int x1d2c;                             // 0x1d2c
    int x1d30;                             // 0x1d30
    int x1d34;                             // 0x1d34
    int x1d38;                             // 0x1d38
    int x1d3c;                             // 0x1d3c
    int x1d40;                             // 0x1d40
    int x1d44;                             // 0x1d44
    int x1d48;                             // 0x1d48
    int x1d4c;                             // 0x1d4c
    int x1d50;                             // 0x1d50
    int x1d54;                             // 0x1d54
    int x1d58;                             // 0x1d58
    int x1d5c;                             // 0x1d5c
    int x1d60;                             // 0x1d60
    int x1d64;                             // 0x1d64
    int x1d68;                             // 0x1d68
    int x1d6c;                             // 0x1d6c
    int x1d70;                             // 0x1d70
    int x1d74;                             // 0x1d74
    int x1d78;                             // 0x1d78
    int x1d7c;                             // 0x1d7c
    int x1d80;                             // 0x1d80
    int x1d84;                             // 0x1d84
    int x1d88;                             // 0x1d88
    int x1d8c;                             // 0x1d8c
    int x1d90;                             // 0x1d90
    int x1d94;                             // 0x1d94
    int x1d98;                             // 0x1d98
    int x1d9c;                             // 0x1d9c
    int x1da0;                             // 0x1da0
    int x1da4;                             // 0x1da4
    int x1da8;                             // 0x1da8
    int x1dac;                             // 0x1dac
    int x1db0;                             // 0x1db0
    int x1db4;                             // 0x1db4
    int x1db8;                             // 0x1db8
    int x1dbc;                             // 0x1dbc
    int x1dc0;                             // 0x1dc0
    int x1dc4;                             // 0x1dc4
    int x1dc8;                             // 0x1dc8
    int x1dcc;                             // 0x1dcc
    int x1dd0;                             // 0x1dd0
    int x1dd4;                             // 0x1dd4
    int x1dd8;                             // 0x1dd8
    int x1ddc;                             // 0x1ddc
    int x1de0;                             // 0x1de0
    int x1de4;                             // 0x1de4
    int x1de8;                             // 0x1de8
    int x1dec;                             // 0x1dec
    int x1df0;                             // 0x1df0
    int x1df4;                             // 0x1df4
    int x1df8;                             // 0x1df8
    int x1dfc;                             // 0x1dfc
    int x1e00;                             // 0x1e00
    int x1e04;                             // 0x1e04
    int x1e08;                             // 0x1e08
    int x1e0c;                             // 0x1e0c
    int x1e10;                             // 0x1e10
    int x1e14;                             // 0x1e14
    int x1e18;                             // 0x1e18
    int x1e1c;                             // 0x1e1c
    int x1e20;                             // 0x1e20
    int x1e24;                             // 0x1e24
    int x1e28;                             // 0x1e28
    int x1e2c;                             // 0x1e2c
    int x1e30;                             // 0x1e30
    int x1e34;                             // 0x1e34
    int x1e38;                             // 0x1e38
    int x1e3c;                             // 0x1e3c
    int x1e40;                             // 0x1e40
    int x1e44;                             // 0x1e44
    int x1e48;                             // 0x1e48
    int x1e4c;                             // 0x1e4c
    int x1e50;                             // 0x1e50
    int x1e54;                             // 0x1e54
    int x1e58;                             // 0x1e58
    int x1e5c;                             // 0x1e5c
    int x1e60;                             // 0x1e60
    int x1e64;                             // 0x1e64
    int x1e68;                             // 0x1e68
    int x1e6c;                             // 0x1e6c
    int x1e70;                             // 0x1e70
    int x1e74;                             // 0x1e74
    int x1e78;                             // 0x1e78
    int x1e7c;                             // 0x1e7c
    int x1e80;                             // 0x1e80
    int x1e84;                             // 0x1e84
    int x1e88;                             // 0x1e88
    int x1e8c;                             // 0x1e8c
    int x1e90;                             // 0x1e90
    int x1e94;                             // 0x1e94
    int x1e98;                             // 0x1e98
    int x1e9c;                             // 0x1e9c
    int x1ea0;                             // 0x1ea0
    int x1ea4;                             // 0x1ea4
    int x1ea8;                             // 0x1ea8
    int x1eac;                             // 0x1eac
    int x1eb0;                             // 0x1eb0
    int x1eb4;                             // 0x1eb4
    int x1eb8;                             // 0x1eb8
    int x1ebc;                             // 0x1ebc
    int x1ec0;                             // 0x1ec0
    int x1ec4;                             // 0x1ec4
    int x1ec8;                             // 0x1ec8
    int x1ecc;                             // 0x1ecc
    int x1ed0;                             // 0x1ed0
    int x1ed4;                             // 0x1ed4
    int x1ed8;                             // 0x1ed8
    int x1edc;                             // 0x1edc
    int x1ee0;                             // 0x1ee0
    int x1ee4;                             // 0x1ee4
    int x1ee8;                             // 0x1ee8
    int x1eec;                             // 0x1eec
    int x1ef0;                             // 0x1ef0
    int x1ef4;                             // 0x1ef4
    int x1ef8;                             // 0x1ef8
    int x1efc;                             // 0x1efc
    int x1f00;                             // 0x1f00
    int x1f04;                             // 0x1f04
    int x1f08;                             // 0x1f08
    int x1f0c;                             // 0x1f0c
    int x1f10;                             // 0x1f10
    int x1f14;                             // 0x1f14
    int x1f18;                             // 0x1f18
    int x1f1c;                             // 0x1f1c
    int x1f20;                             // 0x1f20
    int x1f24;                             // 0x1f24
    int x1f28;                             // 0x1f28
    int x1f2c;                             // 0x1f2c
    int x1f30;                             // 0x1f30
    int x1f34;                             // 0x1f34
    int x1f38;                             // 0x1f38
    int x1f3c;                             // 0x1f3c
    int x1f40;                             // 0x1f40
    int x1f44;                             // 0x1f44
    int x1f48;                             // 0x1f48
    int x1f4c;                             // 0x1f4c
    int x1f50;                             // 0x1f50
    int x1f54;                             // 0x1f54
    int x1f58;                             // 0x1f58
    int x1f5c;                             // 0x1f5c
    int x1f60;                             // 0x1f60
    int x1f64;                             // 0x1f64
    int x1f68;                             // 0x1f68
    int x1f6c;                             // 0x1f6c
    int x1f70;                             // 0x1f70
    int x1f74;                             // 0x1f74
    int x1f78;                             // 0x1f78
    int x1f7c;                             // 0x1f7c
    int x1f80;                             // 0x1f80
    int x1f84;                             // 0x1f84
    int x1f88;                             // 0x1f88
    int x1f8c;                             // 0x1f8c
    int x1f90;                             // 0x1f90
    int x1f94;                             // 0x1f94
    int x1f98;                             // 0x1f98
    int x1f9c;                             // 0x1f9c
    int x1fa0;                             // 0x1fa0
    int x1fa4;                             // 0x1fa4
    int x1fa8;                             // 0x1fa8
    int x1fac;                             // 0x1fac
    int x1fb0;                             // 0x1fb0
    int x1fb4;                             // 0x1fb4
    int x1fb8;                             // 0x1fb8
    int x1fbc;                             // 0x1fbc
    int x1fc0;                             // 0x1fc0
    int x1fc4;                             // 0x1fc4
    int x1fc8;                             // 0x1fc8
    int x1fcc;                             // 0x1fcc
    int x1fd0;                             // 0x1fd0
    int x1fd4;                             // 0x1fd4
    int x1fd8;                             // 0x1fd8
    int x1fdc;                             // 0x1fdc
    int x1fe0;                             // 0x1fe0
    int x1fe4;                             // 0x1fe4
    int x1fe8;                             // 0x1fe8
    int x1fec;                             // 0x1fec
    int x1ff0;                             // 0x1ff0
    int x1ff4;                             // 0x1ff4
    int x1ff8;                             // 0x1ff8
    int x1ffc;                             // 0x1ffc
    int x2000;                             // 0x2000
    int x2004;                             // 0x2004
    int x2008;                             // 0x2008
    int x200c;                             // 0x200c
    int x2010;                             // 0x2010
    int x2014;                             // 0x2014
    int x2018;                             // 0x2018
    int x201c;                             // 0x201c
    int x2020;                             // 0x2020
    int x2024;                             // 0x2024
    int x2028;                             // 0x2028
    int x202c;                             // 0x202c
    int x2030;                             // 0x2030
    int x2034;                             // 0x2034
    int x2038;                             // 0x2038
    int x203c;                             // 0x203c
    int x2040;                             // 0x2040
    int x2044;                             // 0x2044
    int x2048;                             // 0x2048
    int x204c;                             // 0x204c
    int x2050;                             // 0x2050
    int x2054;                             // 0x2054
    int x2058;                             // 0x2058
    int x205c;                             // 0x205c
    int x2060;                             // 0x2060
    int x2064;                             // 0x2064
    int x2068;                             // 0x2068
    int x206c;                             // 0x206c
    int x2070;                             // 0x2070
    int x2074;                             // 0x2074
    int x2078;                             // 0x2078
    int x207c;                             // 0x207c
    int x2080;                             // 0x2080
    int x2084;                             // 0x2084
    int x2088;                             // 0x2088
    int x208c;                             // 0x208c
    int x2090;                             // 0x2090
    int x2094;                             // 0x2094
    int x2098;                             // 0x2098
    int x209c;                             // 0x209c
    int x20a0;                             // 0x20a0
    int x20a4;                             // 0x20a4
    int x20a8;                             // 0x20a8
    int x20ac;                             // 0x20ac
    int x20b0;                             // 0x20b0
    int x20b4;                             // 0x20b4
    int x20b8;                             // 0x20b8
    int x20bc;                             // 0x20bc
    int x20c0;                             // 0x20c0
    int x20c4;                             // 0x20c4
    int x20c8;                             // 0x20c8
    int x20cc;                             // 0x20cc
    int x20d0;                             // 0x20d0
    int x20d4;                             // 0x20d4
    int x20d8;                             // 0x20d8
    int x20dc;                             // 0x20dc
    int x20e0;                             // 0x20e0
    int x20e4;                             // 0x20e4
    int x20e8;                             // 0x20e8
    int x20ec;                             // 0x20ec
    int x20f0;                             // 0x20f0
    int x20f4;                             // 0x20f4
    int x20f8;                             // 0x20f8
    int x20fc;                             // 0x20fc
    int x2100;                             // 0x2100
    int x2104;                             // 0x2104
    int x2108;                             // 0x2108
    int x210c;                             // 0x210c
    int x2110;                             // 0x2110
    int x2114;                             // 0x2114
    int x2118;                             // 0x2118
    int x211c;                             // 0x211c
    int x2120;                             // 0x2120
    int x2124;                             // 0x2124
    int x2128;                             // 0x2128
    int x212c;                             // 0x212c
    int x2130;                             // 0x2130
    int x2134;                             // 0x2134
    int x2138;                             // 0x2138
    int x213c;                             // 0x213c
    int x2140;                             // 0x2140
    int x2144;                             // 0x2144
    int x2148;                             // 0x2148
    int x214c;                             // 0x214c
    int x2150;                             // 0x2150
    int x2154;                             // 0x2154
    int x2158;                             // 0x2158
    int x215c;                             // 0x215c
    int x2160;                             // 0x2160
    int x2164;                             // 0x2164
    int x2168;                             // 0x2168
    int x216c;                             // 0x216c
    int x2170;                             // 0x2170
    int x2174;                             // 0x2174
    int x2178;                             // 0x2178
    int x217c;                             // 0x217c
    int x2180;                             // 0x2180
    int x2184;                             // 0x2184
    int x2188;                             // 0x2188
    int x218c;                             // 0x218c
    void* cb_OnGrabFighter_Self;                             // 0x2190
    void* x2194;                             // 0x2194
    void* cb_OnGrabFighter_Victim;                             // 0x2198
    void* cb_IASA;                             // 0x219C
    void* cb_Anim;                             // 0x21A0
    void* cb_Phys;                             // 0x21a4
    void* cb_Coll;                             // 0x21a8
    void* cb_Cam;                             // 0x21ac
    void* cb_Accessory1;                             // 0x21b0
    void* cb_Accessory2;                             // 0x21b4
    void* cb_Accessory3;                             // 0x21b8
    void* cb_Accessory4;                             // 0x21bc
    void* cb_OnGiveDamage;                             // 0x21c0
    void* cb_OnShieldHit;                              // 0x21c4
    void* cb_OnReflectHit;                             // 0x21c8
    void* x21cc;                             // 0x21cc
    void* cb_EveryHitlag;                             // 0x21d0
    void* cb_EnterHitlag;                             // 0x21d4
    void* cb_ExitHitlag;                             // 0x21d8
    void* cb_OnTakeDamage;                             // 0x21dc
    void* cb_OnDeath;                             // 0x21e0
    void* cb_OnDeath2;                             // 0x21e4
    void* cb_OnDeath3;                             // 0x21e8
    void* cb_OnActionStateChange;                             // 0x21ec
    void* cb_OnTakeDamage2;                             // 0x21f0
    void* cb_OnHurtboxDetect;                             // 0x21f4
    void* cb_OnSpin;                             // 0x21f8
    int x21fc;                             // 0x21fc
    int subactionFlag0;                             // 0x2200
    int subactionFlag1;                             // 0x2204
    int subactionFlag2;                             // 0x2208
    int subactionFlag3;                             // 0x220C
    int subactionFlag4;                             // 0x2210
    int x2214;                             // 0x2214
    char flags_iasa;                             // 0x2218
    char flags_damage1;                             // 0x2219
    char flags_damage2;                             // 0x221a
    char flags_shield;                             // 0x221b
    char flags_hitstun;                             // 0x221c
    char flags_221D;                             // 0x221d
    char flags_221E;                             // 0x221e
    char flags_221F;                             // 0x221f
    char flags_2220;                             // 0x2220
    char flags_2221;                             // 0x2221
    char flags_2222;                             // 0x2222
    char flags_2223;                             // 0x2223
    char flags_2224;                             // 0x2224
    char flags_2225;                             // 0x2225
    char flags_2226;                             // 0x2226
    char flags_2227;                             // 0x2227
    char flags_2228;                             // 0x2228
    char flags_2229;                             // 0x2229
    char flags_222A;                             // 0x222A
    char flags_222B;                             // 0x222B
    int charVar1;                             // 0x222c
    int charVar2;                             // 0x2230
    int charVar3;                             // 0x2234
    int charVar4;                             // 0x2238
    int charVar5;                             // 0x223c
    int charVar6;                             // 0x2240
    int charVar7;                             // 0x2244
    int charVar8;                             // 0x2248
    int charVar9;                             // 0x224c
    int charVar10;                             // 0x2250
    int charVar11;                             // 0x2254
    int charVar12;                             // 0x2258
    int charVar13;                             // 0x225c
    int charVar14;                             // 0x2260
    int charVar15;                             // 0x2264
    int charVar16;                             // 0x2268
    int charVar17;                             // 0x226c
    int charVar18;                             // 0x2270
    int charVar19;                             // 0x2274
    int charVar20;                             // 0x2278
    int charVar21;                             // 0x227c
    int charVar22;                             // 0x2280
    int charVar23;                             // 0x2284
    int charVar24;                             // 0x2288
    int charVar25;                             // 0x228c
    int charVar26;                             // 0x2290
    int charVar27;                             // 0x2294
    int charVar28;                             // 0x2298
    int charVar29;                             // 0x229c
    int charVar30;                             // 0x22a0
    int charVar31;                             // 0x22a4
    int charVar32;                             // 0x22a8
    int charVar33;                             // 0x22ac
    int charVar34;                             // 0x22b0
    int charVar35;                             // 0x22b4
    int charVar36;                             // 0x22b8
    int charVar37;                             // 0x22bc
    int charVar38;                             // 0x22c0
    int charVar39;                             // 0x22c4
    int charVar40;                             // 0x22c8
    int charVar41;                             // 0x22cc
    int charVar42;                             // 0x22d0
    int charVar43;                             // 0x22d4
    int charVar44;                             // 0x22d8
    int charVar45;                             // 0x22dc
    int charVar46;                             // 0x22e0
    int charVar47;                             // 0x22e4
    int charVar48;                             // 0x22e8
    int charVar49;                             // 0x22ec
    int charVar50;                             // 0x22f0
    int charVar51;                             // 0x22f4
    int charVar52;                             // 0x22f8
    int x22fc;                             // 0x22fc
    int x2300;                             // 0x2300
    int x2304;                             // 0x2304
    int x2308;                             // 0x2308
    int x230c;                             // 0x230c
    int x2310;                             // 0x2310
    int x2314;                             // 0x2314
    int x2318;                             // 0x2318
    int x231c;                             // 0x231c
    int x2320;                             // 0x2320
    int x2324;                             // 0x2324
    int x2328;                             // 0x2328
    int x232c;                             // 0x232c
    int x2330;                             // 0x2330
    int x2334;                             // 0x2334
    int x2338;                             // 0x2338
    int x233c;                             // 0x233c
    int stateVar1;                             // 0x2340
    int stateVar2;                             // 0x2344
    int stateVar3;                             // 0x2348
    int stateVar4;                             // 0x234c
    int stateVar5;                             // 0x2350
    int stateVar6;                             // 0x2354
    int stateVar7;                             // 0x2358
    int stateVar8;                             // 0x235c
    int stateVar9;                             // 0x2360
    int stateVar10;                             // 0x2364
    int stateVar11;                             // 0x2368
    int stateVar12;                             // 0x236c
    int stateVar13;                             // 0x2370
    int stateVar14;                             // 0x2374
    int stateVar15;                             // 0x2378
    int stateVar16;                             // 0x237c
    int stateVar17;                             // 0x2380
    int stateVar18;                             // 0x2384
    int x2388;                             // 0x2388
    int x238c;                             // 0x238c
    int x2390;                             // 0x2390
    int x2394;                             // 0x2394
    int x2398;                             // 0x2398
    int x239c;                             // 0x239c
    int x23a0;                             // 0x23a0
    int x23a4;                             // 0x23a4
    int x23a8;                             // 0x23a8
    int x23ac;                             // 0x23ac
    int x23b0;                             // 0x23b0
    int x23b4;                             // 0x23b4
    int x23b8;                             // 0x23b8
    int x23bc;                             // 0x23bc
    int x23c0;                             // 0x23c0
    int x23c4;                             // 0x23c4
    int x23c8;                             // 0x23c8
    int x23cc;                             // 0x23cc
    int x23d0;                             // 0x23d0
    int x23d4;                             // 0x23d4
    int x23d8;                             // 0x23d8
    int x23dc;                             // 0x23dc
    int x23e0;                             // 0x23e0
    int x23e4;                             // 0x23e4
    int x23e8;                             // 0x23e8
    int x23ec;                             // 0x23ec
    int x23f0;                             // 0x23f0
    int x23f4;                             // 0x23f4
    int x23f8;                             // 0x23f8
    int x23fc;                             // 0x23fc
};
struct ItemData
{
    GOBJ *item;                             // 0x0
    int x4;                             // 0x4
    int x8;                             // 0x8
    int spawnType;                             // 0xC
    int itemID;                             // 0x10
    int x14;                             // 0x14
    int x18;                             // 0x18
    int x1c;                             // 0x1c
    int x20;                             // 0x20
    int x24;                             // 0x24
    int stateID;                             // 0x28
    float facing_direction;                             // 0x2c
    int x30;                             // 0x30
    int x34;                             // 0x34
    float scale;                             // 0x38
    int x3c;                             // 0x3c
    Vec3 selfVel;                             // 0x40
    Vec3 pos;                             // 0x4C
    int x58;                             // 0x58
    int x5c;                             // 0x5c
    int x60;                             // 0x60
    int x64;                             // 0x64
    int x68;                             // 0x68
    int x6c;                             // 0x6c
    int x70;                             // 0x70
    int x74;                             // 0x74
    int x78;                             // 0x78
    int x7c;                             // 0x7c
    int x80;                             // 0x80
    int x84;                             // 0x84
    int x88;                             // 0x88
    int x8c;                             // 0x8c
    int x90;                             // 0x90
    int x94;                             // 0x94
    int x98;                             // 0x98
    int x9c;                             // 0x9c
    int xa0;                             // 0xa0
    int xa4;                             // 0xa4
    int xa8;                             // 0xa8
    int xac;                             // 0xac
    int xb0;                             // 0xb0
    int xb4;                             // 0xb4
    int xb8;                             // 0xb8
    ItemState *itemStates;                             // 0xbc
    int xc0;                             // 0xc0
    itData *itData;                             // 0xc4
    int jobj;                             // 0xc8
    itCommonAttr *itemAttributes;                             // 0xcc
    int xd0;                             // 0xd0
    int xd4;                             // 0xd4
    int xd8;                             // 0xd8
    int xdc;                             // 0xdc
    int xe0;                             // 0xe0
    int xe4;                             // 0xe4
    int xe8;                             // 0xe8
    int xec;                             // 0xec
    int xf0;                             // 0xf0
    int xf4;                             // 0xf4
    int xf8;                             // 0xf8
    int xfc;                             // 0xfc
    int x100;                             // 0x100
    int x104;                             // 0x104
    int x108;                             // 0x108
    int x10c;                             // 0x10c
    int x110;                             // 0x110
    int x114;                             // 0x114
    int x118;                             // 0x118
    int x11c;                             // 0x11c
    int x120;                             // 0x120
    int x124;                             // 0x124
    int x128;                             // 0x128
    int x12c;                             // 0x12c
    int x130;                             // 0x130
    int x134;                             // 0x134
    int x138;                             // 0x138
    int x13c;                             // 0x13c
    int x140;                             // 0x140
    int x144;                             // 0x144
    int x148;                             // 0x148
    int x14c;                             // 0x14c
    int x150;                             // 0x150
    int x154;                             // 0x154
    int x158;                             // 0x158
    int x15c;                             // 0x15c
    int x160;                             // 0x160
    int x164;                             // 0x164
    int x168;                             // 0x168
    int x16c;                             // 0x16c
    int x170;                             // 0x170
    int x174;                             // 0x174
    int x178;                             // 0x178
    int x17c;                             // 0x17c
    int x180;                             // 0x180
    int x184;                             // 0x184
    int x188;                             // 0x188
    int x18c;                             // 0x18c
    int x190;                             // 0x190
    int x194;                             // 0x194
    int x198;                             // 0x198
    int x19c;                             // 0x19c
    int x1a0;                             // 0x1a0
    int x1a4;                             // 0x1a4
    int x1a8;                             // 0x1a8
    int x1ac;                             // 0x1ac
    int x1b0;                             // 0x1b0
    int x1b4;                             // 0x1b4
    int x1b8;                             // 0x1b8
    int x1bc;                             // 0x1bc
    int x1c0;                             // 0x1c0
    int x1c4;                             // 0x1c4
    int x1c8;                             // 0x1c8
    int x1cc;                             // 0x1cc
    int x1d0;                             // 0x1d0
    int x1d4;                             // 0x1d4
    int x1d8;                             // 0x1d8
    int x1dc;                             // 0x1dc
    int x1e0;                             // 0x1e0
    int x1e4;                             // 0x1e4
    int x1e8;                             // 0x1e8
    int x1ec;                             // 0x1ec
    int x1f0;                             // 0x1f0
    int x1f4;                             // 0x1f4
    int x1f8;                             // 0x1f8
    int x1fc;                             // 0x1fc
    int x200;                             // 0x200
    int x204;                             // 0x204
    int x208;                             // 0x208
    int x20c;                             // 0x20c
    int x210;                             // 0x210
    int x214;                             // 0x214
    int x218;                             // 0x218
    int x21c;                             // 0x21c
    int x220;                             // 0x220
    int x224;                             // 0x224
    int x228;                             // 0x228
    int x22c;                             // 0x22c
    int x230;                             // 0x230
    int x234;                             // 0x234
    int x238;                             // 0x238
    int x23c;                             // 0x23c
    int x240;                             // 0x240
    int x244;                             // 0x244
    int x248;                             // 0x248
    int x24c;                             // 0x24c
    int x250;                             // 0x250
    int x254;                             // 0x254
    int x258;                             // 0x258
    int x25c;                             // 0x25c
    int x260;                             // 0x260
    int x264;                             // 0x264
    int x268;                             // 0x268
    int x26c;                             // 0x26c
    int x270;                             // 0x270
    int x274;                             // 0x274
    int x278;                             // 0x278
    int x27c;                             // 0x27c
    int x280;                             // 0x280
    int x284;                             // 0x284
    int x288;                             // 0x288
    int x28c;                             // 0x28c
    int x290;                             // 0x290
    int x294;                             // 0x294
    int x298;                             // 0x298
    int x29c;                             // 0x29c
    int x2a0;                             // 0x2a0
    int x2a4;                             // 0x2a4
    int x2a8;                             // 0x2a8
    int x2ac;                             // 0x2ac
    int x2b0;                             // 0x2b0
    int x2b4;                             // 0x2b4
    int x2b8;                             // 0x2b8
    int x2bc;                             // 0x2bc
    int x2c0;                             // 0x2c0
    int x2c4;                             // 0x2c4
    int x2c8;                             // 0x2c8
    int x2cc;                             // 0x2cc
    int x2d0;                             // 0x2d0
    int x2d4;                             // 0x2d4
    int x2d8;                             // 0x2d8
    int x2dc;                             // 0x2dc
    int x2e0;                             // 0x2e0
    int x2e4;                             // 0x2e4
    int x2e8;                             // 0x2e8
    int x2ec;                             // 0x2ec
    int x2f0;                             // 0x2f0
    int x2f4;                             // 0x2f4
    int x2f8;                             // 0x2f8
    int x2fc;                             // 0x2fc
    int x300;                             // 0x300
    int x304;                             // 0x304
    int x308;                             // 0x308
    int x30c;                             // 0x30c
    int x310;                             // 0x310
    int x314;                             // 0x314
    int x318;                             // 0x318
    int x31c;                             // 0x31c
    int x320;                             // 0x320
    int x324;                             // 0x324
    int x328;                             // 0x328
    int x32c;                             // 0x32c
    int x330;                             // 0x330
    int x334;                             // 0x334
    int x338;                             // 0x338
    int x33c;                             // 0x33c
    int x340;                             // 0x340
    int x344;                             // 0x344
    int x348;                             // 0x348
    int x34c;                             // 0x34c
    int x350;                             // 0x350
    int x354;                             // 0x354
    int x358;                             // 0x358
    int x35c;                             // 0x35c
    int x360;                             // 0x360
    int x364;                             // 0x364
    int x368;                             // 0x368
    int x36c;                             // 0x36c
    int x370;                             // 0x370
    int x374;                             // 0x374
    CollData collData;                             // 0x378 -> 0x518
    FighterData *fighter;                             // 0x518
    int x51c;                             // 0x51c
    CameraBox *camerabox;                             // 0x520
    int x524;                             // 0x524
    int x528;                             // 0x528
    int x52c;                             // 0x52c
    int x530;                             // 0x530
    int x534;                             // 0x534
    int x538;                             // 0x538
    int x53c;                             // 0x53c
    int x540;                             // 0x540
    int x544;                             // 0x544
    int x548;                             // 0x548
    int x54c;                             // 0x54c
    int x550;                             // 0x550
    int x554;                             // 0x554
    int x558;                             // 0x558
    int x55c;                             // 0x55c
    int x560;                             // 0x560
    int x564;                             // 0x564
    int x568;                             // 0x568
    int x56c;                             // 0x56c
    int x570;                             // 0x570
    int x574;                             // 0x574
    int x578;                             // 0x578
    int x57c;                             // 0x57c
    int x580;                             // 0x580
    int x584;                             // 0x584
    int x588;                             // 0x588
    int x58c;                             // 0x58c
    int x590;                             // 0x590
    int x594;                             // 0x594
    int x598;                             // 0x598
    int x59c;                             // 0x59c
    int x5a0;                             // 0x5a0
    int x5a4;                             // 0x5a4
    int x5a8;                             // 0x5a8
    int x5ac;                             // 0x5ac
    int x5b0;                             // 0x5b0
    int x5b4;                             // 0x5b4
    int x5b8;                             // 0x5b8
    int x5bc;                             // 0x5bc
    int x5c0;                             // 0x5c0
    int x5c4;                             // 0x5c4
    int x5c8;                             // 0x5c8
    int x5cc;                             // 0x5cc
    int x5d0;                             // 0x5d0
    int x5d4;                             // 0x5d4
    int x5d8;                             // 0x5d8
    int x5dc;                             // 0x5dc
    int x5e0;                             // 0x5e0
    int x5e4;                             // 0x5e4
    int x5e8;                             // 0x5e8
    int x5ec;                             // 0x5ec
    int x5f0;                             // 0x5f0
    int x5f4;                             // 0x5f4
    int x5f8;                             // 0x5f8
    int x5fc;                             // 0x5fc
    int x600;                             // 0x600
    int x604;                             // 0x604
    int x608;                             // 0x608
    int x60c;                             // 0x60c
    int x610;                             // 0x610
    int x614;                             // 0x614
    int x618;                             // 0x618
    int x61c;                             // 0x61c
    int x620;                             // 0x620
    int x624;                             // 0x624
    int x628;                             // 0x628
    int x62c;                             // 0x62c
    int x630;                             // 0x630
    int x634;                             // 0x634
    int x638;                             // 0x638
    int x63c;                             // 0x63c
    int x640;                             // 0x640
    int x644;                             // 0x644
    int x648;                             // 0x648
    int x64c;                             // 0x64c
    int x650;                             // 0x650
    int x654;                             // 0x654
    int x658;                             // 0x658
    int x65c;                             // 0x65c
    int x660;                             // 0x660
    int x664;                             // 0x664
    int x668;                             // 0x668
    int x66c;                             // 0x66c
    int x670;                             // 0x670
    int x674;                             // 0x674
    int x678;                             // 0x678
    int x67c;                             // 0x67c
    int x680;                             // 0x680
    int x684;                             // 0x684
    int x688;                             // 0x688
    int x68c;                             // 0x68c
    int x690;                             // 0x690
    int x694;                             // 0x694
    int x698;                             // 0x698
    int x69c;                             // 0x69c
    int x6a0;                             // 0x6a0
    int x6a4;                             // 0x6a4
    int x6a8;                             // 0x6a8
    int x6ac;                             // 0x6ac
    int x6b0;                             // 0x6b0
    int x6b4;                             // 0x6b4
    int x6b8;                             // 0x6b8
    int x6bc;                             // 0x6bc
    int x6c0;                             // 0x6c0
    int x6c4;                             // 0x6c4
    int x6c8;                             // 0x6c8
    int x6cc;                             // 0x6cc
    int x6d0;                             // 0x6d0
    int x6d4;                             // 0x6d4
    int x6d8;                             // 0x6d8
    int x6dc;                             // 0x6dc
    int x6e0;                             // 0x6e0
    int x6e4;                             // 0x6e4
    int x6e8;                             // 0x6e8
    int x6ec;                             // 0x6ec
    int x6f0;                             // 0x6f0
    int x6f4;                             // 0x6f4
    int x6f8;                             // 0x6f8
    int x6fc;                             // 0x6fc
    int x700;                             // 0x700
    int x704;                             // 0x704
    int x708;                             // 0x708
    int x70c;                             // 0x70c
    int x710;                             // 0x710
    int x714;                             // 0x714
    int x718;                             // 0x718
    int x71c;                             // 0x71c
    int x720;                             // 0x720
    int x724;                             // 0x724
    int x728;                             // 0x728
    int x72c;                             // 0x72c
    int x730;                             // 0x730
    int x734;                             // 0x734
    int x738;                             // 0x738
    int x73c;                             // 0x73c
    int x740;                             // 0x740
    int x744;                             // 0x744
    int x748;                             // 0x748
    int x74c;                             // 0x74c
    int x750;                             // 0x750
    int x754;                             // 0x754
    int x758;                             // 0x758
    int x75c;                             // 0x75c
    int x760;                             // 0x760
    int x764;                             // 0x764
    int x768;                             // 0x768
    int x76c;                             // 0x76c
    int x770;                             // 0x770
    int x774;                             // 0x774
    int x778;                             // 0x778
    int x77c;                             // 0x77c
    int x780;                             // 0x780
    int x784;                             // 0x784
    int x788;                             // 0x788
    int x78c;                             // 0x78c
    int x790;                             // 0x790
    int x794;                             // 0x794
    int x798;                             // 0x798
    int x79c;                             // 0x79c
    int x7a0;                             // 0x7a0
    int x7a4;                             // 0x7a4
    int x7a8;                             // 0x7a8
    int x7ac;                             // 0x7ac
    int x7b0;                             // 0x7b0
    int x7b4;                             // 0x7b4
    int x7b8;                             // 0x7b8
    int x7bc;                             // 0x7bc
    int x7c0;                             // 0x7c0
    int x7c4;                             // 0x7c4
    int x7c8;                             // 0x7c8
    int x7cc;                             // 0x7cc
    int x7d0;                             // 0x7d0
    int x7d4;                             // 0x7d4
    int x7d8;                             // 0x7d8
    int x7dc;                             // 0x7dc
    int x7e0;                             // 0x7e0
    int x7e4;                             // 0x7e4
    int x7e8;                             // 0x7e8
    int x7ec;                             // 0x7ec
    int x7f0;                             // 0x7f0
    int x7f4;                             // 0x7f4
    int x7f8;                             // 0x7f8
    int x7fc;                             // 0x7fc
    int x800;                             // 0x800
    int x804;                             // 0x804
    int x808;                             // 0x808
    int x80c;                             // 0x80c
    int x810;                             // 0x810
    int x814;                             // 0x814
    int x818;                             // 0x818
    int x81c;                             // 0x81c
    int x820;                             // 0x820
    int x824;                             // 0x824
    int x828;                             // 0x828
    int x82c;                             // 0x82c
    int x830;                             // 0x830
    int x834;                             // 0x834
    int x838;                             // 0x838
    int x83c;                             // 0x83c
    int x840;                             // 0x840
    int x844;                             // 0x844
    int x848;                             // 0x848
    int x84c;                             // 0x84c
    int x850;                             // 0x850
    int x854;                             // 0x854
    int x858;                             // 0x858
    int x85c;                             // 0x85c
    int x860;                             // 0x860
    int x864;                             // 0x864
    int x868;                             // 0x868
    int x86c;                             // 0x86c
    int x870;                             // 0x870
    int x874;                             // 0x874
    int x878;                             // 0x878
    int x87c;                             // 0x87c
    int x880;                             // 0x880
    int x884;                             // 0x884
    int x888;                             // 0x888
    int x88c;                             // 0x88c
    int x890;                             // 0x890
    int x894;                             // 0x894
    int x898;                             // 0x898
    int x89c;                             // 0x89c
    int x8a0;                             // 0x8a0
    int x8a4;                             // 0x8a4
    int x8a8;                             // 0x8a8
    int x8ac;                             // 0x8ac
    int x8b0;                             // 0x8b0
    int x8b4;                             // 0x8b4
    int x8b8;                             // 0x8b8
    int x8bc;                             // 0x8bc
    int x8c0;                             // 0x8c0
    int x8c4;                             // 0x8c4
    int x8c8;                             // 0x8c8
    int x8cc;                             // 0x8cc
    int x8d0;                             // 0x8d0
    int x8d4;                             // 0x8d4
    int x8d8;                             // 0x8d8
    int x8dc;                             // 0x8dc
    int x8e0;                             // 0x8e0
    int x8e4;                             // 0x8e4
    int x8e8;                             // 0x8e8
    int x8ec;                             // 0x8ec
    int x8f0;                             // 0x8f0
    int x8f4;                             // 0x8f4
    int x8f8;                             // 0x8f8
    int x8fc;                             // 0x8fc
    int x900;                             // 0x900
    int x904;                             // 0x904
    int x908;                             // 0x908
    int x90c;                             // 0x90c
    int x910;                             // 0x910
    int x914;                             // 0x914
    int x918;                             // 0x918
    int x91c;                             // 0x91c
    int x920;                             // 0x920
    int x924;                             // 0x924
    int x928;                             // 0x928
    int x92c;                             // 0x92c
    int x930;                             // 0x930
    int x934;                             // 0x934
    int x938;                             // 0x938
    int x93c;                             // 0x93c
    int x940;                             // 0x940
    int x944;                             // 0x944
    int x948;                             // 0x948
    int x94c;                             // 0x94c
    int x950;                             // 0x950
    int x954;                             // 0x954
    int x958;                             // 0x958
    int x95c;                             // 0x95c
    int x960;                             // 0x960
    int x964;                             // 0x964
    int x968;                             // 0x968
    int x96c;                             // 0x96c
    int x970;                             // 0x970
    int x974;                             // 0x974
    int x978;                             // 0x978
    int x97c;                             // 0x97c
    int x980;                             // 0x980
    int x984;                             // 0x984
    int x988;                             // 0x988
    int x98c;                             // 0x98c
    int x990;                             // 0x990
    int x994;                             // 0x994
    int x998;                             // 0x998
    int x99c;                             // 0x99c
    int x9a0;                             // 0x9a0
    int x9a4;                             // 0x9a4
    int x9a8;                             // 0x9a8
    int x9ac;                             // 0x9ac
    int x9b0;                             // 0x9b0
    int x9b4;                             // 0x9b4
    int x9b8;                             // 0x9b8
    int x9bc;                             // 0x9bc
    int x9c0;                             // 0x9c0
    int x9c4;                             // 0x9c4
    int x9c8;                             // 0x9c8
    int x9cc;                             // 0x9cc
    int x9d0;                             // 0x9d0
    int x9d4;                             // 0x9d4
    int x9d8;                             // 0x9d8
    int x9dc;                             // 0x9dc
    int x9e0;                             // 0x9e0
    int x9e4;                             // 0x9e4
    int x9e8;                             // 0x9e8
    int x9ec;                             // 0x9ec
    int x9f0;                             // 0x9f0
    int x9f4;                             // 0x9f4
    int x9f8;                             // 0x9f8
    int x9fc;                             // 0x9fc
    int xa00;                             // 0xa00
    int xa04;                             // 0xa04
    int xa08;                             // 0xa08
    int xa0c;                             // 0xa0c
    int xa10;                             // 0xa10
    int xa14;                             // 0xa14
    int xa18;                             // 0xa18
    int xa1c;                             // 0xa1c
    int xa20;                             // 0xa20
    int xa24;                             // 0xa24
    int xa28;                             // 0xa28
    int xa2c;                             // 0xa2c
    int xa30;                             // 0xa30
    int xa34;                             // 0xa34
    int xa38;                             // 0xa38
    int xa3c;                             // 0xa3c
    int xa40;                             // 0xa40
    int xa44;                             // 0xa44
    int xa48;                             // 0xa48
    int xa4c;                             // 0xa4c
    int xa50;                             // 0xa50
    int xa54;                             // 0xa54
    int xa58;                             // 0xa58
    int xa5c;                             // 0xa5c
    int xa60;                             // 0xa60
    int xa64;                             // 0xa64
    int xa68;                             // 0xa68
    int xa6c;                             // 0xa6c
    int xa70;                             // 0xa70
    int xa74;                             // 0xa74
    int xa78;                             // 0xa78
    int xa7c;                             // 0xa7c
    int xa80;                             // 0xa80
    int xa84;                             // 0xa84
    int xa88;                             // 0xa88
    int xa8c;                             // 0xa8c
    int xa90;                             // 0xa90
    int xa94;                             // 0xa94
    int xa98;                             // 0xa98
    int xa9c;                             // 0xa9c
    int xaa0;                             // 0xaa0
    int xaa4;                             // 0xaa4
    int xaa8;                             // 0xaa8
    int xaac;                             // 0xaac
    int xab0;                             // 0xab0
    int xab4;                             // 0xab4
    int xab8;                             // 0xab8
    int xabc;                             // 0xabc
    int xac0;                             // 0xac0
    int xac4;                             // 0xac4
    int xac8;                             // 0xac8
    int xacc;                             // 0xacc
    int xad0;                             // 0xad0
    int xad4;                             // 0xad4
    int xad8;                             // 0xad8
    int xadc;                             // 0xadc
    int xae0;                             // 0xae0
    int xae4;                             // 0xae4
    int xae8;                             // 0xae8
    int xaec;                             // 0xaec
    int xaf0;                             // 0xaf0
    int xaf4;                             // 0xaf4
    int xaf8;                             // 0xaf8
    int xafc;                             // 0xafc
    int xb00;                             // 0xb00
    int xb04;                             // 0xb04
    int xb08;                             // 0xb08
    int xb0c;                             // 0xb0c
    int xb10;                             // 0xb10
    int xb14;                             // 0xb14
    int xb18;                             // 0xb18
    int xb1c;                             // 0xb1c
    int xb20;                             // 0xb20
    int xb24;                             // 0xb24
    int xb28;                             // 0xb28
    int xb2c;                             // 0xb2c
    int xb30;                             // 0xb30
    int xb34;                             // 0xb34
    int xb38;                             // 0xb38
    int xb3c;                             // 0xb3c
    int xb40;                             // 0xb40
    int xb44;                             // 0xb44
    int xb48;                             // 0xb48
    int xb4c;                             // 0xb4c
    int xb50;                             // 0xb50
    int xb54;                             // 0xb54
    int xb58;                             // 0xb58
    int xb5c;                             // 0xb5c
    int xb60;                             // 0xb60
    int xb64;                             // 0xb64
    int xb68;                             // 0xb68
    int xb6c;                             // 0xb6c
    int xb70;                             // 0xb70
    int xb74;                             // 0xb74
    int xb78;                             // 0xb78
    int xb7c;                             // 0xb7c
    int xb80;                             // 0xb80
    int xb84;                             // 0xb84
    int xb88;                             // 0xb88
    int xb8c;                             // 0xb8c
    int xb90;                             // 0xb90
    int xb94;                             // 0xb94
    int xb98;                             // 0xb98
    int xb9c;                             // 0xb9c
    int xba0;                             // 0xba0
    int xba4;                             // 0xba4
    int xba8;                             // 0xba8
    int xbac;                             // 0xbac
    int xbb0;                             // 0xbb0
    int xbb4;                             // 0xbb4
    int xbb8;                             // 0xbb8
    int xbbc;                             // 0xbbc
    int xbc0;                             // 0xbc0
    int xbc4;                             // 0xbc4
    int xbc8;                             // 0xbc8
    int xbcc;                             // 0xbcc
    int xbd0;                             // 0xbd0
    int xbd4;                             // 0xbd4
    int xbd8;                             // 0xbd8
    int xbdc;                             // 0xbdc
    int xbe0;                             // 0xbe0
    int xbe4;                             // 0xbe4
    int xbe8;                             // 0xbe8
    int xbec;                             // 0xbec
    int xbf0;                             // 0xbf0
    int xbf4;                             // 0xbf4
    int xbf8;                             // 0xbf8
    int xbfc;                             // 0xbfc
    int xc00;                             // 0xc00
    int xc04;                             // 0xc04
    int xc08;                             // 0xc08
    int xc0c;                             // 0xc0c
    int xc10;                             // 0xc10
    int xc14;                             // 0xc14
    int xc18;                             // 0xc18
    int xc1c;                             // 0xc1c
    int xc20;                             // 0xc20
    int xc24;                             // 0xc24
    int xc28;                             // 0xc28
    int xc2c;                             // 0xc2c
    int xc30;                             // 0xc30
    int xc34;                             // 0xc34
    int xc38;                             // 0xc38
    int xc3c;                             // 0xc3c
    int xc40;                             // 0xc40
    int xc44;                             // 0xc44
    int xc48;                             // 0xc48
    int xc4c;                             // 0xc4c
    int xc50;                             // 0xc50
    int xc54;                             // 0xc54
    int xc58;                             // 0xc58
    int xc5c;                             // 0xc5c
    int xc60;                             // 0xc60
    int xc64;                             // 0xc64
    int xc68;                             // 0xc68
    int xc6c;                             // 0xc6c
    int xc70;                             // 0xc70
    int xc74;                             // 0xc74
    int xc78;                             // 0xc78
    int xc7c;                             // 0xc7c
    int xc80;                             // 0xc80
    int xc84;                             // 0xc84
    int xc88;                             // 0xc88
    int xc8c;                             // 0xc8c
    int xc90;                             // 0xc90
    int xc94;                             // 0xc94
    int xc98;                             // 0xc98
    int xc9c;                             // 0xc9c
    int xca0;                             // 0xca0
    int xca4;                             // 0xca4
    int xca8;                             // 0xca8
    int xcac;                             // 0xcac
    int xcb0;                             // 0xcb0
    int xcb4;                             // 0xcb4
    int xcb8;                             // 0xcb8
    int xcbc;                             // 0xcbc
    int xcc0;                             // 0xcc0
    int xcc4;                             // 0xcc4
    int xcc8;                             // 0xcc8
    int xccc;                             // 0xccc
    int xcd0;                             // 0xcd0
    int xcd4;                             // 0xcd4
    int xcd8;                             // 0xcd8
    int xcdc;                             // 0xcdc
    int xce0;                             // 0xce0
    int xce4;                             // 0xce4
    int xce8;                             // 0xce8
    int xcec;                             // 0xcec
    int xcf0;                             // 0xcf0
    int xcf4;                             // 0xcf4
    int xcf8;                             // 0xcf8
    int xcfc;                             // 0xcfc
    GOBJ* grabbedFighter;                             // 0xd00
    int xd04;                             // 0xd04
    int xd08;                             // 0xd08
    int xd0c;                             // 0xd0c
    int xd10;                             // 0xd10
    int xd14;                             // 0xd14
    int xd18;                             // 0xd18
    int xd1c;                             // 0xd1c
    void* cb_Accessory;                             // 0xd20
    int xd24;                             // 0xd24
    int xd28;                             // 0xd28
    int xd2c;                             // 0xd2c
    int xd30;                             // 0xd30
    void* grabbedFighter_OnItem;                             // 0xd34
    void* grabbedFighter_OnFighter;                             // 0xd38
    int xd3c;                             // 0xd3c
    int xd40;                             // 0xd40
    int xd44;                             // 0xd44
    int xd48;                             // 0xd48
    int xd4c;                             // 0xd4c
    int xd50;                             // 0xd50
    int xd54;                             // 0xd54
    int xd58;                             // 0xd58
    int xd5c;                             // 0xd5c
    int xd60;                             // 0xd60
    int xd64;                             // 0xd64
    int xd68;                             // 0xd68
    int xd6c;                             // 0xd6c
    int xd70;                             // 0xd70
    int xd74;                             // 0xd74
    int xd78;                             // 0xd78
    int xd7c;                             // 0xd7c
    int xd80;                             // 0xd80
    int xd84;                             // 0xd84
    int xd88;                             // 0xd88
    int xd8c;                             // 0xd8c
    int xd90;                             // 0xd90
    int xd94;                             // 0xd94
    int xd98;                             // 0xd98
    int xd9c;                             // 0xd9c
    int xda0;                             // 0xda0
    int xda4;                             // 0xda4
    int xda8;                             // 0xda8
    int xdac;                             // 0xdac
    int xdb0;                             // 0xdb0
    int xdb4;                             // 0xdb4
    int xdb8;                             // 0xdb8
    int xdbc;                             // 0xdbc
    int xdc0;                             // 0xdc0
    int xdc4;                             // 0xdc4
    int xdc8;                             // 0xdc8
    int flags;                             // 0xdcc
    int xdd0;                             // 0xdd0
    int itemVar1;                             // 0xdd4
    int itemVar2;                             // 0xdd8
    int itemVar3;                             // 0xddc
    int itemVar4;                             // 0xde0
    int itemVar5;                             // 0xde4
    int itemVar6;                             // 0xde8
    int itemVar7;                             // 0xdec
    int itemVar8;                             // 0xdf0
    int itemVar9;                             // 0xdf4
    int itemVar10;                             // 0xdf8
    int itemVar11;                             // 0xdfc
    int itemVar12;                             // 0xe00
    int xe04;                             // 0xe04
    int xe08;                             // 0xe08
    int xe0c;                             // 0xe0c
    int xe10;                             // 0xe10
    int xe14;                             // 0xe14
    int xe18;                             // 0xe18
    int xe1c;                             // 0xe1c
    int xe20;                             // 0xe20
    int xe24;                             // 0xe24
    int xe28;                             // 0xe28
    int xe2c;                             // 0xe2c
    int xe30;                             // 0xe30
    int xe34;                             // 0xe34
    int xe38;                             // 0xe38
    int xe3c;                             // 0xe3c
};
struct map_gobjData
{
    int x0;                             // 0x0
    int x4;                             // 0x4
    int x8;                             // 0x8
    int xC;                             // 0xC
    int flags;                             // 0x10
    int map_gobjID;                             // 0x14
    int x18;                             // 0x18
    int onUnk;                             // 0x1c
    int x20;                             // 0x20
    int x24;                             // 0x24
    int stateID;                             // 0x28
    int facingDirection;                             // 0x2c
    int x30;                             // 0x30
    int x34;                             // 0x34
    float scale;                             // 0x38
    int x3c;                             // 0x3c
    float selfVelX;                             // 0x40
    float selfVelY;                             // 0x44
    float selfVelZ;                             // 0x48
    float posX;                             // 0x4c
    float posY;                             // 0x50
    float posZ;                             // 0x54
    int x58;                             // 0x58
    int x5c;                             // 0x5c
    int x60;                             // 0x60
    int x64;                             // 0x64
    int x68;                             // 0x68
    int x6c;                             // 0x6c
    int x70;                             // 0x70
    int x74;                             // 0x74
    int x78;                             // 0x78
    int x7c;                             // 0x7c
    int x80;                             // 0x80
    int x84;                             // 0x84
    int x88;                             // 0x88
    int x8c;                             // 0x8c
    int x90;                             // 0x90
    int x94;                             // 0x94
    int x98;                             // 0x98
    int x9c;                             // 0x9c
    int xa0;                             // 0xa0
    int xa4;                             // 0xa4
    int xa8;                             // 0xa8
    int xac;                             // 0xac
    int xb0;                             // 0xb0
    int xb4;                             // 0xb4
    int xb8;                             // 0xb8
    int xbc;                             // 0xbc
    int xc0;                             // 0xc0
    int xc4;                             // 0xc4
    int xc8;                             // 0xc8
    int xcc;                             // 0xcc
    int xd0;                             // 0xd0
    int xd4;                             // 0xd4
    int xd8;                             // 0xd8
    int xdc;                             // 0xdc
    int mapVar0;                             // 0xe0
    int mapVar1;                             // 0xe4
    int mapVar2;                             // 0xe8
    int mapVar3;                             // 0xec
    int xf0;                             // 0xf0
    int xf4;                             // 0xf4
    int xf8;                             // 0xf8
    int xfc;                             // 0xfc
    int x100;                             // 0x100
    int x104;                             // 0x104
    int x108;                             // 0x108
    int x10c;                             // 0x10c
    int x110;                             // 0x110
    int x114;                             // 0x114
    int x118;                             // 0x118
    int x11c;                             // 0x11c
    int x120;                             // 0x120
    int x124;                             // 0x124
    int x128;                             // 0x128
    int x12c;                             // 0x12c
    int x130;                             // 0x130
    int x134;                             // 0x134
    int x138;                             // 0x138
    int x13c;                             // 0x13c
    int x140;                             // 0x140
    int x144;                             // 0x144
    int x148;                             // 0x148
    int x14c;                             // 0x14c
    int x150;                             // 0x150
    int x154;                             // 0x154
    int x158;                             // 0x158
    int x15c;                             // 0x15c
    int x160;                             // 0x160
    int x164;                             // 0x164
    int x168;                             // 0x168
    int x16c;                             // 0x16c
    int x170;                             // 0x170
    int x174;                             // 0x174
    int x178;                             // 0x178
    int x17c;                             // 0x17c
    int x180;                             // 0x180
    int x184;                             // 0x184
    int x188;                             // 0x188
    int x18c;                             // 0x18c
    int x190;                             // 0x190
    int x194;                             // 0x194
    int x198;                             // 0x198
    int x19c;                             // 0x19c
    int x1a0;                             // 0x1a0
    int x1a4;                             // 0x1a4
    int x1a8;                             // 0x1a8
    int x1ac;                             // 0x1ac
    int x1b0;                             // 0x1b0
    int x1b4;                             // 0x1b4
    int x1b8;                             // 0x1b8
    int x1bc;                             // 0x1bc
    int x1c0;                             // 0x1c0
    int x1c4;                             // 0x1c4
    int x1c8;                             // 0x1c8
    int x1cc;                             // 0x1cc
    int x1d0;                             // 0x1d0
    int x1d4;                             // 0x1d4
    int x1d8;                             // 0x1d8
    int x1dc;                             // 0x1dc
    int x1e0;                             // 0x1e0
    int x1e4;                             // 0x1e4
    int x1e8;                             // 0x1e8
    int x1ec;                             // 0x1ec
    int x1f0;                             // 0x1f0
    int x1f4;                             // 0x1f4
    int x1f8;                             // 0x1f8
    int x1fc;                             // 0x1fc
    int x200;                             // 0x200
};
struct SpawnItem
{
    GOBJ* parent_gobj;
    GOBJ* parent_gobj2;
    int item_id;
    int unk1;
    int unk2;
    Vec3 pos;
    Vec3 pos2;
    Vec3 vel;
    float facing_direction;
    short damage;
    short unk5;
    int unk6;                             // 1 = correct initial position
    char unk7;                             //0x80 = perform initial collision check
};
struct Stage
{
    float cam_LeftBound;                             // 0x0
    float cam_RightBound;                             // 0x4
    float cam_TopBound;                             // 0x8
    float cam_BottomBound;                             // 0xc
    float cam_HorizOffset;                             // 0x10
    float cam_VertOffset;                             // 0x14
    float fov_d;                             // 0x18
    float fov_u;                             // 0x1c
    float fov_r;                             // 0x20
    float fov_l;                             // 0x24
    float x28;                             // 0x28
    float x2c;                             // 0x2c
    float x30;                             // 0x30
    float x34;                             // 0x34
    float x38;                             // 0x38
    float x3c;                             // 0x3c
    float x40;                             // 0x40
    int x44;                             // 0x44
    int x48;                             // 0x48
    int x4c;                             // 0x4c
    int x50;                             // 0x50
    int x54;                             // 0x54
    int x58;                             // 0x58
    int x5c;                             // 0x5c
    int x60;                             // 0x60
    int x64;                             // 0x64
    int x68;                             // 0x68
    int x6c;                             // 0x6c
    int x70;                             // 0x70
    float blastzoneLeft;                             // 0x74
    float blastzoneRight;                             // 0x78
    float blastzoneTop;                             // 0x7c
    float blastzoneBottom;                             // 0x80
    int flags;                             // 0x84
    int stageID;                             // 0x88
    int flags2;                             // 0x8c
    int x90;                             // 0x90
    int x94;                             // 0x94
    int hpsID;                             // 0x98
    int x9c;                             // 0x9c
    int xa0;                             // 0xa0
    int xa4;                             // 0xa4
    int xa8;                             // 0xa8
    int xac;                             // 0xac
    int xb0;                             // 0xb0
    int xb4;                             // 0xb4
    int xb8;                             // 0xb8
    int xbc;                             // 0xbc
    int xc0;                             // 0xc0
    int xc4;                             // 0xc4
    int xc8;                             // 0xc8
    int xcc;                             // 0xcc
    int xd0;                             // 0xd0
    int xd4;                             // 0xd4
    int xd8;                             // 0xd8
    int xdc;                             // 0xdc
    int xe0;                             // 0xe0
    int xe4;                             // 0xe4
    int xe8;                             // 0xe8
    int xec;                             // 0xec
    int xf0;                             // 0xf0
    int xf4;                             // 0xf4
    int xf8;                             // 0xf8
    int xfc;                             // 0xfc
    int x100;                             // 0x100
    int x104;                             // 0x104
    int x108;                             // 0x108
    int x10c;                             // 0x10c
    int x110;                             // 0x110
    int x114;                             // 0x114
    int x118;                             // 0x118
    int x11c;                             // 0x11c
    int x120;                             // 0x120
    int x124;                             // 0x124
    int x128;                             // 0x128
    int x12c;                             // 0x12c
    int x130;                             // 0x130
    int x134;                             // 0x134
    int x138;                             // 0x138
    int x13c;                             // 0x13c
    int x140;                             // 0x140
    int x144;                             // 0x144
    int x148;                             // 0x148
    int x14c;                             // 0x14c
    int x150;                             // 0x150
    int x154;                             // 0x154
    int x158;                             // 0x158
    int x15c;                             // 0x15c
    int x160;                             // 0x160
    int x164;                             // 0x164
    int x168;                             // 0x168
    int x16c;                             // 0x16c
    int x170;                             // 0x170
    int x174;                             // 0x174
    int x178;                             // 0x178
    int x17c;                             // 0x17c
    GOBJ *map_gobjs[64];
    JOBJ *SpawnP1;                             // 0x280
    JOBJ *SpawnP2;                             // 0x284
    JOBJ *SpawnP3;                             // 0x288
    JOBJ *SpawnP4;                             // 0x28c
    JOBJ *RespawnP1;                             // 0x290
    JOBJ *RespawnP2;                             // 0x294
    JOBJ *RespawnP3;                             // 0x298
    JOBJ *RespawnP4;                             // 0x29c
    int x2a0;                             // 0x2a0
    int x2a4;                             // 0x2a4
    int x2a8;                             // 0x2a8
    int x2ac;                             // 0x2ac
    int x2b0;                             // 0x2b0
    int x2b4;                             // 0x2b4
    int x2b8;                             // 0x2b8
    int x2bc;                             // 0x2bc
    int x2c0;                             // 0x2c0
    int x2c4;                             // 0x2c4
    int x2c8;                             // 0x2c8
    int x2cc;                             // 0x2cc
    int x2d0;                             // 0x2d0
    int x2d4;                             // 0x2d4
    int x2d8;                             // 0x2d8
    int x2dc;                             // 0x2dc
    int x2e0;                             // 0x2e0
    int x2e4;                             // 0x2e4
    int x2e8;                             // 0x2e8
    int x2ec;                             // 0x2ec
    int x2f0;                             // 0x2f0
    int x2f4;                             // 0x2f4
    int x2f8;                             // 0x2f8
    int x2fc;                             // 0x2fc
    int x300;                             // 0x300
    int x304;                             // 0x304
    int x308;                             // 0x308
    int x30c;                             // 0x30c
    int x310;                             // 0x310
    int x314;                             // 0x314
    int x318;                             // 0x318
    int x31c;                             // 0x31c
    int x320;                             // 0x320
    int x324;                             // 0x324
    int x328;                             // 0x328
    int x32c;                             // 0x32c
    int x330;                             // 0x330
    int x334;                             // 0x334
    int x338;                             // 0x338
    int x33c;                             // 0x33c
    int x340;                             // 0x340
    int x344;                             // 0x344
    int x348;                             // 0x348
    int x34c;                             // 0x34c
    int x350;                             // 0x350
    int x354;                             // 0x354
    int x358;                             // 0x358
    int x35c;                             // 0x35c
    int x360;                             // 0x360
    int x364;                             // 0x364
    int x368;                             // 0x368
    int x36c;                             // 0x36c
    int x370;                             // 0x370
    int x374;                             // 0x374
    int x378;                             // 0x378
    int x37c;                             // 0x37c
    int x380;                             // 0x380
    int x384;                             // 0x384
    int x388;                             // 0x388
    int x38c;                             // 0x38c
    int x390;                             // 0x390
    int x394;                             // 0x394
    int x398;                             // 0x398
    int x39c;                             // 0x39c
    int x3a0;                             // 0x3a0
    int x3a4;                             // 0x3a4
    int x3a8;                             // 0x3a8
    int x3ac;                             // 0x3ac
    int x3b0;                             // 0x3b0
    int x3b4;                             // 0x3b4
    int x3b8;                             // 0x3b8
    int x3bc;                             // 0x3bc
    int x3c0;                             // 0x3c0
    int x3c4;                             // 0x3c4
    int x3c8;                             // 0x3c8
    int x3cc;                             // 0x3cc
    int x3d0;                             // 0x3d0
    int x3d4;                             // 0x3d4
    int x3d8;                             // 0x3d8
    int x3dc;                             // 0x3dc
    int x3e0;                             // 0x3e0
    int x3e4;                             // 0x3e4
    int x3e8;                             // 0x3e8
    int x3ec;                             // 0x3ec
    int x3f0;                             // 0x3f0
    int x3f4;                             // 0x3f4
    int x3f8;                             // 0x3f8
    int x3fc;                             // 0x3fc
    int x400;                             // 0x400
    int x404;                             // 0x404
    int x408;                             // 0x408
    int x40c;                             // 0x40c
    int x410;                             // 0x410
    int x414;                             // 0x414
    int x418;                             // 0x418
    int x41c;                             // 0x41c
    int x420;                             // 0x420
    int x424;                             // 0x424
    int x428;                             // 0x428
    int x42c;                             // 0x42c
    int x430;                             // 0x430
    int x434;                             // 0x434
    int x438;                             // 0x438
    int x43c;                             // 0x43c
    int x440;                             // 0x440
    int x444;                             // 0x444
    int x448;                             // 0x448
    int x44c;                             // 0x44c
    int x450;                             // 0x450
    int x454;                             // 0x454
    int x458;                             // 0x458
    int x45c;                             // 0x45c
    int x460;                             // 0x460
    int x464;                             // 0x464
    int x468;                             // 0x468
    int x46c;                             // 0x46c
    int x470;                             // 0x470
    int x474;                             // 0x474
    int x478;                             // 0x478
    int x47c;                             // 0x47c
    int x480;                             // 0x480
    int x484;                             // 0x484
    int x488;                             // 0x488
    int x48c;                             // 0x48c
    int x490;                             // 0x490
    int x494;                             // 0x494
    int x498;                             // 0x498
    int x49c;                             // 0x49c
    int x4a0;                             // 0x4a0
    int x4a4;                             // 0x4a4
    int x4a8;                             // 0x4a8
    int x4ac;                             // 0x4ac
    int x4b0;                             // 0x4b0
    int x4b4;                             // 0x4b4
    int x4b8;                             // 0x4b8
    int x4bc;                             // 0x4bc
    int x4c0;                             // 0x4c0
    int x4c4;                             // 0x4c4
    int x4c8;                             // 0x4c8
    int x4cc;                             // 0x4cc
    int x4d0;                             // 0x4d0
    int x4d4;                             // 0x4d4
    int x4d8;                             // 0x4d8
    int x4dc;                             // 0x4dc
    int x4e0;                             // 0x4e0
    int x4e4;                             // 0x4e4
    int x4e8;                             // 0x4e8
    int x4ec;                             // 0x4ec
    int x4f0;                             // 0x4f0
    int x4f4;                             // 0x4f4
    int x4f8;                             // 0x4f8
    int x4fc;                             // 0x4fc
    int x500;                             // 0x500
    int x504;                             // 0x504
    int x508;                             // 0x508
    int x50c;                             // 0x50c
    int x510;                             // 0x510
    int x514;                             // 0x514
    int x518;                             // 0x518
    int x51c;                             // 0x51c
    int x520;                             // 0x520
    int x524;                             // 0x524
    int x528;                             // 0x528
    int x52c;                             // 0x52c
    int x530;                             // 0x530
    int x534;                             // 0x534
    int x538;                             // 0x538
    int x53c;                             // 0x53c
    int x540;                             // 0x540
    int x544;                             // 0x544
    int x548;                             // 0x548
    int x54c;                             // 0x54c
    int x550;                             // 0x550
    int x554;                             // 0x554
    int x558;                             // 0x558
    int x55c;                             // 0x55c
    int x560;                             // 0x560
    int x564;                             // 0x564
    int x568;                             // 0x568
    int x56c;                             // 0x56c
    int x570;                             // 0x570
    int x574;                             // 0x574
    int x578;                             // 0x578
    int x57c;                             // 0x57c
    int x580;                             // 0x580
    int x584;                             // 0x584
    int x588;                             // 0x588
    int x58c;                             // 0x58c
    int x590;                             // 0x590
    int x594;                             // 0x594
    int x598;                             // 0x598
    int x59c;                             // 0x59c
    int x5a0;                             // 0x5a0
    int x5a4;                             // 0x5a4
    int x5a8;                             // 0x5a8
    int x5ac;                             // 0x5ac
    int x5b0;                             // 0x5b0
    int x5b4;                             // 0x5b4
    int x5b8;                             // 0x5b8
    int x5bc;                             // 0x5bc
    int x5c0;                             // 0x5c0
    int x5c4;                             // 0x5c4
    int x5c8;                             // 0x5c8
    int x5cc;                             // 0x5cc
    int x5d0;                             // 0x5d0
    int x5d4;                             // 0x5d4
    int x5d8;                             // 0x5d8
    int x5dc;                             // 0x5dc
    int x5e0;                             // 0x5e0
    int x5e4;                             // 0x5e4
    int x5e8;                             // 0x5e8
    int x5ec;                             // 0x5ec
    int x5f0;                             // 0x5f0
    int x5f4;                             // 0x5f4
    int x5f8;                             // 0x5f8
    int x5fc;                             // 0x5fc
    int x600;                             // 0x600
    int x604;                             // 0x604
    int x608;                             // 0x608
    int x60c;                             // 0x60c
    int x610;                             // 0x610
    int x614;                             // 0x614
    int x618;                             // 0x618
    int x61c;                             // 0x61c
    int x620;                             // 0x620
    int x624;                             // 0x624
    int x628;                             // 0x628
    int x62c;                             // 0x62c
    int x630;                             // 0x630
    int x634;                             // 0x634
    int x638;                             // 0x638
    int x63c;                             // 0x63c
    int x640;                             // 0x640
    int x644;                             // 0x644
    int x648;                             // 0x648
    int x64c;                             // 0x64c
    int x650;                             // 0x650
    int x654;                             // 0x654
    int x658;                             // 0x658
    int x65c;                             // 0x65c
    int x660;                             // 0x660
    int x664;                             // 0x664
    int x668;                             // 0x668
    int x66c;                             // 0x66c
    int x670;                             // 0x670
    int x674;                             // 0x674
    int x678;                             // 0x678
    int x67c;                             // 0x67c
    int x680;                             // 0x680
    int x684;                             // 0x684
    int x688;                             // 0x688
    int x68c;                             // 0x68c
    int x690;                             // 0x690
    int x694;                             // 0x694
    int x698;                             // 0x698
    int x69c;                             // 0x69c
    int x6a0;                             // 0x6a0
    int x6a4;                             // 0x6a4
    int itemData;                             // 0x6a8
    int coll_data;                             // 0x6ac
    int grGroundParam;                             // 0x6b0
    int ALDYakuAll;                             // 0x6b4
    int map_ptcl;                             // 0x6b8
    int map_texg;                             // 0x6bc
    int yakumono_param;                             // 0x6c0
    int map_plit;                             // 0x6c4
    int x6c8;                             // 0x6c8
    int quake_model_set;                             // 0x6cc
    int x6d0;                             // 0x6d0
    int targetsRemaining;                             // 0x6d4
    int x6d8;                             // 0x6d8
    int x6dc;                             // 0x6dc
    int x6e0;                             // 0x6e0
    int x6e4;                             // 0x6e4
    int x6e8;                             // 0x6e8
    int x6ec;                             // 0x6ec
    int x6f0;                             // 0x6f0
    int x6f4;                             // 0x6f4
    int x6f8;                             // 0x6f8
    int x6fc;                             // 0x6fc
    int x700;                             // 0x700
    int x704;                             // 0x704
    int x708;                             // 0x708
    int x70c;                             // 0x70c
    int x710;                             // 0x710
    int x714;                             // 0x714
    int x718;                             // 0x718
    int x71c;                             // 0x71c
    int x720;                             // 0x720
    int x724;                             // 0x724
    int x728;                             // 0x728
    int x72C;                             // 0x728
};
struct itCommonAttr
{
    char flags1;                             //0x0, bit 0x80 = is heavy item (crate)
    char flags2;                             //0x1
    char flags3;                             //0x2
    char flags4;                             //0x3
    int x4;
    int x8;
    float spinVelocity;
    float fallSpeed;
    float maxFallSpeed;
    float x18;
    float x1C;                             //collision related
    int x20;                             // 0x20
    int x24;                             // 0x24
    int x28;                             // 0x28
    int x2c;                             // 0x2c
    int x30;                             // 0x30
    int x34;                             // 0x34
    int x38;                             // 0x38
    int x3c;                             // 0x3c
    int x40;                             // 0x40
    int x44;                             // 0x44
    int x48;                             // 0x48
    int x4c;                             // 0x4c
    int x50;                             // 0x50
    int x54;                             // 0x54
    int x58;                             // 0x58
    int x5c;                             // 0x5c
    int x60;                             // 0x60
    int x64;                             // 0x64
    int x68;                             // 0x68
    int x6c;                             // 0x6c
    int x70;                             // 0x70
    int x74;                             // 0x74
    int x78;                             // 0x78
    int x7c;                             // 0x7c
    int x80;                             // 0x80
    int x84;                             // 0x84
    int x88;                             // 0x88
    int x8c;                             // 0x8c
    int x90;                             // 0x90
    int x94;                             // 0x94
    int x98;                             // 0x98
    int x9c;                             // 0x9c
};
struct ItemState
{
    int animID;
    void* animCallback;
    void* physCallback;
    void* collCallback;
};
struct PRIM
{
    int data;
};
typedef struct
{
    // byte 0x0
    u8 fighter;
    u8 playerStatus;
    u8 stockCount;
    u8 costume;
    u8 portNumberOverride;
    u8 spawnPointOverride;
    u8 facingDirection;
    u8 subcolor;
    u8 handicap;
    u8 team;
    u8 nametag;
    u8 unk;
    unsigned char unk2 : 6;
    unsigned char isEntry : 1;
    unsigned char isRumble : 1;
    unsigned char unk3 : 8;
    u8 cpuKind;
    u8 cpuLevel;
    u16 damageStart;
    u16 damageSpawn;
    u16 staminaStart;
    float attack;
    float defense;
    float scale;
}PlayerData;
typedef struct
{
    // byte 0x0
    unsigned int timer : 2;
    unsigned int unk1 : 3;
    unsigned int matchType : 3;
    // byte 0x1
    unsigned int unk2 : 1;
    unsigned int timer_unk : 1;
    unsigned int unk3 : 1;
    unsigned int playMusic : 1;
    unsigned int hideGo : 1;
    unsigned int hideReady : 1;
    unsigned int unk4 : 1;
    unsigned int timer_unk2 : 1;
    // byte 0x2
    unsigned int unk5 : 1;
    unsigned int isCreateHUD : 1;
    unsigned int unk7 : 1;
    unsigned int isDisablePause : 1;
    unsigned int isSingleButtonMode : 1;
    unsigned int unk8 : 1;
    unsigned int disableOffscreenDamage : 1;
    unsigned int unk9 : 1;
    // byte 0x3
    unsigned int timerRunOnPause : 1; // 0x01
    unsigned int isHidePauseHUD : 1; // 0x02
    unsigned int isShowLRAStart : 1; // 0x04
    unsigned int isCheckForLRAStart : 1; // 0x08
    unsigned int isShowZRetry : 1; // 0x10
    unsigned int isCheckForZRetry : 1; // 0x20
    unsigned int isShowAnalogStick : 1; // 0x40
    unsigned int isShowScore : 1; // 0x80
    //byte 0x4
    unsigned int unk10 : 5; // 0x01
    unsigned int isRunStockLogic : 1; // 0x20
    unsigned int isCheckStockSteal : 1; // 0x40
    unsigned int unk11 : 1; // 0x80
    //byte 0x5
    unsigned int unk12 : 5; // 0x01
    unsigned int isDisableHit : 1; // 0x20
    unsigned int isSkipUnkStockCheck : 1; // 0x40
    unsigned int isSkipEndCheck : 1; // 0x80
    // byte 0x6
    unsigned int bombRain : 8; // 0xFF
    //byte 0x7
    unsigned int unk13 : 8; // 0xFF
    //byte 0x8
    unsigned int isTeams : 8; // 0xFF
    //byte 0x9
    unsigned int isKOCounterActive : 8; // 0xFF
    //byte 0xA
    unsigned int unk14 : 8; // 0xFF
    //byte 0xB
    unsigned int itemFreq : 8; // 0xFF
    //byte 0xC
    unsigned int unk15 : 8; // 0xFF
    //byte 0xD
    unsigned int unk16 : 8; // 0xFF
    //byte 0xE
    unsigned int stageID : 16; // 0xFFFF
    //byte 0x10
    unsigned int timerSeconds : 32; // 0xFFFFFFFF
    //byte 0x14
    unsigned int timerSubSeconds : 8; // 0xFF
    //byte 0x18
    unsigned int unk17 : 32; // 0xFFFFFFFF
    //byte 0x1C
    unsigned long long itemSwitch : 64; // 0xFFFFFFFF FFFFFFFF
    //byte 0x24
    unsigned int unk18 : 32; // 0xFFFFFFFF
    //0x28
    float cameraShakeMult;
    //0x2C
    float unk19;
    //0x30
    float unk20;
    //0x34
    void *onStartMelee;
    //0x38
    int unk21;
    //0x3C
    void *onCheckPause;
    //0x40
    int unk22;
    //0x44
    void *onMatchFrame1;
    //0x48
    void *onMatchFrame2;
    //0x4C
    void *onMatchEnd;
    //0x50
    int unk23;
    //0x54
    int isMultiSpawn;
    //0x58
    int unk24;
    // player data
    PlayerData *playerData[4];
}MatchData;

// Macros
#define R13_PTR(offset) *(void **)(0x804db6a0 + offset)
#define R13_INT(offset) *(int *)(0x804db6a0 + offset)
#define R13_FLOAT(offset) *(float *)(0x804db6a0 + offset)
#define AS_FLOAT(num) *(float *)&num
#define AS_INT(num) *(int *)&num

// Functions
float fabs(float x)
{
    if (x < 0) {
        return -x;
    }
    return x;
}
int abs(int x)
{
    if (x < 0) {
        return -x;
    }
    return x;
}
void enterKnockback(GOBJ *fighter, int angle, float mag)
{
    FighterData *fighter_data = ((FighterData*)fighter->userdata);

    // store damage variables
    fighter_data->damage_ForceApplied = mag;
    fighter_data->damage_KBAngle = angle;
    fighter_data->damage_Direction = fighter_data->facing_direction;
    fighter_data->damage_DamagedHurtbox = 0;
    fighter_data->damage_Dealt = 0;
    fighter_data->damage_CollisionX = fighter_data->pos.X;
    fighter_data->damage_CollisionY = fighter_data->pos.Y;
    fighter_data->damage_CollisionZ = fighter_data->pos.Z;

    Fighter_EnterDamageState(fighter,-1,0);

    return;
}
void null()
{
    return;
}
void __attribute__((optimize("O0"))) PRIM_DRAW(PRIM* gx, float x, float y, float z, int color)
{
    AS_FLOAT(gx->data) = x;
    AS_FLOAT(gx->data) = y;
    AS_FLOAT(gx->data) = z;
    gx->data = color;
    return;
}
void C_QUATMtx( Vec4* r, Mtx m )
{

/*---------------------------------------------------------------------------*
   Name:         QUATMtx

   Description:  Converts a matrix to a unit quaternion.

   Arguments:    r   - result quaternion
                m   - the matrix

   Returns:      NONE
*---------------------------------------------------------------------------*/

    float tr,s;
    int i,j,k;
    int nxt[3] = {1,2,0};
    float q[3];

    tr = m[0][0] + m[1][1] + m[2][2];
    if( tr > 0.0f )
    {
        s = (float)sqrtf(tr + 1.0f);
        r->W = s * 0.5f;
        s = 0.5f / s;
        r->X = (m[1][2] - m[2][1]) * s;
        r->Y = (m[2][0] - m[0][2]) * s;
        r->Z = (m[0][1] - m[1][0]) * s;
    }
    else
    {
        i = 0;
        if (m[1][1] > m[0][0]) i = 1;
        if (m[2][2] > m[i][i]) i = 2;
        j = nxt[i];
        k = nxt[j];
        s = (float)sqrtf( (m[i][i] - (m[j][j] + m[k][k])) + 1.0f );
        q[i] = s * 0.5f;

        if (s!=0.0f)
            s = 0.5f / s;

        r->W = (m[j][k] - m[k][j]) * s;
        q[j] = (m[i][j] + m[j][i]) * s;
        q[k] = (m[i][k] + m[k][i]) * s;

        r->X = q[0];
        r->Y = q[1];
        r->Z = q[2];
    }
}

// Offsets
#define STAGE_CONST -0x4C08 // this is an offset used on dreamland, should be safe to use for custom stages

// Math
#define M_PI 3.14159265358979323846
#define M_1DEGREE 0.0174533

// JObj Flags
#define JOBJ_SKELETON (1 << 0)
#define JOBJ_SKELETON_ROOT (1 << 1)
#define JOBJ_ENVELOPE_MODEL (1 << 2)
#define JOBJ_CLASSICAL_SCALING (1 << 3)
#define JOBJ_HIDDEN (1 << 4)
#define JOBJ_PTCL (1 << 5)
#define JOBJ_MTX_DIRTY (1 << 6)
#define JOBJ_LIGHTING (1 << 7)
#define JOBJ_TEXGEN (1 << 8)
#define JOBJ_BILLBOARD (1 << 9)
#define JOBJ_VBILLBOARD (2 << 9)
#define JOBJ_HBILLBOARD (3 << 9)
#define JOBJ_RBILLBOARD (4 << 9)
#define JOBJ_INSTANCE (1 << 12)
#define JOBJ_PBILLBOARD (1 << 13)
#define JOBJ_SPLINE (1 << 14)
#define JOBJ_FLIP_IK (1 << 15)
#define JOBJ_SPECULAR (1 << 16)
#define JOBJ_USE_QUATERNION (1 << 17)
#define JOBJ_OPA (1 << 18)
#define JOBJ_XLU (1 << 19)
#define JOBJ_TEXEDGE (1 << 20)
#define JOBJ_NULL (0 << 21)
#define JOBJ_JOINT1 (1 << 21)
#define JOBJ_JOINT2 (2 << 21)
#define JOBJ_EFFECTOR (3 << 21)
#define JOBJ_USER_DEFINED_MTX (1 << 23)
#define JOBJ_MTX_INDEPEND_PARENT (1 << 24)
#define JOBJ_MTS_INDEPEND_SRT (1 << 25)
#define JOBJ_ROOT_OPA (1 << 28)
#define JOBJ_ROOT_XLU (1 << 29)
#define JOBJ_ROOT_TEXEDGE (1 << 30)

// Item IDs
#define ITEM_CAPSULE 0
#define ITEM_BOX 1
#define ITEM_BARREL 2
#define ITEM_EGG 3
#define ITEM_PARTYBALL 4
#define ITEM_BARRELCANNON 5
#define ITEM_BOBOMB 6
#define ITEM_MRSATURN 7
#define ITEM_HEARTCONTAINER 8
#define ITEM_MAXIMTOMATO 9
#define ITEM_STARMAN 10
#define ITEM_HOMERUNBAT 11
#define ITEM_BEAMSWORD 12
#define ITEM_PARASOL 13
#define ITEM_GREENSHELL 14
#define ITEM_REDSHELL 15
#define ITEM_RAYGUN 16
#define ITEM_FREEZIE 17
#define ITEM_FOOD 18
#define ITEM_MOTIONSENSORBOMB 19
#define ITEM_FLIPPER 20
#define ITEM_SUPERSCOPE 21
#define ITEM_STARROD 22
#define ITEM_LIPSSTICK 23
#define ITEM_FAN 24
#define ITEM_FIREFLOWER 25
#define ITEM_SUPERMUSHROOM 26
#define ITEM_POISONMUSHROOM 27
#define ITEM_HAMMER 28
#define ITEM_WARPSTAR 29
#define ITEM_SCREWATTACK 30
#define ITEM_BUNNYHOOD 31
#define ITEM_METALBOX 32
#define ITEM_CLOAKINGDEVICE 33
#define ITEM_POKEBALL 34
#define ITEM_RAYGUNUNK 35
#define ITEM_STARRODSTAR 36
#define ITEM_LIPSSTICKDUST 37
#define ITEM_SUPERSCOPEBEAM 38
#define ITEM_RAYGUNBEAM 39
#define ITEM_HAMMERHEAD 40
#define ITEM_FLOWER 41
#define ITEM_YOSHISEGG 42
#define ITEM_GOOMBA 43
#define ITEM_REDEAD 44
#define ITEM_OCTAROK 45
#define ITEM_OTTOSEA 46
#define ITEM_STONE 47
#define ITEM_MARIOFIRE 48
#define ITEM_DRMARIOPILL 49
#define ITEM_KIRBYCUTTER 50
#define ITEM_KIRBYHAMMER 51
#define ITEM_KIRBYABILITYSTAR 52
/*
 #define ITEM_ 53
 #define ITEM_ 54
 #define ITEM_ 55
 #define ITEM_ 56
 #define ITEM_ 57
 #define ITEM_ 58
 #define ITEM_ 59
 #define ITEM_ 60
 #define ITEM_ 61
 #define ITEM_ 62
 #define ITEM_ 63
 #define ITEM_ 64
 #define ITEM_ 65
 #define ITEM_ 66
 #define ITEM_ 67
 #define ITEM_ 68
 #define ITEM_ 69
 #define ITEM_ 70
 #define ITEM_ 71
 #define ITEM_ 72
 #define ITEM_ 73
 #define ITEM_ 74
 #define ITEM_ 75
 #define ITEM_ 76
 #define ITEM_ 77
 #define ITEM_ 78
 #define ITEM_ 79
 #define ITEM_ 80
 #define ITEM_ 81
 #define ITEM_ 82
 #define ITEM_ 83
 #define ITEM_ 84
 #define ITEM_ 85
 #define ITEM_ 86
 #define ITEM_ 87
 #define ITEM_ 88
 #define ITEM_ 89
 #define ITEM_ 90
 #define ITEM_ 91
 #define ITEM_ 92
 #define ITEM_ 93
 #define ITEM_ 94
 #define ITEM_ 95
 #define ITEM_ 96
 #define ITEM_ 97
 #define ITEM_ 98
 #define ITEM_ 99
 #define ITEM_ 100
 #define ITEM_ 101
 #define ITEM_ 102
 #define ITEM_ 103
 #define ITEM_ 104
 #define ITEM_ 105
 #define ITEM_ 106
 #define ITEM_ 107
 #define ITEM_ 108
 #define ITEM_ 109
 #define ITEM_ 110
 #define ITEM_ 111
 #define ITEM_ 112
 #define ITEM_ 113
 #define ITEM_ 114
 #define ITEM_ 115
 #define ITEM_ 116
 #define ITEM_ 117
 #define ITEM_ 118
 #define ITEM_ 119
 #define ITEM_ 120
 #define ITEM_ 121
 #define ITEM_ 122
 #define ITEM_ 123
 #define ITEM_ 124
 #define ITEM_ 125
 #define ITEM_ 126
 #define ITEM_ 127
 #define ITEM_ 128
 #define ITEM_ 129
 #define ITEM_ 130
 #define ITEM_ 131
 #define ITEM_ 132
 #define ITEM_ 133
 #define ITEM_ 134
 #define ITEM_ 135
 #define ITEM_ 136
 #define ITEM_ 137
 #define ITEM_ 138
 #define ITEM_ 139
 #define ITEM_ 140
 #define ITEM_ 141
 #define ITEM_ 142
 #define ITEM_ 143
 #define ITEM_ 144
 #define ITEM_ 145
 #define ITEM_ 146
 #define ITEM_ 147
 #define ITEM_ 148
 #define ITEM_ 149
 #define ITEM_ 150
 #define ITEM_ 151
 #define ITEM_ 152
 #define ITEM_ 153
 #define ITEM_ 154
 #define ITEM_ 155
 #define ITEM_ 156
 #define ITEM_ 157
 #define ITEM_ 158
 #define ITEM_ 159
 */
#define ITEM_POKERANDOM 160
#define ITEM_GOLDEEN 161
#define ITEM_CHICORITA 162
#define ITEM_SNORLAX 163
#define ITEM_BLASTOISE 164
#define ITEM_WEEZING 165
#define ITEM_CHARIZARD 166
#define ITEM_MOLTRES 167
#define ITEM_ZAPDOS 168
#define ITEM_ARCTICUNO 169
#define ITEM_WOBBUFFET 170
#define ITEM_SCIZOR 171
#define ITEM_UNOWN 172
#define ITEM_ENTEI 173
#define ITEM_RAIKOU 174
#define ITEM_SUICUNE 175
#define ITEM_BELLOSSOM 176
#define ITEM_ELECTRODE 177
#define ITEM_LUGIA 178
#define ITEM_HOOH 179
#define ITEM_DITTO 180
#define ITEM_CLEFAIRY 181
#define ITEM_TOGEPI 182
#define ITEM_MEW 183
#define ITEM_CELEBI 184
#define ITEM_STARYU 185
#define ITEM_CHANSEY 186
#define ITEM_PORYGON2 187
#define ITEM_CYNDAQUIL 188
#define ITEM_MARILL 189
#define ITEM_VENUSAUR 190
/*
 #define ITEM_ 191
 #define ITEM_ 192
 #define ITEM_ 193
 #define ITEM_ 194
 #define ITEM_ 195
 #define ITEM_ 196
 #define ITEM_ 197
 #define ITEM_ 198
 #define ITEM_ 199
 #define ITEM_ 200
 #define ITEM_ 201
 #define ITEM_ 202
 #define ITEM_ 203
 #define ITEM_ 204
 #define ITEM_ 205
 #define ITEM_ 206
 #define ITEM_ 207
 #define ITEM_ 208
 */
#define ITEM_TARGET 209
/*
 #define ITEM_ 210
 #define ITEM_ 211
 #define ITEM_ 212
 #define ITEM_ 213
 #define ITEM_ 214
 #define ITEM_ 215
 #define ITEM_ 216
 #define ITEM_ 217
 #define ITEM_ 218
 #define ITEM_ 219
 #define ITEM_ 220
 #define ITEM_ 221
 #define ITEM_ 222
 #define ITEM_ 223
 #define ITEM_ 224
 #define ITEM_ 225
 #define ITEM_ 226
 #define ITEM_ 227
 #define ITEM_ 228
 #define ITEM_ 229
 #define ITEM_ 230
 #define ITEM_ 231
 #define ITEM_ 232
 #define ITEM_ 233
 #define ITEM_ 234
 #define ITEM_ 235
 */
// map_gobjDesc Flags
#define map_isBG 0x40000000
#define map_isUnk 0x80000000

// ItemStateChange Flags
#define ITEMSTATE_UPDATEANIM 0x2
#define ITEMSTATE_GRAB 0x4

// ECB Flags
#define ECB_GROUND 0x8000
#define ECB_CEIL 0x4000
#define ECB_WALLLEFT 0x800
#define ECB_WALLRIGHT 0x20

// button bits
#define PAD_BUTTON_LEFT 0x40000
#define PAD_BUTTON_RIGHT 0x80000
#define PAD_BUTTON_DOWN 0x20000
#define PAD_BUTTON_UP 0x10000
#define PAD_BUTTON_DPAD_LEFT 0x0001
#define PAD_BUTTON_DPAD_RIGHT 0x0002
#define PAD_BUTTON_DPAD_DOWN 0x0004
#define PAD_BUTTON_DPAD_UP 0x0008
#define PAD_TRIGGER_Z 0x0010
#define PAD_TRIGGER_R 0x0020
#define PAD_TRIGGER_L 0x0040
#define PAD_BUTTON_A 0x0100
#define PAD_BUTTON_B 0x0200
#define PAD_BUTTON_X 0x0400
#define PAD_BUTTON_Y 0x0800
#define PAD_BUTTON_START 0x1000

// action state flags
#define ASC_PRESERVE_FASTFALL 0x1
#define ASC_PRESERVE_GFX 0x2
#define ASC_PRESERVE_EYE 0x80
#define ASC_1000 0x1000
#define ASC_UPDATE_SCRIPT 0x4000
#define ASC_PRESERVE_VISIBILITY 0x40000
#define ASC_80000 0x80000
#define ASC_400000 0x400000
#define ASC_4000000 0x4000000
#define ASC_8000000 0x8000000

// fighter data 0x2218 flags
#define IASAFLAG_ISREFLECT 0x10

// fighter data 0x2219 flags
#define DAMFLAG1_HITLAG1 0x1
#define DAMFLAG1_HITLAG2 0x2
#define DAMFLAG1_FREEZE 0x4
#define DAMFLAG1_UNK1 0x8
#define DAMFLAG1_HITBOXACTIVE 0x10
#define DAMFLAG1_UNK2 0x20
#define DAMFLAG1_IMMUNE 0x40
#define DAMFLAG1_REMOVEGFX 0x80

#endif
