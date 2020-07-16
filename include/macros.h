#ifndef MEX_H_MACROS
#define MEX_H_MACROS

// Align
#define OSRoundUp32B(x) (((u32)(x) + 32 - 1) & ~(32 - 1))
#define OSRoundDown32B(x) (((u32)(x)) & ~(32 - 1))

// Other Macros
#define RTOC_PTR(offset) *(void **)(0x804df9e0 + offset)
#define R13_PTR(offset) *(void **)(R13 + offset)
#define R13_INT(offset) *(int *)(R13 + offset)
#define R13_U8(offset) *(u8 *)(R13 + offset)
#define R13_FLOAT(offset) *(float *)(R13 + offset)
#define AS_FLOAT(num) *(float *)&num
#define AS_INT(num) *(int *)&num
#define ACCESS_INT(addr) *(int *)(addr)
#define ACCESS_U8(addr) *(u8 *)(addr)
#define ACCESS_PTR(addr) *(void **)(addr)

#endif