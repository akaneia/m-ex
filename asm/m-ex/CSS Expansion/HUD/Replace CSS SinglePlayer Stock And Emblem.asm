#To be inserted @ 80264548
.include "../../../Globals.s"
.include "../../Header.s"
 

# original codeline, add all anims
branchl r12,0x8036fb5c

.set REG_Count,31
.set REG_StockTOBJ,30
.set REG_EmblemMatAnimJoint,29
.set REG_CSPMatAnim,28
.set REG_StockMatAnimJoint,27
.set REG_Archive,26


backup

# get ifall archive info
  load  r3,0x804d5780
  branchl r12,0x8001819c
  mr  REG_Archive,r3
# get symbol from ifall
  bl  StockSymbol
  mflr r4
  branchl r12,0x80380358
  mr. REG_StockMatAnimJoint,r3
  beq NoStock
  lwz REG_StockMatAnimJoint,0x4(REG_StockMatAnimJoint)
NoStock:


# get symbol from ifall
  mr r3,REG_Archive
  bl  EmblemSymbol
  mflr r4
  branchl r12,0x80380358
  mr. REG_EmblemMatAnimJoint,r3
NoEmblem:

# get csp matanim from mexSlChr
  lwz REG_CSPMatAnim,OFST_mexSelectChr(r13)
  cmpwi REG_CSPMatAnim,0
  beq NoCSP
  lwz  REG_CSPMatAnim,SlChr_CSPMatAnim(REG_CSPMatAnim)
NoCSP:


# check if stock exists
  cmpwi REG_StockMatAnimJoint,0
  beq StockSkip
# get stock icon jobjs
  li  REG_Count,0
Stock_Loop:
# Get stock icon jobj
  lwz	r3, -0x49E0 (r13)
  addi  r4,sp,0x80
  addi    r5,REG_Count,53
  li  r6,-1
  branchl r12,0x80011e24
# add anim
  lwz r3,0x80(sp)
  li  r4,0
  mr  r5,REG_StockMatAnimJoint
  li  r6,0
  branchl r12,0x8036fb5c
Stock_IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,5
  blt Stock_Loop
StockSkip:

# check if emblem exists
  cmpwi REG_EmblemMatAnimJoint,0
  beq EmblemSkip
# Get emblem icon jobj
  lwz	r3, -0x49E0 (r13)
  addi  r4,sp,0x80
  li  r5,43
  li  r6,-1
  branchl r12,0x80011e24
# jobj -> dobj -> dobj
  lwz r3,0x80(sp)             # jobj
  lwz r3,0x18(r3)             # dobj
  lwz r3,0x4(r3)             # next dobj
# add anim
  lwz  r4,0x8(REG_EmblemMatAnimJoint)
  li  r5,0
  branchl r12,0x8035dea0
EmblemSkip:

# check if csp exists
  cmpwi REG_CSPMatAnim,0
  beq CSPSkip
# Get csp jobj
  lwz	r3, -0x49E0 (r13)
  addi  r4,sp,0x80
  li  r5,45
  li  r6,-1
  branchl r12,0x80011e24
# jobj -> dobj
  lwz r3,0x80(sp)             # jobj
  lwz r3,0x18(r3)             # dobj
# add anim
  mr r4, REG_CSPMatAnim
  li  r5,0
  branchl r12,0x8035dea0
CSPSkip:

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