#To be inserted @ 80026fc8
.include "../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

.set  REG_Offset,28

lwz REG_Offset,OFST_SSMStruct(rtoc)
lwz REG_Offset,Arch_SSMRuntimeStruct_DisposableOrig(REG_Offset)
