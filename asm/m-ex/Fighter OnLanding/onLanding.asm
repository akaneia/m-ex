#To be inserted @ 80069924
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,30
.set  REG_PlayerData,26

#runs when a character enters any grounded state
  lwz  r3,OFST_onLanding(rtoc)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,r4,4
  lwzx  r12,r4,r3
  cmpwi r12,0
  beq Exit
#Branch to function
  mr  r3,REG_PlayerGObj
  mtctr r12
  bctrl
  branch  r12,0x80069938

Exit:
  lwz	r0, 0x0004 (r26)
