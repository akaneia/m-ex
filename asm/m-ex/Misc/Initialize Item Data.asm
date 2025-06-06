#To be inserted at 80268754
.include "../../Globals.s"

.set REG_ItemData,31

backup
mr  REG_ItemData,r3

#Initialize data
  mr r3,REG_ItemData
  li  r4,4044
  branchl r12,ZeroAreaLength

Exit:
  mr.	r6, REG_ItemData
  restore
