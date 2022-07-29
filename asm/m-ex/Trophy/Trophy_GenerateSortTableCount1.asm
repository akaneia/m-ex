#To be inserted @ 803066b8
.include "../../Globals.s"
.include "../Header.s"

  lwz r12, OFST_MetaData_TrophyCount(rtoc)
  cmpw r27, r12
