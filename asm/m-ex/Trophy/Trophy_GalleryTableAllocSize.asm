#To be inserted @ 80311dd0
.include "../../Globals.s"
.include "../Header.s"

  lwz r3, OFST_MetaData_TrophyCount(rtoc)
  addi r3, r3, 1
  mulli r3, r3, 2
