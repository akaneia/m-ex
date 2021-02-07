#To be inserted @ 800c3b54
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,3
.set  REG_PlayerData,31

#runs when a non original tether character is detected
  lwz  r0,OFST_onZair(rtoc)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,r4,4
  lwzx  r12,r4,r0
  cmpwi r12,0
  beq Exit
#Branch to DJ function
  mr  r3,REG_PlayerGObj
  mtctr r12
  bctrl
  branch  r12,0x800c3bb8

Exit:
  li  r3,0
