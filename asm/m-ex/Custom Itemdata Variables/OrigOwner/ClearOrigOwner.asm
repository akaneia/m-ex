#To be inserted @ 8026b8b0
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_ItemData,5

stw	r0, MEX_OrigOwner (REG_ItemData)

Original:
  li	r3, 1