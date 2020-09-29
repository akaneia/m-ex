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

Exit:
  restore
  mulli	r0, r31, 12