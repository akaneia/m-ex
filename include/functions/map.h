#ifndef MEX_H_FN_MAP
#define MEX_H_FN_MAP

Stage *(*Stage_GetStageInfo)() = (void *)0x801c6324;
void (*Stage_AddFtChkDevice)(GOBJ *map, int hazard_kind, void *check) = (void *)0x800c07f8;
void (*Stage_SetChkDevicePos)(float y_pos) = (void *)0x801c438c;
void (*Stage_GetChkDevicePos)(float *y_pos, float *y_delta) = (void *)0x801c4368;
float (*Stage_GetScale)() = (void *)0x801c0498;
int *(*Stage_GetYakumonoParam)() = (void *)0x801c49f8;
void (*Stage_MapStateChange)(GOBJ *map, int map_gobjID, int anim_id) = (void *)0x801c8138;
void (*Dynamics_DecayWind)() = (void *)0x800115f4;
GOBJ *(*Stage_CreateMapGObj)(int mapgobjID) = (void *)0x80223908;
void *(*GXLink_Stage)(GOBJ *gobj, int pass) = (void *)0x801c5db0;
GOBJ *(*Stage_GetMapGObj)(int mapgobjID) = (void *)0x801c2ba4;
JOBJ *(*Stage_GetMapGObjJObj)(GOBJ *mapgobj, int jointIndex) = (void *)0x801c3fa4;
int (*Stage_GetLinesGroup)(int line) = (void *)0x80056b6c;
int (*Stage_GetLinesDirection)(int line) = (void *)0x80054c6c;
void (*Stage_SetGroundCallback)(int line, void *userdata, void *callback) = (void *)0x800580c8;
void (*Stage_SetCeilingCallback)(int line, void *userdata, void *callback) = (void *)0x800581a4;
void (*Stage_InitMovingColl)(JOBJ *mapjoint, int mapgobjID) = (void *)0x801c2ed0;
void (*Stage_UpdateMovingColl)(GOBJ *mapgobj) = (void *)0x801c2fe0;
Particle *(*Stage_SpawnEffectPos)(int gfxID, int efFileID, Vec3 *pos) = (void *)0x801c96f8;
Particle *(*Stage_SpawnEffectJointPos)(int gfxID, int efFileID, JOBJ *pos) = (void *)0x801c97dc;
Particle *(*Stage_SpawnEffectJointPos2)(int gfxID, int efFileID, JOBJ *pos) = (void *)0x801c9808;
int (*Stage_RaycastGround)(Vec3 *coll_pos, int *line_index, int *line_kind, Vec3 *unk1, Vec3 *unk2, Vec3 *unk3, Vec3 *unk4, void *cb, float fromX, float fromY, float toX, float toY, float unk5) = (void *)0x8004f008; // make unk5 = 0 and the other unk's = -1

#endif