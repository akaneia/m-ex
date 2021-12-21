#To be inserted @ 8022e630
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Archive,31
.set  REG_mexMenu,30

backup

# check if slippi (slippi is too hard to account for...)
  load r3,0x801a5014
  lwz r3,0x0(r3)
  load r4,0x40820010
  cmpw r3,r4
  bne Exit

# check if exists
  bl  FileName
  mflr  r3
  branchl r12,0x8033796c
  cmpwi r3,-1
  beq Exit

# load file
  bl  FileName
  mflr  r3
  addi  r4,sp,0x80
  bl  SymbolName
  mflr  r5
  li  r6,0
  crclr	6
  branchl r12,0x80016c64
  mr REG_Archive,r3

# store pointer to symbol
  lwz REG_mexMenu,0x80(sp)
  stw REG_mexMenu,OFST_mexMenu(r13)

# create new canvas
  li  r3,OptDef_TextSisID
  li  r4,0
  li  r5,7
  li  r6,8
  li  r7,128
  li  r8,5
  li  r9,128
  li  r10,0
  branchl r12,0x803a611c

# index archive
  load  r3,0x804d1110
  stw REG_Archive,(OptDef_TextSisID * 4)(r3)

# index text symbol
  lwz r3,mexMenu_DescSis(REG_mexMenu)
  load  r4,0x804d1124
  stw r3,(OptDef_TextSisID * 4)(r4)

# check if we need to adjust the menu ID
.set REG_MenuData, 31
  load r4, 0x804d68b8
  lbz r3,0x0(r4)
  extsb r3,r3
  cmpwi r3,-1
  bne Exit

# search for last major id
  li r3, 0  # root menu
  load r4,0x80479D30
  lbz r4, 0x2 (r4)  # prev major ID
  bl Menu_SearchForMajor
  cmpwi r3,-1
  bne UpdatePrevMenu 

MenuNotFound:
  li r3,0
  li r4,0

UpdatePrevMenu:
  load r5, 0x804d68b8
  stb r3,0x0 (r5)
  stb r4,0x1 (r5)
  load r5, 0x804a04f0
  stb r3,0x0 (r5)
  stb r4,0x3 (r5)
  b Exit

SymbolNotFound:
  li  r3,0
  stw r3,OFST_mexMenu(r13)
  b Exit

##############################################
Menu_SearchForMajor:
# r3 = menu ID
# r4 = major id
.set REG_MenuID, 31
.set REG_MenuDef, 30
.set REG_MajorID, 29

.set LastREG, 27 #REG_OptDef
.set StackSize, 8 + ((32 - LastREG) * 4)

mflr    r0
stw     r0, 0x4(r1)
stwu    r1, -(StackSize) (r1)	# make space for all my registers
stmw    LastREG,0x8(r1)

# backup menu id
  mr REG_MenuID, r3
  mr REG_MajorID, r4

# get menu pointer
  lwz r3,OFST_mexMenu (r13)
  lwz r3, mexMenu_MenuDef (r3)
  mulli r4, REG_MenuID, MenuDefStride
  add REG_MenuDef, r3, r4

# ensure it has options first
  lwz   r3, MenuDef_OptDef (REG_MenuDef)
  cmpwi r3,0
  beq Menu_NotFound

# loop through all options's
.set REG_OptLoop, 28
  li REG_OptLoop, 0
OptLoop:
.set REG_OptDef, 27
# get this opt
  mulli r3, REG_OptLoop, OptDefStride
  lwz   r4, MenuDef_OptDef (REG_MenuDef)
  add   REG_OptDef, r3, r4
# make sure this isnt a "blank" option
  lbz r3, OptDef_Kind (REG_OptDef)
  extsb r3, r3
  cmpwi r3,-1
  beq OptLoopInc
# if it leads to another menu, check that one first
  cmpwi r3,0
  bne OptLoop_SceneCheck
# check this menu
  lbz r3, OptDef_ID (REG_OptDef)
  mr r4, REG_MajorID
  bl Menu_SearchForMajor
  cmpwi r3,-1
  bne Menu_SearchForMajor_Exit
  b OptLoopInc
OptLoop_SceneCheck:
# check if it leads to a scene 
  lbz r3, OptDef_ID (REG_OptDef)
  cmpw r3, REG_MajorID
  bne OptLoopInc
# found it! return menu and opt id
    mr r3, REG_MenuID
    mr r4, REG_OptLoop
    b Menu_SearchForMajor_Exit

OptLoopInc:
  addi REG_OptLoop,REG_OptLoop,1
  lbz  r3, MenuDef_OptNum (REG_MenuDef)
  cmpw REG_OptLoop,r3
  blt OptLoop

Menu_NotFound:
# didn't find it, return -1
  li r3,-1

Menu_SearchForMajor_Exit:
  lmw  LastREG,0x8(r1)
  lwz r0, StackSize + 0x4 (r1)
  addi	r1,r1, StackSize	# release the space
  mtlr r0
  blr

##############################################

FileName:
blrl
.string "MxMn.dat"
.align 2

SymbolName:
blrl
.string "mexMenu"
.align 2

##############################################

NotFound:
  li r3,0
  stw r3,OFST_mexMenu(r13)

Exit:
  restore
  li	r3, 3