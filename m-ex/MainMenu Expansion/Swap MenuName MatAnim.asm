#To be inserted @ 80229e60
.include "../../Globals.s"
.include "../Header.s"

.set  REG_MatAnimJoint,31
.set  REG_mexMenu,30
.set  REG_Count, 29
.set  REG_JObj,28

backup

# check if exists
  lwz REG_mexMenu,OFST_mexMenu(r13)
  cmpwi REG_mexMenu,0
  beq Exit
  lwz REG_MatAnimJoint,mexMenu_MnNameMatAnimJoint(REG_mexMenu)

# init
li  REG_Count,0

NameLoop:

# Get jobj ID
  bl  NameJObjs
  mflr  r3
  lbzx  r5,r3,REG_Count
  extsb r5,r5
  cmpwi r5,-1
  beq ExitNameLoop

# Get jobj
  mr  r3,REG_JObj
  addi  r4,sp,0x80
  li  r6,-1
  branchl r12,0x80011e24

# remove all anim
  lwz r3,0x80(sp)
  branchl r12,0x8036f6b4

# add matanim
  lwz r3,0x80(sp)
  li  r4,0
  mr  r5,REG_MatAnimJoint
  li  r6,0
  branchl r12,0x8036fb5c

IncNameLoop:
  addi  REG_Count,REG_Count,1
  b NameLoop
ExitNameLoop:

# init
li  REG_Count,0

NameBorderLoop:
# Get jobj ID
  bl  BorderJObjs
  mflr  r3
  lbzx  r5,r3,REG_Count
  extsb r5,r5
  cmpwi r5,-1
  beq ExitNameBorderLoop

# Get jobj
  mr  r3,REG_JObj
  addi  r4,sp,0x80
  li  r6,-1
  branchl r12,0x80011e24

# remove all anim
  lwz r3,0x80(sp)
  branchl r12,0x8036f6b4

IncNameBorderLoop:
  addi  REG_Count,REG_Count,1
  b NameBorderLoop
ExitNameBorderLoop:

# adjust topmost menu border
  mr  r3,REG_JObj
  addi  r4,sp,0x80
  li  r5, 44
  li  r6,-1
  branchl r12,0x80011e24
  bl  Floats
  mflr  r3
  lfs f1,0x0(r3)
  lwz r3,0x80(sp)
  stfs  f1,0x38(r3)

# adjust topmost menu name scale
  mr  r3,REG_JObj
  addi  r4,sp,0x80
  li  r5, 86
  li  r6,-1
  branchl r12,0x80011e24
  bl  Floats
  mflr  r3
  lfs f1,0x04(r3)
  lwz r3,0x80(sp)
  stfs  f1,0x2C(r3)

# Get menu ID
  load  r3,0x804a04f0
  lbz r3,0x0(r3)
# get menu def
  lwz r12,mexMenu_MenuDef(REG_mexMenu)
  mulli r3,r3,MenuDefStride
  add  r3,r12, r3
  lhz r3,MenuDef_NameFrame(r3)
# cast
  xoris r3,r3,0x8000
  lfd	f1, -0x35F8 (rtoc)
  stw r3,0x94(sp)
  lis r3,0x4330
  stw r3,0x90(sp)
  lfd f2,0x90(sp)
  fsubs f1,f2,f1

# change name frame
  lwz r3,0x80(sp)   # jobj
  lwz r3,0x18(r3)   # dobj
  lwz r3,0x8(r3)   # mobj
  lwz r3,0x8(r3)   # tobj
  branchl r12,0x8035e800

# set rate
  lwz r3,0x80(sp)   # jobj
  lwz r3,0x18(r3)   # dobj
  lwz r3,0x8(r3)   # mobj
  lwz r3,0x8(r3)   # tobj
  lwz r3,0x64(r3)   # aobj
  lfs	f1, -0x1F20 (rtoc)
  branchl r12,0x8036530c

# anim all
  lwz r3,0x80(sp)   # jobj
  branchl r12,0x80370928

  b Exit

NameJObjs:
blrl
.byte 86 # top level
.byte 84 # second level
.byte 85 # third level
.byte 82 # fourth level
.byte 83 # fifth level
.byte -1
.align 2

BorderJObjs:
blrl
.byte 44 # top level
.byte 45 # second level
.byte 46 # third level
.byte 47 # fourth level
.byte -1
.align 2

Floats:
blrl
.float 0
.float 0.9

Exit:
  restore
  addi	r3, r28, 0