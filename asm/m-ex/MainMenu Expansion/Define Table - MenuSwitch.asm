#To be inserted @ 8022b3f4
.include "../../Globals.s"
.include "../Header.s"

.set REG_Frames, 31
.set REG_OptionNum, 22
.set REG_MenuDef, 19

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r5,mexMenu_MenuDef(r12)
  mulli r3,r21,MenuDefStride
  add r3,r3,r5
  lwz REG_Frames,0x0(r3)
  lbz	REG_OptionNum, 0xC (r3)
  mr  REG_MenuDef,r3
  b Exit

Original:
  lbz	r22, 0x0854 (r4)

Exit: