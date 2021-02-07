#To be inserted @ 80264ed0
.include "../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_CSSIconCount(rtoc)
cmpw	r17, r12
