#To be inserted @ 800a0070
.include "../../Globals.s"
.include "../Header.s"

.set  REG_EffectID,31
.set  REG_PlayerData,30
.set  REG_PlayerGObj,26

.set  REG_EffectFileID,9
.set  REG_effBehaviorTable,10
.set  REG_EffectIntID,12
.set  REG_EffectType,11
.set  REG_EffectData,6

#Check for custom gfx
  cmpwi	REG_EffectID, PersonalEffectStart
  blt Original
  cmpwi REG_EffectID, CopyEffectStart
  blt PersonalEffect
  cmpwi REG_EffectID, CopyEffectEnd
  blt CopyEffect
  b Original

CopyEffect:
  subi  REG_EffectIntID,REG_EffectID,CopyEffectStart
#Get the copy effect file ID
  lwz r3,OFST_KirbyHatEffectFileIDs(rtoc)
  lwz r4,0x2238(REG_PlayerData)
  lbzx  REG_EffectFileID,r3,r4
  b GetBehavior

PersonalEffect:
  subi  REG_EffectIntID,REG_EffectID,PersonalEffectStart
#Get this fighters effect file ID
  lwz r3,OFST_MnSlChrEffectFileIDs(rtoc)
  lwz r4,0x4(REG_PlayerData)
  lbzx  REG_EffectFileID,r3,r4
  b GetBehavior

GetBehavior:
#Get this effect file ID's effBehaviorTable pointer
  lwz r4,OFST_effBehaviorTable(rtoc)
  mulli r3,REG_EffectFileID,0x4
  lwzx  REG_effBehaviorTable,r3,r4
#Check if this symbol was indexed
  cmpwi REG_effBehaviorTable,0
  beq NoSymbol
#Check if this effect exists
  lwz r3,0x0(REG_effBehaviorTable)    #effect num
  cmpw  REG_EffectIntID,r3
  bge DoesNotExist
#Get effect type from internal ID
  lwz r3,0x4(REG_effBehaviorTable)
  lbzx REG_EffectType,r3,REG_EffectIntID

CustomEffect:
  bl  SkipJumpTable
#*****************************#
.long 0x8009fb00       #Effect_Particle
.long 0 #0x8009fec0    #Effect_DefinePosRot, not needed?
.long 0x8009ffdc       #Effect_UseJointPos
.long 0x8009fc6c #0x8009ffdc    #Effect_UseJointPosRot 8009fc6c
.long 0x800a0010       #Effect_UseJointPos_GroundOrientation
.long 0x8009fc6c       #Effect_FollowJointPos
.long 0x8009fc6c       #Effect_FollowJointPosRot
.long 0 #0x8009fc6c    #Effect_FollowJointPos_GroundOrientation
#*****************************#
SkipJumpTable:
#Get effect type
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,REG_EffectType,0x4		#Each Pointer is 0x4 Long
  lwzx	r4,r4,r5		#Get Pointer Address
  cmpwi r4,0
  beq Original
  mtctr  r4
  bctr

###################################################
DoesNotExist:
#OSReport
  bl  ErrorString
  mflr  r3
  lwz r4,0x4(REG_PlayerData)
  mr  r5,REG_EffectIntID
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
  .string "Error: fighter %d does not have effect %d\n"
  .align 2
###############################################
NoSymbol:
#OSReport
  bl  ErrorString_Symbol
  mflr  r3
  lwz r4,0x4(REG_PlayerData)
  mr  r5,REG_EffectIntID
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
  lis	r3, 0x803C
