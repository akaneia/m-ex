#To be inserted @ 80028770
.include "../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = SSM_ToLoadOrig_OFST
#404 / 0x194 = SSM_ToLoadCopy_OFST
#628 / 0x274 = SSM_IsLoadedOrig_OFST
#852 / 0x354 = SSM_IsLoadedCopy_OFST
#    / 0x424 = Footer

.set  SSMID,0
.set  REG_Struct,12

#Get persistent orig struct
  lwz REG_Struct,OFST_SSMStruct(rtoc)
  lwz REG_Struct,Arch_SSMRuntimeStruct_IsLoadedCopy(REG_Struct)
  stw	r3, SSMID*4 (REG_Struct)
