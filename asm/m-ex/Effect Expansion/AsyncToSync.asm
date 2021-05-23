#To be inserted @ 8006747c
.include "../../Globals.s"
.include "../Header.s"

.set  REG_EffectID,31
.set  REG_EffectObj,30
.set  REG_FighterGObj,29
.set  REG_FighterData,28

.set  REG_EffectIntID,12
.set  REG_EffectType,11
.set  REG_effBehaviorTable,10
.set  REG_EffectFileID,9

backup


lwz REG_FighterData,0x2C(REG_FighterGObj)

# get fighter gobj if item
  lhz r3,0x0(REG_FighterGObj)
  cmpwi r3,6
  bne CheckID
  lwz r3,0x2C(REG_FighterGObj)
  lwz r3,0x518(r3)
  cmpwi r3,0
  beq CheckID
  lwz REG_FighterData,0x2C(r3)

CheckID:
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
#Get effect type from internal ID
  lwz r3,effBhv_effMdlBhv(REG_effBehaviorTable)
  lbzx REG_EffectType,r3,REG_EffectIntID
  bl  SkipEffMdlTable
#*****************************#
bl  EffMdl_Particle       # will be removed
bl  EffMdl_DefinePosRot
bl  EffMdl_UseJointPos
bl  EffMdl_UseJointPos_GroundOrientation
bl  EffMdl_UseJointPosRot
bl  EffMdl_UseJointPosFtDir
bl  EffMdl_FollowJointPos
bl  EffMdl_FollowJointPosRot
#*****************************#
SkipEffMdlTable:
#Get effect type
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,REG_EffectType,0x4		#Each Pointer is 0x4 Long
  add	r4,r4,r5
  lwz	r5,0x0(r4)		#Get bl Instruction
  cmpwi r5,0
  beq Original
  rlwinm	r5,r5,0,6,29		#Mask Bits 6-29 (the offset)
  add	r4,r4,r5		#Gets ASCII Address in r4
  mtctr  r4
  bctr

#################################################

EffMdl_Particle:
  b Exit

EffMdl_DefinePosRot:
# Will be unused, impossible to use from async
# May as well redirect to usejointpos
  b EffMdl_UseJointPosRot

EffMdl_UseJointPos:
# Get joint position + offset from ftcmd
  lwz	r3, 0x000C (REG_EffectObj)
  addi r4,REG_EffectObj,16
  addi r5,sp,0x80
  branchl r12,0x8000b1cc
  mr   r3,REG_EffectID
  mr   r4,REG_FighterGObj
  addi r5,sp,0x80
  addi r6,REG_EffectObj,28  # facing direction
  addi r7,REG_EffectObj,32  # ground orientation
  branchl r12,0x8005fddc
  b Exit

EffMdl_UseJointPos_GroundOrientation:
  b EffMdl_UseJointPos

EffMdl_UseJointPosRot:
  b EffMdl_UseJointPos

EffMdl_UseJointPosFtDir:
  b EffMdl_UseJointPos

EffMdl_FollowJointPos:
  mr   r3,REG_EffectID
  mr   r4,REG_FighterGObj
  lwz	r5, 0x000C (REG_EffectObj)
  branchl r12,0x8005fddc
  b Exit
  
EffMdl_FollowJointPosRot:
  b EffMdl_FollowJointPos

###################################################

ParsePtclGenLookup:
#Get effect type from internal ID
  lwz r3,effBhv_ptclGenBhv(REG_effBehaviorTable)
  lbzx REG_EffectType,r3,REG_EffectIntID
  bl  SkipPtclGenTable
#*****************************#
bl PtclGen_UseJointPos
bl PtclGen_UseJointPosRot
bl PtclGen_UseJointPosRot_Ground
bl PtclGen_UseJointPosFtDir
bl PtclGen_UseJointPos_FtDir_Ground
bl PtclGen_FollowJointPos
bl PtclGen_FollowJointPos_FtDir
#*****************************#
SkipPtclGenTable:
#Get effect type
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,REG_EffectType,0x4		#Each Pointer is 0x4 Long
  add	r4,r4,r5
  lwz	r5,0x0(r4)		#Get bl Instruction
  cmpwi r5,0
  beq Original
  rlwinm	r5,r5,0,6,29		#Mask Bits 6-29 (the offset)
  add	r4,r4,r5		#Gets ASCII Address in r4
  mtctr  r4
  bctr

###################################################

PtclGen_UseJointPos:
# Get joint position + offset from ftcmd
  lwz	r3, 0x000C (REG_EffectObj)
  addi r4,REG_EffectObj,16
  addi r5,sp,0x80
  branchl r12,0x8000b1cc
  mr   r3,REG_EffectID
  mr   r4,REG_FighterGObj
  addi r5,sp,0x80           # position
  addi r6,REG_EffectObj,28  # facing direction
  addi r7,REG_EffectObj,32  # ground orientation
  branchl r12,0x8005fddc
  b Exit
PtclGen_UseJointPosRot:
  b Exit
PtclGen_UseJointPosRot_Ground:
  b Exit
PtclGen_UseJointPosFtDir:
  b Exit
PtclGen_UseJointPos_FtDir_Ground:
  b Exit
PtclGen_FollowJointPos:
  mr   r3,REG_EffectID
  mr   r4,REG_FighterGObj
  lwz  r5,0xC(REG_EffectObj)
  branchl r12,0x8005fddc
  b Exit

PtclGen_FollowJointPos_FtDir:
  mr   r3,REG_EffectID
  mr   r4,REG_FighterGObj
  lwz	r5, 0x000C (REG_EffectObj)    # jobj
  addi r6,REG_EffectObj,28          # facing direction
  branchl r12,0x8005fddc
  b Exit

###################################################
GetBehaviorTable:
  lwz r4,OFST_effBehaviorTable(rtoc)
  mulli r3,r3,0x4
  lwzx  r3,r3,r4
  blr
###################################################

Exit:
  restore
  branch r12,0x800675f8

Original:
  restore