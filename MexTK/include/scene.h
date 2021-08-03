#ifndef MEX_H_SCENE
#define MEX_H_SCENE

#include "structs.h"
#include "datatypes.h"
#include "match.h"
#include "result.h"

// Scene Enums
enum HEAP_KIND
{
    HEAPKIND_UNK0,
    HEAPKIND_UNK1,
    HEAPKIND_UNK2,
    HEAPKIND_UNK3,
    HEAPKIND_UNK4,
};
enum MINOR_KIND
{
    MNRKIND_TITLE,     // Title Screen
    MNRKIND_MNMA,      // Main Menu
    MNRKIND_MATCH,     // VS Dairantou (In-Game)
    MNRKIND_SUDDEATH,  // Sudden Death Dairantou (In-Game)
    MNRKIND_TRAIN,     // Training Mode Dairantou (In-Game)
    MNRKIND_RST,       // Result Screen
    MNRKIND_X6,        //
    MNRKIND_DB,        // Debug Menu
    MNRKIND_CSS,       // CSS
    MNRKIND_SSS,       // SSS
    MNRKIND_XA,        //
    MNRKIND_TYGAL,     // Trophy Gallery
    MNRKIND_TYLOT,     // Trophy Lottery
    MNRKIND_TYCOL,     // Trophy Collection
    MNRKIND_ADVSPLSH,  // Adventure Mode Splash Screen
    MNRKIND_TYFALL,    // 1P Mode Trophy Falling Cutscene
    MNRKIND_ADVCGRT,   // Adventure Mode Congratulations
    MNRKIND_VI1,       // VisualScene_Luigi
    MNRKIND_VI2,       // VisualScene_BrinstarLava
    MNRKIND_VI3,       // VisualScene_PlanetExplode
    MNRKIND_VI4,       // VisualScene_3KirbysSpawn
    MNRKIND_VI5,       // VisualScene_GiantKirbySpawns
    MNRKIND_VI6,       // VisualScene_StarFoxDialog
    MNRKIND_VI7,       // VisualScene_FZeroRace
    MNRKIND_VI8,       // VisualScene_MetalMarioLuigi
    MNRKIND_VI9,       // VisualScene_BowserTrophyFalls
    MNRKIND_VI10,      // VisualScene_GigaBowserTransformation
    MNRKIND_VI11,      // VisualScene_GigaBowserDefeated
    MNRKIND_OP,        // Opening Movie
    MNRKIND_1PENDMV,   // 1P Mode End Movie
    MNRKIND_HOWMV,     // How to Play Movie
    MNRKIND_OMAKE,     // Special Movie
    MNRKIND_CLSCSPLSH, // TEST
    MNRKIND_ALSPLSH,   // TEST
    MNRKIND_GMOV,      // Game over
    MNRKIND_SOON,      // coming soon
    MNRKIND_TOSETUP,   // tournament setup
    MNRKIND_TOBRCK,    // tourn bracket
    MNRKIND_TOUNK,     // tourn unk
    MNRKIND_SPCLMSG,   // special msg
    MNRKIND_PROG,      // progressive
    MNRKIND_CHLG,      // challenger
    MNRKIND_CARD,      // memcard prompt
    MNRKIND_STAFF,     // credits
    MNRKIND_CAMWARN,   // camera mode memcard prompt
    MNRKIND_NULL,      // terminator
};
enum MAJOR_KIND
{
    MJRKIND_TITLE,        // Title Screen
    MJRKIND_MNMA,         // Main Menu
    MJRKIND_VS,           //
    MJRKIND_CLASSIC,      //
    MJRKIND_ADV,          //
    MJRKIND_ALLSTAR,      //
    MJRKIND_DBG,          //
    MJRKIND_DBGSOUND,     //
    MJRKIND_HANYUTESTCSS, //
    MJRKIND_HANYUTESTSSS, //
    MJRKIND_CAMWARN,      // camera mode memcard prompt
    MJRKIND_TYGAL,        // Trophy Gallery
    MJRKIND_TYLOT,        // Trophy Lottery
    MJRKIND_TYCOL,        // Trophy Collection
    MJRKIND_DBGFIGHT,     //
    MJRKIND_TARGETS,      //
    MJRKIND_VSSUDDEATH,   //
    MJRKIND_VSINVIS,      //
    MJRKIND_VSSLOW,       //
    MJRKIND_VSFAST,       //
    MJRKIND_CHLG,         // Challenger Approaching
    MJRKIND_CLSCEND,      //
    MJRKIND_ADVEND,       //
    MJRKIND_ALLSTAREND,   //
    MJRKIND_OP,           //
    MJRKIND_VIS,          // Visual Scene (cutscene)
    MJRKIND_DBGEND,       // Debug 1P Ending
    MJRKIND_TOURN,        //
    MJRKIND_TRAIN,        //
    MJRKIND_VSTINY,       //
    MJRKIND_VSGIANT,      //
    MJRKIND_VSSTAMINA,    //
    MJRKIND_HOMERUN,      //
    MJRKIND_10MAN,        //
    MJRKIND_100MAN,       //
    MJRKIND_3MIN,         //
    MJRKIND_15MIN,        //
    MJRKIND_ENDLESS,      //
    MJRKIND_CRUEL,        //
    MJRKIND_PROG,         // Progressive prompt
    MJRKIND_BOOT,         //
    MJRKIND_CARD,         // Memcard prompt
    MJRKIND_VSFIXEDCAM,   //
    MJRKIND_EVENT,        //
    MJRKIND_VSSNGLBTN,    //
    MJRKIND_NULL,         // terminator
};

struct MajorScene
{
    u8 is_preload;
    u8 major_id;
    void *onLoad;
    void *onExit;
    void *onBoot;
    void *MinorScene; // array of minor scenes
};
struct MinorScene
{
    u8 minor_id;        // is 255 for last entry
    u8 heap_kind;       // heap behavior
    void *minor_prep;   // inits data for this minor (major exclusive)
    void *minor_decide; // decides next minor scene
    u8 minor_kind;      // index for a re-useable list of scene functions. contains a load, think, and leave function.
    void *load_data;    // points to static data used throughout this minor. other minors may use the same pointer to exchange data between minors
    void *unload_data;  // points to static data used throughout this minor. other minors may use the same pointer to exchange data between minors
};

struct SceneInfo
{
    u8 major_curr; // 0x0
    u8 major_next; // 0x1
    u8 major_prev; // 0x2
    u8 minor_curr; // 0x3
    u8 minor_next; // 0x4
    u8 minor_prev; // 0x5
};

struct ScDataVS
{
    u8 x8;
    u8 x9;
    u8 xa;
    int xc;
    MatchInit match_init;
};

struct ScDataRst
{
    int x0;
    int x4;
    int x8;
    int xc;
    RstInit rst_init;
};

/*** Static Variables ***/
SceneInfo *stc_scene_info = 0x80479D30;

/*
Scene Change Notes

MinorThink: run Scene_ExitMinor to execute Scene_Decide
SceneDecide: run either Scene_SetNextMinor to enter another minor, OR Scene_SetNextMajor then Scene_ExitMajor to enter another major
*/

u8 Scene_GetCurrentMajor();
u8 Scene_GetCurrentMinor();
void Scene_SetNextMajor(int major_id); // run this in scene decide!
void Scene_ExitMajor();                // run this to cause a major scene change, usually ran in scene decide!
void Scene_SetNextMinor(int minor_id); // run this in scene decide!
void Scene_ExitMinor();                // run this to cause a minor scene change, usually ran in scene think!
void CSS_DecideNext(MinorScene *minor_scene, ScDataVS *css_data);
void CSS_ResetKOStars();
void CSS_InitMajorData(ScDataVS *major_data);
void CSS_InitMinorData(MinorScene *minor_scene, ScDataVS *major_data, int css_kind);
void SSS_InitMinorData(MinorScene *minor_scene, ScDataVS *major_data);
void SSS_DecideNext(MinorScene *minor_scene, ScDataVS *css_data, int exit_minor_id);
void Match_InitMinorData(MinorScene *minor_scene, ScDataVS *major_data, void *init_cb, void *startmelee_cb);
void Match_SetNametags(MatchInit *match_init);
#endif
