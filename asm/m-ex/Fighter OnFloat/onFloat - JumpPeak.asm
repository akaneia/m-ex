#To be inserted @ 8011bad8
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,31
.set  REG_PlayerData,30

backup
mr  REG_PlayerGObj,r3
lwz REG_PlayerData,0x2C(REG_PlayerGObj)

#Check velocity
  lfs	f1, 0x0084 (REG_PlayerData)
  lfs	f0, -0x6220 (rtoc)
  fcmpo	cr0,f1,f0
  cror	2, 0, 2
  bne Failure
#Check stick up
  lwz	r3, -0x514C (r13)
  lfs	f0, 0x0070 (r3)
  lfs	f1, 0x0624 (REG_PlayerData)
  fcmpo	cr0,f1,f0
  bgt InputSucceed
#Check X/Y
  lwz	r0, 0x065C (REG_PlayerData)
  rlwinm.	r0, r0, 0, 20, 21
  beq Failure

InputSucceed:
#Check if peach
  lwz	r0, 0x4 (REG_PlayerData)
  cmpwi r0,9
  bne CheckOnFloat
#Check float bool
  lwz	r0, 0x222C (REG_PlayerData)
  cmpwi r0,0
  beq Failure
  b PeachFloat

CheckOnFloat:
#Get characters onfloat function
  lwz r4,OFST_onFloat(rtoc)
  lwz r5,0x4(REG_PlayerData)
  mulli r5,r5,4
  lwzx  r12,r4,r5
  cmpwi r12,0
  beq Failure
  mr  r3,REG_PlayerGObj
  li  r4,1
  mtctr r12
  bctrl
  b Exit

PeachFloat:
  mr  r3,REG_PlayerGObj
  li  r4,1
  branchl r12,0x8011bb6c

Success:
  li  r3,1
  b Exit
Failure:
  li  r3,0
Exit:
  restore
  blr
