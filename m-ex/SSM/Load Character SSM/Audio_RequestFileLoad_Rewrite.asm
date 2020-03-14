#To be inserted @ 801a56f4
.include "../../../Globals.s"
.include "../../Header.s"

.set  Addr_Exit,0x801a5730

.set  REG_MatchInfo,31
.set  REG_Count,28

Loop:
  lbz	r3, 0x0070 (REG_MatchInfo)
#Check if exits
  lwz r12,OFST_Metadata_ExternalIDCount(rtoc)
  cmpw	r3, r12
  bge LoopInc
  lwz  r4,OFST_MnSlChrSSMFileIDs(rtoc)
  mulli r3,r3,0x10
  lbzx  r3,r3,r4
  branchl r12,Audio_RequestSSMLoad
LoopInc:
  addi  REG_Count,REG_Count,1
  addi  REG_MatchInfo,REG_MatchInfo,36
  cmpwi REG_Count,6
  blt Loop

#Reset cache?
  li  r3,20
  branchl r12,0x80026f2c

#Exit
  branch  r12,Addr_Exit
