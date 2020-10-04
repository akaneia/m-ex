#To be inserted @ 8022a004
.include "../../Globals.s"
.include "../Header.s"

.set REG_OptionNum, 0

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r4,mexMenu_MenuDef(r12)
  lbz	r3, 0 (r29)
  mulli r3,r3,MenuDefStride
  add r4,r4,r3
  lfs f2, 0x4 (r4)
  b Exit

Original:
  lfs	f2, 0x084C (r3)

Exit: