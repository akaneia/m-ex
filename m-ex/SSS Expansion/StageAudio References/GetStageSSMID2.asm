#To be inserted @ 80026ef0
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_Dest,0
.set  REG_Temp,3
.set  REG_Index,0

lwz REG_Dest,OFST_Map_Audio(rtoc)
