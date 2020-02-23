#To be inserted @ 800270d0
.include "../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

.set  REG_Offset,31

lwz REG_Offset,OFST_SSMStruct(rtoc)
lwz REG_Offset,Arch_SSMRuntimeStruct_DisposableOrig(REG_Offset)
