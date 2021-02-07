#To be inserted @ 8002645c
.include "../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

.set  REG_Dest,3

lwz REG_Dest,OFST_SSMStruct(rtoc)
lwz REG_Dest,Arch_SSMRuntimeStruct_Header(REG_Dest)
