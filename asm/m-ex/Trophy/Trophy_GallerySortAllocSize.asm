#To be inserted @ 80311ddc
.include "../../Globals.s"
.include "../Header.s"

  lwz r3, OFST_MetaData_TrophyCount(rtoc)
  mulli r3, r3, 6
