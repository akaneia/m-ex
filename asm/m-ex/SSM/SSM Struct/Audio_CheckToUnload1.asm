#To be inserted @ 800268dc
.include "../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096


lwz r6,OFST_SSMStruct(rtoc)
lwz r5,Arch_SSMRuntimeStruct_ToLoadCopy(r6)
lwz r6,Arch_SSMRuntimeStruct_IsLoadedOrig(r6)
