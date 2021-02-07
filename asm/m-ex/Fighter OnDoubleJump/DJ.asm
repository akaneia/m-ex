#To be inserted @ 800cba30
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,29
.set  REG_PlayerData,30

#Get on DJ function
  lwz r0,0x4(REG_PlayerData)
  lwz r3,OFST_onDoubleJump(rtoc)
  mulli r0,r0,4
  lwzx  r12,r3,0
  cmpwi r12,0
  beq Exit
#Branch to DJ function
  mr  r3,REG_PlayerGObj
  mtctr r12
  bctrl
  branch  r12,0x800cba9c

Exit:
  branch  r12,0x800cbaa4
