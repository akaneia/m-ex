#To be inserted @ 8002749c
.include "../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096
#180 / 0xB4 = SSM_ToLoadOrig_OFST
#404 / 0x194 = SSM_ToLoadCopy_OFST
#628 / 0x274 = SSM_IsLoadedOrig_OFST
#852 / 0x354 = SSM_IsLoadedCopy_OFST
#    / 0x424 = Footer


lwz r6,OFST_SSMStruct(rtoc)
lwz r5,Arch_SSMRuntimeStruct_ToLoadCopy(r6)
lwz r6,Arch_SSMRuntimeStruct_IsLoadedOrig(r6)
