#To be inserted @ 8005ff38
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,30
.set  REG_EffectID,28

.set  REG_EffectKind,25
.set  REG_EffectFileID,24
.set  REG_effBehaviorTable,23
.set  REG_EffectIntID,22
.set  REG_EffectType,21
.set  REG_FighterData,20


/*

8039f05c - create generator at position
8039efac - create generator on jobj

8005cf40 - create generator on jobj, use ftdir. needs jobj, facing direction in va_list
*/

  backup

#If under, return to injection site
  subi	r0, r28, 1211
  cmpwi r0,87
  ble Injection_Exit

lwz REG_FighterData,0x2C(REG_PlayerGObj)

# get fighter gobj if item
  lhz r3,0x0(REG_PlayerGObj)
  cmpwi r3,6
  bne NotItem
  lwz r3,0x2C(REG_PlayerGObj)
  lwz r3,0x518(r3)
  lwz REG_FighterData,0x2C(r3)
NotItem:

#Check for kirby
  lwz r3,0x4(REG_FighterData)
  cmpwi r3,4
  beq CheckID_Kirby

CheckID:
#Check for custom gfx
  cmpwi	REG_EffectID, EffMdlStart
  blt Injection_Exit
  cmpwi REG_EffectID, PtclGenStart
  blt EffectModel
  cmpwi REG_EffectID, CpEffMdlStart
  blt PtclGen
  cmpwi REG_EffectID, CpPtclGenStart
  blt CopyEffectModel
  cmpwi REG_EffectID, MEXEffectEnd
  blt CopyPtclGen
  b Injection_Exit

CheckID_Kirby:
#Check for custom gfx
  cmpwi	REG_EffectID, EffMdlStart
  blt Injection_Exit
  cmpwi REG_EffectID, PtclGenStart
  blt CopyEffectModel
  cmpwi REG_EffectID, CpEffMdlStart
  blt CopyPtclGen
  b Injection_Exit

EffectModel:
  li  REG_EffectKind,0
# Get this fighters effect ID
  subi  REG_EffectIntID,REG_EffectID,EffMdlStart
# Get this fighters effect file ID
  lwz r3,OFST_MnSlChrEffectFileIDs(rtoc)
  lwz r4,0x4(REG_FighterData)
  lbzx  REG_EffectFileID,r3,r4
# Get this effect file ID's effBehaviorTable pointer
  mr r3,REG_EffectFileID
  bl  GetBehaviorTable
  mr REG_effBehaviorTable,r3
  b ParseEffMdlLookup
PtclGen:
  li  REG_EffectKind,1
# Get this fighters effect ID
  subi  REG_EffectIntID,REG_EffectID,PtclGenStart
# Get this fighters effect file ID
  lwz r3,OFST_MnSlChrEffectFileIDs(rtoc)
  lwz r4,0x4(REG_FighterData)
  lbzx  REG_EffectFileID,r3,r4
# Get this effect file ID's effBehaviorTable pointer
  mr r3,REG_EffectFileID
  bl  GetBehaviorTable
  mr REG_effBehaviorTable,r3
  b ParsePtclGenLookup
CopyEffectModel:
  li  REG_EffectKind,0
# Get this fighters effect ID
  subi  REG_EffectIntID,REG_EffectID,EffMdlStart    #CpEffMdlStart
# Get the copied fighters effect file ID
  lwz r3,OFST_MnSlChrEffectFileIDs(rtoc)
  lwz r4,0x2238(REG_FighterData)
  lbzx  REG_EffectFileID,r3,r4
# Get this effect file ID's effBehaviorTable pointer
  mr r3,REG_EffectFileID
  bl  GetBehaviorTable
  mr REG_effBehaviorTable,r3
  b ParseEffMdlLookup
CopyPtclGen:
  li  REG_EffectKind,1
# Get this fighters effect ID
  subi  REG_EffectIntID,REG_EffectID,PtclGenStart   #CpPtclGenStart
# Get this fighters effect file ID
  lwz r3,OFST_MnSlChrEffectFileIDs(rtoc)
  lwz r4,0x2238(REG_FighterData)
  lbzx  REG_EffectFileID,r3,r4
# Get this effect file ID's effBehaviorTable pointer
  mr r3,REG_EffectFileID
  bl  GetBehaviorTable
  mr REG_effBehaviorTable,r3
  b ParsePtclGenLookup

#################################################

ParseEffMdlLookup:
#Get final ID (efFileID*1000)
  mulli r3,REG_EffectFileID,1000
  add REG_EffectID,r3,REG_EffectIntID
#Check if this behavior exists
  lwz r3,effBhv_effMdlNum(REG_effBehaviorTable)    #effect num
  cmpw  REG_EffectIntID,r3
  bge DoesNotExist
HasMdlEffect:
#Get effect type from internal ID
  lwz r3,effBhv_effMdlBhv(REG_effBehaviorTable)
  lbzx REG_EffectType,r3,REG_EffectIntID
  bl  SkipEffMdlTable
#*****************************#
bl  EffMdl_Particle # will be removed
bl  EffMdl_DefinePosRot
bl  EffMdl_UseJointPos
bl  EffMdl_UseJointPos_GroundOrientation
bl  EffMdl_UseJointPosRot
bl  EffMdl_UseJointPosFtDir
bl  EffMdl_FollowJointPos
bl  EffMdl_FollowJointPosRot
# bl  EffMdl_FollowJointPos_GroundOrientation
#*****************************#
SkipEffMdlTable:
#Get effect type
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,REG_EffectType,0x4		#Each Pointer is 0x4 Long
  add	r4,r4,r5
  lwz	r5,0x0(r4)		#Get bl Instruction
  cmpwi r5,0
  beq Injection_Exit
#Check if bl instruction
  rlwinm r0,r5,8,0xFF
  cmpwi r0,0x48
  bne EffMdl_DOLAddr
EffMdl_InjAddr:
  rlwinm	r5,r5,0,6,29		#Mask Bits 6-29 (the offset)
  add	r4,r4,r5		#Gets ASCII Address in r4
  mtctr  r4
  bctr
EffMdl_DOLAddr:
  mtctr  r5
  bctr

###################################################
EffMdl_Particle:
# va_list
# Vec3 position
# facing direction
# ground orientation

#Pop jobj pointer off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz r6,0x0(r3)
#Create Effect
  li  r3,0
  mr  r5,REG_EffectID
#Get effect file ID from effect ID
  load  r4,0x10624dd3
  mulhw  r4,r4,r5
  srawi	r4,r4,6
  branchl r12,0x8039efac
  b EffMdl_Exit

EffMdl_DefinePosRot:
#EffMdl_SpawnSync(ID,gobj,vector,float)
.set  REG_EffectObj,29
.set  REG_EffectJObj,28
.set  REG_ParentJObj,27
#Pop the position off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz r5,0x0(r3)
#Create Effect
  mr  r3,REG_EffectID
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c814
  mr. REG_EffectObj,r3
  beq EffMdl_Exit
#Get effect jobj
  lwz r3,0x4(REG_EffectObj)
  lwz REG_EffectJObj,0x28(r3)
#Rotation Y = pi/2
  #lfs	f0, -0x77F8 (rtoc)
  #stfs  f0,0x20(REG_EffectJObj)
#Rotation Z = parent jobj orientation
#Pop the rotation off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz r3,0x0(r3)
  lfs r0,0x0(r3)
  stfs  f0,0x24(REG_EffectJObj)
#Exit
  mr  r3,REG_EffectObj
  b EffMdl_Exit

EffMdl_UseJointPos:
#EffMdl_SpawnSync(ID,gobj,vector)
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  mr  r3,REG_EffectID
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c814
  b EffMdl_Exit

EffMdl_UseJointPos_GroundOrientation:
.set  REG_EffectObj,29
.set  REG_EffectJObj,28
#Pop position off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  mr  r3,REG_EffectID
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c814
  mr. REG_EffectObj,r3
  beq EffMdl_Exit
#Get effect jobj
  lwz r3,0x4(REG_EffectObj)
  lwz REG_EffectJObj,0x28(r3)
#Pop ground orientation off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,2
  branchl r12,0x80322620
  lwz r3,0x0(r3)
#Get roll rotation
  lfs f1,0x0(r3)
#Store roll rotation
  stfs	f1, 0x0024 (REG_EffectJObj)
#Exit
  mr  r3,REG_EffectObj
  b EffMdl_Exit

EffMdl_UseJointPosRot:
#EffMdl_SpawnSync(ID,gobj,jobj)
.set  REG_EffectObj,29
.set  REG_EffectJObj,28
.set  REG_ParentJObj,27
#Pop the jobj off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz REG_ParentJObj,0x0(r3)
#Get jobj world coordinates
  mr  r3,REG_ParentJObj
  li  r4,0
  addi  r5,sp,0x80
  branchl r12,0x8000b1cc
#Create Effect
  mr  r3,REG_EffectID
  mr  r4,REG_PlayerGObj
  addi  r5,sp,0x80        # position
  branchl r12,0x8005c814
  mr. REG_EffectObj,r3
  beq EffMdl_Exit
#Get effect jobj
  lwz r3,0x4(REG_EffectObj)
  lwz REG_EffectJObj,0x28(r3)
#Rotation Y = 0
  lfs	f0, -0x77F8 (rtoc)
  stfs  f0,0x20(REG_EffectJObj)
#Rotation Z = parent jobj orientation
  lfs f0,0x24(REG_ParentJObj)
  stfs  f0,0x24(REG_EffectJObj)
#Exit
  mr  r3,REG_EffectObj
  b EffMdl_Exit

EffMdl_UseJointPosFtDir:
#EffMdl_SpawnSync(ID,gobj,jobj)
.set  REG_EffectObj,29
.set  REG_EffectJObj,28
.set  REG_Pos,27
#Pop the pos off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz REG_Pos,0x0(r3)
#Create Effect
  mr  r3,REG_EffectID
  mr  r4,REG_PlayerGObj
  mr  r5,REG_Pos        # position
  branchl r12,0x8005c814
  mr. REG_EffectObj,r3
  beq EffMdl_Exit
#Get effect jobj
  lwz r3,0x4(REG_EffectObj)
  lwz REG_EffectJObj,0x28(r3)
#Pop the facing direction off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz r3,0x0(r3)
  lfs f1,0x0(r3)
#Determine pitch rotation from facing direction
  lfs	f0, -0x77D0 (rtoc)
  fcmpo	cr0,f1,f0
  bge 0xC
  lfd	f0, -0x77B8 (rtoc)
  b 0x8
  lfd	f0, -0x77B0 (rtoc)
  frsp	f1,f0
#Store pitch rotation
  stfs	f1, 0x0020 (REG_EffectJObj)
#Copy Player JOBJ Scale
  lwz   r3, 0x0028 (REG_PlayerGObj)
  lfs	  f1, 0x002C (r3)
  stfs	f1, 0x002C (REG_EffectJObj)
  lfs	  f1, 0x0030 (r3)
  stfs	f1, 0x0030 (REG_EffectJObj)
  lfs	  f1, 0x0034 (r3)
  stfs	f1, 0x0034 (REG_EffectJObj)

#Exit
  mr  r3,REG_EffectObj
  b EffMdl_Exit

EffMdl_FollowJointPos:
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  mr  r3,REG_EffectID
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c3dc
  b EffMdl_Exit

EffMdl_FollowJointPosRot:
#EffMdl_SpawnSync(ID,gobj,jobj)
#Pop the JOBJ of the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  mr  r3,REG_EffectID
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c5c4 #0x8005c814
  b EffMdl_Exit

/*
EffMdl_FollowJointPos_GroundOrientation:
.set  REG_EffectObj,29
.set  REG_EffectJObj,28
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  mr  r3,REG_EffectID
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c1b4
  mr. REG_EffectObj,r3
  beq EffMdl_Exit
#Get effect jobj
  lwz r3,0x4(REG_EffectObj)
  lwz REG_EffectJObj,0x28(r3)

#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz r3,0x0(r3)
#Get facing direction
  lfs f1,0x0(r3)
#Determine pitch rotation from facing direction
  lfs	f0, -0x77D0 (rtoc)
  fcmpo	cr0,f1,f0
  bge 0xC
  lfd	f0, -0x77B8 (rtoc)
  b 0x8
  lfd	f0, -0x77B0 (rtoc)
  frsp	f1,f0
#Store pitch rotation
  stfs	f1, 0x0020 (REG_EffectJObj)

#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz r3,0x0(r3)
#Get roll rotation
  lfs f1,0x0(r3)
#Store roll rotation
  stfs	f1, 0x0024 (REG_EffectJObj)

  mr  r3,REG_EffectObj
  b EffMdl_Exit

*/

EffMdl_Exit:
  restore
  mr  r31,r3
  branch  r12,0x80061d08


#################################################

ParsePtclGenLookup:
#Get final ID (efFileID*1000)
  mulli r3,REG_EffectFileID,1000
  add REG_EffectID,r3,REG_EffectIntID
#Check if this behavior exists
  lwz r3,effBhv_ptclGenNum(REG_effBehaviorTable)    #effect num
  cmpw  REG_EffectIntID,r3
  bge DoesNotExist
HasPtclEffect:
#Get effect type from internal ID
  lwz r3,effBhv_ptclGenBhv(REG_effBehaviorTable)
  lbzx REG_EffectType,r3,REG_EffectIntID
  bl  SkipPtclGenTable
#*****************************#
# 0x800a0010 seems to setup the effect object with everything i need. 
# it includes jobj, offset from ftcmd, facing direction, ground orientation
bl  PtclGen_UseJointPos                   # PtclGen_UseJointPos
bl  PtclGen_UseJointPosRot                # PtclGen_UseJointPosRot
bl  PtclGen_UseJointPosRot_Ground         # PtclGen_UseJointPosRot_Ground
bl  PtclGen_UseJointPosFtDir              # PtclGen_UseJointPosFtDir
bl  PtclGen_UseJointPos_FtDir_Ground      # PtclGen_UseJointPos_FtDir_Ground
bl  PtclGen_FollowJointPos                # PtclGen_FollowJointPos
bl  PtclGen_FollowJointPos_FtDir          # PtclGen_FollowJointPos_FtDir
bl  PtclGen_FollowJointPos_CopyGObjScale  # PtclGen_FollowJointPos_CopyGObjScale
#*****************************#
SkipPtclGenTable:
#Get effect type
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,REG_EffectType,0x4		#Each Pointer is 0x4 Long
  add	r4,r4,r5
  lwz	r5,0x0(r4)		#Get bl Instruction
  cmpwi r5,0
  beq Injection_Exit
#Check if bl instruction
  rlwinm r0,r5,8,0xFF
  cmpwi r0,0x48
  bne PtclGen_DOLAddr
PtclGen_InjAddr:
  rlwinm	r5,r5,0,6,29		#Mask Bits 6-29 (the offset)
  add	r4,r4,r5		#Gets ASCII Address in r4
  mtctr  r4
  bctr
PtclGen_DOLAddr:
  mtctr  r5
  bctr

###################################################

PtclGen_UseJointPos:
# va_list
# Vec3 position
.set  REG_Pos,29
#Pop pos pointer off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz REG_Pos,0x0(r3)
#Create Effect
  li  r3,0
  mr  r5,REG_EffectID
#Get effect file ID from effect ID
  load  r4,0x10624dd3
  mulhw  r4,r4,r5
  srawi	r4,r4,6
  branchl r12,0x8039f05c
#Set position
  cmpwi r3,0
  beq PtclGen_UseJointPos_Exit
  lfs f1,0x0(REG_Pos)
  stfs f1,0x24(r3)
  lfs f1,0x4(REG_Pos)
  stfs f1,0x28(r3)
  lfs f1,0x8(REG_Pos)
  stfs f1,0x2C(r3)
PtclGen_UseJointPos_Exit:
  b PtclGen_Exit

PtclGen_FollowJointPos:
# va_list
# JOBJ

#Pop jobj pointer off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz r6,0x0(r3)
#Create Effect
  li  r3,0
  mr  r5,REG_EffectID
#Get effect file ID from effect ID
  load  r4,0x10624dd3
  mulhw  r4,r4,r5
  srawi	r4,r4,6
  branchl r12,0x8039efac
  b PtclGen_Exit

PtclGen_FollowJointPos_FtDir:
# va_list
# JOBJ
# Facing Direction
# Create Effect
  mr  r3,REG_EffectID
  addi	r4, sp, 508 + 0x100     # va_list
  branchl r12,0x8005cf40
  b PtclGen_Exit

PtclGen_FollowJointPos_CopyGObjScale:
# va_list
# JOBJ
# Facing Direction
# Create Effect
  mr  r3,REG_EffectID
  addi	r4, sp, 508 + 0x100     # va_list
  mr r5, REG_PlayerGObj
  branchl r12,0x8005cd2c
  b PtclGen_Exit

PtclGen_UseJointPosRot:
PtclGen_UseJointPosRot_Ground:
PtclGen_UseJointPosFtDir:
PtclGen_UseJointPos_FtDir_Ground:
PtclGen_Exit:
  restore
  mr  r31,r3
  branch  r12,0x80061d08

###################################################
GetBehaviorTable:
  lwz r4,OFST_effBehaviorTable(rtoc)
  mulli r3,r3,0x4
  lwzx  r3,r3,r4
#Check if this symbol was indexed
  cmpwi r3,0
  beq NoSymbol
  blr
DoesNotExist:
#OSReport
  bl  ErrorString
  mflr  r3
  lwz r4,0x4(REG_FighterData)
# get effect type string
  bl  EffectNames
  mflr r5
  mulli r6,REG_EffectKind, 0x8
  add r5,r5,r6
  mr  r6,REG_EffectIntID
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
Assert_Name:
  blrl
  .string "m-ex"
  .align 2
ErrorString:
  blrl
  .string "Error: fighter %d does not have %s effect %d\n"
  .align 2
EffectNames:
  blrl
  .string "model"
  .align 2
  .string "ptclgen"
###############################################
NoSymbol:
#OSReport
  bl  ErrorString_Symbol
  mflr  r3
  lwz r4,0x4(REG_FighterData)
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
ErrorString_Symbol:
  blrl
  .string "Error: fighter %d does not have effBehaviorTable\n"
  .align 2
###############################################



Injection_Exit:
  restore
  subi	r0, r28, 1211