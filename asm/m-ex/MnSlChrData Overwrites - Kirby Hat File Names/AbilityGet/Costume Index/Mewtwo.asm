#To be inserted @ 800f1280
.include "../../../../Globals.s"
.include "../../../Header.s"

.set REG_FighterData,30
.set REG_Dest,5
.set REG_Temp1,12
.set REG_Temp2,11

# get costume data
  lwz  REG_Temp2,OFST_KirbyHatCostumeFileNames(rtoc)
  lwz	REG_Temp1, 0x2238 (REG_FighterData)
  mulli REG_Temp1,REG_Temp1,4
  lwzx REG_Temp2,REG_Temp1,REG_Temp2

# get index
  lbz REG_Temp1, 0x619 (REG_FighterData)
  mulli REG_Temp1,REG_Temp1,Kirby_AbilityCostumeFileNames_Stride
  add REG_Temp2,REG_Temp2,REG_Temp1
  lwz REG_Dest,Kirby_AbilityCostumeFileNames_VisibilityIndex(REG_Temp2)
