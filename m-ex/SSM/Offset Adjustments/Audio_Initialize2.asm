#To be inserted @ 80028420
.include "../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

.set  SSMID,0
.set  REG_Offset,12

#Get
  lwz REG_Offset,OFST_SSMStruct(rtoc)
  lwz REG_Offset,Arch_SSMRuntimeStruct_Footer(REG_Offset)
  lwz r0,SSMID*4(REG_Offset)
