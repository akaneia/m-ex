#To be inserted @ 802f62f8
.include "../../Globals.s"
.include "../Header.s"
 
.set REG_Count,31
.set REG_EmblemJOBJ,30
.set REG_MatAnimJoint,29

# orig codeline
  branchl r12,0x8000c07c

backup

# check if exists
  lwz REG_MatAnimJoint,OFST_eblm_matanimjoint(r13)
  cmpwi REG_MatAnimJoint,0
  beq Exit

# Get emblem icon jobj
  mr  r3,REG_EmblemJOBJ
  addi  r4,sp,0x80
  li  r5,1
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