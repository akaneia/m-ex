#To be inserted @ 8025bb1c
.include "../../../Globals.s"
.include "../../Header.s"

.set OSReport,0x803456A8

# check MinorData->x1
lwz        r3,-0x4a10(r13 ) # MinorData->x1
lbz        r0,0x1(r3)       # MinorData->x1
cmplwi     r0,0x0
bne        Exit

# check stage select state
lbz r0,-0x49f1(r13)        
cmpwi r0,0
bne Exit

# check for R press
lwz r0,-0x4A00(r13)
rlwinm. r0,r0,0,25,26
beq Exit

# begin page change logic
.set REG_JOINT,30
.set REG_PAGE,29

# check if pages is supported
  lwz r3,OFST_mexMapData(r13)
  lwz REG_PAGE,0x18(r3)
  cmpwi REG_PAGE,0
  beq Exit

# play page change sfx
  li r3,2
  branchl r12,0x80024030 #play sfx common

# advance page index
  lwz r3,0x08(REG_PAGE) # current page
  lwz r4,0x04(REG_PAGE) # max pages

# check if pressed left or right
  lwz r0,-0x4A00(r13)
  rlwinm. r0,r0,0,26,26 # Right Trigger
  beq MoveLeft

MoveRight:
  addi r3,r3,1
  cmpw r3,r4
  blt SkipOverflow
  li r3,0
  b SkipOverflow

MoveLeft:
  cmpwi r3,0
  bne MovePageLeft
  mr r3,r4

MovePageLeft:
  subi r3,r3,1

SkipOverflow:
  stw r3,0x08(REG_PAGE)

# display test message
#  bl  test_message
#  mflr  r3
#  lwz r4,0x08(REG_PAGE) # current page
#  branchl r12,OSReport

# get animation
  lwz r3,0x08(REG_PAGE)
  mulli r3,r3,4
  lwz r4,0x10(REG_PAGE)
  lwzx r4,r3,r4

# add anim
    lwz REG_JOINT,0x00(REG_PAGE)
    mr r3,REG_JOINT
    li  r5,0
    li  r6,0
    branchl r12,0x8036fb5c # JOBJ_AddAnimAll

    mr  r3,REG_JOINT
    lfs	f1, -0x3640 (rtoc)
    branchl r12,0x8036f8bc # JOBJ_ReqAnimAll

    mr  r3,REG_JOINT
    branchl r12,0x80370928 # JOBJ_AnimAll

#reset pending
    lwz r0,OFST_Metadata_SSSIconCount(rtoc)
    stb r0,-0x49f2(r13)

#reset timer
    li r0,15
    stw  r0,-0x49fc(r13) 


b Exit

#test_message:
#  blrl
#  .string "Current Page %d\n"
#  .align 2

Exit:
lbz r0,-0x49f1(r13)         # continue original operation