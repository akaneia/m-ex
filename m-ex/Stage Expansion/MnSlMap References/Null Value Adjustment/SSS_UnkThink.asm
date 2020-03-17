#To be inserted @ 80259e44
.include "../../../../Globals.s"
.include "../../../Header.s"

lwz r12,OFST_Metadata_SSSIconCount(rtoc)
cmplw	r3, r12
