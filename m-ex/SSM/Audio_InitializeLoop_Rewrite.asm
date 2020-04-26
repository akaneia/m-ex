#To be inserted @ 800285c8
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,8
.set  REG_SSMTotal,9

.set  REG_DOLStruct,7
.set  REG_DisposableOrig,4
.set  REG_DisposableCopy,5
.set  REG_PersistentOrig,6
.set  REG_PersistentCopy,7

LoopStart:
  li  REG_Count,0
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
  addi  REG_SSMTotal,REG_SSMTotal,1
#Get lists
  lwz r3,OFST_SSMStruct(rtoc)
  lwz REG_DisposableOrig,Arch_SSMRuntimeStruct_DisposableOrig(r3)
  lwz REG_DisposableCopy,Arch_SSMRuntimeStruct_DisposableCopy(r3)
  lwz REG_PersistentOrig,Arch_SSMRuntimeStruct_PersistentOrig(r3)
  lwz REG_PersistentCopy,Arch_SSMRuntimeStruct_PersistentCopy(r3)
#Initial Value
  li  r3,-1
Loop:
  stw r3,0x0(REG_DisposableOrig)
  stw r3,0x0(REG_DisposableCopy)
  stw r3,0x0(REG_PersistentOrig)
  stw r3,0x0(REG_PersistentCopy)
IncLoop:
  addi	REG_DisposableOrig, REG_DisposableOrig, 4
  addi	REG_DisposableCopy, REG_DisposableCopy, 4
  addi	REG_PersistentOrig, REG_PersistentOrig, 4
  addi	REG_PersistentCopy, REG_PersistentCopy, 4
  addi  REG_Count,REG_Count,1
  cmpw REG_Count, REG_SSMTotal
  blt Loop
Exit:
  branch  r12,0x80028660
