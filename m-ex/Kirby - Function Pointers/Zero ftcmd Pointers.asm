#To be inserted @ 8016e148
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,31
.set  REG_FighterNum,30

backup

# Get fighter num
  lwz REG_FighterNum,OFST_Metadata_FtIntNum(rtoc)

# Init loop
  li  REG_Count,0
  lwz r3,OFST_KirbyFtCmdRuntime(rtoc)
  li  r0,0
Loop:
  mulli r4,REG_Count,4
  stwx  r0,r3,r4
LoopInc:
  addi  REG_Count,REG_Count,1
  cmpw  REG_Count,REG_FighterNum
  blt Loop

Exit:
  restore
  li  r0,-1
  stw	r0, 0x0010 (sp)

