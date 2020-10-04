#To be inserted @ 8022a638
.include "../../Globals.s"
.include "../Header.s"

.set REG_OptionNum, 27

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r3,mexMenu_MenuDef(r12)
  lbz	r0, 0 (r28)
  mulli	r0, r0, MenuDefStride
  add r3,r3,r0
  lbz	REG_OptionNum, 0xC (r3)
  b Exit

Original:
  lbz	r27, 0x0854 (r3)

Exit: