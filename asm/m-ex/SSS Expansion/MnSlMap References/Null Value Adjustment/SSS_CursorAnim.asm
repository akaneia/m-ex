#To be inserted @ 8025a62c
.include "../../../../Globals.s"
.include "../../../Header.s"

lwz r12,OFST_Metadata_SSSIconCount(rtoc)
cmplw	r5, r12
