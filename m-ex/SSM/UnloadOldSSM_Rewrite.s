#To be inserted @ 800269f8
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,23
.set  R
.set  REG_SSMTotal,11

LoopStart:
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
  addi  REG_SSMTotal,REG_SSMTotal,1
  li  r4,0
  addi	r5, r31, 720
  lwz r7,OFST_SSMStruct(rtoc)
  lwz r6,Arch_SSMRuntimeStruct_DisposableCopy(r7)
  lwz r7,Arch_SSMRuntimeStruct_PersistentOrig(r7)
  li  REG_Count,0
Loop:
# check if this ssm is part of audio group 5
  lbz	r0, 0x0001 (r5)   #get 0x1 of unk ssm struct
  cmpwi r0,5
  beq IncLoop
# check if this ssm should be loaded
  lwz	r0, 0 (r6)
  cmpwi	r0, 1
  bne IncLoop
# check if this ssm is NOT loaded
  lwz	r0, 0 (r7)
  cmpwi	r0, -1
  bne IncLoop
# load this ssm
  branch  r12,0x80026df8
IncLoop:
  addi  r4,r4,1
  addi  r5,r5,4
  addi	r6, r6, 4
  addi	r7, r7, 4
  addi  REG_Count,REG_Count,1
  cmpw REG_Count, REG_SSMTotal
  blt Loop
#Go through all audio groups
  subic.  r3,r3,1
  bge+ LoopStart
  branch  r12,0x80026df4
