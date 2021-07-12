#ifndef MEX_H_CSS
#define MEX_H_CSS

#include "structs.h"
#include "datatypes.h"
#include "fighter.h"
#include "scene.h"

#define MENU_BUTTON_UP 0x1
#define MENU_BUTTON_DOWN 0x2
#define MENU_BUTTON_LEFT 0x4
#define MENU_BUTTON_RIGHT 0x8
#define MENU_BUTTON_A 0x10
#define MENU_BUTTON_B 0x20
#define MENU_BUTTON_L 0x40
#define MENU_BUTTON_R 0x80
#define MENU_BUTTON_START 0x100
#define MENU_BUTTON_X 0x400
#define MENU_BUTTON_Y 0x800

/*** Structs ***/
struct CSSBackup
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
};

struct MnSelectChrDataTable
{
    COBJDesc *cobj;
    void *lobj1;
    void *lobj2;
    void *fog;
    JOBJSet bg;
    JOBJSet cursor;
    JOBJSet puck;
    JOBJSet vsmenu;
    JOBJSet start;
    JOBJSet camdoor;
    JOBJSet solomenu;
    JOBJSet solooption;
    JOBJSet cpudoor;
};

enum CSSCursorState
{
    SLCHRCUR_POINT,
    SLCHRCUR_HOLD,
    SLCHRCUR_OPEN,
    SLCHRCUR_HIDDEN,
};
struct CSSCursor
{
    GOBJ *gobj;
    u8 port;
    u8 state; // 0x5, 0x0 = Pointing / 0x1 = Holding Puck / 0x2 = Open Hand / 0x3 = Hidden/Unplugged
    u8 puck;  // 0x6, puck index being held
    u8 x7;    // 0x7,
    u16 x8;
    u16 exit_timer; // 0xa, frames held B
    Vec2 pos;       // 0xc-0x10
};

struct CSSPuck
{
    GOBJ *gobj;       // 0x0,
    u8 port;          // 0x4, port this puck belongs to
    u8 state;         // 0x5, 0x0 = Pointing / 0x1 = Holding Puck / 0x2 = Open Hand / 0x3 = Hidden/Unplugged
    u8 held;          // 0x6, port that this puck is being held by
    u8 anim_timer;    // 0x7, Animation Timer. resets animation when this hits 39, checked for @ 80262790
    Vec2 pos_proj;    // 0x8, where the puck should be
    Vec2 pos_correct; // 0x10, where the puck is corrected to
};

struct MnSlChrIcon
{
    u8 ft_hudindex; // used for getting combo count @ 8025c0c4
    u8 ft_kind;     // icons external ID
    u8 state;       // Dictates whether icon can be chosen. 0x0 = Not Unlocked, 0x1 = Unlocked (temp value), 0x2 = Unlocked and Displayed
    u8 anim_timer;  // is made to be 0xC when the character is chosen.
    u8 joint_id;    // icon background jobj ID
    u8 joint2_id;   // used to icons JObj pointer
    int sfx;        // 0x8,
    float bound_l;  // 0xC
    float bound_r;  // 0x10
    float bound_u;  // 0x14
    float bound_d;  // 0x18
};

enum DoorState
{
    DOOR_HMN,
    DOOR_CPU,
    DOOR_UNK,
    DOOR_CLOSED,
};
struct MnSlChrDoor
{
    u8 x0;
    u8 csp_joint;
    u8 x2;
    u8 joint_id; // 0x3
    u8 x4;
    u8 x5; // nametag window joint id
    u8 x6;
    u8 cpuslider_joint; // 0x7
    u8 slider2_joint;   //0x8
    u8 x9;
    u8 dooranim_timer; // 0xa
    u8 state;          // 0x0 = HMN, 0x1 = CPU, 0x3 = Closed
    u8 xc;
    u8 costume;  // 0xd
    u8 sel_icon; // 0xe, icon this player has selected
    u8 xf;
    u8 x10;
    u8 slideranim_timer;
    u8 x12;
    u8 x13;
    float button_l; // HMN button bound
    float button_t; // HMN button bound
    float button_u; // HMN button bound
    float button_d; // HMN button bound
};

struct MnSlChrTagData
{
    Text *name;
    Text *namelist;     // 0x4, used when opening the tag window
    float x8;           // 0x8
    float scroll_amt;   // xC, Text Y Offset to scroll up each frame
    float scroll_force; //x10
    int timer;          // x14, state timer
    u8 next_tag;        // 0x18, index of next empty tag
    u8 port;
    u8 state;   // 0x1a, is nametag window open bool
    u8 use_tag; // 0x1b, is using a nametag bool
};

struct MnSlChrTag
{
    MnSlChrTagData *tag_data;
    u8 x4;
    u8 list_joint;
    u8 name_joint;
    u8 x7;
    u8 kostartext_joint;
    u8 x9;
    u8 xa;
    u8 xb;
};

struct MnSlChrKOStar
{
    Text *text;
    float x4;
    u8 joint;
    int xc;
    int x10;
    int x14;
    int x18;
    int x1c;
};

struct MnSlChrData
{
    u8 GaWName[0x1C];          // 0x0
    u8 x1C[0xC0];              // 0x1c
    MnSlChrIcon icons[25 + 1]; // 0xDC
    MnSlChrDoor doors[4];      // 0x3b4
    MnSlChrTag tags[4];        // 0x444
    u8 x474;                   // 0x474
    u8 x475;                   // 0x475
    u8 x476;                   // 0x476
    u8 x477;                   // 0x477
    u8 x478;                   // 0x478
    u8 x479;                   // 0x479
    u8 x47a;                   // 0x47a
    u8 x47b;                   // 0x47b
    u8 x47c;                   // 0x47c
    u8 x47d;                   // 0x47d
    u8 x47e;                   // 0x47e
    u8 x47f;                   // 0x47f
    u8 x480;                   // 0x480
    u8 x481;                   // 0x481
    u8 x482;                   // 0x482
    u8 x483;                   // 0x483
    u8 x484[0x40];             // 0x484
    MnSlChrKOStar ko_stars[4]; // 0x4c4
};

struct VSMinorData
{
    u16 x0;
    u8 css_kind;   // 0 = VS
    u8 exit_kind;  // 1 = advance, 2 = leave
    void *ko_data; // used for displaying KO stars on CSS
    ScDataVS vs_data;
};
struct SSSMinorData
{
    u8 x0; // is made 0 upon entry
    u8 x1;
    u8 x2;
    u8 auto_random_stage; // is -1 if random stage in rules is disabled
    u8 exit_kind;         //  0 = back, 1 = advance
    ScDataVS vs_data;
};

/*** Variables ***/
MnSlChrData *stc_css_data;
VSMinorData **stc_css_minorscene;
u8 *stc_css_regtagnum; // number of registered tags
u8 *stc_css_49a7;
ArchiveInfo **stc_css_archive;
ArchiveInfo **stc_css_menuarchive;
u8 *stc_css_custom_rules;
GOBJ **stc_css_menugobj;
JOBJ **stc_css_menumodel;
CSSCursor **stc_css_cursors;
CSSPuck **stc_css_pucks;

u8 *stc_css_hmnport;
u8 *stc_css_cpuport;
u8 *stc_css_delay;
u8 *stc_css_maxply;
u8 *stc_css_singeplyport;
Text *stc_css_ply1_combo_text;
Text *stc_css_ply2_combo_text;
Text *stc_css_ply3_combo_text;
Text *stc_css_ply4_combo_text;
int *stc_css_bgtimer;
u8 *stc_css_hasreleasedb;
u8 *stc_css_exitkind;
u8 *stc_css_49a9;
MnSelectChrDataTable **stc_css_datatable;
COBJDesc **stc_css_cobjdesc;
GOBJ **stc_css_camgobj;
HSD_Pad *stc_css_pad;
u8 *stc_css_unkarr;

/*** Functions ***/
void MainMenu_CamRotateThink(GOBJ *gobj);
int MainMenu_GetPadDown(int controller_index);
int CSS_GetNametagRumble(int player, u8 tag);
void CSS_InitPlayerData(PlayerData *player);
void CSS_MenuModelThink(GOBJ *gobj);
void CSS_CursorThink(GOBJ *gobj);
void CSS_PuckThink(GOBJ *gobj);
void CSS_TagThink(GOBJ *gobj);
void CSS_UpdateRulesText();
void CSS_UpdateKOStars(int ply, int unk);
void CSS_StartThink(GOBJ *gobj);
int CSS_GetHandicapValue(int ply, int nametag_id);
void CSS_SetModeTexture(int css_kind);
int CSS_ReturnPuck(int ply);
int CSS_SetRandomFighter(int ply, int unk);
void CSS_UpdateCSP(int ply);
int CSS_GetCostumeNum(int ext_id);
void CSS_PlayFighterName(int ext_id);
void CSS_CostumeChange(int port, int button_down);
void CSS_UpdateCSPTexture(int port, int costume, int is_none);
#endif