#ifndef MEX_H
#define MEX_H

// Data types
typedef signed char s8;
typedef signed short s16;
typedef signed int s32;
typedef signed long long s64;
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;
typedef float f32;
typedef double f64;

// Align
#define OSRoundUp32B(x) (((u32)(x) + 32 - 1) & ~(32 - 1))
#define OSRoundDown32B(x) (((u32)(x)) & ~(32 - 1))

// PadGet Types
#define PADGET_MASTER 0
#define PADGET_ENGINE 1

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

// Struct Definitions
typedef struct GOBJProc GOBJProc;
typedef struct GOBJ GOBJ;
typedef struct MoveLogic MoveLogic;
typedef struct FighterData FighterData;
typedef struct ItemData ItemData;
typedef struct map_gobjData map_gobjData;
typedef struct SpawnItem SpawnItem;
typedef struct FighterBone FighterBone;
typedef struct itData itData;
typedef struct DevText DevText;
typedef struct JOBJ JOBJ;
typedef struct DOBJ DOBJ;
typedef struct TOBJ TOBJ;
typedef struct AOBJ AOBJ;
typedef struct CameraBox CameraBox;
typedef struct Stage Stage;
typedef struct itCommonAttr itCommonAttr;
typedef struct ItemState ItemState;
typedef struct Hitbox Hitbox;
typedef struct Hurtbox Hurtbox;
typedef struct DynamicBoneset DynamicBoneset;
typedef struct Effect Effect;
typedef struct Particle Particle;
typedef struct Reflect Reflect;
typedef struct PRIM PRIM;
typedef struct ColorOverlay ColorOverlay;
typedef struct Playerblock Playerblock;
typedef struct Translation Translation;
typedef struct MEXPlaylist MEXPlaylist;
typedef struct Vec2
{
    float X;
    float Y;
} Vec2;
typedef struct Vec3
{
    float X;
    float Y;
    float Z;
} Vec3;
typedef struct Vec4
{
    float X;
    float Y;
    float Z;
    float W;
} Vec4;
typedef struct GXColor
{
    u8 r;
    u8 g;
    u8 b;
    u8 a;
} GXColor;
typedef struct AOBJ
{
    u32 flags;
    f32 curr_frame;
    f32 rewind_frame;
    f32 end_frame;
    f32 framerate;
    struct _HSD_FObj *fobj;
    struct _HSD_Obj *hsd_obj;
} AOBJ;
typedef struct TOBJ
{
    int *parent;
    int x4;
    TOBJ *next;
    u32 id;                           //GXTexMapID
    u32 src;                          //GXTexGenSrc 0x10
    u32 mtxid;                        // 0x14
    Vec4 rotate;                      // 0x18
    Vec3 scale;                       // 0x28
    Vec3 translate;                   // 0x34
    u32 wrap_s;                       // 0x40 GXTexWrapMode
    u32 wrap_t;                       // 0x44 GXTexWrapMode
    u8 repeat_s;                      // 0x48
    u8 repeat_t;                      // 0x49
    u16 anim_id;                      // 0x4A
    u32 flags;                        // 0x4C
    f32 blending;                     // 0x50
    u32 magFilt;                      // 0x54 GXTexFilter
    struct _HSD_ImageDesc *imagedesc; // 0x58
    struct _HSD_Tlut *tlut;           // 0x5C
    struct _HSD_TexLODDesc *lod;      // 0x60
    AOBJ *aobj;                       // 0x64
    struct _HSD_ImageDesc **imagetbl;
    struct _HSD_Tlut **tluttbl;
    u8 tlut_no;
    Mtx mtx;
    u32 coord; //GXTexCoordID
    struct _HSD_TObjTev *tev;
} TOBJ;
typedef struct HSD_Material
{
    GXColor ambient;
    GXColor diffuse;
    GXColor specular;
    float alpha;
    float shininess;
} HSD_Material;
typedef struct MOBJ
{
    int *parent;
    u32 rendermode;
    TOBJ *tobj;
    HSD_Material *mat;
    struct _HSD_PEDesc *pe;
    AOBJ *aobj;
    /*
    struct _HSD_TObj *ambient_tobj;
    struct _HSD_TObj *specular_tobj;
    */
    struct _HSD_TExpTevDesc *tevdesc;
    union _HSD_TExp *texp;

    struct _HSD_TObj *tobj_toon;
    struct _HSD_TObj *tobj_gradation;
    struct _HSD_TObj *tobj_backlight;
    f32 z_offset;
} MOBJ;
typedef struct JOBJDesc
{
    char *class_name;       //0x00
    u32 flags;              //0x04
    struct JOBJDesc *child; //0x08
    struct JOBJDesc *next;  //0x0C
    union {
        struct _HSD_DObjDesc *dobjdesc;
        struct _HSD_Spline *spline;
        struct _HSD_SList *ptcl;
    } u;                            //0x10
    Vec3 rotation;                  //0x14 - 0x1C
    Vec3 scale;                     //0x20 - 0x28
    Vec3 position;                  //0x2C - 0x34
    Mtx mtx;                        //0x38
    struct _HSD_RObjDesc *robjdesc; //0x3C
} JOBJDesc;
typedef struct COBJDesc
{
    char *class_name;                    //0x00
    u16 flags;                           //0x04
    u16 projection_type;                 //0x06
    u16 viewport_left;                   //0x08
    u16 viewport_right;                  //0x0A
    u16 viewport_top;                    //0x0C
    u16 viewport_bottom;                 //0x0E
    u32 scissor_lr;                      //0x10
    u32 scissor_tb;                      //0x14
    struct _HSD_WObjDesc *eye_desc;      //0x18
    struct _HSD_WObjDesc *interest_desc; //0x1C
    f32 roll;                            //0x20
    Vec3 *vector;                        //0x24
    f32 near;                            //0x28
    f32 far;                             //0x2C
    union {
        struct
        {
            f32 fov;
            f32 aspect;
        } perspective;

        struct
        {
            f32 top;
            f32 bottom;
            f32 left;
            f32 right;
        } frustrum;

        struct
        {
            f32 top;
            f32 bottom;
            f32 left;
            f32 right;
        } ortho;
    } projection_param;
} COBJDesc;
typedef struct DOBJ
{
    int parent;
    DOBJ *next; //0x04
    MOBJ *mobj; //0x08
    int *pobj;  //0x0C
    AOBJ *aobj; //0x10
    u32 flags;  //0x14
    u32 unk;
};
typedef struct JOBJ
{
    int hsd_info;     //0x0
    int class_parent; //0x4
    JOBJ *sibling;    //0x08
    JOBJ *parent;     //0x0C
    JOBJ *child;      //0x10
    int flags;        //0x14
    DOBJ *dobj;       //0x18
    Vec4 rot;         //0x1C 0x20 0x24 0x28
    Vec3 scale;       //0x2C
    Vec3 trans;
    Mtx rotMtx;
    Vec3 *VEC;
    Mtx *MTX;
    AOBJ *aobj;
    int *RObj;
    JOBJDesc *desc;
};
typedef struct WOBJ
{
    void *parent;
    u32 flags;  //0x08
    Vec3 pos;   //0xC
    AOBJ *aobj; //0x18
    void *robj; //0x1C
} WOBJ;
typedef struct COBJ
{
    void *parent;
    u32 flags;           //0x08
    f32 viewport_left;   //0x0C
    f32 viewport_right;  //0x10
    f32 viewport_top;    //0x14
    f32 viewport_bottom; //0x18
    u16 scissor_left;    //0x1C
    u16 scissor_right;   //0x1E
    u16 scissor_top;     //0x20
    u16 scissor_bottom;  //0x22
    WOBJ *eye_position;  //0x24
    WOBJ *interest;      //0x28
    union {
        f32 roll; //0x2C
        Vec3 up;  //0x2C - 0x34
    } u;
    f32 near; //0x38
    f32 far;  //0x3C
    union {
        struct
        {
            f32 fov;
            f32 aspect;
        } perspective;

        struct
        {
            f32 top;
            f32 bottom;
            f32 left;
            f32 right;
        } frustrum;

        struct
        {
            f32 top;
            f32 bottom;
            f32 left;
            f32 right;
        } ortho;
    } projection_param;
    u8 projection_type; //0x50
    Mtx view_mtx;       //0x54
    AOBJ *aobj;         //0x84
    Mtx proj_mtx;       //0x88
} COBJ;
typedef struct Effect
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
} Effect;
typedef struct Particle
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
} Particle;
typedef struct Particle2 // created at 80398c90. dont feel like labelling this, offsets are @ 80398de4
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
} Particle2;
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
typedef struct TextAllocInfo
{
    u8 *curr;
    u8 *start;
    int size;
} TextAllocInfo;
typedef struct Text
{
    Vec3 trans; // 0x0-0xC
    Vec2 limit; // 0xC-0x14
    int x14;
    int x18;
    int x1c;
    int x20;
    Vec2 scale; // 0x24-0x2C
    int x2C;
    GXColor color;
    Vec2 stretch;   // 0x34-0x3C
    int x3c;        // 0x3c
    int x40;        // 0x40
    int x44;        // 0x44
    u8 fixed_width; // 0x48
    u8 kerning;     // 0x49
    u8 align;       // 0x4a
    u8 x4b;
    u8 x4c;
    u8 hidden; // 0x4D
    u8 x4e;
    u8 x4f;
    int x50;
    GOBJ *gobj;               // 0x54
    void *callback;           // 0x58, read at 803a878c
    u8 *textAlloc;            // 0x5C
    u8 *textAlloc2;           // 0x60
    TextAllocInfo *allocInfo; // 0x64
} Text;
typedef struct DevText
{
    int x0;           // 0x0
    int x4;           // 0x4
    int x8;           // 0x8
    int xc;           // 0xc
    int x10;          // 0x10
    int x14;          // 0x14
    int x18;          // 0x18
    int x1c;          // 0x1c
    int x20;          // 0x20
    char x24;         // 0x24
    char x25;         // 0x25
    char cursorBlink; // 0x26
    char x27;         // 0x27
    int x28;          // 0x28
    int x2c;          // 0x2c
    DevText *next;    // 0x30
    int x34;          // 0x34
    int x38;          // 0x38
    int x3c;          // 0x3c
    int x40;          // 0x40
    int x44;          // 0x44
    int x48;          // 0x48
    int x4c;          // 0x4c
    int x50;          // 0x50
    int x54;          // 0x54
    int x58;          // 0x58
    int x5c;          // 0x5c

} DevText;
typedef struct HSD_Pad
{
    int held;
    int heldPrev;
    int down;
    int rapidFire;
    int up;
    int rapidTimer;
    s8 stickX;
    s8 stickY;
    s8 substickX;
    s8 substickY;
    u8 triggerLeft;
    u8 triggerRight;
    float fstickX;
    float fstickY;
    float fsubstickX;
    float fsubstickY;
    float ftriggerLeft;
    float ftriggerRight;
    float x38;
    float x3c;
    u8 x40;
    u8 isPlugged;
} HSD_Pad;
typedef struct HSD_Pads
{
    HSD_Pad pad[4];
} HSD_Pads;
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
struct Playerblock
{
    int state;           // 0x00 = not present, 0x02 = HMN, 0x03 = CPU
    int ft_kind;         // external ID
    int type;            // (0x00 is HMN, 0x01 is CPU, 0x02 is Demo, 0x03 n/a)
    u8 isTransformed[2]; // 1 indicates the fighter that is active
    int flags;
    Vec3 tagPos;
    Vec3 spawnPos;
    Vec3 respawnPos;
    int x34;
    int x38;
    int x3c;
    float initialFacing;
    u8 costume;
    u8 x45;
    u8 tint;
    u8 team;
    u8 controller;
    u8 cpuLv;
    u8 cpuKind;
    u8 handicap;
    float x50;
    float attack;
    float defense;
    float scale;
    u16 damage;
    u16 initialDamage;
    u16 stamina;
    int falls[2];
    int ko[6];
    int x88;
    u16 selfDestructs;
    u8 stocks;
    int coins_curr;
    int coins_total;
    int x98;
    int x9c;
    int stickSmashes[2];
    int tag;
    u8 flags2;
    u8 flags3;
    GOBJ *fighterData;
    GOBJ *fighterDataSub;
};
struct map_gobjDesc
{
    void *onCreation;
    void *onDeletion;
    void *onFrame;
    void *onUnk;
    int flags;
};
typedef struct ColorOverlay
{
    int timer;                // 0x0
    int x4;                   // 0x4
    int *ptr1;                // 0x8
    int loop;                 // 0xc
    int *ptr2;                // 0x10
    int x14;                  // 0x14
    int *alloc;               // 0x18
    int x1c;                  // 0x1c
    int x20;                  // 0x20
    int x24;                  // 0x24
    int x28;                  // 0x28
    GXColor hex;              // 0x2C
    float red;                // 0x34
    float blue;               // 0x34
    float green;              // 0x38
    float alpha;              // 0x3C
    float redblink;           // 0x40
    float blueblink;          // 0x44
    float greenblink;         // 0x48
    float alphablink;         // 0x4C
    int x50;                  // 0x50
    int x54;                  // 0x54
    int x58;                  // 0x58
    int x5c;                  // 0x5c
    int x60;                  // 0x60
    int x64;                  // 0x64
    int x68;                  // 0x68
    int x6c;                  // 0x6c
    int x70;                  // 0x70
    int x74;                  // 0x74
    int x78;                  // 0x78
    unsigned char enable : 1; // 0x7c
    unsigned char flag2 : 1;  // 0x7c
    unsigned char flag3 : 1;  // 0x7c
    unsigned char flag4 : 1;  // 0x7c
    unsigned char flag5 : 1;  // 0x7c
    unsigned char flag6 : 1;  // 0x7c
    unsigned char flag7 : 1;  // 0x7c
    unsigned char flag8 : 1;  // 0x7c
} ColorOverlay;
typedef struct CollData
{
    GOBJ *gobj;                // 0x0
    Vec3 topN_Curr;            // 0x4
    Vec3 topN_CurrCorrect;     // 0x10
    Vec3 topN_Prev;            // 0x1c
    Vec3 topN_Proj;            // 0x28
    int flags1;                // 0x34
    int coll_test;             // 0x38, is the ID of the most recent collision test for this object
    int ignore_line;           // 0x3c, ignores this line ID during collision
    int x40;                   // 0x40
    int x44;                   // 0x44
    int ignore_group;          // 0x48  ignores this line group during collision
    int check_group;           // 0x4c  checks only this line group during collision
    int x50;                   // 0x50
    int x54;                   // 0x54
    int x58;                   // 0x58
    int x5c;                   // 0x5c
    int x60;                   // 0x60
    int x64;                   // 0x64
    int x68;                   // 0x68
    int x6c;                   // 0x6c
    int x70;                   // 0x70
    int x74;                   // 0x74
    int x78;                   // 0x78
    int x7c;                   // 0x7c
    int x80;                   // 0x80
    Vec2 ecbCurr_top;          // 0x84
    Vec2 ecbCurr_bot;          // 0x8C
    Vec2 ecbCurr_right;        // 0x94
    Vec2 ecbCurr_left;         // 0x9C
    Vec2 ecbCurrCorrect_top;   // 0xA4
    Vec2 ecbCurrCorrect_bot;   // 0xAC
    Vec2 ecbCurrCorrect_right; // 0xB4
    Vec2 ecbCurrCorrect_left;  // 0xBC
    Vec2 ecbPrev_top;          // 0xC4
    Vec2 ecbPrev_bot;          // 0xCC
    Vec2 ecbPrev_right;        // 0xD4
    Vec2 ecbPrev_left;         // 0xDC
    Vec2 ecbProj_top;          // 0xE4
    Vec2 ecbProj_bot;          // 0xEC
    Vec2 ecbProj_right;        // 0xF4
    Vec2 ecbProj_left;         // 0xFC
    int x104;                  // 0x104
    JOBJ *joint_1;             // 0x108
    JOBJ *joint_2;             // 0x10c
    JOBJ *joint_3;             // 0x110
    JOBJ *joint_4;             // 0x114
    JOBJ *joint_5;             // 0x118
    JOBJ *joint_6;             // 0x11c
    JOBJ *joint_7;             // 0x120
    int x124;                  // 0x124
    int x128;                  // 0x128
    int x12c;                  // 0x12c
    int flags;                 // 0x130
    int envFlags;              // 0x134
    int envFlags_prev;         // 0x138
    int x13c;                  // 0x13c
    int x140;                  // 0x140
    int x144;                  // 0x144
    int x148;                  // 0x148
    int ground_index;          // 0x14c, ground
    u8 ground_info;            // 0x150
    u8 ground_unk;             // 0x151
    u8 ground_type;            // 0x152, platform/ledgegrab
    u8 ground_mat;             // 0x153, grass/ice etc
    Vec3 ground_slope;         // 0x154
    int rightwall_index;       // 0x160
    u8 rightwall_info;         // 0x164
    u8 rightwall_unk;          // 0x165
    u8 rightwall_type;         // 0x166, platform/ledgegrab
    u8 rightwall_mat;          // 0x167, grass/ice etc
    Vec3 rightwall_slope;      // 0x168
    int leftwall_index;        // 0x174
    u8 leftwall_info;          // 0x178
    u8 leftwall_unk;           // 0x179
    u8 leftwall_type;          // 0x17A, platform/ledgegrab
    u8 leftwall_mat;           // 0x17B, grass/ice etc
    Vec3 leftwall_slope;       // 0x17C
    int ceil_index;            // 0x188
    u8 ceil_info;              // 0x18C
    u8 ceil_unk;               // 0x18D
    u8 ceil_type;              // 0x18E, platform/ledgegrab
    u8 ceil_mat;               // 0x18F, grass/ice etc
    Vec3 ceil_slope;           // 0x190
    int ecb_lock;              // 0x19c
} CollData;
typedef struct ECBBones
{
    float topY;
    float botY;
    Vec2 left;
    Vec2 right;
} ECBBones;
struct Hitbox
{
    int x0;   // 0x0
    int x4;   // 0x4
    int x8;   // 0x8
    int xc;   // 0xc
    int x10;  // 0x10
    int x14;  // 0x14
    int x18;  // 0x18
    int x1c;  // 0x1c
    int x20;  // 0x20
    int x24;  // 0x24
    int x28;  // 0x28
    int x2c;  // 0x2c
    int x30;  // 0x30
    int x34;  // 0x34
    int x38;  // 0x38
    int x3c;  // 0x3c
    int x40;  // 0x40
    int x44;  // 0x44
    int x48;  // 0x48
    int x4c;  // 0x4c
    int x50;  // 0x50
    int x54;  // 0x54
    int x58;  // 0x58
    int x5c;  // 0x5c
    int x60;  // 0x60
    int x64;  // 0x64
    int x68;  // 0x68
    int x6c;  // 0x6c
    int x70;  // 0x70
    int x74;  // 0x74
    int x78;  // 0x78
    int x7c;  // 0x7c
    int x80;  // 0x80
    int x84;  // 0x84
    int x88;  // 0x88
    int x8c;  // 0x8c
    int x90;  // 0x90
    int x94;  // 0x94
    int x98;  // 0x98
    int x9c;  // 0x9c
    int xa0;  // 0xa0
    int xa4;  // 0xa4
    int xa8;  // 0xa8
    int xac;  // 0xac
    int xb0;  // 0xb0
    int xb4;  // 0xb4
    int xb8;  // 0xb8
    int xbc;  // 0xbc
    int xc0;  // 0xc0
    int xc4;  // 0xc4
    int xc8;  // 0xc8
    int xcc;  // 0xcc
    int xd0;  // 0xd0
    int xd4;  // 0xd4
    int xd8;  // 0xd8
    int xdc;  // 0xdc
    int xe0;  // 0xe0
    int xe4;  // 0xe4
    int xe8;  // 0xe8
    int xec;  // 0xec
    int xf0;  // 0xf0
    int xf4;  // 0xf4
    int xf8;  // 0xf8
    int xfc;  // 0xfc
    int x100; // 0x100
    int x104; // 0x104
    int x108; // 0x108
    int x10c; // 0x10c
    int x110; // 0x110
    int x114; // 0x114
    int x118; // 0x118
    int x11c; // 0x11c
    int x120; // 0x120
    int x124; // 0x124
    int x128; // 0x128
    int x12c; // 0x12c
    int x130; // 0x130
    int x134; // 0x134
};
struct Hurtbox
{
    int x0;  // 0x0
    int x4;  // 0x4
    int x8;  // 0x8
    int xc;  // 0xc
    int x10; // 0x10
    int x14; // 0x14
    int x18; // 0x18
    int x1c; // 0x1c
    int x20; // 0x20
    int x24; // 0x24
    int x28; // 0x28
    int x2c; // 0x2c
    int x30; // 0x30
    int x34; // 0x34
    int x38; // 0x38
    int x3c; // 0x3c
    int x40; // 0x40
    int x44; // 0x44
    int x48; // 0x48
};
struct MoveLogic
{
    int animation_id;
    int flags;
    char move_id;
    char bitflags1;
    void *animation_callback;
    void *iasa_callback;
    void *physics_callback;
    void *collision_callback;
    void *camera_callback;
};
typedef struct ftData
{
    char footBoneL;
    char footBoneR;
    int *charAttributes;
    u8 *modelLookup;
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
    int *boneLookup;
} ftData;
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
struct CameraBox
{
    GOBJ *item;             // 0x0
    int x4;                 // 0x4
    int x8;                 // 0x8
    int xC;                 // 0xC
    int itemID;             // 0x10
    int x14;                // 0x14
    int x18;                // 0x18
    int x1c;                // 0x1c
    int x20;                // 0x20
    int x24;                // 0x24
    int stateID;            // 0x28
    float boundleftTween;   // 0x2C
    float boundrightTween;  // 0x30
    float boundtopTween;    // 0x34
    float boundbottomTween; // 0x38
    float scale;            // 0x3c
    float boundleft;        // 0x40
    float boundright;       // 0x44
    float boundtop;         // 0x48
    float boundbottom;      // 0x4c
};
struct GOBJProc
{
    GOBJ *parent;
    GOBJProc *next;
    GOBJProc *prev;
    char s_link;            // 0xC
    char flags;             // 0xD
    GOBJ *parentGOBJ;       // 0x10
    void (*cb)(GOBJ *gobj); // function callback
};
struct GOBJ
{
    short entity_class;      // 0x0
    char p_link;             // 0x2
    char gx_link;            // 0x3. 0-63 are gx. 64+ are reserved for camera objects
    char p_priority;         // 0x4
    char gx_pri;             // 0x5
    char obj_kind;           // 0x6
    char data_kind;          // 0x7
    GOBJ *next;              // 0x8
    GOBJ *previous;          // 0xC
    GOBJ *nextOrdered;       // 0x10
    GOBJ *previousOrdered;   // 0x14
    GOBJProc *gobj_proc;     // 0x18
    void *gx_cb;             // 0x1C
    u64 cobj_id;             // 0x20. this is used to know which cobj to render to
    void *hsd_object;        // 0x28
    void *userdata;          // 0x2C
    int destructor_function; // 0x30
    int unk_linked_list;     // 0x34
};
typedef struct GOBJList
{
    // pointed to @ -0x3e74(r13)
    GOBJ *x0;
    GOBJ *x4;
    GOBJ *x8;
    GOBJ *xc;
    GOBJ *x10;
    GOBJ *camera;
    GOBJ *x18;
    GOBJ *x1c;
    GOBJ *fighter;
    GOBJ *item;
    GOBJ *x28;
    GOBJ *effect;
    GOBJ *ptcl;
    GOBJ *x34;
} GOBJList;
typedef struct GXList
{
    // pointed to @ -0x3e80(r13)
    GOBJ *gx_render[63]; // pointer to 63 gobjs
    GOBJ *gx_camera;     // pointer to the highest priority cobj gobj. they are linked together via the next member.
} GXList;
typedef struct CPU
{
    int held;   // 0x0
    u8 lstickX; // 0x4
    u8 lstickY; // 0x5
    u8 cstickX; // 0x6
    u8 cstickY; // 0x7
    int x8;     // 0x8
    int ai;     // 0xc
    int level;  // 0x10
    int x14;    // 0x14
    int x18;    // 0x18
    int x1c;    // 0x1c
    int x20;    // 0x20
    int x24;    // 0x24
    int x28;    // 0x28
    int x2c;    // 0x2c
    int x30;    // 0x30
    int x34;    // 0x34
    int x38;    // 0x38
    int x3c;    // 0x3c
    int x40;    // 0x40
    int x44;    // 0x44
    int x48;    // 0x48
    int x4c;    // 0x4c
    int x50;    // 0x50
    int x54;    // 0x54
    int x58;    // 0x58
    int x5c;    // 0x5c
    int x60;    // 0x60
    int x64;    // 0x64
    int x68;    // 0x68
    int x6c;    // 0x6c
    int x70;    // 0x70
    int x74;    // 0x74
    int x78;    // 0x78
    int x7c;    // 0x7c
    int x80;    // 0x80
    int x84;    // 0x84
    int x88;    // 0x88
    int x8c;    // 0x8c
    int x90;    // 0x90
    int x94;    // 0x94
    int x98;    // 0x98
    int x9c;    // 0x9c
    int xa0;    // 0xa0
    int xa4;    // 0xa4
    int xa8;    // 0xa8
    int xac;    // 0xac
    int xb0;    // 0xb0
    int xb4;    // 0xb4
    int xb8;    // 0xb8
    int xbc;    // 0xbc
    int xc0;    // 0xc0
    int xc4;    // 0xc4
    int xc8;    // 0xc8
    int xcc;    // 0xcc
    int xd0;    // 0xd0
    int xd4;    // 0xd4
    int xd8;    // 0xd8
    int xdc;    // 0xdc
    int xe0;    // 0xe0
    int xe4;    // 0xe4
    int xe8;    // 0xe8
    int xec;    // 0xec
    int xf0;    // 0xf0
    int xf4;    // 0xf4
    int xf8;    // 0xf8
    int xfc;    // 0xfc
    int x100;   // 0x100
    int x104;   // 0x104
    int x108;   // 0x108
    int x10c;   // 0x10c
    int x110;   // 0x110
    int x114;   // 0x114
    int x118;   // 0x118
    int x11c;   // 0x11c
    int x120;   // 0x120
    int x124;   // 0x124
    int x128;   // 0x128
    int x12c;   // 0x12c
    int x130;   // 0x130
    int x134;   // 0x134
    int x138;   // 0x138
    int x13c;   // 0x13c
    int x140;   // 0x140
    int x144;   // 0x144
    int x148;   // 0x148
    int x14c;   // 0x14c
    int x150;   // 0x150
    int x154;   // 0x154
    int x158;   // 0x158
    int x15c;   // 0x15c
    int x160;   // 0x160
    int x164;   // 0x164
    int x168;   // 0x168
    int x16c;   // 0x16c
    int x170;   // 0x170
    int x174;   // 0x174
    int x178;   // 0x178
    int x17c;   // 0x17c
    int x180;   // 0x180
    int x184;   // 0x184
    int x188;   // 0x188
    int x18c;   // 0x18c
    int x190;   // 0x190
    int x194;   // 0x194
    int x198;   // 0x198
    int x19c;   // 0x19c
    int x1a0;   // 0x1a0
    int x1a4;   // 0x1a4
    int x1a8;   // 0x1a8
    int x1ac;   // 0x1ac
    int x1b0;   // 0x1b0
    int x1b4;   // 0x1b4
    int x1b8;   // 0x1b8
    int x1bc;   // 0x1bc
    int x1c0;   // 0x1c0
    int x1c4;   // 0x1c4
    int x1c8;   // 0x1c8
    int x1cc;   // 0x1cc
    int x1d0;   // 0x1d0
    int x1d4;   // 0x1d4
    int x1d8;   // 0x1d8
    int x1dc;   // 0x1dc
    int x1e0;   // 0x1e0
    int x1e4;   // 0x1e4
    int x1e8;   // 0x1e8
    int x1ec;   // 0x1ec
    int x1f0;   // 0x1f0
    int x1f4;   // 0x1f4
    int x1f8;   // 0x1f8
    int x1fc;   // 0x1fc
    int x200;   // 0x200
    int x204;   // 0x204
    int x208;   // 0x208
    int x20c;   // 0x20c
    int x210;   // 0x210
    int x214;   // 0x214
    int x218;   // 0x218
    int x21c;   // 0x21c
    int x220;   // 0x220
    int x224;   // 0x224
    int x228;   // 0x228
    int x22c;   // 0x22c
    int x230;   // 0x230
    int x234;   // 0x234
    int x238;   // 0x238
    int x23c;   // 0x23c
    int x240;   // 0x240
    int x244;   // 0x244
    int x248;   // 0x248
    int x24c;   // 0x24c
    int x250;   // 0x250
    int x254;   // 0x254
    int x258;   // 0x258
    int x25c;   // 0x25c
    int x260;   // 0x260
    int x264;   // 0x264
    int x268;   // 0x268
    int x26c;   // 0x26c
    int x270;   // 0x270
    int x274;   // 0x274
    int x278;   // 0x278
    int x27c;   // 0x27c
    int x280;   // 0x280
    int x284;   // 0x284
    int x288;   // 0x288
    int x28c;   // 0x28c
    int x290;   // 0x290
    int x294;   // 0x294
    int x298;   // 0x298
    int x29c;   // 0x29c
    int x2a0;   // 0x2a0
    int x2a4;   // 0x2a4
    int x2a8;   // 0x2a8
    int x2ac;   // 0x2ac
    int x2b0;   // 0x2b0
    int x2b4;   // 0x2b4
    int x2b8;   // 0x2b8
    int x2bc;   // 0x2bc
    int x2c0;   // 0x2c0
    int x2c4;   // 0x2c4
    int x2c8;   // 0x2c8
    int x2cc;   // 0x2cc
    int x2d0;   // 0x2d0
    int x2d4;   // 0x2d4
    int x2d8;   // 0x2d8
    int x2dc;   // 0x2dc
    int x2e0;   // 0x2e0
    int x2e4;   // 0x2e4
    int x2e8;   // 0x2e8
    int x2ec;   // 0x2ec
    int x2f0;   // 0x2f0
    int x2f4;   // 0x2f4
    int x2f8;   // 0x2f8
    int x2fc;   // 0x2fc
    int x300;   // 0x300
    int x304;   // 0x304
    int x308;   // 0x308
    int x30c;   // 0x30c
    int x310;   // 0x310
    int x314;   // 0x314
    int x318;   // 0x318
    int x31c;   // 0x31c
    int x320;   // 0x320
    int x324;   // 0x324
    int x328;   // 0x328
    int x32c;   // 0x32c
    int x330;   // 0x330
    int x334;   // 0x334
    int x338;   // 0x338
    int x33c;   // 0x33c
    int x340;   // 0x340
    int x344;   // 0x344
    int x348;   // 0x348
    int x34c;   // 0x34c
    int x350;   // 0x350
    int x354;   // 0x354
    int x358;   // 0x358
    int x35c;   // 0x35c
    int x360;   // 0x360
    int x364;   // 0x364
    int x368;   // 0x368
    int x36c;   // 0x36c
    int x370;   // 0x370
    int x374;   // 0x374
    int x378;   // 0x378
    int x37c;   // 0x37c
    int x380;   // 0x380
    int x384;   // 0x384
    int x388;   // 0x388
    int x38c;   // 0x38c
    int x390;   // 0x390
    int x394;   // 0x394
    int x398;   // 0x398
    int x39c;   // 0x39c
    int x3a0;   // 0x3a0
    int x3a4;   // 0x3a4
    int x3a8;   // 0x3a8
    int x3ac;   // 0x3ac
    int x3b0;   // 0x3b0
    int x3b4;   // 0x3b4
    int x3b8;   // 0x3b8
    int x3bc;   // 0x3bc
    int x3c0;   // 0x3c0
    int x3c4;   // 0x3c4
    int x3c8;   // 0x3c8
    int x3cc;   // 0x3cc
    int x3d0;   // 0x3d0
    int x3d4;   // 0x3d4
    int x3d8;   // 0x3d8
    int x3dc;   // 0x3dc
    int x3e0;   // 0x3e0
    int x3e4;   // 0x3e4
    int x3e8;   // 0x3e8
    int x3ec;   // 0x3ec
    int x3f0;   // 0x3f0
    int x3f4;   // 0x3f4
    int x3f8;   // 0x3f8
    int x3fc;   // 0x3fc
    int x400;   // 0x400
    int x404;   // 0x404
    int x408;   // 0x408
    int x40c;   // 0x40c
    int x410;   // 0x410
    int x414;   // 0x414
    int x418;   // 0x418
    int x41c;   // 0x41c
    int x420;   // 0x420
    int x424;   // 0x424
    int x428;   // 0x428
    int x42c;   // 0x42c
    int x430;   // 0x430
    int x434;   // 0x434
    int x438;   // 0x438
    int x43c;   // 0x43c
    int x440;   // 0x440
    int x444;   // 0x444
    int x448;   // 0x448
    int x44c;   // 0x44c
    int x450;   // 0x450
    int x454;   // 0x454
    int x458;   // 0x458
    int x45c;   // 0x45c
    int x460;   // 0x460
    int x464;   // 0x464
    int x468;   // 0x468
    int x46c;   // 0x46c
    int x470;   // 0x470
    int x474;   // 0x474
    int x478;   // 0x478
    int x47c;   // 0x47c
    int x480;   // 0x480
    int x484;   // 0x484
    int x488;   // 0x488
    int x48c;   // 0x48c
    int x490;   // 0x490
    int x494;   // 0x494
    int x498;   // 0x498
    int x49c;   // 0x49c
    int x4a0;   // 0x4a0
    int x4a4;   // 0x4a4
    int x4a8;   // 0x4a8
    int x4ac;   // 0x4ac
    int x4b0;   // 0x4b0
    int x4b4;   // 0x4b4
    int x4b8;   // 0x4b8
    int x4bc;   // 0x4bc
    int x4c0;   // 0x4c0
    int x4c4;   // 0x4c4
    int x4c8;   // 0x4c8
    int x4cc;   // 0x4cc
    int x4d0;   // 0x4d0
    int x4d4;   // 0x4d4
    int x4d8;   // 0x4d8
    int x4dc;   // 0x4dc
    int x4e0;   // 0x4e0
    int x4e4;   // 0x4e4
    int x4e8;   // 0x4e8
    int x4ec;   // 0x4ec
    int x4f0;   // 0x4f0
    int x4f4;   // 0x4f4
    int x4f8;   // 0x4f8
    int x4fc;   // 0x4fc
    int x500;   // 0x500
    int x504;   // 0x504
    int x508;   // 0x508
    int x50c;   // 0x50c
    int x510;   // 0x510
    int x514;   // 0x514
    int x518;   // 0x518
    int x51c;   // 0x51c
    int x520;   // 0x520
    int x524;   // 0x524
    int x528;   // 0x528
    int x52c;   // 0x52c
    int x530;   // 0x530
    int x534;   // 0x534
    int x538;   // 0x538
    int x53c;   // 0x53c
    int x540;   // 0x540
    int x544;   // 0x544
    int x548;   // 0x548
    int x54c;   // 0x54c
    int x550;   // 0x550
    int x554;   // 0x554
} CPU;
struct FighterBone
{
    JOBJ *joint;
    JOBJ *joint2;
    int flags;
    int flags2;
};
struct FighterData
{
    GOBJ *fighter;                                    // 0x0
    int kind;                                         // 0x4
    int spawn_num;                                    // 0x8
    char ply;                                         // 0xC
    char unknown;                                     // 0xD
    char unknownE;                                    // 0xE
    char unknownF;                                    // 0xF
    int state_id;                                     // 0x10
    int anim_id;                                      // 0x14
    int state_num;                                    // 0x18
    MoveLogic *common_states;                         // 0x1C
    MoveLogic *special_states;                        // 0x20
    int *anim_flags;                                  // 0x24
    u16 *dynamics_data;                               // 0x28
    float facing_direction;                           // 0x2C
    float facing_direction_repeated;                  // 0x30
    Vec3 scale;                                       // 0x3C
    int pointer_to_next_linked_list;                  // 0x40
    int pointer_to_0x40__pointer_to_prev_linked_list; // 0x44
    int length_of_linked_list;                        // 0x48
    int unknown4C;                                    // 0x4C
    int unknown50;                                    // 0x50
    int unknown54;                                    // 0x54
    int unknown58;                                    // 0x58
    int unknown5C;                                    // 0x5C
    int unknown60;                                    // 0x60
    int unknown64;                                    // 0x64
    int unknown68;                                    // 0x68
    int unknown6C;                                    // 0x6C
    int unknown70;                                    // 0x70
    Vec3 animVel;                                     // 0x74
    Vec3 selfVel;                                     // 0x80
    Vec3 kbVel;                                       // 0x8C
    int x98;                                          // 0x98
    int x9c;                                          // 0x9C
    int xa0;                                          // 0xA0
    int xa4;                                          // 0xA4
    int xa8;                                          // 0xA8
    int xac;                                          // 0xAC
    Vec3 pos;
    Vec3 pos_prev;                                         // 0xBC
    Vec3 pos_delta;                                        // 0xC8
    Vec3 unknownD4;                                        // 0xD4
    int air_state;                                         // 0xE0
    float horzitonal_velocity_queue_will_be_added_to_0xec; // 0xE4
    float vertical_velocity_queue_will_be_added_to_0xec;   // 0xE8
    Vec3 selfVelGround;                                    // 0xEC
    int unknownF8;                                         // 0xF8
    int unknownFC;                                         // 0xFC
    int unknown100;                                        // 0x100
    int *costume_JObjDesc;                                 // 0x104
    int *costume_archive;                                  // 0x108
    ftData *ftData;                                        // 0x10C
    float walk_initial_velocity;                           // 0x110
    float walk_acceleration;                               // 0x114
    float walk_maximum_velocity;                           // 0x118
    float slow_walk_max;                                   // 0x11C
    float mid_walk_point;                                  // 0x120
    float fast_walk_min;                                   // 0x124
    float ground_friction;                                 // 0x128
    float dash_initial_velocity;                           // 0x12C
    float dashrun_acceleration_a;                          // 0x130
    float dashrun_acceleration_b;                          // 0x134
    float dashrun_terminal_velocity;                       // 0x138
    float run_animation_scaling;                           // 0x13C
    float max_runbrake_frames;                             // 0x140
    float grounded_max_horizontal_velocity;                // 0x144
    float jump_startup_time;                               // 0x148
    float jump_h_initial_velocity;                         // 0x14C
    float jump_v_initial_velocity;                         // 0x150
    float ground_to_air_jump_momentum_multiplier;          // 0x154
    float jump_h_max_velocity;                             // 0x158
    float hop_v_initial_velocity;                          // 0x15C
    float air_jump_v_multiplier;                           // 0x160
    float air_jump_h_multiplier;                           // 0x164
    int max_jumps;                                         // 0x168
    float gravity;                                         // 0x16C
    float terminal_velocity;                               // 0x170
    float aerialDriftStickMult;                            // 0x174
    float aerialDriftBase;                                 // 0x178
    float aerialDriftMax;                                  // 0x17C
    float aerialFriction;                                  // 0x180
    float fastfall_velocity;                               // 0x184
    float horizontal_air_mobility_constant;                // 0x188
    int jab_2_input_window;                                // 0x18C
    int jab_3_input_window;                                // 0x190
    int frames_to_change_direction_on_standing_turn;       // 0x194
    float weight;                                          // 0x198
    float model_scaling;                                   // 0x19C
    float initial_shield_size;                             // 0x1A0
    float shield_break_initial_velocity;                   // 0x1A4
    int rapid_jab_window;                                  // 0x1A8
    int unknown1AC;                                        // 0x1AC
    int unknown1B0;                                        // 0x1B0
    int unknown1B4;                                        // 0x1B4
    float ledge_jump_horizontal_velocity;                  // 0x1B8
    float ledge_jump_vertical_velocity;                    // 0x1BC
    float item_throw_velocity_multiplier;                  // 0x1C0
    int unknown1C4;                                        // 0x1C4
    int unknown1C8;                                        // 0x1C8
    int unknown1CC;                                        // 0x1CC
    int unknown1D0;                                        // 0x1D0
    int unknown1D4;                                        // 0x1D4
    int unknown1D8;                                        // 0x1D8
    int unknown1DC;                                        // 0x1DC
    int unknown1E0;                                        // 0x1E0
    int unknown1E4;                                        // 0x1E4
    int unknown1E8;                                        // 0x1E8
    int unknown1EC;                                        // 0x1EC
    float kirby_b_star_damage;                             // 0x1F0
    float normal_landing_lag;                              // 0x1F4
    float n_air_landing_lag;                               // 0x1F8
    float f_air_landing_lag;                               // 0x1FC
    float b_air_landing_lag;                               // 0x200
    float u_air_landing_lag;                               // 0x204
    float d_air_landing_lag;                               // 0x208
    float nametag_height;                                  // 0x20C
    int unknown210;                                        // 0x210
    float wall_jump_horizontal_velocity;                   // 0x214
    float wall_jump_vertical_velocity;                     // 0x218
    int unknown21C;                                        // 0x21C
    int unknown220;                                        // 0x220
    int unknown224;                                        // 0x224
    int unknown228;                                        // 0x228
    int unknown22C;                                        // 0x22C
    int unknown230;                                        // 0x230
    int unknown234;                                        // 0x234
    int unknown238;                                        // 0x238
    int unknown23C;                                        // 0x23C
    int unknown240;                                        // 0x240
    int unknown244;                                        // 0x244
    int unknown248;                                        // 0x248
    int unknown24C;                                        // 0x24C
    int unknown250;                                        // 0x250
    int unknown254;                                        // 0x254
    int unknown258;                                        // 0x258
    float bubble_ratio;                                    // 0x25C
    int unknown260;                                        // 0x260
    int unknown264;                                        // 0x264
    int unknown268;                                        // 0x268
    int unknown26C;                                        // 0x26C
    float respawn_platform_scale;                          // 0x270
    int unknown274;                                        // 0x274
    int unknown278;                                        // 0x278
    int camera_zoom_target_bone;                           // 0x27C
    int unknown280;                                        // 0x280
    int unknown284;                                        // 0x284
    int unknown288;                                        // 0x288
    int special_jump_action___1;                           // 0x28C
    int weight_dependent_throw_speed_flags;                // 0x290
    int unknown294;                                        // 0x294
    int unknown298;                                        // 0x298
    int unknown29C;                                        // 0x29C
    int unknown2A0;                                        // 0x2A0
    int unknown2A4;                                        // 0x2A4
    int unknown2A8;                                        // 0x2A8
    int unknown2AC;                                        // 0x2AC
    int unknown2B0;                                        // 0x2B0
    int unknown2B4;                                        // 0x2B4
    int unknown2B8;                                        // 0x2B8
    int unknown2BC;                                        // 0x2BC
    int unknown2C0;                                        // 0x2C0
    int unknown2C4;                                        // 0x2C4
    int unknown2C8;                                        // 0x2C8
    int unknown2CC;                                        // 0x2CC
    int unknown2D0;                                        // 0x2D0
    int *special_attributes;                               // 0x2D4
    int *special_attributes2;                              // 0x2D8
    int unknown2DC;                                        // 0x2DC
    int unknown2E0;                                        // 0x2E0
    int unknown2E4;                                        // 0x2E4
    int unknown2E8;                                        // 0x2E8
    int unknown2EC;                                        // 0x2EC
    DynamicBoneset dynamics_boneset[5];                    //0x2f0
    int unknown3B8;                                        // 0x3B8
    int unknown3BC;                                        // 0x3BC
    int unknown3C0;                                        // 0x3C0
    int unknown3C4;                                        // 0x3C4
    int unknown3C8;                                        // 0x3C8
    int unknown3CC;                                        // 0x3CC
    int unknown3D0;                                        // 0x3D0
    int unknown3D4;                                        // 0x3D4
    int unknown3D8;                                        // 0x3D8
    int unknown3DC;                                        // 0x3DC
    int dynamic_boneset_num;                               // 0x3E0
    int script_event_timer;                                // 0x3E4
    int script_frame_timer;                                // 0x3E8
    int *script_current;                                   // 0x3EC
    int script_loop_num;                                   // 0x3F0
    int *script_return;                                    // 0x3F4
    int unk;                                               // 0x3F8
    int unk3FC;                                            // 0x3FC
    int pointer_to_0x460;                                  // 0x400
    int pointer_to_0x3c0;                                  // 0x404
    int unknown408;                                        // 0x408
    int unknown40C;                                        // 0x40C
    int unknown410;                                        // 0x410
    int unknown414;                                        // 0x414
    int unknown418;                                        // 0x418
    int unknown41C;                                        // 0x41C
    int unknown420;                                        // 0x420
    int unknown424;                                        // 0x424
    int unknown428;                                        // 0x428
    int unknown42C;                                        // 0x42C
    int unknown430;                                        // 0x430
    int unknown434;                                        // 0x434
    int unknown438;                                        // 0x438
    int unknown43C;                                        // 0x43C
    int unknown440;                                        // 0x440
    int unknown444;                                        // 0x444
    int unknown448;                                        // 0x448
    int unknown44C;                                        // 0x44C
    int unknown450;                                        // 0x450
    int unknown454;                                        // 0x454
    int unknown458;                                        // 0x458
    int unknown45C;                                        // 0x45C
    int unknown460;                                        // 0x460
    int unknown464;                                        // 0x464
    int unknown468;                                        // 0x468
    int unknown46C;                                        // 0x46C
    int unknown470;                                        // 0x470
    int unknown474;                                        // 0x474
    int unknown478;                                        // 0x478
    int unknown47C;                                        // 0x47C
    int unknown480;                                        // 0x480
    int unknown484;                                        // 0x484
    ColorOverlay color[2];                                 // 0x488
    int *LObj;                                             // 0x588
    int anim_num;                                          // 0x58C
    int *anim_curr_flags_ptr;                              // 0x590
    int anim_curr_flags;                                   // 0x594
    int *anim_requested;                                   // 0x598
    int *anim_cache_curr;                                  // 0x59C
    int *anim_cache_persist;                               // 0x5A0
    int *anim_curr_ARAM;                                   // 0x5A4
    int *anim_persist_ARAM;                                // 0x5A8
    int dobj_toggle_num;                                   // 0x5AC
    int unknown5B0;                                        // 0x5B0
    int unknown5B4;                                        // 0x5B4
    int unknown5B8;                                        // 0x5B8
    int unknown5BC;                                        // 0x5BC
    int unknown5C0;                                        // 0x5C0
    int unknown5C4;                                        // 0x5C4
    int unknown5C8;                                        // 0x5C8
    int unknown5CC;                                        // 0x5CC
    int unknown5D0;                                        // 0x5D0
    int unknown5D4;                                        // 0x5D4
    int unknown5D8;                                        // 0x5D8
    int unknown5DC;                                        // 0x5DC
    int unknown5E0;                                        // 0x5E0
    int unknown5E4;                                        // 0x5E4
    FighterBone *bones;                                    // 0x5E8
    int bone_num;                                          // 0x5EC
    int bone_arr;                                          // 0x5F0
    u16 dobj_toggle[12];                                   // 0x5f4
    Effect *gfx;                                           // 0x60C
    int unknown610;                                        // 0x610
    int unknown614;                                        // 0x614
    char player_controller_number;                         // 0x618
    char costume_id;                                       // 0x619
    char color_overlay_id;                                 // 0x61A
    u8 team;                                               // 0x61B
    char unknown61E;                                       // 0x61E
    char unknown61F;                                       // 0x61F

    // input data
    float input_lstick_x;            // 0x620
    float input_lstick_y;            // 0x624
    float input_lstick_prev_x;       // 0x628
    float input_lstick_prev_y;       // 0x62C
    int unknown630;                  // 0x630
    int unknown634;                  // 0x634
    float input_cstick_x;            // 0x638
    float input_cstick_y;            // 0x63C
    int x640;                        // 0x640
    int unknown644;                  // 0x644
    int unknown648;                  // 0x648
    int unknown64C;                  // 0x64C
    float input_trigger;             // 0x650
    int unknown654;                  // 0x654
    int unknown658;                  // 0x658
    int input_held;                  // 0x65C
    int input_held_prev;             // 0x660
    int unknown664;                  // 0x664
    int input_pressed;               // 0x668
    int unknown66C;                  // 0x66C
    char inputtimer_lstick_tilt_x;   // 0x670
    char inputtimer_lstick_tilt_y;   // 0x671
    char inputtimer_trigger_analog;  // 0x672
    char inputtimer_lstick_smash_x;  // 0x673
    char inputtimer_lstick_smash_y;  // 0x674
    char inputtimer_trigger_digital; // 0x675
    char inputtimer_lstick_any_x;    // 0x676
    char inputtimer_lstick_any_y;    // 0x677
    char inputtimer_trigger_any;     // 0x678
    char x679;                       // 0x679
    char x67A;                       // 0x67A
    char x67B;                       // 0x67B
    char inputtimer_a;               // 0x67C
    char inputtimer_b;               // 0x67D
    char inputtimer_xy;              // 0x67E
    char inputtimer_z;               // 0x67F
    char input_sinceLR;              // 0x680
    char inputtimer_padup;           // 0x681
    char inputtimer_paddown;         // 0x682
    char timer_item_release;         // 0x683
    char input_sinceRapidLR;         // 0x684
    char timer_unk2;                 // 0x685
    char timer_unk3;                 // 0x686
    char timer_unk4;                 // 0x687
    char inputtimer_sideb;           // 0x688
    char inputtimer_neutralb;        // 0x689
    char inputtimer_unk;             // 0x68A
    char inputtimer_unk2;            // 0x68B
    Vec3 animOffset;
    int x698;
    int x69C;
    int x6A0;
    int x6A4;
    float unk_y_offset_from_double_jump_position;   // 0x6A8
    float unk6AC;                                   // 0x6AC
    int unknown6B0;                                 // 0x6B0
    int unknown6B4;                                 // 0x6B4
    int unknown6B8;                                 // 0x6B8
    float input_stickangle;                         // 0x6BC
    int unknown6C0;                                 // 0x6C0
    int unknown6C4;                                 // 0x6C4
    int unknown6C8;                                 // 0x6C8
    int unknown6CC;                                 // 0x6CC
    int unknown6D0;                                 // 0x6D0
    int unknown6D4;                                 // 0x6D4
    int unknown6D8;                                 // 0x6D8
    int unknown6DC;                                 // 0x6DC
    int unknown6E0;                                 // 0x6E0
    int unknown6E4;                                 // 0x6E4
    int unknown6E8;                                 // 0x6E8
    int unknown6EC;                                 // 0x6EC
    CollData collData;                              // 0x6F0 -> 0x88C
    CameraBox *cameraBox;                           // 0x890
    float stateFrame;                               // 0x894
    int unknown898;                                 // 0x898
    float stateSpeed;                               // 0x89C
    int x8a0;                                       // 0x8a0
    float stateBlend;                               // 0x8a4
    int x8a8;                                       // 0x8a8
    JOBJ *animSkeleton;                             // 0x8ac
    int x8b0;                                       // 0x8b0
    int x8b4;                                       // 0x8b4
    int x8b8;                                       // 0x8b8
    int x8bc;                                       // 0x8bc
    int x8c0;                                       // 0x8c0
    int x8c4;                                       // 0x8c4
    int x8c8;                                       // 0x8c8
    int x8cc;                                       // 0x8cc
    int x8d0;                                       // 0x8d0
    int x8d4;                                       // 0x8d4
    int x8d8;                                       // 0x8d8
    int x8dc;                                       // 0x8dc
    int x8e0;                                       // 0x8e0
    int x8e4;                                       // 0x8e4
    int x8e8;                                       // 0x8e8
    int x8ec;                                       // 0x8ec
    int x8f0;                                       // 0x8f0
    int x8f4;                                       // 0x8f4
    int x8f8;                                       // 0x8f8
    int x8fc;                                       // 0x8fc
    int x900;                                       // 0x900
    int x904;                                       // 0x904
    int x908;                                       // 0x908
    int x90c;                                       // 0x90c
    int x910;                                       // 0x910
    Hitbox hitbox[4];                               //0x914
    int xdf4;                                       // 0xdf4
    int xdf8;                                       // 0xdf8
    int xdfc;                                       // 0xdfc
    int xe00;                                       // 0xe00
    int xe04;                                       // 0xe04
    int xe08;                                       // 0xe08
    int xe0c;                                       // 0xe0c
    int xe10;                                       // 0xe10
    int xe14;                                       // 0xe14
    int xe18;                                       // 0xe18
    int xe1c;                                       // 0xe1c
    int xe20;                                       // 0xe20
    int xe24;                                       // 0xe24
    int xe28;                                       // 0xe28
    int xe2c;                                       // 0xe2c
    int xe30;                                       // 0xe30
    int xe34;                                       // 0xe34
    int xe38;                                       // 0xe38
    int xe3c;                                       // 0xe3c
    int xe40;                                       // 0xe40
    int xe44;                                       // 0xe44
    int xe48;                                       // 0xe48
    int xe4c;                                       // 0xe4c
    int xe50;                                       // 0xe50
    int xe54;                                       // 0xe54
    int xe58;                                       // 0xe58
    int xe5c;                                       // 0xe5c
    int xe60;                                       // 0xe60
    int xe64;                                       // 0xe64
    int xe68;                                       // 0xe68
    int xe6c;                                       // 0xe6c
    int xe70;                                       // 0xe70
    int xe74;                                       // 0xe74
    int xe78;                                       // 0xe78
    int xe7c;                                       // 0xe7c
    int xe80;                                       // 0xe80
    int xe84;                                       // 0xe84
    int xe88;                                       // 0xe88
    int xe8c;                                       // 0xe8c
    int xe90;                                       // 0xe90
    int xe94;                                       // 0xe94
    int xe98;                                       // 0xe98
    int xe9c;                                       // 0xe9c
    int xea0;                                       // 0xea0
    int xea4;                                       // 0xea4
    int xea8;                                       // 0xea8
    int xeac;                                       // 0xeac
    int xeb0;                                       // 0xeb0
    int xeb4;                                       // 0xeb4
    int xeb8;                                       // 0xeb8
    int xebc;                                       // 0xebc
    int xec0;                                       // 0xec0
    int xec4;                                       // 0xec4
    int xec8;                                       // 0xec8
    int xecc;                                       // 0xecc
    int xed0;                                       // 0xed0
    int xed4;                                       // 0xed4
    int xed8;                                       // 0xed8
    int xedc;                                       // 0xedc
    int xee0;                                       // 0xee0
    int xee4;                                       // 0xee4
    int xee8;                                       // 0xee8
    int xeec;                                       // 0xeec
    int xef0;                                       // 0xef0
    int xef4;                                       // 0xef4
    int xef8;                                       // 0xef8
    int xefc;                                       // 0xefc
    int xf00;                                       // 0xf00
    int xf04;                                       // 0xf04
    int xf08;                                       // 0xf08
    int xf0c;                                       // 0xf0c
    int xf10;                                       // 0xf10
    int xf14;                                       // 0xf14
    int xf18;                                       // 0xf18
    int xf1c;                                       // 0xf1c
    int xf20;                                       // 0xf20
    int xf24;                                       // 0xf24
    int xf28;                                       // 0xf28
    int xf2c;                                       // 0xf2c
    int xf30;                                       // 0xf30
    int xf34;                                       // 0xf34
    int xf38;                                       // 0xf38
    int xf3c;                                       // 0xf3c
    int xf40;                                       // 0xf40
    int xf44;                                       // 0xf44
    int xf48;                                       // 0xf48
    int xf4c;                                       // 0xf4c
    int xf50;                                       // 0xf50
    int xf54;                                       // 0xf54
    int xf58;                                       // 0xf58
    int xf5c;                                       // 0xf5c
    int xf60;                                       // 0xf60
    int xf64;                                       // 0xf64
    int xf68;                                       // 0xf68
    int xf6c;                                       // 0xf6c
    int xf70;                                       // 0xf70
    int xf74;                                       // 0xf74
    int xf78;                                       // 0xf78
    int xf7c;                                       // 0xf7c
    int xf80;                                       // 0xf80
    int xf84;                                       // 0xf84
    int xf88;                                       // 0xf88
    int xf8c;                                       // 0xf8c
    int xf90;                                       // 0xf90
    int xf94;                                       // 0xf94
    int xf98;                                       // 0xf98
    int xf9c;                                       // 0xf9c
    int xfa0;                                       // 0xfa0
    int xfa4;                                       // 0xfa4
    int xfa8;                                       // 0xfa8
    int xfac;                                       // 0xfac
    int xfb0;                                       // 0xfb0
    int xfb4;                                       // 0xfb4
    int xfb8;                                       // 0xfb8
    int xfbc;                                       // 0xfbc
    int xfc0;                                       // 0xfc0
    int xfc4;                                       // 0xfc4
    int xfc8;                                       // 0xfc8
    int xfcc;                                       // 0xfcc
    int xfd0;                                       // 0xfd0
    int xfd4;                                       // 0xfd4
    int xfd8;                                       // 0xfd8
    int xfdc;                                       // 0xfdc
    int xfe0;                                       // 0xfe0
    int xfe4;                                       // 0xfe4
    int xfe8;                                       // 0xfe8
    int xfec;                                       // 0xfec
    int xff0;                                       // 0xff0
    int xff4;                                       // 0xff4
    int xff8;                                       // 0xff8
    int xffc;                                       // 0xffc
    int x1000;                                      // 0x1000
    int x1004;                                      // 0x1004
    int x1008;                                      // 0x1008
    int x100c;                                      // 0x100c
    int x1010;                                      // 0x1010
    int x1014;                                      // 0x1014
    int x1018;                                      // 0x1018
    int x101c;                                      // 0x101c
    int x1020;                                      // 0x1020
    int x1024;                                      // 0x1024
    int x1028;                                      // 0x1028
    int x102c;                                      // 0x102c
    int x1030;                                      // 0x1030
    int x1034;                                      // 0x1034
    int x1038;                                      // 0x1038
    int x103c;                                      // 0x103c
    int x1040;                                      // 0x1040
    int x1044;                                      // 0x1044
    int x1048;                                      // 0x1048
    int x104c;                                      // 0x104c
    int x1050;                                      // 0x1050
    int x1054;                                      // 0x1054
    int x1058;                                      // 0x1058
    int x105c;                                      // 0x105c
    int x1060;                                      // 0x1060
    int center_status;                              // 0x1064
    int x1068;                                      // 0x1068
    int x106c;                                      // 0x106c
    int x1070;                                      // 0x1070
    int x1074;                                      // 0x1074
    int x1078;                                      // 0x1078
    int x107c;                                      // 0x107c
    int x1080;                                      // 0x1080
    int x1084;                                      // 0x1084
    int x1088;                                      // 0x1088
    int x108c;                                      // 0x108c
    int x1090;                                      // 0x1090
    int x1094;                                      // 0x1094
    int x1098;                                      // 0x1098
    int x109c;                                      // 0x109c
    int x10a0;                                      // 0x10a0
    int x10a4;                                      // 0x10a4
    int x10a8;                                      // 0x10a8
    int x10ac;                                      // 0x10ac
    Vec3 center_pos;                                // 0x10b0
    Vec3 center_pos_prev;                           // 0x10bc
    int x10c8;                                      // 0x10c8
    int x10cc;                                      // 0x10cc
    int x10d0;                                      // 0x10d0
    int x10d4;                                      // 0x10d4
    int x10d8;                                      // 0x10d8
    int x10dc;                                      // 0x10dc
    int x10e0;                                      // 0x10e0
    int x10e4;                                      // 0x10e4
    int x10e8;                                      // 0x10e8
    int x10ec;                                      // 0x10ec
    int x10f0;                                      // 0x10f0
    int x10f4;                                      // 0x10f4
    int x10f8;                                      // 0x10f8
    int x10fc;                                      // 0x10fc
    int x1100;                                      // 0x1100
    int x1104;                                      // 0x1104
    int x1108;                                      // 0x1108
    int x110c;                                      // 0x110c
    int x1110;                                      // 0x1110
    int x1114;                                      // 0x1114
    int x1118;                                      // 0x1118
    int x111c;                                      // 0x111c
    int x1120;                                      // 0x1120
    int x1124;                                      // 0x1124
    int x1128;                                      // 0x1128
    int x112c;                                      // 0x112c
    int x1130;                                      // 0x1130
    int x1134;                                      // 0x1134
    int x1138;                                      // 0x1138
    int x113c;                                      // 0x113c
    int x1140;                                      // 0x1140
    int x1144;                                      // 0x1144
    int x1148;                                      // 0x1148
    int x114c;                                      // 0x114c
    int x1150;                                      // 0x1150
    int x1154;                                      // 0x1154
    int x1158;                                      // 0x1158
    int x115c;                                      // 0x115c
    int x1160;                                      // 0x1160
    int x1164;                                      // 0x1164
    int x1168;                                      // 0x1168
    int x116c;                                      // 0x116c
    int x1170;                                      // 0x1170
    int x1174;                                      // 0x1174
    int x1178;                                      // 0x1178
    int x117c;                                      // 0x117c
    int x1180;                                      // 0x1180
    int x1184;                                      // 0x1184
    int x1188;                                      // 0x1188
    int x118c;                                      // 0x118c
    int x1190;                                      // 0x1190
    int x1194;                                      // 0x1194
    GOBJ *hitException;                             // 0x1198, gobj this fighter cannot hit
    char teamID;                                    // 0x119c, friendly fire related
    char grabbersID;                                //0x119D, slot ID of the person grabbing this fighter
    char hurtboxNum;                                //0x119E, number of hurtboxesz
    Hurtbox hurtbox[15];                            //0x0x11A0
    int x1614;                                      // 0x1614
    int x1618;                                      // 0x1618
    int x161c;                                      // 0x161c
    int x1620;                                      // 0x1620
    int x1624;                                      // 0x1624
    int x1628;                                      // 0x1628
    int x162c;                                      // 0x162c
    int x1630;                                      // 0x1630
    int x1634;                                      // 0x1634
    int x1638;                                      // 0x1638
    int x163c;                                      // 0x163c
    int x1640;                                      // 0x1640
    int x1644;                                      // 0x1644
    int x1648;                                      // 0x1648
    int x164c;                                      // 0x164c
    int x1650;                                      // 0x1650
    int x1654;                                      // 0x1654
    int x1658;                                      // 0x1658
    int x165c;                                      // 0x165c
    int x1660;                                      // 0x1660
    int x1664;                                      // 0x1664
    int x1668;                                      // 0x1668
    int dynamics_hit_num;                           // 0x166c
    int dynamics_hit_num_unk;                       // 0x1670
    int x1674;                                      // 0x1674
    int x1678;                                      // 0x1678
    int x167c;                                      // 0x167c
    JOBJ *dynamics_hit_joint;                       // 0x1680
    int x1684;                                      // 0x1684
    Vec3 dynamics_hit_pos;                          // 0x1688
    int x1694;                                      // 0x1694
    int x1698;                                      // 0x1698
    int x169c;                                      // 0x169c
    int x16a0;                                      // 0x16a0
    int x16a4;                                      // 0x16a4
    int x16a8;                                      // 0x16a8
    int x16ac;                                      // 0x16ac
    int x16b0;                                      // 0x16b0
    int x16b4;                                      // 0x16b4
    int x16b8;                                      // 0x16b8
    int x16bc;                                      // 0x16bc
    int x16c0;                                      // 0x16c0
    int x16c4;                                      // 0x16c4
    int x16c8;                                      // 0x16c8
    int x16cc;                                      // 0x16cc
    int x16d0;                                      // 0x16d0
    int x16d4;                                      // 0x16d4
    int x16d8;                                      // 0x16d8
    int x16dc;                                      // 0x16dc
    int x16e0;                                      // 0x16e0
    int x16e4;                                      // 0x16e4
    int x16e8;                                      // 0x16e8
    int x16ec;                                      // 0x16ec
    int x16f0;                                      // 0x16f0
    int x16f4;                                      // 0x16f4
    int x16f8;                                      // 0x16f8
    int x16fc;                                      // 0x16fc
    int x1700;                                      // 0x1700
    int x1704;                                      // 0x1704
    int x1708;                                      // 0x1708
    int x170c;                                      // 0x170c
    int x1710;                                      // 0x1710
    int x1714;                                      // 0x1714
    int x1718;                                      // 0x1718
    int x171c;                                      // 0x171c
    int x1720;                                      // 0x1720
    int x1724;                                      // 0x1724
    int x1728;                                      // 0x1728
    int x172c;                                      // 0x172c
    int x1730;                                      // 0x1730
    int x1734;                                      // 0x1734
    int x1738;                                      // 0x1738
    int x173c;                                      // 0x173c
    int x1740;                                      // 0x1740
    int x1744;                                      // 0x1744
    int x1748;                                      // 0x1748
    int x174c;                                      // 0x174c
    int x1750;                                      // 0x1750
    int x1754;                                      // 0x1754
    int x1758;                                      // 0x1758
    int x175c;                                      // 0x175c
    int x1760;                                      // 0x1760
    int x1764;                                      // 0x1764
    int x1768;                                      // 0x1768
    int x176c;                                      // 0x176c
    int x1770;                                      // 0x1770
    int x1774;                                      // 0x1774
    int x1778;                                      // 0x1778
    int x177c;                                      // 0x177c
    int x1780;                                      // 0x1780
    int x1784;                                      // 0x1784
    int x1788;                                      // 0x1788
    int x178c;                                      // 0x178c
    int x1790;                                      // 0x1790
    int x1794;                                      // 0x1794
    int x1798;                                      // 0x1798
    int x179c;                                      // 0x179c
    int x17a0;                                      // 0x17a0
    int x17a4;                                      // 0x17a4
    int x17a8;                                      // 0x17a8
    int x17ac;                                      // 0x17ac
    int x17b0;                                      // 0x17b0
    int x17b4;                                      // 0x17b4
    int x17b8;                                      // 0x17b8
    int x17bc;                                      // 0x17bc
    int x17c0;                                      // 0x17c0
    int x17c4;                                      // 0x17c4
    int x17c8;                                      // 0x17c8
    int x17cc;                                      // 0x17cc
    int x17d0;                                      // 0x17d0
    int x17d4;                                      // 0x17d4
    int x17d8;                                      // 0x17d8
    int x17dc;                                      // 0x17dc
    int x17e0;                                      // 0x17e0
    int x17e4;                                      // 0x17e4
    int x17e8;                                      // 0x17e8
    int x17ec;                                      // 0x17ec
    int x17f0;                                      // 0x17f0
    int x17f4;                                      // 0x17f4
    int x17f8;                                      // 0x17f8
    int x17fc;                                      // 0x17fc
    int x1800;                                      // 0x1800
    int x1804;                                      // 0x1804
    int x1808;                                      // 0x1808
    int x180c;                                      // 0x180c
    int x1810;                                      // 0x1810
    int x1814;                                      // 0x1814
    int x1818;                                      // 0x1818
    int x181c;                                      // 0x181c
    int x1820;                                      // 0x1820
    int x1824;                                      // 0x1824
    int x1828;                                      // 0x1828
    int damage_Behavior;                            // 0x182c
    float damage_Percent;                           // 0x1830
    int x1834;                                      // 0x1834
    float damage_PercentTemp;                       // 0x1838
    float damage_DamageApplied;                     // 0x183c
    int x1840;                                      // 0x1840
    float damage_Direction;                         // 0x1844
    int damage_KBAngle;                             // 0x1848
    int damage_DamagedHurtbox;                      // 0x184c
    float damage_ForceApplied;                      // 0x1850
    float damage_CollisionX;                        // 0x1854
    float damage_CollisionY;                        // 0x1858
    float damage_CollisionZ;                        // 0x185c
    int damage_Dealt;                               // 0x1860
    int x1864;                                      // 0x1864
    GOBJ *damage_SourceGOBJ;                        // 0x1868
    int x186c;                                      // 0x186c
    int x1870;                                      // 0x1870
    int x1874;                                      // 0x1874
    int x1878;                                      // 0x1878
    int x187c;                                      // 0x187c
    int x1880;                                      // 0x1880
    int x1884;                                      // 0x1884
    int x1888;                                      // 0x1888
    int x188c;                                      // 0x188c
    int x1890;                                      // 0x1890
    int x1894;                                      // 0x1894
    int x1898;                                      // 0x1898
    int x189c;                                      // 0x189c
    int x18a0;                                      // 0x18a0
    float damage_KBMagnitude;                       // 0x18a4
    int x18a8;                                      // 0x18a8
    int damage_FramesSinceHit;                      // 0x18ac
    int x18b0;                                      // 0x18b0
    float damage_Armor;                             // 0x18b4
    int x18b8;                                      // 0x18b8
    int x18bc;                                      // 0x18bc
    int x18c0;                                      // 0x18c0
    int damage_SourceFighterID;                     // 0x18c4
    int x18c8;                                      // 0x18c8
    int x18cc;                                      // 0x18cc
    int x18d0;                                      // 0x18d0
    int x18d4;                                      // 0x18d4
    int x18d8;                                      // 0x18d8
    int x18dc;                                      // 0x18dc
    int x18e0;                                      // 0x18e0
    int x18e4;                                      // 0x18e4
    int x18e8;                                      // 0x18e8
    u16 damage_instancehitby;                       // 0x18ec. Last Move Instance This Player Was Hit by
    int x18f0;                                      // 0x18f0
    int x18f4;                                      // 0x18f4
    u8 x18f8;                                       // 0x18f8
    u8 x18f9;                                       // 0x18f8
    u16 model_shift_frames;                         // 0x18f8
    int x18fc;                                      // 0x18fc
    int x1900;                                      // 0x1900
    int x1904;                                      // 0x1904
    int x1908;                                      // 0x1908
    int x190c;                                      // 0x190c
    int x1910;                                      // 0x1910
    int x1914;                                      // 0x1914
    int x1918;                                      // 0x1918
    int x191c;                                      // 0x191c
    int x1920;                                      // 0x1920
    int x1924;                                      // 0x1924
    int x1928;                                      // 0x1928
    int x192c;                                      // 0x192c
    int x1930;                                      // 0x1930
    int x1934;                                      // 0x1934
    int x1938;                                      // 0x1938
    int x193c;                                      // 0x193c
    int x1940;                                      // 0x1940
    int x1944;                                      // 0x1944
    int x1948;                                      // 0x1948
    int x194c;                                      // 0x194c
    int x1950;                                      // 0x1950
    int x1954;                                      // 0x1954
    int x1958;                                      // 0x1958
    float hitlag_frames;                            // 0x195c
    int x1960;                                      // 0x1960
    int x1964;                                      // 0x1964
    char jumps_used;                                // 0x1968
    char walljumps_used;                            // 0x1969
    int x196c;                                      // 0x196c
    int x1970;                                      // 0x1970
    GOBJ *heldItem;                                 // 0x1974
    GOBJ *x1978;                                    // 0x1978
    int x197c;                                      // 0x197c
    GOBJ *headItem;                                 // 0x1980
    GOBJ *heldItemSpecial;                          // 0x1984
    int bodystate_script;                           // 0x1988
    int bodystate_game;                             // 0x198c
    int ledge_intang_left;                          // 0x1990
    int respawn_intang_left;                        // 0x1994
    float shield_health;                            // 0x1998
    int x199c;                                      // 0x199c
    int x19a0;                                      // 0x19a0
    int x19a4;                                      // 0x19a4
    int x19a8;                                      // 0x19a8
    int x19ac;                                      // 0x19ac
    int x19b0;                                      // 0x19b0
    int x19b4;                                      // 0x19b4
    int x19b8;                                      // 0x19b8
    int x19bc;                                      // 0x19bc
    int x19c0;                                      // 0x19c0
    int x19c4;                                      // 0x19c4
    int x19c8;                                      // 0x19c8
    int x19cc;                                      // 0x19cc
    int x19d0;                                      // 0x19d0
    int x19d4;                                      // 0x19d4
    int x19d8;                                      // 0x19d8
    int x19dc;                                      // 0x19dc
    int x19e0;                                      // 0x19e0
    int x19e4;                                      // 0x19e4
    int x19e8;                                      // 0x19e8
    int x19ec;                                      // 0x19ec
    int x19f0;                                      // 0x19f0
    int x19f4;                                      // 0x19f4
    int x19f8;                                      // 0x19f8
    int x19fc;                                      // 0x19fc
    int x1a00;                                      // 0x1a00
    int x1a04;                                      // 0x1a04
    int x1a08;                                      // 0x1a08
    int x1a0c;                                      // 0x1a0c
    int x1a10;                                      // 0x1a10
    int x1a14;                                      // 0x1a14
    int x1a18;                                      // 0x1a18
    int x1a1c;                                      // 0x1a1c
    int x1a20;                                      // 0x1a20
    int x1a24;                                      // 0x1a24
    int x1a28;                                      // 0x1a28
    float reflect_hitDirection;                     // 0x1a2c
    int x1a30;                                      // 0x1a30
    int x1a34;                                      // 0x1a34
    int x1a38;                                      // 0x1a38
    int x1a3c;                                      // 0x1a3c
    int x1a40;                                      // 0x1a40
    int x1a44;                                      // 0x1a44
    int x1a48;                                      // 0x1a48
    float grab_timer;                               // 0x1a4c
    int x1a50;                                      // 0x1a50
    int x1a54;                                      // 0x1a54
    GOBJ *grab_attacker;                            // 0x1a58
    GOBJ *grab_victim;                              // 0x1a5c
    int x1a60;                                      // 0x1a60
    int x1a64;                                      // 0x1a64
    int x1a68;                                      // 0x1a68
    int x1a6c;                                      // 0x1a6c
    int x1a70;                                      // 0x1a70
    int x1a74;                                      // 0x1a74
    int x1a78;                                      // 0x1a78
    int x1a7c;                                      // 0x1a7c
    int x1a80;                                      // 0x1a80
    int x1a84;                                      // 0x1a84
    CPU cpu;                                        // 0x1a88
    int x1fe0;                                      // 0x1fe0
    int x1fe4;                                      // 0x1fe4
    int x1fe8;                                      // 0x1fe8
    int x1fec;                                      // 0x1fec
    int x1ff0;                                      // 0x1ff0
    int x1ff4;                                      // 0x1ff4
    int x1ff8;                                      // 0x1ff8
    int x1ffc;                                      // 0x1ffc
    int x2000;                                      // 0x2000
    int x2004;                                      // 0x2004
    int x2008;                                      // 0x2008
    int x200c;                                      // 0x200c
    int x2010;                                      // 0x2010
    int x2014;                                      // 0x2014
    int x2018;                                      // 0x2018
    int x201c;                                      // 0x201c
    int x2020;                                      // 0x2020
    int x2024;                                      // 0x2024
    int x2028;                                      // 0x2028
    int x202c;                                      // 0x202c
    int x2030;                                      // 0x2030
    int x2034;                                      // 0x2034
    int x2038;                                      // 0x2038
    int x203c;                                      // 0x203c
    int x2040;                                      // 0x2040
    int x2044;                                      // 0x2044
    int x2048;                                      // 0x2048
    int x204c;                                      // 0x204c
    int x2050;                                      // 0x2050
    int x2054;                                      // 0x2054
    int x2058;                                      // 0x2058
    int x205c;                                      // 0x205c
    int x2060;                                      // 0x2060
    int ledge_cooldown;                             // 0x2064
    int x2068;                                      // 0x2068
    int x206c;                                      // 0x206c
    int x2070;                                      // 0x2070
    int x2074;                                      // 0x2074
    int x2078;                                      // 0x2078
    int x207c;                                      // 0x207c
    int x2080;                                      // 0x2080
    int x2084;                                      // 0x2084
    u16 moveID;                                     // 0x2088
    int x208c;                                      // 0x208c
    int x2090;                                      // 0x2090
    int x2094;                                      // 0x2094
    int x2098;                                      // 0x2098
    int x209c;                                      // 0x209c
    JOBJ *accessory;                                // 0x20a0
    int x20a4;                                      // 0x20a4
    int *shadow;                                    // 0x20a8
    int x20ac;                                      // 0x20ac
    int x20b0;                                      // 0x20b0
    int x20b4;                                      // 0x20b4
    int x20b8;                                      // 0x20b8
    int x20bc;                                      // 0x20bc
    int x20c0;                                      // 0x20c0
    int x20c4;                                      // 0x20c4
    int x20c8;                                      // 0x20c8
    int x20cc;                                      // 0x20cc
    int x20d0;                                      // 0x20d0
    int x20d4;                                      // 0x20d4
    int x20d8;                                      // 0x20d8
    int x20dc;                                      // 0x20dc
    int x20e0;                                      // 0x20e0
    int x20e4;                                      // 0x20e4
    int x20e8;                                      // 0x20e8
    int x20ec;                                      // 0x20ec
    int x20f0;                                      // 0x20f0
    int x20f4;                                      // 0x20f4
    int x20f8;                                      // 0x20f8
    int x20fc;                                      // 0x20fc
    int x2100;                                      // 0x2100
    int x2104;                                      // 0x2104
    int x2108;                                      // 0x2108
    int x210c;                                      // 0x210c
    int x2110;                                      // 0x2110
    int x2114;                                      // 0x2114
    int x2118;                                      // 0x2118
    int x211c;                                      // 0x211c
    int x2120;                                      // 0x2120
    int x2124;                                      // 0x2124
    int x2128;                                      // 0x2128
    int x212c;                                      // 0x212c
    int x2130;                                      // 0x2130
    int x2134;                                      // 0x2134
    int x2138;                                      // 0x2138
    int x213c;                                      // 0x213c
    int x2140;                                      // 0x2140
    int x2144;                                      // 0x2144
    int x2148;                                      // 0x2148
    int x214c;                                      // 0x214c
    int x2150;                                      // 0x2150
    int x2154;                                      // 0x2154
    int x2158;                                      // 0x2158
    int x215c;                                      // 0x215c
    int x2160;                                      // 0x2160
    int x2164;                                      // 0x2164
    int x2168;                                      // 0x2168
    int x216c;                                      // 0x216c
    int x2170;                                      // 0x2170
    int x2174;                                      // 0x2174
    int x2178;                                      // 0x2178
    int x217c;                                      // 0x217c
    int x2180;                                      // 0x2180
    int x2184;                                      // 0x2184
    int x2188;                                      // 0x2188
    int x218c;                                      // 0x218c
    void (*cb_OnGrabFighter_Self)(GOBJ *fighter);   // 0x2190
    void (*x2194)(GOBJ *fighter);                   // 0x2194
    void (*cb_OnGrabFighter_Victim)(GOBJ *fighter); // 0x2198
    void (*cb_IASA)(GOBJ *fighter);                 // 0x219C
    void (*cb_Anim)(GOBJ *fighter);                 // 0x21A0
    void (*cb_Phys)(GOBJ *fighter);                 // 0x21a4
    void (*cb_Coll)(GOBJ *fighter);                 // 0x21a8
    void (*cb_Cam)(GOBJ *fighter);                  // 0x21ac
    void (*cb_Accessory1)(GOBJ *fighter);           // 0x21b0
    void (*cb_Accessory2)(GOBJ *fighter);           // 0x21b4
    void (*cb_Accessory3)(GOBJ *fighter);           // 0x21b8
    void (*cb_Accessory4)(GOBJ *fighter);           // 0x21bc
    void (*cb_OnGiveDamage)(GOBJ *fighter);         // 0x21c0
    void (*cb_OnShieldHit)(GOBJ *fighter);          // 0x21c4
    void (*cb_OnReflectHit)(GOBJ *fighter);         // 0x21c8
    void (*x21cc)(GOBJ *fighter);                   // 0x21cc
    void (*cb_EveryHitlag)(GOBJ *fighter);          // 0x21d0
    void (*cb_EnterHitlag)(GOBJ *fighter);          // 0x21d4
    void (*cb_ExitHitlag)(GOBJ *fighter);           // 0x21d8
    void (*cb_OnTakeDamage)(GOBJ *fighter);         // 0x21dc
    void (*cb_OnDeath)(GOBJ *fighter);              // 0x21e0
    void (*cb_OnDeath2)(GOBJ *fighter);             // 0x21e4
    void (*cb_OnDeath3)(GOBJ *fighter);             // 0x21e8
    void (*cb_OnActionStateChange)(GOBJ *fighter);  // 0x21ec
    void (*cb_OnTakeDamage2)(GOBJ *fighter);        // 0x21f0
    void (*cb_OnHurtboxDetect)(GOBJ *fighter);      // 0x21f4
    void (*cb_OnSpin)(GOBJ *fighter);               // 0x21f8
    unsigned char x21fc_1 : 1;                      // 0x80 - x21fc_
    unsigned char show_center_sphere : 1;           // 0x40 - x21fc_
    unsigned char show_item_pickup : 1;             // 0x20 - x21fc_
    unsigned char show_cpu_ai : 1;                  // 0x10 - x21fc_
    unsigned char show_footstool : 1;               // 0x8 - x21fc_
    unsigned char show_dynamics : 1;                // 0x4 - x21fc_
    unsigned char show_hit : 1;                     // 0x2 - x21fc_
    unsigned char show_model : 1;                   // 0x1 - x21fc_
    int subactionFlag0;                             // 0x2200
    int subactionFlag1;                             // 0x2204
    int subactionFlag2;                             // 0x2208
    int subactionFlag3;                             // 0x220C
    int subactionFlag4;                             // 0x2210
    int x2214;                                      // 0x2214
    char flags_iasa;                                // 0x2218
    unsigned char shield : 1;                       // is shielding bool. 0x80 - 0x2219
    unsigned char x2219_2 : 1;                      // 0x40 - 0x2219
    unsigned char x2219_3 : 1;                      // 0x20 - 0x2219
    unsigned char x2219_4 : 1;                      // 0x10 - 0x2219
    unsigned char x2219_5 : 1;                      // 0x8 - 0x2219
    unsigned char x2219_6 : 1;                      // 0x4 - 0x2219
    unsigned char x2219_7 : 1;                      // 0x2 - 0x2219
    unsigned char x2219_8 : 1;                      // 0x1 - 0x2219
    unsigned char x221a_1 : 1;                      // 0x80 - 0x221a
    unsigned char x221a_2 : 1;                      // 0x40 - 0x221a
    unsigned char hitlag : 1;                       // 0x20 - 0x221a
    unsigned char x221a_4 : 1;                      // 0x10 - 0x221a
    unsigned char fastfall : 1;                     // 0x8 - 0x221a
    unsigned char no_hurt_script : 1;               // 0x4 - 0x221a
    unsigned char x221a_7 : 1;                      // 0x2 - 0x221a
    unsigned char gfx_persist : 1;                  // 0x1 - 0x221a
    unsigned char x221b_1 : 1;                      // 0x80 - 0x221b
    unsigned char x221b_2 : 1;                      // 0x40 - 0x221b
    unsigned char x221b_3 : 1;                      // 0x20 - 0x221b
    unsigned char x221b_4 : 1;                      // 0x10 - 0x221b
    unsigned char x221b_5 : 1;                      //  0x8 - 0x221b
    unsigned char x221b_6 : 1;                      // 0x4 - 0x221b
    unsigned char x221b_7 : 1;                      // 0x2 - 0x221b
    unsigned char x221b_8 : 1;                      // 0x1 - 0x221b
    unsigned char x221c_1 : 1;                      // 0x80 - 0x221c
    unsigned char x221c_2 : 1;                      // 0x40 - 0x221c
    unsigned char x221c_3 : 1;                      // 0x20 - 0x221c
    unsigned char x221c_4 : 1;                      // 0x10 - 0x221c
    unsigned char x221c_5 : 1;                      // 0x8 - 0x221c
    unsigned char x221c_6 : 1;                      // 0x4 - 0x221c
    unsigned char hitstun : 1;                      // 0x2 - 0x221c
    unsigned char x221c_8 : 1;                      // 0x1 = 0x221c
    unsigned char x221d_1 : 1;                      // 0x80 - 0x221d
    unsigned char x221d_2 : 1;                      // 0x40 - 0x221d
    unsigned char x221d_3 : 1;                      // 0x20 - 0x221d
    unsigned char x221d_4 : 1;                      // 0x10 - 0x221d
    unsigned char inputs_disable : 1;               // 0x8 - 0x221d
    unsigned char nudge_disable : 1;                // 0x4 - 0x221d
    unsigned char ground_ignore : 1;                // 0x2 - 0x221d
    unsigned char x221d_8 : 1;                      // 0x1 - 0x221d
    unsigned char x221e_1 : 1;                      // 0x80 - 0x221e
    unsigned char x221e_2 : 1;                      // 0x40 - 0x221e
    unsigned char x221e_3 : 1;                      // 0x20 - 0x221e
    unsigned char x221e_4 : 1;                      // 0x10 - 0x221e
    unsigned char x221e_5 : 1;                      // 0x8 - 0x221e
    unsigned char x221e_6 : 1;                      // 0x4 - 0x221e
    unsigned char x221e_7 : 1;                      // 0x2 - 0x221e
    unsigned char visible : 1;                      // 0x1 - 0x221e
    unsigned char mag_glass : 1;                    // 0x80 - 0x221f
    unsigned char dead : 1;                         // 0x40 - 0x221f
    unsigned char x221f_3 : 1;                      // 0x20 - 0x221f
    unsigned char sleep : 1;                        // 0x10
    unsigned char ms : 1;                           // ms = master/slave. is 1 when the player is a slave
    unsigned char x221f_6 : 1;
    unsigned char x221f_7 : 1;
    unsigned char x221f_8 : 1;
    char flags_2220;                      // 0x2220
    char flags_2221;                      // 0x2221
    char flags_2222;                      // 0x2222
    char flags_2223;                      // 0x2223
    char flags_2224;                      // 0x2224
    char flags_2225;                      // 0x2225
    char flags_2226;                      // 0x2226
    char flags_2227;                      // 0x2227
    char flags_2228;                      // 0x2228
    unsigned char x2229_1 : 1;            // 0x80 - 0x2229
    unsigned char x2229_2 : 1;            // 0x40 - 0x2229
    unsigned char x2229_3 : 1;            // 0x20 - 0x2229
    unsigned char x2229_4 : 1;            // 0x10 - 0x2229
    unsigned char x2229_5 : 1;            // 0x8 - 0x2229
    unsigned char x2229_6 : 1;            // 0x4 - 0x2229
    unsigned char x2229_7 : 1;            // 0x2 - 0x2229
    unsigned char no_reaction_always : 1; // 0x1 - 0x2229
    char flags_222A;                      // 0x222A
    char flags_222B;                      // 0x222B
    int charVar1;                         // 0x222c
    int charVar2;                         // 0x2230
    int charVar3;                         // 0x2234
    int charVar4;                         // 0x2238
    int charVar5;                         // 0x223c
    int charVar6;                         // 0x2240
    int charVar7;                         // 0x2244
    int charVar8;                         // 0x2248
    int charVar9;                         // 0x224c
    int charVar10;                        // 0x2250
    int charVar11;                        // 0x2254
    int charVar12;                        // 0x2258
    int charVar13;                        // 0x225c
    int charVar14;                        // 0x2260
    int charVar15;                        // 0x2264
    int charVar16;                        // 0x2268
    int charVar17;                        // 0x226c
    int charVar18;                        // 0x2270
    int charVar19;                        // 0x2274
    int charVar20;                        // 0x2278
    int charVar21;                        // 0x227c
    int charVar22;                        // 0x2280
    int charVar23;                        // 0x2284
    int charVar24;                        // 0x2288
    int charVar25;                        // 0x228c
    int charVar26;                        // 0x2290
    int charVar27;                        // 0x2294
    int charVar28;                        // 0x2298
    int charVar29;                        // 0x229c
    int charVar30;                        // 0x22a0
    int charVar31;                        // 0x22a4
    int charVar32;                        // 0x22a8
    int charVar33;                        // 0x22ac
    int charVar34;                        // 0x22b0
    int charVar35;                        // 0x22b4
    int charVar36;                        // 0x22b8
    int charVar37;                        // 0x22bc
    int charVar38;                        // 0x22c0
    int charVar39;                        // 0x22c4
    int charVar40;                        // 0x22c8
    int charVar41;                        // 0x22cc
    int charVar42;                        // 0x22d0
    int charVar43;                        // 0x22d4
    int charVar44;                        // 0x22d8
    int charVar45;                        // 0x22dc
    int charVar46;                        // 0x22e0
    int charVar47;                        // 0x22e4
    int charVar48;                        // 0x22e8
    int charVar49;                        // 0x22ec
    int charVar50;                        // 0x22f0
    int charVar51;                        // 0x22f4
    int charVar52;                        // 0x22f8
    int x22fc;                            // 0x22fc
    int x2300;                            // 0x2300
    int x2304;                            // 0x2304
    int x2308;                            // 0x2308
    int x230c;                            // 0x230c
    int x2310;                            // 0x2310
    int x2314;                            // 0x2314
    int x2318;                            // 0x2318
    int x231c;                            // 0x231c
    int x2320;                            // 0x2320
    int x2324;                            // 0x2324
    int x2328;                            // 0x2328
    int x232c;                            // 0x232c
    int x2330;                            // 0x2330
    int x2334;                            // 0x2334
    int x2338;                            // 0x2338
    int x233c;                            // 0x233c
    int stateVar1;                        // 0x2340
    int stateVar2;                        // 0x2344
    int stateVar3;                        // 0x2348
    int stateVar4;                        // 0x234c
    int stateVar5;                        // 0x2350
    int stateVar6;                        // 0x2354
    int stateVar7;                        // 0x2358
    int stateVar8;                        // 0x235c
    int stateVar9;                        // 0x2360
    int stateVar10;                       // 0x2364
    int stateVar11;                       // 0x2368
    int stateVar12;                       // 0x236c
    int stateVar13;                       // 0x2370
    int stateVar14;                       // 0x2374
    int stateVar15;                       // 0x2378
    int stateVar16;                       // 0x237c
    int stateVar17;                       // 0x2380
    int stateVar18;                       // 0x2384
    int x2388;                            // 0x2388
    int x238c;                            // 0x238c
    int x2390;                            // 0x2390
    int x2394;                            // 0x2394
    int x2398;                            // 0x2398
    int x239c;                            // 0x239c
    int x23a0;                            // 0x23a0
    int x23a4;                            // 0x23a4
    int x23a8;                            // 0x23a8
    int x23ac;                            // 0x23ac
    int x23b0;                            // 0x23b0
    int x23b4;                            // 0x23b4
    int x23b8;                            // 0x23b8
    int x23bc;                            // 0x23bc
    int x23c0;                            // 0x23c0
    int x23c4;                            // 0x23c4
    int x23c8;                            // 0x23c8
    int x23cc;                            // 0x23cc
    int x23d0;                            // 0x23d0
    int x23d4;                            // 0x23d4
    int x23d8;                            // 0x23d8
    int x23dc;                            // 0x23dc
    int x23e0;                            // 0x23e0
    int x23e4;                            // 0x23e4
    int x23e8;                            // 0x23e8
    int x23ec;                            // 0x23ec
    int x23f0;                            // 0x23f0
    int x23f4;                            // 0x23f4
    int x23f8;                            // 0x23f8
    int x23fc;                            // 0x23fc
};
struct ItemData
{
    GOBJ *item;                     // 0x0
    int x4;                         // 0x4
    int x8;                         // 0x8
    int spawnType;                  // 0xC
    int itemID;                     // 0x10
    int x14;                        // 0x14
    int x18;                        // 0x18
    int x1c;                        // 0x1c
    int x20;                        // 0x20
    int stateID;                    // 0x24
    int x28;                        // 0x28
    float facing_direction;         // 0x2c
    int x30;                        // 0x30
    float spinUnk;                  // 0x34
    float scale;                    // 0x38
    int x3c;                        // 0x3c
    Vec3 selfVel;                   // 0x40
    Vec3 pos;                       // 0x4C
    Vec3 unkVel;                    // 0x58-0x64
    int x64;                        // 0x64
    int x68;                        // 0x68
    int x6c;                        // 0x6c
    Vec3 nudgeVel;                  // 0x70 - 0x7C
    int x7c;                        // 0x7c
    int x80;                        // 0x80
    int x84;                        // 0x84
    int x88;                        // 0x88
    int x8c;                        // 0x8c
    int x90;                        // 0x90
    int x94;                        // 0x94
    int x98;                        // 0x98
    int x9c;                        // 0x9c
    int xa0;                        // 0xa0
    int xa4;                        // 0xa4
    int xa8;                        // 0xa8
    int xac;                        // 0xac
    int xb0;                        // 0xb0
    int xb4;                        // 0xb4
    int xb8;                        // 0xb8
    ItemState *itemStates;          // 0xbc
    int isRotate;                   // 0xc0
    itData *itData;                 // 0xc4
    JOBJ *joint;                    // 0xc8
    itCommonAttr *itemAttributes;   // 0xcc
    int xd0;                        // 0xd0
    int xd4;                        // 0xd4
    int xd8;                        // 0xd8
    int xdc;                        // 0xdc
    int xe0;                        // 0xe0
    int xe4;                        // 0xe4
    int xe8;                        // 0xe8
    int xec;                        // 0xec
    int xf0;                        // 0xf0
    int xf4;                        // 0xf4
    int xf8;                        // 0xf8
    int xfc;                        // 0xfc
    int x100;                       // 0x100
    int x104;                       // 0x104
    int x108;                       // 0x108
    int x10c;                       // 0x10c
    int x110;                       // 0x110
    int x114;                       // 0x114
    int x118;                       // 0x118
    int x11c;                       // 0x11c
    int x120;                       // 0x120
    int x124;                       // 0x124
    int x128;                       // 0x128
    int x12c;                       // 0x12c
    int x130;                       // 0x130
    int x134;                       // 0x134
    int x138;                       // 0x138
    int x13c;                       // 0x13c
    int x140;                       // 0x140
    int x144;                       // 0x144
    int x148;                       // 0x148
    int x14c;                       // 0x14c
    int x150;                       // 0x150
    int x154;                       // 0x154
    int x158;                       // 0x158
    int x15c;                       // 0x15c
    int x160;                       // 0x160
    int x164;                       // 0x164
    int x168;                       // 0x168
    int x16c;                       // 0x16c
    int x170;                       // 0x170
    int x174;                       // 0x174
    int x178;                       // 0x178
    int x17c;                       // 0x17c
    int x180;                       // 0x180
    int x184;                       // 0x184
    int x188;                       // 0x188
    int x18c;                       // 0x18c
    int x190;                       // 0x190
    int x194;                       // 0x194
    int x198;                       // 0x198
    int x19c;                       // 0x19c
    int x1a0;                       // 0x1a0
    int x1a4;                       // 0x1a4
    int x1a8;                       // 0x1a8
    int x1ac;                       // 0x1ac
    int x1b0;                       // 0x1b0
    int x1b4;                       // 0x1b4
    int x1b8;                       // 0x1b8
    int x1bc;                       // 0x1bc
    int x1c0;                       // 0x1c0
    int x1c4;                       // 0x1c4
    int x1c8;                       // 0x1c8
    int x1cc;                       // 0x1cc
    int x1d0;                       // 0x1d0
    int x1d4;                       // 0x1d4
    int x1d8;                       // 0x1d8
    int x1dc;                       // 0x1dc
    int x1e0;                       // 0x1e0
    int x1e4;                       // 0x1e4
    int x1e8;                       // 0x1e8
    int x1ec;                       // 0x1ec
    int x1f0;                       // 0x1f0
    int x1f4;                       // 0x1f4
    int x1f8;                       // 0x1f8
    int x1fc;                       // 0x1fc
    int x200;                       // 0x200
    int x204;                       // 0x204
    int x208;                       // 0x208
    int x20c;                       // 0x20c
    int x210;                       // 0x210
    int x214;                       // 0x214
    int x218;                       // 0x218
    int x21c;                       // 0x21c
    int x220;                       // 0x220
    int x224;                       // 0x224
    int x228;                       // 0x228
    int x22c;                       // 0x22c
    int x230;                       // 0x230
    int x234;                       // 0x234
    int x238;                       // 0x238
    int x23c;                       // 0x23c
    int x240;                       // 0x240
    int x244;                       // 0x244
    int x248;                       // 0x248
    int x24c;                       // 0x24c
    int x250;                       // 0x250
    int x254;                       // 0x254
    int x258;                       // 0x258
    int x25c;                       // 0x25c
    int x260;                       // 0x260
    int x264;                       // 0x264
    int x268;                       // 0x268
    int x26c;                       // 0x26c
    int x270;                       // 0x270
    int x274;                       // 0x274
    int x278;                       // 0x278
    int x27c;                       // 0x27c
    int x280;                       // 0x280
    int x284;                       // 0x284
    int x288;                       // 0x288
    int x28c;                       // 0x28c
    int x290;                       // 0x290
    int x294;                       // 0x294
    int x298;                       // 0x298
    int x29c;                       // 0x29c
    int x2a0;                       // 0x2a0
    int x2a4;                       // 0x2a4
    int x2a8;                       // 0x2a8
    int x2ac;                       // 0x2ac
    int x2b0;                       // 0x2b0
    int x2b4;                       // 0x2b4
    int x2b8;                       // 0x2b8
    int x2bc;                       // 0x2bc
    int x2c0;                       // 0x2c0
    int x2c4;                       // 0x2c4
    int x2c8;                       // 0x2c8
    int x2cc;                       // 0x2cc
    int x2d0;                       // 0x2d0
    int x2d4;                       // 0x2d4
    int x2d8;                       // 0x2d8
    int x2dc;                       // 0x2dc
    int x2e0;                       // 0x2e0
    int x2e4;                       // 0x2e4
    int x2e8;                       // 0x2e8
    int x2ec;                       // 0x2ec
    int x2f0;                       // 0x2f0
    int x2f4;                       // 0x2f4
    int x2f8;                       // 0x2f8
    int x2fc;                       // 0x2fc
    int x300;                       // 0x300
    int x304;                       // 0x304
    int x308;                       // 0x308
    int x30c;                       // 0x30c
    int x310;                       // 0x310
    int x314;                       // 0x314
    int x318;                       // 0x318
    int x31c;                       // 0x31c
    int x320;                       // 0x320
    int x324;                       // 0x324
    int x328;                       // 0x328
    int x32c;                       // 0x32c
    int x330;                       // 0x330
    int x334;                       // 0x334
    int x338;                       // 0x338
    int x33c;                       // 0x33c
    int x340;                       // 0x340
    int x344;                       // 0x344
    int x348;                       // 0x348
    int x34c;                       // 0x34c
    int x350;                       // 0x350
    int x354;                       // 0x354
    int x358;                       // 0x358
    int x35c;                       // 0x35c
    int x360;                       // 0x360
    int x364;                       // 0x364
    int x368;                       // 0x368
    int x36c;                       // 0x36c
    int x370;                       // 0x370
    int x374;                       // 0x374
    CollData collData;              // 0x378 -> 0x518
    FighterData *fighter;           // 0x518
    int x51c;                       // 0x51c
    CameraBox *camerabox;           // 0x520
    int x524;                       // 0x524
    int x528;                       // 0x528
    int x52c;                       // 0x52c
    int x530;                       // 0x530
    int x534;                       // 0x534
    int x538;                       // 0x538
    int x53c;                       // 0x53c
    int x540;                       // 0x540
    int x544;                       // 0x544
    ColorOverlay color;             // 0x548
    int x5c8;                       // 0x5c8
    int x5cc;                       // 0x5cc
    int x5d0;                       // 0x5d0
    int x5d4;                       // 0x5d4
    int x5d8;                       // 0x5d8
    int x5dc;                       // 0x5dc
    int x5e0;                       // 0x5e0
    int x5e4;                       // 0x5e4
    int x5e8;                       // 0x5e8
    int x5ec;                       // 0x5ec
    int x5f0;                       // 0x5f0
    int x5f4;                       // 0x5f4
    int x5f8;                       // 0x5f8
    int x5fc;                       // 0x5fc
    int x600;                       // 0x600
    int x604;                       // 0x604
    int x608;                       // 0x608
    int x60c;                       // 0x60c
    int x610;                       // 0x610
    int x614;                       // 0x614
    int x618;                       // 0x618
    int x61c;                       // 0x61c
    int x620;                       // 0x620
    int x624;                       // 0x624
    int x628;                       // 0x628
    int x62c;                       // 0x62c
    int x630;                       // 0x630
    int x634;                       // 0x634
    int x638;                       // 0x638
    int x63c;                       // 0x63c
    int x640;                       // 0x640
    int x644;                       // 0x644
    int x648;                       // 0x648
    int x64c;                       // 0x64c
    int x650;                       // 0x650
    int x654;                       // 0x654
    int x658;                       // 0x658
    int x65c;                       // 0x65c
    int x660;                       // 0x660
    int x664;                       // 0x664
    int x668;                       // 0x668
    int x66c;                       // 0x66c
    int x670;                       // 0x670
    int x674;                       // 0x674
    int x678;                       // 0x678
    int x67c;                       // 0x67c
    int x680;                       // 0x680
    int x684;                       // 0x684
    int x688;                       // 0x688
    int x68c;                       // 0x68c
    int x690;                       // 0x690
    int x694;                       // 0x694
    int x698;                       // 0x698
    int x69c;                       // 0x69c
    int x6a0;                       // 0x6a0
    int x6a4;                       // 0x6a4
    int x6a8;                       // 0x6a8
    int x6ac;                       // 0x6ac
    int x6b0;                       // 0x6b0
    int x6b4;                       // 0x6b4
    int x6b8;                       // 0x6b8
    int x6bc;                       // 0x6bc
    int x6c0;                       // 0x6c0
    int x6c4;                       // 0x6c4
    int x6c8;                       // 0x6c8
    int x6cc;                       // 0x6cc
    int x6d0;                       // 0x6d0
    int x6d4;                       // 0x6d4
    int x6d8;                       // 0x6d8
    int x6dc;                       // 0x6dc
    int x6e0;                       // 0x6e0
    int x6e4;                       // 0x6e4
    int x6e8;                       // 0x6e8
    int x6ec;                       // 0x6ec
    int x6f0;                       // 0x6f0
    int x6f4;                       // 0x6f4
    int x6f8;                       // 0x6f8
    int x6fc;                       // 0x6fc
    int x700;                       // 0x700
    int x704;                       // 0x704
    int x708;                       // 0x708
    int x70c;                       // 0x70c
    int x710;                       // 0x710
    int x714;                       // 0x714
    int x718;                       // 0x718
    int x71c;                       // 0x71c
    int x720;                       // 0x720
    int x724;                       // 0x724
    int x728;                       // 0x728
    int x72c;                       // 0x72c
    int x730;                       // 0x730
    int x734;                       // 0x734
    int x738;                       // 0x738
    int x73c;                       // 0x73c
    int x740;                       // 0x740
    int x744;                       // 0x744
    int x748;                       // 0x748
    int x74c;                       // 0x74c
    int x750;                       // 0x750
    int x754;                       // 0x754
    int x758;                       // 0x758
    int x75c;                       // 0x75c
    int x760;                       // 0x760
    int x764;                       // 0x764
    int x768;                       // 0x768
    int x76c;                       // 0x76c
    int x770;                       // 0x770
    int x774;                       // 0x774
    int x778;                       // 0x778
    int x77c;                       // 0x77c
    int x780;                       // 0x780
    int x784;                       // 0x784
    int x788;                       // 0x788
    int x78c;                       // 0x78c
    int x790;                       // 0x790
    int x794;                       // 0x794
    int x798;                       // 0x798
    int x79c;                       // 0x79c
    int x7a0;                       // 0x7a0
    int x7a4;                       // 0x7a4
    int x7a8;                       // 0x7a8
    int x7ac;                       // 0x7ac
    int x7b0;                       // 0x7b0
    int x7b4;                       // 0x7b4
    int x7b8;                       // 0x7b8
    int x7bc;                       // 0x7bc
    int x7c0;                       // 0x7c0
    int x7c4;                       // 0x7c4
    int x7c8;                       // 0x7c8
    int x7cc;                       // 0x7cc
    int x7d0;                       // 0x7d0
    int x7d4;                       // 0x7d4
    int x7d8;                       // 0x7d8
    int x7dc;                       // 0x7dc
    int x7e0;                       // 0x7e0
    int x7e4;                       // 0x7e4
    int x7e8;                       // 0x7e8
    int x7ec;                       // 0x7ec
    int x7f0;                       // 0x7f0
    int x7f4;                       // 0x7f4
    int x7f8;                       // 0x7f8
    int x7fc;                       // 0x7fc
    int x800;                       // 0x800
    int x804;                       // 0x804
    int x808;                       // 0x808
    int x80c;                       // 0x80c
    int x810;                       // 0x810
    int x814;                       // 0x814
    int x818;                       // 0x818
    int x81c;                       // 0x81c
    int x820;                       // 0x820
    int x824;                       // 0x824
    int x828;                       // 0x828
    int x82c;                       // 0x82c
    int x830;                       // 0x830
    int x834;                       // 0x834
    int x838;                       // 0x838
    int x83c;                       // 0x83c
    int x840;                       // 0x840
    int x844;                       // 0x844
    int x848;                       // 0x848
    int x84c;                       // 0x84c
    int x850;                       // 0x850
    int x854;                       // 0x854
    int x858;                       // 0x858
    int x85c;                       // 0x85c
    int x860;                       // 0x860
    int x864;                       // 0x864
    int x868;                       // 0x868
    int x86c;                       // 0x86c
    int x870;                       // 0x870
    int x874;                       // 0x874
    int x878;                       // 0x878
    int x87c;                       // 0x87c
    int x880;                       // 0x880
    int x884;                       // 0x884
    int x888;                       // 0x888
    int x88c;                       // 0x88c
    int x890;                       // 0x890
    int x894;                       // 0x894
    int x898;                       // 0x898
    int x89c;                       // 0x89c
    int x8a0;                       // 0x8a0
    int x8a4;                       // 0x8a4
    int x8a8;                       // 0x8a8
    int x8ac;                       // 0x8ac
    int x8b0;                       // 0x8b0
    int x8b4;                       // 0x8b4
    int x8b8;                       // 0x8b8
    int x8bc;                       // 0x8bc
    int x8c0;                       // 0x8c0
    int x8c4;                       // 0x8c4
    int x8c8;                       // 0x8c8
    int x8cc;                       // 0x8cc
    int x8d0;                       // 0x8d0
    int x8d4;                       // 0x8d4
    int x8d8;                       // 0x8d8
    int x8dc;                       // 0x8dc
    int x8e0;                       // 0x8e0
    int x8e4;                       // 0x8e4
    int x8e8;                       // 0x8e8
    int x8ec;                       // 0x8ec
    int x8f0;                       // 0x8f0
    int x8f4;                       // 0x8f4
    int x8f8;                       // 0x8f8
    int x8fc;                       // 0x8fc
    int x900;                       // 0x900
    int x904;                       // 0x904
    int x908;                       // 0x908
    int x90c;                       // 0x90c
    int x910;                       // 0x910
    int x914;                       // 0x914
    int x918;                       // 0x918
    int x91c;                       // 0x91c
    int x920;                       // 0x920
    int x924;                       // 0x924
    int x928;                       // 0x928
    int x92c;                       // 0x92c
    int x930;                       // 0x930
    int x934;                       // 0x934
    int x938;                       // 0x938
    int x93c;                       // 0x93c
    int x940;                       // 0x940
    int x944;                       // 0x944
    int x948;                       // 0x948
    int x94c;                       // 0x94c
    int x950;                       // 0x950
    int x954;                       // 0x954
    int x958;                       // 0x958
    int x95c;                       // 0x95c
    int x960;                       // 0x960
    int x964;                       // 0x964
    int x968;                       // 0x968
    int x96c;                       // 0x96c
    int x970;                       // 0x970
    int x974;                       // 0x974
    int x978;                       // 0x978
    int x97c;                       // 0x97c
    int x980;                       // 0x980
    int x984;                       // 0x984
    int x988;                       // 0x988
    int x98c;                       // 0x98c
    int x990;                       // 0x990
    int x994;                       // 0x994
    int x998;                       // 0x998
    int x99c;                       // 0x99c
    int x9a0;                       // 0x9a0
    int x9a4;                       // 0x9a4
    int x9a8;                       // 0x9a8
    int x9ac;                       // 0x9ac
    int x9b0;                       // 0x9b0
    int x9b4;                       // 0x9b4
    int x9b8;                       // 0x9b8
    int x9bc;                       // 0x9bc
    int x9c0;                       // 0x9c0
    int x9c4;                       // 0x9c4
    int x9c8;                       // 0x9c8
    int x9cc;                       // 0x9cc
    int x9d0;                       // 0x9d0
    int x9d4;                       // 0x9d4
    int x9d8;                       // 0x9d8
    int x9dc;                       // 0x9dc
    int x9e0;                       // 0x9e0
    int x9e4;                       // 0x9e4
    int x9e8;                       // 0x9e8
    int x9ec;                       // 0x9ec
    int x9f0;                       // 0x9f0
    int x9f4;                       // 0x9f4
    int x9f8;                       // 0x9f8
    int x9fc;                       // 0x9fc
    int xa00;                       // 0xa00
    int xa04;                       // 0xa04
    int xa08;                       // 0xa08
    int xa0c;                       // 0xa0c
    int xa10;                       // 0xa10
    int xa14;                       // 0xa14
    int xa18;                       // 0xa18
    int xa1c;                       // 0xa1c
    int xa20;                       // 0xa20
    int xa24;                       // 0xa24
    int xa28;                       // 0xa28
    int xa2c;                       // 0xa2c
    int xa30;                       // 0xa30
    int xa34;                       // 0xa34
    int xa38;                       // 0xa38
    int xa3c;                       // 0xa3c
    int xa40;                       // 0xa40
    int xa44;                       // 0xa44
    int xa48;                       // 0xa48
    int xa4c;                       // 0xa4c
    int xa50;                       // 0xa50
    int xa54;                       // 0xa54
    int xa58;                       // 0xa58
    int xa5c;                       // 0xa5c
    int xa60;                       // 0xa60
    int xa64;                       // 0xa64
    int xa68;                       // 0xa68
    int xa6c;                       // 0xa6c
    int xa70;                       // 0xa70
    int xa74;                       // 0xa74
    int xa78;                       // 0xa78
    int xa7c;                       // 0xa7c
    int xa80;                       // 0xa80
    int xa84;                       // 0xa84
    int xa88;                       // 0xa88
    int xa8c;                       // 0xa8c
    int xa90;                       // 0xa90
    int xa94;                       // 0xa94
    int xa98;                       // 0xa98
    int xa9c;                       // 0xa9c
    int xaa0;                       // 0xaa0
    int xaa4;                       // 0xaa4
    int xaa8;                       // 0xaa8
    int xaac;                       // 0xaac
    int xab0;                       // 0xab0
    int xab4;                       // 0xab4
    int xab8;                       // 0xab8
    int xabc;                       // 0xabc
    int xac0;                       // 0xac0
    int xac4;                       // 0xac4
    int xac8;                       // 0xac8
    int xacc;                       // 0xacc
    int xad0;                       // 0xad0
    int xad4;                       // 0xad4
    int xad8;                       // 0xad8
    int xadc;                       // 0xadc
    int xae0;                       // 0xae0
    int xae4;                       // 0xae4
    int xae8;                       // 0xae8
    int xaec;                       // 0xaec
    int xaf0;                       // 0xaf0
    int xaf4;                       // 0xaf4
    int xaf8;                       // 0xaf8
    int xafc;                       // 0xafc
    int xb00;                       // 0xb00
    int xb04;                       // 0xb04
    int xb08;                       // 0xb08
    int xb0c;                       // 0xb0c
    int xb10;                       // 0xb10
    int xb14;                       // 0xb14
    int xb18;                       // 0xb18
    int xb1c;                       // 0xb1c
    int xb20;                       // 0xb20
    int xb24;                       // 0xb24
    int xb28;                       // 0xb28
    int xb2c;                       // 0xb2c
    int xb30;                       // 0xb30
    int xb34;                       // 0xb34
    int xb38;                       // 0xb38
    int xb3c;                       // 0xb3c
    int xb40;                       // 0xb40
    int xb44;                       // 0xb44
    int xb48;                       // 0xb48
    int xb4c;                       // 0xb4c
    int xb50;                       // 0xb50
    int xb54;                       // 0xb54
    int xb58;                       // 0xb58
    int xb5c;                       // 0xb5c
    int xb60;                       // 0xb60
    int xb64;                       // 0xb64
    int xb68;                       // 0xb68
    int xb6c;                       // 0xb6c
    int xb70;                       // 0xb70
    int xb74;                       // 0xb74
    int xb78;                       // 0xb78
    int xb7c;                       // 0xb7c
    int xb80;                       // 0xb80
    int xb84;                       // 0xb84
    int xb88;                       // 0xb88
    int xb8c;                       // 0xb8c
    int xb90;                       // 0xb90
    int xb94;                       // 0xb94
    int xb98;                       // 0xb98
    int xb9c;                       // 0xb9c
    int xba0;                       // 0xba0
    int xba4;                       // 0xba4
    int xba8;                       // 0xba8
    int xbac;                       // 0xbac
    int xbb0;                       // 0xbb0
    int xbb4;                       // 0xbb4
    int xbb8;                       // 0xbb8
    int xbbc;                       // 0xbbc
    int xbc0;                       // 0xbc0
    int xbc4;                       // 0xbc4
    int xbc8;                       // 0xbc8
    int xbcc;                       // 0xbcc
    int xbd0;                       // 0xbd0
    int xbd4;                       // 0xbd4
    int xbd8;                       // 0xbd8
    int xbdc;                       // 0xbdc
    int xbe0;                       // 0xbe0
    int xbe4;                       // 0xbe4
    int xbe8;                       // 0xbe8
    int xbec;                       // 0xbec
    int xbf0;                       // 0xbf0
    int xbf4;                       // 0xbf4
    int xbf8;                       // 0xbf8
    int xbfc;                       // 0xbfc
    int xc00;                       // 0xc00
    int xc04;                       // 0xc04
    int xc08;                       // 0xc08
    int xc0c;                       // 0xc0c
    int xc10;                       // 0xc10
    int xc14;                       // 0xc14
    int xc18;                       // 0xc18
    float ecb_top;                  // 0xc1c
    float ecb_bottom;               // 0xc20
    float ecb_right;                // 0xc24
    float ecb_left;                 // 0xc28
    int xc2c;                       // 0xc2c
    int xc30;                       // 0xc30
    int xc34;                       // 0xc34
    int xc38;                       // 0xc38
    int xc3c;                       // 0xc3c
    int xc40;                       // 0xc40
    int xc44;                       // 0xc44
    int xc48;                       // 0xc48
    int xc4c;                       // 0xc4c
    int xc50;                       // 0xc50
    int xc54;                       // 0xc54
    int xc58;                       // 0xc58
    int xc5c;                       // 0xc5c
    int xc60;                       // 0xc60
    int xc64;                       // 0xc64
    int xc68;                       // 0xc68
    int xc6c;                       // 0xc6c
    int xc70;                       // 0xc70
    int xc74;                       // 0xc74
    int xc78;                       // 0xc78
    int xc7c;                       // 0xc7c
    int xc80;                       // 0xc80
    int xc84;                       // 0xc84
    int xc88;                       // 0xc88
    int xc8c;                       // 0xc8c
    int xc90;                       // 0xc90
    int xc94;                       // 0xc94
    int xc98;                       // 0xc98
    int dmg_total;                  // 0xc9c
    int dmg_recent;                 // 0xca0
    int xca4;                       // 0xca4
    int xca8;                       // 0xca8
    int dmg_angle;                  // 0xcac
    int xcb0;                       // 0xcb0
    int xcb4;                       // 0xcb4
    int xcb8;                       // 0xcb8
    int xcbc;                       // 0xcbc
    int xcc0;                       // 0xcc0
    int xcc4;                       // 0xcc4
    float dmg_kb;                   // 0xcc8
    float dmg_direction;            // 0xccc
    int xcd0;                       // 0xcd0
    int xcd4;                       // 0xcd4
    int xcd8;                       // 0xcd8
    int xcdc;                       // 0xcdc
    int xce0;                       // 0xce0
    int xce4;                       // 0xce4
    int xce8;                       // 0xce8
    GOBJ *dmgsource_fighter;        // 0xcec
    GOBJ *dmgsource_item;           // 0xcf0
    int xcf4;                       // 0xcf4
    int xcf8;                       // 0xcf8
    int xcfc;                       // 0xcfc
    GOBJ *grabbedFighter;           // 0xd00
    int xd04;                       // 0xd04
    int xd08;                       // 0xd08
    int xd0c;                       // 0xd0c
    int xd10;                       // 0xd10
    int xd14;                       // 0xd14
    int xd18;                       // 0xd18
    int xd1c;                       // 0xd1c
    void *cb_Accessory;             // 0xd20
    int xd24;                       // 0xd24
    int xd28;                       // 0xd28
    int xd2c;                       // 0xd2c
    int xd30;                       // 0xd30
    void *grabbedFighter_OnItem;    // 0xd34
    void *grabbedFighter_OnFighter; // 0xd38
    float rotateSpeed;              // 0xd3c
    int xd40;                       // 0xd40
    int xd44;                       // 0xd44
    int xd48;                       // 0xd48
    int xd4c;                       // 0xd4c
    int xd50;                       // 0xd50
    int xd54;                       // 0xd54
    int xd58;                       // 0xd58
    int xd5c;                       // 0xd5c
    int xd60;                       // 0xd60
    int xd64;                       // 0xd64
    int xd68;                       // 0xd68
    int xd6c;                       // 0xd6c
    int xd70;                       // 0xd70
    int xd74;                       // 0xd74
    int xd78;                       // 0xd78
    int xd7c;                       // 0xd7c
    int xd80;                       // 0xd80
    int xd84;                       // 0xd84
    int xd88;                       // 0xd88
    int xd8c;                       // 0xd8c
    int xd90;                       // 0xd90
    int xd94;                       // 0xd94
    int xd98;                       // 0xd98
    int xd9c;                       // 0xd9c
    int xda0;                       // 0xda0
    int xda4;                       // 0xda4
    int xda8;                       // 0xda8
    int xdac;                       // 0xdac
    int xdb0;                       // 0xdb0
    int xdb4;                       // 0xdb4
    int xdb8;                       // 0xdb8
    int xdbc;                       // 0xdbc
    int xdc0;                       // 0xdc0
    int xdc4;                       // 0xdc4
    u16 flags1 : 16;                // 0xdc8
    u16 flags2 : 7;                 // 0xdca
    u16 rotateAxis : 3;
    u16 flags4 : 6;
    int flags;     // 0xdcc
    int xdd0;      // 0xdd0
    int itemVar1;  // 0xdd4
    int itemVar2;  // 0xdd8
    int itemVar3;  // 0xddc
    int itemVar4;  // 0xde0
    int itemVar5;  // 0xde4
    int itemVar6;  // 0xde8
    int itemVar7;  // 0xdec
    int itemVar8;  // 0xdf0
    int itemVar9;  // 0xdf4
    int itemVar10; // 0xdf8
    int itemVar11; // 0xdfc
    int itemVar12; // 0xe00
    int xe04;      // 0xe04
    int xe08;      // 0xe08
    int xe0c;      // 0xe0c
    int xe10;      // 0xe10
    int xe14;      // 0xe14
    int xe18;      // 0xe18
    int xe1c;      // 0xe1c
    int xe20;      // 0xe20
    int xe24;      // 0xe24
    int xe28;      // 0xe28
    int xe2c;      // 0xe2c
    int xe30;      // 0xe30
    int xe34;      // 0xe34
    int xe38;      // 0xe38
    int xe3c;      // 0xe3c
};
struct map_gobjData
{
    int x0;              // 0x0
    GOBJ *gobj;          // 0x4
    int x8;              // 0x8
    int xC;              // 0xC
    int flags;           // 0x10
    int map_gobjID;      // 0x14
    int x18;             // 0x18
    int onUnk;           // 0x1c
    int x20;             // 0x20
    int x24;             // 0x24
    int stateID;         // 0x28
    int facingDirection; // 0x2c
    int x30;             // 0x30
    int x34;             // 0x34
    float scale;         // 0x38
    int x3c;             // 0x3c
    float selfVelX;      // 0x40
    float selfVelY;      // 0x44
    float selfVelZ;      // 0x48
    float posX;          // 0x4c
    float posY;          // 0x50
    float posZ;          // 0x54
    int x58;             // 0x58
    int x5c;             // 0x5c
    int x60;             // 0x60
    int x64;             // 0x64
    int x68;             // 0x68
    int x6c;             // 0x6c
    int x70;             // 0x70
    int x74;             // 0x74
    int x78;             // 0x78
    int x7c;             // 0x7c
    int x80;             // 0x80
    int x84;             // 0x84
    int x88;             // 0x88
    int x8c;             // 0x8c
    int x90;             // 0x90
    int x94;             // 0x94
    int x98;             // 0x98
    int x9c;             // 0x9c
    int xa0;             // 0xa0
    int xa4;             // 0xa4
    int xa8;             // 0xa8
    int xac;             // 0xac
    int xb0;             // 0xb0
    int xb4;             // 0xb4
    int xb8;             // 0xb8
    int xbc;             // 0xbc
    int xc0;             // 0xc0
    int xc4;             // 0xc4
    int xc8;             // 0xc8
    int xcc;             // 0xcc
    int xd0;             // 0xd0
    int xd4;             // 0xd4
    int xd8;             // 0xd8
    int xdc;             // 0xdc
    int mapVar0;         // 0xe0
    int mapVar1;         // 0xe4
    int mapVar2;         // 0xe8
    int mapVar3;         // 0xec
    int mapVar4;         // 0xf0
    int mapVar5;         // 0xf4
    int mapVar6;         // 0xf8
    int mapVar7;         // 0xfc
    int x100;            // 0x100
    int x104;            // 0x104
    int x108;            // 0x108
    int x10c;            // 0x10c
    int x110;            // 0x110
    int x114;            // 0x114
    int x118;            // 0x118
    int x11c;            // 0x11c
    int x120;            // 0x120
    int x124;            // 0x124
    int x128;            // 0x128
    int x12c;            // 0x12c
    int x130;            // 0x130
    int x134;            // 0x134
    int x138;            // 0x138
    int x13c;            // 0x13c
    int x140;            // 0x140
    int x144;            // 0x144
    int x148;            // 0x148
    int x14c;            // 0x14c
    int x150;            // 0x150
    int x154;            // 0x154
    int x158;            // 0x158
    int x15c;            // 0x15c
    int x160;            // 0x160
    int x164;            // 0x164
    int x168;            // 0x168
    int x16c;            // 0x16c
    int x170;            // 0x170
    int x174;            // 0x174
    int x178;            // 0x178
    int x17c;            // 0x17c
    int x180;            // 0x180
    int x184;            // 0x184
    int x188;            // 0x188
    int x18c;            // 0x18c
    int x190;            // 0x190
    int x194;            // 0x194
    int x198;            // 0x198
    int x19c;            // 0x19c
    int x1a0;            // 0x1a0
    int x1a4;            // 0x1a4
    int x1a8;            // 0x1a8
    int x1ac;            // 0x1ac
    int x1b0;            // 0x1b0
    int x1b4;            // 0x1b4
    int x1b8;            // 0x1b8
    int x1bc;            // 0x1bc
    int x1c0;            // 0x1c0
    int x1c4;            // 0x1c4
    int x1c8;            // 0x1c8
    int x1cc;            // 0x1cc
    int x1d0;            // 0x1d0
    int x1d4;            // 0x1d4
    int x1d8;            // 0x1d8
    int x1dc;            // 0x1dc
    int x1e0;            // 0x1e0
    int x1e4;            // 0x1e4
    int x1e8;            // 0x1e8
    int x1ec;            // 0x1ec
    int x1f0;            // 0x1f0
    int x1f4;            // 0x1f4
    int x1f8;            // 0x1f8
    int x1fc;            // 0x1fc
    int x200;            // 0x200
};
struct SpawnItem
{
    GOBJ *parent_gobj;
    GOBJ *parent_gobj2;
    int item_id;
    int unk1;
    int unk2;
    Vec3 pos;
    Vec3 pos2;
    Vec3 vel;
    float facing_direction;
    short damage;
    short unk5;
    int unk6;  // 1 = correct initial position
    char unk7; //0x80 = perform initial collision check
};
struct Stage
{
    float cam_LeftBound;   // 0x0
    float cam_RightBound;  // 0x4
    float cam_TopBound;    // 0x8
    float cam_BottomBound; // 0xc
    float cam_HorizOffset; // 0x10
    float crowdReactStart; // 0x14, begins checking for crowd gasps below this position
    float fov_d;           // 0x18
    float fov_u;           // 0x1c
    float fov_r;           // 0x20
    float fov_l;           // 0x24
    float x28;             // 0x28
    float x2c;             // 0x2c
    float x30;             // 0x30
    float x34;             // 0x34
    float x38;             // 0x38
    float x3c;             // 0x3c
    float x40;             // 0x40
    int x44;               // 0x44
    int x48;               // 0x48
    int x4c;               // 0x4c
    int x50;               // 0x50
    int x54;               // 0x54
    int x58;               // 0x58
    int x5c;               // 0x5c
    int x60;               // 0x60
    int x64;               // 0x64
    int x68;               // 0x68
    int x6c;               // 0x6c
    int x70;               // 0x70
    float blastzoneLeft;   // 0x74
    float blastzoneRight;  // 0x78
    float blastzoneTop;    // 0x7c
    float blastzoneBottom; // 0x80
    int flags;             // 0x84
    int stageID;           // 0x88
    int flags2;            // 0x8c
    int x90;               // 0x90
    int x94;               // 0x94
    int hpsID;             // 0x98
    int x9c;               // 0x9c
    int xa0;               // 0xa0
    int xa4;               // 0xa4
    int xa8;               // 0xa8
    int xac;               // 0xac
    int xb0;               // 0xb0
    int xb4;               // 0xb4
    int xb8;               // 0xb8
    int xbc;               // 0xbc
    int xc0;               // 0xc0
    int xc4;               // 0xc4
    int xc8;               // 0xc8
    int xcc;               // 0xcc
    int xd0;               // 0xd0
    int xd4;               // 0xd4
    int xd8;               // 0xd8
    int xdc;               // 0xdc
    int xe0;               // 0xe0
    int xe4;               // 0xe4
    int xe8;               // 0xe8
    int xec;               // 0xec
    int xf0;               // 0xf0
    int xf4;               // 0xf4
    int xf8;               // 0xf8
    int xfc;               // 0xfc
    int x100;              // 0x100
    int x104;              // 0x104
    int x108;              // 0x108
    int x10c;              // 0x10c
    int x110;              // 0x110
    int x114;              // 0x114
    int x118;              // 0x118
    int x11c;              // 0x11c
    int x120;              // 0x120
    int x124;              // 0x124
    int x128;              // 0x128
    int x12c;              // 0x12c
    int x130;              // 0x130
    int x134;              // 0x134
    int x138;              // 0x138
    int x13c;              // 0x13c
    int x140;              // 0x140
    int x144;              // 0x144
    int x148;              // 0x148
    int x14c;              // 0x14c
    int x150;              // 0x150
    int x154;              // 0x154
    int x158;              // 0x158
    int x15c;              // 0x15c
    int x160;              // 0x160
    int x164;              // 0x164
    int x168;              // 0x168
    int x16c;              // 0x16c
    int x170;              // 0x170
    int x174;              // 0x174
    int x178;              // 0x178
    int x17c;              // 0x17c
    GOBJ *map_gobjs[64];
    JOBJ *SpawnP1;         // 0x280
    JOBJ *SpawnP2;         // 0x284
    JOBJ *SpawnP3;         // 0x288
    JOBJ *SpawnP4;         // 0x28c
    JOBJ *RespawnP1;       // 0x290
    JOBJ *RespawnP2;       // 0x294
    JOBJ *RespawnP3;       // 0x298
    JOBJ *RespawnP4;       // 0x29c
    int x2a0;              // 0x2a0
    int x2a4;              // 0x2a4
    int x2a8;              // 0x2a8
    int x2ac;              // 0x2ac
    int x2b0;              // 0x2b0
    int x2b4;              // 0x2b4
    int x2b8;              // 0x2b8
    int x2bc;              // 0x2bc
    int x2c0;              // 0x2c0
    int x2c4;              // 0x2c4
    int x2c8;              // 0x2c8
    int x2cc;              // 0x2cc
    int x2d0;              // 0x2d0
    int x2d4;              // 0x2d4
    int x2d8;              // 0x2d8
    int x2dc;              // 0x2dc
    int x2e0;              // 0x2e0
    int x2e4;              // 0x2e4
    int x2e8;              // 0x2e8
    int x2ec;              // 0x2ec
    int x2f0;              // 0x2f0
    int x2f4;              // 0x2f4
    int x2f8;              // 0x2f8
    int x2fc;              // 0x2fc
    int x300;              // 0x300
    int x304;              // 0x304
    int x308;              // 0x308
    int x30c;              // 0x30c
    int x310;              // 0x310
    int x314;              // 0x314
    int x318;              // 0x318
    int x31c;              // 0x31c
    int x320;              // 0x320
    int x324;              // 0x324
    int x328;              // 0x328
    int x32c;              // 0x32c
    int x330;              // 0x330
    int x334;              // 0x334
    int x338;              // 0x338
    int x33c;              // 0x33c
    int x340;              // 0x340
    int x344;              // 0x344
    int x348;              // 0x348
    int x34c;              // 0x34c
    int x350;              // 0x350
    int x354;              // 0x354
    int x358;              // 0x358
    int x35c;              // 0x35c
    int x360;              // 0x360
    int x364;              // 0x364
    int x368;              // 0x368
    int x36c;              // 0x36c
    int x370;              // 0x370
    int x374;              // 0x374
    int x378;              // 0x378
    int x37c;              // 0x37c
    int x380;              // 0x380
    int x384;              // 0x384
    int x388;              // 0x388
    int x38c;              // 0x38c
    int x390;              // 0x390
    int x394;              // 0x394
    int x398;              // 0x398
    int x39c;              // 0x39c
    int x3a0;              // 0x3a0
    int x3a4;              // 0x3a4
    int x3a8;              // 0x3a8
    int x3ac;              // 0x3ac
    int x3b0;              // 0x3b0
    int x3b4;              // 0x3b4
    int x3b8;              // 0x3b8
    int x3bc;              // 0x3bc
    int x3c0;              // 0x3c0
    int x3c4;              // 0x3c4
    int x3c8;              // 0x3c8
    int x3cc;              // 0x3cc
    int x3d0;              // 0x3d0
    int x3d4;              // 0x3d4
    int x3d8;              // 0x3d8
    int x3dc;              // 0x3dc
    int x3e0;              // 0x3e0
    int x3e4;              // 0x3e4
    int x3e8;              // 0x3e8
    int x3ec;              // 0x3ec
    int x3f0;              // 0x3f0
    int x3f4;              // 0x3f4
    int x3f8;              // 0x3f8
    int x3fc;              // 0x3fc
    int x400;              // 0x400
    int x404;              // 0x404
    int x408;              // 0x408
    int x40c;              // 0x40c
    int x410;              // 0x410
    int x414;              // 0x414
    int x418;              // 0x418
    int x41c;              // 0x41c
    int x420;              // 0x420
    int x424;              // 0x424
    int x428;              // 0x428
    int x42c;              // 0x42c
    int x430;              // 0x430
    int x434;              // 0x434
    int x438;              // 0x438
    int x43c;              // 0x43c
    int x440;              // 0x440
    int x444;              // 0x444
    int x448;              // 0x448
    int x44c;              // 0x44c
    int x450;              // 0x450
    int x454;              // 0x454
    int x458;              // 0x458
    int x45c;              // 0x45c
    int x460;              // 0x460
    int x464;              // 0x464
    int x468;              // 0x468
    int x46c;              // 0x46c
    int x470;              // 0x470
    int x474;              // 0x474
    int x478;              // 0x478
    int x47c;              // 0x47c
    int x480;              // 0x480
    int x484;              // 0x484
    int x488;              // 0x488
    int x48c;              // 0x48c
    int x490;              // 0x490
    int x494;              // 0x494
    int x498;              // 0x498
    int x49c;              // 0x49c
    int x4a0;              // 0x4a0
    int x4a4;              // 0x4a4
    int x4a8;              // 0x4a8
    int x4ac;              // 0x4ac
    int x4b0;              // 0x4b0
    int x4b4;              // 0x4b4
    int x4b8;              // 0x4b8
    int x4bc;              // 0x4bc
    int x4c0;              // 0x4c0
    int x4c4;              // 0x4c4
    int x4c8;              // 0x4c8
    int x4cc;              // 0x4cc
    int x4d0;              // 0x4d0
    int x4d4;              // 0x4d4
    int x4d8;              // 0x4d8
    int x4dc;              // 0x4dc
    int x4e0;              // 0x4e0
    int x4e4;              // 0x4e4
    int x4e8;              // 0x4e8
    int x4ec;              // 0x4ec
    int x4f0;              // 0x4f0
    int x4f4;              // 0x4f4
    int x4f8;              // 0x4f8
    int x4fc;              // 0x4fc
    int x500;              // 0x500
    int x504;              // 0x504
    int x508;              // 0x508
    int x50c;              // 0x50c
    int x510;              // 0x510
    int x514;              // 0x514
    int x518;              // 0x518
    int x51c;              // 0x51c
    int x520;              // 0x520
    int x524;              // 0x524
    int x528;              // 0x528
    int x52c;              // 0x52c
    int x530;              // 0x530
    int x534;              // 0x534
    int x538;              // 0x538
    int x53c;              // 0x53c
    int x540;              // 0x540
    int x544;              // 0x544
    int x548;              // 0x548
    int x54c;              // 0x54c
    int x550;              // 0x550
    int x554;              // 0x554
    int x558;              // 0x558
    int x55c;              // 0x55c
    int x560;              // 0x560
    int x564;              // 0x564
    int x568;              // 0x568
    int x56c;              // 0x56c
    int x570;              // 0x570
    int x574;              // 0x574
    int x578;              // 0x578
    int x57c;              // 0x57c
    int x580;              // 0x580
    int x584;              // 0x584
    int x588;              // 0x588
    int x58c;              // 0x58c
    int x590;              // 0x590
    int x594;              // 0x594
    int x598;              // 0x598
    int x59c;              // 0x59c
    int x5a0;              // 0x5a0
    int x5a4;              // 0x5a4
    int x5a8;              // 0x5a8
    int x5ac;              // 0x5ac
    int x5b0;              // 0x5b0
    int x5b4;              // 0x5b4
    int x5b8;              // 0x5b8
    int x5bc;              // 0x5bc
    int x5c0;              // 0x5c0
    int x5c4;              // 0x5c4
    int x5c8;              // 0x5c8
    int x5cc;              // 0x5cc
    int x5d0;              // 0x5d0
    int x5d4;              // 0x5d4
    int x5d8;              // 0x5d8
    int x5dc;              // 0x5dc
    int x5e0;              // 0x5e0
    int x5e4;              // 0x5e4
    int x5e8;              // 0x5e8
    int x5ec;              // 0x5ec
    int x5f0;              // 0x5f0
    int x5f4;              // 0x5f4
    int x5f8;              // 0x5f8
    int x5fc;              // 0x5fc
    int x600;              // 0x600
    int x604;              // 0x604
    int x608;              // 0x608
    int x60c;              // 0x60c
    int x610;              // 0x610
    int x614;              // 0x614
    int x618;              // 0x618
    int x61c;              // 0x61c
    int x620;              // 0x620
    int x624;              // 0x624
    int x628;              // 0x628
    int x62c;              // 0x62c
    int x630;              // 0x630
    int x634;              // 0x634
    int x638;              // 0x638
    int x63c;              // 0x63c
    int x640;              // 0x640
    int x644;              // 0x644
    int x648;              // 0x648
    int x64c;              // 0x64c
    int x650;              // 0x650
    int x654;              // 0x654
    int x658;              // 0x658
    int x65c;              // 0x65c
    int x660;              // 0x660
    int x664;              // 0x664
    int x668;              // 0x668
    int x66c;              // 0x66c
    int x670;              // 0x670
    int x674;              // 0x674
    int x678;              // 0x678
    int x67c;              // 0x67c
    int x680;              // 0x680
    int x684;              // 0x684
    int x688;              // 0x688
    int x68c;              // 0x68c
    int x690;              // 0x690
    int x694;              // 0x694
    int x698;              // 0x698
    int x69c;              // 0x69c
    int x6a0;              // 0x6a0
    int x6a4;              // 0x6a4
    int *itemData;         // 0x6a8
    int *coll_data;        // 0x6ac
    int *grGroundParam;    // 0x6b0
    int *ALDYakuAll;       // 0x6b4
    int *map_ptcl;         // 0x6b8
    int *map_texg;         // 0x6bc
    int *yakumono_param;   // 0x6c0
    int *map_plit;         // 0x6c4
    int *x6c8;             // 0x6c8
    int *quake_model_set;  // 0x6cc
    int *x6d0;             // 0x6d0
    int *targetsRemaining; // 0x6d4
    int x6d8;              // 0x6d8
    int x6dc;              // 0x6dc
    int x6e0;              // 0x6e0
    int x6e4;              // 0x6e4
    int x6e8;              // 0x6e8
    int x6ec;              // 0x6ec
    int x6f0;              // 0x6f0
    int x6f4;              // 0x6f4
    int x6f8;              // 0x6f8
    int x6fc;              // 0x6fc
    int x700;              // 0x700
    int x704;              // 0x704
    int x708;              // 0x708
    int x70c;              // 0x70c
    int x710;              // 0x710
    int x714;              // 0x714
    int x718;              // 0x718
    int x71c;              // 0x71c
    int x720;              // 0x720
    int x724;              // 0x724
    int x728;              // 0x728
    int x72C;              // 0x728
};
typedef struct MatchCamera
{
    int x0;                      // 0x0
    int cam_kind;                // 0x4
    int x8;                      // 0x8
    int xc;                      // 0xc
    int x10;                     // 0x10
    int x14;                     // 0x14
    int x18;                     // 0x18
    int x1c;                     // 0x1c
    int x20;                     // 0x20
    int x24;                     // 0x24
    int x28;                     // 0x28
    int x2c;                     // 0x2c
    int x30;                     // 0x30
    int x34;                     // 0x34
    int x38;                     // 0x38
    int x3c;                     // 0x3c
    int x40;                     // 0x40
    int x44;                     // 0x44
    int x48;                     // 0x48
    int x4c;                     // 0x4c
    int x50;                     // 0x50
    int x54;                     // 0x54
    int x58;                     // 0x58
    int x5c;                     // 0x5c
    int x60;                     // 0x60
    int x64;                     // 0x64
    int x68;                     // 0x68
    int x6c;                     // 0x6c
    int x70;                     // 0x70
    int x74;                     // 0x74
    int x78;                     // 0x78
    int x7c;                     // 0x7c
    int x80;                     // 0x80
    int x84;                     // 0x84
    int x88;                     // 0x88
    int x8c;                     // 0x8c
    int x90;                     // 0x90
    int x94;                     // 0x94
    int x98;                     // 0x98
    int x9c;                     // 0x9c
    int xa0;                     // 0xa0
    int xa4;                     // 0xa4
    int xa8;                     // 0xa8
    int xac;                     // 0xac
    int xb0;                     // 0xb0
    int xb4;                     // 0xb4
    int xb8;                     // 0xb8
    int xbc;                     // 0xbc
    int xc0;                     // 0xc0
    int xc4;                     // 0xc4
    int xc8;                     // 0xc8
    int xcc;                     // 0xcc
    int xd0;                     // 0xd0
    int xd4;                     // 0xd4
    int xd8;                     // 0xd8
    int xdc;                     // 0xdc
    int xe0;                     // 0xe0
    int xe4;                     // 0xe4
    int xe8;                     // 0xe8
    int xec;                     // 0xec
    int xf0;                     // 0xf0
    int xf4;                     // 0xf4
    int xf8;                     // 0xf8
    int xfc;                     // 0xfc
    int x100;                    // 0x100
    int x104;                    // 0x104
    int x108;                    // 0x108
    int x10c;                    // 0x10c
    int x110;                    // 0x110
    int x114;                    // 0x114
    int x118;                    // 0x118
    int x11c;                    // 0x11c
    int x120;                    // 0x120
    int x124;                    // 0x124
    int x128;                    // 0x128
    int x12c;                    // 0x12c
    int x130;                    // 0x130
    int x134;                    // 0x134
    int x138;                    // 0x138
    int x13c;                    // 0x13c
    int x140;                    // 0x140
    int x144;                    // 0x144
    int x148;                    // 0x148
    int x14c;                    // 0x14c
    int x150;                    // 0x150
    int x154;                    // 0x154
    int x158;                    // 0x158
    int x15c;                    // 0x15c
    int x160;                    // 0x160
    int x164;                    // 0x164
    int x168;                    // 0x168
    int x16c;                    // 0x16c
    int x170;                    // 0x170
    int x174;                    // 0x174
    int x178;                    // 0x178
    int x17c;                    // 0x17c
    int x180;                    // 0x180
    int x184;                    // 0x184
    int x188;                    // 0x188
    int x18c;                    // 0x18c
    int x190;                    // 0x190
    int x194;                    // 0x194
    int x198;                    // 0x198
    int x19c;                    // 0x19c
    int x1a0;                    // 0x1a0
    int x1a4;                    // 0x1a4
    int x1a8;                    // 0x1a8
    int x1ac;                    // 0x1ac
    int x1b0;                    // 0x1b0
    int x1b4;                    // 0x1b4
    int x1b8;                    // 0x1b8
    int x1bc;                    // 0x1bc
    int x1c0;                    // 0x1c0
    int x1c4;                    // 0x1c4
    int x1c8;                    // 0x1c8
    int x1cc;                    // 0x1cc
    int x1d0;                    // 0x1d0
    int x1d4;                    // 0x1d4
    int x1d8;                    // 0x1d8
    int x1dc;                    // 0x1dc
    int x1e0;                    // 0x1e0
    int x1e4;                    // 0x1e4
    int x1e8;                    // 0x1e8
    int x1ec;                    // 0x1ec
    int x1f0;                    // 0x1f0
    int x1f4;                    // 0x1f4
    int x1f8;                    // 0x1f8
    int x1fc;                    // 0x1fc
    int x200;                    // 0x200
    int x204;                    // 0x204
    int x208;                    // 0x208
    int x20c;                    // 0x20c
    int x210;                    // 0x210
    int x214;                    // 0x214
    int x218;                    // 0x218
    int x21c;                    // 0x21c
    int x220;                    // 0x220
    int x224;                    // 0x224
    int x228;                    // 0x228
    int x22c;                    // 0x22c
    int x230;                    // 0x230
    int x234;                    // 0x234
    int x238;                    // 0x238
    int x23c;                    // 0x23c
    int x240;                    // 0x240
    int x244;                    // 0x244
    int x248;                    // 0x248
    int x24c;                    // 0x24c
    int x250;                    // 0x250
    int x254;                    // 0x254
    int x258;                    // 0x258
    int x25c;                    // 0x25c
    int x260;                    // 0x260
    int x264;                    // 0x264
    int x268;                    // 0x268
    int x26c;                    // 0x26c
    int x270;                    // 0x270
    int x274;                    // 0x274
    int x278;                    // 0x278
    int x27c;                    // 0x27c
    int x280;                    // 0x280
    int x284;                    // 0x284
    int x288;                    // 0x288
    int x28c;                    // 0x28c
    int x290;                    // 0x290
    int x294;                    // 0x294
    int x298;                    // 0x298
    int x29c;                    // 0x29c
    int x2a0;                    // 0x2a0
    int x2a4;                    // 0x2a4
    int x2a8;                    // 0x2a8
    int x2ac;                    // 0x2ac
    int x2b0;                    // 0x2b0
    int x2b4;                    // 0x2b4
    int x2b8;                    // 0x2b8
    int x2bc;                    // 0x2bc
    int x2c0;                    // 0x2c0
    int x2c4;                    // 0x2c4
    int x2c8;                    // 0x2c8
    int x2cc;                    // 0x2cc
    int x2d0;                    // 0x2d0
    int x2d4;                    // 0x2d4
    int x2d8;                    // 0x2d8
    int x2dc;                    // 0x2dc
    int x2e0;                    // 0x2e0
    int x2e4;                    // 0x2e4
    int x2e8;                    // 0x2e8
    float freecam_tilt_vertical; // 0x2ec, uses radians
    int x2f0;                    // 0x2f0
    int x2f4;                    // 0x2f4
    float freecam_zoommax;       // 0x2f8
    float freecam_zoommin;       // 0x2fc
    int x300;                    // 0x300
    int x304;                    // 0x304
    Vec3 freecam_pos;            // 0x308
    Vec3 freecam_offset;         // 0x314                // 0x314
    Vec2 freecam_rotate;         // 0x320
    Vec3 freecam_fov;            // 0x328
    int x334;                    // 0x334
    int x338;                    // 0x338
    int x33c;                    // 0x33c
    int x340;                    // 0x340
    int x344;                    // 0x344
    int x348;                    // 0x348
    int x34c;                    // 0x34c
    int x350;                    // 0x350
    int x354;                    // 0x354
    int x358;                    // 0x358
    int x35c;                    // 0x35c
    int x360;                    // 0x360
    int x364;                    // 0x364
    int x368;                    // 0x368
    int x36c;                    // 0x36c
    int x370;                    // 0x370
    int x374;                    // 0x374
    int x378;                    // 0x378
    int x37c;                    // 0x37c
    int x380;                    // 0x380
    int x384;                    // 0x384
    int x388;                    // 0x388
    int x38c;                    // 0x38c
    int x390;                    // 0x390
    int x394;                    // 0x394
    char x398;                   // 0x398
    unsigned char x399x80 : 1;
    unsigned char x399x40 : 1;
    unsigned char x399x20 : 1;
    unsigned char show_coll : 1;
    unsigned char x399x08 : 1;
    unsigned char x399x04 : 1;
    unsigned char x399x02 : 1;
    unsigned char x399x01 : 1;
    char x39a;        // 0x39a
    char x39b;        // 0x39b
    int x39c;         // 0x39c
    int x3a0;         // 0x3a0
    int x3a4;         // 0x3a4
    int x3a8;         // 0x3a8
    int x3ac;         // 0x3ac
    int x3b0;         // 0x3b0
    int x3b4;         // 0x3b4
    int x3b8;         // 0x3b8
    int x3bc;         // 0x3bc
    int x3c0;         // 0x3c0
    int x3c4;         // 0x3c4
    int x3c8;         // 0x3c8
    int x3cc;         // 0x3cc
    int x3d0;         // 0x3d0
    int x3d4;         // 0x3d4
    Vec3 devcam_pos;  // 0x3d8
    Vec3 devcam_rot;  // 0x3e4
    float devcam_fov; // 0x3f0
    int x3f4;         // 0x3f4
    int x3f8;         // 0x3f8
    int x3fc;         // 0x3fc
} MatchCamera;
typedef struct SubactionHeader
{
    char *symbol;
    int animOffset;
    int animSize;
    int *subactionData;
    int flags;
} SubactionHeader;
struct itCommonAttr
{
    char flags1; //0x0, bit 0x80 = is heavy item (crate)
    char flags2; //0x1
    char flags3; //0x2
    char flags4; //0x3
    int x4;
    int x8;
    float spinVelocity;
    float fallSpeed;
    float maxFallSpeed;
    float x18;
    float x1C; //collision related
    int x20;   // 0x20
    int x24;   // 0x24
    int x28;   // 0x28
    int x2c;   // 0x2c
    int x30;   // 0x30
    int x34;   // 0x34
    int x38;   // 0x38
    int x3c;   // 0x3c
    int x40;   // 0x40
    int x44;   // 0x44
    int x48;   // 0x48
    int x4c;   // 0x4c
    int x50;   // 0x50
    int x54;   // 0x54
    int x58;   // 0x58
    int x5c;   // 0x5c
    int x60;   // 0x60
    int x64;   // 0x64
    int x68;   // 0x68
    int x6c;   // 0x6c
    int x70;   // 0x70
    int x74;   // 0x74
    int x78;   // 0x78
    int x7c;   // 0x7c
    int x80;   // 0x80
    int x84;   // 0x84
    int x88;   // 0x88
    int x8c;   // 0x8c
    int x90;   // 0x90
    int x94;   // 0x94
    int x98;   // 0x98
    int x9c;   // 0x9c
};
struct ItemState
{
    int animID;
    void *animCallback;
    void *physCallback;
    void *collCallback;
};
struct PRIM
{
    int data;
};
typedef struct ftCommonData
{
    float x0;             // 0x0
    float x4;             // 0x4
    float x8;             // 0x8
    float xc;             // 0xc
    float x10;            // 0x10
    float x14;            // 0x14
    float x18;            // 0x18
    float x1c;            // 0x1c
    float x20;            // 0x20
    float x24;            // 0x24
    float x28;            // 0x28
    float x2c;            // 0x2c
    float x30;            // 0x30
    float x34;            // 0x34
    float x38;            // 0x38
    float x3c;            // 0x3c
    float x40;            // 0x40
    float x44;            // 0x44
    float x48;            // 0x48
    float x4c;            // 0x4c
    float x50;            // 0x50
    float x54;            // 0x54
    float x58;            // 0x58
    float x5c;            // 0x5c
    float x60;            // 0x60
    float x64;            // 0x64
    float x68;            // 0x68
    float x6c;            // 0x6c
    float x70;            // 0x70
    float x74;            // 0x74
    float x78;            // 0x78
    float x7c;            // 0x7c
    float x80;            // 0x80
    float x84;            // 0x84
    float x88;            // 0x88
    float x8c;            // 0x8c
    float x90;            // 0x90
    float x94;            // 0x94
    float x98;            // 0x98
    float x9c;            // 0x9c
    float xa0;            // 0xa0
    float xa4;            // 0xa4
    float xa8;            // 0xa8
    float xac;            // 0xac
    float xb0;            // 0xb0
    float xb4;            // 0xb4
    float xb8;            // 0xb8
    float xbc;            // 0xbc
    float xc0;            // 0xc0
    float xc4;            // 0xc4
    float xc8;            // 0xc8
    float xcc;            // 0xcc
    float xd0;            // 0xd0
    float xd4;            // 0xd4
    float xd8;            // 0xd8
    float xdc;            // 0xdc
    float xe0;            // 0xe0
    float xe4;            // 0xe4
    float xe8;            // 0xe8
    float xec;            // 0xec
    float xf0;            // 0xf0
    float xf4;            // 0xf4
    float xf8;            // 0xf8
    float xfc;            // 0xfc
    float kb_mult;        // 0x100
    float x104;           // 0x104
    float x108;           // 0x108
    float x10c;           // 0x10c
    float x110;           // 0x110
    float x114;           // 0x114
    float x118;           // 0x118
    float x11c;           // 0x11c
    float x120;           // 0x120
    float x124;           // 0x124
    float x128;           // 0x128
    float x12c;           // 0x12c
    float x130;           // 0x130
    float x134;           // 0x134
    float x138;           // 0x138
    float x13c;           // 0x13c
    float x140;           // 0x140
    float x144;           // 0x144
    float x148;           // 0x148
    float x14c;           // 0x14c
    float x150;           // 0x150
    float x154;           // 0x154
    float x158;           // 0x158
    float x15c;           // 0x15c
    float x160;           // 0x160
    float x164;           // 0x164
    float x168;           // 0x168
    float kb_maxVelX;     // 0x16c
    float x170;           // 0x170
    float x174;           // 0x174
    float x178;           // 0x178
    float x17c;           // 0x17c
    float x180;           // 0x180
    float x184;           // 0x184
    float x188;           // 0x188
    float x18c;           // 0x18c
    float x190;           // 0x190
    float x194;           // 0x194
    float x198;           // 0x198
    float x19c;           // 0x19c
    float x1a0;           // 0x1a0
    float x1a4;           // 0x1a4
    float tdi_maxAngle;   // 0x1a8
    float x1ac;           // 0x1ac
    float x1b0;           // 0x1b0
    float x1b4;           // 0x1b4
    float x1b8;           // 0x1b8
    float kb_bounceDecay; // 0x1bc
    float x1c0;           // 0x1c0
    float x1c4;           // 0x1c4
    float x1c8;           // 0x1c8
    float x1cc;           // 0x1cc
    float x1d0;           // 0x1d0
    float x1d4;           // 0x1d4
    float x1d8;           // 0x1d8
    float x1dc;           // 0x1dc
    float x1e0;           // 0x1e0
    float x1e4;           // 0x1e4
    float x1e8;           // 0x1e8
    float x1ec;           // 0x1ec
    float x1f0;           // 0x1f0
    float x1f4;           // 0x1f4
    float x1f8;           // 0x1f8
    float x1fc;           // 0x1fc
    float x200;           // 0x200
    float kb_frameDecay;  // 0x204
    float x208;           // 0x208
    float x20c;           // 0x20c
    float x210;           // 0x210
    float x214;           // 0x214
    float x218;           // 0x218
    float x21c;           // 0x21c
    float x220;           // 0x220
    float x224;           // 0x224
    float x228;           // 0x228
    float x22c;           // 0x22c
    float x230;           // 0x230
    float x234;           // 0x234
    float x238;           // 0x238
    float x23c;           // 0x23c
    float x240;           // 0x240
    float x244;           // 0x244
    float x248;           // 0x248
    float x24c;           // 0x24c
    float x250;           // 0x250
    float x254;           // 0x254
    float x258;           // 0x258
    float x25c;           // 0x25c
    float x260;           // 0x260
    float x264;           // 0x264
    float x268;           // 0x268
    float x26c;           // 0x26c
    float x270;           // 0x270
    float x274;           // 0x274
    float x278;           // 0x278
    float x27c;           // 0x27c
    float x280;           // 0x280
    float x284;           // 0x284
    float x288;           // 0x288
    float x28c;           // 0x28c
    float x290;           // 0x290
    float x294;           // 0x294
    float x298;           // 0x298
    float x29c;           // 0x29c
    float x2a0;           // 0x2a0
    float x2a4;           // 0x2a4
    float x2a8;           // 0x2a8
    float x2ac;           // 0x2ac
    float x2b0;           // 0x2b0
    float x2b4;           // 0x2b4
    float x2b8;           // 0x2b8
    float x2bc;           // 0x2bc
    float x2c0;           // 0x2c0
    float x2c4;           // 0x2c4
    float x2c8;           // 0x2c8
    float x2cc;           // 0x2cc
    float x2d0;           // 0x2d0
    float x2d4;           // 0x2d4
    float x2d8;           // 0x2d8
    float x2dc;           // 0x2dc
    float x2e0;           // 0x2e0
    float x2e4;           // 0x2e4
    float x2e8;           // 0x2e8
    float x2ec;           // 0x2ec
    float x2f0;           // 0x2f0
    float x2f4;           // 0x2f4
    float x2f8;           // 0x2f8
    float x2fc;           // 0x2fc
    float x300;           // 0x300
    float x304;           // 0x304
    float x308;           // 0x308
    float x30c;           // 0x30c
    float x310;           // 0x310
    float x314;           // 0x314
    float x318;           // 0x318
    float x31c;           // 0x31c
    float x320;           // 0x320
    float x324;           // 0x324
    float x328;           // 0x328
    float x32c;           // 0x32c
    float x330;           // 0x330
    float x334;           // 0x334
    float x338;           // 0x338
    float x33c;           // 0x33c
    float x340;           // 0x340
    float x344;           // 0x344
    float x348;           // 0x348
    float x34c;           // 0x34c
    float x350;           // 0x350
    float x354;           // 0x354
    float x358;           // 0x358
    float x35c;           // 0x35c
    float x360;           // 0x360
    float x364;           // 0x364
    float x368;           // 0x368
    float x36c;           // 0x36c
    float x370;           // 0x370
    float x374;           // 0x374
    float x378;           // 0x378
    float x37c;           // 0x37c
    float x380;           // 0x380
    float x384;           // 0x384
    float x388;           // 0x388
    float x38c;           // 0x38c
    float x390;           // 0x390
    float x394;           // 0x394
    float x398;           // 0x398
    float x39c;           // 0x39c
    float x3a0;           // 0x3a0
    float x3a4;           // 0x3a4
    float x3a8;           // 0x3a8
    float x3ac;           // 0x3ac
    float x3b0;           // 0x3b0
    float x3b4;           // 0x3b4
    float x3b8;           // 0x3b8
    float x3bc;           // 0x3bc
    float x3c0;           // 0x3c0
    float x3c4;           // 0x3c4
    float x3c8;           // 0x3c8
    float x3cc;           // 0x3cc
    float x3d0;           // 0x3d0
    float x3d4;           // 0x3d4
    float x3d8;           // 0x3d8
    float x3dc;           // 0x3dc
    float x3e0;           // 0x3e0
    float x3e4;           // 0x3e4
    float x3e8;           // 0x3e8
    float x3ec;           // 0x3ec
    float x3f0;           // 0x3f0
    float x3f4;           // 0x3f4
    float x3f8;           // 0x3f8
    float x3fc;           // 0x3fc
    float x400;           // 0x400
    float x404;           // 0x404
    float x408;           // 0x408
    float x40c;           // 0x40c
    float x410;           // 0x410
    float x414;           // 0x414
    float x418;           // 0x418
    float x41c;           // 0x41c
    float x420;           // 0x420
    float x424;           // 0x424
    float x428;           // 0x428
    float x42c;           // 0x42c
    float x430;           // 0x430
    float x434;           // 0x434
    float x438;           // 0x438
    float x43c;           // 0x43c
    float x440;           // 0x440
    float x444;           // 0x444
    float x448;           // 0x448
    float x44c;           // 0x44c
    float x450;           // 0x450
    float x454;           // 0x454
    float x458;           // 0x458
    float x45c;           // 0x45c
    float x460;           // 0x460
    float x464;           // 0x464
    float x468;           // 0x468
    float x46c;           // 0x46c
    float x470;           // 0x470
    float x474;           // 0x474
    float x478;           // 0x478
    float x47c;           // 0x47c
    float x480;           // 0x480
    float x484;           // 0x484
    float x488;           // 0x488
    float x48c;           // 0x48c
    float x490;           // 0x490
    float x494;           // 0x494
    float x498;           // 0x498
    float x49c;           // 0x49c
    float x4a0;           // 0x4a0
    float x4a4;           // 0x4a4
    float x4a8;           // 0x4a8
    float x4ac;           // 0x4ac
    float asdi_mag;       // 0x4b0
    float x4b4;           // 0x4b4
    float x4b8;           // 0x4b8
    float asdi_units;     // 0x4bc
    float x4c0;           // 0x4c0
    float x4c4;           // 0x4c4
    float x4c8;           // 0x4c8
    float x4cc;           // 0x4cc
    float x4d0;           // 0x4d0
    float x4d4;           // 0x4d4
    float x4d8;           // 0x4d8
    float x4dc;           // 0x4dc
    float x4e0;           // 0x4e0
    float x4e4;           // 0x4e4
    float x4e8;           // 0x4e8
    float x4ec;           // 0x4ec
    float x4f0;           // 0x4f0
    float x4f4;           // 0x4f4
    float x4f8;           // 0x4f8
    float x4fc;           // 0x4fc
    float x500;           // 0x500
    float x504;           // 0x504
    float x508;           // 0x508
    float x50c;           // 0x50c
    float x510;           // 0x510
    float x514;           // 0x514
    float x518;           // 0x518
    float x51c;           // 0x51c
    float x520;           // 0x520
    float x524;           // 0x524
    float x528;           // 0x528
    float x52c;           // 0x52c
    float x530;           // 0x530
    float x534;           // 0x534
    float x538;           // 0x538
    float x53c;           // 0x53c
    float x540;           // 0x540
    float x544;           // 0x544
    float x548;           // 0x548
    float x54c;           // 0x54c
    float x550;           // 0x550
    float x554;           // 0x554
    float x558;           // 0x558
    float x55c;           // 0x55c
    float x560;           // 0x560
    float x564;           // 0x564
    float x568;           // 0x568
    float x56c;           // 0x56c
    float x570;           // 0x570
    float x574;           // 0x574
    float x578;           // 0x578
    float x57c;           // 0x57c
    float x580;           // 0x580
    float x584;           // 0x584
    float x588;           // 0x588
    float x58c;           // 0x58c
    float x590;           // 0x590
    float x594;           // 0x594
    float x598;           // 0x598
    float x59c;           // 0x59c
    float x5a0;           // 0x5a0
    float x5a4;           // 0x5a4
    float x5a8;           // 0x5a8
    float x5ac;           // 0x5ac
    float x5b0;           // 0x5b0
    float x5b4;           // 0x5b4
    float x5b8;           // 0x5b8
    float x5bc;           // 0x5bc
    float x5c0;           // 0x5c0
    float x5c4;           // 0x5c4
    float x5c8;           // 0x5c8
    float x5cc;           // 0x5cc
    float x5d0;           // 0x5d0
    float x5d4;           // 0x5d4
    float x5d8;           // 0x5d8
    float x5dc;           // 0x5dc
    float x5e0;           // 0x5e0
    float x5e4;           // 0x5e4
    float x5e8;           // 0x5e8
    float x5ec;           // 0x5ec
    float x5f0;           // 0x5f0
    float x5f4;           // 0x5f4
    float x5f8;           // 0x5f8
    float x5fc;           // 0x5fc
    float x600;           // 0x600
    float x604;           // 0x604
    float x608;           // 0x608
    float x60c;           // 0x60c
    float x610;           // 0x610
    float x614;           // 0x614
    float x618;           // 0x618
    float x61c;           // 0x61c
    float x620;           // 0x620
    float x624;           // 0x624
    float x628;           // 0x628
    float x62c;           // 0x62c
    float x630;           // 0x630
    float x634;           // 0x634
    float x638;           // 0x638
    float x63c;           // 0x63c
    float x640;           // 0x640
    float x644;           // 0x644
    float x648;           // 0x648
    float x64c;           // 0x64c
    float x650;           // 0x650
    float x654;           // 0x654
    float x658;           // 0x658
    float x65c;           // 0x65c
    float x660;           // 0x660
    float x664;           // 0x664
    float x668;           // 0x668
    float x66c;           // 0x66c
    float x670;           // 0x670
    float x674;           // 0x674
    float x678;           // 0x678
    float x67c;           // 0x67c
    float x680;           // 0x680
    float x684;           // 0x684
    float x688;           // 0x688
    float x68c;           // 0x68c
    float x690;           // 0x690
    float x694;           // 0x694
    float x698;           // 0x698
    float x69c;           // 0x69c
    float x6a0;           // 0x6a0
    float x6a4;           // 0x6a4
    float x6a8;           // 0x6a8
    float x6ac;           // 0x6ac
    float x6b0;           // 0x6b0
    float x6b4;           // 0x6b4
    float x6b8;           // 0x6b8
    float x6bc;           // 0x6bc
    float x6c0;           // 0x6c0
    float x6c4;           // 0x6c4
    float x6c8;           // 0x6c8
    float x6cc;           // 0x6cc
    float x6d0;           // 0x6d0
    float x6d4;           // 0x6d4
    float x6d8;           // 0x6d8
    float x6dc;           // 0x6dc
    float x6e0;           // 0x6e0
    float x6e4;           // 0x6e4
    float x6e8;           // 0x6e8
    float x6ec;           // 0x6ec
    float x6f0;           // 0x6f0
    float x6f4;           // 0x6f4
    float x6f8;           // 0x6f8
    float x6fc;           // 0x6fc
    float x700;           // 0x700
    float x704;           // 0x704
    float x708;           // 0x708
    float x70c;           // 0x70c
    float x710;           // 0x710
    float x714;           // 0x714
    float x718;           // 0x718
    float x71c;           // 0x71c
    float x720;           // 0x720
    float x724;           // 0x724
    float x728;           // 0x728
    float x72c;           // 0x72c
    float x730;           // 0x730
    float x734;           // 0x734
    float x738;           // 0x738
    float x73c;           // 0x73c
    float x740;           // 0x740
    float x744;           // 0x744
    float x748;           // 0x748
    float x74c;           // 0x74c
    float x750;           // 0x750
    float x754;           // 0x754
    float x758;           // 0x758
    float x75c;           // 0x75c
    float x760;           // 0x760
    float x764;           // 0x764
    float x768;           // 0x768
    float x76c;           // 0x76c
    float x770;           // 0x770
    float x774;           // 0x774
    float x778;           // 0x778
    float x77c;           // 0x77c
    float x780;           // 0x780
    float x784;           // 0x784
    float x788;           // 0x788
    float x78c;           // 0x78c
    float x790;           // 0x790
    float x794;           // 0x794
    float x798;           // 0x798
    float x79c;           // 0x79c
    float x7a0;           // 0x7a0
    float x7a4;           // 0x7a4
    float x7a8;           // 0x7a8
    float x7ac;           // 0x7ac
    float x7b0;           // 0x7b0
    float x7b4;           // 0x7b4
    float x7b8;           // 0x7b8
    float x7bc;           // 0x7bc
    float x7c0;           // 0x7c0
    float x7c4;           // 0x7c4
    float x7c8;           // 0x7c8
    float x7cc;           // 0x7cc
    float x7d0;           // 0x7d0
    float x7d4;           // 0x7d4
    float x7d8;           // 0x7d8
    float x7dc;           // 0x7dc
    float x7e0;           // 0x7e0
    float x7e4;           // 0x7e4
    float x7e8;           // 0x7e8
    float x7ec;           // 0x7ec
    float x7f0;           // 0x7f0
    float x7f4;           // 0x7f4
    float x7f8;           // 0x7f8
    float x7fc;           // 0x7fc
    float x800;           // 0x800
    float x804;           // 0x804
    float x808;           // 0x808
    float x80c;           // 0x80c
    float x810;           // 0x810
} ftCommonData;
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
typedef struct PlayerData
{
    // byte 0x0
    u8 kind;
    u8 status;
    u8 stocks;
    u8 costume;
    u8 portNumberOverride;
    u8 spawnPointOverride;
    u8 facingDirection;
    u8 subcolor;
    u8 handicap;
    u8 team;
    u8 nametag;
    u8 unk;
    unsigned char isRumble : 1;
    unsigned char isEntry : 1;
    unsigned char unk2 : 6;
    unsigned char unk3 : 8;
    u8 cpuKind;
    u8 cpuLevel;
    u16 damageStart;
    u16 damageSpawn;
    u16 staminaStart;
    float attack;
    float defense;
    float scale;
} PlayerData;
typedef struct MatchData
{
    // byte 0x0
    unsigned char matchType : 3;
    unsigned char hudPos : 3;
    unsigned char timer : 2;
    // byte 0x1
    unsigned char timer_unk2 : 1;
    unsigned char unk4 : 1;
    unsigned char hideReady : 1;
    unsigned char hideGo : 1;
    unsigned char playMusic : 1;
    unsigned char unk3 : 1;
    unsigned char timer_unk : 1;
    unsigned char unk2 : 1;
    // byte 0x2
    unsigned char unk9 : 1;
    unsigned char disableOffscreenDamage : 1;
    unsigned char unk8 : 1;
    unsigned char isSingleButtonMode : 1;
    unsigned char isDisablePause : 1;
    unsigned char unk7 : 1;
    unsigned char isCreateHUD : 1;
    unsigned char unk5 : 1;
    // byte 0x3
    unsigned char isShowScore : 1;        // 0x80
    unsigned char isShowAnalogStick : 1;  // 0x40
    unsigned char isCheckForZRetry : 1;   // 0x20
    unsigned char isShowZRetry : 1;       // 0x10
    unsigned char isCheckForLRAStart : 1; // 0x08
    unsigned char isShowLRAStart : 1;     // 0x04
    unsigned char isHidePauseHUD : 1;     // 0x02
    unsigned char timerRunOnPause : 1;    // 0x01
    //byte 0x4
    unsigned char unk11 : 1;             // 0x80
    unsigned char isCheckStockSteal : 1; // 0x40
    unsigned char isRunStockLogic : 1;   // 0x20
    unsigned char unk10 : 5;             // 0x01
    //byte 0x5
    unsigned char isSkipEndCheck : 1;      // 0x80
    unsigned char isSkipUnkStockCheck : 1; // 0x40
    unsigned char isDisableHit : 1;        // 0x20
    unsigned char unk12 : 5;               // 0x01
    // byte 0x6
    u8 bombRain; // 0xFF
    //byte 0x7
    u8 unk13; // 0xFF
    //byte 0x8
    u8 isTeams; // 0xFF
    //byte 0x9
    u8 isKOCounterActive; // 0xFF
    //byte 0xA
    u8 unk14; // 0xFF
    //byte 0xB
    u8 itemFreq; // 0xFF
    //byte 0xC
    u8 unk15; // 0xFF
    //byte 0xD
    u8 unk16; // 0xFF
    //byte 0xE
    u16 stage; // 0xFFFF
    //byte 0x10
    int timerSeconds : 32; // 0xFFFFFFFF
    //byte 0x14
    u8 timerSubSeconds; // 0xFF
    //0x18
    int unk17; // 0xFFFFFFFF
    //0x1C
    unsigned long long itemSwitch : 64; // 0xFFFFFFFF FFFFFFFF
    //byte 0x24
    int unk18; // 0xFFFFFFFF
    //0x28
    float cameraShakeMult;
    //0x2C
    float unk19;
    //0x30
    float unk20;
    //0x34
    int x34;
    //0x38
    int x38;
    //0x3C
    int x3c;
    //0x40
    void *onStartMelee;
    //0x44
    int unk21;
    //0x48
    void *onCheckPause;
    //0x4C
    int unk22;
    //0x50
    void *onMatchFrame1;
    //0x54
    void *onMatchFrame2;
    //0x58
    void *onMatchEnd;
    //0x5C
    /*
       int unk23;
       //0x60
       int isMultiSpawn;
       //0x64
       int unk24;
     */
    // player data
    PlayerData playerData[4];
} MatchData;
typedef struct PreloadChar
{
    int kind;
    u8 costume;
} PreloadChar;
typedef struct Preload
{
    int unk1;
    int unk2;
    int unk3;
    u8 unk4;
    int stage;
    PreloadChar fighters[8];
    int defragNum;
} Preload;
typedef struct
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
} CSSBackup;
typedef struct
{
    int unk0;              //0x0
    int unk1;              //0x4
    int unk2;              //0x8
    int unk3;              //0xC
    int unk4;              //0x10
    int unk5;              //0x14
    int unk6;              //0x18
    int unk7;              //0x1C
    int unk8;              //0x20
    int unk9;              //0x24
    int unk10;             //0x28
    int unk11;             //0x2C
    int unk12;             //0x30
    int unk13;             //0x34
    int unk14;             //0x38
    int unk15;             //0x3C
    int unk16;             //0x40
    int unk17;             //0x44
    int unk18;             //0x48
    int unk19;             //0x4C
    int unk20;             //0x50
    int unk21;             //0x54
    int unk22;             //0x58
    int unk23;             //0x5C
    int unk24;             //0x60
    int unk25;             //0x64
    int unk26;             //0x68
    int unk27;             //0x6C
    int unk28;             //0x70
    int unk29;             //0x74
    int unk30;             //0x78
    int unk31;             //0x7C
    int unk32;             //0x80
    int unk33;             //0x84
    int unk34;             //0x88
    int unk35;             //0x8C
    int unk36;             //0x90
    int unk37;             //0x94
    int unk38;             //0x98
    int unk39;             //0x9C
    int unk40;             //0xA0
    int unk41;             //0xA4
    int unk42;             //0xA8
    int unk43;             //0xAC
    int unk44;             //0xB0
    int unk45;             //0xB4
    int unk46;             //0xB8
    int unk47;             //0xBC
    int unk48;             //0xC0
    int unk49;             //0xC4
    int unk50;             //0xC8
    int unk51;             //0xCC
    int unk52;             //0xD0
    int unk53;             //0xD4
    int unk54;             //0xD8
    int unk55;             //0xDC
    int unk56;             //0xE0
    int unk57;             //0xE4
    int unk58;             //0xE8
    int unk59;             //0xEC
    int unk60;             //0xF0
    int unk61;             //0xF4
    int unk62;             //0xF8
    int unk63;             //0xFC
    int unk64;             //0x100
    int unk65;             //0x104
    int unk66;             //0x108
    int unk67;             //0x10C
    int unk68;             //0x110
    int unk69;             //0x114
    int unk70;             //0x118
    int unk71;             //0x11C
    int unk72;             //0x120
    int unk73;             //0x124
    int unk74;             //0x128
    int unk75;             //0x12C
    int unk76;             //0x130
    int unk77;             //0x134
    int unk78;             //0x138
    int unk79;             //0x13C
    int unk80;             //0x140
    int unk81;             //0x144
    int unk82;             //0x148
    int unk83;             //0x14C
    int unk84;             //0x150
    int unk85;             //0x154
    int unk86;             //0x158
    int unk87;             //0x15C
    int unk88;             //0x160
    int unk89;             //0x164
    int unk90;             //0x168
    int unk91;             //0x16C
    int unk92;             //0x170
    int unk93;             //0x174
    int unk94;             //0x178
    int unk95;             //0x17C
    int unk96;             //0x180
    int unk97;             //0x184
    int unk98;             //0x188
    int unk99;             //0x18C
    int unk100;            //0x190
    int unk101;            //0x194
    int unk102;            //0x198
    int unk103;            //0x19C
    int unk104;            //0x1A0
    int unk105;            //0x1A4
    int unk106;            //0x1A8
    int unk107;            //0x1AC
    int unk108;            //0x1B0
    int unk109;            //0x1B4
    int unk110;            //0x1B8
    int unk111;            //0x1BC
    int unk112;            //0x1C0
    int unk113;            //0x1C4
    int unk114;            //0x1C8
    int unk115;            //0x1CC
    int unk116;            //0x1D0
    int unk117;            //0x1D4
    int unk118;            //0x1D8
    int unk119;            //0x1DC
    int unk120;            //0x1E0
    int unk121;            //0x1E4
    int unk122;            //0x1E8
    int unk123;            //0x1EC
    int unk124;            //0x1F0
    int unk125;            //0x1F4
    int unk126;            //0x1F8
    int unk127;            //0x1FC
    int unk128;            //0x200
    int unk129;            //0x204
    int unk130;            //0x208
    int unk131;            //0x20C
    int unk132;            //0x210
    int unk133;            //0x214
    int unk134;            //0x218
    int unk135;            //0x21C
    int unk136;            //0x220
    int unk137;            //0x224
    int unk138;            //0x228
    int unk139;            //0x22C
    int unk140;            //0x230
    int unk141;            //0x234
    int unk142;            //0x238
    int unk143;            //0x23C
    int unk144;            //0x240
    int unk145;            //0x244
    int unk146;            //0x248
    int unk147;            //0x24C
    int unk148;            //0x250
    int unk149;            //0x254
    int unk150;            //0x258
    int unk151;            //0x25C
    int unk152;            //0x260
    int unk153;            //0x264
    int unk154;            //0x268
    int unk155;            //0x26C
    int unk156;            //0x270
    int unk157;            //0x274
    int unk158;            //0x278
    int unk159;            //0x27C
    int unk160;            //0x280
    int unk161;            //0x284
    int unk162;            //0x288
    int unk163;            //0x28C
    int unk164;            //0x290
    int unk165;            //0x294
    int unk166;            //0x298
    int unk167;            //0x29C
    int unk168;            //0x2A0
    int unk169;            //0x2A4
    int unk170;            //0x2A8
    int unk171;            //0x2AC
    int unk172;            //0x2B0
    int unk173;            //0x2B4
    int unk174;            //0x2B8
    int unk175;            //0x2BC
    int unk176;            //0x2C0
    int unk177;            //0x2C4
    int unk178;            //0x2C8
    int unk179;            //0x2CC
    int unk180;            //0x2D0
    int unk181;            //0x2D4
    int unk182;            //0x2D8
    int unk183;            //0x2DC
    int unk184;            //0x2E0
    int unk185;            //0x2E4
    int unk186;            //0x2E8
    int unk187;            //0x2EC
    int unk188;            //0x2F0
    int unk189;            //0x2F4
    int unk190;            //0x2F8
    int unk191;            //0x2FC
    int unk192;            //0x300
    int unk193;            //0x304
    int unk194;            //0x308
    int unk195;            //0x30C
    int unk196;            //0x310
    int unk197;            //0x314
    int unk198;            //0x318
    int unk199;            //0x31C
    int unk200;            //0x320
    int unk201;            //0x324
    int unk202;            //0x328
    int unk203;            //0x32C
    int unk204;            //0x330
    int unk205;            //0x334
    int unk206;            //0x338
    int unk207;            //0x33C
    int unk208;            //0x340
    int unk209;            //0x344
    int unk210;            //0x348
    int unk211;            //0x34C
    int unk212;            //0x350
    int unk213;            //0x354
    int unk214;            //0x358
    int unk215;            //0x35C
    int unk216;            //0x360
    int unk217;            //0x364
    int unk218;            //0x368
    int unk219;            //0x36C
    int unk220;            //0x370
    int unk221;            //0x374
    int unk222;            //0x378
    int unk223;            //0x37C
    int unk224;            //0x380
    int unk225;            //0x384
    int unk226;            //0x388
    int unk227;            //0x38C
    int unk228;            //0x390
    int unk229;            //0x394
    int unk230;            //0x398
    int unk231;            //0x39C
    int unk232;            //0x3A0
    int unk233;            //0x3A4
    int unk234;            //0x3A8
    int unk235;            //0x3AC
    int unk236;            //0x3B0
    int unk237;            //0x3B4
    int unk238;            //0x3B8
    int unk239;            //0x3BC
    int unk240;            //0x3C0
    int unk241;            //0x3C4
    int unk242;            //0x3C8
    int unk243;            //0x3CC
    int unk244;            //0x3D0
    int unk245;            //0x3D4
    int unk246;            //0x3D8
    int unk247;            //0x3DC
    int unk248;            //0x3E0
    int unk249;            //0x3E4
    int unk250;            //0x3E8
    int unk251;            //0x3EC
    int unk252;            //0x3F0
    int unk253;            //0x3F4
    int unk254;            //0x3F8
    int unk255;            //0x3FC
    int unk256;            //0x400
    int unk257;            //0x404
    int unk258;            //0x408
    int unk259;            //0x40C
    int unk260;            //0x410
    int unk261;            //0x414
    int unk262;            //0x418
    int unk263;            //0x41C
    int unk264;            //0x420
    int unk265;            //0x424
    int unk266;            //0x428
    int unk267;            //0x42C
    int unk268;            //0x430
    int unk269;            //0x434
    int unk270;            //0x438
    int unk271;            //0x43C
    int unk272;            //0x440
    int unk273;            //0x444
    int unk274;            //0x448
    int unk275;            //0x44C
    int unk276;            //0x450
    int unk277;            //0x454
    int unk278;            //0x458
    int unk279;            //0x45C
    int unk280;            //0x460
    int unk281;            //0x464
    int unk282;            //0x468
    int unk283;            //0x46C
    int unk284;            //0x470
    int unk285;            //0x474
    int unk286;            //0x478
    int unk287;            //0x47C
    int unk288;            //0x480
    int unk289;            //0x484
    int unk290;            //0x488
    int unk291;            //0x48C
    int unk292;            //0x490
    int unk293;            //0x494
    int unk294;            //0x498
    int unk295;            //0x49C
    int unk296;            //0x4A0
    int unk297;            //0x4A4
    int unk298;            //0x4A8
    int unk299;            //0x4AC
    int unk300;            //0x4B0
    int unk301;            //0x4B4
    int unk302;            //0x4B8
    int unk303;            //0x4BC
    int unk304;            //0x4C0
    int unk305;            //0x4C4
    int unk306;            //0x4C8
    int unk307;            //0x4CC
    int unk308;            //0x4D0
    int unk309;            //0x4D4
    int unk310;            //0x4D8
    int unk311;            //0x4DC
    int unk312;            //0x4E0
    int unk313;            //0x4E4
    int unk314;            //0x4E8
    int unk315;            //0x4EC
    int unk316;            //0x4F0
    int unk317;            //0x4F4
    int unk318;            //0x4F8
    int unk319;            //0x4FC
    int unk320;            //0x500
    int unk321;            //0x504
    int unk322;            //0x508
    int unk323;            //0x50C
    int unk324;            //0x510
    int unk325;            //0x514
    int unk326;            //0x518
    int unk327;            //0x51C
    int unk328;            //0x520
    int unk329;            //0x524
    int unk330;            //0x528
    int unk331;            //0x52C
    CSSBackup EventBackup; //0x530
    int unk335;            //0x53C
    int unk336;            //0x540
    int unk337;            //0x544
    int unk338;            //0x548
    int unk339;            //0x54C
    int unk340;            //0x550
    int unk341;            //0x554
    int unk342;            //0x558
    int unk343;            //0x55C
    int unk344;            //0x560
    int unk345;            //0x564
    int unk346;            //0x568
    int unk347;            //0x56C
    int unk348;            //0x570
    int unk349;            //0x574
    int unk350;            //0x578
    int unk351;            //0x57C
    int unk352;            //0x580
    int unk353;            //0x584
    int unk354;            //0x588
    int unk355;            //0x58C
    int unk356;            //0x590
    int unk357;            //0x594
    int unk358;            //0x598
    int unk359;            //0x59C
    int unk360;            //0x5A0
    int unk361;            //0x5A4
    int unk362;            //0x5A8
    int unk363;            //0x5AC
    int unk364;            //0x5B0
    int unk365;            //0x5B4
    int unk366;            //0x5B8
    int unk367;            //0x5BC
    int unk368;            //0x5C0
    int unk369;            //0x5C4
    int unk370;            //0x5C8
    int unk371;            //0x5CC
    int unk372;            //0x5D0
    int unk373;            //0x5D4
    int unk374;            //0x5D8
    int unk375;            //0x5DC
    int unk376;            //0x5E0
    int unk377;            //0x5E4
    int unk378;            //0x5E8
    int unk379;            //0x5EC
    int unk380;            //0x5F0
    int unk381;            //0x5F4
    int unk382;            //0x5F8
    int unk383;            //0x5FC
    int unk384;            //0x600
    int unk385;            //0x604
    int unk386;            //0x608
    int unk387;            //0x60C
    int unk388;            //0x610
    int unk389;            //0x614
    int unk390;            //0x618
    int unk391;            //0x61C
    int unk392;            //0x620
    int unk393;            //0x624
    int unk394;            //0x628
    int unk395;            //0x62C
    int unk396;            //0x630
    int unk397;            //0x634
    int unk398;            //0x638
    int unk399;            //0x63C
    int unk400;            //0x640
    int unk401;            //0x644
    int unk402;            //0x648
    int unk403;            //0x64C
    int unk404;            //0x650
    int unk405;            //0x654
    int unk406;            //0x658
    int unk407;            //0x65C
    int unk408;            //0x660
    int unk409;            //0x664
    int unk410;            //0x668
    int unk411;            //0x66C
    int unk412;            //0x670
    int unk413;            //0x674
    int unk414;            //0x678
    int unk415;            //0x67C
    int unk416;            //0x680
    int unk417;            //0x684
    int unk418;            //0x688
    int unk419;            //0x68C
    int unk420;            //0x690
    int unk421;            //0x694
    int unk422;            //0x698
    int unk423;            //0x69C
    int unk424;            //0x6A0
    int unk425;            //0x6A4
    int unk426;            //0x6A8
    int unk427;            //0x6AC
    int unk428;            //0x6B0
    int unk429;            //0x6B4
    int unk430;            //0x6B8
    int unk431;            //0x6BC
    int unk432;            //0x6C0
    int unk433;            //0x6C4
    int unk434;            //0x6C8
    int unk435;            //0x6CC
    int unk436;            //0x6D0
    int unk437;            //0x6D4
    int unk438;            //0x6D8
    int unk439;            //0x6DC
    int unk440;            //0x6E0
    int unk441;            //0x6E4
    int unk442;            //0x6E8
    int unk443;            //0x6EC
    int unk444;            //0x6F0
    int unk445;            //0x6F4
    int unk446;            //0x6F8
    int unk447;            //0x6FC
    int unk448;            //0x700
    int unk449;            //0x704
    int unk450;            //0x708
    int unk451;            //0x70C
    int unk452;            //0x710
    int unk453;            //0x714
    int unk454;            //0x718
    int unk455;            //0x71C
    int unk456;            //0x720
    int unk457;            //0x724
    int unk458;            //0x728
    int unk459;            //0x72C
    int unk460;            //0x730
    int unk461;            //0x734
    int unk462;            //0x738
    int unk463;            //0x73C
    int unk464;            //0x740
    int unk465;            //0x744
    int unk466;            //0x748
    int unk467;            //0x74C
    int unk468;            //0x750
    int unk469;            //0x754
    int unk470;            //0x758
    int unk471;            //0x75C
    int unk472;            //0x760
    int unk473;            //0x764
    int unk474;            //0x768
    int unk475;            //0x76C
    int unk476;            //0x770
    int unk477;            //0x774
    int unk478;            //0x778
    int unk479;            //0x77C
    int unk480;            //0x780
    int unk481;            //0x784
    int unk482;            //0x788
    int unk483;            //0x78C
    int unk484;            //0x790
    int unk485;            //0x794
    int unk486;            //0x798
    int unk487;            //0x79C
    int unk488;            //0x7A0
    int unk489;            //0x7A4
    int unk490;            //0x7A8
    int unk491;            //0x7AC
    int unk492;            //0x7B0
    int unk493;            //0x7B4
    int unk494;            //0x7B8
    int unk495;            //0x7BC
    int unk496;            //0x7C0
    int unk497;            //0x7C4
    int unk498;            //0x7C8
    int unk499;            //0x7CC
    int unk500;            //0x7D0
    int unk501;            //0x7D4
    int unk502;            //0x7D8
    int unk503;            //0x7DC
    int unk504;            //0x7E0
    int unk505;            //0x7E4
    int unk506;            //0x7E8
    int unk507;            //0x7EC
    int unk508;            //0x7F0
    int unk509;            //0x7F4
    int unk510;            //0x7F8
    int unk511;            //0x7FC
    int unk512;            //0x800
    int unk513;            //0x804
    int unk514;            //0x808
    int unk515;            //0x80C
    int unk516;            //0x810
    int unk517;            //0x814
    int unk518;            //0x818
    int unk519;            //0x81C
    int unk520;            //0x820
    int unk521;            //0x824
    int unk522;            //0x828
    int unk523;            //0x82C
    int unk524;            //0x830
    int unk525;            //0x834
    int unk526;            //0x838
    int unk527;            //0x83C
    int unk528;            //0x840
    int unk529;            //0x844
    int unk530;            //0x848
    int unk531;            //0x84C
    int unk532;            //0x850
    int unk533;            //0x854
    int unk534;            //0x858
    int unk535;            //0x85C
    int unk536;            //0x860
    int unk537;            //0x864
    int unk538;            //0x868
    int unk539;            //0x86C
    int unk540;            //0x870
    int unk541;            //0x874
    int unk542;            //0x878
    int unk543;            //0x87C
    int unk544;            //0x880
    int unk545;            //0x884
    int unk546;            //0x888
    int unk547;            //0x88C
    int unk548;            //0x890
    int unk549;            //0x894
    int unk550;            //0x898
    int unk551;            //0x89C
    int unk552;            //0x8A0
    int unk553;            //0x8A4
    int unk554;            //0x8A8
    int unk555;            //0x8AC
    int unk556;            //0x8B0
    int unk557;            //0x8B4
    int unk558;            //0x8B8
    int unk559;            //0x8BC
    int unk560;            //0x8C0
    int unk561;            //0x8C4
    int unk562;            //0x8C8
    int unk563;            //0x8CC
    int unk564;            //0x8D0
    int unk565;            //0x8D4
    int unk566;            //0x8D8
    int unk567;            //0x8DC
    int unk568;            //0x8E0
    int unk569;            //0x8E4
    int unk570;            //0x8E8
    int unk571;            //0x8EC
    int unk572;            //0x8F0
    int unk573;            //0x8F4
    int unk574;            //0x8F8
    int unk575;            //0x8FC
    int unk576;            //0x900
    int unk577;            //0x904
    int unk578;            //0x908
    int unk579;            //0x90C
    int unk580;            //0x910
    int unk581;            //0x914
    int unk582;            //0x918
    int unk583;            //0x91C
    int unk584;            //0x920
    int unk585;            //0x924
    int unk586;            //0x928
    int unk587;            //0x92C
    int unk588;            //0x930
    int unk589;            //0x934
    int unk590;            //0x938
    int unk591;            //0x93C
    int unk592;            //0x940
    int unk593;            //0x944
    int unk594;            //0x948
    int unk595;            //0x94C
    int unk596;            //0x950
    int unk597;            //0x954
    int unk598;            //0x958
    int unk599;            //0x95C
    int unk600;            //0x960
    int unk601;            //0x964
    int unk602;            //0x968
    int unk603;            //0x96C
    int unk604;            //0x970
    int unk605;            //0x974
    int unk606;            //0x978
    int unk607;            //0x97C
    int unk608;            //0x980
    int unk609;            //0x984
    int unk610;            //0x988
    int unk611;            //0x98C
    int unk612;            //0x990
    int unk613;            //0x994
    int unk614;            //0x998
    int unk615;            //0x99C
    int unk616;            //0x9A0
    int unk617;            //0x9A4
    int unk618;            //0x9A8
    int unk619;            //0x9AC
    int unk620;            //0x9B0
    int unk621;            //0x9B4
    int unk622;            //0x9B8
    int unk623;            //0x9BC
    int unk624;            //0x9C0
    int unk625;            //0x9C4
    int unk626;            //0x9C8
    int unk627;            //0x9CC
    int unk628;            //0x9D0
    int unk629;            //0x9D4
    int unk630;            //0x9D8
    int unk631;            //0x9DC
    int unk632;            //0x9E0
    int unk633;            //0x9E4
    int unk634;            //0x9E8
    int unk635;            //0x9EC
    int unk636;            //0x9F0
    int unk637;            //0x9F4
    int unk638;            //0x9F8
    int unk639;            //0x9FC
    int unk640;            //0xA00
    int unk641;            //0xA04
    int unk642;            //0xA08
    int unk643;            //0xA0C
    int unk644;            //0xA10
    int unk645;            //0xA14
    int unk646;            //0xA18
    int unk647;            //0xA1C
    int unk648;            //0xA20
    int unk649;            //0xA24
    int unk650;            //0xA28
    int unk651;            //0xA2C
    int unk652;            //0xA30
    int unk653;            //0xA34
    int unk654;            //0xA38
    int unk655;            //0xA3C
    int unk656;            //0xA40
    int unk657;            //0xA44
    int unk658;            //0xA48
    int unk659;            //0xA4C
    int unk660;            //0xA50
    int unk661;            //0xA54
    int unk662;            //0xA58
    int unk663;            //0xA5C
    int unk664;            //0xA60
    int unk665;            //0xA64
    int unk666;            //0xA68
    int unk667;            //0xA6C
    int unk668;            //0xA70
    int unk669;            //0xA74
    int unk670;            //0xA78
    int unk671;            //0xA7C
    int unk672;            //0xA80
    int unk673;            //0xA84
    int unk674;            //0xA88
    int unk675;            //0xA8C
    int unk676;            //0xA90
    int unk677;            //0xA94
    int unk678;            //0xA98
    int unk679;            //0xA9C
    int unk680;            //0xAA0
    int unk681;            //0xAA4
    int unk682;            //0xAA8
    int unk683;            //0xAAC
    int unk684;            //0xAB0
    int unk685;            //0xAB4
    int unk686;            //0xAB8
    int unk687;            //0xABC
    int unk688;            //0xAC0
    int unk689;            //0xAC4
    int unk690;            //0xAC8
    int unk691;            //0xACC
    int unk692;            //0xAD0
    int unk693;            //0xAD4
    int unk694;            //0xAD8
    int unk695;            //0xADC
    int unk696;            //0xAE0
    int unk697;            //0xAE4
    int unk698;            //0xAE8
    int unk699;            //0xAEC
    int unk700;            //0xAF0
    int unk701;            //0xAF4
    int unk702;            //0xAF8
    int unk703;            //0xAFC
    int unk704;            //0xB00
    int unk705;            //0xB04
    int unk706;            //0xB08
    int unk707;            //0xB0C
    int unk708;            //0xB10
    int unk709;            //0xB14
    int unk710;            //0xB18
    int unk711;            //0xB1C
    int unk712;            //0xB20
    int unk713;            //0xB24
    int unk714;            //0xB28
    int unk715;            //0xB2C
    int unk716;            //0xB30
    int unk717;            //0xB34
    int unk718;            //0xB38
    int unk719;            //0xB3C
    int unk720;            //0xB40
    int unk721;            //0xB44
    int unk722;            //0xB48
    int unk723;            //0xB4C
    int unk724;            //0xB50
    int unk725;            //0xB54
    int unk726;            //0xB58
    int unk727;            //0xB5C
    int unk728;            //0xB60
    int unk729;            //0xB64
    int unk730;            //0xB68
    int unk731;            //0xB6C
    int unk732;            //0xB70
    int unk733;            //0xB74
    int unk734;            //0xB78
    int unk735;            //0xB7C
    int unk736;            //0xB80
    int unk737;            //0xB84
    int unk738;            //0xB88
    int unk739;            //0xB8C
    int unk740;            //0xB90
    int unk741;            //0xB94
    int unk742;            //0xB98
    int unk743;            //0xB9C
    int unk744;            //0xBA0
    int unk745;            //0xBA4
    int unk746;            //0xBA8
    int unk747;            //0xBAC
    int unk748;            //0xBB0
    int unk749;            //0xBB4
    int unk750;            //0xBB8
    int unk751;            //0xBBC
    int unk752;            //0xBC0
    int unk753;            //0xBC4
    int unk754;            //0xBC8
    int unk755;            //0xBCC
    int unk756;            //0xBD0
    int unk757;            //0xBD4
    int unk758;            //0xBD8
    int unk759;            //0xBDC
    int unk760;            //0xBE0
    int unk761;            //0xBE4
    int unk762;            //0xBE8
    int unk763;            //0xBEC
    int unk764;            //0xBF0
    int unk765;            //0xBF4
    int unk766;            //0xBF8
    int unk767;            //0xBFC
    int unk768;            //0xC00
    int unk769;            //0xC04
    int unk770;            //0xC08
    int unk771;            //0xC0C
    int unk772;            //0xC10
    int unk773;            //0xC14
    int unk774;            //0xC18
    int unk775;            //0xC1C
    int unk776;            //0xC20
    int unk777;            //0xC24
    int unk778;            //0xC28
    int unk779;            //0xC2C
    int unk780;            //0xC30
    int unk781;            //0xC34
    int unk782;            //0xC38
    int unk783;            //0xC3C
    int unk784;            //0xC40
    int unk785;            //0xC44
    int unk786;            //0xC48
    int unk787;            //0xC4C
    int unk788;            //0xC50
    int unk789;            //0xC54
    int unk790;            //0xC58
    int unk791;            //0xC5C
    int unk792;            //0xC60
    int unk793;            //0xC64
    int unk794;            //0xC68
    int unk795;            //0xC6C
    int unk796;            //0xC70
    int unk797;            //0xC74
    int unk798;            //0xC78
    int unk799;            //0xC7C
    int unk800;            //0xC80
    int unk801;            //0xC84
    int unk802;            //0xC88
    int unk803;            //0xC8C
    int unk804;            //0xC90
    int unk805;            //0xC94
    int unk806;            //0xC98
    int unk807;            //0xC9C
    int unk808;            //0xCA0
    int unk809;            //0xCA4
    int unk810;            //0xCA8
    int unk811;            //0xCAC
    int unk812;            //0xCB0
    int unk813;            //0xCB4
    int unk814;            //0xCB8
    int unk815;            //0xCBC
    int unk816;            //0xCC0
    int unk817;            //0xCC4
    int unk818;            //0xCC8
    int unk819;            //0xCCC
    int unk820;            //0xCD0
    int unk821;            //0xCD4
    int unk822;            //0xCD8
    int unk823;            //0xCDC
    int unk824;            //0xCE0
    int unk825;            //0xCE4
    int unk826;            //0xCE8
    int unk827;            //0xCEC
    int unk828;            //0xCF0
    int unk829;            //0xCF4
    int unk830;            //0xCF8
    int unk831;            //0xCFC
    int unk832;            //0xD00
    int unk833;            //0xD04
    int unk834;            //0xD08
    int unk835;            //0xD0C
    int unk836;            //0xD10
    int unk837;            //0xD14
    int unk838;            //0xD18
    int unk839;            //0xD1C
    int unk840;            //0xD20
    int unk841;            //0xD24
    int unk842;            //0xD28
    int unk843;            //0xD2C
    int unk844;            //0xD30
    int unk845;            //0xD34
    int unk846;            //0xD38
    int unk847;            //0xD3C
    int unk848;            //0xD40
    int unk849;            //0xD44
    int unk850;            //0xD48
    int unk851;            //0xD4C
    int unk852;            //0xD50
    int unk853;            //0xD54
    int unk854;            //0xD58
    int unk855;            //0xD5C
    int unk856;            //0xD60
    int unk857;            //0xD64
    int unk858;            //0xD68
    int unk859;            //0xD6C
    int unk860;            //0xD70
    int unk861;            //0xD74
    int unk862;            //0xD78
    int unk863;            //0xD7C
    int unk864;            //0xD80
    int unk865;            //0xD84
    int unk866;            //0xD88
    int unk867;            //0xD8C
    int unk868;            //0xD90
    int unk869;            //0xD94
    int unk870;            //0xD98
    int unk871;            //0xD9C
    int unk872;            //0xDA0
    int unk873;            //0xDA4
    int unk874;            //0xDA8
    int unk875;            //0xDAC
    int unk876;            //0xDB0
    int unk877;            //0xDB4
    int unk878;            //0xDB8
    int unk879;            //0xDBC
    int unk880;            //0xDC0
    int unk881;            //0xDC4
    int unk882;            //0xDC8
    int unk883;            //0xDCC
    int unk884;            //0xDD0
    int unk885;            //0xDD4
    int unk886;            //0xDD8
    int unk887;            //0xDDC
    int unk888;            //0xDE0
    int unk889;            //0xDE4
    int unk890;            //0xDE8
    int unk891;            //0xDEC
    int unk892;            //0xDF0
    int unk893;            //0xDF4
    int unk894;            //0xDF8
    int unk895;            //0xDFC
    int unk896;            //0xE00
    int unk897;            //0xE04
    int unk898;            //0xE08
    int unk899;            //0xE0C
    int unk900;            //0xE10
    int unk901;            //0xE14
    int unk902;            //0xE18
    int unk903;            //0xE1C
    int unk904;            //0xE20
    int unk905;            //0xE24
    int unk906;            //0xE28
    int unk907;            //0xE2C
    int unk908;            //0xE30
    int unk909;            //0xE34
    int unk910;            //0xE38
    int unk911;            //0xE3C
    int unk912;            //0xE40
    int unk913;            //0xE44
    int unk914;            //0xE48
    int unk915;            //0xE4C
    int unk916;            //0xE50
    int unk917;            //0xE54
    int unk918;            //0xE58
    int unk919;            //0xE5C
    int unk920;            //0xE60
    int unk921;            //0xE64
    int unk922;            //0xE68
    int unk923;            //0xE6C
    int unk924;            //0xE70
    int unk925;            //0xE74
    int unk926;            //0xE78
    int unk927;            //0xE7C
    int unk928;            //0xE80
    int unk929;            //0xE84
    int unk930;            //0xE88
    int unk931;            //0xE8C
    int unk932;            //0xE90
    int unk933;            //0xE94
    int unk934;            //0xE98
    int unk935;            //0xE9C
    int unk936;            //0xEA0
    int unk937;            //0xEA4
    int unk938;            //0xEA8
    int unk939;            //0xEAC
    int unk940;            //0xEB0
    int unk941;            //0xEB4
    int unk942;            //0xEB8
    int unk943;            //0xEBC
    int unk944;            //0xEC0
    int unk945;            //0xEC4
    int unk946;            //0xEC8
    int unk947;            //0xECC
    int unk948;            //0xED0
    int unk949;            //0xED4
    int unk950;            //0xED8
    int unk951;            //0xEDC
    int unk952;            //0xEE0
    int unk953;            //0xEE4
    int unk954;            //0xEE8
    int unk955;            //0xEEC
    int unk956;            //0xEF0
    int unk957;            //0xEF4
    int unk958;            //0xEF8
    int unk959;            //0xEFC
    int unk960;            //0xF00
    int unk961;            //0xF04
    int unk962;            //0xF08
    int unk963;            //0xF0C
    int unk964;            //0xF10
    int unk965;            //0xF14
    int unk966;            //0xF18
    int unk967;            //0xF1C
    int unk968;            //0xF20
    int unk969;            //0xF24
    int unk970;            //0xF28
    int unk971;            //0xF2C
    int unk972;            //0xF30
    int unk973;            //0xF34
    int unk974;            //0xF38
    int unk975;            //0xF3C
    int unk976;            //0xF40
    int unk977;            //0xF44
    int unk978;            //0xF48
    int unk979;            //0xF4C
    int unk980;            //0xF50
    int unk981;            //0xF54
    int unk982;            //0xF58
    int unk983;            //0xF5C
    int unk984;            //0xF60
    int unk985;            //0xF64
    int unk986;            //0xF68
    int unk987;            //0xF6C
    int unk988;            //0xF70
    int unk989;            //0xF74
    int unk990;            //0xF78
    int unk991;            //0xF7C
    int unk992;            //0xF80
    int unk993;            //0xF84
    int unk994;            //0xF88
    int unk995;            //0xF8C
    int unk996;            //0xF90
    int unk997;            //0xF94
    int unk998;            //0xF98
    int unk999;            //0xF9C
    int unk1000;           //0xFA0
    int unk1001;           //0xFA4
    int unk1002;           //0xFA8
    int unk1003;           //0xFAC
    int unk1004;           //0xFB0
    int unk1005;           //0xFB4
    int unk1006;           //0xFB8
    int unk1007;           //0xFBC
    int unk1008;           //0xFC0
    int unk1009;           //0xFC4
    int unk1010;           //0xFC8
    int unk1011;           //0xFCC
    int unk1012;           //0xFD0
    int unk1013;           //0xFD4
    int unk1014;           //0xFD8
    int unk1015;           //0xFDC
    int unk1016;           //0xFE0
    int unk1017;           //0xFE4
    int unk1018;           //0xFE8
    int unk1019;           //0xFEC
    int unk1020;           //0xFF0
    int unk1021;           //0xFF4
    int unk1022;           //0xFF8
    int unk1023;           //0xFFC
    int unk1024;           //0x1000
    int unk1025;           //0x1004
    int unk1026;           //0x1008
    int unk1027;           //0x100C
    int unk1028;           //0x1010
    int unk1029;           //0x1014
    int unk1030;           //0x1018
    int unk1031;           //0x101C
    int unk1032;           //0x1020
    int unk1033;           //0x1024
    int unk1034;           //0x1028
    int unk1035;           //0x102C
    int unk1036;           //0x1030
    int unk1037;           //0x1034
    int unk1038;           //0x1038
    int unk1039;           //0x103C
    int unk1040;           //0x1040
    int unk1041;           //0x1044
    int unk1042;           //0x1048
    int unk1043;           //0x104C
    int unk1044;           //0x1050
    int unk1045;           //0x1054
    int unk1046;           //0x1058
    int unk1047;           //0x105C
    int unk1048;           //0x1060
    int unk1049;           //0x1064
    int unk1050;           //0x1068
    int unk1051;           //0x106C
    int unk1052;           //0x1070
    int unk1053;           //0x1074
    int unk1054;           //0x1078
    int unk1055;           //0x107C
    int unk1056;           //0x1080
    int unk1057;           //0x1084
    int unk1058;           //0x1088
    int unk1059;           //0x108C
    int unk1060;           //0x1090
    int unk1061;           //0x1094
    int unk1062;           //0x1098
    int unk1063;           //0x109C
    int unk1064;           //0x10A0
    int unk1065;           //0x10A4
    int unk1066;           //0x10A8
    int unk1067;           //0x10AC
    int unk1068;           //0x10B0
    int unk1069;           //0x10B4
    int unk1070;           //0x10B8
    int unk1071;           //0x10BC
    int unk1072;           //0x10C0
    int unk1073;           //0x10C4
    int unk1074;           //0x10C8
    int unk1075;           //0x10CC
    int unk1076;           //0x10D0
    int unk1077;           //0x10D4
    int unk1078;           //0x10D8
    int unk1079;           //0x10DC
    int unk1080;           //0x10E0
    int unk1081;           //0x10E4
    int unk1082;           //0x10E8
    int unk1083;           //0x10EC
    int unk1084;           //0x10F0
    int unk1085;           //0x10F4
    int unk1086;           //0x10F8
    int unk1087;           //0x10FC
    int unk1088;           //0x1100
    int unk1089;           //0x1104
    int unk1090;           //0x1108
    int unk1091;           //0x110C
    int unk1092;           //0x1110
    int unk1093;           //0x1114
    int unk1094;           //0x1118
    int unk1095;           //0x111C
    int unk1096;           //0x1120
    int unk1097;           //0x1124
    int unk1098;           //0x1128
    int unk1099;           //0x112C
    int unk1100;           //0x1130
    int unk1101;           //0x1134
    int unk1102;           //0x1138
    int unk1103;           //0x113C
    int unk1104;           //0x1140
    int unk1105;           //0x1144
    int unk1106;           //0x1148
    int unk1107;           //0x114C
    int unk1108;           //0x1150
    int unk1109;           //0x1154
    int unk1110;           //0x1158
    int unk1111;           //0x115C
    int unk1112;           //0x1160
    int unk1113;           //0x1164
    int unk1114;           //0x1168
    int unk1115;           //0x116C
    int unk1116;           //0x1170
    int unk1117;           //0x1174
    int unk1118;           //0x1178
    int unk1119;           //0x117C
    int unk1120;           //0x1180
    int unk1121;           //0x1184
    int unk1122;           //0x1188
    int unk1123;           //0x118C
    int unk1124;           //0x1190
    int unk1125;           //0x1194
    int unk1126;           //0x1198
    int unk1127;           //0x119C
    int unk1128;           //0x11A0
    int unk1129;           //0x11A4
    int unk1130;           //0x11A8
    int unk1131;           //0x11AC
    int unk1132;           //0x11B0
    int unk1133;           //0x11B4
    int unk1134;           //0x11B8
    int unk1135;           //0x11BC
    int unk1136;           //0x11C0
    int unk1137;           //0x11C4
    int unk1138;           //0x11C8
    int unk1139;           //0x11CC
    int unk1140;           //0x11D0
    int unk1141;           //0x11D4
    int unk1142;           //0x11D8
    int unk1143;           //0x11DC
    int unk1144;           //0x11E0
    int unk1145;           //0x11E4
    int unk1146;           //0x11E8
    int unk1147;           //0x11EC
    int unk1148;           //0x11F0
    int unk1149;           //0x11F4
    int unk1150;           //0x11F8
    int unk1151;           //0x11FC
    int unk1152;           //0x1200
    int unk1153;           //0x1204
    int unk1154;           //0x1208
    int unk1155;           //0x120C
    int unk1156;           //0x1210
    int unk1157;           //0x1214
    int unk1158;           //0x1218
    int unk1159;           //0x121C
    int unk1160;           //0x1220
    int unk1161;           //0x1224
    int unk1162;           //0x1228
    int unk1163;           //0x122C
    int unk1164;           //0x1230
    int unk1165;           //0x1234
    int unk1166;           //0x1238
    int unk1167;           //0x123C
    int unk1168;           //0x1240
    int unk1169;           //0x1244
    int unk1170;           //0x1248
    int unk1171;           //0x124C
    int unk1172;           //0x1250
    int unk1173;           //0x1254
    int unk1174;           //0x1258
    int unk1175;           //0x125C
    int unk1176;           //0x1260
    int unk1177;           //0x1264
    int unk1178;           //0x1268
    int unk1179;           //0x126C
    int unk1180;           //0x1270
    int unk1181;           //0x1274
    int unk1182;           //0x1278
    int unk1183;           //0x127C
    int unk1184;           //0x1280
    int unk1185;           //0x1284
    int unk1186;           //0x1288
    int unk1187;           //0x128C
    int unk1188;           //0x1290
    int unk1189;           //0x1294
    int unk1190;           //0x1298
    int unk1191;           //0x129C
    int unk1192;           //0x12A0
    int unk1193;           //0x12A4
    int unk1194;           //0x12A8
    int unk1195;           //0x12AC
    int unk1196;           //0x12B0
    int unk1197;           //0x12B4
    int unk1198;           //0x12B8
    int unk1199;           //0x12BC
    int unk1200;           //0x12C0
    int unk1201;           //0x12C4
    int unk1202;           //0x12C8
    int unk1203;           //0x12CC
    int unk1204;           //0x12D0
    int unk1205;           //0x12D4
    int unk1206;           //0x12D8
    int unk1207;           //0x12DC
    int unk1208;           //0x12E0
    int unk1209;           //0x12E4
    int unk1210;           //0x12E8
    int unk1211;           //0x12EC
    int unk1212;           //0x12F0
    int unk1213;           //0x12F4
    int unk1214;           //0x12F8
    int unk1215;           //0x12FC
    int unk1216;           //0x1300
    int unk1217;           //0x1304
    int unk1218;           //0x1308
    int unk1219;           //0x130C
    int unk1220;           //0x1310
    int unk1221;           //0x1314
    int unk1222;           //0x1318
    int unk1223;           //0x131C
    int unk1224;           //0x1320
    int unk1225;           //0x1324
    int unk1226;           //0x1328
    int unk1227;           //0x132C
    int unk1228;           //0x1330
    int unk1229;           //0x1334
    int unk1230;           //0x1338
    int unk1231;           //0x133C
    int unk1232;           //0x1340
    int unk1233;           //0x1344
    int unk1234;           //0x1348
    int unk1235;           //0x134C
    int unk1236;           //0x1350
    int unk1237;           //0x1354
    int unk1238;           //0x1358
    int unk1239;           //0x135C
    int unk1240;           //0x1360
    int unk1241;           //0x1364
    int unk1242;           //0x1368
    int unk1243;           //0x136C
    int unk1244;           //0x1370
    int unk1245;           //0x1374
    int unk1246;           //0x1378
    int unk1247;           //0x137C
    int unk1248;           //0x1380
    int unk1249;           //0x1384
    int unk1250;           //0x1388
    int unk1251;           //0x138C
    int unk1252;           //0x1390
    int unk1253;           //0x1394
    int unk1254;           //0x1398
    int unk1255;           //0x139C
    int unk1256;           //0x13A0
    int unk1257;           //0x13A4
    int unk1258;           //0x13A8
    int unk1259;           //0x13AC
    int unk1260;           //0x13B0
    int unk1261;           //0x13B4
    int unk1262;           //0x13B8
    int unk1263;           //0x13BC
    int unk1264;           //0x13C0
    int unk1265;           //0x13C4
    int unk1266;           //0x13C8
    int unk1267;           //0x13CC
    int unk1268;           //0x13D0
    int unk1269;           //0x13D4
    int unk1270;           //0x13D8
    int unk1271;           //0x13DC
    int unk1272;           //0x13E0
    int unk1273;           //0x13E4
    int unk1274;           //0x13E8
    int unk1275;           //0x13EC
    int unk1276;           //0x13F0
    int unk1277;           //0x13F4
    int unk1278;           //0x13F8
    int unk1279;           //0x13FC
    int unk1280;           //0x1400
    int unk1281;           //0x1404
    int unk1282;           //0x1408
    int unk1283;           //0x140C
    int unk1284;           //0x1410
    int unk1285;           //0x1414
    int unk1286;           //0x1418
    int unk1287;           //0x141C
    int unk1288;           //0x1420
    int unk1289;           //0x1424
    int unk1290;           //0x1428
    int unk1291;           //0x142C
    int unk1292;           //0x1430
    int unk1293;           //0x1434
    int unk1294;           //0x1438
    int unk1295;           //0x143C
    int unk1296;           //0x1440
    int unk1297;           //0x1444
    int unk1298;           //0x1448
    int unk1299;           //0x144C
    int unk1300;           //0x1450
    int unk1301;           //0x1454
    int unk1302;           //0x1458
    int unk1303;           //0x145C
    int unk1304;           //0x1460
    int unk1305;           //0x1464
    int unk1306;           //0x1468
    int unk1307;           //0x146C
    int unk1308;           //0x1470
    int unk1309;           //0x1474
    int unk1310;           //0x1478
    int unk1311;           //0x147C
    int unk1312;           //0x1480
    int unk1313;           //0x1484
    int unk1314;           //0x1488
    int unk1315;           //0x148C
    int unk1316;           //0x1490
    int unk1317;           //0x1494
    int unk1318;           //0x1498
    int unk1319;           //0x149C
    int unk1320;           //0x14A0
    int unk1321;           //0x14A4
    int unk1322;           //0x14A8
    int unk1323;           //0x14AC
    int unk1324;           //0x14B0
    int unk1325;           //0x14B4
    int unk1326;           //0x14B8
    int unk1327;           //0x14BC
    int unk1328;           //0x14C0
    int unk1329;           //0x14C4
    int unk1330;           //0x14C8
    int unk1331;           //0x14CC
    int unk1332;           //0x14D0
    int unk1333;           //0x14D4
    int unk1334;           //0x14D8
    int unk1335;           //0x14DC
    int unk1336;           //0x14E0
    int unk1337;           //0x14E4
    int unk1338;           //0x14E8
    int unk1339;           //0x14EC
    int unk1340;           //0x14F0
    int unk1341;           //0x14F4
    int unk1342;           //0x14F8
    int unk1343;           //0x14FC
    int unk1344;           //0x1500
    int unk1345;           //0x1504
    int unk1346;           //0x1508
    int unk1347;           //0x150C
    int unk1348;           //0x1510
    int unk1349;           //0x1514
    int unk1350;           //0x1518
    int unk1351;           //0x151C
    int unk1352;           //0x1520
    int unk1353;           //0x1524
    int unk1354;           //0x1528
    int unk1355;           //0x152C
    int unk1356;           //0x1530
    int unk1357;           //0x1534
    int unk1358;           //0x1538
    int unk1359;           //0x153C
    int unk1360;           //0x1540
    int unk1361;           //0x1544
    int unk1362;           //0x1548
    int unk1363;           //0x154C
    int unk1364;           //0x1550
    int unk1365;           //0x1554
    int unk1366;           //0x1558
    int unk1367;           //0x155C
    int unk1368;           //0x1560
    int unk1369;           //0x1564
    int unk1370;           //0x1568
    int unk1371;           //0x156C
    int unk1372;           //0x1570
    int unk1373;           //0x1574
    int unk1374;           //0x1578
    int unk1375;           //0x157C
    int unk1376;           //0x1580
    int unk1377;           //0x1584
    int unk1378;           //0x1588
    int unk1379;           //0x158C
    int unk1380;           //0x1590
    int unk1381;           //0x1594
    int unk1382;           //0x1598
    int unk1383;           //0x159C
    int unk1384;           //0x15A0
    int unk1385;           //0x15A4
    int unk1386;           //0x15A8
    int unk1387;           //0x15AC
    int unk1388;           //0x15B0
    int unk1389;           //0x15B4
    int unk1390;           //0x15B8
    int unk1391;           //0x15BC
    int unk1392;           //0x15C0
    int unk1393;           //0x15C4
    int unk1394;           //0x15C8
    int unk1395;           //0x15CC
    int unk1396;           //0x15D0
    int unk1397;           //0x15D4
    int unk1398;           //0x15D8
    int unk1399;           //0x15DC
    int unk1400;           //0x15E0
    int unk1401;           //0x15E4
    int unk1402;           //0x15E8
    int unk1403;           //0x15EC
    int unk1404;           //0x15F0
    int unk1405;           //0x15F4
    int unk1406;           //0x15F8
    int unk1407;           //0x15FC
    int unk1408;           //0x1600
    int unk1409;           //0x1604
    int unk1410;           //0x1608
    int unk1411;           //0x160C
    int unk1412;           //0x1610
    int unk1413;           //0x1614
    int unk1414;           //0x1618
    int unk1415;           //0x161C
    int unk1416;           //0x1620
    int unk1417;           //0x1624
    int unk1418;           //0x1628
    int unk1419;           //0x162C
    int unk1420;           //0x1630
    int unk1421;           //0x1634
    int unk1422;           //0x1638
    int unk1423;           //0x163C
    int unk1424;           //0x1640
    int unk1425;           //0x1644
    int unk1426;           //0x1648
    int unk1427;           //0x164C
    int unk1428;           //0x1650
    int unk1429;           //0x1654
    int unk1430;           //0x1658
    int unk1431;           //0x165C
    int unk1432;           //0x1660
    int unk1433;           //0x1664
    int unk1434;           //0x1668
    int unk1435;           //0x166C
    int unk1436;           //0x1670
    int unk1437;           //0x1674
    int unk1438;           //0x1678
    int unk1439;           //0x167C
    int unk1440;           //0x1680
    int unk1441;           //0x1684
    int unk1442;           //0x1688
    int unk1443;           //0x168C
    int unk1444;           //0x1690
    int unk1445;           //0x1694
    int unk1446;           //0x1698
    int unk1447;           //0x169C
    int unk1448;           //0x16A0
    int unk1449;           //0x16A4
    int unk1450;           //0x16A8
    int unk1451;           //0x16AC
    int unk1452;           //0x16B0
    int unk1453;           //0x16B4
    int unk1454;           //0x16B8
    int unk1455;           //0x16BC
    int unk1456;           //0x16C0
    int unk1457;           //0x16C4
    int unk1458;           //0x16C8
    int unk1459;           //0x16CC
    int unk1460;           //0x16D0
    int unk1461;           //0x16D4
    int unk1462;           //0x16D8
    int unk1463;           //0x16DC
    int unk1464;           //0x16E0
    int unk1465;           //0x16E4
    int unk1466;           //0x16E8
    int unk1467;           //0x16EC
    int unk1468;           //0x16F0
    int unk1469;           //0x16F4
    int unk1470;           //0x16F8
    int unk1471;           //0x16FC
    int unk1472;           //0x1700
    int unk1473;           //0x1704
    int unk1474;           //0x1708
    int unk1475;           //0x170C
    int unk1476;           //0x1710
    int unk1477;           //0x1714
    int unk1478;           //0x1718
    int unk1479;           //0x171C
    int unk1480;           //0x1720
    int unk1481;           //0x1724
    int unk1482;           //0x1728
    int unk1483;           //0x172C
    int unk1484;           //0x1730
    int unk1485;           //0x1734
    int unk1486;           //0x1738
    int unk1487;           //0x173C
    int unk1488;           //0x1740
    int unk1489;           //0x1744
    int unk1490;           //0x1748
    int unk1491;           //0x174C
    int unk1492;           //0x1750
    int unk1493;           //0x1754
    int unk1494;           //0x1758
    int unk1495;           //0x175C
    int unk1496;           //0x1760
    int unk1497;           //0x1764
    int unk1498;           //0x1768
    int unk1499;           //0x176C
    int unk1500;           //0x1770
    int unk1501;           //0x1774
    int unk1502;           //0x1778
    int unk1503;           //0x177C
    int unk1504;           //0x1780
    int unk1505;           //0x1784
    int unk1506;           //0x1788
    int unk1507;           //0x178C
    int unk1508;           //0x1790
    int unk1509;           //0x1794
    int unk1510;           //0x1798
    int unk1511;           //0x179C
    int unk1512;           //0x17A0
    int unk1513;           //0x17A4
    int unk1514;           //0x17A8
    int unk1515;           //0x17AC
    int unk1516;           //0x17B0
    int unk1517;           //0x17B4
    int unk1518;           //0x17B8
    int unk1519;           //0x17BC
    int unk1520;           //0x17C0
    int unk1521;           //0x17C4
    int unk1522;           //0x17C8
    int unk1523;           //0x17CC
    int unk1524;           //0x17D0
    int unk1525;           //0x17D4
    int unk1526;           //0x17D8
    int unk1527;           //0x17DC
    int unk1528;           //0x17E0
    int unk1529;           //0x17E4
    int unk1530;           //0x17E8
    int unk1531;           //0x17EC
    int unk1532;           //0x17F0
    int unk1533;           //0x17F4
    int unk1534;           //0x17F8
    int unk1535;           //0x17FC
    int unk1536;           //0x1800
    int unk1537;           //0x1804
    int unk1538;           //0x1808
    int unk1539;           //0x180C
    int unk1540;           //0x1810
    int unk1541;           //0x1814
    int unk1542;           //0x1818
    int unk1543;           //0x181C
    int unk1544;           //0x1820
    int unk1545;           //0x1824
    int unk1546;           //0x1828
    int unk1547;           //0x182C
    int unk1548;           //0x1830
    int unk1549;           //0x1834
    int unk1550;           //0x1838
    int unk1551;           //0x183C
    int unk1552;           //0x1840
    int unk1553;           //0x1844
    int unk1554;           //0x1848
    int unk1555;           //0x184C
    int unk1556;           //0x1850
    int unk1557;           //0x1854
    int unk1558;           //0x1858
    int unk1559;           //0x185C
    int unk1560;           //0x1860
    int unk1561;           //0x1864
    int unk1562;           //0x1868
    int unk1563;           //0x186C
    int unk1564;           //0x1870
    int unk1565;           //0x1874
    int unk1566;           //0x1878
    int unk1567;           //0x187C
    int unk1568;           //0x1880
    int unk1569;           //0x1884
    int unk1570;           //0x1888
    int unk1571;           //0x188C
    int unk1572;           //0x1890
    int unk1573;           //0x1894
    int unk1574;           //0x1898
    int unk1575;           //0x189C
    int unk1576;           //0x18A0
    int unk1577;           //0x18A4
    int unk1578;           //0x18A8
    int unk1579;           //0x18AC
    int unk1580;           //0x18B0
    int unk1581;           //0x18B4
    int unk1582;           //0x18B8
    int unk1583;           //0x18BC
    int unk1584;           //0x18C0
    int unk1585;           //0x18C4
    int unk1586;           //0x18C8
    int unk1587;           //0x18CC
    int unk1588;           //0x18D0
    int unk1589;           //0x18D4
    int unk1590;           //0x18D8
    int unk1591;           //0x18DC
    int unk1592;           //0x18E0
    int unk1593;           //0x18E4
    int unk1594;           //0x18E8
    int unk1595;           //0x18EC
    int unk1596;           //0x18F0
    int unk1597;           //0x18F4
    int unk1598;           //0x18F8
    int unk1599;           //0x18FC
    int unk1600;           //0x1900
    int unk1601;           //0x1904
    int unk1602;           //0x1908
    int unk1603;           //0x190C
    int unk1604;           //0x1910
    int unk1605;           //0x1914
    int unk1606;           //0x1918
    int unk1607;           //0x191C
    int unk1608;           //0x1920
    int unk1609;           //0x1924
    int unk1610;           //0x1928
    int unk1611;           //0x192C
    int unk1612;           //0x1930
    int unk1613;           //0x1934
    int unk1614;           //0x1938
    int unk1615;           //0x193C
    int unk1616;           //0x1940
    int unk1617;           //0x1944
    int unk1618;           //0x1948
    int unk1619;           //0x194C
    int unk1620;           //0x1950
    int unk1621;           //0x1954
    int unk1622;           //0x1958
    int unk1623;           //0x195C
    int unk1624;           //0x1960
    int unk1625;           //0x1964
    int unk1626;           //0x1968
    int unk1627;           //0x196C
    int unk1628;           //0x1970
    int unk1629;           //0x1974
    int unk1630;           //0x1978
    int unk1631;           //0x197C
    int unk1632;           //0x1980
    int unk1633;           //0x1984
    int unk1634;           //0x1988
    int unk1635;           //0x198C
    int unk1636;           //0x1990
    int unk1637;           //0x1994
    int unk1638;           //0x1998
    int unk1639;           //0x199C
    int unk1640;           //0x19A0
    int unk1641;           //0x19A4
    int unk1642;           //0x19A8
    int unk1643;           //0x19AC
    int unk1644;           //0x19B0
    int unk1645;           //0x19B4
    int unk1646;           //0x19B8
    int unk1647;           //0x19BC
    int unk1648;           //0x19C0
    int unk1649;           //0x19C4
    int unk1650;           //0x19C8
    int unk1651;           //0x19CC
    int unk1652;           //0x19D0
    int unk1653;           //0x19D4
    int unk1654;           //0x19D8
    int unk1655;           //0x19DC
    int unk1656;           //0x19E0
    int unk1657;           //0x19E4
    int unk1658;           //0x19E8
    int unk1659;           //0x19EC
    int unk1660;           //0x19F0
    int unk1661;           //0x19F4
    int unk1662;           //0x19F8
    int unk1663;           //0x19FC
    int unk1664;           //0x1A00
    int unk1665;           //0x1A04
    int unk1666;           //0x1A08
    int unk1667;           //0x1A0C
    int unk1668;           //0x1A10
    int unk1669;           //0x1A14
    int unk1670;           //0x1A18
    int unk1671;           //0x1A1C
    int unk1672;           //0x1A20
    int unk1673;           //0x1A24
    int unk1674;           //0x1A28
    int unk1675;           //0x1A2C
    int unk1676;           //0x1A30
    int unk1677;           //0x1A34
    int unk1678;           //0x1A38
    int unk1679;           //0x1A3C
    int unk1680;           //0x1A40
    int unk1681;           //0x1A44
    int unk1682;           //0x1A48
    int unk1683;           //0x1A4C
    int unk1684;           //0x1A50
    int unk1685;           //0x1A54
    int unk1686;           //0x1A58
    int unk1687;           //0x1A5C
    int unk1688;           //0x1A60
    int unk1689;           //0x1A64
    int unk1690;           //0x1A68
    int unk1691;           //0x1A6C
    int unk1692;           //0x1A70
    int unk1693;           //0x1A74
    int unk1694;           //0x1A78
    int unk1695;           //0x1A7C
    int unk1696;           //0x1A80
    int unk1697;           //0x1A84
    int unk1698;           //0x1A88
    int unk1699;           //0x1A8C
    int unk1700;           //0x1A90
    int unk1701;           //0x1A94
    int unk1702;           //0x1A98
    int unk1703;           //0x1A9C
    int unk1704;           //0x1AA0
    int unk1705;           //0x1AA4
    int unk1706;           //0x1AA8
    int unk1707;           //0x1AAC
    int unk1708;           //0x1AB0
    int unk1709;           //0x1AB4
    int unk1710;           //0x1AB8
    int unk1711;           //0x1ABC
    int unk1712;           //0x1AC0
    int unk1713;           //0x1AC4
    int unk1714;           //0x1AC8
    int unk1715;           //0x1ACC
    int unk1716;           //0x1AD0
    int unk1717;           //0x1AD4
    int unk1718;           //0x1AD8
    int unk1719;           //0x1ADC
    int unk1720;           //0x1AE0
    int unk1721;           //0x1AE4
    int unk1722;           //0x1AE8
    int unk1723;           //0x1AEC
    int unk1724;           //0x1AF0
    int unk1725;           //0x1AF4
    int unk1726;           //0x1AF8
    int unk1727;           //0x1AFC
    int unk1728;           //0x1B00
    int unk1729;           //0x1B04
    int unk1730;           //0x1B08
    int unk1731;           //0x1B0C
    int unk1732;           //0x1B10
    int unk1733;           //0x1B14
    int unk1734;           //0x1B18
    int unk1735;           //0x1B1C
    int unk1736;           //0x1B20
    int unk1737;           //0x1B24
    int unk1738;           //0x1B28
    int unk1739;           //0x1B2C
    int unk1740;           //0x1B30
    int unk1741;           //0x1B34
    int unk1742;           //0x1B38
    int unk1743;           //0x1B3C
    int unk1744;           //0x1B40
    int unk1745;           //0x1B44
    int unk1746;           //0x1B48
    int unk1747;           //0x1B4C
    int unk1748;           //0x1B50
    int unk1749;           //0x1B54
    int unk1750;           //0x1B58
    int unk1751;           //0x1B5C
    int unk1752;           //0x1B60
    int unk1753;           //0x1B64
    int unk1754;           //0x1B68
    int unk1755;           //0x1B6C
    int unk1756;           //0x1B70
    int unk1757;           //0x1B74
    int unk1758;           //0x1B78
    int unk1759;           //0x1B7C
    int unk1760;           //0x1B80
    int unk1761;           //0x1B84
    int unk1762;           //0x1B88
    int unk1763;           //0x1B8C
    int unk1764;           //0x1B90
    int unk1765;           //0x1B94
    int unk1766;           //0x1B98
    int unk1767;           //0x1B9C
    int unk1768;           //0x1BA0
    int unk1769;           //0x1BA4
    int unk1770;           //0x1BA8
    int unk1771;           //0x1BAC
    int unk1772;           //0x1BB0
    int unk1773;           //0x1BB4
    int unk1774;           //0x1BB8
    int unk1775;           //0x1BBC
    int unk1776;           //0x1BC0
    int unk1777;           //0x1BC4
    int unk1778;           //0x1BC8
    int unk1779;           //0x1BCC
    int unk1780;           //0x1BD0
    int unk1781;           //0x1BD4
    int unk1782;           //0x1BD8
    int unk1783;           //0x1BDC
    int unk1784;           //0x1BE0
    int unk1785;           //0x1BE4
    int unk1786;           //0x1BE8
    int unk1787;           //0x1BEC
    int unk1788;           //0x1BF0
    int unk1789;           //0x1BF4
    int unk1790;           //0x1BF8
    int unk1791;           //0x1BFC
    int unk1792;           //0x1C00
    int unk1793;           //0x1C04
    int unk1794;           //0x1C08
    int unk1795;           //0x1C0C
    int unk1796;           //0x1C10
    int unk1797;           //0x1C14
    int unk1798;           //0x1C18
    int unk1799;           //0x1C1C
    int unk1800;           //0x1C20
    int unk1801;           //0x1C24
    int unk1802;           //0x1C28
    int unk1803;           //0x1C2C
    int unk1804;           //0x1C30
    int unk1805;           //0x1C34
    int unk1806;           //0x1C38
    int unk1807;           //0x1C3C
    int unk1808;           //0x1C40
    int unk1809;           //0x1C44
    int unk1810;           //0x1C48
    int unk1811;           //0x1C4C
    int unk1812;           //0x1C50
    int unk1813;           //0x1C54
    int unk1814;           //0x1C58
    int unk1815;           //0x1C5C
    int unk1816;           //0x1C60
    int unk1817;           //0x1C64
    int unk1818;           //0x1C68
    int unk1819;           //0x1C6C
    int unk1820;           //0x1C70
    int unk1821;           //0x1C74
    int unk1822;           //0x1C78
    int unk1823;           //0x1C7C
    int unk1824;           //0x1C80
    int unk1825;           //0x1C84
    int unk1826;           //0x1C88
    int unk1827;           //0x1C8C
    int unk1828;           //0x1C90
    int unk1829;           //0x1C94
    int unk1830;           //0x1C98
    int unk1831;           //0x1C9C
    int unk1832;           //0x1CA0
    int unk1833;           //0x1CA4
    int unk1834;           //0x1CA8
    int unk1835;           //0x1CAC
    int unk1836;           //0x1CB0
    int unk1837;           //0x1CB4
    int unk1838;           //0x1CB8
    int unk1839;           //0x1CBC
    int unk1840;           //0x1CC0
    int unk1841;           //0x1CC4
    int unk1842;           //0x1CC8
    int unk1843;           //0x1CCC
    int unk1844;           //0x1CD0
    int unk1845;           //0x1CD4
    int unk1846;           //0x1CD8
    int unk1847;           //0x1CDC
    int unk1848;           //0x1CE0
    int unk1849;           //0x1CE4
    int unk1850;           //0x1CE8
    int unk1851;           //0x1CEC
    int unk1852;           //0x1CF0
    int unk1853;           //0x1CF4
    int unk1854;           //0x1CF8
    int unk1855;           //0x1CFC
    int unk1856;           //0x1D00
    int unk1857;           //0x1D04
    int unk1858;           //0x1D08
    int unk1859;           //0x1D0C
    int unk1860;           //0x1D10
    int unk1861;           //0x1D14
    int unk1862;           //0x1D18
    int unk1863;           //0x1D1C
    int unk1864;           //0x1D20
    int unk1865;           //0x1D24
    int unk1866;           //0x1D28
    int unk1867;           //0x1D2C
    int unk1868;           //0x1D30
    int unk1869;           //0x1D34
    int unk1870;           //0x1D38
    int unk1871;           //0x1D3C
    int unk1872;           //0x1D40
    int unk1873;           //0x1D44
    int unk1874;           //0x1D48
    int unk1875;           //0x1D4C
    int unk1876;           //0x1D50
    int unk1877;           //0x1D54
    int unk1878;           //0x1D58
    int unk1879;           //0x1D5C
    int unk1880;           //0x1D60
    int unk1881;           //0x1D64
    int unk1882;           //0x1D68
    int unk1883;           //0x1D6C
    int unk1884;           //0x1D70
    int unk1885;           //0x1D74
    int unk1886;           //0x1D78
    int unk1887;           //0x1D7C
    int unk1888;           //0x1D80
    int unk1889;           //0x1D84
    int unk1890;           //0x1D88
    int unk1891;           //0x1D8C
    int unk1892;           //0x1D90
    int unk1893;           //0x1D94
    int unk1894;           //0x1D98
    int unk1895;           //0x1D9C
    int unk1896;           //0x1DA0
    int unk1897;           //0x1DA4
    int unk1898;           //0x1DA8
    int unk1899;           //0x1DAC
    int unk1900;           //0x1DB0
    int unk1901;           //0x1DB4
    int unk1902;           //0x1DB8
    int unk1903;           //0x1DBC
    int unk1904;           //0x1DC0
    int unk1905;           //0x1DC4
    int unk1906;           //0x1DC8
    int unk1907;           //0x1DCC
    int unk1908;           //0x1DD0
    int unk1909;           //0x1DD4
    int unk1910;           //0x1DD8
    int unk1911;           //0x1DDC
    int unk1912;           //0x1DE0
    int unk1913;           //0x1DE4
    int unk1914;           //0x1DE8
    int unk1915;           //0x1DEC
    int unk1916;           //0x1DF0
    int unk1917;           //0x1DF4
    int unk1918;           //0x1DF8
    int unk1919;           //0x1DFC
    int unk1920;           //0x1E00
    int unk1921;           //0x1E04
    int unk1922;           //0x1E08
    int unk1923;           //0x1E0C
    int unk1924;           //0x1E10
    int unk1925;           //0x1E14
    int unk1926;           //0x1E18
    int unk1927;           //0x1E1C
    int unk1928;           //0x1E20
    int unk1929;           //0x1E24
    int unk1930;           //0x1E28
    int unk1931;           //0x1E2C
    int unk1932;           //0x1E30
    int unk1933;           //0x1E34
    int unk1934;           //0x1E38
    int unk1935;           //0x1E3C
    int unk1936;           //0x1E40
    int unk1937;           //0x1E44
    int unk1938;           //0x1E48
    int unk1939;           //0x1E4C
    int unk1940;           //0x1E50
    int unk1941;           //0x1E54
    int unk1942;           //0x1E58
    int unk1943;           //0x1E5C
    int unk1944;           //0x1E60
    int unk1945;           //0x1E64
    int unk1946;           //0x1E68
    int unk1947;           //0x1E6C
    int unk1948;           //0x1E70
    int unk1949;           //0x1E74
    int unk1950;           //0x1E78
    int unk1951;           //0x1E7C
    int unk1952;           //0x1E80
    int unk1953;           //0x1E84
    int unk1954;           //0x1E88
    int unk1955;           //0x1E8C
    int unk1956;           //0x1E90
    int unk1957;           //0x1E94
    int unk1958;           //0x1E98
    int unk1959;           //0x1E9C
    int unk1960;           //0x1EA0
    int unk1961;           //0x1EA4
    int unk1962;           //0x1EA8
    int unk1963;           //0x1EAC
    int unk1964;           //0x1EB0
    int unk1965;           //0x1EB4
    int unk1966;           //0x1EB8
    int unk1967;           //0x1EBC
    int unk1968;           //0x1EC0
    int unk1969;           //0x1EC4
    int unk1970;           //0x1EC8
    int unk1971;           //0x1ECC
    int unk1972;           //0x1ED0
    int unk1973;           //0x1ED4
    int unk1974;           //0x1ED8
    int unk1975;           //0x1EDC
    int unk1976;           //0x1EE0
    int unk1977;           //0x1EE4
    int unk1978;           //0x1EE8
    int unk1979;           //0x1EEC
    int unk1980;           //0x1EF0
    int unk1981;           //0x1EF4
    int unk1982;           //0x1EF8
    int unk1983;           //0x1EFC
    int unk1984;           //0x1F00
    int unk1985;           //0x1F04
    int unk1986;           //0x1F08
    int unk1987;           //0x1F0C
    int unk1988;           //0x1F10
    int unk1989;           //0x1F14
    int unk1990;           //0x1F18
    int unk1991;           //0x1F1C
    int unk1992;           //0x1F20
    int TM_OSDEnabled;     //0x1F24
    u8 TM_OSDMax;          //0x1F28
    u8 TM_EventPage;       //0x1F29
    u8 TM_OSDRecommended;  //0x1F2A
    int unk1995;           //0x1F2C
    int unk1996;           //0x1F30
    int unk1997;           //0x1F34
    int unk1998;           //0x1F38
    int unk1999;           //0x1F3C
    int unk2000;           //0x1F40
    int unk2001;           //0x1F44
    int unk2002;           //0x1F48
    int unk2003;           //0x1F4C
    int unk2004;           //0x1F50
    int unk2005;           //0x1F54
    int unk2006;           //0x1F58
    int unk2007;           //0x1F5C
    int unk2008;           //0x1F60
    int unk2009;           //0x1F64
    int unk2010;           //0x1F68
    int unk2011;           //0x1F6C
    int unk2012;           //0x1F70
    int unk2013;           //0x1F74
    int unk2014;           //0x1F78
    int unk2015;           //0x1F7C
    int unk2016;           //0x1F80
    int unk2017;           //0x1F84
    int unk2018;           //0x1F88
    int unk2019;           //0x1F8C
    int unk2020;           //0x1F90
    int unk2021;           //0x1F94
    int unk2022;           //0x1F98
    int unk2023;           //0x1F9C
    int unk2024;           //0x1FA0
    int unk2025;           //0x1FA4
    int unk2026;           //0x1FA8
    int unk2027;           //0x1FAC
    int unk2028;           //0x1FB0
    int unk2029;           //0x1FB4
    int unk2030;           //0x1FB8
    int unk2031;           //0x1FBC
    int unk2032;           //0x1FC0
    int unk2033;           //0x1FC4
    int unk2034;           //0x1FC8
    int unk2035;           //0x1FCC
    int unk2036;           //0x1FD0
    int unk2037;           //0x1FD4
    int unk2038;           //0x1FD8
    int unk2039;           //0x1FDC
    int unk2040;           //0x1FE0
    int unk2041;           //0x1FE4
    int unk2042;           //0x1FE8
    int unk2043;           //0x1FEC
    int unk2044;           //0x1FF0
    int unk2045;           //0x1FF4
    int unk2046;           //0x1FF8
    int unk2047;           //0x1FFC
} Memcard;
typedef struct HSD_Update
{
    // 0x80479d58
    u32 sys_frames_pre;                   //0x0
    u32 sys_frames_post;                  //0x4
    u32 engine_frames;                    //0x8
    u32 change_scene;                     //0xC
    unsigned char flag1 : 1;              //0x10 - 0x80
    unsigned char flag2 : 1;              //0x10 - 0x40
    unsigned char flag3 : 1;              //0x10 - 0x20
    unsigned char flag4 : 1;              //0x10 - 0x10
    unsigned char flag5 : 1;              //0x10 - 0x08
    unsigned char flag6 : 1;              //0x10 - 0x04
    unsigned char pause_game : 1;         //0x10 - 0x02
    unsigned char pause_develop : 1;      //0x10 - 0x01
    unsigned char flag9 : 1;              //0x11 - 0x80
    unsigned char flag10 : 1;             //0x11 - 0x40
    unsigned char flag11 : 1;             //0x11 - 0x20
    unsigned char flag12 : 1;             //0x11 - 0x10
    unsigned char flag13 : 1;             //0x11 - 0x08
    unsigned char flag14 : 1;             //0x11 - 0x04
    unsigned char pause_game_prev : 1;    //0x11 - 0x02
    unsigned char pause_develop_prev : 1; //0x11 - 0x01
    unsigned char flag17 : 1;             //0x12 - 0x80
    unsigned char flag18 : 1;             //0x12 - 0x40
    unsigned char flag19 : 1;             //0x12 - 0x20
    unsigned char flag20 : 1;             //0x12 - 0x10
    unsigned char flag21 : 1;             //0x12 - 0x08
    unsigned char flag22 : 1;             //0x12 - 0x04
    unsigned char flag23 : 1;             //0x12 - 0x02
    unsigned char advance : 1;            //0x12 - 0x01
    unsigned char flag24 : 1;             //0x12 - 0x80
    unsigned char flag25 : 1;             //0x12 - 0x40
    unsigned char flag26 : 1;             //0x12 - 0x20
    unsigned char flag27 : 1;             //0x12 - 0x10
    unsigned char flag28 : 1;             //0x12 - 0x08
    unsigned char flag29 : 1;             //0x12 - 0x04
    unsigned char flag30 : 1;             //0x12 - 0x02
    unsigned char advance_prev : 1;       //0x12 - 0x01
    int (*checkPause)();                  //0x14 returns 1 when toggling pause
    int (*checkAdvance)();                //0x18 returns 1 when advancing frame
    u32 x1c;                              //0x1C
    u32 x20;
    u32 x24;
    u32 x28;
    u32 x2c;
    void (*onFrame)(); //0x30

} HSD_Update;
typedef struct MatchHUD
{
    GOBJ *percent;
    GOBJ *insignia;
    u8 x8;
    u8 x9;
    u16 xa;
    u16 xc;
    u8 xe;
    u8 xf;
    unsigned char is_exist : 1; // 0x80 - 0x10
    unsigned char x10_2 : 1;    // 0x40 - 0x10
    unsigned char x10_3 : 1;    // 0x20 - 0x10
    unsigned char x10_4 : 1;    // 0x10 - 0x10
    unsigned char x10_5 : 1;    // 0x08 - 0x10
    unsigned char x10_6 : 1;    // 0x04 - 0x10
    unsigned char x10_7 : 1;    // 0x02 - 0x10
    unsigned char x10_8 : 1;    // 0x01 - 0x10
    u8 x11;
    u8 x12;
    u8 x13;
    float x14[3];
    float x24[4];
    int x34[8];
    JOBJ *x54[4];
} MatchHUD;
typedef struct Match // static match struct
{
    u8 state;        // 0x0
    int x4;          // 0x4
    int x8;          // 0x8
    int xc;          // 0xc
    int x10;         // 0x10
    int x14;         // 0x14
    int x18;         // 0x18
    int x1c;         // 0x1c
    int x20;         // 0x20
    int x24;         // 0x24
    int x28;         // 0x28
    int x2c;         // 0x2c
    int x30;         // 0x30
    int x34;         // 0x34
    int x38;         // 0x38
    int x3c;         // 0x3c
    int x40;         // 0x40
    int x44;         // 0x44
    int x48;         // 0x48
    int x4c;         // 0x4c
    int x50;         // 0x50
    int x54;         // 0x54
    int x58;         // 0x58
    int x5c;         // 0x5c
    int x60;         // 0x60
    int x64;         // 0x64
    int x68;         // 0x68
    int x6c;         // 0x6c
    int x70;         // 0x70
    int x74;         // 0x74
    int x78;         // 0x78
    int x7c;         // 0x7c
    int x80;         // 0x80
    int x84;         // 0x84
    int x88;         // 0x88
    int x8c;         // 0x8c
    int x90;         // 0x90
    int x94;         // 0x94
    int x98;         // 0x98
    int x9c;         // 0x9c
    int xa0;         // 0xa0
    int xa4;         // 0xa4
    int xa8;         // 0xa8
    int xac;         // 0xac
    int xb0;         // 0xb0
    int xb4;         // 0xb4
    int xb8;         // 0xb8
    int xbc;         // 0xbc
    int xc0;         // 0xc0
    int xc4;         // 0xc4
    int xc8;         // 0xc8
    int xcc;         // 0xcc
    int xd0;         // 0xd0
    int xd4;         // 0xd4
    int xd8;         // 0xd8
    int xdc;         // 0xdc
    int xe0;         // 0xe0
    int xe4;         // 0xe4
    int xe8;         // 0xe8
    int xec;         // 0xec
    int xf0;         // 0xf0
    int xf4;         // 0xf4
    int xf8;         // 0xf8
    int xfc;         // 0xfc
    int x100;        // 0x100
    int x104;        // 0x104
    int x108;        // 0x108
    int x10c;        // 0x10c
    int x110;        // 0x110
    int x114;        // 0x114
    int x118;        // 0x118
    int x11c;        // 0x11c
    int x120;        // 0x120
    int x124;        // 0x124
    int x128;        // 0x128
    int x12c;        // 0x12c
    int x130;        // 0x130
    int x134;        // 0x134
    int x138;        // 0x138
    int x13c;        // 0x13c
    int x140;        // 0x140
    int x144;        // 0x144
    int x148;        // 0x148
    int x14c;        // 0x14c
    int x150;        // 0x150
    int x154;        // 0x154
    int x158;        // 0x158
    int x15c;        // 0x15c
    int x160;        // 0x160
    int x164;        // 0x164
    int x168;        // 0x168
    int x16c;        // 0x16c
    int x170;        // 0x170
    int x174;        // 0x174
    int x178;        // 0x178
    int x17c;        // 0x17c
    int x180;        // 0x180
    int x184;        // 0x184
    int x188;        // 0x188
    int x18c;        // 0x18c
    int x190;        // 0x190
    int x194;        // 0x194
    int x198;        // 0x198
    int x19c;        // 0x19c
    int x1a0;        // 0x1a0
    int x1a4;        // 0x1a4
    int x1a8;        // 0x1a8
    int x1ac;        // 0x1ac
    int x1b0;        // 0x1b0
    int x1b4;        // 0x1b4
    int x1b8;        // 0x1b8
    int x1bc;        // 0x1bc
    int x1c0;        // 0x1c0
    int x1c4;        // 0x1c4
    int x1c8;        // 0x1c8
    int x1cc;        // 0x1cc
    int x1d0;        // 0x1d0
    int x1d4;        // 0x1d4
    int x1d8;        // 0x1d8
    int x1dc;        // 0x1dc
    int x1e0;        // 0x1e0
    int x1e4;        // 0x1e4
    int x1e8;        // 0x1e8
    int x1ec;        // 0x1ec
    int x1f0;        // 0x1f0
    int x1f4;        // 0x1f4
    int x1f8;        // 0x1f8
    int x1fc;        // 0x1fc
    int x200;        // 0x200
    int x204;        // 0x204
    int x208;        // 0x208
    int x20c;        // 0x20c
    int x210;        // 0x210
    int x214;        // 0x214
    int x218;        // 0x218
    int x21c;        // 0x21c
    int x220;        // 0x220
    int x224;        // 0x224
    int x228;        // 0x228
    int x22c;        // 0x22c
    int x230;        // 0x230
    int x234;        // 0x234
    int x238;        // 0x238
    int x23c;        // 0x23c
    int x240;        // 0x240
    int x244;        // 0x244
    int x248;        // 0x248
    int x24c;        // 0x24c
    int x250;        // 0x250
    int x254;        // 0x254
    int x258;        // 0x258
    int x25c;        // 0x25c
    int x260;        // 0x260
    int x264;        // 0x264
    int x268;        // 0x268
    int x26c;        // 0x26c
    int x270;        // 0x270
    int x274;        // 0x274
    int x278;        // 0x278
    int x27c;        // 0x27c
    int x280;        // 0x280
    int x284;        // 0x284
    int x288;        // 0x288
    int x28c;        // 0x28c
    int x290;        // 0x290
    int x294;        // 0x294
    int x298;        // 0x298
    int x29c;        // 0x29c
    int x2a0;        // 0x2a0
    int x2a4;        // 0x2a4
    int x2a8;        // 0x2a8
    int x2ac;        // 0x2ac
    int x2b0;        // 0x2b0
    int x2b4;        // 0x2b4
    int x2b8;        // 0x2b8
    int x2bc;        // 0x2bc
    int x2c0;        // 0x2c0
    int x2c4;        // 0x2c4
    int x2c8;        // 0x2c8
    int x2cc;        // 0x2cc
    int x2d0;        // 0x2d0
    int x2d4;        // 0x2d4
    int x2d8;        // 0x2d8
    int x2dc;        // 0x2dc
    int x2e0;        // 0x2e0
    int x2e4;        // 0x2e4
    int x2e8;        // 0x2e8
    int x2ec;        // 0x2ec
    int x2f0;        // 0x2f0
    int x2f4;        // 0x2f4
    int x2f8;        // 0x2f8
    int x2fc;        // 0x2fc
    int x300;        // 0x300
    int x304;        // 0x304
    int x308;        // 0x308
    int x30c;        // 0x30c
    int x310;        // 0x310
    int x314;        // 0x314
    int x318;        // 0x318
    int x31c;        // 0x31c
    int x320;        // 0x320
    int x324;        // 0x324
    int x328;        // 0x328
    int x32c;        // 0x32c
    int x330;        // 0x330
    int x334;        // 0x334
    int x338;        // 0x338
    int x33c;        // 0x33c
    int x340;        // 0x340
    int x344;        // 0x344
    int x348;        // 0x348
    int x34c;        // 0x34c
    int x350;        // 0x350
    int x354;        // 0x354
    int x358;        // 0x358
    int x35c;        // 0x35c
    int x360;        // 0x360
    int x364;        // 0x364
    int x368;        // 0x368
    int x36c;        // 0x36c
    int x370;        // 0x370
    int x374;        // 0x374
    int x378;        // 0x378
    int x37c;        // 0x37c
    int x380;        // 0x380
    int x384;        // 0x384
    int x388;        // 0x388
    int x38c;        // 0x38c
    int x390;        // 0x390
    int x394;        // 0x394
    int x398;        // 0x398
    int x39c;        // 0x39c
    int x3a0;        // 0x3a0
    int x3a4;        // 0x3a4
    int x3a8;        // 0x3a8
    int x3ac;        // 0x3ac
    int x3b0;        // 0x3b0
    int x3b4;        // 0x3b4
    int x3b8;        // 0x3b8
    int x3bc;        // 0x3bc
    int x3c0;        // 0x3c0
    int x3c4;        // 0x3c4
    int x3c8;        // 0x3c8
    int x3cc;        // 0x3cc
    int x3d0;        // 0x3d0
    int x3d4;        // 0x3d4
    int x3d8;        // 0x3d8
    int x3dc;        // 0x3dc
    int x3e0;        // 0x3e0
    int x3e4;        // 0x3e4
    int x3e8;        // 0x3e8
    int x3ec;        // 0x3ec
    int x3f0;        // 0x3f0
    int x3f4;        // 0x3f4
    int x3f8;        // 0x3f8
    int x3fc;        // 0x3fc
    int x400;        // 0x400
    int x404;        // 0x404
    int x408;        // 0x408
    int x40c;        // 0x40c
    int x410;        // 0x410
    int x414;        // 0x414
    int x418;        // 0x418
    int x41c;        // 0x41c
    int x420;        // 0x420
    int x424;        // 0x424
    int x428;        // 0x428
    int x42c;        // 0x42c
    int x430;        // 0x430
    int x434;        // 0x434
    int x438;        // 0x438
    int x43c;        // 0x43c
    int x440;        // 0x440
    int x444;        // 0x444
    int x448;        // 0x448
    int x44c;        // 0x44c
    int x450;        // 0x450
    int x454;        // 0x454
    int x458;        // 0x458
    int x45c;        // 0x45c
    int x460;        // 0x460
    int x464;        // 0x464
    int x468;        // 0x468
    int x46c;        // 0x46c
    int x470;        // 0x470
    int x474;        // 0x474
    int x478;        // 0x478
    int x47c;        // 0x47c
    int x480;        // 0x480
    int x484;        // 0x484
    int x488;        // 0x488
    int x48c;        // 0x48c
    int x490;        // 0x490
    int x494;        // 0x494
    int x498;        // 0x498
    int x49c;        // 0x49c
    int x4a0;        // 0x4a0
    int x4a4;        // 0x4a4
    int x4a8;        // 0x4a8
    int x4ac;        // 0x4ac
    int x4b0;        // 0x4b0
    int x4b4;        // 0x4b4
    int x4b8;        // 0x4b8
    int x4bc;        // 0x4bc
    int x4c0;        // 0x4c0
    int x4c4;        // 0x4c4
    int x4c8;        // 0x4c8
    int x4cc;        // 0x4cc
    int x4d0;        // 0x4d0
    int x4d4;        // 0x4d4
    int x4d8;        // 0x4d8
    int x4dc;        // 0x4dc
    int x4e0;        // 0x4e0
    int x4e4;        // 0x4e4
    int x4e8;        // 0x4e8
    int x4ec;        // 0x4ec
    int x4f0;        // 0x4f0
    int x4f4;        // 0x4f4
    int x4f8;        // 0x4f8
    int x4fc;        // 0x4fc
    int x500;        // 0x500
    int x504;        // 0x504
    int x508;        // 0x508
    int x50c;        // 0x50c
    int x510;        // 0x510
    int x514;        // 0x514
    int x518;        // 0x518
    int x51c;        // 0x51c
    int x520;        // 0x520
    int x524;        // 0x524
    int x528;        // 0x528
    int x52c;        // 0x52c
    int x530;        // 0x530
    int x534;        // 0x534
    int x538;        // 0x538
    int x53c;        // 0x53c
    int x540;        // 0x540
    int x544;        // 0x544
    int x548;        // 0x548
    int x54c;        // 0x54c
    int x550;        // 0x550
    int x554;        // 0x554
    int x558;        // 0x558
    int x55c;        // 0x55c
    int x560;        // 0x560
    int x564;        // 0x564
    int x568;        // 0x568
    int x56c;        // 0x56c
    int x570;        // 0x570
    int x574;        // 0x574
    int x578;        // 0x578
    int x57c;        // 0x57c
    int x580;        // 0x580
    int x584;        // 0x584
    int x588;        // 0x588
    int x58c;        // 0x58c
    int x590;        // 0x590
    int x594;        // 0x594
    int x598;        // 0x598
    int x59c;        // 0x59c
    int x5a0;        // 0x5a0
    int x5a4;        // 0x5a4
    int x5a8;        // 0x5a8
    int x5ac;        // 0x5ac
    int x5b0;        // 0x5b0
    int x5b4;        // 0x5b4
    int x5b8;        // 0x5b8
    int x5bc;        // 0x5bc
    int x5c0;        // 0x5c0
    int x5c4;        // 0x5c4
    int x5c8;        // 0x5c8
    int x5cc;        // 0x5cc
    int x5d0;        // 0x5d0
    int x5d4;        // 0x5d4
    int x5d8;        // 0x5d8
    int x5dc;        // 0x5dc
    int x5e0;        // 0x5e0
    int x5e4;        // 0x5e4
    int x5e8;        // 0x5e8
    int x5ec;        // 0x5ec
    int x5f0;        // 0x5f0
    int x5f4;        // 0x5f4
    int x5f8;        // 0x5f8
    int x5fc;        // 0x5fc
    int x600;        // 0x600
    int x604;        // 0x604
    int x608;        // 0x608
    int x60c;        // 0x60c
    int x610;        // 0x610
    int x614;        // 0x614
    int x618;        // 0x618
    int x61c;        // 0x61c
    int x620;        // 0x620
    int x624;        // 0x624
    int x628;        // 0x628
    int x62c;        // 0x62c
    int x630;        // 0x630
    int x634;        // 0x634
    int x638;        // 0x638
    int x63c;        // 0x63c
    int x640;        // 0x640
    int x644;        // 0x644
    int x648;        // 0x648
    int x64c;        // 0x64c
    int x650;        // 0x650
    int x654;        // 0x654
    int x658;        // 0x658
    int x65c;        // 0x65c
    int x660;        // 0x660
    int x664;        // 0x664
    int x668;        // 0x668
    int x66c;        // 0x66c
    int x670;        // 0x670
    int x674;        // 0x674
    int x678;        // 0x678
    int x67c;        // 0x67c
    int x680;        // 0x680
    int x684;        // 0x684
    int x688;        // 0x688
    int x68c;        // 0x68c
    int x690;        // 0x690
    int x694;        // 0x694
    int x698;        // 0x698
    int x69c;        // 0x69c
    int x6a0;        // 0x6a0
    int x6a4;        // 0x6a4
    int x6a8;        // 0x6a8
    int x6ac;        // 0x6ac
    int x6b0;        // 0x6b0
    int x6b4;        // 0x6b4
    int x6b8;        // 0x6b8
    int x6bc;        // 0x6bc
    int x6c0;        // 0x6c0
    int x6c4;        // 0x6c4
    int x6c8;        // 0x6c8
    int x6cc;        // 0x6cc
    int x6d0;        // 0x6d0
    int x6d4;        // 0x6d4
    int x6d8;        // 0x6d8
    int x6dc;        // 0x6dc
    int x6e0;        // 0x6e0
    int x6e4;        // 0x6e4
    int x6e8;        // 0x6e8
    int x6ec;        // 0x6ec
    int x6f0;        // 0x6f0
    int x6f4;        // 0x6f4
    int x6f8;        // 0x6f8
    int x6fc;        // 0x6fc
    int x700;        // 0x700
    int x704;        // 0x704
    int x708;        // 0x708
    int x70c;        // 0x70c
    int x710;        // 0x710
    int x714;        // 0x714
    int x718;        // 0x718
    int x71c;        // 0x71c
    int x720;        // 0x720
    int x724;        // 0x724
    int x728;        // 0x728
    int x72c;        // 0x72c
    int x730;        // 0x730
    int x734;        // 0x734
    int x738;        // 0x738
    int x73c;        // 0x73c
    int x740;        // 0x740
    int x744;        // 0x744
    int x748;        // 0x748
    int x74c;        // 0x74c
    int x750;        // 0x750
    int x754;        // 0x754
    int x758;        // 0x758
    int x75c;        // 0x75c
    int x760;        // 0x760
    int x764;        // 0x764
    int x768;        // 0x768
    int x76c;        // 0x76c
    int x770;        // 0x770
    int x774;        // 0x774
    int x778;        // 0x778
    int x77c;        // 0x77c
    int x780;        // 0x780
    int x784;        // 0x784
    int x788;        // 0x788
    int x78c;        // 0x78c
    int x790;        // 0x790
    int x794;        // 0x794
    int x798;        // 0x798
    int x79c;        // 0x79c
    int x7a0;        // 0x7a0
    int x7a4;        // 0x7a4
    int x7a8;        // 0x7a8
    int x7ac;        // 0x7ac
    int x7b0;        // 0x7b0
    int x7b4;        // 0x7b4
    int x7b8;        // 0x7b8
    int x7bc;        // 0x7bc
    int x7c0;        // 0x7c0
    int x7c4;        // 0x7c4
    int x7c8;        // 0x7c8
    int x7cc;        // 0x7cc
    int x7d0;        // 0x7d0
    int x7d4;        // 0x7d4
    int x7d8;        // 0x7d8
    int x7dc;        // 0x7dc
    int x7e0;        // 0x7e0
    int x7e4;        // 0x7e4
    int x7e8;        // 0x7e8
    int x7ec;        // 0x7ec
    int x7f0;        // 0x7f0
    int x7f4;        // 0x7f4
    int x7f8;        // 0x7f8
    int x7fc;        // 0x7fc
    int x800;        // 0x800
    int x804;        // 0x804
    int x808;        // 0x808
    int x80c;        // 0x80c
    int x810;        // 0x810
    int x814;        // 0x814
    int x818;        // 0x818
    int x81c;        // 0x81c
    int x820;        // 0x820
    int x824;        // 0x824
    int x828;        // 0x828
    int x82c;        // 0x82c
    int x830;        // 0x830
    int x834;        // 0x834
    int x838;        // 0x838
    int x83c;        // 0x83c
    int x840;        // 0x840
    int x844;        // 0x844
    int x848;        // 0x848
    int x84c;        // 0x84c
    int x850;        // 0x850
    int x854;        // 0x854
    int x858;        // 0x858
    int x85c;        // 0x85c
    int x860;        // 0x860
    int x864;        // 0x864
    int x868;        // 0x868
    int x86c;        // 0x86c
    int x870;        // 0x870
    int x874;        // 0x874
    int x878;        // 0x878
    int x87c;        // 0x87c
    int x880;        // 0x880
    int x884;        // 0x884
    int x888;        // 0x888
    int x88c;        // 0x88c
    int x890;        // 0x890
    int x894;        // 0x894
    int x898;        // 0x898
    int x89c;        // 0x89c
    int x8a0;        // 0x8a0
    int x8a4;        // 0x8a4
    int x8a8;        // 0x8a8
    int x8ac;        // 0x8ac
    int x8b0;        // 0x8b0
    int x8b4;        // 0x8b4
    int x8b8;        // 0x8b8
    int x8bc;        // 0x8bc
    int x8c0;        // 0x8c0
    int x8c4;        // 0x8c4
    int x8c8;        // 0x8c8
    int x8cc;        // 0x8cc
    int x8d0;        // 0x8d0
    int x8d4;        // 0x8d4
    int x8d8;        // 0x8d8
    int x8dc;        // 0x8dc
    int x8e0;        // 0x8e0
    int x8e4;        // 0x8e4
    int x8e8;        // 0x8e8
    int x8ec;        // 0x8ec
    int x8f0;        // 0x8f0
    int x8f4;        // 0x8f4
    int x8f8;        // 0x8f8
    int x8fc;        // 0x8fc
    int x900;        // 0x900
    int x904;        // 0x904
    int x908;        // 0x908
    int x90c;        // 0x90c
    int x910;        // 0x910
    int x914;        // 0x914
    int x918;        // 0x918
    int x91c;        // 0x91c
    int x920;        // 0x920
    int x924;        // 0x924
    int x928;        // 0x928
    int x92c;        // 0x92c
    int x930;        // 0x930
    int x934;        // 0x934
    int x938;        // 0x938
    int x93c;        // 0x93c
    int x940;        // 0x940
    int x944;        // 0x944
    int x948;        // 0x948
    int x94c;        // 0x94c
    int x950;        // 0x950
    int x954;        // 0x954
    int x958;        // 0x958
    int x95c;        // 0x95c
    int x960;        // 0x960
    int x964;        // 0x964
    int x968;        // 0x968
    int x96c;        // 0x96c
    int x970;        // 0x970
    int x974;        // 0x974
    int x978;        // 0x978
    int x97c;        // 0x97c
    int x980;        // 0x980
    int x984;        // 0x984
    int x988;        // 0x988
    int x98c;        // 0x98c
    int x990;        // 0x990
    int x994;        // 0x994
    int x998;        // 0x998
    int x99c;        // 0x99c
    int x9a0;        // 0x9a0
    int x9a4;        // 0x9a4
    int x9a8;        // 0x9a8
    int x9ac;        // 0x9ac
    int x9b0;        // 0x9b0
    int x9b4;        // 0x9b4
    int x9b8;        // 0x9b8
    int x9bc;        // 0x9bc
    int x9c0;        // 0x9c0
    int x9c4;        // 0x9c4
    int x9c8;        // 0x9c8
    int x9cc;        // 0x9cc
    int x9d0;        // 0x9d0
    int x9d4;        // 0x9d4
    int x9d8;        // 0x9d8
    int x9dc;        // 0x9dc
    int x9e0;        // 0x9e0
    int x9e4;        // 0x9e4
    int x9e8;        // 0x9e8
    int x9ec;        // 0x9ec
    int x9f0;        // 0x9f0
    int x9f4;        // 0x9f4
    int x9f8;        // 0x9f8
    int x9fc;        // 0x9fc
    int xa00;        // 0xa00
    int xa04;        // 0xa04
    int xa08;        // 0xa08
    int xa0c;        // 0xa0c
    int xa10;        // 0xa10
    int xa14;        // 0xa14
    int xa18;        // 0xa18
    int xa1c;        // 0xa1c
    int xa20;        // 0xa20
    int xa24;        // 0xa24
    int xa28;        // 0xa28
    int xa2c;        // 0xa2c
    int xa30;        // 0xa30
    int xa34;        // 0xa34
    int xa38;        // 0xa38
    int xa3c;        // 0xa3c
    int xa40;        // 0xa40
    int xa44;        // 0xa44
    int xa48;        // 0xa48
    int xa4c;        // 0xa4c
    int xa50;        // 0xa50
    int xa54;        // 0xa54
    int xa58;        // 0xa58
    int xa5c;        // 0xa5c
    int xa60;        // 0xa60
    int xa64;        // 0xa64
    int xa68;        // 0xa68
    int xa6c;        // 0xa6c
    int xa70;        // 0xa70
    int xa74;        // 0xa74
    int xa78;        // 0xa78
    int xa7c;        // 0xa7c
    int xa80;        // 0xa80
    int xa84;        // 0xa84
    int xa88;        // 0xa88
    int xa8c;        // 0xa8c
    int xa90;        // 0xa90
    int xa94;        // 0xa94
    int xa98;        // 0xa98
    int xa9c;        // 0xa9c
    int xaa0;        // 0xaa0
    int xaa4;        // 0xaa4
    int xaa8;        // 0xaa8
    int xaac;        // 0xaac
    int xab0;        // 0xab0
    int xab4;        // 0xab4
    int xab8;        // 0xab8
    int xabc;        // 0xabc
    int xac0;        // 0xac0
    int xac4;        // 0xac4
    int xac8;        // 0xac8
    int xacc;        // 0xacc
    int xad0;        // 0xad0
    int xad4;        // 0xad4
    int xad8;        // 0xad8
    int xadc;        // 0xadc
    int xae0;        // 0xae0
    int xae4;        // 0xae4
    int xae8;        // 0xae8
    int xaec;        // 0xaec
    int xaf0;        // 0xaf0
    int xaf4;        // 0xaf4
    int xaf8;        // 0xaf8
    int xafc;        // 0xafc
    int xb00;        // 0xb00
    int xb04;        // 0xb04
    int xb08;        // 0xb08
    int xb0c;        // 0xb0c
    int xb10;        // 0xb10
    int xb14;        // 0xb14
    int xb18;        // 0xb18
    int xb1c;        // 0xb1c
    int xb20;        // 0xb20
    int xb24;        // 0xb24
    int xb28;        // 0xb28
    int xb2c;        // 0xb2c
    int xb30;        // 0xb30
    int xb34;        // 0xb34
    int xb38;        // 0xb38
    int xb3c;        // 0xb3c
    int xb40;        // 0xb40
    int xb44;        // 0xb44
    int xb48;        // 0xb48
    int xb4c;        // 0xb4c
    int xb50;        // 0xb50
    int xb54;        // 0xb54
    int xb58;        // 0xb58
    int xb5c;        // 0xb5c
    int xb60;        // 0xb60
    int xb64;        // 0xb64
    int xb68;        // 0xb68
    int xb6c;        // 0xb6c
    int xb70;        // 0xb70
    int xb74;        // 0xb74
    int xb78;        // 0xb78
    int xb7c;        // 0xb7c
    int xb80;        // 0xb80
    int xb84;        // 0xb84
    int xb88;        // 0xb88
    int xb8c;        // 0xb8c
    int xb90;        // 0xb90
    int xb94;        // 0xb94
    int xb98;        // 0xb98
    int xb9c;        // 0xb9c
    int xba0;        // 0xba0
    int xba4;        // 0xba4
    int xba8;        // 0xba8
    int xbac;        // 0xbac
    int xbb0;        // 0xbb0
    int xbb4;        // 0xbb4
    int xbb8;        // 0xbb8
    int xbbc;        // 0xbbc
    int xbc0;        // 0xbc0
    int xbc4;        // 0xbc4
    int xbc8;        // 0xbc8
    int xbcc;        // 0xbcc
    int xbd0;        // 0xbd0
    int xbd4;        // 0xbd4
    int xbd8;        // 0xbd8
    int xbdc;        // 0xbdc
    int xbe0;        // 0xbe0
    int xbe4;        // 0xbe4
    int xbe8;        // 0xbe8
    int xbec;        // 0xbec
    int xbf0;        // 0xbf0
    int xbf4;        // 0xbf4
    int xbf8;        // 0xbf8
    int xbfc;        // 0xbfc
    int xc00;        // 0xc00
    int xc04;        // 0xc04
    int xc08;        // 0xc08
    int xc0c;        // 0xc0c
    int xc10;        // 0xc10
    int xc14;        // 0xc14
    int xc18;        // 0xc18
    int xc1c;        // 0xc1c
    int xc20;        // 0xc20
    int xc24;        // 0xc24
    int xc28;        // 0xc28
    int xc2c;        // 0xc2c
    int xc30;        // 0xc30
    int xc34;        // 0xc34
    int xc38;        // 0xc38
    int xc3c;        // 0xc3c
    int xc40;        // 0xc40
    int xc44;        // 0xc44
    int xc48;        // 0xc48
    int xc4c;        // 0xc4c
    int xc50;        // 0xc50
    int xc54;        // 0xc54
    int xc58;        // 0xc58
    int xc5c;        // 0xc5c
    int xc60;        // 0xc60
    int xc64;        // 0xc64
    int xc68;        // 0xc68
    int xc6c;        // 0xc6c
    int xc70;        // 0xc70
    int xc74;        // 0xc74
    int xc78;        // 0xc78
    int xc7c;        // 0xc7c
    int xc80;        // 0xc80
    int xc84;        // 0xc84
    int xc88;        // 0xc88
    int xc8c;        // 0xc8c
    int xc90;        // 0xc90
    int xc94;        // 0xc94
    int xc98;        // 0xc98
    int xc9c;        // 0xc9c
    int xca0;        // 0xca0
    int xca4;        // 0xca4
    int xca8;        // 0xca8
    int xcac;        // 0xcac
    int xcb0;        // 0xcb0
    int xcb4;        // 0xcb4
    int xcb8;        // 0xcb8
    int xcbc;        // 0xcbc
    int xcc0;        // 0xcc0
    int xcc4;        // 0xcc4
    int xcc8;        // 0xcc8
    int xccc;        // 0xccc
    int xcd0;        // 0xcd0
    int xcd4;        // 0xcd4
    int xcd8;        // 0xcd8
    int xcdc;        // 0xcdc
    int xce0;        // 0xce0
    int xce4;        // 0xce4
    int xce8;        // 0xce8
    int xcec;        // 0xcec
    int xcf0;        // 0xcf0
    int xcf4;        // 0xcf4
    int xcf8;        // 0xcf8
    int xcfc;        // 0xcfc
    int xd00;        // 0xd00
    int xd04;        // 0xd04
    int xd08;        // 0xd08
    int xd0c;        // 0xd0c
    int xd10;        // 0xd10
    int xd14;        // 0xd14
    int xd18;        // 0xd18
    int xd1c;        // 0xd1c
    int xd20;        // 0xd20
    int xd24;        // 0xd24
    int xd28;        // 0xd28
    int xd2c;        // 0xd2c
    int xd30;        // 0xd30
    int xd34;        // 0xd34
    int xd38;        // 0xd38
    int xd3c;        // 0xd3c
    int xd40;        // 0xd40
    int xd44;        // 0xd44
    int xd48;        // 0xd48
    int xd4c;        // 0xd4c
    int xd50;        // 0xd50
    int xd54;        // 0xd54
    int xd58;        // 0xd58
    int xd5c;        // 0xd5c
    int xd60;        // 0xd60
    int xd64;        // 0xd64
    int xd68;        // 0xd68
    int xd6c;        // 0xd6c
    int xd70;        // 0xd70
    int xd74;        // 0xd74
    int xd78;        // 0xd78
    int xd7c;        // 0xd7c
    int xd80;        // 0xd80
    int xd84;        // 0xd84
    int xd88;        // 0xd88
    int xd8c;        // 0xd8c
    int xd90;        // 0xd90
    int xd94;        // 0xd94
    int xd98;        // 0xd98
    int xd9c;        // 0xd9c
    int xda0;        // 0xda0
    int xda4;        // 0xda4
    int xda8;        // 0xda8
    int xdac;        // 0xdac
    int xdb0;        // 0xdb0
    int xdb4;        // 0xdb4
    int xdb8;        // 0xdb8
    int xdbc;        // 0xdbc
    int xdc0;        // 0xdc0
    int xdc4;        // 0xdc4
    int xdc8;        // 0xdc8
    int xdcc;        // 0xdcc
    int xdd0;        // 0xdd0
    int xdd4;        // 0xdd4
    int xdd8;        // 0xdd8
    int xddc;        // 0xddc
    int xde0;        // 0xde0
    int xde4;        // 0xde4
    int xde8;        // 0xde8
    int xdec;        // 0xdec
    int xdf0;        // 0xdf0
    int xdf4;        // 0xdf4
    int xdf8;        // 0xdf8
    int xdfc;        // 0xdfc
    int xe00;        // 0xe00
    int xe04;        // 0xe04
    int xe08;        // 0xe08
    int xe0c;        // 0xe0c
    int xe10;        // 0xe10
    int xe14;        // 0xe14
    int xe18;        // 0xe18
    int xe1c;        // 0xe1c
    int xe20;        // 0xe20
    int xe24;        // 0xe24
    int xe28;        // 0xe28
    int xe2c;        // 0xe2c
    int xe30;        // 0xe30
    int xe34;        // 0xe34
    int xe38;        // 0xe38
    int xe3c;        // 0xe3c
    int xe40;        // 0xe40
    int xe44;        // 0xe44
    int xe48;        // 0xe48
    int xe4c;        // 0xe4c
    int xe50;        // 0xe50
    int xe54;        // 0xe54
    int xe58;        // 0xe58
    int xe5c;        // 0xe5c
    int xe60;        // 0xe60
    int xe64;        // 0xe64
    int xe68;        // 0xe68
    int xe6c;        // 0xe6c
    int xe70;        // 0xe70
    int xe74;        // 0xe74
    int xe78;        // 0xe78
    int xe7c;        // 0xe7c
    int xe80;        // 0xe80
    int xe84;        // 0xe84
    int xe88;        // 0xe88
    int xe8c;        // 0xe8c
    int xe90;        // 0xe90
    int xe94;        // 0xe94
    int xe98;        // 0xe98
    int xe9c;        // 0xe9c
    int xea0;        // 0xea0
    int xea4;        // 0xea4
    int xea8;        // 0xea8
    int xeac;        // 0xeac
    int xeb0;        // 0xeb0
    int xeb4;        // 0xeb4
    int xeb8;        // 0xeb8
    int xebc;        // 0xebc
    int xec0;        // 0xec0
    int xec4;        // 0xec4
    int xec8;        // 0xec8
    int xecc;        // 0xecc
    int xed0;        // 0xed0
    int xed4;        // 0xed4
    int xed8;        // 0xed8
    int xedc;        // 0xedc
    int xee0;        // 0xee0
    int xee4;        // 0xee4
    int xee8;        // 0xee8
    int xeec;        // 0xeec
    int xef0;        // 0xef0
    int xef4;        // 0xef4
    int xef8;        // 0xef8
    int xefc;        // 0xefc
    int xf00;        // 0xf00
    int xf04;        // 0xf04
    int xf08;        // 0xf08
    int xf0c;        // 0xf0c
    int xf10;        // 0xf10
    int xf14;        // 0xf14
    int xf18;        // 0xf18
    int xf1c;        // 0xf1c
    int xf20;        // 0xf20
    int xf24;        // 0xf24
    int xf28;        // 0xf28
    int xf2c;        // 0xf2c
    int xf30;        // 0xf30
    int xf34;        // 0xf34
    int xf38;        // 0xf38
    int xf3c;        // 0xf3c
    int xf40;        // 0xf40
    int xf44;        // 0xf44
    int xf48;        // 0xf48
    int xf4c;        // 0xf4c
    int xf50;        // 0xf50
    int xf54;        // 0xf54
    int xf58;        // 0xf58
    int xf5c;        // 0xf5c
    int xf60;        // 0xf60
    int xf64;        // 0xf64
    int xf68;        // 0xf68
    int xf6c;        // 0xf6c
    int xf70;        // 0xf70
    int xf74;        // 0xf74
    int xf78;        // 0xf78
    int xf7c;        // 0xf7c
    int xf80;        // 0xf80
    int xf84;        // 0xf84
    int xf88;        // 0xf88
    int xf8c;        // 0xf8c
    int xf90;        // 0xf90
    int xf94;        // 0xf94
    int xf98;        // 0xf98
    int xf9c;        // 0xf9c
    int xfa0;        // 0xfa0
    int xfa4;        // 0xfa4
    int xfa8;        // 0xfa8
    int xfac;        // 0xfac
    int xfb0;        // 0xfb0
    int xfb4;        // 0xfb4
    int xfb8;        // 0xfb8
    int xfbc;        // 0xfbc
    int xfc0;        // 0xfc0
    int xfc4;        // 0xfc4
    int xfc8;        // 0xfc8
    int xfcc;        // 0xfcc
    int xfd0;        // 0xfd0
    int xfd4;        // 0xfd4
    int xfd8;        // 0xfd8
    int xfdc;        // 0xfdc
    int xfe0;        // 0xfe0
    int xfe4;        // 0xfe4
    int xfe8;        // 0xfe8
    int xfec;        // 0xfec
    int xff0;        // 0xff0
    int xff4;        // 0xff4
    int xff8;        // 0xff8
    int xffc;        // 0xffc
    int x1000;       // 0x1000
    int x1004;       // 0x1004
    int x1008;       // 0x1008
    int x100c;       // 0x100c
    int x1010;       // 0x1010
    int x1014;       // 0x1014
    int x1018;       // 0x1018
    int x101c;       // 0x101c
    int x1020;       // 0x1020
    int x1024;       // 0x1024
    int x1028;       // 0x1028
    int x102c;       // 0x102c
    int x1030;       // 0x1030
    int x1034;       // 0x1034
    int x1038;       // 0x1038
    int x103c;       // 0x103c
    int x1040;       // 0x1040
    int x1044;       // 0x1044
    int x1048;       // 0x1048
    int x104c;       // 0x104c
    int x1050;       // 0x1050
    int x1054;       // 0x1054
    int x1058;       // 0x1058
    int x105c;       // 0x105c
    int x1060;       // 0x1060
    int x1064;       // 0x1064
    int x1068;       // 0x1068
    int x106c;       // 0x106c
    int x1070;       // 0x1070
    int x1074;       // 0x1074
    int x1078;       // 0x1078
    int x107c;       // 0x107c
    int x1080;       // 0x1080
    int x1084;       // 0x1084
    int x1088;       // 0x1088
    int x108c;       // 0x108c
    int x1090;       // 0x1090
    int x1094;       // 0x1094
    int x1098;       // 0x1098
    int x109c;       // 0x109c
    int x10a0;       // 0x10a0
    int x10a4;       // 0x10a4
    int x10a8;       // 0x10a8
    int x10ac;       // 0x10ac
    int x10b0;       // 0x10b0
    int x10b4;       // 0x10b4
    int x10b8;       // 0x10b8
    int x10bc;       // 0x10bc
    int x10c0;       // 0x10c0
    int x10c4;       // 0x10c4
    int x10c8;       // 0x10c8
    int x10cc;       // 0x10cc
    int x10d0;       // 0x10d0
    int x10d4;       // 0x10d4
    int x10d8;       // 0x10d8
    int x10dc;       // 0x10dc
    int x10e0;       // 0x10e0
    int x10e4;       // 0x10e4
    int x10e8;       // 0x10e8
    int x10ec;       // 0x10ec
    int x10f0;       // 0x10f0
    int x10f4;       // 0x10f4
    int x10f8;       // 0x10f8
    int x10fc;       // 0x10fc
    int x1100;       // 0x1100
    int x1104;       // 0x1104
    int x1108;       // 0x1108
    int x110c;       // 0x110c
    int x1110;       // 0x1110
    int x1114;       // 0x1114
    int x1118;       // 0x1118
    int x111c;       // 0x111c
    int x1120;       // 0x1120
    int x1124;       // 0x1124
    int x1128;       // 0x1128
    int x112c;       // 0x112c
    int x1130;       // 0x1130
    int x1134;       // 0x1134
    int x1138;       // 0x1138
    int x113c;       // 0x113c
    int x1140;       // 0x1140
    int x1144;       // 0x1144
    int x1148;       // 0x1148
    int x114c;       // 0x114c
    int x1150;       // 0x1150
    int x1154;       // 0x1154
    int x1158;       // 0x1158
    int x115c;       // 0x115c
    int x1160;       // 0x1160
    int x1164;       // 0x1164
    int x1168;       // 0x1168
    int x116c;       // 0x116c
    int x1170;       // 0x1170
    int x1174;       // 0x1174
    int x1178;       // 0x1178
    int x117c;       // 0x117c
    int x1180;       // 0x1180
    int x1184;       // 0x1184
    int x1188;       // 0x1188
    int x118c;       // 0x118c
    int x1190;       // 0x1190
    int x1194;       // 0x1194
    int x1198;       // 0x1198
    int x119c;       // 0x119c
    int x11a0;       // 0x11a0
    int x11a4;       // 0x11a4
    int x11a8;       // 0x11a8
    int x11ac;       // 0x11ac
    int x11b0;       // 0x11b0
    int x11b4;       // 0x11b4
    int x11b8;       // 0x11b8
    int x11bc;       // 0x11bc
    int x11c0;       // 0x11c0
    int x11c4;       // 0x11c4
    int x11c8;       // 0x11c8
    int x11cc;       // 0x11cc
    int x11d0;       // 0x11d0
    int x11d4;       // 0x11d4
    int x11d8;       // 0x11d8
    int x11dc;       // 0x11dc
    int x11e0;       // 0x11e0
    int x11e4;       // 0x11e4
    int x11e8;       // 0x11e8
    int x11ec;       // 0x11ec
    int x11f0;       // 0x11f0
    int x11f4;       // 0x11f4
    int x11f8;       // 0x11f8
    int x11fc;       // 0x11fc
    int x1200;       // 0x1200
    int x1204;       // 0x1204
    int x1208;       // 0x1208
    int x120c;       // 0x120c
    int x1210;       // 0x1210
    int x1214;       // 0x1214
    int x1218;       // 0x1218
    int x121c;       // 0x121c
    int x1220;       // 0x1220
    int x1224;       // 0x1224
    int x1228;       // 0x1228
    int x122c;       // 0x122c
    int x1230;       // 0x1230
    int x1234;       // 0x1234
    int x1238;       // 0x1238
    int x123c;       // 0x123c
    int x1240;       // 0x1240
    int x1244;       // 0x1244
    int x1248;       // 0x1248
    int x124c;       // 0x124c
    int x1250;       // 0x1250
    int x1254;       // 0x1254
    int x1258;       // 0x1258
    int x125c;       // 0x125c
    int x1260;       // 0x1260
    int x1264;       // 0x1264
    int x1268;       // 0x1268
    int x126c;       // 0x126c
    int x1270;       // 0x1270
    int x1274;       // 0x1274
    int x1278;       // 0x1278
    int x127c;       // 0x127c
    int x1280;       // 0x1280
    int x1284;       // 0x1284
    int x1288;       // 0x1288
    int x128c;       // 0x128c
    int x1290;       // 0x1290
    int x1294;       // 0x1294
    int x1298;       // 0x1298
    int x129c;       // 0x129c
    int x12a0;       // 0x12a0
    int x12a4;       // 0x12a4
    int x12a8;       // 0x12a8
    int x12ac;       // 0x12ac
    int x12b0;       // 0x12b0
    int x12b4;       // 0x12b4
    int x12b8;       // 0x12b8
    int x12bc;       // 0x12bc
    int x12c0;       // 0x12c0
    int x12c4;       // 0x12c4
    int x12c8;       // 0x12c8
    int x12cc;       // 0x12cc
    int x12d0;       // 0x12d0
    int x12d4;       // 0x12d4
    int x12d8;       // 0x12d8
    int x12dc;       // 0x12dc
    int x12e0;       // 0x12e0
    int x12e4;       // 0x12e4
    int x12e8;       // 0x12e8
    int x12ec;       // 0x12ec
    int x12f0;       // 0x12f0
    int x12f4;       // 0x12f4
    int x12f8;       // 0x12f8
    int x12fc;       // 0x12fc
    int x1300;       // 0x1300
    int x1304;       // 0x1304
    int x1308;       // 0x1308
    int x130c;       // 0x130c
    int x1310;       // 0x1310
    int x1314;       // 0x1314
    int x1318;       // 0x1318
    int x131c;       // 0x131c
    int x1320;       // 0x1320
    int x1324;       // 0x1324
    int x1328;       // 0x1328
    int x132c;       // 0x132c
    int x1330;       // 0x1330
    int x1334;       // 0x1334
    int x1338;       // 0x1338
    int x133c;       // 0x133c
    int x1340;       // 0x1340
    int x1344;       // 0x1344
    int x1348;       // 0x1348
    int x134c;       // 0x134c
    int x1350;       // 0x1350
    int x1354;       // 0x1354
    int x1358;       // 0x1358
    int x135c;       // 0x135c
    int x1360;       // 0x1360
    int x1364;       // 0x1364
    int x1368;       // 0x1368
    int x136c;       // 0x136c
    int x1370;       // 0x1370
    int x1374;       // 0x1374
    int x1378;       // 0x1378
    int x137c;       // 0x137c
    int x1380;       // 0x1380
    int x1384;       // 0x1384
    int x1388;       // 0x1388
    int x138c;       // 0x138c
    int x1390;       // 0x1390
    int x1394;       // 0x1394
    int x1398;       // 0x1398
    int x139c;       // 0x139c
    int x13a0;       // 0x13a0
    int x13a4;       // 0x13a4
    int x13a8;       // 0x13a8
    int x13ac;       // 0x13ac
    int x13b0;       // 0x13b0
    int x13b4;       // 0x13b4
    int x13b8;       // 0x13b8
    int x13bc;       // 0x13bc
    int x13c0;       // 0x13c0
    int x13c4;       // 0x13c4
    int x13c8;       // 0x13c8
    int x13cc;       // 0x13cc
    int x13d0;       // 0x13d0
    int x13d4;       // 0x13d4
    int x13d8;       // 0x13d8
    int x13dc;       // 0x13dc
    int x13e0;       // 0x13e0
    int x13e4;       // 0x13e4
    int x13e8;       // 0x13e8
    int x13ec;       // 0x13ec
    int x13f0;       // 0x13f0
    int x13f4;       // 0x13f4
    int x13f8;       // 0x13f8
    int x13fc;       // 0x13fc
    int x1400;       // 0x1400
    int x1404;       // 0x1404
    int x1408;       // 0x1408
    int x140c;       // 0x140c
    int x1410;       // 0x1410
    int x1414;       // 0x1414
    int x1418;       // 0x1418
    int x141c;       // 0x141c
    int x1420;       // 0x1420
    int x1424;       // 0x1424
    int x1428;       // 0x1428
    int x142c;       // 0x142c
    int x1430;       // 0x1430
    int x1434;       // 0x1434
    int x1438;       // 0x1438
    int x143c;       // 0x143c
    int x1440;       // 0x1440
    int x1444;       // 0x1444
    int x1448;       // 0x1448
    int x144c;       // 0x144c
    int x1450;       // 0x1450
    int x1454;       // 0x1454
    int x1458;       // 0x1458
    int x145c;       // 0x145c
    int x1460;       // 0x1460
    int x1464;       // 0x1464
    int x1468;       // 0x1468
    int x146c;       // 0x146c
    int x1470;       // 0x1470
    int x1474;       // 0x1474
    int x1478;       // 0x1478
    int x147c;       // 0x147c
    int x1480;       // 0x1480
    int x1484;       // 0x1484
    int x1488;       // 0x1488
    int x148c;       // 0x148c
    int x1490;       // 0x1490
    int x1494;       // 0x1494
    int x1498;       // 0x1498
    int x149c;       // 0x149c
    int x14a0;       // 0x14a0
    int x14a4;       // 0x14a4
    int x14a8;       // 0x14a8
    int x14ac;       // 0x14ac
    int x14b0;       // 0x14b0
    int x14b4;       // 0x14b4
    int x14b8;       // 0x14b8
    int x14bc;       // 0x14bc
    int x14c0;       // 0x14c0
    int x14c4;       // 0x14c4
    int x14c8;       // 0x14c8
    int x14cc;       // 0x14cc
    int x14d0;       // 0x14d0
    int x14d4;       // 0x14d4
    int x14d8;       // 0x14d8
    int x14dc;       // 0x14dc
    int x14e0;       // 0x14e0
    int x14e4;       // 0x14e4
    int x14e8;       // 0x14e8
    int x14ec;       // 0x14ec
    int x14f0;       // 0x14f0
    int x14f4;       // 0x14f4
    int x14f8;       // 0x14f8
    int x14fc;       // 0x14fc
    int x1500;       // 0x1500
    int x1504;       // 0x1504
    int x1508;       // 0x1508
    int x150c;       // 0x150c
    int x1510;       // 0x1510
    int x1514;       // 0x1514
    int x1518;       // 0x1518
    int x151c;       // 0x151c
    int x1520;       // 0x1520
    int x1524;       // 0x1524
    int x1528;       // 0x1528
    int x152c;       // 0x152c
    int x1530;       // 0x1530
    int x1534;       // 0x1534
    int x1538;       // 0x1538
    int x153c;       // 0x153c
    int x1540;       // 0x1540
    int x1544;       // 0x1544
    int x1548;       // 0x1548
    int x154c;       // 0x154c
    int x1550;       // 0x1550
    int x1554;       // 0x1554
    int x1558;       // 0x1558
    int x155c;       // 0x155c
    int x1560;       // 0x1560
    int x1564;       // 0x1564
    int x1568;       // 0x1568
    int x156c;       // 0x156c
    int x1570;       // 0x1570
    int x1574;       // 0x1574
    int x1578;       // 0x1578
    int x157c;       // 0x157c
    int x1580;       // 0x1580
    int x1584;       // 0x1584
    int x1588;       // 0x1588
    int x158c;       // 0x158c
    int x1590;       // 0x1590
    int x1594;       // 0x1594
    int x1598;       // 0x1598
    int x159c;       // 0x159c
    int x15a0;       // 0x15a0
    int x15a4;       // 0x15a4
    int x15a8;       // 0x15a8
    int x15ac;       // 0x15ac
    int x15b0;       // 0x15b0
    int x15b4;       // 0x15b4
    int x15b8;       // 0x15b8
    int x15bc;       // 0x15bc
    int x15c0;       // 0x15c0
    int x15c4;       // 0x15c4
    int x15c8;       // 0x15c8
    int x15cc;       // 0x15cc
    int x15d0;       // 0x15d0
    int x15d4;       // 0x15d4
    int x15d8;       // 0x15d8
    int x15dc;       // 0x15dc
    int x15e0;       // 0x15e0
    int x15e4;       // 0x15e4
    int x15e8;       // 0x15e8
    int x15ec;       // 0x15ec
    int x15f0;       // 0x15f0
    int x15f4;       // 0x15f4
    int x15f8;       // 0x15f8
    int x15fc;       // 0x15fc
    int x1600;       // 0x1600
    int x1604;       // 0x1604
    int x1608;       // 0x1608
    int x160c;       // 0x160c
    int x1610;       // 0x1610
    int x1614;       // 0x1614
    int x1618;       // 0x1618
    int x161c;       // 0x161c
    int x1620;       // 0x1620
    int x1624;       // 0x1624
    int x1628;       // 0x1628
    int x162c;       // 0x162c
    int x1630;       // 0x1630
    int x1634;       // 0x1634
    int x1638;       // 0x1638
    int x163c;       // 0x163c
    int x1640;       // 0x1640
    int x1644;       // 0x1644
    int x1648;       // 0x1648
    int x164c;       // 0x164c
    int x1650;       // 0x1650
    int x1654;       // 0x1654
    int x1658;       // 0x1658
    int x165c;       // 0x165c
    int x1660;       // 0x1660
    int x1664;       // 0x1664
    int x1668;       // 0x1668
    int x166c;       // 0x166c
    int x1670;       // 0x1670
    int x1674;       // 0x1674
    int x1678;       // 0x1678
    int x167c;       // 0x167c
    int x1680;       // 0x1680
    int x1684;       // 0x1684
    int x1688;       // 0x1688
    int x168c;       // 0x168c
    int x1690;       // 0x1690
    int x1694;       // 0x1694
    int x1698;       // 0x1698
    int x169c;       // 0x169c
    int x16a0;       // 0x16a0
    int x16a4;       // 0x16a4
    int x16a8;       // 0x16a8
    int x16ac;       // 0x16ac
    int x16b0;       // 0x16b0
    int x16b4;       // 0x16b4
    int x16b8;       // 0x16b8
    int x16bc;       // 0x16bc
    int x16c0;       // 0x16c0
    int x16c4;       // 0x16c4
    int x16c8;       // 0x16c8
    int x16cc;       // 0x16cc
    int x16d0;       // 0x16d0
    int x16d4;       // 0x16d4
    int x16d8;       // 0x16d8
    int x16dc;       // 0x16dc
    int x16e0;       // 0x16e0
    int x16e4;       // 0x16e4
    int x16e8;       // 0x16e8
    int x16ec;       // 0x16ec
    int x16f0;       // 0x16f0
    int x16f4;       // 0x16f4
    int x16f8;       // 0x16f8
    int x16fc;       // 0x16fc
    int x1700;       // 0x1700
    int x1704;       // 0x1704
    int x1708;       // 0x1708
    int x170c;       // 0x170c
    int x1710;       // 0x1710
    int x1714;       // 0x1714
    int x1718;       // 0x1718
    int x171c;       // 0x171c
    int x1720;       // 0x1720
    int x1724;       // 0x1724
    int x1728;       // 0x1728
    int x172c;       // 0x172c
    int x1730;       // 0x1730
    int x1734;       // 0x1734
    int x1738;       // 0x1738
    int x173c;       // 0x173c
    int x1740;       // 0x1740
    int x1744;       // 0x1744
    int x1748;       // 0x1748
    int x174c;       // 0x174c
    int x1750;       // 0x1750
    int x1754;       // 0x1754
    int x1758;       // 0x1758
    int x175c;       // 0x175c
    int x1760;       // 0x1760
    int x1764;       // 0x1764
    int x1768;       // 0x1768
    int x176c;       // 0x176c
    int x1770;       // 0x1770
    int x1774;       // 0x1774
    int x1778;       // 0x1778
    int x177c;       // 0x177c
    int x1780;       // 0x1780
    int x1784;       // 0x1784
    int x1788;       // 0x1788
    int x178c;       // 0x178c
    int x1790;       // 0x1790
    int x1794;       // 0x1794
    int x1798;       // 0x1798
    int x179c;       // 0x179c
    int x17a0;       // 0x17a0
    int x17a4;       // 0x17a4
    int x17a8;       // 0x17a8
    int x17ac;       // 0x17ac
    int x17b0;       // 0x17b0
    int x17b4;       // 0x17b4
    int x17b8;       // 0x17b8
    int x17bc;       // 0x17bc
    int x17c0;       // 0x17c0
    int x17c4;       // 0x17c4
    int x17c8;       // 0x17c8
    int x17cc;       // 0x17cc
    int x17d0;       // 0x17d0
    int x17d4;       // 0x17d4
    int x17d8;       // 0x17d8
    int x17dc;       // 0x17dc
    int x17e0;       // 0x17e0
    int x17e4;       // 0x17e4
    int x17e8;       // 0x17e8
    int x17ec;       // 0x17ec
    int x17f0;       // 0x17f0
    int x17f4;       // 0x17f4
    int x17f8;       // 0x17f8
    int x17fc;       // 0x17fc
    int x1800;       // 0x1800
    int x1804;       // 0x1804
    int x1808;       // 0x1808
    int x180c;       // 0x180c
    int x1810;       // 0x1810
    int x1814;       // 0x1814
    int x1818;       // 0x1818
    int x181c;       // 0x181c
    int x1820;       // 0x1820
    int x1824;       // 0x1824
    int x1828;       // 0x1828
    int x182c;       // 0x182c
    int x1830;       // 0x1830
    int x1834;       // 0x1834
    int x1838;       // 0x1838
    int x183c;       // 0x183c
    int x1840;       // 0x1840
    int x1844;       // 0x1844
    int x1848;       // 0x1848
    int x184c;       // 0x184c
    int x1850;       // 0x1850
    int x1854;       // 0x1854
    int x1858;       // 0x1858
    int x185c;       // 0x185c
    int x1860;       // 0x1860
    int x1864;       // 0x1864
    int x1868;       // 0x1868
    int x186c;       // 0x186c
    int x1870;       // 0x1870
    int x1874;       // 0x1874
    int x1878;       // 0x1878
    int x187c;       // 0x187c
    int x1880;       // 0x1880
    int x1884;       // 0x1884
    int x1888;       // 0x1888
    int x188c;       // 0x188c
    int x1890;       // 0x1890
    int x1894;       // 0x1894
    int x1898;       // 0x1898
    int x189c;       // 0x189c
    int x18a0;       // 0x18a0
    int x18a4;       // 0x18a4
    int x18a8;       // 0x18a8
    int x18ac;       // 0x18ac
    int x18b0;       // 0x18b0
    int x18b4;       // 0x18b4
    int x18b8;       // 0x18b8
    int x18bc;       // 0x18bc
    int x18c0;       // 0x18c0
    int x18c4;       // 0x18c4
    int x18c8;       // 0x18c8
    int x18cc;       // 0x18cc
    int x18d0;       // 0x18d0
    int x18d4;       // 0x18d4
    int x18d8;       // 0x18d8
    int x18dc;       // 0x18dc
    int x18e0;       // 0x18e0
    int x18e4;       // 0x18e4
    int x18e8;       // 0x18e8
    int x18ec;       // 0x18ec
    int x18f0;       // 0x18f0
    int x18f4;       // 0x18f4
    int x18f8;       // 0x18f8
    int x18fc;       // 0x18fc
    int x1900;       // 0x1900
    int x1904;       // 0x1904
    int x1908;       // 0x1908
    int x190c;       // 0x190c
    int x1910;       // 0x1910
    int x1914;       // 0x1914
    int x1918;       // 0x1918
    int x191c;       // 0x191c
    int x1920;       // 0x1920
    int x1924;       // 0x1924
    int x1928;       // 0x1928
    int x192c;       // 0x192c
    int x1930;       // 0x1930
    int x1934;       // 0x1934
    int x1938;       // 0x1938
    int x193c;       // 0x193c
    int x1940;       // 0x1940
    int x1944;       // 0x1944
    int x1948;       // 0x1948
    int x194c;       // 0x194c
    int x1950;       // 0x1950
    int x1954;       // 0x1954
    int x1958;       // 0x1958
    int x195c;       // 0x195c
    int x1960;       // 0x1960
    int x1964;       // 0x1964
    int x1968;       // 0x1968
    int x196c;       // 0x196c
    int x1970;       // 0x1970
    int x1974;       // 0x1974
    int x1978;       // 0x1978
    int x197c;       // 0x197c
    int x1980;       // 0x1980
    int x1984;       // 0x1984
    int x1988;       // 0x1988
    int x198c;       // 0x198c
    int x1990;       // 0x1990
    int x1994;       // 0x1994
    int x1998;       // 0x1998
    int x199c;       // 0x199c
    int x19a0;       // 0x19a0
    int x19a4;       // 0x19a4
    int x19a8;       // 0x19a8
    int x19ac;       // 0x19ac
    int x19b0;       // 0x19b0
    int x19b4;       // 0x19b4
    int x19b8;       // 0x19b8
    int x19bc;       // 0x19bc
    int x19c0;       // 0x19c0
    int x19c4;       // 0x19c4
    int x19c8;       // 0x19c8
    int x19cc;       // 0x19cc
    int x19d0;       // 0x19d0
    int x19d4;       // 0x19d4
    int x19d8;       // 0x19d8
    int x19dc;       // 0x19dc
    int x19e0;       // 0x19e0
    int x19e4;       // 0x19e4
    int x19e8;       // 0x19e8
    int x19ec;       // 0x19ec
    int x19f0;       // 0x19f0
    int x19f4;       // 0x19f4
    int x19f8;       // 0x19f8
    int x19fc;       // 0x19fc
    int x1a00;       // 0x1a00
    int x1a04;       // 0x1a04
    int x1a08;       // 0x1a08
    int x1a0c;       // 0x1a0c
    int x1a10;       // 0x1a10
    int x1a14;       // 0x1a14
    int x1a18;       // 0x1a18
    int x1a1c;       // 0x1a1c
    int x1a20;       // 0x1a20
    int x1a24;       // 0x1a24
    int x1a28;       // 0x1a28
    int x1a2c;       // 0x1a2c
    int x1a30;       // 0x1a30
    int x1a34;       // 0x1a34
    int x1a38;       // 0x1a38
    int x1a3c;       // 0x1a3c
    int x1a40;       // 0x1a40
    int x1a44;       // 0x1a44
    int x1a48;       // 0x1a48
    int x1a4c;       // 0x1a4c
    int x1a50;       // 0x1a50
    int x1a54;       // 0x1a54
    int x1a58;       // 0x1a58
    int x1a5c;       // 0x1a5c
    int x1a60;       // 0x1a60
    int x1a64;       // 0x1a64
    int x1a68;       // 0x1a68
    int x1a6c;       // 0x1a6c
    int x1a70;       // 0x1a70
    int x1a74;       // 0x1a74
    int x1a78;       // 0x1a78
    int x1a7c;       // 0x1a7c
    int x1a80;       // 0x1a80
    int x1a84;       // 0x1a84
    int x1a88;       // 0x1a88
    int x1a8c;       // 0x1a8c
    int x1a90;       // 0x1a90
    int x1a94;       // 0x1a94
    int x1a98;       // 0x1a98
    int x1a9c;       // 0x1a9c
    int x1aa0;       // 0x1aa0
    int x1aa4;       // 0x1aa4
    int x1aa8;       // 0x1aa8
    int x1aac;       // 0x1aac
    int x1ab0;       // 0x1ab0
    int x1ab4;       // 0x1ab4
    int x1ab8;       // 0x1ab8
    int x1abc;       // 0x1abc
    int x1ac0;       // 0x1ac0
    int x1ac4;       // 0x1ac4
    int x1ac8;       // 0x1ac8
    int x1acc;       // 0x1acc
    int x1ad0;       // 0x1ad0
    int x1ad4;       // 0x1ad4
    int x1ad8;       // 0x1ad8
    int x1adc;       // 0x1adc
    int x1ae0;       // 0x1ae0
    int x1ae4;       // 0x1ae4
    int x1ae8;       // 0x1ae8
    int x1aec;       // 0x1aec
    int x1af0;       // 0x1af0
    int x1af4;       // 0x1af4
    int x1af8;       // 0x1af8
    int x1afc;       // 0x1afc
    int x1b00;       // 0x1b00
    int x1b04;       // 0x1b04
    int x1b08;       // 0x1b08
    int x1b0c;       // 0x1b0c
    int x1b10;       // 0x1b10
    int x1b14;       // 0x1b14
    int x1b18;       // 0x1b18
    int x1b1c;       // 0x1b1c
    int x1b20;       // 0x1b20
    int x1b24;       // 0x1b24
    int x1b28;       // 0x1b28
    int x1b2c;       // 0x1b2c
    int x1b30;       // 0x1b30
    int x1b34;       // 0x1b34
    int x1b38;       // 0x1b38
    int x1b3c;       // 0x1b3c
    int x1b40;       // 0x1b40
    int x1b44;       // 0x1b44
    int x1b48;       // 0x1b48
    int x1b4c;       // 0x1b4c
    int x1b50;       // 0x1b50
    int x1b54;       // 0x1b54
    int x1b58;       // 0x1b58
    int x1b5c;       // 0x1b5c
    int x1b60;       // 0x1b60
    int x1b64;       // 0x1b64
    int x1b68;       // 0x1b68
    int x1b6c;       // 0x1b6c
    int x1b70;       // 0x1b70
    int x1b74;       // 0x1b74
    int x1b78;       // 0x1b78
    int x1b7c;       // 0x1b7c
    int x1b80;       // 0x1b80
    int x1b84;       // 0x1b84
    int x1b88;       // 0x1b88
    int x1b8c;       // 0x1b8c
    int x1b90;       // 0x1b90
    int x1b94;       // 0x1b94
    int x1b98;       // 0x1b98
    int x1b9c;       // 0x1b9c
    int x1ba0;       // 0x1ba0
    int x1ba4;       // 0x1ba4
    int x1ba8;       // 0x1ba8
    int x1bac;       // 0x1bac
    int x1bb0;       // 0x1bb0
    int x1bb4;       // 0x1bb4
    int x1bb8;       // 0x1bb8
    int x1bbc;       // 0x1bbc
    int x1bc0;       // 0x1bc0
    int x1bc4;       // 0x1bc4
    int x1bc8;       // 0x1bc8
    int x1bcc;       // 0x1bcc
    int x1bd0;       // 0x1bd0
    int x1bd4;       // 0x1bd4
    int x1bd8;       // 0x1bd8
    int x1bdc;       // 0x1bdc
    int x1be0;       // 0x1be0
    int x1be4;       // 0x1be4
    int x1be8;       // 0x1be8
    int x1bec;       // 0x1bec
    int x1bf0;       // 0x1bf0
    int x1bf4;       // 0x1bf4
    int x1bf8;       // 0x1bf8
    int x1bfc;       // 0x1bfc
    int x1c00;       // 0x1c00
    int x1c04;       // 0x1c04
    int x1c08;       // 0x1c08
    int x1c0c;       // 0x1c0c
    int x1c10;       // 0x1c10
    int x1c14;       // 0x1c14
    int x1c18;       // 0x1c18
    int x1c1c;       // 0x1c1c
    int x1c20;       // 0x1c20
    int x1c24;       // 0x1c24
    int x1c28;       // 0x1c28
    int x1c2c;       // 0x1c2c
    int x1c30;       // 0x1c30
    int x1c34;       // 0x1c34
    int x1c38;       // 0x1c38
    int x1c3c;       // 0x1c3c
    int x1c40;       // 0x1c40
    int x1c44;       // 0x1c44
    int x1c48;       // 0x1c48
    int x1c4c;       // 0x1c4c
    int x1c50;       // 0x1c50
    int x1c54;       // 0x1c54
    int x1c58;       // 0x1c58
    int x1c5c;       // 0x1c5c
    int x1c60;       // 0x1c60
    int x1c64;       // 0x1c64
    int x1c68;       // 0x1c68
    int x1c6c;       // 0x1c6c
    int x1c70;       // 0x1c70
    int x1c74;       // 0x1c74
    int x1c78;       // 0x1c78
    int x1c7c;       // 0x1c7c
    int x1c80;       // 0x1c80
    int x1c84;       // 0x1c84
    int x1c88;       // 0x1c88
    int x1c8c;       // 0x1c8c
    int x1c90;       // 0x1c90
    int x1c94;       // 0x1c94
    int x1c98;       // 0x1c98
    int x1c9c;       // 0x1c9c
    int x1ca0;       // 0x1ca0
    int x1ca4;       // 0x1ca4
    int x1ca8;       // 0x1ca8
    int x1cac;       // 0x1cac
    int x1cb0;       // 0x1cb0
    int x1cb4;       // 0x1cb4
    int x1cb8;       // 0x1cb8
    int x1cbc;       // 0x1cbc
    int x1cc0;       // 0x1cc0
    int x1cc4;       // 0x1cc4
    int x1cc8;       // 0x1cc8
    int x1ccc;       // 0x1ccc
    int x1cd0;       // 0x1cd0
    int x1cd4;       // 0x1cd4
    int x1cd8;       // 0x1cd8
    int x1cdc;       // 0x1cdc
    int x1ce0;       // 0x1ce0
    int x1ce4;       // 0x1ce4
    int x1ce8;       // 0x1ce8
    int x1cec;       // 0x1cec
    int x1cf0;       // 0x1cf0
    int x1cf4;       // 0x1cf4
    int x1cf8;       // 0x1cf8
    int x1cfc;       // 0x1cfc
    int x1d00;       // 0x1d00
    int x1d04;       // 0x1d04
    int x1d08;       // 0x1d08
    int x1d0c;       // 0x1d0c
    int x1d10;       // 0x1d10
    int x1d14;       // 0x1d14
    int x1d18;       // 0x1d18
    int x1d1c;       // 0x1d1c
    int x1d20;       // 0x1d20
    int x1d24;       // 0x1d24
    int x1d28;       // 0x1d28
    int x1d2c;       // 0x1d2c
    int x1d30;       // 0x1d30
    int x1d34;       // 0x1d34
    int x1d38;       // 0x1d38
    int x1d3c;       // 0x1d3c
    int x1d40;       // 0x1d40
    int x1d44;       // 0x1d44
    int x1d48;       // 0x1d48
    int x1d4c;       // 0x1d4c
    int x1d50;       // 0x1d50
    int x1d54;       // 0x1d54
    int x1d58;       // 0x1d58
    int x1d5c;       // 0x1d5c
    int x1d60;       // 0x1d60
    int x1d64;       // 0x1d64
    int x1d68;       // 0x1d68
    int x1d6c;       // 0x1d6c
    int x1d70;       // 0x1d70
    int x1d74;       // 0x1d74
    int x1d78;       // 0x1d78
    int x1d7c;       // 0x1d7c
    int x1d80;       // 0x1d80
    int x1d84;       // 0x1d84
    int x1d88;       // 0x1d88
    int x1d8c;       // 0x1d8c
    int x1d90;       // 0x1d90
    int x1d94;       // 0x1d94
    int x1d98;       // 0x1d98
    int x1d9c;       // 0x1d9c
    int x1da0;       // 0x1da0
    int x1da4;       // 0x1da4
    int x1da8;       // 0x1da8
    int x1dac;       // 0x1dac
    int x1db0;       // 0x1db0
    int x1db4;       // 0x1db4
    int x1db8;       // 0x1db8
    int x1dbc;       // 0x1dbc
    int x1dc0;       // 0x1dc0
    int x1dc4;       // 0x1dc4
    int x1dc8;       // 0x1dc8
    int x1dcc;       // 0x1dcc
    int x1dd0;       // 0x1dd0
    int x1dd4;       // 0x1dd4
    int x1dd8;       // 0x1dd8
    int x1ddc;       // 0x1ddc
    int x1de0;       // 0x1de0
    int x1de4;       // 0x1de4
    int x1de8;       // 0x1de8
    int x1dec;       // 0x1dec
    int x1df0;       // 0x1df0
    int x1df4;       // 0x1df4
    int x1df8;       // 0x1df8
    int x1dfc;       // 0x1dfc
    int x1e00;       // 0x1e00
    int x1e04;       // 0x1e04
    int x1e08;       // 0x1e08
    int x1e0c;       // 0x1e0c
    int x1e10;       // 0x1e10
    int x1e14;       // 0x1e14
    int x1e18;       // 0x1e18
    int x1e1c;       // 0x1e1c
    int x1e20;       // 0x1e20
    int x1e24;       // 0x1e24
    int x1e28;       // 0x1e28
    int x1e2c;       // 0x1e2c
    int x1e30;       // 0x1e30
    int x1e34;       // 0x1e34
    int x1e38;       // 0x1e38
    int x1e3c;       // 0x1e3c
    int x1e40;       // 0x1e40
    int x1e44;       // 0x1e44
    int x1e48;       // 0x1e48
    int x1e4c;       // 0x1e4c
    int x1e50;       // 0x1e50
    int x1e54;       // 0x1e54
    int x1e58;       // 0x1e58
    int x1e5c;       // 0x1e5c
    int x1e60;       // 0x1e60
    int x1e64;       // 0x1e64
    int x1e68;       // 0x1e68
    int x1e6c;       // 0x1e6c
    int x1e70;       // 0x1e70
    int x1e74;       // 0x1e74
    int x1e78;       // 0x1e78
    int x1e7c;       // 0x1e7c
    int x1e80;       // 0x1e80
    int x1e84;       // 0x1e84
    int x1e88;       // 0x1e88
    int x1e8c;       // 0x1e8c
    int x1e90;       // 0x1e90
    int x1e94;       // 0x1e94
    int x1e98;       // 0x1e98
    int x1e9c;       // 0x1e9c
    int x1ea0;       // 0x1ea0
    int x1ea4;       // 0x1ea4
    int x1ea8;       // 0x1ea8
    int x1eac;       // 0x1eac
    int x1eb0;       // 0x1eb0
    int x1eb4;       // 0x1eb4
    int x1eb8;       // 0x1eb8
    int x1ebc;       // 0x1ebc
    int x1ec0;       // 0x1ec0
    int x1ec4;       // 0x1ec4
    int x1ec8;       // 0x1ec8
    int x1ecc;       // 0x1ecc
    int x1ed0;       // 0x1ed0
    int x1ed4;       // 0x1ed4
    int x1ed8;       // 0x1ed8
    int x1edc;       // 0x1edc
    int x1ee0;       // 0x1ee0
    int x1ee4;       // 0x1ee4
    int x1ee8;       // 0x1ee8
    int x1eec;       // 0x1eec
    int x1ef0;       // 0x1ef0
    int x1ef4;       // 0x1ef4
    int x1ef8;       // 0x1ef8
    int x1efc;       // 0x1efc
    int x1f00;       // 0x1f00
    int x1f04;       // 0x1f04
    int x1f08;       // 0x1f08
    int x1f0c;       // 0x1f0c
    int x1f10;       // 0x1f10
    int x1f14;       // 0x1f14
    int x1f18;       // 0x1f18
    int x1f1c;       // 0x1f1c
    int x1f20;       // 0x1f20
    int x1f24;       // 0x1f24
    int x1f28;       // 0x1f28
    int x1f2c;       // 0x1f2c
    int x1f30;       // 0x1f30
    int x1f34;       // 0x1f34
    int x1f38;       // 0x1f38
    int x1f3c;       // 0x1f3c
    int x1f40;       // 0x1f40
    int x1f44;       // 0x1f44
    int x1f48;       // 0x1f48
    int x1f4c;       // 0x1f4c
    int x1f50;       // 0x1f50
    int x1f54;       // 0x1f54
    int x1f58;       // 0x1f58
    int x1f5c;       // 0x1f5c
    int x1f60;       // 0x1f60
    int x1f64;       // 0x1f64
    int x1f68;       // 0x1f68
    int x1f6c;       // 0x1f6c
    int x1f70;       // 0x1f70
    int x1f74;       // 0x1f74
    int x1f78;       // 0x1f78
    int x1f7c;       // 0x1f7c
    int x1f80;       // 0x1f80
    int x1f84;       // 0x1f84
    int x1f88;       // 0x1f88
    int x1f8c;       // 0x1f8c
    int x1f90;       // 0x1f90
    int x1f94;       // 0x1f94
    int x1f98;       // 0x1f98
    int x1f9c;       // 0x1f9c
    int x1fa0;       // 0x1fa0
    int x1fa4;       // 0x1fa4
    int x1fa8;       // 0x1fa8
    int x1fac;       // 0x1fac
    int x1fb0;       // 0x1fb0
    int x1fb4;       // 0x1fb4
    int x1fb8;       // 0x1fb8
    int x1fbc;       // 0x1fbc
    int x1fc0;       // 0x1fc0
    int x1fc4;       // 0x1fc4
    int x1fc8;       // 0x1fc8
    int x1fcc;       // 0x1fcc
    int x1fd0;       // 0x1fd0
    int x1fd4;       // 0x1fd4
    int x1fd8;       // 0x1fd8
    int x1fdc;       // 0x1fdc
    int x1fe0;       // 0x1fe0
    int x1fe4;       // 0x1fe4
    int x1fe8;       // 0x1fe8
    int x1fec;       // 0x1fec
    int x1ff0;       // 0x1ff0
    int x1ff4;       // 0x1ff4
    int x1ff8;       // 0x1ff8
    int x1ffc;       // 0x1ffc
    int x2000;       // 0x2000
    int x2004;       // 0x2004
    int x2008;       // 0x2008
    int x200c;       // 0x200c
    int x2010;       // 0x2010
    int x2014;       // 0x2014
    int x2018;       // 0x2018
    int x201c;       // 0x201c
    int x2020;       // 0x2020
    int x2024;       // 0x2024
    int x2028;       // 0x2028
    int x202c;       // 0x202c
    int x2030;       // 0x2030
    int x2034;       // 0x2034
    int x2038;       // 0x2038
    int x203c;       // 0x203c
    int x2040;       // 0x2040
    int x2044;       // 0x2044
    int x2048;       // 0x2048
    int x204c;       // 0x204c
    int x2050;       // 0x2050
    int x2054;       // 0x2054
    int x2058;       // 0x2058
    int x205c;       // 0x205c
    int x2060;       // 0x2060
    int x2064;       // 0x2064
    int x2068;       // 0x2068
    int x206c;       // 0x206c
    int x2070;       // 0x2070
    int x2074;       // 0x2074
    int x2078;       // 0x2078
    int x207c;       // 0x207c
    int x2080;       // 0x2080
    int x2084;       // 0x2084
    int x2088;       // 0x2088
    int x208c;       // 0x208c
    int x2090;       // 0x2090
    int x2094;       // 0x2094
    int x2098;       // 0x2098
    int x209c;       // 0x209c
    int x20a0;       // 0x20a0
    int x20a4;       // 0x20a4
    int x20a8;       // 0x20a8
    int x20ac;       // 0x20ac
    int x20b0;       // 0x20b0
    int x20b4;       // 0x20b4
    int x20b8;       // 0x20b8
    int x20bc;       // 0x20bc
    int x20c0;       // 0x20c0
    int x20c4;       // 0x20c4
    int x20c8;       // 0x20c8
    int x20cc;       // 0x20cc
    int x20d0;       // 0x20d0
    int x20d4;       // 0x20d4
    int x20d8;       // 0x20d8
    int x20dc;       // 0x20dc
    int x20e0;       // 0x20e0
    int x20e4;       // 0x20e4
    int x20e8;       // 0x20e8
    int x20ec;       // 0x20ec
    int x20f0;       // 0x20f0
    int x20f4;       // 0x20f4
    int x20f8;       // 0x20f8
    int x20fc;       // 0x20fc
    int x2100;       // 0x2100
    int x2104;       // 0x2104
    int x2108;       // 0x2108
    int x210c;       // 0x210c
    int x2110;       // 0x2110
    int x2114;       // 0x2114
    int x2118;       // 0x2118
    int x211c;       // 0x211c
    int x2120;       // 0x2120
    int x2124;       // 0x2124
    int x2128;       // 0x2128
    int x212c;       // 0x212c
    int x2130;       // 0x2130
    int x2134;       // 0x2134
    int x2138;       // 0x2138
    int x213c;       // 0x213c
    int x2140;       // 0x2140
    int x2144;       // 0x2144
    int x2148;       // 0x2148
    int x214c;       // 0x214c
    int x2150;       // 0x2150
    int x2154;       // 0x2154
    int x2158;       // 0x2158
    int x215c;       // 0x215c
    int x2160;       // 0x2160
    int x2164;       // 0x2164
    int x2168;       // 0x2168
    int x216c;       // 0x216c
    int x2170;       // 0x2170
    int x2174;       // 0x2174
    int x2178;       // 0x2178
    int x217c;       // 0x217c
    int x2180;       // 0x2180
    int x2184;       // 0x2184
    int x2188;       // 0x2188
    int x218c;       // 0x218c
    int x2190;       // 0x2190
    int x2194;       // 0x2194
    int x2198;       // 0x2198
    int x219c;       // 0x219c
    int x21a0;       // 0x21a0
    int x21a4;       // 0x21a4
    int x21a8;       // 0x21a8
    int x21ac;       // 0x21ac
    int x21b0;       // 0x21b0
    int x21b4;       // 0x21b4
    int x21b8;       // 0x21b8
    int x21bc;       // 0x21bc
    int x21c0;       // 0x21c0
    int x21c4;       // 0x21c4
    int x21c8;       // 0x21c8
    int x21cc;       // 0x21cc
    int x21d0;       // 0x21d0
    int x21d4;       // 0x21d4
    int x21d8;       // 0x21d8
    int x21dc;       // 0x21dc
    int x21e0;       // 0x21e0
    int x21e4;       // 0x21e4
    int x21e8;       // 0x21e8
    int x21ec;       // 0x21ec
    int x21f0;       // 0x21f0
    int x21f4;       // 0x21f4
    int x21f8;       // 0x21f8
    int x21fc;       // 0x21fc
    int x2200;       // 0x2200
    int x2204;       // 0x2204
    int x2208;       // 0x2208
    int x220c;       // 0x220c
    int x2210;       // 0x2210
    int x2214;       // 0x2214
    int x2218;       // 0x2218
    int x221c;       // 0x221c
    int x2220;       // 0x2220
    int x2224;       // 0x2224
    int x2228;       // 0x2228
    int x222c;       // 0x222c
    int x2230;       // 0x2230
    int x2234;       // 0x2234
    int x2238;       // 0x2238
    int x223c;       // 0x223c
    int x2240;       // 0x2240
    int x2244;       // 0x2244
    int x2248;       // 0x2248
    int x224c;       // 0x224c
    int x2250;       // 0x2250
    int x2254;       // 0x2254
    int x2258;       // 0x2258
    int x225c;       // 0x225c
    int x2260;       // 0x2260
    int x2264;       // 0x2264
    int x2268;       // 0x2268
    int x226c;       // 0x226c
    int x2270;       // 0x2270
    int x2274;       // 0x2274
    int x2278;       // 0x2278
    int x227c;       // 0x227c
    int x2280;       // 0x2280
    int x2284;       // 0x2284
    int x2288;       // 0x2288
    int x228c;       // 0x228c
    int x2290;       // 0x2290
    int x2294;       // 0x2294
    int x2298;       // 0x2298
    int x229c;       // 0x229c
    int x22a0;       // 0x22a0
    int x22a4;       // 0x22a4
    int x22a8;       // 0x22a8
    int x22ac;       // 0x22ac
    int x22b0;       // 0x22b0
    int x22b4;       // 0x22b4
    int x22b8;       // 0x22b8
    int x22bc;       // 0x22bc
    int x22c0;       // 0x22c0
    int x22c4;       // 0x22c4
    int x22c8;       // 0x22c8
    int x22cc;       // 0x22cc
    int x22d0;       // 0x22d0
    int x22d4;       // 0x22d4
    int x22d8;       // 0x22d8
    int x22dc;       // 0x22dc
    int x22e0;       // 0x22e0
    int x22e4;       // 0x22e4
    int x22e8;       // 0x22e8
    int x22ec;       // 0x22ec
    int x22f0;       // 0x22f0
    int x22f4;       // 0x22f4
    int x22f8;       // 0x22f8
    int x22fc;       // 0x22fc
    int x2300;       // 0x2300
    int x2304;       // 0x2304
    int x2308;       // 0x2308
    int x230c;       // 0x230c
    int x2310;       // 0x2310
    int x2314;       // 0x2314
    int x2318;       // 0x2318
    int x231c;       // 0x231c
    int x2320;       // 0x2320
    int x2324;       // 0x2324
    int x2328;       // 0x2328
    int x232c;       // 0x232c
    int x2330;       // 0x2330
    int x2334;       // 0x2334
    int x2338;       // 0x2338
    int x233c;       // 0x233c
    int x2340;       // 0x2340
    int x2344;       // 0x2344
    int x2348;       // 0x2348
    int x234c;       // 0x234c
    int x2350;       // 0x2350
    int x2354;       // 0x2354
    int x2358;       // 0x2358
    int x235c;       // 0x235c
    int x2360;       // 0x2360
    int x2364;       // 0x2364
    int x2368;       // 0x2368
    int x236c;       // 0x236c
    int x2370;       // 0x2370
    int x2374;       // 0x2374
    int x2378;       // 0x2378
    int x237c;       // 0x237c
    int x2380;       // 0x2380
    int x2384;       // 0x2384
    int x2388;       // 0x2388
    int x238c;       // 0x238c
    int x2390;       // 0x2390
    int x2394;       // 0x2394
    int x2398;       // 0x2398
    int x239c;       // 0x239c
    int x23a0;       // 0x23a0
    int x23a4;       // 0x23a4
    int x23a8;       // 0x23a8
    int x23ac;       // 0x23ac
    int x23b0;       // 0x23b0
    int x23b4;       // 0x23b4
    int x23b8;       // 0x23b8
    int x23bc;       // 0x23bc
    int x23c0;       // 0x23c0
    int x23c4;       // 0x23c4
    int x23c8;       // 0x23c8
    int x23cc;       // 0x23cc
    int x23d0;       // 0x23d0
    int x23d4;       // 0x23d4
    int x23d8;       // 0x23d8
    int x23dc;       // 0x23dc
    int x23e0;       // 0x23e0
    int x23e4;       // 0x23e4
    int x23e8;       // 0x23e8
    int x23ec;       // 0x23ec
    int x23f0;       // 0x23f0
    int x23f4;       // 0x23f4
    int x23f8;       // 0x23f8
    int x23fc;       // 0x23fc
    int x2400;       // 0x2400
    int x2404;       // 0x2404
    int x2408;       // 0x2408
    int x240c;       // 0x240c
    int x2410;       // 0x2410
    int x2414;       // 0x2414
    int x2418;       // 0x2418
    int x241c;       // 0x241c
    int x2420;       // 0x2420
    int x2424;       // 0x2424
    int x2428;       // 0x2428
    int x242c;       // 0x242c
    int x2430;       // 0x2430
    int x2434;       // 0x2434
    int x2438;       // 0x2438
    int x243c;       // 0x243c
    int x2440;       // 0x2440
    int x2444;       // 0x2444
    int x2448;       // 0x2448
    int x244c;       // 0x244c
    int x2450;       // 0x2450
    int x2454;       // 0x2454
    int x2458;       // 0x2458
    int x245c;       // 0x245c
    int x2460;       // 0x2460
    int x2464;       // 0x2464
    int x2468;       // 0x2468
    int x246c;       // 0x246c
    int x2470;       // 0x2470
    int x2474;       // 0x2474
    int x2478;       // 0x2478
    int x247c;       // 0x247c
    int x2480;       // 0x2480
    int x2484;       // 0x2484
    int x2488;       // 0x2488
    int x248c;       // 0x248c
    int x2490;       // 0x2490
    int x2494;       // 0x2494
    int x2498;       // 0x2498
    int x249c;       // 0x249c
    int x24a0;       // 0x24a0
    int x24a4;       // 0x24a4
    int x24a8;       // 0x24a8
    int x24ac;       // 0x24ac
    int x24b0;       // 0x24b0
    int x24b4;       // 0x24b4
    int x24b8;       // 0x24b8
    int x24bc;       // 0x24bc
    int x24c0;       // 0x24c0
    int x24c4;       // 0x24c4
    MatchData match; // 0x24c8
} Match;

// Math Functions
float (*atan2)(float y, float x) = (void *)0x80022c30;
float (*sin)(float x) = (void *)0x803263d4;
float (*cos)(float x) = (void *)0x80326240;
void (*MTXLookAt)(Mtx *dest, Vec3 *eye, Vec3 *up, Vec3 *target) = (void *)0x80342734;
void (*VECNormalize)(Vec3 *src, Vec3 *dest) = (void *)0x80342db8;
void (*VECAdd)(Vec3 *a, Vec3 *b, Vec3 *ab) = (void *)0x80342d54;
void (*VECSubtract)(Vec3 *a, Vec3 *b, Vec3 *a_b) = (void *)0x80342d78;
void (*VECMultAndAdd)(Vec3 *a, Vec3 *b) = (void *)0x8000dc6c;
float (*VECDotProduct)(Vec3 *a, Vec3 *b) = (void *)0x80342e38;
void (*VECCrossProduct)(Vec3 *a, Vec3 *b, Vec3 *axb) = (void *)0x80342e58;
void (*MTXQuat)(Vec4 *dest, Mtx *m) = (void *)0x80342690;
void (*HSD_MtxGetRotation)(Mtx *m, Vec3 *dest) = (void *)0x80379c24;
void (*MatToQuat)(Mtx *m, Vec3 *dest) = (void *)0x8037e708;
float (*sqrtf)(float num) = (void *)0x8000d5bc;
void (*MTXRotRad)(Mtx m, char axis, f32 rad) = (void *)0x80342418;

// Useful functions
void (*OSReport)(char *, ...) = (void *)0x803456A8;
int (*JOBJ_CopyPosition)(JOBJ *source, Vec3 *add, Vec3 *dest) = (void *)0x8000b1cc;
void (*JOBJ_SetMtxDirtySub)(JOBJ *jobj) = (void *)0x803732e8;
JOBJ *(*JOBJ_LoadJoint)(JOBJDesc *joint) = (void *)0x80370e44;
void (*JOBJ_RemoveAll)(JOBJ *joint) = (void *)0x80371590;
void (*JOBJ_Remove)(JOBJ *joint) = (void *)0x80371370;
void (*JOBJ_GetChild)(JOBJ *joint, int ptr, int index, ...) = (void *)0x80011e24;
void (*JOBJ_AddChild)(JOBJ *parent, JOBJ *child) = (void *)0x803717a8;
float (*JOBJ_GetCurrentMatAnimFrame)(JOBJ *joint) = (void *)0x8022f298;
void (*JOBJ_SetFlags)(JOBJ *joint, int flags) = (void *)0x80371d00;
void (*JOBJ_SetFlagsAll)(JOBJ *joint, int flags) = (void *)0x80371d9c;
void (*JOBJ_ClearFlags)(JOBJ *joint, int flags) = (void *)0x80371f00;
void (*JOBJ_ClearFlagsAll)(JOBJ *joint, int flags) = (void *)0x80371f9c;
void (*JOBJ_BillBoard)(JOBJ *joint, Mtx *m, Mtx *mx) = (void *)0x803740e8;
void (*JOBJ_PlayAnim)(JOBJ *joint, int unk, u16 flags, void *cb, int unk2, ...) = (void *)0x80364c08; // flags: 0x400 matanim, 0x20 jointanim
void (*JOBJ_Anim)(JOBJ *joint) = (void *)0x80370780;
void (*JOBJ_AnimAll)(JOBJ *joint) = (void *)0x80370928;
void (*JOBJ_ReqAnim)(JOBJ *joint, float frame) = (void *)0x8036f934;
void (*JOBJ_ReqAnimByFlags)(JOBJ *joint, int flags, float frame) = (void *)0x8036f718;
void (*JOBJ_ReqAnimAll)(JOBJ *joint, float unk) = (void *)0x8036f8bc;
void (*JOBJ_ReqAnimAllByFlags)(JOBJ *joint, int flags, float frame) = (void *)0x8036f7b0;
float (*JOBJ_GetJointAnimFrameTotal)(JOBJ *joint) = (void *)0x8000be40;
float (*JOBJ_GetJointAnimNextFrame)(JOBJ *joint) = (void *)0x8000bdb4;
void (*AOBJ_ReqAnim)(int *aobj, float unk) = (void *)0x8036410c;
void (*AOBJ_StopAnim)(JOBJ *jobj, int flags, int flags2) = (void *)0x8036414c;
void (*DOBJ_SetFlags)(DOBJ *dobj, int flags) = (void *)0x8035ddb8;
void (*DOBJ_ClearFlags)(DOBJ *dobj, int flags) = (void *)0x8035ddd0;
COBJ *(*COBJ_LoadDesc)(COBJDesc *cobj) = (void *)0x8036a590;
COBJ *(*COBJ_GetMatchCamera)() = (void *)0x80030a50;
void (*CObjThink_Common)(GOBJ *gobj) = (void *)0x803910d8;
void (*memcpy)(void *dest, void *source, int size) = (void *)0x800031f4;
void (*memset)(void *dest, int fill, int size) = (void *)0x80003100;
void (*blr)() = (void *)0x80005358;
int (*HSD_Randi)(int max) = (void *)0x80380580;
float (*HSD_Randf)() = (float *)0x80380528;
void *(*HSD_MemAlloc)(int size) = (void *)0x8037f1e4;
void (*HSD_Free)(void *ptr) = (void *)0x8037f1b0;
void (*SFX_Play)(int sfxID) = (void *)0x801c53ec;
void (*SFX_PlayCommon)(int sfxID) = (void *)0x80024030;
void (*SFX_PlayCrowd)(int sfxID) = (void *)0x8002411c;
void (*SFX_StopCrowd)() = (void *)0x80321ce8;
void (*SFX_StopAllFighterSFX)(FighterData *fighter_data) = (void *)0x80088a50;
void (*Music_Play)(int hpsID) = (void *)0x80023f28;
GOBJ *(*GObj_Create)(int type, int subclass, int flags) = (void *)0x803901f0;
void (*GObj_Destroy)(GOBJ *gobj) = (void *)0x80390228;
void (*GObj_AddGXLink)(GOBJ *gobj, void *cb, int gx_link, int gx_pri) = (void *)0x8039069c;
void (*GObj_DestroyGXLink)(GOBJ *gobj) = (void *)0x8039084c;
void (*GObj_GXReorder)(GOBJ *gobj, int unk) = (void *)0x8039063c;
void (*GObj_AddProc)(GOBJ *gobj, void *callback, int priority) = (void *)0x8038fd54;
void (*GObj_AddObject)(GOBJ *gobj, u8 unk, void *object) = (void *)0x80390a70;
void (*GObj_FreeObject)(GOBJ *gobj) = (void *)0x80390b0c;
void (*GObj_AddUserData)(GOBJ *gobj, int userDataKind, void *destructor, void *userData) = (void *)0x80390b68;
void (*GOBJ_InitCamera)(GOBJ *gobj, void *cb, int gx_pri) = (void *)0x8039075c;
DevText *(*DevelopText_CreateDataTable)(int unk1, int x, int y, int width, int height, void *alloc) = (void *)0x80302834;
void (*DevelopText_Activate)(void *unk, DevText *text) = (void *)0x80302810;
void (*DevelopText_AddString)(DevText *text, ...) = (void *)0x80302d4c;
void (*DevelopText_EraseAllText)(DevText *text) = (void *)0x80302bb0;
void (*DevelopMode_ResetCursorXY)(DevText *text, int x, int y) = (void *)0x80302a3c;
void (*DevelopText_StoreBGColor)(DevText *text, u8 *RGBA) = (void *)0x80302b90;
void (*DevelopText_HideText)(DevText *text) = (void *)0x80302b00;
void (*DevelopText_HideBG)(DevText *text) = (void *)0x80302ae0;
void (*DevelopText_StoreTextScale)(DevText *text, float x, float y) = (void *)0x80302b10;
void (*Develop_UpdateMatchHotkeys)() = (void *)0x80225754;
Effect *(*Effect_SpawnSync)(int gfx_id, ...) = (void *)0x8005fddc;
void (*Effect_SpawnAsync)(GOBJ *fighter, Effect *ptr, int type, int gfx_id, ...) = (void *)0x800676f0;
void (*Effect_PauseAll)(GOBJ *fighter) = (void *)0x8005ba40;
void (*Effect_ResumeAll)(GOBJ *fighter) = (void *)0x8005bac4;
void (*Wind_Create)(Vec3 *pos, int radius, float x, float y, float z) = (void *)0x800119dc;
void (*GXLink_Common)(GOBJ *gobj, int pass) = (void *)0x80391070;
int (*Pause_CheckStatus)(int type) = (void *)0x801a45e8;
void (*Wind_StageCreate)(Vec3 *pos, int duration, float radius, float lifetime, float angle) = (void *)0x80011a50;
void (*Wind_FighterCreate)(Vec3 *pos, int duration, float radius, float lifetime, float angle) = (void *)0x800119dc;
void (*BGM_Play)(int hpsID) = (void *)0x80023f28;
void (*File_LoadInitReturnSymbol)(char *filename, void *ptr, ...) = (void *)0x80016c64; // input each symbol name pointer sequentially and terminate with 0;
void *(*File_GetSymbol)(void *archive, char *symbol) = (void *)0x80380358;

// Text Functions
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

// Menu Functions
int (*CSS_GetNametagRumble)(int player, u8 tag) = (void *)0x801677f8;
void (*CSS_InitPlayerData)(PlayerData *player) = (void *)0x8016795c;

// Match Functions
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

// Fighter Functions
void (*ActionStateChange)(float startFrame, float animSpeed, float animBlend, GOBJ *fighter, int stateID, int flags1, int flags2) = (void *)0x800693ac;
void (*Subaction_Update)(GOBJ *fighter) = (void *)0x8006eba4;
void (*Fighter_UpdateBonePos)(FighterData *fighter_data, int unk) = (void *)0x8006e7b8;
int (*Animation_GetAddress)(FighterData *fighter, int animID) = (void *)0x80085e50;
SubactionHeader *(*Fighter_GetSubactionHeader)(FighterData *fighter, int animID) = (void *)0x80085fd4;
float (*Animation_GetLength)(int animAddress) = (void *)0x8001e8f8;
void (*Fighter_EnterLightThrow)(GOBJ *fighter, int stateID) = (void *)0x800957f4;
void (*Fighter_EnterDamageFall)(GOBJ *fighter) = (void *)0x80090780;
void (*Fighter_EnterWait)(GOBJ *fighter) = (void *)0x8008a2bc;
void (*Fighter_EnterFall)(GOBJ *fighter) = (void *)0x800cc730;
void (*Fighter_EnterSpecialFall)(GOBJ *fighter, int can_fastfall, int can_not_noimpactland, int can_not_interrupt, float aerialDriftMultipler, float landing_frames) = (void *)0x80096900;
void (*Fighter_EnterLanding)(GOBJ *fighter) = (void *)0x80082b1c;
void (*Fighter_EnterSpecialLanding)(GOBJ *fighter, int unk, float state_length) = (void *)0x800d5cb0;
void (*Fighter_EnterSleep)(GOBJ *fighter, int ms) = (void *)0x800d4f24;
GOBJ *(*Fighter_GetGObj)(int ply) = (void *)0x80034110;
GOBJ *(*Fighter_GetSubcharGObj)(int ply, int ms) = (void *)0x8003418c;
Playerblock *(*Fighter_GetPlayerblock)(int ply) = (void *)0x80031724;
int *(*Fighter_GetStaleMoveTable)(int ply) = (void *)0x80036244;
void (*Fighter_ApplyIntang)(GOBJ *fighter, int duration) = (void *)0x8007b760;
int (*Fighter_GetSlotType)(int index) = (void *)0x8003241c; // returns 0x0 for HMN, 0x1 for CPU, 0x2 for Demo, 0x3 for not present
int (*Fighter_GetStocks)(int ply) = (void *)0x80033bd8;
void (*Fighter_SetFallNum)(int index, int ms, int falls) = (void *)0x80034e8c;
void (*Fighter_EnableECBBottomUpdate)(FighterData *fighter) = (void *)0x8007d5bc;
void (*Fighter_EnterDamageState)(GOBJ *fighter, int stateID, float frame) = (void *)0x8008dce0;
int (*Fighter_BoneLookup)(FighterData *fighter, int boneID) = (void *)0x8007500c;
void (*Fighter_GiveDamage)(FighterData *fighter, float damage) = (void *)0x8006cc7c;
void (*Fighter_SetHUDDamage)(int player, u16 damage) = (void *)0x80034330;
void (*Fighter_RunOnHitCallbacks)(GOBJ *fighter) = (void *)0x8007db58;
void (*Fighter_SetStocks)(int ply, int stocks) = (void *)0x80033c60;
int (*FrameTimerCheck)(GOBJ *fighter) = (void *)0x8006f238;
void (*Fighter_EnterMiscPassState)(float start_frame, GOBJ *fighter, int state, int flags) = (void *)0x8009a184;
int (*Fighter_CollGround_PassLedge)(GOBJ *fighter) = (void *)0x80082708;
void (*Fighter_CollGround_StopLedge)(GOBJ *fighter) = (void *)0x80084104;
int (*Fighter_CollAir_GrabLedgeWalljump)(GOBJ *fighter, void *perFrame, void *onLand) = (void *)0x800831cc;
int (*Fighter_CollAir_GrabLedge)(GOBJ *fighter, int grab_direction) = (void *)0x800822a4;
void (*Fighter_CollAir_IgnoreLedge)(GOBJ *fighter, void *callback) = (void *)0x80082c74;
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
void (*Fighter_KillAllVelocity)(GOBJ *fighter) = (void *)0x8007e2fc;
void (*Fighter_AdvanceScript)(GOBJ *fighter) = (void *)0x8006eba4;
void (*Fighter_GFXRemoveAll)(GOBJ *fighter) = (void *)0x8007db24;
void (*Fighter_EnableReflectUpdate)(GOBJ *fighter) = (void *)0x8007aef8;
void (*Fighter_CreateReflect)(GOBJ *fighter, Reflect *reflect, void *cb_OnReflectHit) = (void *)0x8007b23c;
float (*Fighter_GetBoneRotation)(FighterData *fighter, int bone) = (void *)0x80075f48;
float (*Fighter_RotateBone_Pitch)(FighterData *fighter, int bone, float angle) = (void *)0x80075af0;
float (*Fighter_RotateBone_Yaw)(FighterData *fighter, int bone, float angle) = (void *)0x8007592c;
float (*Fighter_RotateBone_Roll)(FighterData *fighter, int bone, float angle) = (void *)0x80075cb4;
void (*Fighter_PlayVoiceSFX)(FighterData *fighter, int sfxID, int volume, int balance) = (void *)0x800881d8;
void (*Fighter_ApplyOverlay)(FighterData *fighter_data, int overlay, int unk) = (void *)0x800bffd0;
void (*Fighter_UpdateOverlay)(GOBJ *fighter) = (void *)0x800c0408;
void (*Fighter_DisableBlend)(GOBJ *fighter, int animd_id) = (void *)0x8008a6d8;
void (*Fighter_UpdateDynamics)(GOBJ *fighter, u16 *dynamic_struct) = (void *)0x8009e7b4;
void (*Fighter_ZeroCPUInputs)(FighterData *fighter_data) = (void *)0x800b4a78;
void (*Fighter_CreateShieldGFX)(GOBJ *fighter) = (void *)0x800921dc;
void (*Fighter_UpdateShieldGFX)(GOBJ *fighter, float size) = (void *)0x80091e78;
int (*Fighter_GetShieldColorIndex)(int ply) = (void *)0x80036538;
//void (*Fighter_SetGrounded)(FighterData *fighter_data) = (void *)0x8007d6a4;

// Item Functions
void (*Item_Hold)(GOBJ *item, GOBJ *fighter, int boneID) = (void *)0x8026ab54;
void (*Item_Catch)(GOBJ *fighter, int unk) = (void *)0x80094818;
void (*Items_StoreItemDataToCharItemTable)(undefined4, int) = (void *)0x8026B3F8;
void (*Items_StoreItemDataToCharItemTable2)(int articleData, int articleID) = (void *)0x8026B3F8;
void (*Items_StoreTimeout)(GOBJ *item, float timeout) = (void *)0x80275158;
GOBJ *(*CreateItem)(SpawnItem *item_spawn) = (void *)0x80268b18;
GOBJ *(*CreateItem2)(SpawnItem *item_spawn) = (void *)0x80268b5c;
GOBJ *(*CreateItem3)(SpawnItem *item_spawn) = (void *)0x80268b9c;
void (*Item_Destroy)(GOBJ *item) = (void *)0x8026a8ec;
int (*Item_CollGround_PassLedge)(GOBJ *item, void *callback) = (void *)0x8026d62c;
int (*Item_CollGround_StopLedge)(GOBJ *item, void *callback) = (void *)0x8026d8a4;
int (*Item_CollAir)(GOBJ *item, void *callback) = (void *)0x8026e15c;
void (*ItemStateChange)(GOBJ *item, int stateID, int flags) = (void *)0x80268e5c;
int (*ItemFrameTimer)(GOBJ *item) = (void *)0x80272c6c;
void (*Item_PlaceOnGroundBelow)(GOBJ *item) = (void *)0x80276174;
int (*Item_CheckIfTouchingWall)(GOBJ *item, float *unk[]) = (void *)0x80276348;
void (*Item_InitGrab)(ItemData *item, int unk, void *OnItem, void *OnFighter) = (void *)0x80274f28;
void (*Item_ResetAllHitPlayers)(ItemData *item) = (void *)0x8027146c;
int (*Item_CountActiveItems)(int itemID) = (void *)0x8026b3c0;
void (*Item_CopyDevelopState)(GOBJ *item, GOBJ *fighter) = (void *)0x80225dd8;
int (*Items_DecLife)(GOBJ *item) = (void *)0x80273130;
void (*GXLink_Item)(GOBJ *gobj, int pass) = (void *)0x8026eecc;
void (*Item_UpdateSpin)(GOBJ *item, float unk) = (void *)0x80274658;
void (*Item_EnableSpin)(GOBJ *item) = (void *)0x802762bc;
void (*Item_DisableSpin)(GOBJ *item) = (void *)0x802762b0;

// Collision Functions
void (*Coll_ECBCurrToPrev)(CollData *collData) = (void *)0x80041c8c;
void (*Coll_InitECB)(CollData *collData) = (void *)0x80041ee4;
int (*ECB_CollGround_PassLedge)(CollData *ecb, ECBBones *bones) = (void *)0x8004b21c; // returns is touching ground bool
void (*ECB_CollAir)(CollData *ecb, ECBBones *bones) = (void *)0x800475f4;

// Map Functions
Stage *(*Stage_GetStageInfo)() = (void *)0x801c6324;
int *(*Stage_GetYakumonoParam)() = (void *)0x801c49f8;
void (*MapStateChange)(GOBJ *map, int stateID, int animID) = (void *)0x801c8138;
void (*Dynamics_DecayWind)() = (void *)0x800115f4;
GOBJ *(*Stage_CreateMapGObj)(int mapgobjID) = (void *)0x80223908;
void *(*GXLink_Stage)(GOBJ *gobj, int pass) = (void *)0x801c5db0;
GOBJ *(*Stage_GetMapGObj)(int mapgobjID) = (void *)0x801c2ba4;
JOBJ *(*Stage_GetMapGObjJObj)(GOBJ *mapgobj, int jointIndex) = (void *)0x801c3fa4;
int (*Stage_GetLinesGroup)(int line) = (void *)0x80056b6c;
int (*Stage_GetLinesDirection)(int line) = (void *)0x80054c6c;
void (*Stage_SetGroundCallback)(int line, void *userdata, void *callback) = (void *)0x800580c8;
void (*Stage_SetCeilingCallback)(int line, void *userdata, void *callback) = (void *)0x800581a4;
void (*Stage_InitMovingColl)(JOBJ *mapjoint, int mapgobjID) = (void *)0x801c2ed0;
void (*Stage_UpdateMovingColl)(GOBJ *mapgobj) = (void *)0x801c2fe0;
Particle *(*Stage_SpawnEffectPos)(int gfxID, int efFileID, Vec3 *pos) = (void *)0x801c96f8;
Particle *(*Stage_SpawnEffectJointPos)(int gfxID, int efFileID, JOBJ *pos) = (void *)0x801c97dc;
Particle *(*Stage_SpawnEffectJointPos2)(int gfxID, int efFileID, JOBJ *pos) = (void *)0x801c9808;
int (*Stage_RaycastGround)(Vec3 *coll_pos, int *line_index, int *line_kind, Vec3 *unk1, Vec3 *unk2, Vec3 *unk3, Vec3 *unk4, void *cb, float fromX, float fromY, float toX, float toY, float unk5) = (void *)0x8004f008; // make unk5 = 0 and the other unk's = -1

// MEX functions
void (*LoadMEXItem)(GOBJ *player_gobj, int article_pointer, int item_id) = (void *)0x803d7058;
void (*SpawnMEXEffect)(int effectID, int fighter, int arg1, int arg2, int arg3, int arg4, int arg5) = (void *)0x803d7060;
int (*MEX_GetItemExtID)(GOBJ *player_gobj, int item_id) = (void *)0x803d7064;
void (*SFX_PlayStageSFX)(int sfx_id) = (void *)0x803d7078;
void *(*calloc)(int size) = (void *)0x803d706C;
PRIM *(*PRIM_NEW)(int vert_count, int params1, int params2) = (void *)0x804DD84C;
void (*PRIM_CLOSE)() = (void *)0x804DD848;
MEXPlaylist *(*MEX_GetPlaylist)() = (void *)0x803d707C;

// Offsets
#define R13 0x804db6a0
#define STAGE_CONST -0x4C08 // this is an offset used on dreamland, should be safe to use for custom stages
#define MEMCARD -0x77C0
#define GOBJLIST -0x3E74
#define PLCO_SHIELDCOLORS -0x5190
#define PLCO_FTCOMMON -0x514C
#define STAGE 0x8049e6c8 // this is the static stage struct, labelled Stage in this file
#define EVMENU_ASSETS -0x4A08
#define EVENT_VAR -0x4A0C // global pointer to a bunch of event variables
#define HSD_UPDATE 0x80479d58
#define COLL_TEST -0x51f4
#define MATCH_HUD 0x804a10c8
#define COBJDESC_MATCHHUD 0x80b52980
#define MATCH_CAM 0x80452c68
#define MATCH 0x8046b6a0

// Macros
#define RTOC_PTR(offset) *(void **)(0x804df9e0 + offset)
#define R13_PTR(offset) *(void **)(R13 + offset)
#define R13_INT(offset) *(int *)(R13 + offset)
#define R13_U8(offset) *(u8 *)(R13 + offset)
#define R13_FLOAT(offset) *(float *)(R13 + offset)
#define AS_FLOAT(num) *(float *)&num
#define AS_INT(num) *(int *)&num
#define ACCESS_INT(addr) *(int *)(addr)
#define ACCESS_U8(addr) *(u8 *)(addr)
#define ACCESS_PTR(addr) *(void **)(addr)

// Functions
float fabs(float x)
{
    if (x < 0)
    {
        return -x;
    }
    return x;
}
int abs(int x)
{
    if (x < 0)
    {
        return -x;
    }
    return x;
}
void enterKnockback(GOBJ *fighter, int angle, float mag)
{
    FighterData *fighter_data = ((FighterData *)fighter->userdata);

    // store damage variables
    fighter_data->damage_ForceApplied = mag;
    fighter_data->damage_KBAngle = angle;
    fighter_data->damage_Direction = fighter_data->facing_direction;
    fighter_data->damage_DamagedHurtbox = 0;
    fighter_data->damage_Dealt = 0;
    fighter_data->damage_CollisionX = fighter_data->pos.X;
    fighter_data->damage_CollisionY = fighter_data->pos.Y;
    fighter_data->damage_CollisionZ = fighter_data->pos.Z;

    Fighter_EnterDamageState(fighter, -1, 0);

    return;
}
void null()
{
    return;
}
void __attribute__((optimize("O0"))) PRIM_DRAW(PRIM *gx, float x, float y, float z, int color)
{
    AS_FLOAT(gx->data) = x;
    AS_FLOAT(gx->data) = y;
    AS_FLOAT(gx->data) = z;
    gx->data = color;
    return;
}
void C_QUATMtx(Vec4 *r, Mtx m)
{
    /*---------------------------------------------------------------------------*
   Name:         QUATMtx

   Description:  Converts a matrix to a unit quaternion.

   Arguments:    r   - result quaternion
                m   - the matrix

   Returns:      NONE
    *---------------------------------------------------------------------------*/

    float tr, s;
    int i, j, k;
    int nxt[3] = {1, 2, 0};
    float q[3];

    tr = m[0][0] + m[1][1] + m[2][2];
    if (tr > 0.0f)
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
        if (m[1][1] > m[0][0])
            i = 1;
        if (m[2][2] > m[i][i])
            i = 2;
        j = nxt[i];
        k = nxt[j];
        s = (float)sqrtf((m[i][i] - (m[j][j] + m[k][k])) + 1.0f);
        q[i] = s * 0.5f;

        if (s != 0.0f)
            s = 0.5f / s;

        r->W = (m[j][k] - m[k][j]) * s;
        q[j] = (m[i][j] + m[j][i]) * s;
        q[k] = (m[i][k] + m[k][i]) * s;

        r->X = q[0];
        r->Y = q[1];
        r->Z = q[2];
    }
}
HSD_Pad *PadGet(int playerIndex, int padType)
{
    HSD_Pads *pads;

    // get the correct pad
    if (padType == PADGET_MASTER)
        pads = 0x804c1fac;
    else if (padType == PADGET_ENGINE)
        pads = 0x804c21cc;

    return (&pads->pad[playerIndex]);
}
float lerp(Translation *anim, float currFrame)
{
    float prevFrame, prevPos, nextFrame, nextPos, amt;

    // get previous threshold
    int i = 0;
    prevFrame = anim[i].frame;
    prevPos = anim[i].value;
    nextFrame = anim[i + 1].frame;
    nextPos = anim[i + 1].value;
    while ((currFrame < prevFrame) | (currFrame > nextFrame))
    {
        i++;
        prevFrame = anim[i].frame;
        prevPos = anim[i].value;
        nextFrame = anim[i + 1].frame;
        nextPos = anim[i + 1].value;
    }

    // get amt
    amt = (currFrame - prevFrame) / (nextFrame - prevFrame);

    return amt * (nextPos - prevPos);
}
float JOBJ_GetAnimFrame(JOBJ *joint)
{
    // check for AOBJ in jobj
    JOBJ *jobj;
    jobj = joint;
    while (jobj != 0)
    {
        if (jobj->aobj != 0)
        {
            return jobj->aobj->curr_frame;
        }

        // check for AOBJ in dobj
        DOBJ *dobj;
        dobj = jobj->dobj;
        while (dobj != 0)
        {
            if (dobj->aobj != 0)
            {
                return dobj->aobj->curr_frame;
            }

            // check for AOBJ in mobj
            MOBJ *mobj;
            mobj = dobj->mobj;
            if (mobj->aobj != 0)
            {
                return mobj->aobj->curr_frame;
            }

            // check for AOBJ in tobj
            TOBJ *tobj;
            tobj = mobj->tobj;
            while (tobj != 0)
            {
                if (tobj->aobj != 0)
                {
                    return tobj->aobj->curr_frame;
                }
                tobj = tobj->next;
            }

            dobj = dobj->next;
        }

        jobj = jobj->child;
    }

    // no aobj found, return -1
    return -1;
}
AOBJ *JOBJ_GetAOBJ(JOBJ *joint)
{
    // check for AOBJ in jobj
    JOBJ *jobj;
    jobj = joint;
    while (jobj != 0)
    {
        if (jobj->aobj != 0)
        {
            return jobj->aobj;
        }

        // check for AOBJ in dobj
        DOBJ *dobj;
        dobj = jobj->dobj;
        while (dobj != 0)
        {
            if (dobj->aobj != 0)
            {
                return dobj->aobj;
            }

            // check for AOBJ in mobj
            MOBJ *mobj;
            mobj = dobj->mobj;
            if (mobj->aobj != 0)
            {
                return mobj->aobj;
            }

            // check for AOBJ in tobj
            TOBJ *tobj;
            tobj = mobj->tobj;
            while (tobj != 0)
            {
                if (tobj->aobj != 0)
                {
                    return tobj->aobj;
                }
                tobj = tobj->next;
            }

            dobj = dobj->next;
        }

        jobj = jobj->child;
    }

    // no aobj found, return -1
    return -1;
}

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
#define JOBJ_GENERALFLAG (1 << 26)
#define JOBJ_GENERALFLAG2 (1 << 27)
#define JOBJ_ROOT_OPA (1 << 28)
#define JOBJ_ROOT_XLU (1 << 29)
#define JOBJ_ROOT_TEXEDGE (1 << 30)
#define JOBJ_31 (1 << 31)

// MObj Flags
#define MOBJ_ANIM 0x4
#define TOBJ_ANIM 0x10
#define ALL_ANIM 0x7FF
#define HSD_A_M_AMBIENT_R 1
#define HSD_A_M_AMBIENT_G 2
#define HSD_A_M_AMBIENT_B 3
#define HSD_A_M_DIFFUSE_R 4
#define HSD_A_M_DIFFUSE_G 5
#define HSD_A_M_DIFFUSE_B 6
#define HSD_A_M_SPECULAR_R 7
#define HSD_A_M_SPECULAR_G 8
#define HSD_A_M_SPECULAR_B 9
#define HSD_A_M_ALPHA 10
#define HSD_A_M_PE_REF0 11
#define HSD_A_M_PE_REF1 12
#define HSD_A_M_PE_DSTALPHA 13
#define RENDER_DIFFUSE_SHIFT 0
#define RENDER_DIFFUSE_BITS (3 << RENDER_DIFFUSE_SHIFT)
#define RENDER_DIFFUSE_MAT0 (0 << RENDER_DIFFUSE_SHIFT)
#define RENDER_DIFFUSE_MAT (1 << RENDER_DIFFUSE_SHIFT)
#define RENDER_DIFFUSE_VTX (2 << RENDER_DIFFUSE_SHIFT)
#define RENDER_DIFFUSE_BOTH (3 << RENDER_DIFFUSE_SHIFT)
#define RENDER_CONSTANT (1 << 0)
#define RENDER_VERTEX (1 << 1)
#define RENDER_DIFFUSE (1 << 2)
#define RENDER_SPECULAR (1 << 3)
#define CHANNEL_FIELD (RENDER_CONSTANT | RENDER_VERTEX | RENDER_DIFFUSE | RENDER_SPECULAR)
#define RENDER_TEX0 (1 << 4)
#define RENDER_TEX1 (1 << 5)
#define RENDER_TEX2 (1 << 6)
#define RENDER_TEX3 (1 << 7)
#define RENDER_TEX4 (1 << 8)
#define RENDER_TEX5 (1 << 9)
#define RENDER_TEX6 (1 << 10)
#define RENDER_TEX7 (1 << 11)
#define RENDER_TEXTURES (RENDER_TEX0 | RENDER_TEX1 | RENDER_TEX2 | RENDER_TEX3 | RENDER_TEX4 | RENDER_TEX5 | RENDER_TEX6 | RENDER_TEX7)
#define RENDER_TOON (1 << 12)
#define RENDER_ALPHA_SHIFT 13
#define RENDER_ALPHA_BITS (3 << RENDER_ALPHA_SHIFT)
#define RENDER_ALPHA_COMPAT (0 << RENDER_ALPHA_SHIFT)
#define RENDER_ALPHA_MAT (1 << RENDER_ALPHA_SHIFT)
#define RENDER_ALPHA_VTX (2 << RENDER_ALPHA_SHIFT)
#define RENDER_ALPHA_BOTH (3 << RENDER_ALPHA_SHIFT)
#define RENDER_SHADOW (1 << 26)
#define RENDER_ZMODE_ALWAYS (1 << 27)
#define RENDER_NO_ZUPDATE (1 << 29)
#define RENDER_XLU (1 << 30)

// DOBJ flags
#define DOBJ_HIDDEN 1

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

// Line Directions
#define LINE_GROUND 1
#define LINE_CEIL 2
#define LINE_WALLRIGHT 4
#define LINE_WALLLEFT 8

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

#define HSD_BUTTON_DPAD_LEFT 0x0001
#define HSD_BUTTON_DPAD_RIGHT 0x0002
#define HSD_BUTTON_DPAD_DOWN 0x0004
#define HSD_BUTTON_DPAD_UP 0x0008
#define HSD_TRIGGER_Z 0x0010
#define HSD_TRIGGER_R 0x0020
#define HSD_TRIGGER_L 0x0040
#define HSD_BUTTON_A 0x0100
#define HSD_BUTTON_B 0x0200
#define HSD_BUTTON_X 0x0400
#define HSD_BUTTON_Y 0x0800
#define HSD_BUTTON_START 0x1000
#define HSD_BUTTON_UP 0x10000
#define HSD_BUTTON_DOWN 0x20000
#define HSD_BUTTON_LEFT 0x40000
#define HSD_BUTTON_RIGHT 0x80000

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

// Match Data definitions
#define MATCH_TIMER_FROZEN 0
#define MATCH_TIMER_UNK 1
#define MATCH_TIMER_COUNTDOWN 2
#define MATCH_TIMER_COUNTUP 3
#define MATCH_MATCHTYPE_TIME 0
#define MATCH_MATCHTYPE_STOCK 1
#define MATCH_MATCHTYPE_COIN 2
#define MATCH_HUDPOS_NONE 0
#define MATCH_HUDPOS_ONE 1
#define MATCH_HUDPOS_TWO 2
#define MATCH_HUDPOS_THREE 3
#define MATCH_HUDPOS_FOUR 4
#define MATCH_HUDPOS_SIX 5
#define MATCH_HUDPOS_UNK 6
#define MATCH_HUDPOS_FOURCOMPACT 7
#define MATCH_PAUSEHUD_HIDE 1
#define MATCH_MATCHTYPE_STOCK 1
#define MATCH_MATCHTYPE_COIN 2
#define MATCH_ITEMFREQ_OFF -1
#define MATCH_ITEMFREQ_VERYLOW 0
#define MATCH_ITEMFREQ_LOW 1
#define MATCH_ITEMFREQ_MEDIUM 2
#define MATCH_ITEMFREQ_HIGH 3
#define MATCH_ITEMFREQ_VERYHIGH 4

// Fighter States
#define ASID_DEADDOWN 0X00
#define ASID_DEADLEFT 0X01
#define ASID_DEADRIGHT 0X02
#define ASID_DEADUP 0X03
#define ASID_DEADUPSTAR 0X04
#define ASID_DEADUPSTARICE 0X05
#define ASID_DEADUPFALL 0X06
#define ASID_DEADUPFALLHITCAMERA 0X07
#define ASID_DEADUPFALLHITCAMERAFLAT 0X08
#define ASID_DEADUPFALLICE 0X09
#define ASID_DEADUPFALLHITCAMERAICE 0X0A
#define ASID_SLEEP 0X0B
#define ASID_REBIRTH 0X0C
#define ASID_REBIRTHWAIT 0X0D
#define ASID_WAIT 0X0E
#define ASID_WALKSLOW 0X0F
#define ASID_WALKMIDDLE 0X10
#define ASID_WALKFAST 0X11
#define ASID_TURN 0X12
#define ASID_TURNRUN 0X13
#define ASID_DASH 0X14
#define ASID_RUN 0X15
#define ASID_RUNDIRECT 0X16
#define ASID_RUNBRAKE 0X17
#define ASID_KNEEBEND 0X18
#define ASID_JUMPF 0X19
#define ASID_JUMPB 0X1A
#define ASID_JUMPAERIALF 0X1B
#define ASID_JUMPAERIALB 0X1C
#define ASID_FALL 0X1D
#define ASID_FALLF 0X1E
#define ASID_FALLB 0X1F
#define ASID_FALLAERIAL 0X20
#define ASID_FALLAERIALF 0X21
#define ASID_FALLAERIALB 0X22
#define ASID_FALLSPECIAL 0X23
#define ASID_FALLSPECIALF 0X24
#define ASID_FALLSPECIALB 0X25
#define ASID_DAMAGEFALL 0X26
#define ASID_SQUAT 0X27
#define ASID_SQUATWAIT 0X28
#define ASID_SQUATRV 0X29
#define ASID_LANDING 0X2A
#define ASID_LANDINGFALLSPECIAL 0X2B
#define ASID_ATTACK11 0X2C
#define ASID_ATTACK12 0X2D
#define ASID_ATTACK13 0X2E
#define ASID_ATTACK100START 0X2F
#define ASID_ATTACK100LOOP 0X30
#define ASID_ATTACK100END 0X31
#define ASID_ATTACKDASH 0X32
#define ASID_ATTACKS3HI 0X33
#define ASID_ATTACKS3HIS 0X34
#define ASID_ATTACKS3S 0X35
#define ASID_ATTACKS3LWS 0X36
#define ASID_ATTACKS3LW 0X37
#define ASID_ATTACKHI3 0X38
#define ASID_ATTACKLW3 0X39
#define ASID_ATTACKS4HI 0X3A
#define ASID_ATTACKS4HIS 0X3B
#define ASID_ATTACKS4S 0X3C
#define ASID_ATTACKS4LWS 0X3D
#define ASID_ATTACKS4LW 0X3E
#define ASID_ATTACKHI4 0X3F
#define ASID_ATTACKLW4 0X40
#define ASID_ATTACKAIRN 0X41
#define ASID_ATTACKAIRF 0X42
#define ASID_ATTACKAIRB 0X43
#define ASID_ATTACKAIRHI 0X44
#define ASID_ATTACKAIRLW 0X45
#define ASID_LANDINGAIRN 0X46
#define ASID_LANDINGAIRF 0X47
#define ASID_LANDINGAIRB 0X48
#define ASID_LANDINGAIRHI 0X49
#define ASID_LANDINGAIRLW 0X4A
#define ASID_DAMAGEHI1 0X4B
#define ASID_DAMAGEHI2 0X4C
#define ASID_DAMAGEHI3 0X4D
#define ASID_DAMAGEN1 0X4E
#define ASID_DAMAGEN2 0X4F
#define ASID_DAMAGEN3 0X50
#define ASID_DAMAGELW1 0X51
#define ASID_DAMAGELW2 0X52
#define ASID_DAMAGELW3 0X53
#define ASID_DAMAGEAIR1 0X54
#define ASID_DAMAGEAIR2 0X55
#define ASID_DAMAGEAIR3 0X56
#define ASID_DAMAGEFLYHI 0X57
#define ASID_DAMAGEFLYN 0X58
#define ASID_DAMAGEFLYLW 0X59
#define ASID_DAMAGEFLYTOP 0X5A
#define ASID_DAMAGEFLYROLL 0X5B
#define ASID_LIGHTGET 0X5C
#define ASID_HEAVYGET 0X5D
#define ASID_LIGHTTHROWF 0X5E
#define ASID_LIGHTTHROWB 0X5F
#define ASID_LIGHTTHROWHI 0X60
#define ASID_LIGHTTHROWLW 0X61
#define ASID_LIGHTTHROWDASH 0X62
#define ASID_LIGHTTHROWDROP 0X63
#define ASID_LIGHTTHROWAIRF 0X64
#define ASID_LIGHTTHROWAIRB 0X65
#define ASID_LIGHTTHROWAIRHI 0X66
#define ASID_LIGHTTHROWAIRLW 0X67
#define ASID_HEAVYTHROWF 0X68
#define ASID_HEAVYTHROWB 0X69
#define ASID_HEAVYTHROWHI 0X6A
#define ASID_HEAVYTHROWLW 0X6B
#define ASID_LIGHTTHROWF4 0X6C
#define ASID_LIGHTTHROWB4 0X6D
#define ASID_LIGHTTHROWHI4 0X6E
#define ASID_LIGHTTHROWLW4 0X6F
#define ASID_LIGHTTHROWAIRF4 0X70
#define ASID_LIGHTTHROWAIRB4 0X71
#define ASID_LIGHTTHROWAIRHI4 0X72
#define ASID_LIGHTTHROWAIRLW4 0X73
#define ASID_HEAVYTHROWF4 0X74
#define ASID_HEAVYTHROWB4 0X75
#define ASID_HEAVYTHROWHI4 0X76
#define ASID_HEAVYTHROWLW4 0X77
#define ASID_SWORDSWING1 0X78
#define ASID_SWORDSWING3 0X79
#define ASID_SWORDSWING4 0X7A
#define ASID_SWORDSWINGDASH 0X7B
#define ASID_BATSWING1 0X7C
#define ASID_BATSWING3 0X7D
#define ASID_BATSWING4 0X7E
#define ASID_BATSWINGDASH 0X7F
#define ASID_PARASOLSWING1 0X80
#define ASID_PARASOLSWING3 0X81
#define ASID_PARASOLSWING4 0X82
#define ASID_PARASOLSWINGDASH 0X83
#define ASID_HARISENSWING1 0X84
#define ASID_HARISENSWING3 0X85
#define ASID_HARISENSWING4 0X86
#define ASID_HARISENSWINGDASH 0X87
#define ASID_STARRODSWING1 0X88
#define ASID_STARRODSWING3 0X89
#define ASID_STARRODSWING4 0X8A
#define ASID_STARRODSWINGDASH 0X8B
#define ASID_LIPSTICKSWING1 0X8C
#define ASID_LIPSTICKSWING3 0X8D
#define ASID_LIPSTICKSWING4 0X8E
#define ASID_LIPSTICKSWINGDASH 0X8F
#define ASID_ITEMPARASOLOPEN 0X90
#define ASID_ITEMPARASOLFALL 0X91
#define ASID_ITEMPARASOLFALLSPECIAL 0X92
#define ASID_ITEMPARASOLDAMAGEFALL 0X93
#define ASID_LGUNSHOOT 0X94
#define ASID_LGUNSHOOTAIR 0X95
#define ASID_LGUNSHOOTEMPTY 0X96
#define ASID_LGUNSHOOTAIREMPTY 0X97
#define ASID_FIREFLOWERSHOOT 0X98
#define ASID_FIREFLOWERSHOOTAIR 0X99
#define ASID_ITEMSCREW 0X9A
#define ASID_ITEMSCREWAIR 0X9B
#define ASID_DAMAGESCREW 0X9C
#define ASID_DAMAGESCREWAIR 0X9D
#define ASID_ITEMSCOPESTART 0X9E
#define ASID_ITEMSCOPERAPID 0X9F
#define ASID_ITEMSCOPEFIRE 0XA0
#define ASID_ITEMSCOPEEND 0XA1
#define ASID_ITEMSCOPEAIRSTART 0XA2
#define ASID_ITEMSCOPEAIRRAPID 0XA3
#define ASID_ITEMSCOPEAIRFIRE 0XA4
#define ASID_ITEMSCOPEAIREND 0XA5
#define ASID_ITEMSCOPESTARTEMPTY 0XA6
#define ASID_ITEMSCOPERAPIDEMPTY 0XA7
#define ASID_ITEMSCOPEFIREEMPTY 0XA8
#define ASID_ITEMSCOPEENDEMPTY 0XA9
#define ASID_ITEMSCOPEAIRSTARTEMPTY 0XAA
#define ASID_ITEMSCOPEAIRRAPIDEMPTY 0XAB
#define ASID_ITEMSCOPEAIRFIREEMPTY 0XAC
#define ASID_ITEMSCOPEAIRENDEMPTY 0XAD
#define ASID_LIFTWAIT 0XAE
#define ASID_LIFTWALK1 0XAF
#define ASID_LIFTWALK2 0XB0
#define ASID_LIFTTURN 0XB1
#define ASID_GUARDON 0XB2
#define ASID_GUARD 0XB3
#define ASID_GUARDOFF 0XB4
#define ASID_GUARDSETOFF 0XB5
#define ASID_GUARDREFLECT 0XB6
#define ASID_DOWNBOUNDU 0XB7
#define ASID_DOWNWAITU 0XB8
#define ASID_DOWNDAMAGEU 0XB9
#define ASID_DOWNSTANDU 0XBA
#define ASID_DOWNATTACKU 0XBB
#define ASID_DOWNFOWARDU 0XBC
#define ASID_DOWNBACKU 0XBD
#define ASID_DOWNSPOTU 0XBE
#define ASID_DOWNBOUNDD 0XBF
#define ASID_DOWNWAITD 0XC0
#define ASID_DOWNDAMAGED 0XC1
#define ASID_DOWNSTANDD 0XC2
#define ASID_DOWNATTACKD 0XC3
#define ASID_DOWNFOWARDD 0XC4
#define ASID_DOWNBACKD 0XC5
#define ASID_DOWNSPOTD 0XC6
#define ASID_PASSIVE 0XC7
#define ASID_PASSIVESTANDF 0XC8
#define ASID_PASSIVESTANDB 0XC9
#define ASID_PASSIVEWALL 0XCA
#define ASID_PASSIVEWALLJUMP 0XCB
#define ASID_PASSIVECEIL 0XCC
#define ASID_SHIELDBREAKFLY 0XCD
#define ASID_SHIELDBREAKFALL 0XCE
#define ASID_SHIELDBREAKDOWNU 0XCF
#define ASID_SHIELDBREAKDOWND 0XD0
#define ASID_SHIELDBREAKSTANDU 0XD1
#define ASID_SHIELDBREAKSTANDD 0XD2
#define ASID_FURAFURA 0XD3
#define ASID_CATCH 0XD4
#define ASID_CATCHPULL 0XD5
#define ASID_CATCHDASH 0XD6
#define ASID_CATCHDASHPULL 0XD7
#define ASID_CATCHWAIT 0XD8
#define ASID_CATCHATTACK 0XD9
#define ASID_CATCHCUT 0XDA
#define ASID_THROWF 0XDB
#define ASID_THROWB 0XDC
#define ASID_THROWHI 0XDD
#define ASID_THROWLW 0XDE
#define ASID_CAPTUREPULLEDHI 0XDF
#define ASID_CAPTUREWAITHI 0XE0
#define ASID_CAPTUREDAMAGEHI 0XE1
#define ASID_CAPTUREPULLEDLW 0XE2
#define ASID_CAPTUREWAITLW 0XE3
#define ASID_CAPTUREDAMAGELW 0XE4
#define ASID_CAPTURECUT 0XE5
#define ASID_CAPTUREJUMP 0XE6
#define ASID_CAPTURENECK 0XE7
#define ASID_CAPTUREFOOT 0XE8
#define ASID_ESCAPEF 0XE9
#define ASID_ESCAPEB 0XEA
#define ASID_ESCAPE 0XEB
#define ASID_ESCAPEAIR 0XEC
#define ASID_REBOUNDSTOP 0XED
#define ASID_REBOUND 0XEE
#define ASID_THROWNF 0XEF
#define ASID_THROWNB 0XF0
#define ASID_THROWNHI 0XF1
#define ASID_THROWNLW 0XF2
#define ASID_THROWNLWWOMEN 0XF3
#define ASID_PASS 0XF4
#define ASID_OTTOTTO 0XF5
#define ASID_OTTOTTOWAIT 0XF6
#define ASID_FLYREFLECTWALL 0XF7
#define ASID_FLYREFLECTCEIL 0XF8
#define ASID_STOPWALL 0XF9
#define ASID_STOPCEIL 0XFA
#define ASID_MISSFOOT 0XFB
#define ASID_CLIFFCATCH 0XFC
#define ASID_CLIFFWAIT 0XFD
#define ASID_CLIFFCLIMBSLOW 0XFE
#define ASID_CLIFFCLIMBQUICK 0XFF
#define ASID_CLIFFATTACKSLOW 0X100
#define ASID_CLIFFATTACKQUICK 0X101
#define ASID_CLIFFESCAPESLOW 0X102
#define ASID_CLIFFESCAPEQUICK 0X103
#define ASID_CLIFFJUMPSLOW1 0X104
#define ASID_CLIFFJUMPSLOW2 0X105
#define ASID_CLIFFJUMPQUICK1 0X106
#define ASID_CLIFFJUMPQUICK2 0X107
#define ASID_APPEALR 0X108
#define ASID_APPEALL 0X109
#define ASID_SHOULDEREDWAIT 0X10A
#define ASID_SHOULDEREDWALKSLOW 0X10B
#define ASID_SHOULDEREDWALKMIDDLE 0X10C
#define ASID_SHOULDEREDWALKFAST 0X10D
#define ASID_SHOULDEREDTURN 0X10E
#define ASID_THROWNFF 0X10F
#define ASID_THROWNFB 0X110
#define ASID_THROWNFHI 0X111
#define ASID_THROWNFLW 0X112
#define ASID_CAPTURECAPTAIN 0X113
#define ASID_CAPTUREYOSHI 0X114
#define ASID_YOSHIEGG 0X115
#define ASID_CAPTUREKOOPA 0X116
#define ASID_CAPTUREDAMAGEKOOPA 0X117
#define ASID_CAPTUREWAITKOOPA 0X118
#define ASID_THROWNKOOPAF 0X119
#define ASID_THROWNKOOPAB 0X11A
#define ASID_CAPTUREKOOPAAIR 0X11B
#define ASID_CAPTUREDAMAGEKOOPAAIR 0X11C
#define ASID_CAPTUREWAITKOOPAAIR 0X11D
#define ASID_THROWNKOOPAAIRF 0X11E
#define ASID_THROWNKOOPAAIRB 0X11F
#define ASID_CAPTUREKIRBY 0X120
#define ASID_CAPTUREWAITKIRBY 0X121
#define ASID_THROWNKIRBYSTAR 0X122
#define ASID_THROWNCOPYSTAR 0X123
#define ASID_THROWNKIRBY 0X124
#define ASID_BARRELWAIT 0X125
#define ASID_BURY 0X126
#define ASID_BURYWAIT 0X127
#define ASID_BURYJUMP 0X128
#define ASID_DAMAGESONG 0X129
#define ASID_DAMAGESONGWAIT 0X12A
#define ASID_DAMAGESONGRV 0X12B
#define ASID_DAMAGEBIND 0X12C
#define ASID_CAPTUREMEWTWO 0X12D
#define ASID_CAPTUREMEWTWOAIR 0X12E
#define ASID_THROWNMEWTWO 0X12F
#define ASID_THROWNMEWTWOAIR 0X130
#define ASID_WARPSTARJUMP 0X131
#define ASID_WARPSTARFALL 0X132
#define ASID_HAMMERWAIT 0X133
#define ASID_HAMMERWALK 0X134
#define ASID_HAMMERTURN 0X135
#define ASID_HAMMERKNEEBEND 0X136
#define ASID_HAMMERFALL 0X137
#define ASID_HAMMERJUMP 0X138
#define ASID_HAMMERLANDING 0X139
#define ASID_KINOKOGIANTSTART 0X13A
#define ASID_KINOKOGIANTSTARTAIR 0X13B
#define ASID_KINOKOGIANTEND 0X13C
#define ASID_KINOKOGIANTENDAIR 0X13D
#define ASID_KINOKOSMALLSTART 0X13E
#define ASID_KINOKOSMALLSTARTAIR 0X13F
#define ASID_KINOKOSMALLEND 0X140
#define ASID_KINOKOSMALLENDAIR 0X141
#define ASID_ENTRY 0X142
#define ASID_ENTRYSTART 0X143
#define ASID_ENTRYEND 0X144
#define ASID_DAMAGEICE 0X145
#define ASID_DAMAGEICEJUMP 0X146
#define ASID_CAPTUREMASTERHAND 0X147
#define ASID_CAPTUREDAMAGEMASTERHAND 0X148
#define ASID_CAPTUREWAITMASTERHAND 0X149
#define ASID_THROWNMASTERHAND 0X14A
#define ASID_CAPTUREKIRBYYOSHI 0X14B
#define ASID_KIRBYYOSHIEGG 0X14C
#define ASID_CAPTURELEADEAD 0X14D
#define ASID_CAPTURELIKELIKE 0X14E
#define ASID_DOWNREFLECT 0X14F
#define ASID_CAPTURECRAZYHAND 0X150
#define ASID_CAPTUREDAMAGECRAZYHAND 0X151
#define ASID_CAPTUREWAITCRAZYHAND 0X152
#define ASID_THROWNCRAZYHAND 0X153
#define ASID_BARRELCANNONWAIT 0X154
#define ASID_ACTIONABLE 1000
#define ASID_ACTIONABLEGROUND 1001
#define ASID_ACTIONABLEAIR 1002
#define ASID_DAMAGEAIR 1003

#endif
