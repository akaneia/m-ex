#To be inserted @ 80026c5c
.include "../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = SSM_ToLoadOrig_OFST
#404 / 0x194 = SSM_ToLoadCopy_OFST
#628 / 0x274 = SSM_IsLoadedOrig_OFST
#852 / 0x354 = SSM_IsLoadedCopy_OFST
#    / 0x424 = Footer

.set  REG_Count,5
.set  REG_Struct,3

#Get persistent orig struct
  lwz REG_Struct,OFST_SSMStruct(rtoc)
  lwz REG_Struct,Arch_SSMRuntimeStruct_IsLoadedOrig(REG_Struct)

#Get offset
  mulli r4,REG_Count,4
  stwx  r0,r4,REG_Struct
