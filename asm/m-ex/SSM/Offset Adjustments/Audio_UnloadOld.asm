#To be inserted @ 800267f8
.include "../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = SSM_ToLoadOrig_OFST
#404 / 0x194 = SSM_ToLoadCopy_OFST
#628 / 0x274 = SSM_IsLoadedOrig_OFST
#852 / 0x354 = SSM_IsLoadedCopy_OFST
#    / 0x424 = Footer

.set  REG_SSMStruct,25

lwz REG_SSMStruct, OFST_SSMStruct(rtoc)

lwz r28, Arch_SSMRuntimeStruct_IsLoadedOrig(REG_SSMStruct)
lwz r26, Arch_SSMRuntimeStruct_ToLoadCopy(REG_SSMStruct)
lwz r25, Arch_SSMRuntimeStruct_IsLoadedCopy(REG_SSMStruct)
