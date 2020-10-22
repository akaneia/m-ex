#To be inserted @ 80173860
.include "../../Globals.s"
.include "../Header.s"

  cmpwi r3,0x1A
  blt Exit

# exit this function
  branch r12,0x801738ec

Exit:
  rlwinm	r3, r3, 0, 24, 31