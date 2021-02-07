#To be inserted @ 8022b750
.include "../../Globals.s"
.include "../Header.s"

.set  REG_MatAnimJoint,31
.set  REG_JObj,16

backup

# check if exists
  lwz r3,OFST_mexMenu(r13)
  cmpwi r3,0
  beq Exit
  lwz REG_MatAnimJoint,mexMenu_MnOptMatAnimJoint(r3)

# Get jobj
  mr  r3,REG_JObj
  addi  r4,sp,0x80
  li  r5,3
  li  r6,-1
  branchl r12,0x80011e24

# add anim
  lwz r3,0x80(sp)
  li  r4,0
  mr  r5,REG_MatAnimJoint
  li  r6,0
  branchl r12,0x8036fb5c

Exit:
  restore
  addi	r3, r16, 0