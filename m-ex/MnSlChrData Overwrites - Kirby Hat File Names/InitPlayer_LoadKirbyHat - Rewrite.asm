#To be inserted @ 800ee528
.include "../../Globals.s"
.include "../Header.s"

backup

.set REG_FtExtNum, 31
.set REG_KbCostumeNum, 30
.set REG_KbCpAbilityIndex, 29
.set REG_KbCpCostumeIndex, 28
.set REG_LoopCount, 27
 
# Get number of fighters
  lwz REG_FtExtNum,OFST_Metadata_FtExtNum(rtoc)
# Get number of kirby costumes
  li r3,4
  branchl r12,0x80169238
  mr REG_KbCostumeNum,r3
# Get ability index
  lwz REG_KbCpAbilityIndex,OFST_KirbyAbilityRuntimeStruct(rtoc)
# Get costume file index
  lwz REG_KbCpCostumeIndex,OFST_KirbyAbilityCostumeRuntimeStruct(rtoc)
  li REG_LoopCount,0

Loop:
  li r0,0
# Zero ability pointer
  stw r0,0x0(REG_KbCpAbilityIndex)

# Zero all costume pointers
.set REG_CostumeLoopCount,20
.set REG_ThisCostume,21
  li REG_CostumeLoopCount,0
  mulli r3,REG_LoopCount,4
  lwzx REG_ThisCostume,r3,REG_KbCpCostumeIndex
  cmpwi REG_ThisCostume,0
  beq Loop_Inc
  CostumeLoop:
  stw r0,0x0(REG_ThisCostume)
  stw r0,0x4(REG_ThisCostume)
  CostumeLoop_Inc:
  addi REG_CostumeLoopCount,REG_CostumeLoopCount,1
  addi REG_ThisCostume,REG_ThisCostume,0x8
  CostumeLoop_Check:
  cmpw REG_CostumeLoopCount,REG_KbCostumeNum
  blt CostumeLoop

Loop_Inc:
  addi REG_LoopCount,REG_LoopCount,1
  addi REG_KbCpAbilityIndex,REG_KbCpAbilityIndex,4
  addi REG_KbCpCostumeIndex,REG_KbCpCostumeIndex,8
Loop_Check:
  cmpw REG_LoopCount,REG_FtExtNum
  blt Loop


Exit:
  restore
  blr