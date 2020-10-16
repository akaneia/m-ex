#To be inserted @ 8016e980
.include "../../Globals.s"
.include "../Header.s"

.set REG_Symbol,31
.set REG_GObj,30
.set REG_Userdata,29
.set REG_Text,28
.set REG_JObj,28
.set REG_Floats,27

backup

# get ifall archive info
  load  r3,0x804d5780
  branchl r12,0x8001819c
# get symbol from ifall
  bl  BGMSymbol
  mflr r4
  branchl r12,0x80380358
  mr. REG_Symbol,r3
  beq Exit

#Create GObj
  li  r3,14
  li  r4,14
  li  r5,0
  branchl r12,GObj_Create
  mr  REG_GObj,r3
#Allocate Space
	li	r3,32
	branchl r12,HSD_MemAlloc
	mr	REG_Userdata,r3
#Zero
	li	r4,32
	branchl r12,ZeroAreaLength
#Initialize
	mr	r6,REG_Userdata
	mr	r3,REG_GObj
	li	r4,4
	load	r5,HSD_Free
	branchl r12,GObj_AddUserData
#Add Process
	mr	r3,REG_GObj
	bl	BGM_Think
	mflr r4
	li	r5,0
  branchl r12,GObj_AddProc

# Get floats
  bl Floats
  mflr REG_Floats

#Create text
  li r3,2
  load r4,0x804a1f58
  lwz r4,0x0(r4)
  branchl r12,0x803a6754
  mr REG_Text,r3
  stw REG_Text,0x0(REG_Userdata)
# Set fixed width
  li r0,1
  stb r0,0x48(REG_Text)
  lfs f1,0x0(REG_Floats)
  stfs f1,0xC(REG_Text)
  lfs f1,0x4(REG_Floats)
  stfs f1,0x10(REG_Text)
# Set kerning
  li r0,1
  stb r0,0x49(REG_Text) # kerning

# Get currently playing HPS
  branchl r12,0x801c5a94
# Get song name
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_BGM(r4)
  lwz r4,Arch_BGM_Labels(r4)
  mulli r3,r3,0x4
  lwzx r4,r3,r4
  mr r3,REG_Text
  lfs	f1, -0x1F38 (rtoc)
  lfs	f2, -0x1F38 (rtoc)
  branchl r12,0x803a6b98

# Create model
  lwz r3,BGMBG_Joint(REG_Symbol)
  branchl r12,0x80370e44
  mr REG_JObj,r3
# Add as object
  mr r3,REG_GObj
  li r4,3
  mr r5,REG_JObj
  branchl r12,0x80390a70
# Add gx link
  mr r3,REG_GObj
  load r4,0x80391070
  li r5,11
  li r6,0
  branchl r12,0x8039069c
# Add anim
  mr r3,REG_JObj
  lwz r4,BMGBG_AnimJoint(REG_Symbol)
  li r5,0
  li r6,0
  branchl r12,0x8036fb5c
# ReqAnimAll
  mr r3,REG_JObj
  lfs	f1, -0x1F38 (rtoc)
  branchl r12,0x8036f8bc
# AnimAll
  mr r3,REG_JObj
  branchl r12,0x80370928

# Adjust height if no timer
  branchl r12,0x8016ae50
  lbz	r0, 0x0001 (r3)
  rlwinm.	r0, r0, 25, 31, 31
  bne IsTimer
  lbz	r0, 0x0000 (r3)
  rlwinm.	r0, r0, 31, 31, 31
  bne IsTimer
  b NoTimer
IsTimer:
  lfs f1,0x1C(REG_Floats)
  stfs f1,0x3C(REG_JObj)
NoTimer:

# Adjust X if widescreen (hacky instruction check, cant think of another way)
  load r3,0x8036a4a8
  lwz r3,0x0(r3)
  load r4,0xc03f0034
  cmpw r3,r4
  beq IsStandard
IsWidescreen:
  lfs f1,0x20(REG_Floats)
  lfs f2,0x38(REG_JObj)
  fadds f1,f1,f2
  stfs f1,0x38(REG_JObj)
IsStandard:

# Update once
  mr r3,REG_GObj
  bl BGM_ThinkFunc

b Exit

###########################
BGM_Think:
blrl
BGM_ThinkFunc:

  backup

.set REG_GObj, 31
.set REG_Userdata,30
.set REG_JObj, 29
.set REG_Text,28
.set REG_Floats,27

# Init
  mr REG_GObj,r3
  lwz REG_Userdata,0x2C(REG_GObj)
  lwz REG_JObj,0x28(REG_GObj)
  lwz REG_Text,0x0(REG_Userdata)
  bl Floats
  mflr REG_Floats

# AnimAll
  mr r3,REG_JObj
  branchl r12,0x80370928

# DirtySub
  mr r3,REG_JObj
  branchl r12,0x803732e8

# Get text joint
  mr r3,REG_JObj
  addi r4,sp,0x80
  li r5,2
  li r6,-1
  branchl r12,0x80011e24
# Get world position
  lwz r3,0x80(sp)
  li r4,0
  addi r5,sp,0x84
  branchl r12,0x8000b1cc
# Move text to position
  lfs f1,0x2C(REG_JObj)
  lfs f2,0x14(REG_Floats)
  fdivs f1,f1,f2          # (scale.X / 4.0)
  lfs f2,0x84 + 0(sp)   # joint position
  fadds f1,f1,f2
  stfs f1,0x0(REG_Text)
  lfs f1,0x30(REG_JObj)
  lfs f2,0x14(REG_Floats)
  fdivs f1,f1,f2          # (scale.Y / 4.0)
  lfs f2,0x84 + 4(sp)   # joint position
  fsubs f1,f1,f2
  stfs f1,0x4(REG_Text)

# Adjust text size
  lfs f1,0x2C(REG_JObj)
  lfs f2,0x10(REG_Floats)
  fmuls f1,f1,f2          # times scalar
  lfs f2,0x18(REG_Floats)
  fmuls f1,f1,f2          # times text scale
  stfs f1,0x24(REG_Text)
  lfs f1,0x30(REG_JObj)
  lfs f2,0x10(REG_Floats)
  fmuls f1,f1,f2          # times scalar
  lfs f2,0x18(REG_Floats)
  fmuls f1,f1,f2          # times text scale
  stfs f1,0x28(REG_Text)

# Check aobj frame
  mr r3,REG_JObj
  branchl r12,0x8000b09c
  cmpwi r3,0
  bne NoDestroy

/*
  lfs f1,0x4(r3)  # curr frame
  lfs f2,0xC(r3)  # end frame
  fcmpo cr0,f1,f2
  blt NoDestroy
*/

# Destroy Text
  mr r3,REG_Text
  branchl r12,0x803a5cc4
# Destroy this GObj
  mr r3,REG_GObj
  branchl r12,0x80390228
  b BGM_Exit
NoDestroy:

BGM_Exit:
  restore
  blr

###########################

Floats:
blrl
# max width
.float 430 # X 0x0
.float 42 # Y 0x4
# scale
.float 0.065 # 0x8
# neg1
.float -1 # 0xC
# Text Scale Mult
.float 0.01 # 0x10
# Text Scale Div
.float 4 # 0x14
# Text Scale (EDIT THIS TO CHANGE SIZE)
.float 4 # 0x18
# BG Model Y Offset w/ timer
.float 14 # 0x1C
# BG Model X Offset w/ widescreen
.float -14 # 0x20

DummyText:
blrl
.string "A Song From Super Smash Bros."
.align 2

BGMSymbol:
blrl
.string "bgm"
.align 2

Exit:
 restore
  lis	r4, 0x8017
  