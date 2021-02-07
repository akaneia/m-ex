#To be inserted @ 802674ac
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ItemGObjData,31
.set  REG_ItemFunctions,30
.set  REG_ItemData,29

#Get item ID
  lwz	r0, 0x0008 (r3)
  cmpwi r0,CustomItemStart
  blt Exit
  li  r0,8
  stw	r0, 0x000C (r3)
  blr

Exit:
