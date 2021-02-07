#To be inserted @ 8025f2ac
.include "../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_CSSIconCount(rtoc)
cmpw	r27, r12
