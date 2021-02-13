#ifndef MEX_H_ITEM
#define MEX_H_ITEM

#include "structs.h"
#include "datatypes.h"
#include "obj.h"
#include "color.h"

// Item IDs
enum ItemID
{
    ITEM_CAPSULE,
    ITEM_BOX,
    ITEM_BARREL,
    ITEM_EGG,
    ITEM_PARTYBALL,
    ITEM_BARRELCANNON,
    ITEM_BOBOMB,
    ITEM_MRSATURN,
    ITEM_HEARTCONTAINER,
    ITEM_MAXIMTOMATO,
    ITEM_STARMAN,
    ITEM_HOMERUNBAT,
    ITEM_BEAMSWORD,
    ITEM_PARASOL,
    ITEM_GREENSHELL,
    ITEM_REDSHELL,
    ITEM_RAYGUN,
    ITEM_FREEZIE,
    ITEM_FOOD,
    ITEM_MOTIONSENSORBOMB,
    ITEM_FLIPPER,
    ITEM_SUPERSCOPE,
    ITEM_STARROD,
    ITEM_LIPSSTICK,
    ITEM_FAN,
    ITEM_FIREFLOWER,
    ITEM_SUPERMUSHROOM,
    ITEM_POISONMUSHROOM,
    ITEM_HAMMER,
    ITEM_WARPSTAR,
    ITEM_SCREWATTACK,
    ITEM_BUNNYHOOD,
    ITEM_METALBOX,
    ITEM_CLOAKINGDEVICE,
    ITEM_POKEBALL,
    ITEM_RAYGUNUNK,
    ITEM_STARRODSTAR,
    ITEM_LIPSSTICKDUST,
    ITEM_SUPERSCOPEBEAM,
    ITEM_RAYGUNBEAM,
    ITEM_HAMMERHEAD,
    ITEM_FLOWER,
    ITEM_YOSHISEGG,
    ITEM_GOOMBA,
    ITEM_REDEAD,
    ITEM_OCTAROK,
    ITEM_OTTOSEA,
    ITEM_STONE,
    ITEM_MARIOFIRE,
    ITEM_DRMARIOPILL,
    ITEM_KIRBYCUTTER,
    ITEM_KIRBYHAMMER,
    ITEM_KIRBYABILITYSTAR,

    // pokemon
    ITEM_POKERANDOM = 160,
    ITEM_GOLDEEN,
    ITEM_CHICORITA,
    ITEM_SNORLAX,
    ITEM_BLASTOISE,
    ITEM_WEEZING,
    ITEM_CHARIZARD,
    ITEM_MOLTRES,
    ITEM_ZAPDOS,
    ITEM_ARCTICUNO,
    ITEM_WOBBUFFET,
    ITEM_SCIZOR,
    ITEM_UNOWN,
    ITEM_ENTEI,
    ITEM_RAIKOU,
    ITEM_SUICUNE,
    ITEM_BELLOSSOM,
    ITEM_ELECTRODE,
    ITEM_LUGIA,
    ITEM_HOOH,
    ITEM_DITTO,
    ITEM_CLEFAIRY,
    ITEM_TOGEPI,
    ITEM_MEW,
    ITEM_CELEBI,
    ITEM_STARYU,
    ITEM_CHANSEY,
    ITEM_PORYGON2,
    ITEM_CYNDAQUIL,
    ITEM_MARILL,
    ITEM_VENUSAUR,

    // stage
    ITEM_TARGET = 209,
};

// ItemStateChange Flags
#define ITEMSTATE_UPDATEANIM 0x2
#define ITEMSTATE_GRAB 0x4
#define ITEMSTATE_KEEPHIT 0x10 // dont remove hitboxes on state change

// Item hold_kind definitions
enum ItHoldKind
{
    ITHOLD_HAND,  // held item, like a capsule
    ITHOLD_HEAVY, // overhead item, like a crate
    ITHOLD_2,
    ITHOLD_3,
    ITHOLD_4,
    ITHOLD_5,
    ITHOLD_6,
    ITHOLD_7,
    ITHOLD_NONE, // unable to be held
};

/*** Structs ***/

typedef struct ItemModelDesc
{
    JOBJ *model;
    int bone_count;
    int bone_attach_id;
    int bit_field;
} ItemModelDesc;

typedef struct ItemDesc
{
    int *common_attributes;
    int *unqiue_attributes;
    int *hurtboxes;
    int *states;
    ItemModelDesc *model;
    int *dynamics;
} ItemDesc;

typedef struct itCommonData
{
    int x00;
    int x04;
    int x08;
    int x0C;
    int x10;
    int x14;
    int x18;
    int x1C;
    int x20;
    int x24;
    int x28;
    int x2C;
    int x30;
    int x34;
    int x38;
    int x3C;
    int x40;
    int x44;
    float x48;
    float x4C;
    float x50;
    float x54;
    float x58;
    float x5C;
    float x60;
    float x64;
    float x68;
    float x6C;
    float x70;
    float x74;
    float x78;
    float x7C;
    float x80;
    float x84;
    float x88;
    float x8C;
    float x90;
    float x94;
    float x98;
    float x9C;
    float xA0;
    float xA4;
    float xA8;
    float xAC;
    float xB0;
    int xB4;
    float xB8;
    float xBC;
    float xC0;
    float xC4;
    float xC8;
    float xCC;
    float xD0;
    float xD4;
    int xD8;
    int xDC;
    float xE0;
    float xE4;
    float xE8;
    float xEC;
    float xF0;
    float xF4;
    float xF8;
    int xFC;
    int x100;
    int x104;
    int x108;
    int x10C;
    int x110;
    int x114;
    int x118;
    int x11C;
    int x120;
    int x124;
    int x128;
    int x12C;
    int x130;
    int x134;
    int x138;
    int x13C;
    int x140;
    float x144;
    int x148;
    float x14C;
    float x150;
    float x154;
    float x158;
    float x15C;
} itCommonData;

typedef struct itPublicData
{
    itCommonData *common_data;
    ItemDesc **common_items;
    ItemDesc **adventure_items;
    ItemDesc **pokemon_items;
    int *x10;
    int *x14;
} itPublicData;

struct itData
{
    int x0;
    float *param_ext;
    void *archive;
    void *animFlags;
    void *animDynamics;
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

struct itCommonAttr
{
    char flags1;                //0x0, bit 0x80 = is heavy item (crate)
    unsigned char x1_1 : 1;     // 0x1 0x80
    unsigned char x1_2 : 1;     // 0x1 0x40
    unsigned char x1_3 : 1;     // 0x1 0x20
    unsigned char x1_4 : 1;     // 0x1 0x10
    unsigned char x1_5 : 1;     // 0x1 0x08
    unsigned char cam_kind : 2; // 0x1 0x06, is stored to 0xdcd
    unsigned char x1_8 : 1;     // 0x1 0x01    char flags3; //0x2
    char flags4;                //0x3
    int x4;
    int x8;
    float spin_speed;
    float fall_speed;
    float fall_speed_max;
    float x18;
    float x1C;       //collision related
    int x20;         // 0x20
    int x24;         // 0x24
    int x28;         // 0x28
    int x2c;         // 0x2c
    int x30;         // 0x30
    int x34;         // 0x34
    int x38;         // 0x38
    int x3c;         // 0x3c
    float ecb_top;   // 0x40
    float ecb_bot;   // 0x44
    float ecb_right; // 0x48
    float ecb_left;  // 0x4c
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
};

struct ItemState
{
    int state;
    void *animCallback;
    void *physCallback;
    void *collCallback;
};

struct SpawnItem
{
    GOBJ *parent_gobj;                  // 0x0
    GOBJ *parent_gobj2;                 // 0x4
    int it_kind;                        // 0x8, id of the item to spawn
    int hold_kind;                      // 0xC, defines the behavior of the item, such as thrown and pickup. 0 = capsule
    int unk2;                           // 0x10
    Vec3 pos;                           // 0x14
    Vec3 pos2;                          // 0x20
    Vec3 vel;                           // 0x2C
    float facing_direction;             // 0x38
    short damage;                       // 0x3C
    short unk5;                         // 0x3E
    int unk6;                           // 0x40, 1 = correct initial position
    unsigned char is_raycast_below : 1; // 0x44, 0x80 = perform initial collision check
    int is_spin;                        // 0x48, enables item spinning
};

struct itHit
{
    int active;                   // 0x0
    int x4;                       // 0x4, depends on
    int dmg;                      // 0x8, projected damage
    float dmg_f;                  // 0xc, staled damage, actually applied
    Vec3 offset;                  // 0x10
    float size;                   // 0x1c
    int angle;                    // 0x20
    int kb_growth;                // 0x24
    int wdsk;                     // 0x28
    int kb;                       // 0x2c
    int attribute;                // 0x30
    int shield_dmg;               // 0x34
    int hitsound_severity;        // 0x38. hurtbox interaction. 0 = none, 1 = grounded, 2 = aerial, 3 = both
    int hitsound_kind;            // 0x3c
    unsigned char x401 : 1;       // 0x40 0x80
    unsigned char x402 : 1;       // 0x40 0x40
    unsigned char hit_air : 1;    // 0x40 0x20. bool to check against aerial fighters
    unsigned char hit_ground : 1; // 0x40 0x10. bool to check against grounded fighters
    unsigned char x405 : 1;       // 0x40 0x08
    unsigned char x406 : 1;       // 0x40 0x04
    unsigned char x407 : 1;       // 0x40 0x02
    unsigned char x408 : 1;       // 0x40 0x01
    char x41;                     // 0x41
    unsigned char x421 : 1;       // 0x42 0x80
    unsigned char x422 : 1;       // 0x42 0x40
    unsigned char hit_facing : 1; // 0x42 0x20. bool to only hit fighters facing the item
    unsigned char x424 : 1;       // 0x42 0x10
    unsigned char no_hurt : 1;    // 0x42 0x08      ignore hurtbox
    unsigned char no_reflect : 1; // 0x42 0x04      ignore reflect?
    unsigned char x427 : 1;       // 0x42 0x02
    unsigned char x428 : 1;       // 0x42 0x01
    unsigned char x431 : 1;       // 0x43 0x80
    unsigned char x432 : 1;       // 0x43 0x40
    unsigned char hit_all : 1;    // 0x43 0x20
    unsigned char x434 : 1;       // 0x43 0x10
    unsigned char x435 : 1;       // 0x43 0x08
    unsigned char x436 : 1;       // 0x43 0x04
    unsigned char x437 : 1;       // 0x43 0x02
    unsigned char x438 : 1;       // 0x43 0x01
    int x44;                      // 0x44
    JOBJ *bone;                   // 0x48
    Vec3 pos;                     // 0x4c
    Vec3 pos_prev;                // 0x58
    Vec3 pos_coll;                // 0x64   position of hurt collision
    float coll_distance;          // 0x70   Distance From Collding Hurtbox (Used for phantom hit collision calculation)
    GOBJ *victim;                 // 0x74
    int x78;                      // 0x78
    int x7c;                      // 0x7c
    int x80;                      // 0x80
    int x84;                      // 0x84
    int x88;                      // 0x88
    int x8c;                      // 0x8c
    int x90;                      // 0x90
    int x94;                      // 0x94
    int x98;                      // 0x98
    int x9c;                      // 0x9c
    int xa0;                      // 0xa0
    int xa4;                      // 0xa4
    int xa8;                      // 0xa8
    int xac;                      // 0xac
    int xb0;                      // 0xb0
    int xb4;                      // 0xb4
    int xb8;                      // 0xb8
    int xbc;                      // 0xbc
    int xc0;                      // 0xc0
    int xc4;                      // 0xc4
    int xc8;                      // 0xc8
    int xcc;                      // 0xcc
    int xd0;                      // 0xd0
    int xd4;                      // 0xd4
    int xd8;                      // 0xd8
    int xdc;                      // 0xdc
    int xe0;                      // 0xe0
    int xe4;                      // 0xe4
    int xe8;                      // 0xe8
    int xec;                      // 0xec
    int xf0;                      // 0xf0
    int xf4;                      // 0xf4
    int xf8;                      // 0xf8
    int xfc;                      // 0xfc
    int x100;                     // 0x100
    int x104;                     // 0x104
    int x108;                     // 0x108
    int x10c;                     // 0x10c
    int x110;                     // 0x110
    int x114;                     // 0x114
    int x118;                     // 0x118
    int x11c;                     // 0x11c
    int x120;                     // 0x120
    int x124;                     // 0x124
    int x128;                     // 0x128
    int x12c;                     // 0x12c
    int x130;                     // 0x130
    int x134;                     // 0x134
    int x138;                     // 0x138
};

struct ItemData
{
    int x0;                                  // 0x0
    GOBJ *item;                              // 0x0
    int x8;                                  // 0x8
    int spawn_kind;                          // 0xC
    int kind;                                // 0x10
    int x14;                                 // 0x14
    int x18;                                 // 0x18
    int x1c;                                 // 0x1c
    int x20;                                 // 0x20
    int state;                               // 0x24
    int x28;                                 // 0x28
    float facing_direction;                  // 0x2c
    int x30;                                 // 0x30
    float spin_unk;                          // 0x34
    float scale;                             // 0x38
    int x3c;                                 // 0x3c
    Vec3 self_vel;                           // 0x40
    Vec3 pos;                                // 0x4C
    Vec3 vel_unk;                            // 0x58 - 0x64
    Vec3 vel_unk2;                           // 0x64 - 0x70
    Vec3 vel_nudge;                          // 0x70 - 0x7C
    int x7c;                                 // 0x7c
    int x80;                                 // 0x80
    int x84;                                 // 0x84
    int x88;                                 // 0x88
    int x8c;                                 // 0x8c
    int x90;                                 // 0x90
    int x94;                                 // 0x94
    int x98;                                 // 0x98
    int x9c;                                 // 0x9c
    int xa0;                                 // 0xa0
    int xa4;                                 // 0xa4
    int xa8;                                 // 0xa8
    int xac;                                 // 0xac
    int xb0;                                 // 0xb0
    int xb4;                                 // 0xb4
    void *it_cb;                             // 0xb8, global item callbacks
    ItemState *item_states;                  // 0xbc
    int isRotate;                            // 0xc0
    itData *itData;                          // 0xc4
    JOBJ *joint;                             // 0xc8
    itCommonAttr *common_attr;               // 0xcc
    int xd0;                                 // 0xd0
    int xd4;                                 // 0xd4
    int xd8;                                 // 0xd8
    int xdc;                                 // 0xdc
    int air_state;                           // 0xe0
    int xe4;                                 // 0xe4
    int xe8;                                 // 0xe8
    int xec;                                 // 0xec
    int xf0;                                 // 0xf0
    int xf4;                                 // 0xf4
    int xf8;                                 // 0xf8
    int xfc;                                 // 0xfc
    int x100;                                // 0x100
    int x104;                                // 0x104
    int x108;                                // 0x108
    int x10c;                                // 0x10c
    int x110;                                // 0x110
    int x114;                                // 0x114
    int x118;                                // 0x118
    int x11c;                                // 0x11c
    int x120;                                // 0x120
    int x124;                                // 0x124
    int x128;                                // 0x128
    int x12c;                                // 0x12c
    int x130;                                // 0x130
    int x134;                                // 0x134
    int x138;                                // 0x138
    int x13c;                                // 0x13c
    int x140;                                // 0x140
    int x144;                                // 0x144
    int x148;                                // 0x148
    int x14c;                                // 0x14c
    int x150;                                // 0x150
    int x154;                                // 0x154
    int x158;                                // 0x158
    int x15c;                                // 0x15c
    int x160;                                // 0x160
    int x164;                                // 0x164
    int x168;                                // 0x168
    int x16c;                                // 0x16c
    int x170;                                // 0x170
    int x174;                                // 0x174
    int x178;                                // 0x178
    int x17c;                                // 0x17c
    int x180;                                // 0x180
    int x184;                                // 0x184
    int x188;                                // 0x188
    int x18c;                                // 0x18c
    int x190;                                // 0x190
    int x194;                                // 0x194
    int x198;                                // 0x198
    int x19c;                                // 0x19c
    int x1a0;                                // 0x1a0
    int x1a4;                                // 0x1a4
    int x1a8;                                // 0x1a8
    int x1ac;                                // 0x1ac
    int x1b0;                                // 0x1b0
    int x1b4;                                // 0x1b4
    int x1b8;                                // 0x1b8
    int x1bc;                                // 0x1bc
    int x1c0;                                // 0x1c0
    int x1c4;                                // 0x1c4
    int x1c8;                                // 0x1c8
    int x1cc;                                // 0x1cc
    int x1d0;                                // 0x1d0
    int x1d4;                                // 0x1d4
    int x1d8;                                // 0x1d8
    int x1dc;                                // 0x1dc
    int x1e0;                                // 0x1e0
    int x1e4;                                // 0x1e4
    int x1e8;                                // 0x1e8
    int x1ec;                                // 0x1ec
    int x1f0;                                // 0x1f0
    int x1f4;                                // 0x1f4
    int x1f8;                                // 0x1f8
    int x1fc;                                // 0x1fc
    int x200;                                // 0x200
    int x204;                                // 0x204
    int x208;                                // 0x208
    int x20c;                                // 0x20c
    int x210;                                // 0x210
    int x214;                                // 0x214
    int x218;                                // 0x218
    int x21c;                                // 0x21c
    int x220;                                // 0x220
    int x224;                                // 0x224
    int x228;                                // 0x228
    int x22c;                                // 0x22c
    int x230;                                // 0x230
    int x234;                                // 0x234
    int x238;                                // 0x238
    int x23c;                                // 0x23c
    int x240;                                // 0x240
    int x244;                                // 0x244
    int x248;                                // 0x248
    int x24c;                                // 0x24c
    int x250;                                // 0x250
    int x254;                                // 0x254
    int x258;                                // 0x258
    int x25c;                                // 0x25c
    int x260;                                // 0x260
    int x264;                                // 0x264
    int x268;                                // 0x268
    int x26c;                                // 0x26c
    int x270;                                // 0x270
    int x274;                                // 0x274
    int x278;                                // 0x278
    int x27c;                                // 0x27c
    int x280;                                // 0x280
    int x284;                                // 0x284
    int x288;                                // 0x288
    int x28c;                                // 0x28c
    int x290;                                // 0x290
    int x294;                                // 0x294
    int x298;                                // 0x298
    int x29c;                                // 0x29c
    int x2a0;                                // 0x2a0
    int x2a4;                                // 0x2a4
    int x2a8;                                // 0x2a8
    int x2ac;                                // 0x2ac
    int x2b0;                                // 0x2b0
    int x2b4;                                // 0x2b4
    int x2b8;                                // 0x2b8
    int x2bc;                                // 0x2bc
    int x2c0;                                // 0x2c0
    int x2c4;                                // 0x2c4
    int x2c8;                                // 0x2c8
    int x2cc;                                // 0x2cc
    int x2d0;                                // 0x2d0
    int x2d4;                                // 0x2d4
    int x2d8;                                // 0x2d8
    int x2dc;                                // 0x2dc
    int x2e0;                                // 0x2e0
    int x2e4;                                // 0x2e4
    int x2e8;                                // 0x2e8
    int x2ec;                                // 0x2ec
    int x2f0;                                // 0x2f0
    int x2f4;                                // 0x2f4
    int x2f8;                                // 0x2f8
    int x2fc;                                // 0x2fc
    int x300;                                // 0x300
    int x304;                                // 0x304
    int x308;                                // 0x308
    int x30c;                                // 0x30c
    int x310;                                // 0x310
    int x314;                                // 0x314
    int x318;                                // 0x318
    int x31c;                                // 0x31c
    int x320;                                // 0x320
    int x324;                                // 0x324
    int x328;                                // 0x328
    int x32c;                                // 0x32c
    int x330;                                // 0x330
    int x334;                                // 0x334
    int x338;                                // 0x338
    int x33c;                                // 0x33c
    int x340;                                // 0x340
    int x344;                                // 0x344
    int x348;                                // 0x348
    int x34c;                                // 0x34c
    int x350;                                // 0x350
    int x354;                                // 0x354
    int x358;                                // 0x358
    int x35c;                                // 0x35c
    int x360;                                // 0x360
    int x364;                                // 0x364
    int x368;                                // 0x368
    int x36c;                                // 0x36c
    int x370;                                // 0x370
    int x374;                                // 0x374
    CollData coll_data;                      // 0x378 -> 0x518
    GOBJ *fighter_gobj;                      // 0x518
    int x51c;                                // 0x51c
    CameraBox *camerabox;                    // 0x520
    int x524;                                // 0x524
    int x528;                                // 0x528
    int *script_parse;                       // 0x52c
    int x530;                                // 0x530
    int x534;                                // 0x534
    int x538;                                // 0x538
    int x53c;                                // 0x53c
    int x540;                                // 0x540
    int x544;                                // 0x544
    ColorOverlay color;                      // 0x548
    int x5c8;                                // 0x5c8
    int x5cc;                                // 0x5cc
    int x5d0;                                // 0x5d0
    itHit hitbox[4];                         // 0x5d4
    int xac4;                                // 0xac4
    int xac8;                                // 0xac8
    int hurt_status;                         // 0xacc
    int xad0;                                // 0xad0
    int xad4;                                // 0xad4
    int xad8;                                // 0xad8
    int xadc;                                // 0xadc
    int xae0;                                // 0xae0
    int xae4;                                // 0xae4
    int xae8;                                // 0xae8
    int xaec;                                // 0xaec
    int xaf0;                                // 0xaf0
    int xaf4;                                // 0xaf4
    int xaf8;                                // 0xaf8
    int xafc;                                // 0xafc
    int xb00;                                // 0xb00
    int xb04;                                // 0xb04
    int xb08;                                // 0xb08
    int xb0c;                                // 0xb0c
    int xb10;                                // 0xb10
    int xb14;                                // 0xb14
    int xb18;                                // 0xb18
    int xb1c;                                // 0xb1c
    int xb20;                                // 0xb20
    int xb24;                                // 0xb24
    int xb28;                                // 0xb28
    int xb2c;                                // 0xb2c
    int xb30;                                // 0xb30
    int xb34;                                // 0xb34
    int xb38;                                // 0xb38
    int xb3c;                                // 0xb3c
    int xb40;                                // 0xb40
    int xb44;                                // 0xb44
    int xb48;                                // 0xb48
    int xb4c;                                // 0xb4c
    int xb50;                                // 0xb50
    int xb54;                                // 0xb54
    int xb58;                                // 0xb58
    int xb5c;                                // 0xb5c
    int xb60;                                // 0xb60
    int xb64;                                // 0xb64
    int xb68;                                // 0xb68
    int xb6c;                                // 0xb6c
    int xb70;                                // 0xb70
    int xb74;                                // 0xb74
    int xb78;                                // 0xb78
    int xb7c;                                // 0xb7c
    int xb80;                                // 0xb80
    int xb84;                                // 0xb84
    int xb88;                                // 0xb88
    int xb8c;                                // 0xb8c
    int xb90;                                // 0xb90
    int xb94;                                // 0xb94
    int xb98;                                // 0xb98
    int xb9c;                                // 0xb9c
    int xba0;                                // 0xba0
    int xba4;                                // 0xba4
    int xba8;                                // 0xba8
    int xbac;                                // 0xbac
    int xbb0;                                // 0xbb0
    int xbb4;                                // 0xbb4
    int xbb8;                                // 0xbb8
    int xbbc;                                // 0xbbc
    int xbc0;                                // 0xbc0
    int xbc4;                                // 0xbc4
    int xbc8;                                // 0xbc8
    int xbcc;                                // 0xbcc
    int xbd0;                                // 0xbd0
    int xbd4;                                // 0xbd4
    int xbd8;                                // 0xbd8
    int xbdc;                                // 0xbdc
    int xbe0;                                // 0xbe0
    int xbe4;                                // 0xbe4
    int xbe8;                                // 0xbe8
    int xbec;                                // 0xbec
    int xbf0;                                // 0xbf0
    int xbf4;                                // 0xbf4
    int xbf8;                                // 0xbf8
    int xbfc;                                // 0xbfc
    int xc00;                                // 0xc00
    int xc04;                                // 0xc04
    int xc08;                                // 0xc08
    int xc0c;                                // 0xc0c
    int xc10;                                // 0xc10
    int xc14;                                // 0xc14
    int xc18;                                // 0xc18
    float ecb_top;                           // 0xc1c
    float ecb_bottom;                        // 0xc20
    float ecb_right;                         // 0xc24
    float ecb_left;                          // 0xc28
    int xc2c;                                // 0xc2c
    int xc30;                                // 0xc30
    int xc34;                                // 0xc34
    int xc38;                                // 0xc38
    int xc3c;                                // 0xc3c
    int xc40;                                // 0xc40
    int xc44;                                // 0xc44
    int xc48;                                // 0xc48
    int xc4c;                                // 0xc4c
    int xc50;                                // 0xc50
    int xc54;                                // 0xc54
    int xc58;                                // 0xc58
    int xc5c;                                // 0xc5c
    int xc60;                                // 0xc60
    int xc64;                                // 0xc64
    int xc68;                                // 0xc68
    int xc6c;                                // 0xc6c
    int xc70;                                // 0xc70
    int xc74;                                // 0xc74
    int xc78;                                // 0xc78
    int xc7c;                                // 0xc7c
    int xc80;                                // 0xc80
    int xc84;                                // 0xc84
    int xc88;                                // 0xc88
    int xc8c;                                // 0xc8c
    int xc90;                                // 0xc90
    int xc94;                                // 0xc94
    int xc98;                                // 0xc98
    struct                                   // 0xc9c
    {                                        //
        int total;                           // 0xc9c
        int recent;                          // 0xca0
        int xca4;                            // 0xca4
        int xca8;                            // 0xca8
        int angle;                           // 0xcac
        int xcb0;                            // 0xcb0
        int xcb4;                            // 0xcb4
        int xcb8;                            // 0xcb8
        int xcbc;                            // 0xcbc
        int xcc0;                            // 0xcc0
        int xcc4;                            // 0xcc4
        float kb;                            // 0xcc8
        float direction;                     // 0xccc
        int xcd0;                            // 0xcd0
        int xcd4;                            // 0xcd4
        int xcd8;                            // 0xcd8
        int xcdc;                            // 0xcdc
        int xce0;                            // 0xce0
        int xce4;                            // 0xce4
        int xce8;                            // 0xce8
        GOBJ *source_fighter;                // 0xcec
        GOBJ *source_item;                   // 0xcf0
    } dmg;                                   //
    int xcf4;                                // 0xcf4
    int xcf8;                                // 0xcf8
    int xcfc;                                // 0xcfc
    GOBJ *grabbed_fighter;                   // 0xd00
    int xd04;                                // 0xd04
    int xd08;                                // 0xd08
    int xd0c;                                // 0xd0c
    int xd10;                                // 0xd10
    struct                                   // cb
    {                                        //
        void (*anim)(GOBJ *item);            // 0xd14
        void (*phys)(GOBJ *item);            // 0xd18
        void (*coll)(GOBJ *item);            // 0xd1c
        void (*accessory)(GOBJ *item);       // 0xd20
        void *xd24;                          // 0xd24
        void *xd28;                          // 0xd28
        void *xd2c;                          // 0xd2c
        void *jumped_on;                     // 0xd30, runs when the item is "jumped on", 80269bac
        void *grabFt_onIt;                   // 0xd34, when grabbing a fighter, run this function on self
        void *grabFt_onFt;                   // 0xd38, when grabbing a fighter, run this function on fighter
    } cb;                                    //
    float spin_speed;                        // 0xd3c
    int xd40;                                // 0xd40
    float lifetime;                          // 0xd44
    int xd48;                                // 0xd48
    int xd4c;                                // 0xd4c
    int xd50;                                // 0xd50
    int xd54;                                // 0xd54
    int xd58;                                // 0xd58
    int xd5c;                                // 0xd5c
    int xd60;                                // 0xd60
    int xd64;                                // 0xd64
    int xd68;                                // 0xd68
    int xd6c;                                // 0xd6c
    int xd70;                                // 0xd70
    int xd74;                                // 0xd74
    int xd78;                                // 0xd78
    int xd7c;                                // 0xd7c
    int xd80;                                // 0xd80
    int xd84;                                // 0xd84
    int atk_kind;                            // 0xd88, copied from fighter atk_kind
    u16 atk_instance;                        // 0xd8c,  Contains an ID unique to the current move instance. e.g, if two dairs are done back to back, this ID will differ to tell them apart from each other. It is stored to 0x18EC of the victim upon colliding with someone.
    int xd90;                                // 0xd90
    int xd94;                                // 0xd94
    int xd98;                                // 0xd98
    int xd9c;                                // 0xd9c
    int xda0;                                // 0xda0
    int xda4;                                // 0xda4
    char xda8;                               // 0xda8
    char xda9;                               // 0xda8
    unsigned char xdaa1 : 1;                 // 0xda8 0x80
    unsigned char xdaa2 : 1;                 // 0xda8 0x40
    unsigned char xdaa3 : 1;                 // 0xda8 0x20
    unsigned char xdaa4 : 1;                 // 0xda8 0x10
    unsigned char xdaa5 : 1;                 // 0xda8 0x08
    unsigned char xdaa6 : 1;                 // 0xda8 0x04
    unsigned char xdaa7 : 1;                 // 0xda8 0x02
    unsigned char visible : 1;               // 0xda8 0x01
    char xdab;                               // 0xda8
    struct                                   //
    {                                        //
        int flag1;                           // 0xdac
        int flag2;                           // 0xdb0
        int flag3;                           // 0xdb4
        int flag4;                           // 0xdb8
        int flag5;                           // 0xdbc
    } ftcmd_var;                             //
    int xdc0;                                // 0xdc0
    int xdc4;                                // 0xdc4
    u16 flags1 : 16;                         // 0xdc8
    u16 xdca1 : 1;                           // 0xdca 0x80
    u16 xdca2 : 1;                           // 0xdca 0x40
    u16 xdca3 : 1;                           // 0xdca 0x20
    u16 xdca4 : 1;                           // 0xdca 0x10
    u16 xdca5 : 1;                           // 0xdca 0x08
    u16 can_hold : 1;                        // 0xdca 0x04
    u16 xdca7 : 1;                           // 0xdca 0x02
    u16 rotate_axis : 3;                     // 0xdcb,
    u16 flags4 : 2;                          // 0xdcb, 0x30
    u16 can_nudge : 1;                       // 0xdcb, 0x08
    u16 xdcb_7 : 3;                          // 0xdcb, 0x07
    unsigned char xdcc1 : 1;                 // 0xdcc, 0x80
    unsigned char xdcc2 : 1;                 // 0xdcc, 0x40
    unsigned char xdcc3 : 1;                 // 0xdcc, 0x20
    unsigned char isCheckBlastzone : 1;      // 0xdcc, 0x10
    unsigned char isCheckRightBlastzone : 1; // 0xdcc, 0x08
    unsigned char isCheckLeftBlastzone : 1;  // 0xdcc, 0x04
    unsigned char isCheckUpBlastzone : 1;    // 0xdcc, 0x02
    unsigned char isCheckDownBlastzone : 1;  // 0xdcc, 0x01
    unsigned char cam_kind : 2;              // 0xdcd, 0xc0. indicates this item has a camera box
    unsigned char xdcd3 : 1;                 // 0xdcd, 0x20
    unsigned char xdcd4 : 1;                 // 0xdcd, 0x10
    unsigned char xdcd5 : 1;                 // 0xdcd, 0x08
    unsigned char xdcd6 : 1;                 // 0xdcd, 0x04
    unsigned char xdcd7 : 1;                 // 0xdcd, 0x02
    unsigned char xdcd8 : 1;                 // 0xdcd, 0x01
    unsigned char xdce1 : 1;                 // 0xdce, 0x80
    unsigned char xdce2 : 1;                 // 0xdce, 0x40
    unsigned char xdce3 : 1;                 // 0xdce, 0x20
    unsigned char xdce4 : 1;                 // 0xdce, 0x10
    unsigned char xdce5 : 1;                 // 0xdce, 0x08
    unsigned char xdce6 : 1;                 // 0xdce, 0x04
    unsigned char xdce7 : 1;                 // 0xdce, 0x02
    unsigned char xdce8 : 1;                 // 0xdce, 0x01
    unsigned char xdcf1 : 1;                 // 0xdcf, 0x80
    unsigned char xdcf2 : 1;                 // 0xdcf, 0x40
    unsigned char xdcf3 : 1;                 // 0xdcf, 0x20
    unsigned char xdcf4 : 1;                 // 0xdcf, 0x10
    unsigned char xdcf5 : 1;                 // 0xdcf, 0x08
    unsigned char xdcf6 : 1;                 // 0xdcf, 0x04
    unsigned char xdcf7 : 1;                 // 0xdcf, 0x02
    unsigned char xdcf8 : 1;                 // 0xdcf, 0x01
    int xdd0;                                // 0xdd0
    struct                                   // 0xdd4
    {                                        //
        int itemVar1;                        // 0xdd4
        int itemVar2;                        // 0xdd8
        int itemVar3;                        // 0xddc
        int itemVar4;                        // 0xde0
        int itemVar5;                        // 0xde4
        int itemVar6;                        // 0xde8
        int itemVar7;                        // 0xdec
        int itemVar8;                        // 0xdf0
        int itemVar9;                        // 0xdf4
        int itemVar10;                       // 0xdf8
        int itemVar11;                       // 0xdfc
        int itemVar12;                       // 0xe00
    } item_var;                              //
    int xe04;                                // 0xe04
    int xe08;                                // 0xe08
    int xe0c;                                // 0xe0c
    int xe10;                                // 0xe10
    int xe14;                                // 0xe14
    int xe18;                                // 0xe18
    int xe1c;                                // 0xe1c
    int xe20;                                // 0xe20
    int xe24;                                // 0xe24
    int xe28;                                // 0xe28
    int xe2c;                                // 0xe2c
    int xe30;                                // 0xe30
    int xe34;                                // 0xe34
    int xe38;                                // 0xe38
    int xe3c;                                // 0xe3c
};

/*** static reference ***/

itPublicData **stc_itPublicData = (R13 + -0x4978);

/*** Functions ***/

void Item_Hold(GOBJ *item, GOBJ *fighter, int boneID);
void Item_Catch(GOBJ *fighter, int unk);
void Items_StoreItemDataToCharItemTable(int articleData, int articleID);
void Items_StoreTimeout(GOBJ *item, float timeout);
GOBJ *Item_CreateItem(SpawnItem *item_spawn); // sorry for confusion, use this one for best results
GOBJ *Item_CreateItem1(SpawnItem *item_spawn);
GOBJ *Item_CreateItem2(SpawnItem *item_spawn);
GOBJ *Item_CreateItem3(SpawnItem *item_spawn);
void Item_Destroy(GOBJ *item);
int Item_CollGround_PassLedge(GOBJ *item, void *callback);
int Item_CollGround_StopLedge(GOBJ *item, void *callback);
int Item_CollAir_Bounce(GOBJ *item, void *callback);
int Item_CollAir_Land(GOBJ *item, void *callback);
int Item_CollAir_NoCB(GOBJ *item);
void ItemStateChange(GOBJ *item, int stateID, int flags);
int ItemFrameTimer(GOBJ *item);
void Item_PlaceOnGroundBelow(GOBJ *item);
int Item_CheckIfTouchingWall(GOBJ *item, float *unk[]);
void Item_InitGrab(ItemData *item, int unk, void *OnItem, void *OnFighter);
void Item_ResetAllHitPlayers(ItemData *item);
int Item_CountActiveItems(int itemID);
void Item_CopyDevelopState(GOBJ *item, GOBJ *fighter);
void GXLink_Item(GOBJ *gobj, int pass);
void Item_UpdateSpin(GOBJ *item, float unk);
void Item_EnableSpin(GOBJ *item);
void Item_DisableSpin(GOBJ *item);
void Item_SetLifeTimer(GOBJ *item, float lifetime); // sets frames until item is destroyed
int Item_DecLifeTimer(GOBJ *item);                  // returns isEnd bool
JOBJ *Item_GetBoneJOBJ(GOBJ *item, int bone_index);
int Item_CheckIfEnabled(); // returns bool regarding if items are enabled for this match
int Item_GetGroundAirState(GOBJ *item);
void Item_UpdatePhysAndColl(GOBJ *item);
void Item_InvertVelocityAndFacingDirection(GOBJ *item);
void Item_ProjectileVelocityCalculate(GOBJ *item, float fall_speed, float max_fall_speed);
void Item_PlayOnDestroySFXAgain(ItemData *, int sfxid, int volume, int unk);
void Item_UpdatePositionCollision(GOBJ *item);
void Item_ScaleToPlayerSize(GOBJ *item);
void Item_AnimateAndUpdateSubactions(GOBJ *item);
void Barrel_EnterBreak(GOBJ *item);
void Item_EnableUnknownFlag(GOBJ *item);
void Item_ReflectVelocity(GOBJ *item);
void Item_Throw(GOBJ *item, float unk, Vec3 *pos, Vec3 *vel);
JOBJ *Item_GetHeldBone(GOBJ *item);
void Item_BounceOffVictim(GOBJ *item);
void Item_BounceOffShield(GOBJ *item);
#endif