#To be inserted @ 80027a14
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_Dest,5
.set  REG_Temp,3
.set  REG_Index,0

lwz REG_Temp,OFST_Map_Audio(rtoc)
add REG_Temp,REG_Temp,REG_Index
lbz REG_Dest,0x0(REG_Temp)
