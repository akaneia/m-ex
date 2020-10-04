#To be inserted @ 8022b224
.include "../../Globals.s"
.include "../Header.s"

.set REG_OptionNum, 0

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r12,mexMenu_MenuDef(r12)
  lbz	r0, 0 (r30)
  mulli	r0, r0, MenuDefStride
  add r12,r12,r0
  lbz	REG_OptionNum, 0xC (r12)
  b Exit

Original:
  lbz	r0, 0x0854 (r3)

Exit: