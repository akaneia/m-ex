#To be inserted @ 8002719c
.include "../../../Globals.s"
.include "../../Header.s"

#180 = ToLoadOrig
#404 = Disposable Copy
#628 = Persist Orig
#852 = Persist Copy

.set  REG_Offset,6

lwz REG_Offset,OFST_SSMStruct(rtoc)
lwz REG_Offset,Arch_SSMRuntimeStruct_IsLoadedOrig(REG_Offset)
