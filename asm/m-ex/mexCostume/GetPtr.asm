#To be inserted at 80074ff4
.include "../../Globals.s"
.include "../Header.s"

.set REG_FighterData,30

# Get costume dat archive
.set REG_CostumeArchive,12
  lwz r3,0x4(REG_FighterData)
  lwz r4,OFST_Char_CostumeRuntimePointers(rtoc)
  mulli r3,r3,RuntimeCostumePointers_Stride
  lwzx r3,r3,r4
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,RuntimeCostumePointersSub_Stride
  add r3,r3,r0
  lwz r3,0x14(r3)
# Check for mexCostume
  bl mexCostume_Symbol
  mflr r4
  branchl r12,0x80380358
  stw r3, MEX_Costume_ptr(REG_FighterData)
  b Exit

mexCostume_Symbol:
blrl
.string "mexCostume"
.align 2

Exit:
  lwz	r0, 0x001C (sp)