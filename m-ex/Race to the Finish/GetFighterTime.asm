#To be inserted @ 80219280
.include "../../Globals.s"
.include "../Header.s"

# fighter not found, default to some time
  li r3,40
  branch r12,0x80219294
