#To be inserted @ 802600d0
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_CSSIconCount(rtoc)
cmpw	r0, r12
