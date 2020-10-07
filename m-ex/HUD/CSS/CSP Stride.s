#To be inserted @ 8025ee60
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_ExternalIDCount,3
.set  REG_ExternalID,20
.set  REG_CostumeID,5

StockIcon_GetFrame:
  lwz REG_ExternalIDCount,OFST_Metadata_FtExtNum(rtoc)
  subi  r4,REG_ExternalIDCount,HUD_Stride 
  mullw	r0, REG_CostumeID, r4
  add	REG_ExternalID, REG_ExternalID, r0
