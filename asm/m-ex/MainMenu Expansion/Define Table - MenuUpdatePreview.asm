#To be inserted @ 8022ae48
.include "../../Globals.s"
.include "../Header.s"

.set REG_OptionFrames, 29

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r12,mexMenu_MenuDef(r12)
  lbz	r0, 0 (r30)
  mulli	r0, r0, MenuDefStride
  add r12,r12,r0
  lwz	REG_OptionFrames, 0x0 (r12)
  b Exit

Original:
  lwz	r29, 0x0848 (r3)

Exit: