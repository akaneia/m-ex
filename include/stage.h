#ifndef MEX_H_STAGE
#define MEX_H_STAGE

#include "structs.h"
#include "datatypes.h"
#include "obj.h"
#include "hsd.h"

// map_gobjDesc Flags
#define map_isBG 0x40000000
#define map_isUnk 0x80000000

/*** Structs ***/

struct map_gobjDesc
{
    void *(*onCreation)(GOBJ *map);
    void *onDeletion;
    void *onFrame;
    void *onUnk;
    int flags;
};

struct map_gobjData
{
    int x0;                    // 0x0
    GOBJ *gobj;                // 0x4
    int x8;                    // 0x8
    int xC;                    // 0xC
    unsigned char flagx80 : 1; //  0x80
    unsigned char flagx40 : 1; //  0x40
    unsigned char isFog : 1;   //  0x20, checked @ 801c5e80 and 801c5f10
    unsigned char flagx10 : 1; //  0x10
    unsigned char flagx8 : 1;  //  0x08
    unsigned char gx_unk1 : 1; //  0x04, checked @ 801c5e9c
    unsigned char flagx2 : 1;  //  0x02
    unsigned char flagx1 : 1;  //  0x01

    unsigned char gx_unk2 : 3;  //  0x80
    unsigned char flag2x10 : 1; //  0x10
    unsigned char flag2x08 : 1; //  0x08
    unsigned char flag2x04 : 1; //  0x04, checked @ 801c5e9c
    unsigned char flag2x02 : 1; //  0x02
    unsigned char flag2x01 : 1; //  0x01

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
    } map_struct;
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

/*** Functions ***/

Stage *(*Stage_GetStageInfo)() = (void *)0x801c6324;
void (*Stage_AddFtChkDevice)(GOBJ *map, int hazard_kind, void *check) = (void *)0x800c07f8;
void (*Stage_SetChkDevicePos)(float y_pos) = (void *)0x801c438c;
void (*Stage_GetChkDevicePos)(float *y_pos, float *y_delta) = (void *)0x801c4368;
float (*Stage_GetScale)() = (void *)0x801c0498;
int *(*Stage_GetYakumonoParam)() = (void *)0x801c49f8;
void (*Stage_MapStateChange)(GOBJ *map, int map_gobjID, int anim_id) = (void *)0x801c8138;
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
GOBJ *(*Zako_Create)(int item_id, Vec3 *pos, JOBJ *jobj, Vec3 *velocity, int isMovingItem) = (void *)0x8027b5b0;
GOBJ *(*Stage_CreateMapItem)(map_gobjData *map_data, int takeDamageSFXKind, int state, JOBJ *joint, Vec3 *pos, int unk_bool, void *onGiveDamage, void *onTakeDamage) = (void *)0x802e6aec; // this function creates an item of id 0xA0, its a generic ID used across multiple stages. its mainly used for giving a joint a hurtbox/hitbox and an onTakeDamage callback.
int (*Stage_CheckForNearbyFighters)(Vec3 *pos, float radius) = (void *)0x801c9ee8;
float (*Stage_GetBlastzoneRight)() = (void *)0x80224b38;
float (*Stage_GetBlastzoneLeft)() = (void *)0x80224b50;
float (*Stage_GetBlastzoneTop)() = (void *)0x80224b68;
float (*Stage_GetBlastzoneBottom)() = (void *)0x80224b80;

#endif