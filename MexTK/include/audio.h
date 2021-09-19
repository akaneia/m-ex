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
