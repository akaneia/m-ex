#To be inserted @ 80259c90
.include "../../../../Globals.s"
.include "../../../Header.s"

#Check for null
  lwz r12,OFST_Metadata_SSSIconCount(rtoc)
  cmpw r3,r12
