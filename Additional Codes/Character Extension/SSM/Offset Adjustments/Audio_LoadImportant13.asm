#To be inserted @ 8002895c
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = SSM_DisposableOrig_OFST
#404 / 0x194 = SSM_DisposableCopy_OFST
#628 / 0x274 = SSM_PersistentOrig_OFST
#852 / 0x354 = SSM_PersistentCopy_OFST
#    / 0x424 = Footer

.set  SSMID,54
.set  REG_Struct,12
.set  REG_Dest,29

#Get persistent orig struct
  lwz REG_Struct,OFST_SSMStruct(rtoc)
  lwz REG_Struct,Arch_SSMRuntimeStruct_PersistentOrig(REG_Struct)
  addi  REG_Dest,REG_Struct,SSMID*4
