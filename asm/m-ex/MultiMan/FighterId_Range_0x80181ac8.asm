#To be inserted @ 80181ac8
.include "../../Globals.s"
.include "../Header.s"

  cmpwi r3, 0x1B
  bgt Skip
  b Exit

Skip:
  blr

Exit:
  cmpwi r4,0x24
