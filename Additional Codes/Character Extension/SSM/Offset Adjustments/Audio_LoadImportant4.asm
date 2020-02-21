#To be inserted @ 800287c8
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = SSM_DisposableOrig_OFST
#404 / 0x194 = SSM_DisposableCopy_OFST
#628 / 0x274 = SSM_PersistentOrig_OFST
#852 / 0x354 = SSM_PersistentCopy_OFST
#    / 0x424 = Footer

.set  REG_Offset,4

lwz REG_Offset,OFST_SSMStruct(rtoc)
lwz REG_Offset,Arch_SSMRuntimeStruct_DisposableOrig(REG_Offset)
