#To be inserted @ 80312b18
.include "../../Globals.s"
.include "../Header.s"

  lwz r29,OFST_MetaData_TrophySDOff(rtoc)
  mulli r29, r29, 4
  lwzx r29, r29, r4
