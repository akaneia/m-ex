#To be inserted @ 8015cc94
.include "../../Globals.s"
.include "../Header.s"

  lwz r3, -0x77c0(r13)
  addi r3, r3,0x1cd0

  lwz r12, OFST_MetaData_TrophyCount(rtoc)
  sth r12, 0x00(r3)

  Exit: