#To be inserted @ 80027400
.include "../../Globals.s"
.include "../Header.s"

backup

#Display heap usage
  bl  HeapUsage
  mflr  r3
  lwz r4,-0x5258(r13)
  lwz r5,-0x5250(r13)
  add r4,r4,r5
  lwz r5,-0x5268(r13)
  branchl r12,OSReport

# Display all currently loaded FGMs
.set  REG_IsLoadedOrig,31
.set  REG_Count,30
.set  REG_SSMTotal,29
# string
  bl  FGMLoaded
  mflr  r3
  branchl r12,OSReport
# get ssm list
  lwz r3,OFST_SSMStruct(rtoc)
  lwz REG_IsLoadedOrig,Arch_SSMRuntimeStruct_IsLoadedOrig(r3)
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
  li  REG_Count,0
  b LoadedFGM_CheckLoop
LoadedFGM_Loop:
# check if this ssm is loaded
  lwz	r0, 0 (REG_IsLoadedOrig)
  cmpwi	r0, -1
  beq LoadedFGM_IncLoop
#Display
  bl  FGMName
  mflr  r3
  lwz  r4,OFST_MnSlChrSSMFileNames(rtoc)
  mulli r5,REG_Count,4
  lwzx  r4,r4,r5
  branchl r12,OSReport
LoadedFGM_IncLoop:
  addi  REG_Count,REG_Count,1
  addi  REG_IsLoadedOrig,REG_IsLoadedOrig,4
LoadedFGM_CheckLoop:
  cmpw  REG_Count,REG_SSMTotal
  blt LoadedFGM_Loop

.set  REG_Count,31
.set  REG_ToLoadCopy,30
.set  REG_IsLoadedOrig,29
.set  REG_SSMTotal,28
# newline
  bl  FGMNeeded
  mflr  r3
  branchl r12,OSReport
# init
  li  REG_Count,0
  lwz r3,OFST_SSMStruct(rtoc)
  lwz REG_ToLoadCopy,Arch_SSMRuntimeStruct_ToLoadCopy(r3)
  lwz REG_IsLoadedOrig,Arch_SSMRuntimeStruct_IsLoadedCopy(r3)
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
  b NeededFGM_CheckLoop
NeededFGM_Loop:
# check if this ssm should be loaded
  lwz	r0, 0 (REG_ToLoadCopy)
  cmpwi	r0, 1
  bne NeededFGM_IncLoop
# check if this ssm is NOT loaded
  lwz	r0, 0 (REG_IsLoadedOrig)
  cmpwi	r0, -1
  bne NeededFGM_IncLoop
#Display
  bl  FGMName
  mflr  r3
  lwz  r4,OFST_MnSlChrSSMFileNames(rtoc)
  mulli r5,REG_Count,4
  lwzx  r4,r4,r5
  branchl r12,OSReport
NeededFGM_IncLoop:
  addi	REG_ToLoadCopy, REG_ToLoadCopy, 4
  addi	REG_IsLoadedOrig, REG_IsLoadedOrig, 4
  addi  REG_Count,REG_Count,1
NeededFGM_CheckLoop:
  cmpw REG_Count, REG_SSMTotal
  blt NeededFGM_Loop


# newline
  bl  Newline
  mflr  r3
  branchl r12,OSReport

b Exit

#########################################
HeapUsage:
blrl
.string "\nFGM Heap:\nUsed 0x%X / 0x%X bytes\n\n"
.align 2

FGMLoaded:
blrl
.string "FGM Loaded:\n"
.align 2

FGMNeeded:
blrl
.string "\nFGM Pending:\n"
.align 2

FGMName:
blrl
.string "%s\n"
.align 2

Newline:
blrl
.string "\n"
.align 2

Exit:
  restore
  addi	r3, r31, 6016