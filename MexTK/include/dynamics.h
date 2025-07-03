#ifndef MEX_H_DYNAMICS
#define MEX_H_DYNAMICS

#include "structs.h"
#include "obj.h"
#include "useful.h"

/*** Structs ***/

struct DynamicBoneset
{
    DynamicBoneData *data; // is stored @ 8000fdd4, comes from a nonstandard heap @ -0x52fc(r13)
    int bone_num;          // number of bones in this boneset
    float x8;              // stored @ 80011718, 0x8 of dynamicdesc
    float xc;              // stored @ 80011720, 0xC of dynamicdesc
    float x10;             // stored @ 80011728, 0x10 of dynamicdesc
};

struct ftDynamics
{
    int dynamics_num;                   // number of dynamic bonesets for this fighter
    DynamicsDesc *dynamics_desc;        // boneset data array (one for each boneset)
    int dynamics_hit_num;               // (no collide bubbles), max is 11
    DynamicsHitDesc *dynamics_hit_desc; // dynamic hit data array (one for each dynamic hit)
    DynamicsBehave **dynamics_behave;   // pointer to an array of dynamics behavior pointers.
};

struct DynamicBoneData
{
    JOBJ *jobj;            // 0x0
    Vec4 rot;              // 0x4 quaternion
    Vec3 trans;            // 0x14
    Vec3 scale;            // 0x20
    Vec3 world_position;   // 0x2C, copied from 0x50, 0x60, 0x70 of jobj
    Vec3 rot_axis;         // 0x40, initialized to 0 @ 8000ff38
    float rot_momentum;    // 0x44, initialized to 0 @ 8000ff3c
    float length;          // x48, initialized to 0 @ 8000ff44

    float x4c;             // x4c, THIS IS THE START OF A STRUCTURE, bunch of floats from the dynamicdesc. stored @ 80011744
    float x50;             // 0x3c
    int direction;         // 0x40
    Vec4 rot_orig;         // 0x58
    float rot_limit;       // 0x40
    Vec3 max_rot;          // 0x44
    Vec3 min_rot;         // 0x3c
    float x84;             // x048
    float x88;             // 0x38
    float x8c;             // 0x3c
    DynamicBoneData *next; // 0x90
    int x94;               // 0x44
};

struct DynamicHit
{
    Vec3 offset;    // 0x1670, 0x0
    float size;     // 0x167C, 0xC
    JOBJ *bone;     // 0x1680, 0x10
    int x14;        // 0x1684, 0x14
    Vec3 pos;       // 0x1688, 0x18
    int bone_index; // 0x1694, 0x24
};

struct DynamicForceDesc
{
    u8 x0;        // 0x0
    u8 x1;        // 0x1
    float x4;     // 0x4
    Vec3 pos;     // 0x8
    float x14;    // 0x14
    float x18;    // 0x18
    float x1c;    // 0x1c
    float radius; // 0x20
    float decay;  // 0x24
    int lifetime; // 0x28, is decremented
    float x2c;    // 0x2c
};

struct DynamicForce
{
    DynamicForceDesc desc; // 0x0
    int timer;             // 0x30, counts up
    DynamicForce *next;    // 0x34
};

static DynamicForce **stc_dynamic_force = 0x804d63b0;            // -0x52f0
static DynamicForce **stc_dynamic_force_next_alloc = 0x804d63ac; // -0x52f4

void Dynamics_InitBones(JOBJ *joint, DynamicBoneset *boneset, int bone_num);
void Dynamics_InitParams(void *dyn_desc_params, DynamicBoneset *boneset);
void Dynamics_UpdateBoneset(DynamicBoneset *boneset, float f1, DynamicHit *dynamics_hit, int dynamics_hit_num, int r6, int r7, int r8, int r9); // 8001044c
void Dynamics_FreeBones(DynamicBoneset *boneset);
void Dynamics_InitForce();
DynamicForce *Dynamics_CreateForce(DynamicForceDesc *);
void Dynamics_DecayWind();
#endif
