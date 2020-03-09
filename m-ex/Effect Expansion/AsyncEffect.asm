#To be inserted @ 800a0070
.include "../../Globals.s"
.include "../Header.s"

.set  REG_EffectID,31
.set  REG_PlayerData,30
.set  REG_PlayerGObj,26

.set  REG_EffectIntID,12
.set  REG_EffectType,11
.set  REG_EffectData,6

#Check for custom gfx
  cmpwi	REG_EffectID, CustomEffectStart
  blt Original
  subi  REG_EffectIntID,REG_EffectID,CustomEffectStart

#Get effect type
  lwz r3,OFST_MEXEffectsLookup(rtoc)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,r4,MEXEffectLookup_Stride
  add r4,r3,r4
#Get effect type from internal
  lwz r3,0x4(r4)
  lbzx REG_EffectType,r3,REG_EffectIntID

CustomEffect:
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
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,REG_EffectType,0x4		#Each Pointer is 0x4 Long
  lwzx	r4,r4,r5		#Get Pointer Address
  mtctr  r4
  bctr

Original:
  lis	r3, 0x803C
