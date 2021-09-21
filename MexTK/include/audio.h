#ifndef MEX_H_AUDIO
#define MEX_H_AUDIO

#include "structs.h"
#include "datatypes.h"

typedef enum FGMGroup
{
    FGMGROUP_PERSIST,   // main, pokemon, nr_name, end
    FGMGROUP_ANNOUNCER, // nr_title, nr_select, nr_1p, nr_vs
    FGMGROUP_CHARACTER, // character ssms + null.ssm
    FGMGROUP_STAGE,     // stage ssms + last.ssm
    FGMGROUP_1P,        // ending, 1pend
} FGMGroup;

enum FGMID
{
    FGM_MAIN,
    FGM_POKEMON,
    FGM_NR_TITLE,
    FGM_NR_SELECT,
    FGM_NR_1P,
    FGM_NR_VS,
    FGM_CAPTAIN,
    FGM_CLINK,
    FGM_DK,
    FGM_DRMARIO,
    FGM_FALCO,
    FGM_FOX,
    FGM_GKOOPA,
    FGM_ICE,
    FGM_KIRBY,
    FGM_KOOPA,
    FGM_LINK,
    FGM_LUIGI,
    FGM_MARIO,
    FGM_MARS,
    FGM_MEWTWO,
    FGM_NESS,
    FGM_PEACH,
    FGM_PICHU,
    FGM_PIKACHU,
    FGM_PURIN,
    FGM_SAMUS,
    FGM_ZS,
    FGM_YOSHI,
    FGM_GW,
    FGM_GANON,
    FGM_EMBLEM,
    FGM_MHANDS,
    FGM_KIRBYTM,
    FGM_CASTLE,
    FGM_CORNERIA,
    FGM_GREATBAY,
    FGM_KONGO,
    FGM_MUTECITY,
    FGM_ONETT,
    FGM_ZEBES,
    FGM_GARDEN,
    FGM_KLAID,
    FGM_GREEN,
    FGM_VENOM,
    FGM_BIGBLUE,
    FGM_FOURSIDE,
    FGM_PUPUPU,
    FGM_PSTADIUM,
    FGM_1PADV,
    FGM_ENDING,
    FGM_NR_NAME,
    FGM_1PEND,
    FGM_LAST,
    FGM_END,
    FGM_NULL,
};

char *Nametag_GetText(int tag_index);
void Audio_ResetCache(int group_index);
void Audio_QueueFileLoad(int group_index, u64 ssm_index);
void Audio_UpdateCache();
void Audio_RequestSSMLoad(int ssm_id);
void Audio_SyncLoadAll();
void BGM_DecideMenuBGM();
int BGM_GetMenuBGM();
void BGM_Play(int hpsID);
int FGM_CheckActive(int fgm_id);
void FGM_Stop(int fgm_id);

#endif
