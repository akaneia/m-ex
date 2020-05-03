#To be inserted @ 800269f8
.include "../../Globals.s"
.include "../Header.s"

#804337c4
#804338a4
#80433984
#80433a64

#180 / 0xB4 = SSM_ToLoadOrig_OFST
#404 / 0x194 = SSM_ToLoadCopy_OFST
#628 / 0x274 = SSM_IsLoadedOrig_OFST
#852 / 0x354 = SSM_IsLoadedCopy_OFST
#    / 0x424 = Footer

backup

.set  REG_Count,31
.set  REG_AudioGroup,30      #orig r29
.set  REG_IsLoadedCopy,29  #orig r28
.set  REG_IsLoadedOrig,28  #orig r27
.set  REG_SSMTotal,27

UnkLoopStart:
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
  addi  REG_SSMTotal,REG_SSMTotal,1
  lwz REG_AudioGroup,OFST_AudioGroups(rtoc)
  lwz r3,OFST_SSMStruct(rtoc)
  lwz REG_IsLoadedOrig,Arch_SSMRuntimeStruct_IsLoadedOrig(r3)
  lwz REG_IsLoadedCopy,Arch_SSMRuntimeStruct_IsLoadedCopy(r3)

  li  REG_Count,0
UnkLoop:
# check if this ssm is part of audio group 5
  lbz	r0, 0x0001 (REG_AudioGroup)   #get 0x1 of unk ssm struct
  cmpwi r0,5
  beq UnkIncLoop
# check if this ssm should be loaded
  lwz	r0, 0 (REG_IsLoadedCopy)
  cmpwi	r0, -1
  beq UnkIncLoop
# check if this ssm is NOT loaded
  lwz	r0, 0 (REG_IsLoadedOrig)
  cmpwi	r0, -1
  bne UnkIncLoop

# do something with this ssm
  lwz	r3, 0 (REG_IsLoadedCopy)
  branchl r12,0x80388b60
  cmpwi r3,1
  beq UnloadSSM

# loop 64 million times (im not making this up, the code @ 80026a30-80026ae8 does this)
  #idk, do this later, ive never seen this code execute


UnloadSSM:
# unload this ssm?
  li  r0,-1
  stw	r0, 0 (REG_IsLoadedCopy)
  stw	r0, 0 (REG_IsLoadedOrig)
UnkIncLoop:
  addi  REG_AudioGroup,REG_AudioGroup,4
  addi	REG_IsLoadedCopy, REG_IsLoadedCopy, 4
  addi	REG_IsLoadedOrig, REG_IsLoadedOrig, 4
  addi  REG_Count,REG_Count,1
  cmpw  REG_Count, REG_SSMTotal
  blt UnkLoop


#Second Loop
  lwz REG_AudioGroup,OFST_AudioGroups(rtoc)
  lwz r3,OFST_SSMStruct(rtoc)
  lwz REG_IsLoadedOrig,Arch_SSMRuntimeStruct_IsLoadedOrig(r3)
  lwz REG_IsLoadedCopy,Arch_SSMRuntimeStruct_IsLoadedCopy(r3)
# get free memory
  branchl r12,0x80388b50
  cmpwi r3,0
  beq Exit
# async load audio
  load r3,0x800195d0
  branchl r12,0x80388b0c
# unk
  li  r3,2
  branchl r12,0x80388d30
  li  REG_Count,0
UnloadAllLoop:
# check if this ssm is part of audio group 5
  lbz	r0, 0x0001 (REG_AudioGroup)   #get 0x1 of unk ssm struct
  cmpwi r0,5
  beq UnloadAllIncLoop
# set as unloaded
  li  r0,-1
  stw	r0, 0 (REG_IsLoadedCopy)
  stw	r0, 0 (REG_IsLoadedOrig)
UnloadAllIncLoop:
# inc loop
  addi  REG_AudioGroup,REG_AudioGroup,4
  addi	REG_IsLoadedCopy, REG_IsLoadedCopy, 4
  addi	REG_IsLoadedOrig, REG_IsLoadedOrig, 4
  addi  REG_Count,REG_Count,1
  cmpw  REG_Count, REG_SSMTotal
  blt UnloadAllLoop

Exit:
  restore
  branch  r12,0x80026bf0
