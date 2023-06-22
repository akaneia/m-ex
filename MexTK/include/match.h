#ifndef MEX_H_MATCH
#define MEX_H_MATCH

#include "structs.h"
#include "datatypes.h"
#include "obj.h"
#include "fighter.h"
#include "gx.h"

// Match Data definitions
#define MATCH_TIMER_FROZEN 0
#define MATCH_TIMER_HIDE 1
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

enum MatchState
{
    MATCHSTATE_INPROG,
    MATCHSTATE_GAME,
    MATCHSTATE_EXIT,
};

enum MatchEndKind
{
    MATCHENDKIND_NONE,      // hasn't ended yet?
    MATCHENDKIND_VSTIME,    // timeout in a VS match
    MATCHENDKIND_VSGAME,    // successful ending to a VS match
    MATCHENDKIND_3,         //
    MATCHENDKIND_1PLOSE,    // used for dying in 1p games
    MATCHENDKIND_5,         //
    MATCHENDKIND_1PWIN,     // winning a 1p game
    MATCHENDKIND_NOCONTEST, //
    MATCHENDKIND_RETRY,     // stadium retry
    MATCHENDKIND_OVERRIDE,  // match end was requested by external code
};

enum MatchPLinks
{
    MATCHPLINK_SYS,
    MATCHPLINK_1,
    MATCHPLINK_2,
    MATCHPLINK_LIGHT,
    MATCHPLINK_ZAKO,
    MATCHPLINK_MAP,
    MATCHPLINK_COLL,
    MATCHPLINK_7,
    MATCHPLINK_FIGHTER,
    MATCHPLINK_ITEM,
    MATCHPLINK_10,
    MATCHPLINK_EFFECT1,
    MATCHPLINK_EFFECT2,
    MATCHPLINK_MAPMISC,
    MATCHPLINK_MISC,
    MATCHPLINK_HUD,
    MATCHPLINK_16,
    MATCHPLINK_17,
    MATCHPLINK_MATCHCAM,
    MATCHPLINK_MISCCAM,
    MATCHPLINK_HUDCAM,
    MATCHPLINK_COINCAM,
    MATCHPLINK_SCREENFLASHCAM,
    MATCHPLINK_CROWDSFX,
    MATCHPLINK_DEVTEXT,
};

/*** Structs ***/

struct MatchInit
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
    unsigned char isDisableMusic : 1;
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
    // byte 0x4
    unsigned char unk11 : 1;             // 0x80
    unsigned char isCheckStockSteal : 1; // 0x40
    unsigned char isRunStockLogic : 1;   // 0x20
    unsigned char unk1f : 5;             // 0x1f
    // byte 0x5
    unsigned char no_check_end : 1;        // 0x80
    unsigned char isSkipUnkStockCheck : 1; // 0x40
    unsigned char no_hit : 1;              // 0x20
    unsigned char unk12 : 5;               // 0x01
    // byte 0x6
    u8 bombRain; // 0xFF
    // byte 0x7
    u8 unk13; // 0xFF
    // byte 0x8
    u8 is_teams; // 0xFF
    // byte 0x9
    u8 use_ko_count; // 0xFF
    // byte 0xA
    u8 unk14; // 0xFF
    // byte 0xB
    s8 itemFreq; // 0xFF
    // byte 0xC
    u8 unk15; // 0xFF
    // byte 0xD
    u8 unk16; // 0xFF
    // byte 0xE
    u16 stage; // 0xFFFF
    // byte 0x10
    int timerSeconds : 32; // 0xFFFFFFFF
    // byte 0x14
    u8 timerSubSeconds; // 0xFF
    // 0x18
    int unk17; // 0xFFFFFFFF
    // 0x1C
    unsigned long long itemSwitch : 64; // 0xFFFFFFFF FFFFFFFF
    // byte 0x24
    int unk18; // 0xFFFFFFFF
    // 0x28
    float quake_mult;
    // 0x2C
    float dmg_ratio;
    // 0x30
    float match_speed;
    // 0x34
    int x34;
    // 0x38
    int x38;
    // 0x3C
    int x3c; // something fixed camera
    // 0x40
    void *onStartMelee;
    // 0x44
    void *onMatchFrame1;
    // 0x48
    void *onMatchFrame2;
    // 0x4c
    void *onMatchEnd;
    // 0x50
    void *onMatchStart;
    // 0x54
    void *onCheckPause;
    // 0x58
    int x58;

    /*
    //0x5C
    int x5c;

    //0x60
    int x60;
    //0x64
    int x64;
    */

    // player data
    PlayerData playerData[6];
};

struct MatchHUDElement
{
    GOBJ *percent;
    GOBJ *insignia;
    u8 x8;
    u8 x9;
    u16 xa;
    u16 xc;
    u8 xe;
    u8 xf;
    unsigned char is_removed : 1; // 0x80 - 0x10, related to destruction of percent digits
    unsigned char x10_40 : 1;     // 0x40 - 0x10, related to destruction of percent digits
    unsigned char x10_20 : 1;     // 0x20 - 0x10
    unsigned char x10_10 : 1;     // 0x10 - 0x10
    unsigned char is_hidden : 1;  // 0x08 - 0x10
    unsigned char x10_04 : 1;     // 0x04 - 0x10
    unsigned char x10_02 : 1;     // 0x02 - 0x10,
    unsigned char x10_01 : 1;     // 0x01 - 0x10
    u8 x11;
    u8 x12;
    u8 x13;
    float x14[3];              // 0x14
    float percent_digitpos[4]; // 0x20, 3 digits and the percent sign
    int x30[8];                // 0x30
    JOBJ *x50[5];              // 0x50
};
struct MatchHUDStock
{
    GOBJ *gobj;
    JOBJ *jobj[17];
    int curr_coins;
    int curr_stocks;
};
struct MatchHUD
{
    GOBJ *cam_gobj;   // 0x0
    GOBJ *light_gobj; // 0x4
    int x8;           // 0x8
    // the following positions are derived from the ScInfDmg_scene_data symbol in IfAll
    Vec3 timer_pos;                  // 0xc
    Vec3 player_hud_pos[6];          // 0x18
    Vec3 joint8_pos[3];              // 0x60
    Vec3 joint11_pos[2];             // 0x84
    void *x9c;                       // 0x9c
    GOBJ *timer_gobj;                // 0xA0
    u8 xa4[0x4C];                    // 0xA4
    MatchHUDElement element_data[6]; // 0xF0
    JOBJSet dmgnum_jobjset;          // 0x348
    JOBJSet dmgmark_jobjset;         // 0x358
    JOBJSet *ScnInfStc_scene_models; // 0x368
    u8 x36c[52];                     // 0x36c
    JOBJSet *stock_jobjset;          // 0x3a0
    JOBJSet *kocount_jobjset;        // 0x3a4
    MatchHUDStock stock[6];          //
};

struct CameraBox
{
    void *alloc;            // 0x0
    CameraBox *next;        // 0x4
    int kind;               // 0x8 2 = only focus if close to center
    int flags;              // 0xC
    Vec3 cam_pos;           // 0x10
    Vec3 bone_pos;          // 0x1c
    float direction;        // 0x28
    float boundleft_curr;   // 0x2C
    float boundright_curr;  // 0x30
    float boundtop_curr;    // 0x34
    float boundbottom_curr; // 0x38
    float x3c;              // 0x3c
    float boundleft_proj;   // 0x40
    float boundright_proj;  // 0x44
    float boundtop_proj;    // 0x48
    float boundbottom_proj; // 0x4c
    float x50;              // 0x50
};
struct MatchCamera
{
    GOBJ *gobj;                            // 0x0
    int cam_kind;                          // 0x4
    GXColor erase_color;                   // 0x8
    float zoom;                            // 0xc
    float dist_to_bg;                      // 0x10
    Vec3 x14;                              // 0x14
    Vec3 x20;                              // 0x20
    Vec3 x2c;                              // 0x2c
    Vec3 x38;                              // 0x38
    float x44;                             // 0x44
    float x48;                             // 0x48
    Vec3 x4c;                              // 0x4c
    Vec3 x58;                              // 0x58
    Vec3 x64;                              // 0x64
    Vec3 x70;                              // 0x70
    float x7c;                             // 0x7c
    float x80;                             // 0x80
    int x84;                               // 0x84
    int x88;                               // 0x88
    int x8c;                               // 0x8c
    int x90;                               // 0x90
    int x94;                               // 0x94
    int x98;                               // 0x98
    int x9c;                               // 0x9c
    int xa0;                               // 0xa0
    int xa4;                               // 0xa4
    int xa8;                               // 0xa8
    int xac;                               // 0xac
    int xb0;                               // 0xb0
    int xb4;                               // 0xb4
    int xb8;                               // 0xb8
    int xbc;                               // 0xbc
    int xc0;                               // 0xc0
    int xc4;                               // 0xc4
    int xc8;                               // 0xc8
    int xcc;                               // 0xcc
    int xd0;                               // 0xd0
    int xd4;                               // 0xd4
    int xd8;                               // 0xd8
    int xdc;                               // 0xdc
    int xe0;                               // 0xe0
    int xe4;                               // 0xe4
    int xe8;                               // 0xe8
    int xec;                               // 0xec
    int xf0;                               // 0xf0
    int xf4;                               // 0xf4
    int xf8;                               // 0xf8
    int xfc;                               // 0xfc
    int x100;                              // 0x100
    int x104;                              // 0x104
    int x108;                              // 0x108
    int x10c;                              // 0x10c
    int x110;                              // 0x110
    int x114;                              // 0x114
    int x118;                              // 0x118
    int x11c;                              // 0x11c
    int x120;                              // 0x120
    int x124;                              // 0x124
    int x128;                              // 0x128
    int x12c;                              // 0x12c
    int x130;                              // 0x130
    int x134;                              // 0x134
    int x138;                              // 0x138
    int x13c;                              // 0x13c
    int x140;                              // 0x140
    int x144;                              // 0x144
    int x148;                              // 0x148
    int x14c;                              // 0x14c
    int x150;                              // 0x150
    int x154;                              // 0x154
    int x158;                              // 0x158
    int x15c;                              // 0x15c
    int x160;                              // 0x160
    int x164;                              // 0x164
    int x168;                              // 0x168
    int x16c;                              // 0x16c
    int x170;                              // 0x170
    int x174;                              // 0x174
    int x178;                              // 0x178
    int x17c;                              // 0x17c
    int x180;                              // 0x180
    int x184;                              // 0x184
    int x188;                              // 0x188
    int x18c;                              // 0x18c
    int x190;                              // 0x190
    int x194;                              // 0x194
    int x198;                              // 0x198
    int x19c;                              // 0x19c
    int x1a0;                              // 0x1a0
    int x1a4;                              // 0x1a4
    int x1a8;                              // 0x1a8
    int x1ac;                              // 0x1ac
    int x1b0;                              // 0x1b0
    int x1b4;                              // 0x1b4
    int x1b8;                              // 0x1b8
    int x1bc;                              // 0x1bc
    int x1c0;                              // 0x1c0
    int x1c4;                              // 0x1c4
    int x1c8;                              // 0x1c8
    int x1cc;                              // 0x1cc
    int x1d0;                              // 0x1d0
    int x1d4;                              // 0x1d4
    int x1d8;                              // 0x1d8
    int x1dc;                              // 0x1dc
    int x1e0;                              // 0x1e0
    int x1e4;                              // 0x1e4
    int x1e8;                              // 0x1e8
    int x1ec;                              // 0x1ec
    int x1f0;                              // 0x1f0
    int x1f4;                              // 0x1f4
    int x1f8;                              // 0x1f8
    int x1fc;                              // 0x1fc
    int x200;                              // 0x200
    int x204;                              // 0x204
    int x208;                              // 0x208
    int x20c;                              // 0x20c
    int x210;                              // 0x210
    int x214;                              // 0x214
    int x218;                              // 0x218
    int x21c;                              // 0x21c
    int x220;                              // 0x220
    int x224;                              // 0x224
    int x228;                              // 0x228
    int x22c;                              // 0x22c
    int x230;                              // 0x230
    int x234;                              // 0x234
    int x238;                              // 0x238
    int x23c;                              // 0x23c
    int x240;                              // 0x240
    int x244;                              // 0x244
    int x248;                              // 0x248
    int x24c;                              // 0x24c
    int x250;                              // 0x250
    int x254;                              // 0x254
    int x258;                              // 0x258
    int x25c;                              // 0x25c
    int x260;                              // 0x260
    int x264;                              // 0x264
    int x268;                              // 0x268
    int x26c;                              // 0x26c
    int x270;                              // 0x270
    int x274;                              // 0x274
    int x278;                              // 0x278
    int x27c;                              // 0x27c
    int x280;                              // 0x280
    int x284;                              // 0x284
    int x288;                              // 0x288
    int x28c;                              // 0x28c
    int x290;                              // 0x290
    int x294;                              // 0x294
    int x298;                              // 0x298
    int x29c;                              // 0x29c
    int x2a0;                              // 0x2a0
    int x2a4;                              // 0x2a4
    int x2a8;                              // 0x2a8
    int x2ac;                              // 0x2ac
    int x2b0;                              // 0x2b0
    int x2b4;                              // 0x2b4
    int x2b8;                              // 0x2b8
    int x2bc;                              // 0x2bc
    float cam_;                            // 0x2c0
    int x2c4;                              // 0x2c4
    int x2c8;                              // 0x2c8
    int x2cc;                              // 0x2cc
    int x2d0;                              // 0x2d0
    int x2d4;                              // 0x2d4
    int x2d8;                              // 0x2d8
    int x2dc;                              // 0x2dc
    int x2e0;                              // 0x2e0
    int x2e4;                              // 0x2e4
    int x2e8;                              // 0x2e8
    float freecam_tilt_vertical;           // 0x2ec, uses radians
    int x2f0;                              // 0x2f0
    int x2f4;                              // 0x2f4
    float freecam_zoommax;                 // 0x2f8
    float freecam_zoommin;                 // 0x2fc
    int x300;                              // 0x300
    int x304;                              // 0x304
    Vec3 freecam_pos;                      // 0x308
    Vec3 freecam_offset;                   // 0x314                // 0x314
    Vec2 freecam_rotate;                   // 0x320
    Vec3 freecam_fov;                      // 0x328
    int x334;                              // 0x334
    int x338;                              // 0x338
    int x33c;                              // 0x33c
    int x340;                              // 0x340
    int x344;                              // 0x344
    int x348;                              // 0x348
    int x34c;                              // 0x34c
    int x350;                              // 0x350
    int x354;                              // 0x354
    int x358;                              // 0x358
    int x35c;                              // 0x35c
    int x360;                              // 0x360
    int x364;                              // 0x364
    int x368;                              // 0x368
    int x36c;                              // 0x36c
    int x370;                              // 0x370
    int x374;                              // 0x374
    int x378;                              // 0x378
    int x37c;                              // 0x37c
    int x380;                              // 0x380
    int x384;                              // 0x384
    int x388;                              // 0x388
    int x38c;                              // 0x38c
    int x390;                              // 0x390
    int x394;                              // 0x394
    unsigned char x398_80 : 1;             // 0x398
    unsigned char x398_40 : 1;             // 0x398
    unsigned char hide_stage2 : 1;         // 0x398, 0x20
    unsigned char hide_effects : 1;        // 0x398, 0x10
    unsigned char hide_lighting : 1;       // 0x398, 0x08
    unsigned char hide_background : 1;     // 0x398
    unsigned char item_render_flags : 2;   // 0x398, 0x03
    unsigned char map_render_flags : 2;    // 0x399, 0xC0, stage gobjs compare this to their render flags and only render if they match
    unsigned char x399x20 : 1;             // 0x399, 0x20
    unsigned char show_coll : 1;           // 0x399, 0x10
    unsigned char show_cam_blastzones : 1; // 0x399, 0x08
    unsigned char hide_stage : 1;          // 0x399, 0x04
    unsigned char x399_02 : 1;             // 0x399, 0x02
    unsigned char x399_01 : 1;             // 0x399, 0x01
    unsigned char x39a_80 : 1;             // 0x39a, 0x80
    unsigned char x39a_40 : 1;             // 0x39a, 0x40
    unsigned char show_item_spawns : 1;    // 0x39a, 0x20
    unsigned char x39a_10 : 1;             // 0x39a, 0x10
    unsigned char x39a_08 : 1;             // 0x39a, 0x80
    unsigned char x39a_04 : 1;             // 0x39a, 0x40
    unsigned char x39a_02 : 1;             // 0x39a, 0x20
    unsigned char x39a_01 : 1;             // 0x39a, 0x10
    char x39b;                             // 0x39b
    int x39c;                              // 0x39c
    int x3a0;                              // 0x3a0
    int x3a4;                              // 0x3a4
    int x3a8;                              // 0x3a8
    int x3ac;                              // 0x3ac
    int x3b0;                              // 0x3b0
    int x3b4;                              // 0x3b4
    int x3b8;                              // 0x3b8
    int x3bc;                              // 0x3bc
    int x3c0;                              // 0x3c0
    int x3c4;                              // 0x3c4
    int x3c8;                              // 0x3c8
    int x3cc;                              // 0x3cc
    int x3d0;                              // 0x3d0
    int x3d4;                              // 0x3d4
    Vec3 devcam_pos;                       // 0x3d8
    Vec3 devcam_rot;                       // 0x3e4
    float devcam_fov;                      // 0x3f0
    int x3f4;                              // 0x3f4
    int x3f8;                              // 0x3f8
    int x3fc;                              // 0x3fc
};

struct MatchOffscreen
{
    void *x0;
    void *x4;
    void *x8;
    unsigned char is_offscreen : 1;     // 0xC, 0x80
    unsigned char ignore_offscreen : 1; // 0xC, 0x40
    unsigned char x3f : 6;              // 0xC, 0x3f
    void *x10;
};

struct ExclamData
{
    GOBJ *gobj;           // 0x0
    int x4;               // 0x4
    int x8;               // 0x8
    int sfx;              // 0xc, -1 for none
    u8 x10;               // 0x10
    u8 x11;               // 0x11
    u8 is_play_sfx12 : 1; // 0x12, 0x80, flags
    u8 is_play_sfx3 : 1;  // 0x12, 0x40 flags
    u8 is_exec_func1 : 1; // 0x12, 0x20, flags
    u8 x12_x10 : 1;       // 0x12, flags
    u8 x12_x08 : 1;       // 0x12, flags
    u8 x12_x04 : 1;       // 0x12, flags
    u8 x12_x02 : 1;       // 0x12, flags
    u8 x12_x01 : 1;       // 0x12, flags
    int x14;              // 0x14
    void *on_start;       // 0x18, executes when exclam starts
    void *on_end;         // 0x1c, executes when exclam ends
    int sfx2;             // 0x20, -1 for none
    int sfx3;             // 0x24, -1 for none
};

struct PlayerStandings
{
    u8 pkind;          // 0x58
    u8 ckind;          // 0x59
    u8 ftkind;         // 0x5a
    u8 costume : 6;    // 0x5b costume id
    u8 is_rumble : 1;  // 0x5b rumble flag
    u8 is_stamina : 1; // 0x5b stamina flag
    u8 nametag;        // 0x5c
    u8 placement;      // 0x5d, (0 = 1st, 1 = 2nd, etc)
    u8 x5e;            // 0x5e, placement again?
    u8 team;           // 0x5f, index of this players team
    u8 stock_num;      // 0x60
    u8 hp;             // 0x61
    u8 sd_num;         // 0x62
    u8 fall_num;       // 0x63
    u16 dmg_num;       // 0x64
    u16 xe;            // 0x66
    int x68;           // 0x68
    int x6c;           // 0x6c
    int x70;           // 0x70
    int coins;         // 0x74
    int x78;           // 0x78
    int x7c;           // 0x7c
    int frames_alive;  // 0x80
    int death_time;    // 0x84, Time Player Lost All Stocks (Seconds), is 0x1 if player was the last survivor.
    int x88;           // 0x88
    int x8c;           // 0x8c
    int hits_landed;   // 0x90
    int attack_num;    // 0x94
    int x98;           // 0x98
    int x9c;           // 0x9c
    int xa0;           // 0xa0
    int xa4;           // 0xa4
    int xa8;           // 0xa8
    int xac;           // 0xac
    int xb0;           // 0xb0
    int xb4;           // 0xb4
    int xb8;           // 0xb8
    int xbc;           // 0xbc
    int xc0;           // 0xc0
    int xc4;           // 0xc4
    int xc8;           // 0xc8
    int xcc;           // 0xcc
    int xd0;           // 0xd0
    int xd4;           // 0xd4
    int xd8;           // 0xd8
    int xdc;           // 0xdc
    int xe0;           // 0xe0
    int ledgegrab_num; // 0xe4
    int xe8;           // 0xe8
    int xec;           // 0xec
    int xf0;           // 0xf0
    int xf4;           // 0xf4
    int xf8;           // 0xf8
    int xfc;           // 0xfc
};

struct TeamStandings
{
    int death_time; // 0x0, does this contain stocks for the winning team?
    int x4;         // 0x4
    u8 placement;   // 0x8
    u8 x9;          // 0x9
    u8 xa;          // 0xa
    u8 xb;          // 0xb
};

struct MatchStandings
{
    int x0;                           // 0x24c
    u8 end_kind;                      // 0x250
    u8 x5;                            // 0x251
    u8 is_teams;                      // 0x252
    int time_frames;                  // 0x254 how many frames passed in the match
    u8 xc;                            // 0x258
    u8 winner_num;                    // 0x259 is greater than 1 when a tie occurs
    u8 placings[4];                   // 0x25a - 0x25d, array of player indices in order of placement
    int x14;                          // 0x260
    int x18;                          // 0x264
    TeamStandings team_standings[5];  // 0x268
    PlayerStandings ply_standings[6]; // 0x2a4
};

struct Match // static match struct @ 8046b6a0
{
    u8 state;                 // 0x0
    u8 pauser;                // 0x1
    u8 x4;                    // 0x4
    u8 x5;                    // 0x5
    u8 request_match_end;     // 0x6, will override match end logic and set kind to
    u8 x7;                    // 0x7
    u8 end_kind;              // 0x8
    int xc;                   // 0xc
    int end_sfx_announcer;    // 0x10
    int end_sfx_crowd;        // 0x14
    int x18;                  // 0x18
    int x1c;                  // 0x1c
    int x20;                  // 0x20
    int time_frames;          // 0x24
    int time_seconds;         // 0x28
    u16 time_ms;              // 0x2c, counts frame 0-59
    int x30;                  // 0x30
    int x34;                  // 0x34
    int x38;                  // 0x38
    int x3c;                  // 0x3c
    int x40;                  // 0x40
    int x44;                  // 0x44
    int x48;                  // 0x48
    int x4c;                  // 0x4c
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
    int x7c;                  // 0x7c
    int x80;                  // 0x80
    int x84;                  // 0x84
    int x88;                  // 0x88
    int x8c;                  // 0x8c
    int x90;                  // 0x90
    int x94;                  // 0x94
    int x98;                  // 0x98
    int x9c;                  // 0x9c
    int xa0;                  // 0xa0
    int xa4;                  // 0xa4
    int xa8;                  // 0xa8
    int xac;                  // 0xac
    int xb0;                  // 0xb0
    int xb4;                  // 0xb4
    int xb8;                  // 0xb8
    int xbc;                  // 0xbc
    int xc0;                  // 0xc0
    int xc4;                  // 0xc4
    int xc8;                  // 0xc8
    int xcc;                  // 0xcc
    int xd0;                  // 0xd0
    int xd4;                  // 0xd4
    int xd8;                  // 0xd8
    int xdc;                  // 0xdc
    int xe0;                  // 0xe0
    int xe4;                  // 0xe4
    int xe8;                  // 0xe8
    int xec;                  // 0xec
    int xf0;                  // 0xf0
    int xf4;                  // 0xf4
    int xf8;                  // 0xf8
    int xfc;                  // 0xfc
    int x100;                 // 0x100
    int x104;                 // 0x104
    int x108;                 // 0x108
    int x10c;                 // 0x10c
    int x110;                 // 0x110
    int x114;                 // 0x114
    int x118;                 // 0x118
    int x11c;                 // 0x11c
    int x120;                 // 0x120
    int x124;                 // 0x124
    int x128;                 // 0x128
    int x12c;                 // 0x12c
    int x130;                 // 0x130
    int x134;                 // 0x134
    int x138;                 // 0x138
    int x13c;                 // 0x13c
    int x140;                 // 0x140
    int x144;                 // 0x144
    int x148;                 // 0x148
    int x14c;                 // 0x14c
    int x150;                 // 0x150
    int x154;                 // 0x154
    int x158;                 // 0x158
    int x15c;                 // 0x15c
    int x160;                 // 0x160
    int x164;                 // 0x164
    int x168;                 // 0x168
    int x16c;                 // 0x16c
    int x170;                 // 0x170
    int x174;                 // 0x174
    int x178;                 // 0x178
    int x17c;                 // 0x17c
    int x180;                 // 0x180
    int x184;                 // 0x184
    int x188;                 // 0x188
    int x18c;                 // 0x18c
    int x190;                 // 0x190
    int x194;                 // 0x194
    int x198;                 // 0x198
    int x19c;                 // 0x19c
    int x1a0;                 // 0x1a0
    int x1a4;                 // 0x1a4
    int x1a8;                 // 0x1a8
    int x1ac;                 // 0x1ac
    int x1b0;                 // 0x1b0
    int x1b4;                 // 0x1b4
    int x1b8;                 // 0x1b8
    int x1bc;                 // 0x1bc
    int x1c0;                 // 0x1c0
    int x1c4;                 // 0x1c4
    int x1c8;                 // 0x1c8
    int x1cc;                 // 0x1cc
    int x1d0;                 // 0x1d0
    int x1d4;                 // 0x1d4
    int x1d8;                 // 0x1d8
    int x1dc;                 // 0x1dc
    int x1e0;                 // 0x1e0
    int x1e4;                 // 0x1e4
    int x1e8;                 // 0x1e8
    int x1ec;                 // 0x1ec
    int x1f0;                 // 0x1f0
    int x1f4;                 // 0x1f4
    int x1f8;                 // 0x1f8
    int x1fc;                 // 0x1fc
    int x200;                 // 0x200
    int x204;                 // 0x204
    int x208;                 // 0x208
    int x20c;                 // 0x20c
    int x210;                 // 0x210
    int x214;                 // 0x214
    int x218;                 // 0x218
    int x21c;                 // 0x21c
    int x220;                 // 0x220
    int x224;                 // 0x224
    int x228;                 // 0x228
    int x22c;                 // 0x22c
    int x230;                 // 0x230
    int x234;                 // 0x234
    int x238;                 // 0x238
    int x23c;                 // 0x23c
    int x240;                 // 0x240
    int x244;                 // 0x244
    int x248;                 // 0x248
    MatchStandings standings; // 0x24c
    int x694;                 // 0x694
    int x698;                 // 0x698
    int x69c;                 // 0x69c
    int x6a0;                 // 0x6a0
    int x6a4;                 // 0x6a4
    int x6a8;                 // 0x6a8
    int x6ac;                 // 0x6ac
    int x6b0;                 // 0x6b0
    int x6b4;                 // 0x6b4
    int x6b8;                 // 0x6b8
    int x6bc;                 // 0x6bc
    int x6c0;                 // 0x6c0
    int x6c4;                 // 0x6c4
    int x6c8;                 // 0x6c8
    int x6cc;                 // 0x6cc
    int x6d0;                 // 0x6d0
    int x6d4;                 // 0x6d4
    int x6d8;                 // 0x6d8
    int x6dc;                 // 0x6dc
    int x6e0;                 // 0x6e0
    int x6e4;                 // 0x6e4
    int x6e8;                 // 0x6e8
    int x6ec;                 // 0x6ec
    int x6f0;                 // 0x6f0
    int x6f4;                 // 0x6f4
    int x6f8;                 // 0x6f8
    int x6fc;                 // 0x6fc
    int x700;                 // 0x700
    int x704;                 // 0x704
    int x708;                 // 0x708
    int x70c;                 // 0x70c
    int x710;                 // 0x710
    int x714;                 // 0x714
    int x718;                 // 0x718
    int x71c;                 // 0x71c
    int x720;                 // 0x720
    int x724;                 // 0x724
    int x728;                 // 0x728
    int x72c;                 // 0x72c
    int x730;                 // 0x730
    int x734;                 // 0x734
    int x738;                 // 0x738
    int x73c;                 // 0x73c
    int x740;                 // 0x740
    int x744;                 // 0x744
    int x748;                 // 0x748
    int x74c;                 // 0x74c
    int x750;                 // 0x750
    int x754;                 // 0x754
    int x758;                 // 0x758
    int x75c;                 // 0x75c
    int x760;                 // 0x760
    int x764;                 // 0x764
    int x768;                 // 0x768
    int x76c;                 // 0x76c
    int x770;                 // 0x770
    int x774;                 // 0x774
    int x778;                 // 0x778
    int x77c;                 // 0x77c
    int x780;                 // 0x780
    int x784;                 // 0x784
    int x788;                 // 0x788
    int x78c;                 // 0x78c
    int x790;                 // 0x790
    int x794;                 // 0x794
    int x798;                 // 0x798
    int x79c;                 // 0x79c
    int x7a0;                 // 0x7a0
    int x7a4;                 // 0x7a4
    int x7a8;                 // 0x7a8
    int x7ac;                 // 0x7ac
    int x7b0;                 // 0x7b0
    int x7b4;                 // 0x7b4
    int x7b8;                 // 0x7b8
    int x7bc;                 // 0x7bc
    int x7c0;                 // 0x7c0
    int x7c4;                 // 0x7c4
    int x7c8;                 // 0x7c8
    int x7cc;                 // 0x7cc
    int x7d0;                 // 0x7d0
    int x7d4;                 // 0x7d4
    int x7d8;                 // 0x7d8
    int x7dc;                 // 0x7dc
    int x7e0;                 // 0x7e0
    int x7e4;                 // 0x7e4
    int x7e8;                 // 0x7e8
    int x7ec;                 // 0x7ec
    int x7f0;                 // 0x7f0
    int x7f4;                 // 0x7f4
    int x7f8;                 // 0x7f8
    int x7fc;                 // 0x7fc
    int x800;                 // 0x800
    int x804;                 // 0x804
    int x808;                 // 0x808
    int x80c;                 // 0x80c
    int x810;                 // 0x810
    int x814;                 // 0x814
    int x818;                 // 0x818
    int x81c;                 // 0x81c
    int x820;                 // 0x820
    int x824;                 // 0x824
    int x828;                 // 0x828
    int x82c;                 // 0x82c
    int x830;                 // 0x830
    int x834;                 // 0x834
    int x838;                 // 0x838
    int x83c;                 // 0x83c
    int x840;                 // 0x840
    int x844;                 // 0x844
    int x848;                 // 0x848
    int x84c;                 // 0x84c
    int x850;                 // 0x850
    int x854;                 // 0x854
    int x858;                 // 0x858
    int x85c;                 // 0x85c
    int x860;                 // 0x860
    int x864;                 // 0x864
    int x868;                 // 0x868
    int x86c;                 // 0x86c
    int x870;                 // 0x870
    int x874;                 // 0x874
    int x878;                 // 0x878
    int x87c;                 // 0x87c
    int x880;                 // 0x880
    int x884;                 // 0x884
    int x888;                 // 0x888
    int x88c;                 // 0x88c
    int x890;                 // 0x890
    int x894;                 // 0x894
    int x898;                 // 0x898
    int x89c;                 // 0x89c
    int x8a0;                 // 0x8a0
    int x8a4;                 // 0x8a4
    int x8a8;                 // 0x8a8
    int x8ac;                 // 0x8ac
    int x8b0;                 // 0x8b0
    int x8b4;                 // 0x8b4
    int x8b8;                 // 0x8b8
    int x8bc;                 // 0x8bc
    int x8c0;                 // 0x8c0
    int x8c4;                 // 0x8c4
    int x8c8;                 // 0x8c8
    int x8cc;                 // 0x8cc
    int x8d0;                 // 0x8d0
    int x8d4;                 // 0x8d4
    int x8d8;                 // 0x8d8
    int x8dc;                 // 0x8dc
    int x8e0;                 // 0x8e0
    int x8e4;                 // 0x8e4
    int x8e8;                 // 0x8e8
    int x8ec;                 // 0x8ec
    int x8f0;                 // 0x8f0
    int x8f4;                 // 0x8f4
    int x8f8;                 // 0x8f8
    int x8fc;                 // 0x8fc
    int x900;                 // 0x900
    int x904;                 // 0x904
    int x908;                 // 0x908
    int x90c;                 // 0x90c
    int x910;                 // 0x910
    int x914;                 // 0x914
    int x918;                 // 0x918
    int x91c;                 // 0x91c
    int x920;                 // 0x920
    int x924;                 // 0x924
    int x928;                 // 0x928
    int x92c;                 // 0x92c
    int x930;                 // 0x930
    int x934;                 // 0x934
    int x938;                 // 0x938
    int x93c;                 // 0x93c
    int x940;                 // 0x940
    int x944;                 // 0x944
    int x948;                 // 0x948
    int x94c;                 // 0x94c
    int x950;                 // 0x950
    int x954;                 // 0x954
    int x958;                 // 0x958
    int x95c;                 // 0x95c
    int x960;                 // 0x960
    int x964;                 // 0x964
    int x968;                 // 0x968
    int x96c;                 // 0x96c
    int x970;                 // 0x970
    int x974;                 // 0x974
    int x978;                 // 0x978
    int x97c;                 // 0x97c
    int x980;                 // 0x980
    int x984;                 // 0x984
    int x988;                 // 0x988
    int x98c;                 // 0x98c
    int x990;                 // 0x990
    int x994;                 // 0x994
    int x998;                 // 0x998
    int x99c;                 // 0x99c
    int x9a0;                 // 0x9a0
    int x9a4;                 // 0x9a4
    int x9a8;                 // 0x9a8
    int x9ac;                 // 0x9ac
    int x9b0;                 // 0x9b0
    int x9b4;                 // 0x9b4
    int x9b8;                 // 0x9b8
    int x9bc;                 // 0x9bc
    int x9c0;                 // 0x9c0
    int x9c4;                 // 0x9c4
    int x9c8;                 // 0x9c8
    int x9cc;                 // 0x9cc
    int x9d0;                 // 0x9d0
    int x9d4;                 // 0x9d4
    int x9d8;                 // 0x9d8
    int x9dc;                 // 0x9dc
    int x9e0;                 // 0x9e0
    int x9e4;                 // 0x9e4
    int x9e8;                 // 0x9e8
    int x9ec;                 // 0x9ec
    int x9f0;                 // 0x9f0
    int x9f4;                 // 0x9f4
    int x9f8;                 // 0x9f8
    int x9fc;                 // 0x9fc
    int xa00;                 // 0xa00
    int xa04;                 // 0xa04
    int xa08;                 // 0xa08
    int xa0c;                 // 0xa0c
    int xa10;                 // 0xa10
    int xa14;                 // 0xa14
    int xa18;                 // 0xa18
    int xa1c;                 // 0xa1c
    int xa20;                 // 0xa20
    int xa24;                 // 0xa24
    int xa28;                 // 0xa28
    int xa2c;                 // 0xa2c
    int xa30;                 // 0xa30
    int xa34;                 // 0xa34
    int xa38;                 // 0xa38
    int xa3c;                 // 0xa3c
    int xa40;                 // 0xa40
    int xa44;                 // 0xa44
    int xa48;                 // 0xa48
    int xa4c;                 // 0xa4c
    int xa50;                 // 0xa50
    int xa54;                 // 0xa54
    int xa58;                 // 0xa58
    int xa5c;                 // 0xa5c
    int xa60;                 // 0xa60
    int xa64;                 // 0xa64
    int xa68;                 // 0xa68
    int xa6c;                 // 0xa6c
    int xa70;                 // 0xa70
    int xa74;                 // 0xa74
    int xa78;                 // 0xa78
    int xa7c;                 // 0xa7c
    int xa80;                 // 0xa80
    int xa84;                 // 0xa84
    int xa88;                 // 0xa88
    int xa8c;                 // 0xa8c
    int xa90;                 // 0xa90
    int xa94;                 // 0xa94
    int xa98;                 // 0xa98
    int xa9c;                 // 0xa9c
    int xaa0;                 // 0xaa0
    int xaa4;                 // 0xaa4
    int xaa8;                 // 0xaa8
    int xaac;                 // 0xaac
    int xab0;                 // 0xab0
    int xab4;                 // 0xab4
    int xab8;                 // 0xab8
    int xabc;                 // 0xabc
    int xac0;                 // 0xac0
    int xac4;                 // 0xac4
    int xac8;                 // 0xac8
    int xacc;                 // 0xacc
    int xad0;                 // 0xad0
    int xad4;                 // 0xad4
    int xad8;                 // 0xad8
    int xadc;                 // 0xadc
    int xae0;                 // 0xae0
    int xae4;                 // 0xae4
    int xae8;                 // 0xae8
    int xaec;                 // 0xaec
    int xaf0;                 // 0xaf0
    int xaf4;                 // 0xaf4
    int xaf8;                 // 0xaf8
    int xafc;                 // 0xafc
    int xb00;                 // 0xb00
    int xb04;                 // 0xb04
    int xb08;                 // 0xb08
    int xb0c;                 // 0xb0c
    int xb10;                 // 0xb10
    int xb14;                 // 0xb14
    int xb18;                 // 0xb18
    int xb1c;                 // 0xb1c
    int xb20;                 // 0xb20
    int xb24;                 // 0xb24
    int xb28;                 // 0xb28
    int xb2c;                 // 0xb2c
    int xb30;                 // 0xb30
    int xb34;                 // 0xb34
    int xb38;                 // 0xb38
    int xb3c;                 // 0xb3c
    int xb40;                 // 0xb40
    int xb44;                 // 0xb44
    int xb48;                 // 0xb48
    int xb4c;                 // 0xb4c
    int xb50;                 // 0xb50
    int xb54;                 // 0xb54
    int xb58;                 // 0xb58
    int xb5c;                 // 0xb5c
    int xb60;                 // 0xb60
    int xb64;                 // 0xb64
    int xb68;                 // 0xb68
    int xb6c;                 // 0xb6c
    int xb70;                 // 0xb70
    int xb74;                 // 0xb74
    int xb78;                 // 0xb78
    int xb7c;                 // 0xb7c
    int xb80;                 // 0xb80
    int xb84;                 // 0xb84
    int xb88;                 // 0xb88
    int xb8c;                 // 0xb8c
    int xb90;                 // 0xb90
    int xb94;                 // 0xb94
    int xb98;                 // 0xb98
    int xb9c;                 // 0xb9c
    int xba0;                 // 0xba0
    int xba4;                 // 0xba4
    int xba8;                 // 0xba8
    int xbac;                 // 0xbac
    int xbb0;                 // 0xbb0
    int xbb4;                 // 0xbb4
    int xbb8;                 // 0xbb8
    int xbbc;                 // 0xbbc
    int xbc0;                 // 0xbc0
    int xbc4;                 // 0xbc4
    int xbc8;                 // 0xbc8
    int xbcc;                 // 0xbcc
    int xbd0;                 // 0xbd0
    int xbd4;                 // 0xbd4
    int xbd8;                 // 0xbd8
    int xbdc;                 // 0xbdc
    int xbe0;                 // 0xbe0
    int xbe4;                 // 0xbe4
    int xbe8;                 // 0xbe8
    int xbec;                 // 0xbec
    int xbf0;                 // 0xbf0
    int xbf4;                 // 0xbf4
    int xbf8;                 // 0xbf8
    int xbfc;                 // 0xbfc
    int xc00;                 // 0xc00
    int xc04;                 // 0xc04
    int xc08;                 // 0xc08
    int xc0c;                 // 0xc0c
    int xc10;                 // 0xc10
    int xc14;                 // 0xc14
    int xc18;                 // 0xc18
    int xc1c;                 // 0xc1c
    int xc20;                 // 0xc20
    int xc24;                 // 0xc24
    int xc28;                 // 0xc28
    int xc2c;                 // 0xc2c
    int xc30;                 // 0xc30
    int xc34;                 // 0xc34
    int xc38;                 // 0xc38
    int xc3c;                 // 0xc3c
    int xc40;                 // 0xc40
    int xc44;                 // 0xc44
    int xc48;                 // 0xc48
    int xc4c;                 // 0xc4c
    int xc50;                 // 0xc50
    int xc54;                 // 0xc54
    int xc58;                 // 0xc58
    int xc5c;                 // 0xc5c
    int xc60;                 // 0xc60
    int xc64;                 // 0xc64
    int xc68;                 // 0xc68
    int xc6c;                 // 0xc6c
    int xc70;                 // 0xc70
    int xc74;                 // 0xc74
    int xc78;                 // 0xc78
    int xc7c;                 // 0xc7c
    int xc80;                 // 0xc80
    int xc84;                 // 0xc84
    int xc88;                 // 0xc88
    int xc8c;                 // 0xc8c
    int xc90;                 // 0xc90
    int xc94;                 // 0xc94
    int xc98;                 // 0xc98
    int xc9c;                 // 0xc9c
    int xca0;                 // 0xca0
    int xca4;                 // 0xca4
    int xca8;                 // 0xca8
    int xcac;                 // 0xcac
    int xcb0;                 // 0xcb0
    int xcb4;                 // 0xcb4
    int xcb8;                 // 0xcb8
    int xcbc;                 // 0xcbc
    int xcc0;                 // 0xcc0
    int xcc4;                 // 0xcc4
    int xcc8;                 // 0xcc8
    int xccc;                 // 0xccc
    int xcd0;                 // 0xcd0
    int xcd4;                 // 0xcd4
    int xcd8;                 // 0xcd8
    int xcdc;                 // 0xcdc
    int xce0;                 // 0xce0
    int xce4;                 // 0xce4
    int xce8;                 // 0xce8
    int xcec;                 // 0xcec
    int xcf0;                 // 0xcf0
    int xcf4;                 // 0xcf4
    int xcf8;                 // 0xcf8
    int xcfc;                 // 0xcfc
    int xd00;                 // 0xd00
    int xd04;                 // 0xd04
    int xd08;                 // 0xd08
    int xd0c;                 // 0xd0c
    int xd10;                 // 0xd10
    int xd14;                 // 0xd14
    int xd18;                 // 0xd18
    int xd1c;                 // 0xd1c
    int xd20;                 // 0xd20
    int xd24;                 // 0xd24
    int xd28;                 // 0xd28
    int xd2c;                 // 0xd2c
    int xd30;                 // 0xd30
    int xd34;                 // 0xd34
    int xd38;                 // 0xd38
    int xd3c;                 // 0xd3c
    int xd40;                 // 0xd40
    int xd44;                 // 0xd44
    int xd48;                 // 0xd48
    int xd4c;                 // 0xd4c
    int xd50;                 // 0xd50
    int xd54;                 // 0xd54
    int xd58;                 // 0xd58
    int xd5c;                 // 0xd5c
    int xd60;                 // 0xd60
    int xd64;                 // 0xd64
    int xd68;                 // 0xd68
    int xd6c;                 // 0xd6c
    int xd70;                 // 0xd70
    int xd74;                 // 0xd74
    int xd78;                 // 0xd78
    int xd7c;                 // 0xd7c
    int xd80;                 // 0xd80
    int xd84;                 // 0xd84
    int xd88;                 // 0xd88
    int xd8c;                 // 0xd8c
    int xd90;                 // 0xd90
    int xd94;                 // 0xd94
    int xd98;                 // 0xd98
    int xd9c;                 // 0xd9c
    int xda0;                 // 0xda0
    int xda4;                 // 0xda4
    int xda8;                 // 0xda8
    int xdac;                 // 0xdac
    int xdb0;                 // 0xdb0
    int xdb4;                 // 0xdb4
    int xdb8;                 // 0xdb8
    int xdbc;                 // 0xdbc
    int xdc0;                 // 0xdc0
    int xdc4;                 // 0xdc4
    int xdc8;                 // 0xdc8
    int xdcc;                 // 0xdcc
    int xdd0;                 // 0xdd0
    int xdd4;                 // 0xdd4
    int xdd8;                 // 0xdd8
    int xddc;                 // 0xddc
    int xde0;                 // 0xde0
    int xde4;                 // 0xde4
    int xde8;                 // 0xde8
    int xdec;                 // 0xdec
    int xdf0;                 // 0xdf0
    int xdf4;                 // 0xdf4
    int xdf8;                 // 0xdf8
    int xdfc;                 // 0xdfc
    int xe00;                 // 0xe00
    int xe04;                 // 0xe04
    int xe08;                 // 0xe08
    int xe0c;                 // 0xe0c
    int xe10;                 // 0xe10
    int xe14;                 // 0xe14
    int xe18;                 // 0xe18
    int xe1c;                 // 0xe1c
    int xe20;                 // 0xe20
    int xe24;                 // 0xe24
    int xe28;                 // 0xe28
    int xe2c;                 // 0xe2c
    int xe30;                 // 0xe30
    int xe34;                 // 0xe34
    int xe38;                 // 0xe38
    int xe3c;                 // 0xe3c
    int xe40;                 // 0xe40
    int xe44;                 // 0xe44
    int xe48;                 // 0xe48
    int xe4c;                 // 0xe4c
    int xe50;                 // 0xe50
    int xe54;                 // 0xe54
    int xe58;                 // 0xe58
    int xe5c;                 // 0xe5c
    int xe60;                 // 0xe60
    int xe64;                 // 0xe64
    int xe68;                 // 0xe68
    int xe6c;                 // 0xe6c
    int xe70;                 // 0xe70
    int xe74;                 // 0xe74
    int xe78;                 // 0xe78
    int xe7c;                 // 0xe7c
    int xe80;                 // 0xe80
    int xe84;                 // 0xe84
    int xe88;                 // 0xe88
    int xe8c;                 // 0xe8c
    int xe90;                 // 0xe90
    int xe94;                 // 0xe94
    int xe98;                 // 0xe98
    int xe9c;                 // 0xe9c
    int xea0;                 // 0xea0
    int xea4;                 // 0xea4
    int xea8;                 // 0xea8
    int xeac;                 // 0xeac
    int xeb0;                 // 0xeb0
    int xeb4;                 // 0xeb4
    int xeb8;                 // 0xeb8
    int xebc;                 // 0xebc
    int xec0;                 // 0xec0
    int xec4;                 // 0xec4
    int xec8;                 // 0xec8
    int xecc;                 // 0xecc
    int xed0;                 // 0xed0
    int xed4;                 // 0xed4
    int xed8;                 // 0xed8
    int xedc;                 // 0xedc
    int xee0;                 // 0xee0
    int xee4;                 // 0xee4
    int xee8;                 // 0xee8
    int xeec;                 // 0xeec
    int xef0;                 // 0xef0
    int xef4;                 // 0xef4
    int xef8;                 // 0xef8
    int xefc;                 // 0xefc
    int xf00;                 // 0xf00
    int xf04;                 // 0xf04
    int xf08;                 // 0xf08
    int xf0c;                 // 0xf0c
    int xf10;                 // 0xf10
    int xf14;                 // 0xf14
    int xf18;                 // 0xf18
    int xf1c;                 // 0xf1c
    int xf20;                 // 0xf20
    int xf24;                 // 0xf24
    int xf28;                 // 0xf28
    int xf2c;                 // 0xf2c
    int xf30;                 // 0xf30
    int xf34;                 // 0xf34
    int xf38;                 // 0xf38
    int xf3c;                 // 0xf3c
    int xf40;                 // 0xf40
    int xf44;                 // 0xf44
    int xf48;                 // 0xf48
    int xf4c;                 // 0xf4c
    int xf50;                 // 0xf50
    int xf54;                 // 0xf54
    int xf58;                 // 0xf58
    int xf5c;                 // 0xf5c
    int xf60;                 // 0xf60
    int xf64;                 // 0xf64
    int xf68;                 // 0xf68
    int xf6c;                 // 0xf6c
    int xf70;                 // 0xf70
    int xf74;                 // 0xf74
    int xf78;                 // 0xf78
    int xf7c;                 // 0xf7c
    int xf80;                 // 0xf80
    int xf84;                 // 0xf84
    int xf88;                 // 0xf88
    int xf8c;                 // 0xf8c
    int xf90;                 // 0xf90
    int xf94;                 // 0xf94
    int xf98;                 // 0xf98
    int xf9c;                 // 0xf9c
    int xfa0;                 // 0xfa0
    int xfa4;                 // 0xfa4
    int xfa8;                 // 0xfa8
    int xfac;                 // 0xfac
    int xfb0;                 // 0xfb0
    int xfb4;                 // 0xfb4
    int xfb8;                 // 0xfb8
    int xfbc;                 // 0xfbc
    int xfc0;                 // 0xfc0
    int xfc4;                 // 0xfc4
    int xfc8;                 // 0xfc8
    int xfcc;                 // 0xfcc
    int xfd0;                 // 0xfd0
    int xfd4;                 // 0xfd4
    int xfd8;                 // 0xfd8
    int xfdc;                 // 0xfdc
    int xfe0;                 // 0xfe0
    int xfe4;                 // 0xfe4
    int xfe8;                 // 0xfe8
    int xfec;                 // 0xfec
    int xff0;                 // 0xff0
    int xff4;                 // 0xff4
    int xff8;                 // 0xff8
    int xffc;                 // 0xffc
    int x1000;                // 0x1000
    int x1004;                // 0x1004
    int x1008;                // 0x1008
    int x100c;                // 0x100c
    int x1010;                // 0x1010
    int x1014;                // 0x1014
    int x1018;                // 0x1018
    int x101c;                // 0x101c
    int x1020;                // 0x1020
    int x1024;                // 0x1024
    int x1028;                // 0x1028
    int x102c;                // 0x102c
    int x1030;                // 0x1030
    int x1034;                // 0x1034
    int x1038;                // 0x1038
    int x103c;                // 0x103c
    int x1040;                // 0x1040
    int x1044;                // 0x1044
    int x1048;                // 0x1048
    int x104c;                // 0x104c
    int x1050;                // 0x1050
    int x1054;                // 0x1054
    int x1058;                // 0x1058
    int x105c;                // 0x105c
    int x1060;                // 0x1060
    int x1064;                // 0x1064
    int x1068;                // 0x1068
    int x106c;                // 0x106c
    int x1070;                // 0x1070
    int x1074;                // 0x1074
    int x1078;                // 0x1078
    int x107c;                // 0x107c
    int x1080;                // 0x1080
    int x1084;                // 0x1084
    int x1088;                // 0x1088
    int x108c;                // 0x108c
    int x1090;                // 0x1090
    int x1094;                // 0x1094
    int x1098;                // 0x1098
    int x109c;                // 0x109c
    int x10a0;                // 0x10a0
    int x10a4;                // 0x10a4
    int x10a8;                // 0x10a8
    int x10ac;                // 0x10ac
    int x10b0;                // 0x10b0
    int x10b4;                // 0x10b4
    int x10b8;                // 0x10b8
    int x10bc;                // 0x10bc
    int x10c0;                // 0x10c0
    int x10c4;                // 0x10c4
    int x10c8;                // 0x10c8
    int x10cc;                // 0x10cc
    int x10d0;                // 0x10d0
    int x10d4;                // 0x10d4
    int x10d8;                // 0x10d8
    int x10dc;                // 0x10dc
    int x10e0;                // 0x10e0
    int x10e4;                // 0x10e4
    int x10e8;                // 0x10e8
    int x10ec;                // 0x10ec
    int x10f0;                // 0x10f0
    int x10f4;                // 0x10f4
    int x10f8;                // 0x10f8
    int x10fc;                // 0x10fc
    int x1100;                // 0x1100
    int x1104;                // 0x1104
    int x1108;                // 0x1108
    int x110c;                // 0x110c
    int x1110;                // 0x1110
    int x1114;                // 0x1114
    int x1118;                // 0x1118
    int x111c;                // 0x111c
    int x1120;                // 0x1120
    int x1124;                // 0x1124
    int x1128;                // 0x1128
    int x112c;                // 0x112c
    int x1130;                // 0x1130
    int x1134;                // 0x1134
    int x1138;                // 0x1138
    int x113c;                // 0x113c
    int x1140;                // 0x1140
    int x1144;                // 0x1144
    int x1148;                // 0x1148
    int x114c;                // 0x114c
    int x1150;                // 0x1150
    int x1154;                // 0x1154
    int x1158;                // 0x1158
    int x115c;                // 0x115c
    int x1160;                // 0x1160
    int x1164;                // 0x1164
    int x1168;                // 0x1168
    int x116c;                // 0x116c
    int x1170;                // 0x1170
    int x1174;                // 0x1174
    int x1178;                // 0x1178
    int x117c;                // 0x117c
    int x1180;                // 0x1180
    int x1184;                // 0x1184
    int x1188;                // 0x1188
    int x118c;                // 0x118c
    int x1190;                // 0x1190
    int x1194;                // 0x1194
    int x1198;                // 0x1198
    int x119c;                // 0x119c
    int x11a0;                // 0x11a0
    int x11a4;                // 0x11a4
    int x11a8;                // 0x11a8
    int x11ac;                // 0x11ac
    int x11b0;                // 0x11b0
    int x11b4;                // 0x11b4
    int x11b8;                // 0x11b8
    int x11bc;                // 0x11bc
    int x11c0;                // 0x11c0
    int x11c4;                // 0x11c4
    int x11c8;                // 0x11c8
    int x11cc;                // 0x11cc
    int x11d0;                // 0x11d0
    int x11d4;                // 0x11d4
    int x11d8;                // 0x11d8
    int x11dc;                // 0x11dc
    int x11e0;                // 0x11e0
    int x11e4;                // 0x11e4
    int x11e8;                // 0x11e8
    int x11ec;                // 0x11ec
    int x11f0;                // 0x11f0
    int x11f4;                // 0x11f4
    int x11f8;                // 0x11f8
    int x11fc;                // 0x11fc
    int x1200;                // 0x1200
    int x1204;                // 0x1204
    int x1208;                // 0x1208
    int x120c;                // 0x120c
    int x1210;                // 0x1210
    int x1214;                // 0x1214
    int x1218;                // 0x1218
    int x121c;                // 0x121c
    int x1220;                // 0x1220
    int x1224;                // 0x1224
    int x1228;                // 0x1228
    int x122c;                // 0x122c
    int x1230;                // 0x1230
    int x1234;                // 0x1234
    int x1238;                // 0x1238
    int x123c;                // 0x123c
    int x1240;                // 0x1240
    int x1244;                // 0x1244
    int x1248;                // 0x1248
    int x124c;                // 0x124c
    int x1250;                // 0x1250
    int x1254;                // 0x1254
    int x1258;                // 0x1258
    int x125c;                // 0x125c
    int x1260;                // 0x1260
    int x1264;                // 0x1264
    int x1268;                // 0x1268
    int x126c;                // 0x126c
    int x1270;                // 0x1270
    int x1274;                // 0x1274
    int x1278;                // 0x1278
    int x127c;                // 0x127c
    int x1280;                // 0x1280
    int x1284;                // 0x1284
    int x1288;                // 0x1288
    int x128c;                // 0x128c
    int x1290;                // 0x1290
    int x1294;                // 0x1294
    int x1298;                // 0x1298
    int x129c;                // 0x129c
    int x12a0;                // 0x12a0
    int x12a4;                // 0x12a4
    int x12a8;                // 0x12a8
    int x12ac;                // 0x12ac
    int x12b0;                // 0x12b0
    int x12b4;                // 0x12b4
    int x12b8;                // 0x12b8
    int x12bc;                // 0x12bc
    int x12c0;                // 0x12c0
    int x12c4;                // 0x12c4
    int x12c8;                // 0x12c8
    int x12cc;                // 0x12cc
    int x12d0;                // 0x12d0
    int x12d4;                // 0x12d4
    int x12d8;                // 0x12d8
    int x12dc;                // 0x12dc
    int x12e0;                // 0x12e0
    int x12e4;                // 0x12e4
    int x12e8;                // 0x12e8
    int x12ec;                // 0x12ec
    int x12f0;                // 0x12f0
    int x12f4;                // 0x12f4
    int x12f8;                // 0x12f8
    int x12fc;                // 0x12fc
    int x1300;                // 0x1300
    int x1304;                // 0x1304
    int x1308;                // 0x1308
    int x130c;                // 0x130c
    int x1310;                // 0x1310
    int x1314;                // 0x1314
    int x1318;                // 0x1318
    int x131c;                // 0x131c
    int x1320;                // 0x1320
    int x1324;                // 0x1324
    int x1328;                // 0x1328
    int x132c;                // 0x132c
    int x1330;                // 0x1330
    int x1334;                // 0x1334
    int x1338;                // 0x1338
    int x133c;                // 0x133c
    int x1340;                // 0x1340
    int x1344;                // 0x1344
    int x1348;                // 0x1348
    int x134c;                // 0x134c
    int x1350;                // 0x1350
    int x1354;                // 0x1354
    int x1358;                // 0x1358
    int x135c;                // 0x135c
    int x1360;                // 0x1360
    int x1364;                // 0x1364
    int x1368;                // 0x1368
    int x136c;                // 0x136c
    int x1370;                // 0x1370
    int x1374;                // 0x1374
    int x1378;                // 0x1378
    int x137c;                // 0x137c
    int x1380;                // 0x1380
    int x1384;                // 0x1384
    int x1388;                // 0x1388
    int x138c;                // 0x138c
    int x1390;                // 0x1390
    int x1394;                // 0x1394
    int x1398;                // 0x1398
    int x139c;                // 0x139c
    int x13a0;                // 0x13a0
    int x13a4;                // 0x13a4
    int x13a8;                // 0x13a8
    int x13ac;                // 0x13ac
    int x13b0;                // 0x13b0
    int x13b4;                // 0x13b4
    int x13b8;                // 0x13b8
    int x13bc;                // 0x13bc
    int x13c0;                // 0x13c0
    int x13c4;                // 0x13c4
    int x13c8;                // 0x13c8
    int x13cc;                // 0x13cc
    int x13d0;                // 0x13d0
    int x13d4;                // 0x13d4
    int x13d8;                // 0x13d8
    int x13dc;                // 0x13dc
    int x13e0;                // 0x13e0
    int x13e4;                // 0x13e4
    int x13e8;                // 0x13e8
    int x13ec;                // 0x13ec
    int x13f0;                // 0x13f0
    int x13f4;                // 0x13f4
    int x13f8;                // 0x13f8
    int x13fc;                // 0x13fc
    int x1400;                // 0x1400
    int x1404;                // 0x1404
    int x1408;                // 0x1408
    int x140c;                // 0x140c
    int x1410;                // 0x1410
    int x1414;                // 0x1414
    int x1418;                // 0x1418
    int x141c;                // 0x141c
    int x1420;                // 0x1420
    int x1424;                // 0x1424
    int x1428;                // 0x1428
    int x142c;                // 0x142c
    int x1430;                // 0x1430
    int x1434;                // 0x1434
    int x1438;                // 0x1438
    int x143c;                // 0x143c
    int x1440;                // 0x1440
    int x1444;                // 0x1444
    int x1448;                // 0x1448
    int x144c;                // 0x144c
    int x1450;                // 0x1450
    int x1454;                // 0x1454
    int x1458;                // 0x1458
    int x145c;                // 0x145c
    int x1460;                // 0x1460
    int x1464;                // 0x1464
    int x1468;                // 0x1468
    int x146c;                // 0x146c
    int x1470;                // 0x1470
    int x1474;                // 0x1474
    int x1478;                // 0x1478
    int x147c;                // 0x147c
    int x1480;                // 0x1480
    int x1484;                // 0x1484
    int x1488;                // 0x1488
    int x148c;                // 0x148c
    int x1490;                // 0x1490
    int x1494;                // 0x1494
    int x1498;                // 0x1498
    int x149c;                // 0x149c
    int x14a0;                // 0x14a0
    int x14a4;                // 0x14a4
    int x14a8;                // 0x14a8
    int x14ac;                // 0x14ac
    int x14b0;                // 0x14b0
    int x14b4;                // 0x14b4
    int x14b8;                // 0x14b8
    int x14bc;                // 0x14bc
    int x14c0;                // 0x14c0
    int x14c4;                // 0x14c4
    int x14c8;                // 0x14c8
    int x14cc;                // 0x14cc
    int x14d0;                // 0x14d0
    int x14d4;                // 0x14d4
    int x14d8;                // 0x14d8
    int x14dc;                // 0x14dc
    int x14e0;                // 0x14e0
    int x14e4;                // 0x14e4
    int x14e8;                // 0x14e8
    int x14ec;                // 0x14ec
    int x14f0;                // 0x14f0
    int x14f4;                // 0x14f4
    int x14f8;                // 0x14f8
    int x14fc;                // 0x14fc
    int x1500;                // 0x1500
    int x1504;                // 0x1504
    int x1508;                // 0x1508
    int x150c;                // 0x150c
    int x1510;                // 0x1510
    int x1514;                // 0x1514
    int x1518;                // 0x1518
    int x151c;                // 0x151c
    int x1520;                // 0x1520
    int x1524;                // 0x1524
    int x1528;                // 0x1528
    int x152c;                // 0x152c
    int x1530;                // 0x1530
    int x1534;                // 0x1534
    int x1538;                // 0x1538
    int x153c;                // 0x153c
    int x1540;                // 0x1540
    int x1544;                // 0x1544
    int x1548;                // 0x1548
    int x154c;                // 0x154c
    int x1550;                // 0x1550
    int x1554;                // 0x1554
    int x1558;                // 0x1558
    int x155c;                // 0x155c
    int x1560;                // 0x1560
    int x1564;                // 0x1564
    int x1568;                // 0x1568
    int x156c;                // 0x156c
    int x1570;                // 0x1570
    int x1574;                // 0x1574
    int x1578;                // 0x1578
    int x157c;                // 0x157c
    int x1580;                // 0x1580
    int x1584;                // 0x1584
    int x1588;                // 0x1588
    int x158c;                // 0x158c
    int x1590;                // 0x1590
    int x1594;                // 0x1594
    int x1598;                // 0x1598
    int x159c;                // 0x159c
    int x15a0;                // 0x15a0
    int x15a4;                // 0x15a4
    int x15a8;                // 0x15a8
    int x15ac;                // 0x15ac
    int x15b0;                // 0x15b0
    int x15b4;                // 0x15b4
    int x15b8;                // 0x15b8
    int x15bc;                // 0x15bc
    int x15c0;                // 0x15c0
    int x15c4;                // 0x15c4
    int x15c8;                // 0x15c8
    int x15cc;                // 0x15cc
    int x15d0;                // 0x15d0
    int x15d4;                // 0x15d4
    int x15d8;                // 0x15d8
    int x15dc;                // 0x15dc
    int x15e0;                // 0x15e0
    int x15e4;                // 0x15e4
    int x15e8;                // 0x15e8
    int x15ec;                // 0x15ec
    int x15f0;                // 0x15f0
    int x15f4;                // 0x15f4
    int x15f8;                // 0x15f8
    int x15fc;                // 0x15fc
    int x1600;                // 0x1600
    int x1604;                // 0x1604
    int x1608;                // 0x1608
    int x160c;                // 0x160c
    int x1610;                // 0x1610
    int x1614;                // 0x1614
    int x1618;                // 0x1618
    int x161c;                // 0x161c
    int x1620;                // 0x1620
    int x1624;                // 0x1624
    int x1628;                // 0x1628
    int x162c;                // 0x162c
    int x1630;                // 0x1630
    int x1634;                // 0x1634
    int x1638;                // 0x1638
    int x163c;                // 0x163c
    int x1640;                // 0x1640
    int x1644;                // 0x1644
    int x1648;                // 0x1648
    int x164c;                // 0x164c
    int x1650;                // 0x1650
    int x1654;                // 0x1654
    int x1658;                // 0x1658
    int x165c;                // 0x165c
    int x1660;                // 0x1660
    int x1664;                // 0x1664
    int x1668;                // 0x1668
    int x166c;                // 0x166c
    int x1670;                // 0x1670
    int x1674;                // 0x1674
    int x1678;                // 0x1678
    int x167c;                // 0x167c
    int x1680;                // 0x1680
    int x1684;                // 0x1684
    int x1688;                // 0x1688
    int x168c;                // 0x168c
    int x1690;                // 0x1690
    int x1694;                // 0x1694
    int x1698;                // 0x1698
    int x169c;                // 0x169c
    int x16a0;                // 0x16a0
    int x16a4;                // 0x16a4
    int x16a8;                // 0x16a8
    int x16ac;                // 0x16ac
    int x16b0;                // 0x16b0
    int x16b4;                // 0x16b4
    int x16b8;                // 0x16b8
    int x16bc;                // 0x16bc
    int x16c0;                // 0x16c0
    int x16c4;                // 0x16c4
    int x16c8;                // 0x16c8
    int x16cc;                // 0x16cc
    int x16d0;                // 0x16d0
    int x16d4;                // 0x16d4
    int x16d8;                // 0x16d8
    int x16dc;                // 0x16dc
    int x16e0;                // 0x16e0
    int x16e4;                // 0x16e4
    int x16e8;                // 0x16e8
    int x16ec;                // 0x16ec
    int x16f0;                // 0x16f0
    int x16f4;                // 0x16f4
    int x16f8;                // 0x16f8
    int x16fc;                // 0x16fc
    int x1700;                // 0x1700
    int x1704;                // 0x1704
    int x1708;                // 0x1708
    int x170c;                // 0x170c
    int x1710;                // 0x1710
    int x1714;                // 0x1714
    int x1718;                // 0x1718
    int x171c;                // 0x171c
    int x1720;                // 0x1720
    int x1724;                // 0x1724
    int x1728;                // 0x1728
    int x172c;                // 0x172c
    int x1730;                // 0x1730
    int x1734;                // 0x1734
    int x1738;                // 0x1738
    int x173c;                // 0x173c
    int x1740;                // 0x1740
    int x1744;                // 0x1744
    int x1748;                // 0x1748
    int x174c;                // 0x174c
    int x1750;                // 0x1750
    int x1754;                // 0x1754
    int x1758;                // 0x1758
    int x175c;                // 0x175c
    int x1760;                // 0x1760
    int x1764;                // 0x1764
    int x1768;                // 0x1768
    int x176c;                // 0x176c
    int x1770;                // 0x1770
    int x1774;                // 0x1774
    int x1778;                // 0x1778
    int x177c;                // 0x177c
    int x1780;                // 0x1780
    int x1784;                // 0x1784
    int x1788;                // 0x1788
    int x178c;                // 0x178c
    int x1790;                // 0x1790
    int x1794;                // 0x1794
    int x1798;                // 0x1798
    int x179c;                // 0x179c
    int x17a0;                // 0x17a0
    int x17a4;                // 0x17a4
    int x17a8;                // 0x17a8
    int x17ac;                // 0x17ac
    int x17b0;                // 0x17b0
    int x17b4;                // 0x17b4
    int x17b8;                // 0x17b8
    int x17bc;                // 0x17bc
    int x17c0;                // 0x17c0
    int x17c4;                // 0x17c4
    int x17c8;                // 0x17c8
    int x17cc;                // 0x17cc
    int x17d0;                // 0x17d0
    int x17d4;                // 0x17d4
    int x17d8;                // 0x17d8
    int x17dc;                // 0x17dc
    int x17e0;                // 0x17e0
    int x17e4;                // 0x17e4
    int x17e8;                // 0x17e8
    int x17ec;                // 0x17ec
    int x17f0;                // 0x17f0
    int x17f4;                // 0x17f4
    int x17f8;                // 0x17f8
    int x17fc;                // 0x17fc
    int x1800;                // 0x1800
    int x1804;                // 0x1804
    int x1808;                // 0x1808
    int x180c;                // 0x180c
    int x1810;                // 0x1810
    int x1814;                // 0x1814
    int x1818;                // 0x1818
    int x181c;                // 0x181c
    int x1820;                // 0x1820
    int x1824;                // 0x1824
    int x1828;                // 0x1828
    int x182c;                // 0x182c
    int x1830;                // 0x1830
    int x1834;                // 0x1834
    int x1838;                // 0x1838
    int x183c;                // 0x183c
    int x1840;                // 0x1840
    int x1844;                // 0x1844
    int x1848;                // 0x1848
    int x184c;                // 0x184c
    int x1850;                // 0x1850
    int x1854;                // 0x1854
    int x1858;                // 0x1858
    int x185c;                // 0x185c
    int x1860;                // 0x1860
    int x1864;                // 0x1864
    int x1868;                // 0x1868
    int x186c;                // 0x186c
    int x1870;                // 0x1870
    int x1874;                // 0x1874
    int x1878;                // 0x1878
    int x187c;                // 0x187c
    int x1880;                // 0x1880
    int x1884;                // 0x1884
    int x1888;                // 0x1888
    int x188c;                // 0x188c
    int x1890;                // 0x1890
    int x1894;                // 0x1894
    int x1898;                // 0x1898
    int x189c;                // 0x189c
    int x18a0;                // 0x18a0
    int x18a4;                // 0x18a4
    int x18a8;                // 0x18a8
    int x18ac;                // 0x18ac
    int x18b0;                // 0x18b0
    int x18b4;                // 0x18b4
    int x18b8;                // 0x18b8
    int x18bc;                // 0x18bc
    int x18c0;                // 0x18c0
    int x18c4;                // 0x18c4
    int x18c8;                // 0x18c8
    int x18cc;                // 0x18cc
    int x18d0;                // 0x18d0
    int x18d4;                // 0x18d4
    int x18d8;                // 0x18d8
    int x18dc;                // 0x18dc
    int x18e0;                // 0x18e0
    int x18e4;                // 0x18e4
    int x18e8;                // 0x18e8
    int x18ec;                // 0x18ec
    int x18f0;                // 0x18f0
    int x18f4;                // 0x18f4
    int x18f8;                // 0x18f8
    int x18fc;                // 0x18fc
    int x1900;                // 0x1900
    int x1904;                // 0x1904
    int x1908;                // 0x1908
    int x190c;                // 0x190c
    int x1910;                // 0x1910
    int x1914;                // 0x1914
    int x1918;                // 0x1918
    int x191c;                // 0x191c
    int x1920;                // 0x1920
    int x1924;                // 0x1924
    int x1928;                // 0x1928
    int x192c;                // 0x192c
    int x1930;                // 0x1930
    int x1934;                // 0x1934
    int x1938;                // 0x1938
    int x193c;                // 0x193c
    int x1940;                // 0x1940
    int x1944;                // 0x1944
    int x1948;                // 0x1948
    int x194c;                // 0x194c
    int x1950;                // 0x1950
    int x1954;                // 0x1954
    int x1958;                // 0x1958
    int x195c;                // 0x195c
    int x1960;                // 0x1960
    int x1964;                // 0x1964
    int x1968;                // 0x1968
    int x196c;                // 0x196c
    int x1970;                // 0x1970
    int x1974;                // 0x1974
    int x1978;                // 0x1978
    int x197c;                // 0x197c
    int x1980;                // 0x1980
    int x1984;                // 0x1984
    int x1988;                // 0x1988
    int x198c;                // 0x198c
    int x1990;                // 0x1990
    int x1994;                // 0x1994
    int x1998;                // 0x1998
    int x199c;                // 0x199c
    int x19a0;                // 0x19a0
    int x19a4;                // 0x19a4
    int x19a8;                // 0x19a8
    int x19ac;                // 0x19ac
    int x19b0;                // 0x19b0
    int x19b4;                // 0x19b4
    int x19b8;                // 0x19b8
    int x19bc;                // 0x19bc
    int x19c0;                // 0x19c0
    int x19c4;                // 0x19c4
    int x19c8;                // 0x19c8
    int x19cc;                // 0x19cc
    int x19d0;                // 0x19d0
    int x19d4;                // 0x19d4
    int x19d8;                // 0x19d8
    int x19dc;                // 0x19dc
    int x19e0;                // 0x19e0
    int x19e4;                // 0x19e4
    int x19e8;                // 0x19e8
    int x19ec;                // 0x19ec
    int x19f0;                // 0x19f0
    int x19f4;                // 0x19f4
    int x19f8;                // 0x19f8
    int x19fc;                // 0x19fc
    int x1a00;                // 0x1a00
    int x1a04;                // 0x1a04
    int x1a08;                // 0x1a08
    int x1a0c;                // 0x1a0c
    int x1a10;                // 0x1a10
    int x1a14;                // 0x1a14
    int x1a18;                // 0x1a18
    int x1a1c;                // 0x1a1c
    int x1a20;                // 0x1a20
    int x1a24;                // 0x1a24
    int x1a28;                // 0x1a28
    int x1a2c;                // 0x1a2c
    int x1a30;                // 0x1a30
    int x1a34;                // 0x1a34
    int x1a38;                // 0x1a38
    int x1a3c;                // 0x1a3c
    int x1a40;                // 0x1a40
    int x1a44;                // 0x1a44
    int x1a48;                // 0x1a48
    int x1a4c;                // 0x1a4c
    int x1a50;                // 0x1a50
    int x1a54;                // 0x1a54
    int x1a58;                // 0x1a58
    int x1a5c;                // 0x1a5c
    int x1a60;                // 0x1a60
    int x1a64;                // 0x1a64
    int x1a68;                // 0x1a68
    int x1a6c;                // 0x1a6c
    int x1a70;                // 0x1a70
    int x1a74;                // 0x1a74
    int x1a78;                // 0x1a78
    int x1a7c;                // 0x1a7c
    int x1a80;                // 0x1a80
    int x1a84;                // 0x1a84
    int x1a88;                // 0x1a88
    int x1a8c;                // 0x1a8c
    int x1a90;                // 0x1a90
    int x1a94;                // 0x1a94
    int x1a98;                // 0x1a98
    int x1a9c;                // 0x1a9c
    int x1aa0;                // 0x1aa0
    int x1aa4;                // 0x1aa4
    int x1aa8;                // 0x1aa8
    int x1aac;                // 0x1aac
    int x1ab0;                // 0x1ab0
    int x1ab4;                // 0x1ab4
    int x1ab8;                // 0x1ab8
    int x1abc;                // 0x1abc
    int x1ac0;                // 0x1ac0
    int x1ac4;                // 0x1ac4
    int x1ac8;                // 0x1ac8
    int x1acc;                // 0x1acc
    int x1ad0;                // 0x1ad0
    int x1ad4;                // 0x1ad4
    int x1ad8;                // 0x1ad8
    int x1adc;                // 0x1adc
    int x1ae0;                // 0x1ae0
    int x1ae4;                // 0x1ae4
    int x1ae8;                // 0x1ae8
    int x1aec;                // 0x1aec
    int x1af0;                // 0x1af0
    int x1af4;                // 0x1af4
    int x1af8;                // 0x1af8
    int x1afc;                // 0x1afc
    int x1b00;                // 0x1b00
    int x1b04;                // 0x1b04
    int x1b08;                // 0x1b08
    int x1b0c;                // 0x1b0c
    int x1b10;                // 0x1b10
    int x1b14;                // 0x1b14
    int x1b18;                // 0x1b18
    int x1b1c;                // 0x1b1c
    int x1b20;                // 0x1b20
    int x1b24;                // 0x1b24
    int x1b28;                // 0x1b28
    int x1b2c;                // 0x1b2c
    int x1b30;                // 0x1b30
    int x1b34;                // 0x1b34
    int x1b38;                // 0x1b38
    int x1b3c;                // 0x1b3c
    int x1b40;                // 0x1b40
    int x1b44;                // 0x1b44
    int x1b48;                // 0x1b48
    int x1b4c;                // 0x1b4c
    int x1b50;                // 0x1b50
    int x1b54;                // 0x1b54
    int x1b58;                // 0x1b58
    int x1b5c;                // 0x1b5c
    int x1b60;                // 0x1b60
    int x1b64;                // 0x1b64
    int x1b68;                // 0x1b68
    int x1b6c;                // 0x1b6c
    int x1b70;                // 0x1b70
    int x1b74;                // 0x1b74
    int x1b78;                // 0x1b78
    int x1b7c;                // 0x1b7c
    int x1b80;                // 0x1b80
    int x1b84;                // 0x1b84
    int x1b88;                // 0x1b88
    int x1b8c;                // 0x1b8c
    int x1b90;                // 0x1b90
    int x1b94;                // 0x1b94
    int x1b98;                // 0x1b98
    int x1b9c;                // 0x1b9c
    int x1ba0;                // 0x1ba0
    int x1ba4;                // 0x1ba4
    int x1ba8;                // 0x1ba8
    int x1bac;                // 0x1bac
    int x1bb0;                // 0x1bb0
    int x1bb4;                // 0x1bb4
    int x1bb8;                // 0x1bb8
    int x1bbc;                // 0x1bbc
    int x1bc0;                // 0x1bc0
    int x1bc4;                // 0x1bc4
    int x1bc8;                // 0x1bc8
    int x1bcc;                // 0x1bcc
    int x1bd0;                // 0x1bd0
    int x1bd4;                // 0x1bd4
    int x1bd8;                // 0x1bd8
    int x1bdc;                // 0x1bdc
    int x1be0;                // 0x1be0
    int x1be4;                // 0x1be4
    int x1be8;                // 0x1be8
    int x1bec;                // 0x1bec
    int x1bf0;                // 0x1bf0
    int x1bf4;                // 0x1bf4
    int x1bf8;                // 0x1bf8
    int x1bfc;                // 0x1bfc
    int x1c00;                // 0x1c00
    int x1c04;                // 0x1c04
    int x1c08;                // 0x1c08
    int x1c0c;                // 0x1c0c
    int x1c10;                // 0x1c10
    int x1c14;                // 0x1c14
    int x1c18;                // 0x1c18
    int x1c1c;                // 0x1c1c
    int x1c20;                // 0x1c20
    int x1c24;                // 0x1c24
    int x1c28;                // 0x1c28
    int x1c2c;                // 0x1c2c
    int x1c30;                // 0x1c30
    int x1c34;                // 0x1c34
    int x1c38;                // 0x1c38
    int x1c3c;                // 0x1c3c
    int x1c40;                // 0x1c40
    int x1c44;                // 0x1c44
    int x1c48;                // 0x1c48
    int x1c4c;                // 0x1c4c
    int x1c50;                // 0x1c50
    int x1c54;                // 0x1c54
    int x1c58;                // 0x1c58
    int x1c5c;                // 0x1c5c
    int x1c60;                // 0x1c60
    int x1c64;                // 0x1c64
    int x1c68;                // 0x1c68
    int x1c6c;                // 0x1c6c
    int x1c70;                // 0x1c70
    int x1c74;                // 0x1c74
    int x1c78;                // 0x1c78
    int x1c7c;                // 0x1c7c
    int x1c80;                // 0x1c80
    int x1c84;                // 0x1c84
    int x1c88;                // 0x1c88
    int x1c8c;                // 0x1c8c
    int x1c90;                // 0x1c90
    int x1c94;                // 0x1c94
    int x1c98;                // 0x1c98
    int x1c9c;                // 0x1c9c
    int x1ca0;                // 0x1ca0
    int x1ca4;                // 0x1ca4
    int x1ca8;                // 0x1ca8
    int x1cac;                // 0x1cac
    int x1cb0;                // 0x1cb0
    int x1cb4;                // 0x1cb4
    int x1cb8;                // 0x1cb8
    int x1cbc;                // 0x1cbc
    int x1cc0;                // 0x1cc0
    int x1cc4;                // 0x1cc4
    int x1cc8;                // 0x1cc8
    int x1ccc;                // 0x1ccc
    int x1cd0;                // 0x1cd0
    int x1cd4;                // 0x1cd4
    int x1cd8;                // 0x1cd8
    int x1cdc;                // 0x1cdc
    int x1ce0;                // 0x1ce0
    int x1ce4;                // 0x1ce4
    int x1ce8;                // 0x1ce8
    int x1cec;                // 0x1cec
    int x1cf0;                // 0x1cf0
    int x1cf4;                // 0x1cf4
    int x1cf8;                // 0x1cf8
    int x1cfc;                // 0x1cfc
    int x1d00;                // 0x1d00
    int x1d04;                // 0x1d04
    int x1d08;                // 0x1d08
    int x1d0c;                // 0x1d0c
    int x1d10;                // 0x1d10
    int x1d14;                // 0x1d14
    int x1d18;                // 0x1d18
    int x1d1c;                // 0x1d1c
    int x1d20;                // 0x1d20
    int x1d24;                // 0x1d24
    int x1d28;                // 0x1d28
    int x1d2c;                // 0x1d2c
    int x1d30;                // 0x1d30
    int x1d34;                // 0x1d34
    int x1d38;                // 0x1d38
    int x1d3c;                // 0x1d3c
    int x1d40;                // 0x1d40
    int x1d44;                // 0x1d44
    int x1d48;                // 0x1d48
    int x1d4c;                // 0x1d4c
    int x1d50;                // 0x1d50
    int x1d54;                // 0x1d54
    int x1d58;                // 0x1d58
    int x1d5c;                // 0x1d5c
    int x1d60;                // 0x1d60
    int x1d64;                // 0x1d64
    int x1d68;                // 0x1d68
    int x1d6c;                // 0x1d6c
    int x1d70;                // 0x1d70
    int x1d74;                // 0x1d74
    int x1d78;                // 0x1d78
    int x1d7c;                // 0x1d7c
    int x1d80;                // 0x1d80
    int x1d84;                // 0x1d84
    int x1d88;                // 0x1d88
    int x1d8c;                // 0x1d8c
    int x1d90;                // 0x1d90
    int x1d94;                // 0x1d94
    int x1d98;                // 0x1d98
    int x1d9c;                // 0x1d9c
    int x1da0;                // 0x1da0
    int x1da4;                // 0x1da4
    int x1da8;                // 0x1da8
    int x1dac;                // 0x1dac
    int x1db0;                // 0x1db0
    int x1db4;                // 0x1db4
    int x1db8;                // 0x1db8
    int x1dbc;                // 0x1dbc
    int x1dc0;                // 0x1dc0
    int x1dc4;                // 0x1dc4
    int x1dc8;                // 0x1dc8
    int x1dcc;                // 0x1dcc
    int x1dd0;                // 0x1dd0
    int x1dd4;                // 0x1dd4
    int x1dd8;                // 0x1dd8
    int x1ddc;                // 0x1ddc
    int x1de0;                // 0x1de0
    int x1de4;                // 0x1de4
    int x1de8;                // 0x1de8
    int x1dec;                // 0x1dec
    int x1df0;                // 0x1df0
    int x1df4;                // 0x1df4
    int x1df8;                // 0x1df8
    int x1dfc;                // 0x1dfc
    int x1e00;                // 0x1e00
    int x1e04;                // 0x1e04
    int x1e08;                // 0x1e08
    int x1e0c;                // 0x1e0c
    int x1e10;                // 0x1e10
    int x1e14;                // 0x1e14
    int x1e18;                // 0x1e18
    int x1e1c;                // 0x1e1c
    int x1e20;                // 0x1e20
    int x1e24;                // 0x1e24
    int x1e28;                // 0x1e28
    int x1e2c;                // 0x1e2c
    int x1e30;                // 0x1e30
    int x1e34;                // 0x1e34
    int x1e38;                // 0x1e38
    int x1e3c;                // 0x1e3c
    int x1e40;                // 0x1e40
    int x1e44;                // 0x1e44
    int x1e48;                // 0x1e48
    int x1e4c;                // 0x1e4c
    int x1e50;                // 0x1e50
    int x1e54;                // 0x1e54
    int x1e58;                // 0x1e58
    int x1e5c;                // 0x1e5c
    int x1e60;                // 0x1e60
    int x1e64;                // 0x1e64
    int x1e68;                // 0x1e68
    int x1e6c;                // 0x1e6c
    int x1e70;                // 0x1e70
    int x1e74;                // 0x1e74
    int x1e78;                // 0x1e78
    int x1e7c;                // 0x1e7c
    int x1e80;                // 0x1e80
    int x1e84;                // 0x1e84
    int x1e88;                // 0x1e88
    int x1e8c;                // 0x1e8c
    int x1e90;                // 0x1e90
    int x1e94;                // 0x1e94
    int x1e98;                // 0x1e98
    int x1e9c;                // 0x1e9c
    int x1ea0;                // 0x1ea0
    int x1ea4;                // 0x1ea4
    int x1ea8;                // 0x1ea8
    int x1eac;                // 0x1eac
    int x1eb0;                // 0x1eb0
    int x1eb4;                // 0x1eb4
    int x1eb8;                // 0x1eb8
    int x1ebc;                // 0x1ebc
    int x1ec0;                // 0x1ec0
    int x1ec4;                // 0x1ec4
    int x1ec8;                // 0x1ec8
    int x1ecc;                // 0x1ecc
    int x1ed0;                // 0x1ed0
    int x1ed4;                // 0x1ed4
    int x1ed8;                // 0x1ed8
    int x1edc;                // 0x1edc
    int x1ee0;                // 0x1ee0
    int x1ee4;                // 0x1ee4
    int x1ee8;                // 0x1ee8
    int x1eec;                // 0x1eec
    int x1ef0;                // 0x1ef0
    int x1ef4;                // 0x1ef4
    int x1ef8;                // 0x1ef8
    int x1efc;                // 0x1efc
    int x1f00;                // 0x1f00
    int x1f04;                // 0x1f04
    int x1f08;                // 0x1f08
    int x1f0c;                // 0x1f0c
    int x1f10;                // 0x1f10
    int x1f14;                // 0x1f14
    int x1f18;                // 0x1f18
    int x1f1c;                // 0x1f1c
    int x1f20;                // 0x1f20
    int x1f24;                // 0x1f24
    int x1f28;                // 0x1f28
    int x1f2c;                // 0x1f2c
    int x1f30;                // 0x1f30
    int x1f34;                // 0x1f34
    int x1f38;                // 0x1f38
    int x1f3c;                // 0x1f3c
    int x1f40;                // 0x1f40
    int x1f44;                // 0x1f44
    int x1f48;                // 0x1f48
    int x1f4c;                // 0x1f4c
    int x1f50;                // 0x1f50
    int x1f54;                // 0x1f54
    int x1f58;                // 0x1f58
    int x1f5c;                // 0x1f5c
    int x1f60;                // 0x1f60
    int x1f64;                // 0x1f64
    int x1f68;                // 0x1f68
    int x1f6c;                // 0x1f6c
    int x1f70;                // 0x1f70
    int x1f74;                // 0x1f74
    int x1f78;                // 0x1f78
    int x1f7c;                // 0x1f7c
    int x1f80;                // 0x1f80
    int x1f84;                // 0x1f84
    int x1f88;                // 0x1f88
    int x1f8c;                // 0x1f8c
    int x1f90;                // 0x1f90
    int x1f94;                // 0x1f94
    int x1f98;                // 0x1f98
    int x1f9c;                // 0x1f9c
    int x1fa0;                // 0x1fa0
    int x1fa4;                // 0x1fa4
    int x1fa8;                // 0x1fa8
    int x1fac;                // 0x1fac
    int x1fb0;                // 0x1fb0
    int x1fb4;                // 0x1fb4
    int x1fb8;                // 0x1fb8
    int x1fbc;                // 0x1fbc
    int x1fc0;                // 0x1fc0
    int x1fc4;                // 0x1fc4
    int x1fc8;                // 0x1fc8
    int x1fcc;                // 0x1fcc
    int x1fd0;                // 0x1fd0
    int x1fd4;                // 0x1fd4
    int x1fd8;                // 0x1fd8
    int x1fdc;                // 0x1fdc
    int x1fe0;                // 0x1fe0
    int x1fe4;                // 0x1fe4
    int x1fe8;                // 0x1fe8
    int x1fec;                // 0x1fec
    int x1ff0;                // 0x1ff0
    int x1ff4;                // 0x1ff4
    int x1ff8;                // 0x1ff8
    int x1ffc;                // 0x1ffc
    int x2000;                // 0x2000
    int x2004;                // 0x2004
    int x2008;                // 0x2008
    int x200c;                // 0x200c
    int x2010;                // 0x2010
    int x2014;                // 0x2014
    int x2018;                // 0x2018
    int x201c;                // 0x201c
    int x2020;                // 0x2020
    int x2024;                // 0x2024
    int x2028;                // 0x2028
    int x202c;                // 0x202c
    int x2030;                // 0x2030
    int x2034;                // 0x2034
    int x2038;                // 0x2038
    int x203c;                // 0x203c
    int x2040;                // 0x2040
    int x2044;                // 0x2044
    int x2048;                // 0x2048
    int x204c;                // 0x204c
    int x2050;                // 0x2050
    int x2054;                // 0x2054
    int x2058;                // 0x2058
    int x205c;                // 0x205c
    int x2060;                // 0x2060
    int x2064;                // 0x2064
    int x2068;                // 0x2068
    int x206c;                // 0x206c
    int x2070;                // 0x2070
    int x2074;                // 0x2074
    int x2078;                // 0x2078
    int x207c;                // 0x207c
    int x2080;                // 0x2080
    int x2084;                // 0x2084
    int x2088;                // 0x2088
    int x208c;                // 0x208c
    int x2090;                // 0x2090
    int x2094;                // 0x2094
    int x2098;                // 0x2098
    int x209c;                // 0x209c
    int x20a0;                // 0x20a0
    int x20a4;                // 0x20a4
    int x20a8;                // 0x20a8
    int x20ac;                // 0x20ac
    int x20b0;                // 0x20b0
    int x20b4;                // 0x20b4
    int x20b8;                // 0x20b8
    int x20bc;                // 0x20bc
    int x20c0;                // 0x20c0
    int x20c4;                // 0x20c4
    int x20c8;                // 0x20c8
    int x20cc;                // 0x20cc
    int x20d0;                // 0x20d0
    int x20d4;                // 0x20d4
    int x20d8;                // 0x20d8
    int x20dc;                // 0x20dc
    int x20e0;                // 0x20e0
    int x20e4;                // 0x20e4
    int x20e8;                // 0x20e8
    int x20ec;                // 0x20ec
    int x20f0;                // 0x20f0
    int x20f4;                // 0x20f4
    int x20f8;                // 0x20f8
    int x20fc;                // 0x20fc
    int x2100;                // 0x2100
    int x2104;                // 0x2104
    int x2108;                // 0x2108
    int x210c;                // 0x210c
    int x2110;                // 0x2110
    int x2114;                // 0x2114
    int x2118;                // 0x2118
    int x211c;                // 0x211c
    int x2120;                // 0x2120
    int x2124;                // 0x2124
    int x2128;                // 0x2128
    int x212c;                // 0x212c
    int x2130;                // 0x2130
    int x2134;                // 0x2134
    int x2138;                // 0x2138
    int x213c;                // 0x213c
    int x2140;                // 0x2140
    int x2144;                // 0x2144
    int x2148;                // 0x2148
    int x214c;                // 0x214c
    int x2150;                // 0x2150
    int x2154;                // 0x2154
    int x2158;                // 0x2158
    int x215c;                // 0x215c
    int x2160;                // 0x2160
    int x2164;                // 0x2164
    int x2168;                // 0x2168
    int x216c;                // 0x216c
    int x2170;                // 0x2170
    int x2174;                // 0x2174
    int x2178;                // 0x2178
    int x217c;                // 0x217c
    int x2180;                // 0x2180
    int x2184;                // 0x2184
    int x2188;                // 0x2188
    int x218c;                // 0x218c
    int x2190;                // 0x2190
    int x2194;                // 0x2194
    int x2198;                // 0x2198
    int x219c;                // 0x219c
    int x21a0;                // 0x21a0
    int x21a4;                // 0x21a4
    int x21a8;                // 0x21a8
    int x21ac;                // 0x21ac
    int x21b0;                // 0x21b0
    int x21b4;                // 0x21b4
    int x21b8;                // 0x21b8
    int x21bc;                // 0x21bc
    int x21c0;                // 0x21c0
    int x21c4;                // 0x21c4
    int x21c8;                // 0x21c8
    int x21cc;                // 0x21cc
    int x21d0;                // 0x21d0
    int x21d4;                // 0x21d4
    int x21d8;                // 0x21d8
    int x21dc;                // 0x21dc
    int x21e0;                // 0x21e0
    int x21e4;                // 0x21e4
    int x21e8;                // 0x21e8
    int x21ec;                // 0x21ec
    int x21f0;                // 0x21f0
    int x21f4;                // 0x21f4
    int x21f8;                // 0x21f8
    int x21fc;                // 0x21fc
    int x2200;                // 0x2200
    int x2204;                // 0x2204
    int x2208;                // 0x2208
    int x220c;                // 0x220c
    int x2210;                // 0x2210
    int x2214;                // 0x2214
    int x2218;                // 0x2218
    int x221c;                // 0x221c
    int x2220;                // 0x2220
    int x2224;                // 0x2224
    int x2228;                // 0x2228
    int x222c;                // 0x222c
    int x2230;                // 0x2230
    int x2234;                // 0x2234
    int x2238;                // 0x2238
    int x223c;                // 0x223c
    int x2240;                // 0x2240
    int x2244;                // 0x2244
    int x2248;                // 0x2248
    int x224c;                // 0x224c
    int x2250;                // 0x2250
    int x2254;                // 0x2254
    int x2258;                // 0x2258
    int x225c;                // 0x225c
    int x2260;                // 0x2260
    int x2264;                // 0x2264
    int x2268;                // 0x2268
    int x226c;                // 0x226c
    int x2270;                // 0x2270
    int x2274;                // 0x2274
    int x2278;                // 0x2278
    int x227c;                // 0x227c
    int x2280;                // 0x2280
    int x2284;                // 0x2284
    int x2288;                // 0x2288
    int x228c;                // 0x228c
    int x2290;                // 0x2290
    int x2294;                // 0x2294
    int x2298;                // 0x2298
    int x229c;                // 0x229c
    int x22a0;                // 0x22a0
    int x22a4;                // 0x22a4
    int x22a8;                // 0x22a8
    int x22ac;                // 0x22ac
    int x22b0;                // 0x22b0
    int x22b4;                // 0x22b4
    int x22b8;                // 0x22b8
    int x22bc;                // 0x22bc
    int x22c0;                // 0x22c0
    int x22c4;                // 0x22c4
    int x22c8;                // 0x22c8
    int x22cc;                // 0x22cc
    int x22d0;                // 0x22d0
    int x22d4;                // 0x22d4
    int x22d8;                // 0x22d8
    int x22dc;                // 0x22dc
    int x22e0;                // 0x22e0
    int x22e4;                // 0x22e4
    int x22e8;                // 0x22e8
    int x22ec;                // 0x22ec
    int x22f0;                // 0x22f0
    int x22f4;                // 0x22f4
    int x22f8;                // 0x22f8
    int x22fc;                // 0x22fc
    int x2300;                // 0x2300
    int x2304;                // 0x2304
    int x2308;                // 0x2308
    int x230c;                // 0x230c
    int x2310;                // 0x2310
    int x2314;                // 0x2314
    int x2318;                // 0x2318
    int x231c;                // 0x231c
    int x2320;                // 0x2320
    int x2324;                // 0x2324
    int x2328;                // 0x2328
    int x232c;                // 0x232c
    int x2330;                // 0x2330
    int x2334;                // 0x2334
    int x2338;                // 0x2338
    int x233c;                // 0x233c
    int x2340;                // 0x2340
    int x2344;                // 0x2344
    int x2348;                // 0x2348
    int x234c;                // 0x234c
    int x2350;                // 0x2350
    int x2354;                // 0x2354
    int x2358;                // 0x2358
    int x235c;                // 0x235c
    int x2360;                // 0x2360
    int x2364;                // 0x2364
    int x2368;                // 0x2368
    int x236c;                // 0x236c
    int x2370;                // 0x2370
    int x2374;                // 0x2374
    int x2378;                // 0x2378
    int x237c;                // 0x237c
    int x2380;                // 0x2380
    int x2384;                // 0x2384
    int x2388;                // 0x2388
    int x238c;                // 0x238c
    int x2390;                // 0x2390
    int x2394;                // 0x2394
    int x2398;                // 0x2398
    int x239c;                // 0x239c
    int x23a0;                // 0x23a0
    int x23a4;                // 0x23a4
    int x23a8;                // 0x23a8
    int x23ac;                // 0x23ac
    int x23b0;                // 0x23b0
    int x23b4;                // 0x23b4
    int x23b8;                // 0x23b8
    int x23bc;                // 0x23bc
    int x23c0;                // 0x23c0
    int x23c4;                // 0x23c4
    int x23c8;                // 0x23c8
    int x23cc;                // 0x23cc
    int x23d0;                // 0x23d0
    int x23d4;                // 0x23d4
    int x23d8;                // 0x23d8
    int x23dc;                // 0x23dc
    int x23e0;                // 0x23e0
    int x23e4;                // 0x23e4
    int x23e8;                // 0x23e8
    int x23ec;                // 0x23ec
    int x23f0;                // 0x23f0
    int x23f4;                // 0x23f4
    int x23f8;                // 0x23f8
    int x23fc;                // 0x23fc
    int x2400;                // 0x2400
    int x2404;                // 0x2404
    int x2408;                // 0x2408
    int x240c;                // 0x240c
    int x2410;                // 0x2410
    int x2414;                // 0x2414
    int x2418;                // 0x2418
    int x241c;                // 0x241c
    int x2420;                // 0x2420
    int x2424;                // 0x2424
    int x2428;                // 0x2428
    int x242c;                // 0x242c
    int x2430;                // 0x2430
    int x2434;                // 0x2434
    int x2438;                // 0x2438
    int x243c;                // 0x243c
    int x2440;                // 0x2440
    int x2444;                // 0x2444
    int x2448;                // 0x2448
    int x244c;                // 0x244c
    int x2450;                // 0x2450
    int x2454;                // 0x2454
    int x2458;                // 0x2458
    int x245c;                // 0x245c
    int x2460;                // 0x2460
    int x2464;                // 0x2464
    int x2468;                // 0x2468
    int x246c;                // 0x246c
    int x2470;                // 0x2470
    int x2474;                // 0x2474
    int x2478;                // 0x2478
    int x247c;                // 0x247c
    int x2480;                // 0x2480
    int x2484;                // 0x2484
    int x2488;                // 0x2488
    int x248c;                // 0x248c
    int x2490;                // 0x2490
    int x2494;                // 0x2494
    int x2498;                // 0x2498
    int x249c;                // 0x249c
    int x24a0;                // 0x24a0
    int x24a4;                // 0x24a4
    int x24a8;                // 0x24a8
    int x24ac;                // 0x24ac
    int x24b0;                // 0x24b0
    int x24b4;                // 0x24b4
    int x24b8;                // 0x24b8
    int x24bc;                // 0x24bc
    int x24c0;                // 0x24c0
    int x24c4;                // 0x24c4
    MatchInit match;          // 0x24c8
};

static Match *stc_match = 0x8046b6a0;
static MatchCamera *stc_matchcam = 0x80452c68;
static MatchHUD *stc_matchhud = 0x804a0fd8; // 0x804a10c8;
static MatchOffscreen *stc_match_offscreen = 0x804a1df0;
static ExclamData *stc_exclam_data = 0x803f9628; // 8 of these
static HSD_Archive **stc_ifall_archive = 0x804d6d5c;
static int *stc_match_canvas = 0x804a1f58;
static GOBJ **stc_match_screencolor_gobj = 0x804d63e0;
static u8 *stc_hud_is_hidden = 0x804D6D6C;
static float *stc_match_fgm_volume = R13 + -0x7dbc;
static float *stc_match_bgm_volume = R13 + -0x7db8;

/*** Functions ***/
CameraBox *CameraBox_Alloc();
void CameraBox_Destroy(CameraBox *cam);
void KOCount_Init(int updateCallback);
void KOCount_Update(int KOs);
void Stage_CameraLimitInitialization();
void Stage_BlastzoneInitialization();
void Match_SetEndGraphic(int graphic);
void Match_DisplayEndGraphic(void *cb);
void Match_EndImmediate();
void Match_EndVS();
void Match_FadeScreen(int time);
int Match_CheckIfTeams();
int Match_CheckIfStock();
int Match_CheckIfFriendlyFire();
void Match_SetPostMatchSFX(int sfx);
void Match_FreezeGame(int freeze_kind);
void Match_UnfreezeGame(int freeze_kind);
void Match_CreateHUD(int ply);
void Match_HideHUD();
void Match_ShowHUD();
void Match_HidePercents();
void Match_ShowPercents();
void Match_ShowTimer();
void Match_HideTimer();
void Match_CorrectCamera();
void Match_SetNormalCamera();
void Match_SetFreeCamera(int unk, int unk2);
void Match_SetZoomCamera(int unk, int unk2);
void Match_SetFixedCamera();
void Match_SetDevelopCamera();
void DevCam_AdjustRotate(COBJ *cobj, Vec3 *wobjpos, Vec3 *rotate, float stickX, float stickY);
void DevCam_AdjustPan(COBJ *cobj, float stickX, float stickY);
void DevCam_AdjustZoom(COBJ *cobj, float stickY);
void ScreenFlash_Create(int kind, int unk);
void ScreenRumble_Execute(int kind, Vec3 *pos);
void Match_StoreGoCallback(GOBJ *gobj, void *cb);
void Match_CreateExclamation(int exclam, int is_play_sfx, int sfx, int r6, void *cb, void *cb2);
void Match_AdjustSoundOnPause(int is_pause);
Vec3 *Match_GetPlayerHUDPos(int ply);
COBJ *Match_GetCObj();
float Match_GetDamageRatio();
void Match_CreateGOExclamation();
void Match_EnableFighterInputs();
void Match_ApplyScreenColAnim(int colanim_index, int unk);
void Match_SetStageRenderFlags(int flags);
#endif