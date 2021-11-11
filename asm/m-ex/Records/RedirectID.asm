#To be inserted @ 80164024
.include "../../Globals.s"
.include "../Header.s"

# redirect m-ex c_kinds to mario
  cmpwi r3, 26
  blt Exit
  li r3,0
Exit:
  lis	r4, 0x803B