#To be inserted @ 80027454
.include "../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = ToLoadOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

.set  REG_Struct,4

#Get persistent orig struct
  lwz REG_Struct,OFST_SSMStruct(rtoc)
  lwz REG_Struct,Arch_SSMRuntimeStruct_IsLoadedCopy(REG_Struct)
  stwx  r3,r29,REG_Struct   #store to ssms offset on struct
