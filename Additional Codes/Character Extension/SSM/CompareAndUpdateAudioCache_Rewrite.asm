#To be inserted @ 800272dc
.include "../../../Globals.s"
.include "../Header.s"

.set  REG_Count,5
.set  REG_DisposableOrig,3
.set  REG_DisposableCopy,4

LoopStart:
  li  REG_Count,0
Loop:
  lwz r0,0x0(REG_DisposableOrig)
  stw r0,0x0(REG_DisposableCopy)
IncLoop:
  addi	REG_DisposableOrig, REG_DisposableOrig, 4
  addi	REG_DisposableCopy, REG_DisposableCopy, 4
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count, 56 + NumOfAddedSSMs
  blt Loop

#Exit
  branch  r12,0x800273d4
