#To be inserted @ 803d70a0
.include "../../Globals.s"
.include "../Header.s"

#r3 = effect ID
#r4 = fighter gobj
#r5 = bone jobj
#r6 = ZYX offset (vec3)
#r7 = facing direction
#r8 = ground orientation

.set  REG_EffectID,31
.set  REG_FighterGObj,30
.set  REG_Bone,29
.set  REG_Offset,28
.set  REG_FacingDirection,27
.set  REG_Orientation,26
.set  REG_FighterData,25

# init
  backup 
  mr REG_EffectID, r3
  mr REG_FighterGObj, r4
  mr REG_Bone, r5
  mr REG_Offset, r6
  mr REG_FacingDirection, r7
  mr REG_Orientation, r8
  lwz REG_FighterData,0x2C(REG_FighterGObj)

#Check for custom gfx
  cmpwi	REG_EffectID, EffMdlStart
  blt DoesNotExist
  cmpwi REG_EffectID, PtclGenStart
  blt EffectModel
  cmpwi REG_EffectID, CpEffMdlStart
  blt PtclGen
  cmpwi REG_EffectID, CpPtclGenStart
  blt CopyEffectModel
  cmpwi REG_EffectID, MEXEffectEnd
  blt CopyPtclGen

.set  REG_EffectIntID,12
.set  REG_EffectType,11
.set  REG_effBehaviorTable,10
.set  REG_EffectFileID,9
.set  REG_EffectKind,8  # 0 = model, 1 = particle
.set  REG_EffectData,6

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

#################################################
InitEffect:
.set  REG_EffectObj,20

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
  stw REG_Bone,0xC(REG_EffectObj)
# Store ZYX from ftcmd
  lfs	f1, 0x0 (REG_Offset)
  stfs	f1, 0x10 (REG_EffectObj)
  lfs	f1, 0x4 (REG_Offset)
  stfs	f1, 0x14 (REG_EffectObj)
  lfs	f1, 0x8 (REG_Offset)
  stfs	f1, 0x18 (REG_EffectObj)
# Store facing direction
  lfs f1, 0x0(REG_FacingDirection)
  stfs	f1, 0x1C (REG_EffectObj)
# Store ground orientation
  lfs	f1, 0x0 (REG_Orientation)
  stfs	f1, 0x20 (REG_EffectObj)
# Return effect object
  mr r3,REG_EffectObj
  restore
  blr

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
