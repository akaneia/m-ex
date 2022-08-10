#To be inserted @ 801a6a1c
.include "../../Globals.s"
.include "../Header.s"

  lwz r0,OFST_TrophyFallScale(rtoc)
  add r3, r0, r3