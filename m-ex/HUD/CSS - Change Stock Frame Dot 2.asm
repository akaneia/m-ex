#To be inserted @ 8025db80
.include "../../Globals.s"
.include "../Header.s"

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

# cast to float
  li  r3,7      # the beloved red dot
  xoris r3,r3,0x8000
  lfd	f1, -0x35F8 (rtoc)
  stw r3,0x84(sp)
  lis r3,0x4330
  stw r3,0x80(sp)
  lfd f2,0x80(sp)
  fsubs f1,f2,f1
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

Exit:
  restore
  mulli	r0, r31, 12