#To be inserted @ 8022b998
.include "../../Globals.s"
.include "../Header.s"

.set REG_MenuTextID, 16

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r3,mexMenu_MenuDef(r12)
  add  r3,r3, r0
  lwz REG_MenuTextID,0x8(r3)
  b Exit

Original:
  lwz	r16, 0x0850 (r3)

Exit: