#To be inserted @ 8025fc54
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_CSSIconCount(rtoc)
cmpw	r4, r12
