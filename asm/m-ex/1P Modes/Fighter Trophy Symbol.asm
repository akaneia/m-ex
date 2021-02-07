#To be inserted @ 80160578
.include "../../Globals.s"
.include "../Header.s"

# orig line
  stwu	sp, -0x0008 (sp)

# check if custom fighter
  cmpwi r3, 0x1A
  blt Exit

Custom:
  li r3,0
  branch r12,0x801605d4

Exit:
  cmpwi	r4, 21