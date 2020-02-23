#To be inserted @ 80027694
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,4
.set  REG_DOLStruct,7
.set  REG_DisposableCopy,8
.set  REG_PersistentOrig,9
.set  REG_AudioGroup,10
.set  REG_SSMTotal,12

LoopStart:
  li  REG_Count,0
  mr  REG_DisposableCopy,r30
  mr  REG_PersistentOrig,r29
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
  addi  REG_SSMTotal,REG_SSMTotal,1
Loop:
  lwz	r0, 0 (REG_DisposableCopy)
  cmpwi	r0, 1
  bne IncLoop
  lwz	r0, 0 (REG_PersistentOrig)
  cmpwi	r0, -1
  bne IncLoop
#Exit
  li  r0,1
  b Exit
IncLoop:
  addi	REG_DisposableCopy, REG_DisposableCopy, 4
  addi	REG_PersistentOrig, REG_PersistentOrig, 4
  addi  REG_Count,REG_Count,1
  cmpw REG_Count, REG_SSMTotal
  blt Loop
#Go through all audio groups
  subic.  REG_AudioGroup,REG_AudioGroup,1
  bge+ LoopStart
#Not done loading, wait more
  li	r0, 0
Exit:
  branch  r12,0x80027838
