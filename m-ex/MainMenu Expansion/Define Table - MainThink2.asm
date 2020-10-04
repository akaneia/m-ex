#To be inserted @ 8022dc18
.include "../../Globals.s"
.include "../Header.s"

.set MenuID,31
.set REG_MenuDef, 3

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r12,mexMenu_MenuDef(r12)
  mulli r3,MenuID,MenuDefStride
  add REG_MenuDef,r12,r3
  b Exit

Original:
  add	r3, r3, r0

Exit: