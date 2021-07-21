#To be inserted @ 8026717c
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_ItemData,31

stw	r0, 0x518 (REG_ItemData)
stw	r0, MEX_OrigOwner (REG_ItemData)