#To be inserted @ 80028960
.include "../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = SSM_ToLoadOrig_OFST
#404 / 0x194 = SSM_ToLoadCopy_OFST
#628 / 0x274 = SSM_IsLoadedOrig_OFST
#852 / 0x354 = SSM_IsLoadedCopy_OFST
#    / 0x424 = Footer

.set  SSMID,54
.set  REG_Struct,3

#Get persistent orig struct
  lwz REG_Struct,OFST_SSMStruct(rtoc)
  lwz REG_Struct,Arch_SSMRuntimeStruct_IsLoadedOrig(REG_Struct)
  lwz	r0, SSMID*4 (REG_Struct)
