#To be inserted @ 803d705c
.include "../../Globals.s"
.include "../Header.s"

.set  REG_SSMID,3
.set  REG_DisposableOrig,12

#Get Disposable Orig
  lwz REG_DisposableOrig,OFST_SSMStruct(rtoc)
  lwz REG_DisposableOrig,Arch_SSMRuntimeStruct_DisposableOrig(REG_DisposableOrig)
#Queue up ssm load
  li  r4,1
  mulli REG_SSMID,REG_SSMID,4
  stwx  r4,REG_SSMID,REG_DisposableOrig
  blr
