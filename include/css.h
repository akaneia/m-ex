#ifndef MEX_H_CSS
#define MEX_H_CSS

#include "structs.h"
#include "datatypes.h"
#include "fighter.h"

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
    JOBJAnimSet bg;
    JOBJDesc *hand_model;
    void *hand_matanim;
    JOBJDesc *puck_model;
    void *puck_matanim;
    JOBJDesc *vsmenu_model;
    void *vsmenu_animjoint;
    void *vsmenu_matanim;
    JOBJDesc *start_model;
    void *start_animjoint;
    void *start_matanim;
    JOBJDesc *camdoor_model;
    void *camdoor_matanim;
    JOBJDesc *solomenu_model;
    void *solomenu_animjoint;
    void *solomenu_matanim;
    JOBJDesc *solooption_model;
    JOBJDesc *cpudoor_model;
    void *cpudoor_matanim;
};

/*** Variables ***/
static u8 *stc_css_hmnport = R13 + (-0x4DB0);
static u8 *stc_css_cpuport = R13 + (-0x49AF);
static u8 *stc_css_delay = R13 + (-0x49AE);
static u8 *stc_css_maxply = R13 + (-0x49AB);
static u8 *stc_css_singeplyport = R13 + (-0x4DE0);
static u8 *stc_css_49f0 = R13 + (-0x49f0);
static int *stc_css_49c0 = R13 + (-0x49c0);
static int *stc_css_49c4 = R13 + (-0x49c4);
static int *stc_css_49b8 = R13 + (-0x49b8);
static int *stc_css_49bc = R13 + (-0x49bc);
static u8 *stc_css_49ad = R13 + (-0x49ad);
static u8 *stc_css_leavekind = R13 + (-0x49aa);
static MnSelectChrDataTable **stc_css_datatable = R13 + (-0x49EC);
static COBJDesc **stc_css_cobjdesc = R13 + (-0x4ADC);
static GOBJ **stc_css_camgobj = R13 + (-0x49E8);

/*** Functions ***/
int (*CSS_GetNametagRumble)(int player, u8 tag) = (void *)0x801677f8;
void (*CSS_InitPlayerData)(PlayerData *player) = (void *)0x8016795c;
void (*CSS_CameraRotateThink)(GOBJ *gobj) = (void *)0x8022ba1c;

#endif