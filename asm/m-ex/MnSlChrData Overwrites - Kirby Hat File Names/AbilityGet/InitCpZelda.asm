#To be inserted @ 8009d5f8
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_Dest,4

lwz  REG_Dest,OFST_KirbyAbilityRuntimeStruct(rtoc)
