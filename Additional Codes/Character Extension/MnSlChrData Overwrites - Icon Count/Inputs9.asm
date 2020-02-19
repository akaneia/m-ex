#To be inserted @ 80261f8c
.include "../../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_CSSIconCount(rtoc)
cmpw	r0, r12
