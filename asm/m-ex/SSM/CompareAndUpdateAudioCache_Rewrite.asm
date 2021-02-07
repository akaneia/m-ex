#To be inserted @ 800272dc
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,5
.set  REG_ToLoadOrig,3
.set  REG_ToLoadCopy,4
.set  REG_SSMTotal,12

LoopStart:
  li  REG_Count,0
  lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
  addi  REG_SSMTotal,REG_SSMTotal,1
Loop:
  lwz r0,0x0(REG_ToLoadOrig)
  stw r0,0x0(REG_ToLoadCopy)
IncLoop:
  addi	REG_ToLoadOrig, REG_ToLoadOrig, 4
  addi	REG_ToLoadCopy, REG_ToLoadCopy, 4
  addi  REG_Count,REG_Count,1
  cmpw REG_Count, REG_SSMTotal
  blt Loop

#Exit
  branch  r12,0x800273d4
