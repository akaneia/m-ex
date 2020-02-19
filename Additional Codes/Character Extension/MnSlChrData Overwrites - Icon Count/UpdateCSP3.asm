#To be inserted @ 8025df4c
.include "../../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_CSSIconCount(rtoc)
cmpw	r0, r12
