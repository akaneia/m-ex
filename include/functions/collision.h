#ifndef MEX_H_FN_COLLISION
#define MEX_H_FN_COLLISION

void (*Coll_ECBCurrToPrev)(CollData *collData) = (void *)0x80041c8c;
void (*Coll_InitECB)(CollData *collData) = (void *)0x80041ee4;
int (*ECB_CollGround_PassLedge)(CollData *ecb, ECBBones *bones) = (void *)0x8004b21c; // returns is touching ground bool
void (*ECB_CollAir)(CollData *ecb, ECBBones *bones) = (void *)0x800475f4;

#endif