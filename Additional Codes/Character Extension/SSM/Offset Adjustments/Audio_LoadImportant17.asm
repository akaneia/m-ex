#To be inserted @ 800289b0
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = SSM_DisposableOrig_OFST
#404 / 0x194 = SSM_DisposableCopy_OFST
#628 / 0x274 = SSM_PersistentOrig_OFST
#852 / 0x354 = SSM_PersistentCopy_OFST
#    / 0x424 = Footer

.set  SSMID,2
.set  REG_Struct,3

#Get persistent orig struct
  lwz REG_Struct,OFST_SSMStruct(rtoc)
  lwz REG_Struct,Arch_SSMRuntimeStruct_PersistentOrig(REG_Struct)
  lwz	r0, SSMID*4 (REG_Struct)
