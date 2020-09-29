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
  lwz r3,0x80(sp)   # jobj
  lwz r3,0x18(r3)   # dobj
  lwz r3,0x8(r3)   # mobj
  lwz r3,0x8(r3)   # tobj
  lfs  f1,0x84(sp)
  branchl r12,0x8035e800

# set rate
  lwz r3,0x80(sp)   # jobj
  lwz r3,0x18(r3)   # dobj
  lwz r3,0x8(r3)   # mobj
  lwz r3,0x8(r3)   # tobj
  lwz r3,0x64(r3)   # aobj
  lfs	f1, -0x1F20 (rtoc)
  branchl r12,0x8036530c

# anim all
  lwz r3,0x80(sp)   # jobj
  branchl r12,0x80370928

IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,5
  blt Loop
  b Exit


Exit:
  restore