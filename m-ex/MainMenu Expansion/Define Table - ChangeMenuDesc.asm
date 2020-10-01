#To be inserted @ 80229ac4
.include "../../Globals.s"
.include "../Header.s"

.set REG_MenuDef, 3

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz REG_MenuDef,mexMenu_MenuDef(r12)
  add  REG_MenuDef,REG_MenuDef, r0
  b Exit

Original:
  add	r3, r3, r0

Exit: