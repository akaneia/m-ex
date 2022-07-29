#To be inserted @ 80311e34
.include "../../Globals.s"
.include "../Header.s"

  lwz r4, OFST_MetaData_TrophyCount(rtoc)
  mulli r4, r4, 6