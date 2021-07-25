#To be inserted @ 80005694
.include "../../Globals.s"
.include "../Header.s"

################################################################################
# Inputs:
# r3 = match init ptr
################################################################################
# Description:
# Updates the null character ID (non-applicable to vanilla melee)
################################################################################

.set REG_Count,31
.set REG_ThisPlayer,30
.set REG_NullID,29

backup

# init
  li REG_Count,0
  addi REG_ThisPlayer,r3,0x60
  lwz REG_NullID,OFST_Metadata_FtExtNum(rtoc)
  b LoopCheck
Loop:
  lbz r3,0x0(REG_ThisPlayer)
  cmpwi r3,0x21
  bne LoopInc
# adjust
  stb REG_NullID,0x0(REG_ThisPlayer)
LoopInc:
  addi REG_Count,REG_Count,1
  addi REG_ThisPlayer,REG_ThisPlayer,0x24
LoopCheck:
  cmpwi REG_Count,6
  blt Loop

Injection_Exit:
restore
blr
