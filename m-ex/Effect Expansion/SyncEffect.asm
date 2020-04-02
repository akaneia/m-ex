#To be inserted @ 8005ff40
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,30
.set  REG_EffectID,28

.set  REG_EffectIntID,22
.set  REG_EffectType,21
.set  REG_PlayerData,20

#If under, return to injection site
  cmpwi r0,87
  ble Injection_Exit

#Check if using a custom effect
  cmpwi REG_EffectID,CustomEffectStart
  blt Injection_Exit

#Init
  backup
  lwz REG_PlayerData,0x2C(REG_PlayerGObj)
  subi  REG_EffectIntID,REG_EffectID,CustomEffectStart     #get char effect ID

#Get final ID (efFileID*10000) + (externalID-1400)
  lwz r3,OFST_MnSlChrEffectFileIDs(rtoc)
  lwz r4,0x4(REG_PlayerData)
  lbzx  r3,r3,r4
  mulli r3,r3,1000
  add REG_EffectID,r3,REG_EffectIntID

#Get effect type
  lwz r3,OFST_MEXEffectsLookup(rtoc)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,r4,MEXEffectLookup_Stride
  add r4,r3,r4
#Get effect type from internal
  lwz r3,0x4(r4)
  lbzx REG_EffectType,r3,REG_EffectIntID
#Check if exists
  lwz r3,0x0(r4)
  cmpw  REG_EffectIntID,r3
  bge DoesNotExist

#Get this effects data
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
  mflr	r4		#Jump Table Start in r4
#Get Current Page
  mulli	r5,REG_EffectType,0x4		#Each Pointer is 0x4 Long
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
  mr  r5,REG_EffectID
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
  mr  r3,REG_EffectID
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
  mr  r3,REG_EffectID
  mr  r4,REG_PlayerGObj
  branchl r12,0x8005c814
  mr. REG_EffectObj,r3
  beq Exit
#Get effect jobj
  lwz r3,0x4(REG_EffectObj)
  lwz REG_EffectJObj,0x28(r3)

#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,2
  branchl r12,0x80322620
  lwz r3,0x0(r3)
#Get roll rotation
  lfs f1,0x0(r3)
#Store roll rotation
  stfs	f1, 0x0024 (REG_EffectJObj)

  mr  r3,REG_EffectObj
  b Exit

Effect_FollowJointPos:
#Pop some arg off the va_list
  addi	r3, sp, 508 + 0x100
  li  r4,1
  branchl r12,0x80322620
#Create Effect
  lwz r5,0x0(r3)
  mr  r3,REG_EffectID
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
  mr  r3,REG_EffectID
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
  mr  r3,REG_EffectID
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

  mr  r3,REG_EffectObj
  b Exit

###################################################
DoesNotExist:
#OSReport
  bl  ErrorString
  mflr  r3
  mr  r4,REG_EffectIntID
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
  .string "Error: Fighter does not have effect ID %d\n"
  .align 2
###############################################

Exit:
  restore
  mr  r31,r3
  branch  r12,0x80061d08

Injection_Exit:
