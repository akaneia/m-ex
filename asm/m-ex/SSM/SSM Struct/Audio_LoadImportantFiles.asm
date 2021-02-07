#To be inserted @ 800286b0
.include "../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

.set  REG_Dest,30

lwz REG_Dest,OFST_SSMStruct(rtoc)
lwz REG_Dest,Arch_SSMRuntimeStruct_Header(REG_Dest)
