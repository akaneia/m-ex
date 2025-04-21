#To be inserted @ 80177398
.include "../../../Globals.s"
.include "../../Header.s"

# get table
.set  REG_Count,12
.set  REG_Lookup, 11

# Clear pointers
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz r3,Arch_Fighter_RuntimeIntroParam(r3)
  lwz r4,OFST_Metadata_FtIntNum(rtoc)
  mulli r4,r4,4
  branchl r12,0x8000c160 # memory clear

Exit:
  lis	r4,0
