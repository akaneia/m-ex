#To be inserted @ 80027d50
.include "../../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

.set  SSMID,54
.set  REG_Struct,3

#Get persistent orig struct
  lwz REG_Struct,OFST_SSMStruct(rtoc)
  lwz REG_Struct,Arch_SSMRuntimeStruct_PersistentOrig(REG_Struct)
  lwz	r0, SSMID*4 (REG_Struct)
