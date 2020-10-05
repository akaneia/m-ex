#To be inserted @ 80229da0
.include "../../Globals.s"
.include "../Header.s"

.set  REG_MatAnimJoint,31
.set  REG_mexMenu, 30
.set  REG_JObj,28

backup

# check if exists
  lwz REG_mexMenu,OFST_mexMenu(r13)
  cmpwi REG_mexMenu,0
  beq Exit
  lwz REG_MatAnimJoint,mexMenu_MnNameMatAnimJoint(REG_mexMenu)

# Get name jobj
  mr  r3,REG_JObj
  addi  r4,sp,0x80
  li  r5,86
  li  r6,-1
  branchl r12,0x80011e24

# Get menu ID
  load  r3,0x804a04f0
  lbz r3,0x0(r3)
# get menu def
  lwz r12,mexMenu_MenuDef(REG_mexMenu)
  mulli r3,r3,MenuDefStride
  add  r3,r12, r3
  lbz r3,MenuDef_NameFrame(r3)
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
  branchl r12,0x8036f934

Exit:
  restore
  lwz	r0, 0x003C (sp)