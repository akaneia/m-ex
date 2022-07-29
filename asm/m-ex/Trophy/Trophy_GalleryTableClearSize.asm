#To be inserted @ 80311e28
.include "../../Globals.s"
.include "../Header.s"

  lwz r4, OFST_MetaData_TrophyCount(rtoc)
  addi r4, r4, 1
  mulli r4, r4, 2
