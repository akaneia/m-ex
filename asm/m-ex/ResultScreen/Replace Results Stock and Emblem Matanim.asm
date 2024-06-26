#To be inserted @ 80175e4c
.include "../../Globals.s"
.include "../Header.s"

.set REG_Count,31
.set REG_MatAnimJoint,30
.set REG_Archive,29
.set REG_StockJOBJ,27

backup

# get ifall archive info
  load  r3,0x804d5780
  branchl r12,0x8001819c
  mr  REG_Archive,r3
# get symbol from ifall
  bl  StockSymbol
  mflr r4
  branchl r12,0x80380358
# check if exists
  cmpwi r3,0
  beq Exit
  lwz REG_MatAnimJoint,0x4(r3)

# get stock icon jobjs
  li  REG_Count,0
Stock_Loop:
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

Stock_IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,4
  blt Stock_Loop

# get emblem symbol from ifall
  mr  r3, REG_Archive
  bl  EmblemSymbol
  mflr r4
  branchl r12,0x80380358
# check if exists
  mr.  REG_MatAnimJoint,r3
  beq Exit  

# get stock icon jobjs
  li  REG_Count,0
Emblem_Loop:
# Get emblem icon jobj
  mr  r3,REG_StockJOBJ
  addi  r4,sp,0x80
  addi  r5,REG_Count,66
  li  r6,-1
  branchl r12,0x80011e24

# jobj -> dobj
  lwz r3,0x80(sp)             # jobj
  lwz r3,0x18(r3)             # dobj

# add anim
  lwz  r4,0x8(REG_MatAnimJoint)
  li  r5,0
  branchl r12,0x8035dea0

Emblem_IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,4
  blt Emblem_Loop

  b Exit

StockSymbol:
blrl
.string "Stc_icns"
.align 2

EmblemSymbol:
blrl
.string "Eblm_matanim_joint"
.align 2

Exit:
restore
mr	r3, r27