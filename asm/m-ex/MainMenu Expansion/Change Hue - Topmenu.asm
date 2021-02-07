#To be inserted @ 8022c168
.include "../../Globals.s"
.include "../Header.s"

.set  REG_MenuData,31
.set  REG_HueIndex,30
.set  REG_MenuDef,12
.set  REG_OptDef,11
.set  REG_ThisOpt,10

# check if exists
  lwz r3,OFST_mexMenu(r13)
  cmpwi r3,0
  beq Original
# Get menu def
  lwz r3,mexMenu_MenuDef(r3)
  lbz	r0, 0 (REG_MenuData)
  mulli	r0, r0, MenuDefStride
  add REG_MenuDef,r3,r0
# Get opt def
  lwz REG_OptDef,MenuDef_OptDef(REG_MenuDef)
  lhz	r3, 0x2 (REG_MenuData)  # current cursor
  mulli r3,r3,OptDefStride
  add REG_ThisOpt,r3,REG_OptDef
# Get this options menu
  lbz r0,OptDef_ID(REG_ThisOpt)
  lwz r3,OFST_mexMenu(r13)
  lwz r3,mexMenu_MenuDef(r3)
  mulli	r0, r0, MenuDefStride
  add r3,r3,r0
# get this menu's hue
  lbz REG_HueIndex,MenuDef_HueIndex(r3)

  branch  r12,0x8022c1b4


Original:
    cmplwi	r4, 33

Exit:
