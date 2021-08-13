#To be inserted @ 800f1b94
.include "../../Globals.s"
.include "../Header.s"

.set REG_FighterData,4
.set REG_Fighter,3
.set REG_CopyID,0

# get function table
  lwz r12,OFST_mexData(rtoc)
  lwz r12,Arch_KirbyFunction(r12)
  lwz r12,Arch_KirbyFunction_OnFrameRuntime(r12)

# get function for this copy ability
  mulli REG_CopyID,REG_CopyID,4
  lwzx  r12,r12,REG_CopyID
  cmpwi r12,0
  beq Exit
#Branch to function
  mtctr r12
  mr  r3,REG_Fighter
  bctrl

Exit:
  branch  r12,0x800f1b9c
