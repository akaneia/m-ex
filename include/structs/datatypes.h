#ifndef MEX_H_ST_DATATYPES
#define MEX_H_ST_DATATYPES

#include "structs.h"

// Data types
typedef signed char s8;
typedef signed short s16;
typedef signed int s32;
typedef signed long long s64;
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;
typedef float f32;
typedef double f64;

// PadGet Types
#define PADGET_MASTER 0
#define PADGET_ENGINE 1

// Matrix definition
typedef float Mtx[3][4];
typedef float (*MtxPtr)[4];

// Ghidrish
#define undefined8 long
#define undefined4 int
#define byte char
#define uint unsigned int

// bool lingo
#define true 1
#define false 0

// Math
#define M_PI 3.14159265358979323846
#define M_1DEGREE 0.0174533

struct Vec2
{
    float X;
    float Y;
};

struct Vec3
{
    float X;
    float Y;
    float Z;
};

struct Vec4
{
    float X;
    float Y;
    float Z;
    float W;
};

#endif