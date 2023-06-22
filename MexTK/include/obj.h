#ifndef MEX_H_OBJ
#define MEX_H_OBJ

#include "structs.h"
#include "datatypes.h"
#include "gx.h"

// JObj Flags
#define JOBJ_SKELETON (1 << 0)
#define JOBJ_SKELETON_ROOT (1 << 1)
#define JOBJ_ENVELOPE_MODEL (1 << 2)
#define JOBJ_CLASSICAL_SCALING (1 << 3)
#define JOBJ_HIDDEN (1 << 4)
#define JOBJ_PTCL (1 << 5)
#define JOBJ_MTX_DIRTY (1 << 6)
#define JOBJ_LIGHTING (1 << 7)
#define JOBJ_TEXGEN (1 << 8)
#define JOBJ_BILLBOARD (1 << 9)
#define JOBJ_VBILLBOARD (2 << 9)
#define JOBJ_HBILLBOARD (3 << 9)
#define JOBJ_RBILLBOARD (4 << 9)
#define JOBJ_INSTANCE (1 << 12)
#define JOBJ_PBILLBOARD (1 << 13)
#define JOBJ_SPLINE (1 << 14)
#define JOBJ_FLIP_IK (1 << 15)
#define JOBJ_SPECULAR (1 << 16)
#define JOBJ_USE_QUATERNION (1 << 17)
#define JOBJ_OPA (1 << 18)
#define JOBJ_XLU (1 << 19)
#define JOBJ_TEXEDGE (1 << 20)
#define JOBJ_NULL (0 << 21)
#define JOBJ_JOINT1 (1 << 21)
#define JOBJ_JOINT2 (2 << 21)
#define JOBJ_EFFECTOR (3 << 21)
#define JOBJ_USER_DEFINED_MTX (1 << 23)
#define JOBJ_MTX_INDEPEND_PARENT (1 << 24)
#define JOBJ_MTS_INDEPEND_SRT (1 << 25)
#define JOBJ_GENERALFLAG (1 << 26)
#define JOBJ_GENERALFLAG2 (1 << 27)
#define JOBJ_ROOT_OPA (1 << 28)
#define JOBJ_ROOT_XLU (1 << 29)
#define JOBJ_ROOT_TEXEDGE (1 << 30)
#define JOBJ_31 (1 << 31)

// MObj Flags
#define JOBJ_ANIM 0x1
#define MOBJ_ANIM 0x4
#define TOBJ_ANIM 0x10
#define ALL_ANIM 0x7FF
#define HSD_A_M_AMBIENT_R 1
#define HSD_A_M_AMBIENT_G 2
#define HSD_A_M_AMBIENT_B 3
#define HSD_A_M_DIFFUSE_R 4
#define HSD_A_M_DIFFUSE_G 5
#define HSD_A_M_DIFFUSE_B 6
#define HSD_A_M_SPECULAR_R 7
#define HSD_A_M_SPECULAR_G 8
#define HSD_A_M_SPECULAR_B 9
#define HSD_A_M_ALPHA 10
#define HSD_A_M_PE_REF0 11
#define HSD_A_M_PE_REF1 12
#define HSD_A_M_PE_DSTALPHA 13
#define RENDER_DIFFUSE_SHIFT 0
#define RENDER_DIFFUSE_BITS (3 << RENDER_DIFFUSE_SHIFT)
#define RENDER_DIFFUSE_MAT0 (0 << RENDER_DIFFUSE_SHIFT)
#define RENDER_DIFFUSE_MAT (1 << RENDER_DIFFUSE_SHIFT)
#define RENDER_DIFFUSE_VTX (2 << RENDER_DIFFUSE_SHIFT)
#define RENDER_DIFFUSE_BOTH (3 << RENDER_DIFFUSE_SHIFT)
#define RENDER_CONSTANT (1 << 0)
#define RENDER_VERTEX (1 << 1)
#define RENDER_DIFFUSE (1 << 2)
#define RENDER_SPECULAR (1 << 3)
#define CHANNEL_FIELD (RENDER_CONSTANT | RENDER_VERTEX | RENDER_DIFFUSE | RENDER_SPECULAR)
#define RENDER_TEX0 (1 << 4)
#define RENDER_TEX1 (1 << 5)
#define RENDER_TEX2 (1 << 6)
#define RENDER_TEX3 (1 << 7)
#define RENDER_TEX4 (1 << 8)
#define RENDER_TEX5 (1 << 9)
#define RENDER_TEX6 (1 << 10)
#define RENDER_TEX7 (1 << 11)
#define RENDER_TEXTURES (RENDER_TEX0 | RENDER_TEX1 | RENDER_TEX2 | RENDER_TEX3 | RENDER_TEX4 | RENDER_TEX5 | RENDER_TEX6 | RENDER_TEX7)
#define RENDER_TOON (1 << 12)
#define RENDER_ALPHA_SHIFT 13
#define RENDER_ALPHA_BITS (3 << RENDER_ALPHA_SHIFT)
#define RENDER_ALPHA_COMPAT (0 << RENDER_ALPHA_SHIFT)
#define RENDER_ALPHA_MAT (1 << RENDER_ALPHA_SHIFT)
#define RENDER_ALPHA_VTX (2 << RENDER_ALPHA_SHIFT)
#define RENDER_ALPHA_BOTH (3 << RENDER_ALPHA_SHIFT)
#define RENDER_SHADOW (1 << 26)
#define RENDER_ZMODE_ALWAYS (1 << 27)
#define RENDER_NO_ZUPDATE (1 << 29)
#define RENDER_XLU (1 << 30)

// DOBJ flags
#define DOBJ_HIDDEN 1

// AOBJ flags
#define AOBJ_REWINDED (1 << 26)   // 0x04000000
#define AOBJ_FIRST_PLAY (1 << 27) // 0x08000000
#define AOBJ_NO_UPDATE (1 << 28)  // 0x10000000
#define AOBJ_LOOP (1 << 29)       // 0x20000000
#define AOBJ_NO_ANIM (1 << 30)    // 0x40000000

// LOBJ flags
#define LOBJ_AMBIENT (0 << 0)
#define LOBJ_INFINITE (1 << 0)
#define LOBJ_POINT (2 << 0)
#define LOBJ_SPOT (3 << 0)
#define LOBJ_DIFFUSE (1 << 2)
#define LOBJ_SPECULAR (1 << 3)
#define LOBJ_ALPHA (1 << 4)
#define LOBJ_HIDDEN (1 << 5)
#define LOBJ_RAW_PARAM (1 << 6)
#define LOBJ_DIFF_DIRTY (1 << 7)
#define LOBJ_SPEC_DIRTY (1 << 8)

// Macro
#define JOBJ_PauseOnFrame(jobj, child_index, flags, frame)                    \
    {                                                                         \
        JOBJ *this_jobj;                                                      \
        if (child_index != 0)                                                 \
            JOBJ_GetChild(jobj, &this_jobj, child_index, -1);                 \
        else                                                                  \
            this_jobj = jobj;                                                 \
        JOBJ_ForEachAnim(this_jobj, 6, flags, AOBJ_ReqAnim, 1, (float)frame); \
        JOBJ_AnimAll(this_jobj);                                              \
        JOBJ_ForEachAnim(this_jobj, 6, flags, AOBJ_StopAnim, 6, 0, 0);        \
    }
#define JOBJ_PlayOnFrame(jobj, child_index, flags, frame)                     \
    {                                                                         \
        JOBJ *this_jobj;                                                      \
        if (child_index != 0)                                                 \
            JOBJ_GetChild(jobj, &this_jobj, child_index, -1);                 \
        else                                                                  \
            this_jobj = jobj;                                                 \
        JOBJ_ForEachAnim(this_jobj, 6, flags, AOBJ_ReqAnim, 1, (float)frame); \
        JOBJ_AnimAll(this_jobj);                                              \
    }
#define JOBJ_GetChildPosition(jobj, child_index, pos)         \
    {                                                         \
        JOBJ *this_jobj;                                      \
        if (child_index != 0)                                 \
            JOBJ_GetChild(jobj, &this_jobj, child_index, -1); \
        else                                                  \
            this_jobj = jobj;                                 \
        JOBJ_GetWorldPosition(this_jobj, 0, pos);             \
    }

/*** Structs ***/

struct HSD_Obj
{
    void *parent;
    s16 ref_count;
    s16 ref_count_individual;
};

struct GOBJ
{
    short entity_class;      // 0x0
    char p_link;             // 0x2
    char gx_link;            // 0x3. 0-63 are gx. 64+ are reserved for camera objects
    char p_priority;         // 0x4
    char gx_pri;             // 0x5
    char obj_kind;           // 0x6
    char data_kind;          // 0x7
    GOBJ *next;              // 0x8
    GOBJ *previous;          // 0xC
    GOBJ *nextOrdered;       // 0x10
    GOBJ *previousOrdered;   // 0x14
    GOBJProc *proc;          // 0x18
    void (*gx_cb)();         // 0x1C
    u64 cobj_links;          // 0x20. this is used to know which cobj to render to
    void *hsd_object;        // 0x28
    void *userdata;          // 0x2C
    int destructor_function; // 0x30
    int unk_linked_list;     // 0x34
};

struct GOBJProc
{
    GOBJ *parent;
    GOBJProc *next;
    GOBJProc *prev;
    char s_link;            // 0xC
    char flags;             // 0xD
    GOBJ *parentGOBJ;       // 0x10
    void (*cb)(GOBJ *gobj); // function callback
};

struct GOBJList
{
    // pointed to @ -0x3e74(r13)
    // indexed by p_link
    GOBJ *x0;
    GOBJ *x4;
    GOBJ *x8;
    GOBJ *xc;
    GOBJ *x10;
    GOBJ *cobj;
    GOBJ *x18;
    GOBJ *x1c;
    GOBJ *fighter;
    GOBJ *item;
    GOBJ *x28;
    GOBJ *effect; // 0x2c
    GOBJ *ptcl;   // 0x30, used for blastzone effect
    GOBJ *x34;
    GOBJ *x38;
    GOBJ *x3c;
    GOBJ *x40;
    GOBJ *x44;
    GOBJ *match_cam; // 0x48, used for the match camera and shake gobjs
};

struct GXList
{
    // pointed to @ -0x3e80(r13)
    GOBJ *gx_render[63]; // pointer to 63 gobjs
    GOBJ *gx_camera;     // pointer to the highest priority cobj gobj. they are linked together via the next member.
};

struct TOBJ
{
    HSD_Obj parent;
    TOBJ *next;
    u32 id;                           //GXTexMapID
    u32 src;                          //GXTexGenSrc 0x10
    u32 mtxid;                        // 0x14
    Vec4 rotate;                      // 0x18
    Vec3 scale;                       // 0x28
    Vec3 translate;                   // 0x34
    u32 wrap_s;                       // 0x40 GXTexWrapMode
    u32 wrap_t;                       // 0x44 GXTexWrapMode
    u8 repeat_s;                      // 0x48
    u8 repeat_t;                      // 0x49
    u16 anim_id;                      // 0x4A
    u32 flags;                        // 0x4C
    f32 blending;                     // 0x50
    u32 magFilt;                      // 0x54 GXTexFilter
    struct _HSD_ImageDesc *imagedesc; // 0x58
    struct _HSD_Tlut *tlut;           // 0x5C
    struct _HSD_TexLODDesc *lod;      // 0x60
    AOBJ *aobj;                       // 0x64
    struct _HSD_ImageDesc **imagetbl;
    struct _HSD_Tlut **tluttbl;
    int tlut_no;
    Mtx mtx;
    u32 coord; //GXTexCoordID
    struct _HSD_TObjTev *tev;
};

struct AOBJ
{
    u32 flags;
    f32 curr_frame;
    f32 rewind_frame;
    f32 end_frame;
    f32 framerate;
    struct _HSD_FObj *fobj;
    struct _HSD_Obj *hsd_obj;
};

struct MOBJ
{
    int *parent;
    u32 rendermode;
    TOBJ *tobj;             // 0x8
    HSD_Material *mat;      // 0xC
    struct _HSD_PEDesc *pe; // 0x10
    AOBJ *aobj;             // 0x14
    /*
    struct _HSD_TObj *ambient_tobj;
    struct _HSD_TObj *specular_tobj;
    */
    struct _HSD_TExpTevDesc *tevdesc;
    union _HSD_TExp *texp;

    struct _HSD_TObj *tobj_toon;
    struct _HSD_TObj *tobj_gradation;
    struct _HSD_TObj *tobj_backlight;
    f32 z_offset;
};

struct JOBJDesc
{
    char *class_name;       //0x00
    u32 flags;              //0x04
    struct JOBJDesc *child; //0x08
    struct JOBJDesc *next;  //0x0C
    union
    {
        struct _HSD_DObjDesc *dobjdesc;
        struct _HSD_Spline *spline;
        struct _HSD_SList *ptcl;
    } u;                            //0x10
    Vec3 rotation;                  //0x14 - 0x1C
    Vec3 scale;                     //0x20 - 0x28
    Vec3 position;                  //0x2C - 0x34
    Mtx mtx;                        //0x38
    struct _HSD_RObjDesc *robjdesc; //0x3C
};

struct MatAnimJointDesc
{
    MatAnimJointDesc *child;
    MatAnimJointDesc *next;
    void *matanim;
};

struct COBJDesc
{
    char *class_name;                    //0x00
    u16 flags;                           //0x04
    u16 projection_type;                 //0x06
    u16 viewport_left;                   //0x08
    u16 viewport_right;                  //0x0A
    u16 viewport_top;                    //0x0C
    u16 viewport_bottom;                 //0x0E
    u32 scissor_lr;                      //0x10
    u32 scissor_tb;                      //0x14
    struct _HSD_WObjDesc *eye_desc;      //0x18
    struct _HSD_WObjDesc *interest_desc; //0x1C
    f32 roll;                            //0x20
    Vec3 *vector;                        //0x24
    f32 near;                            //0x28
    f32 far;                             //0x2C
    union
    {
        struct
        {
            f32 fov;
            f32 aspect;
        } perspective;

        struct
        {
            f32 top;
            f32 bottom;
            f32 left;
            f32 right;
        } frustrum;

        struct
        {
            f32 top;
            f32 bottom;
            f32 left;
            f32 right;
        } ortho;
    } projection_param;
};

struct DOBJ
{
    int parent;
    DOBJ *next; //0x04
    MOBJ *mobj; //0x08
    int *pobj;  //0x0C
    AOBJ *aobj; //0x10
    u32 flags;  //0x14
    u32 unk;
};

struct JOBJ
{
    int hsd_info;     // 0x0
    int class_parent; // 0x4
    JOBJ *sibling;    // 0x08
    JOBJ *parent;     // 0x0C
    JOBJ *child;      // 0x10
    int flags;        // 0x14
    DOBJ *dobj;       // 0x18
    Vec4 rot;         // 0x1C 0x20 0x24 0x28
    Vec3 scale;       // 0x2C
    Vec3 trans;       // 0x38
    Mtx rotMtx;       // 0x44
    Vec3 *VEC;        // 0x6C
    Mtx *MTX;         // 0x78
    AOBJ *aobj;       // 0x7C
    int *RObj;
    JOBJDesc *desc;
};

struct WOBJ
{
    HSD_Obj parent;
    u32 flags;  //0x08
    Vec3 pos;   //0xC
    AOBJ *aobj; //0x18
    void *robj; //0x1C
};

struct COBJ
{
    HSD_Obj parent;      // 0x0
    u32 flags;           //0x08
    f32 viewport_left;   //0x0C
    f32 viewport_right;  //0x10
    f32 viewport_top;    //0x14
    f32 viewport_bottom; //0x18
    u16 scissor_left;    //0x1C
    u16 scissor_right;   //0x1E
    u16 scissor_top;     //0x20
    u16 scissor_bottom;  //0x22
    WOBJ *eye_position;  //0x24
    WOBJ *interest;      //0x28
    union
    {
        f32 roll; //0x28
        Vec3 up;  //0x28 - 0x34
    } u;
    f32 near; //0x3C
    f32 far;  //0x40
    union
    {
        struct
        {
            f32 fov;
            f32 aspect;
        } perspective;

        struct
        {
            f32 top;
            f32 bottom;
            f32 left;
            f32 right;
        } frustrum;

        struct
        {
            f32 top;
            f32 bottom;
            f32 left;
            f32 right;
        } ortho;
    } projection_param;
    u8 projection_type; //0x50
    Mtx view_mtx;       //0x54
    AOBJ *aobj;         //0x84
    Mtx proj_mtx;       //0x88
};

struct _HSD_ImageDesc
{
    void *img_ptr;
    u16 width;
    u16 height;
    u32 format;
    u32 mipmap;
    f32 minLOD;
    f32 maxLOD;
};

struct _HSD_Tlut
{
    void *tlut_ptr;
    u32 format;
    u32 gxtlut;
    u16 colorcount;
    u16 x0E;
};

struct _HSD_TObjTev
{
    u8 color_op;
    u8 alpha_op;
    u8 color_bias;
    u8 alpha_bias;

    u8 color_scale;
    u8 alpha_scale;
    u8 color_clamp;
    u8 alpha_clamp;

    u8 color_a;
    u8 color_b;
    u8 color_c;
    u8 color_d;

    u8 alpha_a;
    u8 alpha_b;
    u8 alpha_c;
    u8 alpha_d;

    GXColor constant;
    GXColor tev0;
    GXColor tev1;
    uint flags;
};

struct _HSD_LightPoint
{
    f32 cutoff;
    u8 point_func;
    f32 ref_br;
    f32 ref_dist;
    u8 dist_func;
};

struct _HSD_LightPointDesc
{
    f32 cutoff;
    u8 point_func;
    f32 ref_br;
    f32 ref_dist;
    u8 dist_func;
};

struct _HSD_LightSpot
{
    f32 cutoff;
    u8 spot_func;
    f32 ref_br;
    f32 ref_dist;
    u8 dist_func;
};

struct _HSD_LightSpotDesc
{
    f32 cutoff;
    u8 spot_func;
    f32 ref_br;
    f32 ref_dist;
    u8 dist_func;
};

struct _HSD_LightAttn
{
    f32 a0;
    f32 a1;
    f32 a2;
    f32 k0;
    f32 k1;
    f32 k2;
};

struct LObjDesc
{
    char *class_name;               //0x00
    LObjDesc *next;                 //0x04
    u16 flags;                      //0x08
    u16 attnflags;                  //0x0A
    GXColor color;                  //0x0C
    struct _HSD_WObjDesc *position; //0x10
    struct _HSD_WObjDesc *interest; //0x14
    union
    {
        void *p;
        f32 *shininess;
        void *point;
        void *spot;
        void *attn;
    } u;
};
struct LightAnim
{
    LightAnim *next;
    struct _HSD_AObjDesc *aobjdesc;
    struct _HSD_WObjAnim *position_anim;
    struct _HSD_WObjAnim *interest_anim;
};
struct LightGroup
{
    LObjDesc *lobj_desc;
    LightAnim *anim;
};

struct LOBJ
{
    HSD_Obj parent;    //0x00
    u16 flags;         //0x08
    u16 priority;      //0x0A
    struct LOBJ *next; //0x0C
    GXColor color;     //0x10
    GXColor hw_color;  //0x14
    WOBJ *position;    //0x18
    WOBJ *interest;    //0x1C
    union
    {
        _HSD_LightPoint point;
        _HSD_LightSpot spot;
        _HSD_LightAttn attn;
    } u;
    f32 shininess;
    Vec3 lvec;
    AOBJ *aobj; // 0x48
    u32 id;     // 0x4c, GXLightID
    //GXLightObj lightobj;      //0x50
    u32 spec_id; //0x90 GXLightID
    //GXLightObj spec_lightobj; //0x94
};

struct HSD_Fog
{
    HSD_Obj parent;
    u8 type;           //0x08
    HSD_Fog *fog_adj;  //0x0C
    f32 start;         //0x10
    f32 end;           //0x14
    GXColor color;     //0x18
    struct AOBJ *aobj; //0x1C
};

struct HSD_FogDesc
{
    u8 type;             //0x00
    HSD_FogDesc *fog_adj;//0x04
    f32 start;           //0x08
    f32 end;             //0x0C
    GXColor color;       //0x10
    struct AOBJDesc *aobj;      //0x14
};

struct JOBJSet
{
    JOBJDesc *jobj;
    void **animjoint;
    void **matanimjoint;
    void **shapeaninjoint;
};

/*** Static Variables ***/
static GOBJList **stc_gobj_list = R13 + (-0x3E74);
static u8 *stc_gobj_proc_num = 0x804ce382;            // number of elements in the below array
static GOBJProc ***stc_gobjproc_lookup = 0x804D7840;  // array of gobj procs ptrs
static GOBJProc **stc_gobjproc_cur = (R13 + -0x3E68); // current gobj proc being processed
static u8 *objkind_sobj = R13 + -(0x3D40);
static u8 *objkind_cobj = R13 + -(0x3E55);
static u8 *objkind_lobj = R13 + -(0x3E56);
static u8 *objkind_jobj = R13 + -(0x3E57);
static u8 *objkind_fog = R13 + -(0x3E58);

/*** Functions ***/
int JOBJ_GetWorldPosition(JOBJ *source, Vec3 *add, Vec3 *dest);
void JOBJ_SetMtxDirtySub(JOBJ *jobj);
void JOBJ_SetupMtxSub(JOBJ *jobj);
void JOBJ_MakeMatrix(JOBJ *jobj);
JOBJ *JOBJ_LoadDummy();
JOBJ *JOBJ_LoadJoint(JOBJDesc *joint);
void JOBJ_RemoveAll(JOBJ *joint);
void JOBJ_Remove(JOBJ *joint);
void JOBJ_GetChild(JOBJ *joint, JOBJ **ptr, int index, ...);
void JOBJ_AddChild(JOBJ *parent, JOBJ *child);
void JOBJ_AddNext(JOBJ *parent, JOBJ *child);
float JOBJ_GetCurrentMatAnimFrame(JOBJ *joint);
void JOBJ_SetFlags(JOBJ *joint, int flags);
void JOBJ_SetFlagsAll(JOBJ *joint, int flags);
void JOBJ_ClearFlags(JOBJ *joint, int flags);
void JOBJ_ClearFlagsAll(JOBJ *joint, int flags);
void JOBJ_BillBoard(JOBJ *joint, Mtx *m, Mtx *mx);
void JOBJ_ForEachAnim(JOBJ *joint, int unk, u16 flags, void *cb, int argkind, ...); // flags: 0x400 matanim, 0x20 jointanim, argkind specifies how to pop args off the va_list
void JOBJ_Anim(JOBJ *joint);
void JOBJ_AnimAll(JOBJ *joint);
void JOBJ_AddAnimAll(JOBJ *joint, void *animjoint, void *matanimjoint, void *shapeanimjoint);
void JOBJ_RemoveAnimAll(JOBJ *joint);
void JOBJ_ReqAnim(JOBJ *joint, float frame);
void JOBJ_ReqAnimByFlags(JOBJ *joint, int flags, float frame);
void JOBJ_ReqAnimAll(JOBJ *joint, float unk);
void JOBJ_ReqAnimAllByFlags(JOBJ *joint, int flags, float frame);
float JOBJ_GetJointAnimCurrFrame(JOBJ *joint);
float JOBJ_GetJointAnimFrameTotal(JOBJ *joint);
float JOBJ_GetJointAnimNextFrame(JOBJ *joint);
void JOBJ_SetAllMOBJFlags(JOBJ *joint, int flags);
void JOBJ_EnableFlagAllMOBJ(JOBJ *joint, int flags); // enables this flag for all mobjs
int JOBJ_CheckAObjEnd(JOBJ *joint);
void JOBJ_CompileTEVAllMOBJ(JOBJ *joint);
void JObj_DispAll(JOBJ *joint, Mtx *vmtx, int flags, int rendermode);
void JOBJ_AttachPosition(JOBJ *to_attach, JOBJ *attach_to);
void JOBJ_AttachPositionRotation(JOBJ *to_attach, JOBJ *attach_to);
GOBJ *JOBJ_LoadSet(int is_hidden, JOBJSet *set, int anim_id, float frame, int gobj_subclass, int gx_link, int is_add_anim, void *cb); // 8019035c
void JOBJ_AddSetAnim(JOBJ *jobj, JOBJSet *set, int anim_id);                                                                          // 8016895c
void JOBJ_Detach(JOBJ *to_attach);
void JOBJ_ResetFromDesc(JOBJ *, JOBJDesc *);
void JOBJ_RemoveAnimByFlags(JOBJ *, int);
void AOBJ_ReqAnim(int *aobj, float unk);
void AOBJ_StopAnim(AOBJ *aobj);
void AOBJ_SetRate(AOBJ *aobj, float rate);
void AOBJ_SetFlags(AOBJ *aobj, int flags);
void AOBJ_ClearFlags(AOBJ *aobj, int flags);
void DOBJ_SetFlags(DOBJ *dobj, int flags);
void DOBJ_ClearFlags(DOBJ *dobj, int flags);
void DOBJ_AddAnimAll(DOBJ *dobj, void *matanim, void *textureanim);
COBJ *COBJ_Alloc();
COBJ *COBJ_LoadDesc(COBJDesc *cobj);
COBJ *COBJ_LoadDescSetScissor(COBJDesc *cobj);
void COBJ_Init(COBJ *cobj, COBJDesc *cobj_desc); // re-initializes a live cobj using its descriptor
void CObjThink_Common(GOBJ *gobj);
int CObj_SetCurrent(COBJ *cobj);
void CObj_SetEraseColor(int r, int g, int b, int a);
void CObj_EraseScreen(COBJ *cobj, int unk, int unk2, int unk3);
void CObj_RenderGXLinks(GOBJ *gobj, int render_mode);
void CObj_EndCurrent();
void CObj_SetOrtho(COBJ *cobj, float top, float bottom, float left, float right);
void CObj_SetViewport(COBJ *cobj, float left, float right, float top, float bottom);
void CObj_SetScissor(COBJ *cobj, u16 top, u16 bottom, u16 left, u16 right);
void CObj_SetEyePosition(COBJ *cobj, Vec3 *pos);
void CObj_SetInterest(COBJ *cobj, Vec3 *pos);
void CObj_SetRoll(COBJ *cobj, float roll);
void CObj_Release(COBJ *cobj);
void CObj_Destroy(COBJ *cobj);
COBJ *COBJ_GetCurrent();
void COBJ_GetEyeVector(COBJ *cobj, Vec3 *eye_vec);
void COBJ_GetInterest(COBJ *cobj, Vec3 *interest);
float COBJ_GetEyeDistance(COBJ *cobj);
void COBJ_GetViewingMtx(COBJ *cobj, Mtx *out);
GOBJ *GObj_Create(int entity_class, int p_link, int flags);
void GObj_Destroy(GOBJ *gobj);
void GObj_AddGXLink(GOBJ *gobj, void *cb, int gx_link, int gx_pri);
void GObj_DestroyGXLink(GOBJ *gobj);
void GObj_GXReorder(GOBJ *gobj, int unk);
void GObj_AddProc(GOBJ *gobj, void *callback, int priority);
void GObj_RemoveProc(GOBJ *gobj);
void GObj_AddObject(GOBJ *gobj, u8 unk, void *object);
void GObj_FreeObject(GOBJ *gobj);
void GObj_AddUserData(GOBJ *gobj, int userDataKind, void *destructor, void *userData);
void GOBJ_InitCamera(GOBJ *gobj, void *cb, int gx_pri);
void GObj_Anim(GOBJ *gobj);
void *GObj_AddRenderObject(GOBJ *gobj, int width, int height);
void GObj_ProcUnk(GOBJ *gobj);
void GObj_DestroyByPLink(int p_link);                           // destroys all gobjs with p_link X
void GObj_DestroyByPLinkRange(int p_link_low, int p_link_high); // destroys all gobjs of p_link_low -> p_link_high
void GXLink_Common(GOBJ *gobj, int pass);
int GX_LookupRenderPass(int pass);
void GXLink_LObj(GOBJ *gobj, int pass);
void GXLink_Fog(GOBJ *gobj, int pass);
LOBJ *LObj_LoadDesc(void *lobjdesc);
LOBJ *LObj_LoadAll(void **lobjdesc);
int LObj_GetPosition(LOBJ *lobj, Vec3 *pos);
void LObj_SetPosition(LOBJ *lobj, Vec3 *pos);
int LObj_GetInterest(LOBJ *lobj, Vec3 *pos);
void LObj_SetInterest(LOBJ *lobj, Vec3 *pos);
void LObj_ReqAnimAll(LOBJ *lobj, float frame);
void LObj_AnimAll(LOBJ *lobj);
void LObj_DeleteCurrentAll(int unk);
HSD_Fog *Fog_LoadDesc(void *fogdesc);
void Fog_Set(HSD_Fog *fog);
DOBJ *JOBJ_GetDObj(JOBJ *jobj);
void *MOBJ_SetAlpha(DOBJ *dobj, float alpha);
void MOBJ_SetToonTextureImage(_HSD_ImageDesc *);
void MOBJ_ReqAnim(MOBJ *, float frame);
void MObj_Anim(MOBJ *);
void GObj_CopyGXPri(GOBJ *target, GOBJ *source);
#endif