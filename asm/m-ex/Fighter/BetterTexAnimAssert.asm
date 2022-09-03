#To be inserted @ 80070400
.include "../../Globals.s"
.include "../Header.s"

.set REG_FighterData,31
.set REG_ThisTexAnim,29

# get texanim lookup
  mr r3, REG_FighterData
  bl Fighter_GetTexAnimLookup
# get this joint index
  mulli r0,REG_ThisTexAnim,0x2
  lhzx r6,r3,r0
# get c_kind
  lbz r3, 0xC(REG_FighterData)
  branchl r0, 0x80032330
  mr r0,r3
# Output string
  bl ErrorString
  mflr r3
# get fighter name
  lwz r4, OFST_mexData(rtoc)
  lwz r4, Arch_Fighter(r4)
  lwz r4, Arch_Fighter_NameText(r4)
  mulli r0,r0,4
  lwzx r4,r4,r0
# get costume filename
  lwz r5, OFST_mexData(rtoc)
  lwz r5, Arch_Fighter(r5)
  lwz r5, Arch_Fighter_CostumeFileSymbols(r5)
  lwz r0, 0x4(REG_FighterData)
  mulli r0,r0,4
  lwzx r5,r5,r0
  lbz r0, 0x619 (REG_FighterData)
  mulli r0,r0,CostumeFileSymbols_Stride
  lwzx r5, r5, r0
  branchl r0,0x803456a8
  branch r0,0x8007040c

ErrorString:
blrl
.string "%s's costume \"%s\" is missing texanim\nfor object %d\n"
.align 2

##################################

Fighter_GetTexAnimLookup:
.set REG_FighterData, 12
.set REG_Index, 11

  mr REG_FighterData, r3

# Get this costumes visibility index from MEX_GetData
  lwz	r0, 0x04 (REG_FighterData)
  lwz  r3,OFST_MnSlChrCostumeFileSymbols(rtoc)
  mulli r0,r0,4
  lwzx r3,r3,r0
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,CostumeFileSymbols_Stride
  add r3,r3,r0
  lwz REG_Index,CostumeFileSymbols_VisibilityIndex(r3)

# If 0, first check for custom before using the 0th Arch_FighterFunc_onTwoEntryTable
  cmpwi REG_Index,0
  bne Fighter_GetTexAnimLookup_FromDAT
  lwz r3, MEX_Costume_ptr(REG_FighterData)
  cmpwi r3,0
  beq Fighter_GetTexAnimLookup_FromDAT

Fighter_GetTexAnimLookup_FromCostume:
  lwz r3,0x4(r3)
  lwz r3,0x0(r3)
  b Fighter_GetTexAnimLookup_Exit

Fighter_GetTexAnimLookup_FromDAT:
  lwz r3, 0x10C(REG_FighterData)
  lwz r3, 0x8(r3)
  lwz r3, 0xC(r3)
  mulli r0, REG_Index, 4
  lwzx r3,r3,r0
  b Fighter_GetTexAnimLookup_Exit

Fighter_GetTexAnimLookup_Exit:
  blr

##################################
