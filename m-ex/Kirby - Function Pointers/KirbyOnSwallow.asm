#To be inserted @ 800f1bf8
.include "../../Globals.s"
.include "../Header.s"

.set REG_FighterData,31

  lwz  r0,OFST_KirbyOnAbilityGain(rtoc)
  mulli r4,r4,4
  lwzx  r12,r4,r0
  cmpwi r12,0
  beq Exit
#Branch to function
  mtctr r12
  bctrl

Exit:
  branch  r12,0x800f1c1c
