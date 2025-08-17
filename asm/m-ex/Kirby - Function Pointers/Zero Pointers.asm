#To be inserted @ 8016e5a4
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,31
.set  REG_FighterNum,30
.set  REG_FtCmdLookup,29
.set  REG_OnFrameLookup,28

backup

# Get fighter num
  lwz REG_FighterNum,OFST_Metadata_FtIntNum(rtoc)

# Init loop
  li  REG_Count,0
  lwz r3,OFST_mexData(rtoc)
  lwz REG_FtCmdLookup,Arch_Kirby(r3)
  lwz REG_FtCmdLookup,Arch_Kirby_FtCmdRuntime(REG_FtCmdLookup)
  lwz REG_OnFrameLookup,Arch_KirbyFunction(r3)
  lwz REG_OnFrameLookup,Arch_KirbyFunction_OnFrameRuntime(REG_OnFrameLookup)
  li  r0,0
Loop:
  mulli r4,REG_Count,4
  stwx  r0,REG_FtCmdLookup,r4  # ftcmd lookup
  stwx  r0,REG_OnFrameLookup,r4  # onframe lookup
LoopInc:
  addi  REG_Count,REG_Count,1
  cmpw  REG_Count,REG_FighterNum
  blt Loop

Exit:
  restore

  branchl r12,0x8016e124

