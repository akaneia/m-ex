#To be inserted at 801647fc
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ExtID,3
.set  REG_Table,4

#Get target lookup
  lwz REG_Table,OFST_mexData(rtoc)
  lwz REG_Table,Arch_Fighter(REG_Table)
  lwz REG_Table,Arch_Fighter_TargetStage(REG_Table)

#Get stage ID
  mulli r3,r3,2
  lhzx  r3,r3,r4
  blr
