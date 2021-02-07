#To be inserted @ 801093d4
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_Dest,3

lwz  REG_Dest,OFST_KirbyAbilityRuntimeStruct(rtoc)
