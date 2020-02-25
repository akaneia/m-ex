#To be inserted @ 80027bb4
.include "../../../Globals.s"
.include "../../Header.s"

#180 = DisposableOrig
#404 = Disposable Copy
#628 = Persist Orig
#852 = Persist Copy

.set  REG_PersCopy,3
.set  REG_DispOrig,4
.set  REG_DispCopy,5
.set  REG_PersOrig,6

#Load offsets
  lwz r7,OFST_SSMStruct(rtoc)
  lwz REG_PersCopy,Arch_SSMRuntimeStruct_PersistentCopy(r7)
  lwz REG_DispOrig,Arch_SSMRuntimeStruct_DisposableOrig(r7)
  lwz REG_DispCopy,Arch_SSMRuntimeStruct_DisposableCopy(r7)
  lwz REG_PersOrig,Arch_SSMRuntimeStruct_PersistentOrig(r7)
