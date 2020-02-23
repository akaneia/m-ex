#To be inserted @ 80027cac
.include "../../../Globals.s"
.include "../../Header.s"

#180 / 0xB4 = DisposableOrig
#404 / 0x194 = Disposable Copy
#628 / 0x274 = Persist Orig
#852 / 0x354 = Persist Copy

.set  SSMID,51
.set  REG_Struct,12
.set  REG_Dest,29

#Get persistent orig struct
  lwz REG_Struct,OFST_SSMStruct(rtoc)
  lwz REG_Struct,Arch_SSMRuntimeStruct_PersistentOrig(REG_Struct)
  addi  REG_Dest,REG_Struct,SSMID*4
