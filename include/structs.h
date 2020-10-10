#ifndef MEX_H_STRUCTS
#define MEX_H_STRUCTS

/* 
 *  defines typedefs for structs used throughout m-ex
 */

// Basic Data Structs
typedef struct Vec2 Vec2;
typedef struct Vec3 Vec3;
typedef struct Vec4 Vec4;

// OBJ
typedef struct GOBJ GOBJ;
typedef struct GOBJProc GOBJProc;
typedef struct GOBJList GOBJList;
typedef struct GXList GXList;
typedef struct JOBJ JOBJ;
typedef struct JOBJDesc JOBJDesc;
typedef struct DOBJ DOBJ;
typedef struct TOBJ TOBJ;
typedef struct AOBJ AOBJ;
typedef struct MOBJ MOBJ;
typedef struct WOBJ WOBJ;
typedef struct COBJ COBJ;
typedef struct COBJDesc COBJDesc;

// Archive
typedef struct ArchiveInfo ArchiveInfo;
typedef struct MapHead MapHead;

// Stage
typedef struct Stage Stage;
typedef struct map_gobjData map_gobjData;
typedef struct map_gobjDesc map_gobjDesc;
typedef struct StageFile StageFile;

// Match
typedef struct MatchInit MatchInit;
typedef struct Match Match;
typedef struct MatchHUD MatchHUD;
typedef struct MatchCamera MatchCamera;
typedef struct CameraBox CameraBox;

// Text
typedef struct Text Text;
typedef struct TextAllocInfo TextAllocInfo;

// DevText
typedef struct DevText DevText;

// Effects
typedef struct Effect Effect;
typedef struct Particle Particle;
typedef struct Particle2 Particle2;
typedef struct GeneratorAppSRT GeneratorAppSRT;

// Color
typedef struct GXColor GXColor;
typedef struct ColorOverlay ColorOverlay;

// Item
typedef struct ItemData ItemData;
typedef struct ItemState ItemState;
typedef struct SpawnItem SpawnItem;
typedef struct itData itData;
typedef struct itCommonAttr itCommonAttr;
typedef struct itHit itHit;

// Boneset
typedef struct DynamicBoneset DynamicBoneset;

// Fighter
typedef struct FighterData FighterData;
typedef struct FighterBone FighterBone;
typedef struct Playerblock Playerblock;
typedef struct PlayerData PlayerData;
typedef struct MoveLogic MoveLogic;
typedef struct SubactionHeader SubactionHeader;
typedef struct ftHit ftHit;
typedef struct Hurtbox Hurtbox;
typedef struct Reflect Reflect;
typedef struct CPU CPU;
typedef struct ftData ftData;
typedef struct ftCommonData ftCommonData;
typedef struct ftChkDevice ftChkDevice;
typedef struct FtParts FtParts;
typedef struct FtPartsDesc FtPartsDesc;
typedef struct FtDOBJUnk FtDOBJUnk;
typedef struct FtPartsLookup FtPartsLookup;
typedef struct FtDOBJUnk2 FtDOBJUnk2;
typedef struct FtDOBJUnk3 FtDOBJUnk3;

// CSS
typedef struct CSSBackup CSSBackup;

// Memcard
typedef struct Memcard Memcard;

// Collision
typedef struct CollData CollData;
typedef struct ECBBones ECBBones;
typedef struct DmgHazard DmgHazard;

// HSD
typedef struct HSD_Material HSD_Material;
typedef struct HSD_Pad HSD_Pad;
typedef struct HSD_Pads HSD_Pads;
typedef struct HSD_Update HSD_Update;
typedef struct HSD_ObjAllocData HSD_ObjAllocData;

// Scene
typedef struct MajorScene MajorScene;
typedef struct MinorScene MinorScene;
typedef struct ScDataVS ScDataVS;
typedef struct ScDataRst ScDataRst;

// Results
typedef struct RstPlayer RstPlayer;
typedef struct RstInit RstInit;

// Preload
typedef struct Preload Preload;
typedef struct PreloadChar PreloadChar;

// Kirby
typedef struct FtVarKirby FtVarKirby;

// Custom
typedef struct PRIM PRIM;
typedef struct MEXPlaylist MEXPlaylist;
typedef struct Translation Translation;

#endif