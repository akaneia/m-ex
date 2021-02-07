#To be inserted @ 80085cc0
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerData,28
.set  REG_GmRstPointers,4

#Get pointer
  lwz  REG_GmRstPointers,OFST_GmRstPointers(rtoc)
#Get offset
  lwz r0,0x4(REG_PlayerData)
  mulli r0,r0,GmRstPointers_Stride
#store 0
  li  r3,0
  stwx  r3,REG_GmRstPointers,r0
