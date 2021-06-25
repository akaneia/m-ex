#ifndef MEX_H_STAGE
#define MEX_H_STAGE

#include "structs.h"
#include "datatypes.h"
#include "hsd.h"
#include "obj.h"

// MapDesc Flags
#define map_isCObj 0x20000000
#define map_isBG 0x40000000
#define map_isUnk 0x80000000

enum GrInternal
{
    GRKIND_DUMMY,
    GRKIND_TEST,
    GRKIND_CASTLE,
    GRKIND_RCRUISE,
    GRKIND_KONGO,
    GRKIND_GARDEN,
    GRKIND_GREATBAY,
    GRKIND_SHRINE,
    GRKIND_ZEBES,
    GRKIND_KRAID,
    GRKIND_STORY,
    GRKIND_YOSTER,
    GRKIND_IZUMI,
    GRKIND_GREENS,
    GRKIND_CORNERIA,
    GRKIND_VENOM,
    GRKIND_PSTAD,
    GRKIND_PURA,
    GRKIND_MUTECITY,
    GRKIND_BIGBLUE,
    GRKIND_ONETT,
    GRKIND_FOURSIDE,
    GRKIND_ICEMT,
    GRKIND_ICETOP,
    GRKIND_MK1,
    GRKIND_MK2,
    GRKIND_AKANEIA,
    GRKIND_FLATZONE,
    GRKIND_OLDPU,
    GRKIND_OLDSTORY,
    GRKIND_OLDKONGO,
    GRKIND_ADVKRAID,
    GRKIND_ADVSHRINE,
    GRKIND_ADVZR,
    GRKIND_ADVBR,
    GRKIND_ADVTE,
    GRKIND_BATTLE,
    GRKIND_FD,
};
enum GrExternal
{
    GRKINDEXT_DUMMY,
    GRKINDEXT_TEST,
    GRKINDEXT_IZUMI,
    GRKINDEXT_PSTAD,
    GRKINDEXT_CASTLE,
    GRKINDEXT_KONGO,
    GRKINDEXT_ZEBES,
    GRKINDEXT_CORNERIA,
    GRKINDEXT_STORY,
    GRKINDEXT_ONETT,
    GRKINDEXT_MUTECITY,
    GRKINDEXT_RCRUISE,
    GRKINDEXT_GARDEN,
    GRKINDEXT_GREATBAY,
    GRKINDEXT_SHRINE,
    GRKINDEXT_KRAID,
    GRKINDEXT_YOSTER,
    GRKINDEXT_GREENS,
    GRKINDEXT_FOURSIDE,
    GRKINDEXT_MK1,
    GRKINDEXT_MK2,
    GRKINDEXT_AKANEIA,
    GRKINDEXT_VENOM,
    GRKINDEXT_PURA,
    GRKINDEXT_BIGBLUE,
    GRKINDEXT_ICEMT,
    GRKINDEXT_ICETOP,
    GRKINDEXT_FLATZONE,
    GRKINDEXT_OLDPU,
    GRKINDEXT_OLDSTORY,
    GRKINDEXT_OLDKONGO,
    GRKINDEXT_BATTLE,
    GRKINDEXT_FD,
};

/*** Structs ***/

struct MapDesc
{
    void (*onCreation)(GOBJ *map);
    int (*onDeletion)(GOBJ *map);
    void (*onFrame)(GOBJ *map);
    void (*onUnk)(GOBJ *map);
    unsigned char is_lobj : 1; //  0x80
    unsigned char is_fog : 1;  //  0x40
    unsigned char is_cobj : 1; //  0x20
};

struct MapData
{
    int x0;                            // 0x0
    GOBJ *gobj;                        // 0x4
    int x8;                            // 0x8
    int xC;                            // 0xC
    unsigned char flagx80 : 1;         // 0x10, 0x80
    unsigned char flagx40 : 1;         // 0x10, 0x40
    unsigned char is_fog : 1;          // 0x10, 0x20, checked @ 801c5e80 and 801c5f10
    unsigned char flagx10 : 1;         // 0x10, 0x10
    unsigned char flagx8 : 1;          // 0x10, 0x08
    unsigned char is_check_shadow : 1; // 0x10, 0x04, will run the "shadow check" per fighter to see if a fighter's shadow should be drawn
    unsigned char flagx2 : 1;          // 0x10, 0x02
    unsigned char flagx1 : 1;          // 0x10, 0x01
    unsigned char gx_unk2 : 3;         // 0x11, 0x80
    unsigned char flag2x10 : 1;        // 0x11, 0x10
    unsigned char flag2x08 : 1;        // 0x11, 0x08
    unsigned char flag2x04 : 1;        // 0x11, 0x04, will run the "shadow check" per fighter to see if a fighter's shadow should be drawn
    unsigned char flag2x02 : 1;        // 0x11, 0x02
    unsigned char flag2x01 : 1;        // 0x11, 0x01
    int index;                         // 0x14, map_gobj index
    int x18;                           // 0x18
    int x1c;                           // 0x1c
    int live_sfx[8];                   // 0x20, sfx ID's currently playing
    int x40;                           // 0x40
    int x44;                           // 0x44
    int x48;                           // 0x48
    int x4c;                           // 0x4c
    int x50;                           // 0x50
    int x54;                           // 0x54
    int x58;                           // 0x58
    int x5c;                           // 0x5c
    int x60;                           // 0x60
    int x64;                           // 0x64
    int x68;                           // 0x68
    int x6c;                           // 0x6c
    int x70;                           // 0x70
    int x74;                           // 0x74
    int x78;                           // 0x78
    int x7c;                           // 0x7c
    int x80;                           // 0x80
    int x84;                           // 0x84
    int x88;                           // 0x88
    int x8c;                           // 0x8c
    int x90;                           // 0x90
    int x94;                           // 0x94
    int x98;                           // 0x98
    int x9c;                           // 0x9c
    int xa0;                           // 0xa0
    int xa4;                           // 0xa4
    int xa8;                           // 0xa8
    int xac;                           // 0xac
    int xb0;                           // 0xb0
    int xb4;                           // 0xb4
    int xb8;                           // 0xb8
    int xbc;                           // 0xbc
    int xc0;                           // 0xc0
    u16 xc4;                           // 0xc4
    u8 xc6;                            // 0xc6
    u8 xc7;                            // 0xc7
    int xc8;                           // 0xc8
    int xcc;                           // 0xcc
    int xd0;                           // 0xd0
    int xd4;                           // 0xd4
    int xd8;                           // 0xd8
    int xdc;                           // 0xdc
    struct
    {
        int mapVar0; // 0xe0
        int mapVar1; // 0xe4
        int mapVar2; // 0xe8
        int mapVar3; // 0xec
        int mapVar4; // 0xf0
        int mapVar5; // 0xf4
        int mapVar6; // 0xf8
        int mapVar7; // 0xfc
        int x100;    // 0x100
        int x104;    // 0x104
        int x108;    // 0x108
        int x10c;    // 0x10c
        int x110;    // 0x110
        int x114;    // 0x114
        int x118;    // 0x118
        int x11c;    // 0x11c
        int x120;    // 0x120
        int x124;    // 0x124
        int x128;    // 0x128
        int x12c;    // 0x12c
        int x130;    // 0x130
        int x134;    // 0x134
        int x138;    // 0x138
        int x13c;    // 0x13c
        int x140;    // 0x140
        int x144;    // 0x144
        int x148;    // 0x148
        int x14c;    // 0x14c
        int x150;    // 0x150
        int x154;    // 0x154
        int x158;    // 0x158
        int x15c;    // 0x15c
        int x160;    // 0x160
        int x164;    // 0x164
        int x168;    // 0x168
        int x16c;    // 0x16c
        int x170;    // 0x170
        int x174;    // 0x174
        int x178;    // 0x178
        int x17c;    // 0x17c
        int x180;    // 0x180
        int x184;    // 0x184
        int x188;    // 0x188
        int x18c;    // 0x18c
        int x190;    // 0x190
        int x194;    // 0x194
        int x198;    // 0x198
        int x19c;    // 0x19c
        int x1a0;    // 0x1a0
        int x1a4;    // 0x1a4
        int x1a8;    // 0x1a8
        int x1ac;    // 0x1ac
        int x1b0;    // 0x1b0
        int x1b4;    // 0x1b4
        int x1b8;    // 0x1b8
        int x1bc;    // 0x1bc
        int x1c0;    // 0x1c0
        int x1c4;    // 0x1c4
        int x1c8;    // 0x1c8
        int x1cc;    // 0x1cc
        int x1d0;    // 0x1d0
        int x1d4;    // 0x1d4
        int x1d8;    // 0x1d8
        int x1dc;    // 0x1dc
        int x1e0;    // 0x1e0
        int x1e4;    // 0x1e4
        int x1e8;    // 0x1e8
        int x1ec;    // 0x1ec
        int x1f0;    // 0x1f0
        int x1f4;    // 0x1f4
        int x1f8;    // 0x1f8
        int x1fc;    // 0x1fc
        int x200;    // 0x200
    } map_var;
};

struct StageOnGO
{
    StageOnGO *next;
    GOBJ *map_gobj;
    void *cb;
};

struct Stage
{
    float cambound_left;                                                  // 0x0
    float cambound_right;                                                 // 0x4
    float cambound_top;                                                   // 0x8
    float cambound_bottom;                                                // 0xc
    Vec2 cambound_offset;                                                 // 0x10, offset of the camera bounds. begins checking for crowd gasps below this Y component
    float fov_d;                                                          // 0x18
    float fov_u;                                                          // 0x1c
    float fov_r;                                                          // 0x20, actually horizontal rotation?
    float fov_l;                                                          // 0x24
    float x28;                                                            // 0x28
    float x2c;                                                            // 0x2c
    float x30;                                                            // 0x30
    float x34;                                                            // 0x34, camera distance min
    float x38;                                                            // 0x38
    float x3c;                                                            // 0x3c
    float x40;                                                            // 0x40
    int x44;                                                              // 0x44
    int x48;                                                              // 0x48
    int x4c;                                                              // 0x4c
    int x50;                                                              // 0x50
    int x54;                                                              // 0x54
    int x58;                                                              // 0x58
    int x5c;                                                              // 0x5c
    int x60;                                                              // 0x60
    int x64;                                                              // 0x64
    int x68;                                                              // 0x68
    int x6c;                                                              // 0x6c
    int x70;                                                              // 0x70
    float blastzoneLeft;                                                  // 0x74
    float blastzoneRight;                                                 // 0x78
    float blastzoneTop;                                                   // 0x7c
    float blastzoneBottom;                                                // 0x80
    u8 x84_80 : 1;                                                        // 0x84
    u8 x84_40 : 1;                                                        // 0x84
    u8 x84_20 : 1;                                                        // 0x84
    u8 x84_10 : 1;                                                        // 0x84
    u8 x84_08 : 1;                                                        // 0x84
    u8 x84_04 : 1;                                                        // 0x84
    u8 x84_02 : 1;                                                        // 0x84
    u8 x84_01 : 1;                                                        // 0x84
    u8 x85;                                                               // 0x85
    u8 x86;                                                               // 0x86
    u8 x87_80 : 1;                                                        // 0x87
    u8 is_end_temple : 1;                                                 // 0x87, 0x40
    u8 x87_20 : 1;                                                        // 0x87
    u8 is_end_mush : 1;                                                   // 0x87, 0x10
    u8 x87_08 : 1;                                                        // 0x87
    u8 x87_04 : 1;                                                        // 0x87
    u8 x87_02 : 1;                                                        // 0x87
    u8 x87_01 : 1;                                                        // 0x87
    int kind;                                                             // 0x88
    u8 flags2x80 : 1;                                                     // 0x8c
    u8 flags2x40 : 1;                                                     // 0x8c
    u8 flags2x20 : 1;                                                     // 0x8c
    u8 flags2x10 : 1;                                                     // 0x8c
    u8 flags2x08 : 1;                                                     // 0x8c
    u8 flags2x04 : 1;                                                     // 0x8c
    u8 end_check_mush : 1;                                                // 0x8c
    u8 end_check_temple : 1;                                              // 0x8c
    int (*OnEnterEndGame1Check)(Vec3 *f_pos, int genpoint_index);         // 0x90
    int (*OnEnterEndGame2Check)(Vec3 *f_pos, int genpoint_index);         // 0x94
    int hpsID;                                                            // 0x98
    int x9c;                                                              // 0x9c
    int xa0;                                                              // 0xa0
    int xa4;                                                              // 0xa4
    int xa8;                                                              // 0xa8
    int xac;                                                              // 0xac
    int xb0;                                                              // 0xb0
    int xb4;                                                              // 0xb4
    int xb8;                                                              // 0xb8
    int xbc;                                                              // 0xbc
    int xc0;                                                              // 0xc0
    int xc4;                                                              // 0xc4
    int xc8;                                                              // 0xc8
    int xcc;                                                              // 0xcc
    int xd0;                                                              // 0xd0
    int xd4;                                                              // 0xd4
    int xd8;                                                              // 0xd8
    int xdc;                                                              // 0xdc
    int xe0;                                                              // 0xe0
    int xe4;                                                              // 0xe4
    int xe8;                                                              // 0xe8
    int xec;                                                              // 0xec
    int xf0;                                                              // 0xf0
    int xf4;                                                              // 0xf4
    int xf8;                                                              // 0xf8
    int xfc;                                                              // 0xfc
    int x100;                                                             // 0x100
    int x104;                                                             // 0x104
    int x108;                                                             // 0x108
    int x10c;                                                             // 0x10c
    int x110;                                                             // 0x110
    int x114;                                                             // 0x114
    int x118;                                                             // 0x118
    int x11c;                                                             // 0x11c
    int x120;                                                             // 0x120
    int x124;                                                             // 0x124
    int x128;                                                             // 0x128
    int x12c;                                                             // 0x12c
    int x130;                                                             // 0x130
    int x134;                                                             // 0x134
    int x138;                                                             // 0x138
    int x13c;                                                             // 0x13c
    int x140;                                                             // 0x140
    int x144;                                                             // 0x144
    int x148;                                                             // 0x148
    int x14c;                                                             // 0x14c
    int x150;                                                             // 0x150
    int x154;                                                             // 0x154
    int x158;                                                             // 0x158
    int x15c;                                                             // 0x15c
    int x160;                                                             // 0x160
    int x164;                                                             // 0x164
    int x168;                                                             // 0x168
    int x16c;                                                             // 0x16c
    int x170;                                                             // 0x170
    int x174;                                                             // 0x174
    int x178;                                                             // 0x178
    void (*OnShadowRender)(Vec3 *fighter_pos, int unk, JOBJ *stage_jobj); // 0x17c
    GOBJ *map_gobjs[64];
    JOBJ *general_points[256];  // 0x280
    int x680;                   // 0x680
    int x684;                   // 0x684
    int x688;                   // 0x688
    int x68c;                   // 0x68c
    int x690;                   // 0x690
    int x694;                   // 0x694
    int x698;                   // 0x698
    int x69c;                   // 0x69c
    int x6a0;                   // 0x6a0
    StageOnGO *on_go;           // 0x6a4
    int *itemData;              // 0x6a8
    int *coll_data;             // 0x6ac
    int *grGroundParam;         // 0x6b0
    int *ALDYakuAll;            // 0x6b4
    int *map_ptcl;              // 0x6b8
    int *map_texg;              // 0x6bc
    void *yakumono_param;       // 0x6c0
    int *map_plit;              // 0x6c4
    int *x6c8;                  // 0x6c8
    void *quake_model_set;      // 0x6cc
    int *x6d0;                  // 0x6d0
    int targets_left;           // 0x6d4
    int x6d8;                   // 0x6d8
    int x6dc;                   // 0x6dc
    int x6e0;                   // 0x6e0
    int x6e4;                   // 0x6e4
    int x6e8;                   // 0x6e8
    int x6ec;                   // 0x6ec
    int x6f0;                   // 0x6f0
    int x6f4;                   // 0x6f4
    int x6f8;                   // 0x6f8
    int x6fc;                   // 0x6fc
    int x700;                   // 0x700
    int x704;                   // 0x704
    int x708;                   // 0x708
    float endgame1_boundwidth;  // 0x70c, used for mush king
    float endgame1_boundheight; // 0x710, used for mush king
    int endgame1_genpoint;      // 0x714, general point that ended the game, used for mush king
    float endgame2_boundwidth;  // 0x718, used for temple
    float endgame2_boundheight; // 0x71c, used for temple
    int endgame2_genpoint;      // 0x720, general point that ended the gamem, used for temple
    int x724;                   // 0x724
    int x728;                   // 0x728
    int x72C;                   // 0x728
};

struct GeneralPoints
{
    u16 jobj_index;
    u16 kind;
};

struct GeneralPointsInfo
{
    JOBJ *jobj;
    GeneralPoints *general_point;
    int num;
};

struct MapHead
{
    GeneralPointsInfo *general_points_info;
    int general_points_num;
    void *map_gobjs; // pointer to array of map_gobjs
    int map_gobj_num;
    void *splines;
    int splines_num;
    void *lights;
    int lights_num;
};

struct StageFile
{
    ArchiveInfo *archive_info;
    MapHead *map_head;
};

struct GrDesc
{
    int internal_id;
    void *map_gobj_functions;
    char *filename;
    void *onInit;
    void *x10;
    void *onLoad;
    void *onGo;
    void *x1c;
    void *line_damage_check;
    void *x24;
    int x28;
    void *x2c;
    int x30;
};

struct GrExtLookup
{
    int internal_id;
    int x4;
    int x8;
};

Stage *stc_stage = 0x8049e6c8;
int *ftchkdevice_windnum = R13 + (-0x5128);
int *ftchkdevice_grabnum = R13 + (-0x512C);
int *ftchkdevice_dmgnum = R13 + (-0x5130);

/*** Functions ***/

StageFile *Stage_GetStageFiles();                 // returns an array of StageFiles
StageFile *Stage_GetStageFile(int mapgobj_index); // returns the StageFile the ID belongs to
void Stage_AddFtChkDevice(GOBJ *map, int hazard_kind, void *check);
void Stage_SetChkDevicePos(float y_pos);
void Stage_GetChkDevicePos(float *y_pos, float *y_delta);
float Stage_GetScale();
int *Stage_GetYakumonoParam();
void Stage_MapStateChange(GOBJ *map, int map_gobjID, int anim_id);
int Stage_CheckAnimEnd(GOBJ *map, int jobj_index, int flags);  // 0x1 = unk aobj, 0x2 = material aobj, 0x4 = unk aobj
int Stage_CheckAnimEnd2(GOBJ *map, int jobj_index, int flags); // 0x1 = unk aobj, 0x2 = material aobj, 0x4 = unk aobj
void Stage_PlaySFX(GOBJ *map, int live_index, int sfx_id);
int Stage_CheckSFX(GOBJ *map, int live_index);
void Dynamics_DecayWind();
GOBJ *Stage_CreateMapGObj(int mapgobjID);
void Stage_DestroyMapGObj(GOBJ *map_gobj);
void *GXLink_Stage(GOBJ *gobj, int pass);
GOBJ *Stage_GetMapGObj(int mapgobjID);
JOBJ *Stage_GetMapGObjJObj(GOBJ *mapgobj, int jointIndex);
int Stage_GetLinesGroup(int line);
int Stage_GetLinesUnk(int line);
int Stage_GetLinesDirection(int line);
void Stage_SetGroundCallback(int line, void *userdata, void *callback);
void Stage_SetCeilingCallback(int line, void *userdata, void *callback);
void Stage_InitMovingColl(JOBJ *mapjoint, int mapgobjID);
void Stage_UpdateMovingColl(GOBJ *mapgobj);
Particle *Stage_SpawnEffectPos(int gfxID, int efFileID, Vec3 *pos);
Particle *Stage_SpawnEffectJointPos(int gfxID, int efFileID, JOBJ *pos);
Particle *Stage_SpawnEffectJointPos2(int gfxID, int efFileID, JOBJ *pos);
int GrColl_RaycastGround(Vec3 *coll_pos, int *line_index, int *line_kind, Vec3 *unk1, Vec3 *unk2, Vec3 *unk3, Vec3 *unk4, void *cb, float fromX, float fromY, float toX, float toY, float unk5); // make unk5
int GrColl_RaycastGround2(Vec3 *coll_pos, int *line_index, int *line_kind, void *unk, void *cb, void *unk2, float fromX, float fromY, float toX, float toY);                                     // unk = 0, unk2 = -1;
int GrColl_RaycastWall(Vec3 *coll_pos, int *line_index, int *line_kind, void *unk, void *cb, void *unk2, float fromX, float fromY, float toX, float toY);
GOBJ *Zako_Create(int item_id, Vec3 *pos, JOBJ *jobj, Vec3 *velocity, int isMovingItem);
GOBJ *Stage_CreateMapItem(MapData *map_data, int takeDamageSFXKind, int state, JOBJ *joint, Vec3 *pos, int unk_bool, void *onGiveDamage, void *onTakeDamage); // this function creates an item of id 0xA0, its a generic ID used across multiple stages. its mainly used for giving a joint a hurtbox/hitbox and an onTakeDamage callback.
int Stage_CheckForNearbyFighters(Vec3 *pos, float radius);
float Stage_GetBlastzoneRight();
float Stage_GetBlastzoneLeft();
float Stage_GetBlastzoneTop();
float Stage_GetBlastzoneBottom();
float Stage_GetCameraRight();
float Stage_GetCameraLeft();
float Stage_GetCameraTop();
float Stage_GetCameraBottom();
int Stage_GetGeneralPoint(int index, Vec3 *pos);
void Stage_EnableLineGroup(int index);
void Stage_DisableLineGroup(int index);
void Stage_LinkLineGroups(int group1, int group2);
void Stage_InitLines(void *coll_data);
void Stage_InitCatchHazard(GOBJ *map, int unk, void *check_cb);
void Stage_InitMoveHazard(GOBJ *map, int unk, void *check_cb);
void Stage_InitDamageHazard(GOBJ *map, int unk, void *check_cb);
int Stage_GetExternalID();
int Stage_ExternalToInternal(int ext_id);
#endif