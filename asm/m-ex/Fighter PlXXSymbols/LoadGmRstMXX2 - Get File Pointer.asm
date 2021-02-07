#To be inserted @ 800beb88
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerData,28
.set  REG_GmRstPointers,31

#Get pointer
  lwz  REG_GmRstPointers,OFST_GmRstPointers(rtoc)
#Get offset
  mulli r0,r3,GmRstPointers_Stride
  add  REG_GmRstPointers,REG_GmRstPointers,r0


Exit:
  lwz	r0, 0 (REG_GmRstPointers)
