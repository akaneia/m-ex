#To be inserted @ 80168b34
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ExternalID,31
.set  REG_InternalID,30
.set  REG_CostumeID,29

# init
  backup
  mr  REG_ExternalID,r3
  mr  REG_InternalID,r4
  mr  REG_CostumeID,r5

# Get frame
  mr  r3,REG_InternalID
  mr  r4,REG_CostumeID
  branchl r12,GetStockFrame

Exit:
  restore
  blr

