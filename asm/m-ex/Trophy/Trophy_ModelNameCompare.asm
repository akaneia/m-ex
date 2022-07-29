#To be inserted @ 80308398
.include "../../Globals.s"
.include "../Header.s"

  lwz r12, OFST_MetaData_TrophyCount(rtoc)
  cmpw r3, r12
