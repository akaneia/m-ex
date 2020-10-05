#To be inserted @ 8022c170
.include "../../Globals.s"
.include "../Header.s"

.set  REG_MenuData,31
.set  REG_MenuDef,12
.set  REG_HueIndex,30

# check if exists
  lwz r3,OFST_mexMenu(r13)
  cmpwi r3,0
  beq Original
# Get menu def
  lwz r3,mexMenu_MenuDef(r3)
  lbz	r0, 0 (REG_MenuData)
  mulli	r0, r0, MenuDefStride
  add REG_MenuDef,r3,r0

# Get hue index
  lbz   REG_HueIndex,MenuDef_HueIndex(REG_MenuDef)

  branch  r12,0x8022c1b4


Original:
    cmplwi	r4, 33

Exit:
