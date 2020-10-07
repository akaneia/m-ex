#To be inserted @ 8025d5ac
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_ExternalID,31
.set  REG_CostumeID,30
.set  REG_PlayerID,29
.set  REG_isNull,28
.set  REG_MnSlChrData,27

# init
  backup
  mr  REG_PlayerID,r3
  mr  REG_ExternalID,r4
  mr  REG_CostumeID,r5
  mr  REG_isNull,r6
  load  REG_MnSlChrData,0x803f0a48

# check if single player
  lbz	r0, -0x49AB (r13)
  cmpwi r0,1
  bne isVS

isSinglePlayer:
# check if p1
  cmpwi REG_PlayerID,0
  beq SinglePlayerP1

SinglePlayerCPU:

## Update CSP ##

# get this players card jobj
  lwz	r3, -0x49DC (r13)
  addi  r4,sp,0x80
  li  r5,6
  li  r6,-1
  crclr	6
  branchl r12,0x80011e24

# get this CSP's frame
  lwz r3,OFST_Metadata_FtExtNum(rtoc)
  subi  r3,r3,HUD_Stride 
  mullw	r0, REG_CostumeID, r3
  add	r4, REG_ExternalID, r0

# update
  lwz  r3,0x80(sp)
  mr  r5,REG_isNull
  bl ApplyAnimation

## Update Emblem ##

# get this players emblem jobj
  lwz	r3, -0x49DC (r13)
  addi  r4,sp,0x80
  li  r5,4
  li  r6,-1
  crclr	6
  branchl r12,0x80011e24

# get insignia ID for this external ID
  lwz r3,OFST_GmRstInsigniaIDs(rtoc)
  lbzx  r4,r3,REG_ExternalID

# update
  lwz  r3,0x80(sp)
  mr  r5,REG_isNull
  bl ApplyAnimation

  b Exit

SinglePlayerP1:
## Update CSP ##

# get this players card jobj
  lwz	r3, -0x49E0 (r13)
  addi  r4,sp,0x80
  li  r5,45
  li  r6,-1
  crclr	6
  branchl r12,0x80011e24

# get this CSP's frame
  lwz r3,OFST_Metadata_FtExtNum(rtoc)
  subi  r3,r3,HUD_Stride 
  mullw	r0, REG_CostumeID, r3
  add	r4, REG_ExternalID, r0

# update
  lwz  r3,0x80(sp)
  mr  r5,REG_isNull
  bl ApplyAnimation

## Update Emblem ##

# get this players emblem jobj
  lwz	r3, -0x49E0 (r13)
  addi  r4,sp,0x80
  li  r5,43
  li  r6,-1
  crclr	6
  branchl r12,0x80011e24

# get insignia ID for this external ID
  lwz r3,OFST_GmRstInsigniaIDs(rtoc)
  lbzx  r4,r3,REG_ExternalID

# update
  lwz  r3,0x80(sp)
  mr  r5,REG_isNull
  bl ApplyAnimation

## Update Stock Icons ##
.set  REG_Count,REG_MnSlChrData-1

# get internal ID
  mulli r3,REG_PlayerID,36
  add r3,r3,REG_MnSlChrData
  lbz r3,0x03C2(r3) # icon ID
  mulli	r3, r3, 28
  lwz  r4,OFST_MnSlChrIconData(rtoc)
  add r3,r3,r4
  lbz r3,0xDD(r3)   # icons external ID
  lwz  r0,OFST_MnSlChrDefineIDs(rtoc)
  mulli r3,r3,3
  lbzx  r3,r3,r0    # icons internal ID

# get stock frame
  mulli r4,REG_PlayerID,36
  add r4,r4,REG_MnSlChrData
  lbz	r4, 0x03C1 (r4)     # costume ID
  branchl r12,GetStockFrame
  stfs  f1,0x84(sp)

  li  REG_Count,0
is1P_StockLoop:
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

is1P_StockIncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,5
  blt is1P_StockLoop
 
 # update high score text
  mr  r3,REG_isNull
  branchl r12,0x8025c020
 
  b Exit


isVS:

## Update CSP ##

# get this players card jobj
  lwz	r3, -0x49E0 (r13)
  addi  r4,sp,0x80
  mulli r5,REG_PlayerID,36
  add r5,r5,REG_MnSlChrData
  lbz r5,0x3B5(r5)
  li  r6,-1
  crclr	6
  branchl r12,0x80011e24

# get this CSP's frame
  lwz r3,OFST_Metadata_FtExtNum(rtoc)
  subi  r3,r3,HUD_Stride 
  mullw	r0, REG_CostumeID, r3
  add	r4, REG_ExternalID, r0

# update
  lwz  r3,0x80(sp)
  mr  r5,REG_isNull
  bl ApplyAnimation


## Update Emblem ##

# get this players card jobj
  lwz	r3, -0x49E0 (r13)
  addi  r4,sp,0x80
  mulli r5,REG_PlayerID,36
  add r5,r5,REG_MnSlChrData
  lbz r5,0x3B4(r5)
  li  r6,-1
  crclr	6
  branchl r12,0x80011e24

# get insignia ID for this external ID
  lwz r3,OFST_GmRstInsigniaIDs(rtoc)
  lbzx  r4,r3,REG_ExternalID

# update
  lwz  r3,0x80(sp)
  mr  r5,REG_isNull
  bl ApplyAnimation

  b Exit

############################
ApplyAnimation:
.set  REG_JOBJ,31
.set  REG_Frame,30
.set  REG_isNull,29

  backup
  mr  REG_JOBJ,r3
  mr  REG_Frame,r4
  mr  REG_isNull,r5

  xoris r3,REG_Frame,0x8000
  lfd	f1, -0x35F8 (rtoc)
  stw r3,0x94(sp)
  lis r3,0x4330
  stw r3,0x90(sp)
  lfd f2,0x90(sp)
  fsubs f1,f2,f1

# apply anim frame
  mr  r3,REG_JOBJ
  li  r4,6
  li  r5,0x400
  load  r6,0x8036410c
  li  r7,1
  crset	6
  branchl r12,0x80364c08
  mr  r3,REG_JOBJ
  branchl r12,0x80370928
  mr  r3,REG_JOBJ
  li  r4,6
  li  r5,0x400
  load  r6,0x8036414c
  li  r7,6
  li  r8,0
  li  r9,0
  crclr	6
  branchl r12,0x80364c08

# if null, hide
  mr  r3,REG_JOBJ
  li  r4,16
  cmpwi REG_isNull,0
  beq ApplyAnimation_Show

ApplyAnimation_Hide:
  branchl r12,0x80371d9c
  b ApplyAnimation_Exit

ApplyAnimation_Show:
  branchl r12,0x80371f00
  b ApplyAnimation_Exit

ApplyAnimation_Exit:
  restore
  blr
############################

Exit:
  restore
  blr