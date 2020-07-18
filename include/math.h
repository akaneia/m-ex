#ifndef MEX_H_MATH
#define MEX_H_MATH

#include "structs.h"
#include "datatypes.h"

#define M_PI 3.14159265358979323846
#define M_1DEGREE 0.0174533

/*** Functions ***/

float (*atan2)(float y, float x) = (void *)0x80022c30;
float (*sin)(float x) = (void *)0x803263d4;
float (*cos)(float x) = (void *)0x80326240;
void (*MTXLookAt)(Mtx *dest, Vec3 *eye, Vec3 *up, Vec3 *target) = (void *)0x80342734;
void (*VECNormalize)(Vec3 *src, Vec3 *dest) = (void *)0x80342db8;
void (*VECAdd)(Vec3 *a, Vec3 *b, Vec3 *ab) = (void *)0x80342d54;
void (*VECSubtract)(Vec3 *a, Vec3 *b, Vec3 *a_b) = (void *)0x80342d78;
void (*VECMultAndAdd)(Vec3 *a, Vec3 *b) = (void *)0x8000dc6c;
float (*VECDotProduct)(Vec3 *a, Vec3 *b) = (void *)0x80342e38;
void (*VECCrossProduct)(Vec3 *a, Vec3 *b, Vec3 *axb) = (void *)0x80342e58;
void (*MTXQuat)(Vec4 *dest, Mtx *m) = (void *)0x80342690;
void (*HSD_MtxGetRotation)(Mtx *m, Vec3 *dest) = (void *)0x80379c24;
void (*MatToQuat)(Mtx *m, Vec3 *dest) = (void *)0x8037e708;
float (*sqrtf)(float num) = (void *)0x8000d5bc;
void (*MTXRotRad)(Mtx m, char axis, f32 rad) = (void *)0x80342418;

#endif