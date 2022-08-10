#To be inserted @ 801a7328
.include "../../Globals.s"
.include "../Header.s"

  lwz r3,OFST_TrophyFallScale(rtoc)
  add r3, r0, r3
  lfs f31, 0x0(r3)