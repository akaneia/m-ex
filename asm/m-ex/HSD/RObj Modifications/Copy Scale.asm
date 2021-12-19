#To be inserted @ 8037c050
.include "../../../Globals.s"
.include "../../Header.s"

.set  RObj_Scale,8

.set  REG_RObj,31
.set  REG_JObj,29
.set  REG_ThisRObj,12

#Check for robj's with flag X
  mr  REG_ThisRObj,REG_RObj
  b FlagSearchLoop_Check
FlagSearchLoop:
#Check robj flags
  lwz r3,0x4(REG_ThisRObj)
  rlwinm	r3, r3, 0, 4, 31
  cmpwi r3,RObj_Scale
  bne FlagSearchLoop_Inc

.set  REG_ParentJObj,12
#Get RObj's JObj
  lwz REG_ParentJObj,0x8(REG_ThisRObj)
  cmpwi REG_ParentJObj,0
  beq Exit
#Copy parent scale to this jobj
  lfs f1,0x2C(REG_ParentJObj)
  stfs  f1,0x2C(REG_JObj)
  lfs f1,0x30(REG_ParentJObj)
  stfs  f1,0x30(REG_JObj)
  lfs f1,0x34(REG_ParentJObj)
  stfs  f1,0x34(REG_JObj)
  b Exit

FlagSearchLoop_Inc:
#Get next
  lwz REG_ThisRObj,0x0(REG_ThisRObj)
FlagSearchLoop_Check:
  cmpwi REG_ThisRObj,0
  bne FlagSearchLoop

Exit:
  branch  r12,0x8037c0a8
