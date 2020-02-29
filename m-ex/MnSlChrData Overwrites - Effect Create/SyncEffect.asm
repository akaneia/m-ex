#To be inserted @ 8005ff40
.include "../../Globals.s"
.include "../Header.s"

.set  REG_EffectData,31
.set  REG_PlayerGObj,30
.set  REG_EffectID,28

#If under, return to injection site
  cmpwi r0,87
  ble Injection_Exit

#Check if using a custom effect
  cmpwi REG_EffectID,CustomEffectStart
  blt Injection_Exit

backup

#Get expanded effect table
  lwz r3,OFST_EffectsAdded(rtoc)
  #bl  Test
  #mflr  r3
#Get this effects data
  subi  r0,r28,CustomEffectStart
  mulli r0,r0,0x8
  add  REG_EffectData,r3,r0
  bl  SkipJumpTable

#*****************************#
bl  Effect_Particle
bl  Effect_UseJointPos
bl  Effect_UseJointPos_GroundOrientation
bl  Effect_FollowJointPos
bl  Effect_FollowJointPosRot
bl  Effect_FollowJointPos_GroundOrientation
#*****************************#

SkipJumpTable:
#Get effect type
  lwz r3,0x4(REG_EffectData)
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,r3,0x4		#Each Pointer is 0x4 Long
  add	r4,r4,r5		#Get Event's Pointer Address
  lwz	r5,0x0(r4)		#Get bl Instruction
  rlwinm	r5,r5,0,6,29		#Mask Bits 6-29 (the offset)
  add	r4,r4,r5		#Gets ASCII Address in r4
  mtctr  r4
  bctr

###################################################
Effect_Particle:
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r6,0x0(r3)
  li  r3,0
  lwz r5,0x0(REG_EffectData)
#Get effect file ID from effect ID
  load  r4,0x10624dd3
  mulhw  r4,r4,r5
  srawi	r4,r4,6
  branchl r12,0x8039efac
  b Exit

Effect_UseJointPos:
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  lwz r3,0x0(REG_EffectData)
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c814
  b Exit

Effect_UseJointPos_GroundOrientation:
.set  REG_EffectObj,29
.set  REG_EffectJObj,28
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  lwz r3,0x0(REG_EffectData)
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c814
  mr. REG_EffectObj,r3
  beq Exit
#Get effect jobj
  lwz r3,0x4(REG_EffectObj)
  lwz REG_EffectJObj,0x28(r3)

#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
  lwz r3,0x0(r3)
#Get roll rotation
  lfs f1,0x0(r3)
#Store roll rotation
  stfs	f1, 0x0024 (REG_EffectJObj)
  b Exit

Effect_FollowJointPos:
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  lwz r3,0x0(REG_EffectData)
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c3dc
  b Exit

Effect_FollowJointPosRot:
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  lwz r3,0x0(REG_EffectData)
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c5c4
  b Exit

Effect_FollowJointPos_GroundOrientation:
.set  REG_EffectObj,29
.set  REG_EffectJObj,28
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  lwz r3,0x0(REG_EffectData)
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c1b4
  mr. REG_EffectObj,r3
  beq Exit
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
  b Exit

###################################################

Exit:
  restore
  branch  r12,0x80061d08

Test:
blrl
#firefox
.long 51009
.long 0
#falcon punch
.long 51002
.long 3

Injection_Exit:
