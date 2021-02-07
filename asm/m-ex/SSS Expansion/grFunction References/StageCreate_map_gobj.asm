#To be inserted @ 801c17a8
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_Dest,4
.set  REG_Temp,4
.set  REG_Index,0

lwz REG_Temp,OFST_grFunction(rtoc)
add REG_Temp,REG_Temp,REG_Index
lwz REG_Dest,0x0(REG_Temp)
