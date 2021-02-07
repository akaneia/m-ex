#To be inserted @ 800749e8
.include "../../Globals.s"
.include "../Header.s"

backup

.set REG_Index,20

# Get this costumes visibility index from MEX_GetData
  lwz	r0, 0x04 (r31)
  lwz  r3,OFST_MnSlChrCostumeFileSymbols(rtoc)
  mulli r0,r0,4
  lwzx r3,r3,r0
  lbz	r0, 0x0619 (r31)
  mulli r0,r0,CostumeFileSymbols_Stride
  add r3,r3,r0
  lwz REG_Index,CostumeFileSymbols_VisibilityIndex(r3)

# If 0, first check for custom before using the 0th Arch_FighterFunc_onTwoEntryTable
  cmpwi REG_Index,0
  bne UsePlXX

UseCustom:
# Get costume dat archive
  lwz r3,0x4(r31)
  lwz r4,OFST_Char_CostumeRuntimePointers(rtoc)
  mulli r3,r3,RuntimeCostumePointers_Stride
  lwzx r3,r3,r4
  lbz	r0, 0x0619 (r31)
  mulli r0,r0,RuntimeCostumePointersSub_Stride
  add r3,r3,r0
  lwz r3,0x14(r3)
# Get custom string name
  bl Table_Symbol
  mflr r4
  branchl r12,0x80380358
# Check if costume has an mexCostume symbol
  cmpwi r3,0
  beq UsePlXX
# Check if costume has a vis lookup
  lwz r3,mexCostume_vis(r3)
  cmpwi r3,0
  beq UsePlXX

# Init FtParts
  addi	r4, r31, 0x5AC
  li r5,0
  addi	r6, r31, 0x5EC
  addi	r7, r31, 0x203C
  branchl r12,0x8007487c
  restore
  branch r12,0x80074a04

# Use n'th table from PlXX
UsePlXX:
  lwz	r3, 0x010C (r31)
  addi	r4, r31, 1452
  mr r5, REG_Index            # use costume 0 index
  restore
  branch r12,0x800749f4


Table_Symbol:
blrl
.string "mexCostume"
.align 2

/*
#############################################
DoesNotExist:
#OSReport
  bl  ErrorString
  mflr  r3
  lwz  r4,OFST_MnSlChrCostumeFileSymbols(rtoc)
  lbz	r0, 0x04 (r31)
  mulli r4,r4,4
  lwzx r4,r4,0
  lbz	r0, 0x0619 (r31)
  mulli r0,r0,CostumeFileSymbols_Stride
  add r4,r4,r0
  lwz r4,CostumeFileSymbols_FileName(r4)
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
Assert_Name:
blrl
.string "m-ex"
.align 2
ErrorString:
blrl
.string "error: %s does not have XXX symbol\n"
.align 2
###############################################
*/

Exit: