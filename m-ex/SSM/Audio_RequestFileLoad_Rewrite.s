#To be inserted @ 80026680
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,3
.set  REG_DOLStruct,7
.set  REG_DisposableCopy,8
.set  REG_PersistentOrig,9
.set  REG_AudioGroup,10
.set  REG_SSMTotal,11

LoopStart:
  li  REG_Count,0
  mr  REG_DOLStruct,r6
  mr  REG_DisposableCopy,r5
  mr  REG_PersistentOrig,r4
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
  addi  REG_SSMTotal,REG_SSMTotal,1
Loop:
  lbz	r0, 0x0001 (REG_DOLStruct)   #get 0x1 of unk ssm struct
  extsb	r0, r0
  cmpw	REG_AudioGroup, r0
  bne IncLoop
  lwz	r0, 0 (REG_DisposableCopy)
  cmpwi	r0, 1
  bne IncLoop
  lwz	r0, 0 (REG_PersistentOrig)
  cmpwi	r0, -1
  bne IncLoop
  blr
IncLoop:
  addi  REG_DOLStruct,REG_DOLStruct,4
  addi	REG_DisposableCopy, REG_DisposableCopy, 4
  addi	REG_PersistentOrig, REG_PersistentOrig, 4
  addi  REG_Count,REG_Count,1
  cmpw REG_Count, REG_SSMTotal
  blt Loop
#Go through all audio groups
  subic.  REG_AudioGroup,REG_AudioGroup,1
  bge+ LoopStart

  li  r3,-1
  blr
