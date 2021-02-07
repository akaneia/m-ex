#To be inserted @ 802f9fd4
.include "../../Globals.s"
.include "../Header.s"
 
.set REG_MatAnimJoint,20
.set REG_StockJOBJ,29

backup

# check if exists
  lwz r3,OFST_stc_icons(r13)
  cmpwi r3,0
  beq Exit
  lwz REG_MatAnimJoint,0x4(r3)

# Get stock icon jobj
  mr  r3,REG_StockJOBJ
  addi  r4,sp,0x80
  li    r5,1
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
addi	r3, r29, 0