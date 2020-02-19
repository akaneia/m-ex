#To be inserted @ 8026183c
.include "../../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_CSSIconCount(rtoc)
cmpw	r5, r12
