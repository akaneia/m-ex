#To be inserted @ 800a0070
.include "../../Globals.s"
.include "../Header.s"

.set  REG_EffectID,31
.set  REG_PlayerData,30
.set  REG_PlayerGObj,26

.set  REG_EffectData,6

#Check for custom gfx
  cmpwi	REG_EffectID, CustomEffectStart
  blt Original
CustomEffect:
#Get this effects data
  lwz r3,OFST_EffectsAdded(rtoc)
  subi  r0,REG_EffectID,CustomEffectStart
  mulli r0,r0,0x8
  add  REG_EffectData,r3,r0
  bl  SkipJumpTable
#*****************************#
.long 0x8009fb00    #Effect_Particle
.long 0x8009ffdc    #Effect_UseJointPos
.long 0x800a0010    #Effect_UseJointPos_GroundOrientation
.long 0x8009fc6c    #Effect_FollowJointPos
.long 0x8009fc6c    #Effect_FollowJointPosRot
.long 0x8009fc6c    #Effect_FollowJointPos_GroundOrientation
#*****************************#
SkipJumpTable:
#Get effect type
  lwz r3,0x4(REG_EffectData)
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,r3,0x4		#Each Pointer is 0x4 Long
  lwzx	r4,r4,r5		#Get Pointer Address
  mtctr  r4
  bctr

Original:
  lis	r3, 0x803C
