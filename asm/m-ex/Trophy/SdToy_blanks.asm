#To be inserted @ 80312b78
.include "../../Globals.s"
.include "../Header.s"

  lwz r12, OFST_MetaData_TrophySDOff(rtoc)
  add r4, r4, r12