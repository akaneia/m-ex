#ifndef MEX_H_BONESET
#define MEX_H_BONESET

#include "structs.h"

/*** Structs ***/

struct DynamicBoneset
{
    void *unk_ptr; // is stored @ 8000fdd4, comes from a nonstandard heap @ -0x52fc(r13)
    int bone_num;  // number of bones in this boneset
    float x8;      // stored @ 80011718, 0x8 of dynamicdesc
    float xc;      // stored @ 80011720, 0xC of dynamicdesc
    float x10;     // stored @ 80011728, 0x10 of dynamicdesc
};

#endif
