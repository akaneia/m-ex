#ifndef MEX_H_MEX
#define MEX_H_MEX

#include "structs.h"
#include "datatypes.h"
#include "obj.h"

#define DB_FLAG 0

enum MEX_GETDATA
{
    MXDT_FTINTNUM,
    MXDT_FTEXTNUM,
    MXDT_FTICONNUM,
    MXDT_FTICONDATA,
    MXDT_GRINTNUM,
    MXDT_GREXTNUM,
    MXDT_GRICONNUM,
    MXDT_GRICONDATA,
    MXDT_FTCOSTUMEARCHIVE,
    MXDT_GRDESC,         // gets GrDesc struct
    MXDT_GREXTLOOKUP,    // gets first stage external ID from internal ID
    MXDT_GRNAME,         // returns stage name char*
    MXDT_FTNAME,         // returns fighter name char*, indexed by external ID
    MXDT_FTDAT,          // returns pointer to fighter file struct, indexed by internal ID
    MXDT_FTKINDDESC,     // returns pointer to ftkind desc array, indexed by external ID
    MXDT_FTEMBLEMLOOKUP, // returns pointer to ftkind desc array, indexed by external ID
    MXDT_MEXDATA,
};

typedef enum SSMKind
{
    SSMKIND_CHAR,
    SSMKIND_STAGE,
} SSMKind;

/*** Structs ***/

struct Stc_icns
{
    u16 reserved_num;
    u16 stride;
    MatAnimJointDesc *matanimjoint;
    int custom_stock_num;
    void *custom_stock_descs;
};

struct MEXPlaylistEntry
{
    u16 bgm;
    u16 chance;
};
struct MEXPlaylist
{
    int entry_count;
    MEXPlaylistEntry *entries;
};

typedef struct MexMetaData
{
    u8 v_major;
    u8 v_minor;
    short flags;
    int internal_id_count;
    int external_id_count;
    int css_icon_count;
    int internal_stage_count;
    int external_stage_count;
    int sss_icon_count;
    int ssm_count;
    int bgm_count;
    int effect_count;
    int bootup_scene;
    int last_major;
    int last_minor;
    int trophy_count;
    int trophy_sd_offset;
} MexMetaData;

typedef struct MexMusicTable
{
    char ** filenames;
    MEXPlaylistEntry *menu_playlist;
    int menu_playlist_count;
    char ** labels;

} MexMusicTable;

typedef struct MexData
{
    MexMetaData *metadata;
    int *menu;
    int *fighter;
    int *fighter_function;
    int *ssm;
    MexMusicTable *music;
} MexData;


/*** Functions ***/
HSD_Archive *MEX_LoadRelArchive(char *file, void *functions, char *symbol);
void MEX_IndexFighterItem(int fighter_kind, ItemDesc *itemdesc, int item_id);
void SpawnMEXEffect(int effectID, int fighter, int arg1, int arg2, int arg3, int arg4, int arg5);
int MEX_GetFtItemID(GOBJ *f, int item_id);
int MEX_GetGrItemID(int item_id);
int MEX_GetSSMID(SSMKind ssm_kind, int kind); // ssm_kind, 0 = fighter, 1 = stage | kind is the c_kind / gr_kind
void SFX_PlayStageSFX(int sfx_id);            // use index relative to the ssm (start at 0)
void *calloc(int size);
MEXPlaylist *MEX_GetPlaylist();
//void KirbyStateChange(GOBJ *fighter, int state, float startFrame, float animSpeed, float animBlend);
void KirbyStateChange(float anim_start_frame, float anim_rate, float anim_blend, GOBJ *f, int state_id, int flags, GOBJ *alt_state_source);
void *MEX_GetKirbyCpData(int copy_id);
void *MEX_GetData(int index);
#endif