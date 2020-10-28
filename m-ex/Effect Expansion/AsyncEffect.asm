#To be inserted @ 800a0070
.include "../../Globals.s"
.include "../Header.s"

.set  REG_EffectID,31
.set  REG_FighterData,30
.set  REG_FighterGObj,29
.set  REG_BoneIndex,27


.set  REG_EffectIntID,12
.set  REG_EffectType,11
.set  REG_effBehaviorTable,10
.set  REG_EffectFileID,9
.set  REG_EffectKind,8  # 0 = model, 1 = particle
.set  REG_EffectData,6

#Check for custom gfx
  cmpwi	REG_EffectID, EffMdlStart
  blt Original
  cmpwi REG_EffectID, PtclGenStart
  blt EffectModel
  cmpwi REG_EffectID, CpEffMdlStart
  blt PtclGen
  cmpwi REG_EffectID, CpPtclGenStart
  blt CopyEffectModel
  cmpwi REG_EffectID, MEXEffectEnd
  blt CopyPtclGen
  b Original


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
  subi  REG_EffectIntID,REG_EffectID,CpEffMdlStart
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
  subi  REG_EffectIntID,REG_EffectID,CpPtclGenStart
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
#Check if this behavior exists
  lwz r3,effBhv_effMdlNum(REG_effBehaviorTable)    #effect num
  cmpw  REG_EffectIntID,r3
  bge DoesNotExist
#Get effect type from internal ID
  lwz r3,effBhv_effMdlBhv(REG_effBehaviorTable)
  lbzx REG_EffectType,r3,REG_EffectIntID
  b InitEffect
/*
  bl  SkipEffMdlTable
#*****************************#
.long 0 #0x8009fec0    #EffMdl_DefinePosRot, not needed?
.long 0x8009ffdc       #EffMdl_UseJointPos
.long 0x800a0010       #EffMdl_UseJointPos_GroundOrientation
.long 0x8009fc6c       #EffMdl_UseJointPosRot
.long 0x8009ffdc       #EffMdl_UseJointPosFtDir
.long 0x8009fc6c       #EffMdl_FollowJointPos
.long 0x8009fc6c       #EffMdl_FollowJointPosRot
#.long 0x8009fc6c       #EffMdl_FollowJointPos_GroundOrientation
#*****************************#
SkipEffMdlTable:
#Get effect type
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,REG_EffectType,0x4		#Each Pointer is 0x4 Long
  lwzx	r5,r4,r5		#Get Pointer Address
  cmpwi r5,0
  beq Original
#Check if bl instruction
  rlwinm r0,r5,24,0xFF
  cmpwi r0,0x48
  bne EffMdl_DOLAddr
EffMdl_InjAddr:
  rlwinm	r5,r5,0,6,29		#Mask Bits 6-29 (the offset)
  add	r4,r4,r5		#Gets ASCII Address in r4
  mtctr  r4
  backup
  bctr
EffMdl_DOLAddr:
  mtctr  r5
  bctr
*/
#################################################

ParsePtclGenLookup:
#Check if this behavior exists
  lwz r3,effBhv_ptclGenNum(REG_effBehaviorTable)    #effect num
  cmpw  REG_EffectIntID,r3
  bge DoesNotExist
#Get effect type from internal ID
  lwz r3,effBhv_ptclGenBhv(REG_effBehaviorTable)
  lbzx REG_EffectType,r3,REG_EffectIntID
  b InitEffect
/*
#Get effect type from internal ID
  lwz r3,effBhv_ptclGenBhv(REG_effBehaviorTable)
  lbzx REG_EffectType,r3,REG_EffectIntID
  bl  SkipPtclGenTable
#*****************************#
.long 0x800a0010        # PtclGen_UseJointPos
.long 0x800a0010        # PtclGen_UseJointPosRot
.long 0x800a0010        # PtclGen_UseJointPosRot_Ground
.long 0x800a0010        # PtclGen_UseJointPosFtDir
.long 0x800a0010        # PtclGen_UseJointPos_FtDir_Ground
.long 0x8009fb94        # PtclGen_FollowJointPos
.long 0x8009fb94        # PtclGen_FollowJointPos_FtDir
#*****************************#
SkipPtclGenTable:
#Get effect type
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,REG_EffectType,0x4		#Each Pointer is 0x4 Long
  lwzx	r5,r4,r5		#Get Pointer Address
  cmpwi r5,0
  beq Original
#Check if bl instruction
  rlwinm r0,r5,24,0xFF
  cmpwi r0,0x48
  bne PtclGen_DOLAddr
PtclGen_InjAddr:
  rlwinm	r5,r5,0,6,29		#Mask Bits 6-29 (the offset)
  add	r4,r4,r5		#Gets ASCII Address in r4
  mtctr  r4
  backup
  bctr
PtclGen_DOLAddr:
  mtctr  r5
  bctr
*/
#################################################
InitEffect:
.set  REG_EffectObj,28

backup 
# Alloc object
  load r3,0x80458fa0
  branchl r12,0x8037abc8
  mr REG_EffectObj,r3
# Store spawn type (affects spawn params @ 80067494)
  addi r3, REG_EffectType, 9   # custom spawn type
  stb r3,0x4(REG_EffectObj)
# Store effect ID
  stw REG_EffectID,0x8(REG_EffectObj)
# Store bone jobj
  lwz	r3, 0x05E8 (REG_FighterData)
  rlwinm	r0, REG_BoneIndex, 4, 0, 27
  lwzx r3,r3,r0
  stw r3,0xC(REG_EffectObj)
# Store ZYX from ftcmd
  lfs	f1, 0x84 + 0x100 (sp)
  stfs	f1, 0x10 (REG_EffectObj)
  lfs	f1, 0x88 + 0x100 (sp)
  stfs	f1, 0x14 (REG_EffectObj)
  lfs	f1, 0x8C + 0x100 (sp)
  stfs	f1, 0x18 (REG_EffectObj)
# Store player facing direction
  lfs f1, 0x2C(REG_FighterData)
  stfs	f1, 0x1C (REG_EffectObj)
# Store ground orientation
  lfs	f1, -0x7210 (rtoc)
  lwz r3, 0xE0 (REG_FighterData)
  cmpwi r3,0
  bne Effect_Particle_NoGround
  lfs	f0, 0x0844 (REG_FighterData)
  lfs	f2, 0x0848 (REG_FighterData)
  fneg	f1,f0
  branchl r12,0x80022c30
Effect_Particle_NoGround:
  stfs	f1, 0x20 (REG_EffectObj)


# Unk
  lwz	r3, -0x3E68 (r13)
  cmpwi r3,0
  beq Effect_Exit_AsyncCheck
# Unk
  lbz	r0, 0x000C (r3)
  cmpwi r0,9
  bge Effect_Exit_AsyncCheck
# Unk
  lwz	r0, 0x60C (REG_FighterData)
  stw	r0, 0 (REG_EffectObj)
  stw	REG_EffectObj, 0x60C (REG_FighterData)
  b Effect_Exit_Return
Effect_Exit_AsyncCheck:
# Unk
  mr r3,REG_FighterGObj
  mr r4,REG_EffectObj
  branchl r12,0x8006744c
Effect_Exit_Return:
  restore
  branch r12,0x800a0084

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

Original:
  restore
  lis	r3, 0x803C
