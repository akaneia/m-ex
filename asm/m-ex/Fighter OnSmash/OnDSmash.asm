#To be inserted @ 8008cc14
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,30
.set  REG_PlayerData,31

#Check for an onUSmash function
  lwz  r0,OFST_onUSmash(rtoc)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,r4,4
  lwzx  r12,r4,r0
  cmpwi r12,0
  beq Exit
#Branch to function
  mr  r3,REG_PlayerGObj
  mtctr r12
  bctrl
  branch  r12,0x8008cc38

Exit:
  lwz	r0, 0x0004 (r31)
