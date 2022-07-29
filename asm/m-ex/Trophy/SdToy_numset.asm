#To be inserted @ 80312848
.include "../../Globals.s"
.include "../Header.s"

  lwz r7,OFST_MetaData_TrophySDOff(rtoc)
  addi r7, r7, 12
  mulli r7, r7, 4
  lwzx r7, r7, r5
