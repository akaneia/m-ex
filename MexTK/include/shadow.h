#ifndef MEX_H_SHADOW
#define MEX_H_SHADOW

#include "structs.h"
#include "datatypes.h"

/*===========================================================================
    Structures
===========================================================================*/

typedef struct Shadow Shadow;
typedef struct ShadowData ShadowData;

typedef struct Shadow
{
    void *linked_list;
    COBJ *camera;
    TOBJ *texture;
    float xc;
    float x10;
    float x14;
    float x18;
    int active;
    u8 transparency;
    u8 x21;
    u8 x22;
    u8 x23;
    u8 x24;
    u8 x25;
    u8 x26;
    u8 x27;
};

typedef struct ShadowData
{
    u8 flag;
    Shadow *shadow;
};

/*===========================================================================
    Functions
===========================================================================*/

void Shadow_DrawQuad(Shadow *shadow);
void Shadow_InitJoint(ShadowData *, JOBJ *joint);

void Shadow_Init(Shadow *shadow);
void Shadow_SetSize(Shadow *shadow, int width, int height);
void Shadow_ClearTexture(Shadow *shadow);
/// @brief Call at start of shadow render
/// @param shadow 
void Shadow_Setup(Shadow *shadow);
/// @brief Call at End shadow render
/// @param shadow 
void Shadow_End(Shadow *shadow);
void Shadow_SetActive(Shadow *shadow, bool active);
void Shadow_SetViewingRect(Shadow *shadow, float x, float y, float x2, float y2);
void Shadow_ComputeSmoothingMatrix(float *outMatrix, Vec3 *lightPos, Vec3 *targetPos, Vec3 *upVector, float shadowScale);
bool Shadow_CheckSmoothingEdge(Mtx *mtx);
void Shadow_SmoothEdges(Mtx *mtx, Vec3 *pos, float, float, float, float);


#endif