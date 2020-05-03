#To be inserted @ 80026680
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,3
.set  REG_DOLStruct,7
.set  REG_ToLoadCopy,8
.set  REG_IsLoadedOrig,9
.set  REG_AudioGroup,10
.set  REG_SSMTotal,11

LoopStart:
  li  REG_Count,0
  lwz REG_DOLStruct,OFST_AudioGroups(rtoc)
  mr  REG_ToLoadCopy,r5
  mr  REG_IsLoadedOrig,r4
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
  addi  REG_SSMTotal,REG_SSMTotal,1
Loop:
# check if this ssm belongs to the current audio group
  lbz	r0, 0x0001 (REG_DOLStruct)   #get 0x1 of unk ssm struct
  extsb	r0, r0
  cmpw	REG_AudioGroup, r0
  bne IncLoop
# check if this ssm should be loaded
  lwz	r0, 0 (REG_ToLoadCopy)
  cmpwi	r0, 1
  bne IncLoop
# check if this ssm is NOT loaded
  lwz	r0, 0 (REG_IsLoadedOrig)
  cmpwi	r0, -1
  bne IncLoop
# exit
  blr
IncLoop:
  addi  REG_DOLStruct,REG_DOLStruct,4
  addi	REG_ToLoadCopy, REG_ToLoadCopy, 4
  addi	REG_IsLoadedOrig, REG_IsLoadedOrig, 4
  addi  REG_Count,REG_Count,1
  cmpw REG_Count, REG_SSMTotal
  blt Loop
#Go through all audio groups
  subic.  REG_AudioGroup,REG_AudioGroup,1
  bge+ LoopStart

  li  r3,-1
  blr
