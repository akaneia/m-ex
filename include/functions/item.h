#ifndef MEX_H_FN_ITEM
#define MEX_H_FN_ITEM

void (*Item_Hold)(GOBJ *item, GOBJ *fighter, int boneID) = (void *)0x8026ab54;
void (*Item_Catch)(GOBJ *fighter, int unk) = (void *)0x80094818;
void (*Items_StoreItemDataToCharItemTable)(undefined4, int) = (void *)0x8026B3F8;
void (*Items_StoreItemDataToCharItemTable2)(int articleData, int articleID) = (void *)0x8026B3F8;
void (*Items_StoreTimeout)(GOBJ *item, float timeout) = (void *)0x80275158;
GOBJ *(*CreateItem)(SpawnItem *item_spawn) = (void *)0x80268b18;
GOBJ *(*CreateItem2)(SpawnItem *item_spawn) = (void *)0x80268b5c;
GOBJ *(*CreateItem3)(SpawnItem *item_spawn) = (void *)0x80268b9c;
void (*Item_Destroy)(GOBJ *item) = (void *)0x8026a8ec;
int (*Item_CollGround_PassLedge)(GOBJ *item, void *callback) = (void *)0x8026d62c;
int (*Item_CollGround_StopLedge)(GOBJ *item, void *callback) = (void *)0x8026d8a4;
int (*Item_CollAir)(GOBJ *item, void *callback) = (void *)0x8026e15c;
void (*ItemStateChange)(GOBJ *item, int stateID, int flags) = (void *)0x80268e5c;
int (*ItemFrameTimer)(GOBJ *item) = (void *)0x80272c6c;
void (*Item_PlaceOnGroundBelow)(GOBJ *item) = (void *)0x80276174;
int (*Item_CheckIfTouchingWall)(GOBJ *item, float *unk[]) = (void *)0x80276348;
void (*Item_InitGrab)(ItemData *item, int unk, void *OnItem, void *OnFighter) = (void *)0x80274f28;
void (*Item_ResetAllHitPlayers)(ItemData *item) = (void *)0x8027146c;
int (*Item_CountActiveItems)(int itemID) = (void *)0x8026b3c0;
void (*Item_CopyDevelopState)(GOBJ *item, GOBJ *fighter) = (void *)0x80225dd8;
int (*Items_DecLife)(GOBJ *item) = (void *)0x80273130;
void (*GXLink_Item)(GOBJ *gobj, int pass) = (void *)0x8026eecc;
void (*Item_UpdateSpin)(GOBJ *item, float unk) = (void *)0x80274658;
void (*Item_EnableSpin)(GOBJ *item) = (void *)0x802762bc;
void (*Item_DisableSpin)(GOBJ *item) = (void *)0x802762b0;

#endif