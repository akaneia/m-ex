#To be inserted @ 800269dc
.include "../../../Globals.s"
.include "../../Header.s"

#804337c4
#804338a4
#80433984
#80433a64

#180 / 0xB4 = SSM_ToLoadOrig_OFST
#404 / 0x194 = SSM_ToLoadCopy_OFST
#628 / 0x274 = SSM_IsLoadedOrig_OFST
#852 / 0x354 = SSM_IsLoadedCopy_OFST
#    / 0x424 = Footer

lwz r24,OFST_SSMStruct(rtoc)
lwz r25,Arch_SSMRuntimeStruct_IsLoadedOrig(r24)
lwz r24,Arch_SSMRuntimeStruct_IsLoadedCopy(r24)
