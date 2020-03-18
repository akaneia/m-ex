#To be inserted @ 80259fb4
.include "../../../../Globals.s"
.include "../../../Header.s"

lwz r12,OFST_Metadata_SSSIconCount(rtoc)
cmpw	r30, r12
