#ifndef MEX_H_MATH
#define MEX_H_MATH

#include "structs.h"
#include "datatypes.h"

#define M_PI (3.14159265358979323846)
#define M_1DEGREE (0.0174533)

/*** Functions ***/
float fmod(float a, float b);
float atan(float in);
float atan2(float y, float x);
float sin(float x);
float cos(float x);
void MTXLookAt(Mtx *dest, Vec3 *eye, Vec3 *up, Vec3 *target);
void VECNormalize(Vec3 *src, Vec3 *dest);
void VECAdd(Vec3 *a, Vec3 *b, Vec3 *ab);
void PSMTXIdentity(Mtx *dest);
void PSMTXCopy(Mtx *src, Mtx *dest);
void PSMTXConcat(Mtx *a, Mtx *b, Mtx *ab);
void VECSubtract(Vec3 *a, Vec3 *b, Vec3 *a_b);
void VECMultAndAdd(Vec3 *a, Vec3 *b);
float VECDotProduct(Vec3 *a, Vec3 *b);
void VECCrossProduct(Vec3 *a, Vec3 *b, Vec3 *axb);
float Vec2_Normalize(Vec2 *v);
float Vec3_Normalize(Vec3 *v);
void Vec2_Add(Vec2 *a, Vec2 *b);
Vec3 *Vec3_CrossDirection(Vec3 *a, Vec3 *b, Vec3 *axb);
//void MTXQuat(Mtx *m, Vec4 *dest);           // quat to matrix
void HSD_MkRotationMtx(Mtx *dest, Vec4 *v); // quat to rot matrix
void HSD_MtxGetScale(Mtx *m, Vec3 *dest);
void HSD_MtxGetRotation(Mtx *m, Vec3 *dest);
void HSD_MtxGetTranslate(Mtx *m, Vec3 *dest);
void HSD_MtxSRT(Mtx *m, Vec3 *scale, Vec3 *rot, Vec3 *trans, int unk);
void MatToQuat(Mtx *m, Vec4 *dest); // matrix to quat
float sqrtf(float num);
void MTXRotRad(Mtx m, char axis, f32 rad);
float Vec2_CalculateAngle(Vec2 *a, Vec2 *b);
float Vec3_CalculateAngle(Vec3 *a, Vec3 *b);

#endif
