#To be inserted @ 80026664
.include "../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

lwz r4,OFST_SSMStruct(rtoc)
lwz r5,Arch_SSMRuntimeStruct_ToLoadCopy(r4)
lwz r4,Arch_SSMRuntimeStruct_IsLoadedOrig(r4)
