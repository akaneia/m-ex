#To be inserted @ 801605c0
.include "../../Globals.s"
.include "../Header.s"

  lwz r3, OFST_AdventureTrophyLookup(rtoc)
  add r3, r3, r0
  lhz r3, 0x00(r3)
