#To be inserted @ 80264a74
.include "../../../Globals.s"
.include "../../Header.s"
 
# original codeline, add all anims
branchl r12,0x8036fb5c

.set REG_Count,31
.set REG_StockTOBJ,30
.set REG_MatAnimJoint,29

backup

# get emblem symbol from ifall
  load  r3,0x804d5780
  branchl r12,0x8001819c
  bl  EmblemSymbol
  mflr r4
  branchl r12,0x80380358
# check if exists
  cmpwi r3,0
  beq Exit
  #lwz REG_MatAnimJoint,0x4(r3)
  mr  REG_MatAnimJoint,r3

# Get emblem icon jobj
  lwz	r3, -0x49DC (r13)
  addi  r4,sp,0x80
  li  r5,4
  li  r6,-1
  branchl r12,0x80011e24

# jobj -> dobj -> dobj
  lwz r3,0x80(sp)             # jobj
  lwz r3,0x18(r3)             # dobj
  lwz r3,0x4(r3)             # next dobj

# add anim
  lwz  r4,0x8(REG_MatAnimJoint)
  li  r5,0
  branchl r12,0x8035dea0

  b Exit

EmblemSymbol:
blrl
.string "Eblm_matanim_joint"
.align 2

Exit:
restore
lwz	r3, -0x49DC (r13)