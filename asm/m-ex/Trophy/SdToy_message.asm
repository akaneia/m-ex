#To be inserted @ 80317ce0
.include "../../Globals.s"
.include "../Header.s"

  lwz r4,OFST_MetaData_TrophySDOff(rtoc)
  addi r4, r4, 14