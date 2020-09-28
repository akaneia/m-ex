#To be inserted @ 80175e4c
.include "../../Globals.s"
.include "../Header.s"

.set REG_Count,31
.set REG_MatAnimJoint,30
.set REG_StockJOBJ,27

backup

# get ifall archive info
  load  r3,0x804d5780
  branchl r12,0x8001819c
# get symbol from ifall
  bl  SymbolName
  mflr r4
  branchl r12,0x80380358
# check if exists
  mr. REG_MatAnimJoint,r3
  beq Exit

# get stock icon jobjs
  li  REG_Count,0
Loop:
# Get stock icon jobj
  mr  r3,REG_StockJOBJ
  addi  r4,sp,0x80
  addi    r5,REG_Count,25
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

IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,4
  blt Loop

  b Exit

SymbolName:
blrl
.string "mexIconAnim"
.align 2

Exit:
restore
mr	r3, r27