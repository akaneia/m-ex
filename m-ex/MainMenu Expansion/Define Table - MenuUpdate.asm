#To be inserted @ 8022b224
.include "../../Globals.s"
.include "../Header.s"

.set REG_OptionNum, 0

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
  lwz r3,mexMenu_MenuDef(r12)
  add r3,r3,r0
  lbz	REG_OptionNum, 0xC (r3)
  b Exit

Original:
  lbz	r0, 0x0854 (r3)

Exit: