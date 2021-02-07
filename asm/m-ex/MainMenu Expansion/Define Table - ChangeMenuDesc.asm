#To be inserted @ 80229b08
.include "../../Globals.s"
.include "../Header.s"

.set REG_MenuID, 31
.set REG_OptionID, 30

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original
# get menu def
  lwz r12,mexMenu_MenuDef(r12)
  lbz r11,0x0(r29)
  mulli r0,r11,MenuDefStride
  add  r12,r12, r0

# get option def
  lwz r12,MenuDef_OptDef(r12)
  mulli r0,REG_OptionID,OptDefStride
  add r12,r12,r0

# get text ID
  lbz r4,OptDef_Text(r12)

  b Exit

Original:
  lhzx	r4, r31, r0

Exit: