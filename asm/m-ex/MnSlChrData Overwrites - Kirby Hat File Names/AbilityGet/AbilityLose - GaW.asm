#To be inserted @ 800f15e4
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_Dest,4

lwz  REG_Dest,OFST_KirbyAbilityRuntimeStruct(rtoc)
