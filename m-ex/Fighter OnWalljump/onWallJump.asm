#To be inserted @ 800816c4
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerData,31

#runs when a character enters any grounded state
  lwz  r3,OFST_onWallJump(rtoc)
  lwz r4,0x4(REG_PlayerData)
  lbzx  r3,r4,r3
  cmpwi r3,0
  bne Exit
#Branch to fail
  branch  r12,0x80081918

Exit:
