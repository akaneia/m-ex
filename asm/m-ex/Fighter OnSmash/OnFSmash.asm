#To be inserted @ 8008c360
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,3
.set  REG_PlayerData,31

#Check for an onFSmash function
  lwz  r0,OFST_onFSmash(rtoc)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,r4,4
  lwzx  r12,r4,r0
  cmpwi r12,0
  beq Exit
#Branch to function
  mtctr r12
  bctrl
  branch  r12,0x8008c3cc

Exit:
  lwz	r4, 0x0004 (r31)
