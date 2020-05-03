#To be inserted @ 80027bb4
.include "../../../Globals.s"
.include "../../Header.s"

#180 = ToLoadOrig
#404 = Disposable Copy
#628 = Persist Orig
#852 = Persist Copy

.set  REG_PersCopy,3
.set  REG_DispOrig,4
.set  REG_DispCopy,5
.set  REG_PersOrig,6
.set  REG_Count,7
.set  REG_TotalSSM,8


#Init Loop
  lwz r12,OFST_SSMStruct(rtoc)
  lwz REG_PersCopy,Arch_SSMRuntimeStruct_IsLoadedCopy(r12)
  lwz REG_DispOrig,Arch_SSMRuntimeStruct_ToLoadOrig(r12)
  lwz REG_DispCopy,Arch_SSMRuntimeStruct_ToLoadCopy(r12)
  lwz REG_PersOrig,Arch_SSMRuntimeStruct_IsLoadedOrig(r12)
  li  REG_Count,0
  li  r0,-1
  lwz REG_TotalSSM,OFST_Metadata_SSMCount(rtoc)
Loop:
  cmpwi REG_Count,0
  beq LoopInc
  stw r0,0(REG_PersCopy)
  stw r0,0(REG_DispOrig)
  stw r0,0(REG_DispCopy)
  stw r0,0(REG_PersOrig)
LoopInc:
  addi  REG_PersCopy,REG_PersCopy,4
  addi  REG_DispOrig,REG_DispOrig,4
  addi  REG_DispCopy,REG_DispCopy,4
  addi  REG_PersOrig,REG_PersOrig,4
  addi  REG_Count,REG_Count,1
  cmpw REG_Count,REG_TotalSSM
  blt Loop

Exit:
  branch  r12,0x80027c9c
