#To be inserted @ 80229894
.include "../../Globals.s"
.include "../Header.s"

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original



.set  REG_MenuID,31
.set  REG_Cursor,30
.set  REG_Direction,29
.set  REG_MenuData,28
.set  REG_MenuDef,27
.set  REG_OptDef,26

# init
  backup
  mr  REG_MenuID,r3
  mr  REG_Cursor,r4
  mr  REG_Direction,r5
  load  REG_MenuData,0x804a04f0
# Get menu def
  lwz r3,OFST_mexMenu(r13)
  lwz r3,mexMenu_MenuDef(r3)
  lbz	r0, 0 (REG_MenuData)
  mulli	r0, r0, MenuDefStride
  add REG_MenuDef,r3,r0

# set prev menu
  lbz	r3, 0x0 (REG_MenuData)
  stb	r3, 0x1 (REG_MenuData)
# new curr menu
  #lbz r3,MenuDef_PrevMenu(REG_MenuDef)
  stb	REG_MenuID, 0x0 (REG_MenuData)

# determine cursor value for dest menu
  .set  REG_Count,12
  .set  REG_OptNum,11
  .set  REG_OptDef,10
  .set  REG_PrevMenuID,9
  li  REG_Count,0
  lbz REG_PrevMenuID, 0x1 (REG_MenuData)
# Get menu def for dest menu
  lwz r3,OFST_mexMenu(r13)
  lwz r3,mexMenu_MenuDef(r3)
  lbz	r0, 0 (REG_MenuData)
  mulli	r0, REG_MenuID, MenuDefStride
  add r3,r3,r0
  lbz REG_OptNum,MenuDef_OptNum(r3)
  lwz REG_OptDef,MenuDef_OptDef(r3)
SearchCursor_Loop:
# Get this optdef
  mulli r0,REG_Count,OptDefStride
  add r3,REG_OptDef,r0
# check if menu
  lbz r0,OptDef_Kind(r3)
  cmpwi r0,0
  bne SearchCursor_IncLoop
# get menu ID
  lbz r0,OptDef_ID(r3)
  cmpw r0,REG_PrevMenuID
  bne SearchCursor_IncLoop
# set cursor
  sth	REG_Count, 0x2 (REG_MenuData)  # current cursor
  b SearchCursor_Exit
SearchCursor_IncLoop:
  addi  REG_Count,REG_Count,1
  cmpw  REG_Count,REG_OptNum
  blt SearchCursor_Loop
SearchCursor_Exit:

# Switch menu 
  mr  r3,REG_Direction
  branchl r12,0x8022b3a0
# Some proc thing
  branchl r12,0x80390cd4
# Delete this menu gobj
  lwz	r3, -0x3E84 (r13)
  branchl r12,0x80390228
# Create next menu gobj
  li  r3,0
  li  r4,1
  li  r5,128
  branchl r12,0x803901f0
# Set this proc
  load  r4,MenuThink
  li  r5,0
  branchl r12,0x8038fd54
# Adjust this proc?
  lwz	r4, -0x3E64 (r13)
  lbz	r0, 0x000D (r3)
  rlwimi	r0, r4, 4, 26, 27
  stb	r0, 0x000D (r3)


Exit:
  restore
  blr

Original:
  mflr	r0

