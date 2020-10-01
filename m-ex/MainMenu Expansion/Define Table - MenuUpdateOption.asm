#To be inserted @ 8022a4c4
.include "../../Globals.s"
.include "../Header.s"

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r12,mexMenu_MenuDef(r12)
  lbz	r3, 0 (r31)
  mulli	r3, r3, 20
  add r12,r12,r3
  lfs	f2, 0x4 (r12)
  b Exit

Original:
  lfs	f2, 0x084C (r3)

Exit: