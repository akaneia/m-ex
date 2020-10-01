#To be inserted @ 8022ae48
.include "../../Globals.s"
.include "../Header.s"

.set REG_OptionFrames, 29

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r3,mexMenu_MenuDef(r12)
  add r3,r3,r0
  lwz	REG_OptionFrames, 0x0 (r3)
  b Exit

Original:
  lwz	r29, 0x0848 (r3)

Exit: