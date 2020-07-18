#ifndef MEX_H_ITEM
#define MEX_H_ITEM

#include "structs.h"
#include "datatypes.h"
#include "obj.h"
#include "color.h"

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

// ItemStateChange Flags
#define ITEMSTATE_UPDATEANIM 0x2
#define ITEMSTATE_GRAB 0x4

/*** Structs ***/

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

/*** Functions ***/

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

#endif