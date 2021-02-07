#To be inserted @ 8009d2b0
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_Dest,4

lwz  REG_Dest,OFST_KirbyAbilityRuntimeStruct(rtoc)
