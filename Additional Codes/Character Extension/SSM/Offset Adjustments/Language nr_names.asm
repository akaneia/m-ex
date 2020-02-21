#To be inserted @ 80027ce8
.include "../../../../Globals.s"
.include "../../Header.s"

#180 = DisposableOrig
#404 = Disposable Copy
#628 = Persist Orig
#852 = Persist Copy

.set  SSMID,51
.set  REG_Struct,12

#Get persistent orig struct
  lwz REG_Struct,OFST_SSMStruct(rtoc)
  lwz REG_Struct,Arch_SSMRuntimeStruct_PersistentOrig(REG_Struct)
  stw	r3, SSMID*4 (REG_Struct)
