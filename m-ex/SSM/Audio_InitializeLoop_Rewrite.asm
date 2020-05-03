#To be inserted @ 800285c8
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,8
.set  REG_SSMTotal,9

.set  REG_DOLStruct,7
.set  REG_ToLoadOrig,4
.set  REG_ToLoadCopy,5
.set  REG_IsLoadedOrig,6
.set  REG_IsLoadedCopy,7

LoopStart:
  li  REG_Count,0
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
  addi  REG_SSMTotal,REG_SSMTotal,1
#Get lists
  lwz r3,OFST_SSMStruct(rtoc)
  lwz REG_ToLoadOrig,Arch_SSMRuntimeStruct_ToLoadOrig(r3)
  lwz REG_ToLoadCopy,Arch_SSMRuntimeStruct_ToLoadCopy(r3)
  lwz REG_IsLoadedOrig,Arch_SSMRuntimeStruct_IsLoadedOrig(r3)
  lwz REG_IsLoadedCopy,Arch_SSMRuntimeStruct_IsLoadedCopy(r3)
#Initial Value
  li  r3,-1
Loop:
  stw r3,0x0(REG_ToLoadOrig)
  stw r3,0x0(REG_ToLoadCopy)
  stw r3,0x0(REG_IsLoadedOrig)
  stw r3,0x0(REG_IsLoadedCopy)
IncLoop:
  addi	REG_ToLoadOrig, REG_ToLoadOrig, 4
  addi	REG_ToLoadCopy, REG_ToLoadCopy, 4
  addi	REG_IsLoadedOrig, REG_IsLoadedOrig, 4
  addi	REG_IsLoadedCopy, REG_IsLoadedCopy, 4
  addi  REG_Count,REG_Count,1
  cmpw REG_Count, REG_SSMTotal
  blt Loop
Exit:
  branch  r12,0x80028660
