#To be inserted @ 80026e60
.include "../../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

.set  REG_Offset,4

lwz REG_Offset,OFST_SSMStruct(rtoc)
lwz r0,Arch_SSMRuntimeStruct_PersistentOrig(REG_Offset)
