#To be inserted @ 80182df0
.include "../../Globals.s"
.include "../Header.s"

  cmpwi r3, 0x1B
  bgt CustomSlot
  b Exit

CustomSlot:
  subi r3, r13, 0x50c0
  blr

Exit:
  cmpwi r4,0x24
