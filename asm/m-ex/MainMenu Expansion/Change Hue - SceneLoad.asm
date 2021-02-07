#To be inserted @ 8022c010
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ThisMenu,12
.set  REG_OptDef,11
.set  REG_ThisOpt,10
.set  REG_MenuData,9
.set  REG_mexMenu,8
.set  REG_MenuID,7
.set  REG_CursorID,6
.set  REG_HueIndex,3

# check if exists
  lwz REG_mexMenu,OFST_mexMenu(r13)
  cmpwi REG_mexMenu,0
  beq Original

# init
  mr  REG_MenuID,r3
  mr  REG_CursorID,r4
# Get menu def
  lwz r3,mexMenu_MenuDef(REG_mexMenu)
  mulli	r0, REG_MenuID, MenuDefStride
  add REG_ThisMenu,r3,r0
# Get opt def
  lwz r3,MenuDef_OptDef(REG_ThisMenu)
  mulli r0,REG_CursorID,OptDefStride
  add REG_ThisOpt,r3,r0

# check if main menu
  cmpwi REG_MenuID,0
  beq isTopMenu

isSubMenu:
# get this menu's hue
  lbz REG_HueIndex,MenuDef_HueIndex(REG_ThisMenu)
  b mexMenuExit

isTopMenu:
# get cursors menu hue
  lbz r0,OptDef_ID(REG_ThisOpt)
  lwz r3,mexMenu_MenuDef(REG_mexMenu)
  mulli	r0, r0, MenuDefStride
  add r3,r3,r0
# get this menu's hue
  lbz REG_HueIndex,MenuDef_HueIndex(r3)
  b mexMenuExit

mexMenuExit:
  blr

Original:
    cmpwi	r3, 0

Exit:
