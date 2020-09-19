#To be inserted @ 800eeec4
.include "../../Globals.s"
.include "../Header.s"

backup

# runs when a non original tether character is detected
  lwz  r0,OFST_KirbyOnAbilityLose(rtoc)
  mulli r4,r4,4
  lwzx  r12,r4,r0
  cmpwi r12,0
  beq Exit
# Branch to function
  mtctr r12
  bctrl

Exit:
  restore
  blr
