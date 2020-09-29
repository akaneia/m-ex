#To be inserted @ 8025ee70
.include "../../Globals.s"
.include "../Header.s"

branchl r12,0x8025d5ac

.set  REG_Count,31

backup

# check if single player css with stock icons
  lbz	r0, -0x49AB (r13)
  cmpwi r0,1
  bne Exit

# check if exists
  lwz r3,OFST_stc_icons(r13)
  cmpwi r3,0
  beq Exit

# get internal ID
  add	r4, r30, r29
  lbz	r3, 0x03C2 (r4)   # icon hovered over
  mulli	r3, r3, 28
  lwz  r5,OFST_MnSlChrIconData(rtoc)
  add r3,r5,r3
  lbz r3,0xDD(r3)   # icons external ID
  lwz  r0,OFST_MnSlChrDefineIDs(rtoc)
  mulli r3,r3,3
  lbzx  r3,r3,r0

# get stock frame
  add	r4, r30, r29
  lbz	r4, 0x03C1 (r4)
  branchl r12,GetStockFrame
  stfs  f1,0x84(sp)

# get stock icon jobjs
  li  REG_Count,0
Loop:
# Get stock icon jobj
  lwz	r3, -0x49E0 (r13)
  addi  r4,sp,0x80
  addi    r5,REG_Count,53
  li  r6,-1
  branchl r12,0x80011e24

# change stock frame
  lwz r3,0x80(sp)
  li  r4,6
  li  r5,0x400
  load  r6,0x8036410c
  li  r7,1
  lfs  f1,0x84(sp)
  crset 6
  branchl r12,0x80364c08
  lwz r3,0x80(sp)
  branchl r12,0x80370928

IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,5
  blt Loop
  b Exit


Exit:
  restore