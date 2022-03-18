#To be inserted @ 800d8cb4
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,30
.set  REG_PlayerData,31

  lwz REG_PlayerData,0x2c(REG_PlayerGObj)
#Check for an onCatch function
  lwz r0,OFST_FighterOnCatch(rtoc)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,r4,4
  lwzx  r12,r4,r0
  cmpwi r12,0
  beq Exit
#Branch to function
  mr r3, REG_PlayerGObj
  mtctr r12
  bctrl

Exit:
  lwz r0,0x0024(r1)