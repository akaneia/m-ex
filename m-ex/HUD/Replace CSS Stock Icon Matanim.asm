#To be inserted @ 80264548
.include "../../Globals.s"
.include "../Header.s"
 

# original codeline, add all anims
branchl r12,0x8036fb5c

.set REG_Count,31
.set REG_StockTOBJ,30
.set REG_MatAnimJoint,29

backup

# get ifall archive info
  load  r3,0x804d5780
  branchl r12,0x8001819c
# get symbol from ifall
  bl  SymbolName
  mflr r4
  branchl r12,0x80380358
# check if exists
  cmpwi r3,0
  beq Exit
  lwz REG_MatAnimJoint,0x4(r3)

# get stock icon jobjs
  li  REG_Count,0
Loop:
# Get stock icon jobj
  lwz	r3, -0x49E0 (r13)
  addi  r4,sp,0x80
  addi    r5,REG_Count,53
  li  r6,-1
  branchl r12,0x80011e24

# add anim
  lwz r3,0x80(sp)
  li  r4,0
  mr  r5,REG_MatAnimJoint
  li  r6,0
  branchl r12,0x8036fb5c

IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,5
  blt Loop

  b Exit

SymbolName:
blrl
.string "Stc_icns"
.align 2

Exit:
restore