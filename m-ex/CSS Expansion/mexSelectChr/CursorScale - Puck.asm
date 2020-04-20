#To be inserted @ 80264da8
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_JObj,18

#Original
  addi	r18, r3, 0

#Check for mexSelectChr
  lwz r3,OFST_mexSelectChr(r13)
  cmpwi r3,0
  beq Original

#Scale Puck
  lwz r3,OFST_Menu_Param(rtoc)
  lfs f1,Arch_Menu_MenuParam(r3)
  lfs f2,0x2C(REG_JObj)
  fmuls f2,f1,f2
  stfs f2,0x2C(REG_JObj)
  lfs f2,0x30(REG_JObj)
  fmuls f2,f1,f2
  stfs f2,0x30(REG_JObj)
  lfs f2,0x34(REG_JObj)
  fmuls f2,f1,f2
  stfs f2,0x34(REG_JObj)

Original:
