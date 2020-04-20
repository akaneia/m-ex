#To be inserted @ 80264c48
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_JObj,4

#Original
addi	r30, r3, 0

#Check for mexSelectChr
  lwz r3,OFST_mexSelectChr(r13)
  cmpwi r3,0
  beq Original

#Get child jobj
  lwz REG_JObj,0x10(r30)

#Scale Hand
  lwz r3,OFST_Menu_Param(rtoc)
  lfs f1,MenuParam_HandScale(r3)
  lfs f2,0x2C(REG_JObj)
  fmuls f2,f1,f2
  stfs f2,0x2C(REG_JObj)
  lfs f2,0x30(REG_JObj)
  fmuls f2,f1,f2
  stfs f2,0x30(REG_JObj)
  lfs f2,0x34(REG_JObj)
  fmuls f2,f1,f2
  stfs f2,0x34(REG_JObj)
#Shift hand over
  bl  Floats
  mflr  r3
  lfs f3,0x0(r3)
  fsubs f1,f3,f1
  lfs f2,-0x34c0(rtoc)
  fmuls f2,f1,f2
  stfs f2,0x38(REG_JObj)
  lfs f2,-0x34bc(rtoc)
  fmuls f2,f1,f2
  stfs f2,0x3C(REG_JObj)

#Update
  mr  r3,r30
  branchl r12,0x803732e8

  b Original

Floats:
blrl
.float 1

Original:
