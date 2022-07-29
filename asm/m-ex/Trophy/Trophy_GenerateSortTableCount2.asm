#To be inserted @ 80306714
.include "../../Globals.s"
.include "../Header.s"

  lwz r12, OFST_MetaData_TrophyCount(rtoc)
  cmpw r30, r12
