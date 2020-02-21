#To be inserted @ 800285bc
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy
#    / 0x424 = Footer

.set  REG_Offset,5

lwz REG_Offset,OFST_SSMStruct(rtoc)
lwz REG_Offset,Arch_SSMRuntimeStruct_DisposableCopy(REG_Offset)
