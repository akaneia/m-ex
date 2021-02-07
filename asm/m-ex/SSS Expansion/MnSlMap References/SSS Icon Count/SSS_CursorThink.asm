#To be inserted @ 8025a53c
.include "../../../../Globals.s"
.include "../../../Header.s"

lwz r3,OFST_Metadata_SSSIconCount(rtoc)
cmpw  r30,r3
