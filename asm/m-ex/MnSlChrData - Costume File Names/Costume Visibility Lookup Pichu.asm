#To be inserted @ 80149ed4
.include "../../Globals.s"
.include "../Header.s"


.set REG_FighterData,31
.set REG_Index,20

# Get this costumes visibility index from MEX_GetData
  lwz	r0, 0x04 (REG_FighterData)
  lwz  r3,OFST_MnSlChrCostumeFileSymbols(rtoc)
  mulli r0,r0,4
  lwzx r3,r3,r0
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,CostumeFileSymbols_Stride
  add r3,r3,r0
  lwz r0,CostumeFileSymbols_VisibilityIndex(r3)

Exit: