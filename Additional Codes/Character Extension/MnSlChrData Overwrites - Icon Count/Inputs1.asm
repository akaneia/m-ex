#To be inserted @ 802605b8
.include "../../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_CSSIconCount(rtoc)
cmpw	r0, r12
