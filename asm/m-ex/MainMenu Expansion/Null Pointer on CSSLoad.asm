#To be inserted @ 80266980
.include "../../Globals.s"
.include "../Header.s"

stw	r3, -0x49CC (r13)

# store pointer to symbol
  li r0,0
  stw r0,OFST_mexMenu(r13)
