#To be inserted @ 8022b9d8
.include "../../Globals.s"
.include "../Header.s"

.set REG_MenuTextID, 16
.set REG_MenuData,26

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
# get menu def
  lwz r12,mexMenu_MenuDef(r12)
  lbz r0,0x0(REG_MenuData)
  mulli r0,r0,MenuDefStride
  add  r12,r12, r0

# get option def
  lwz r12,MenuDef_OptDef(r12)
  lbz	r0, 0x0001 (REG_MenuData)
  mulli r0,r0,OptDefStride
  add r12,r12,r0

# get text ID
  lbz r4,OptDef_Text(r12)

  b Exit

Original:
  lhzx	r4, r16, r0

Exit: