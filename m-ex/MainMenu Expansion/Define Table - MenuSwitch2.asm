#To be inserted @ 8022b7d4
.include "../../Globals.s"
.include "../Header.s"

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r12,mexMenu_MenuDef(r12)
  lbz	r0, 0 (r30)
  mulli	r0, r0, MenuDefStride
  add r12,r12,r0
  lfs	f1, 0x4 (r12)
  b Exit

Original:
  lfs	f1, 0x084C (r4)

Exit: