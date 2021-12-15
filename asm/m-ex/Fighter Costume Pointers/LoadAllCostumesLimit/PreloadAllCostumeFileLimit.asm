#To be inserted @ 80085658
.include "../../../Globals.s"
.include "../../Header.s"

# limiting random costumes to 6 because they are all loaded to ARAM,
# and if enough costumes are present, we can quickly run out of memory.

# get costume amount
  lbz	r24, 0x0004 (r3)
  cmpwi r24,6
  ble Exit
  li    r24,6

Exit:
