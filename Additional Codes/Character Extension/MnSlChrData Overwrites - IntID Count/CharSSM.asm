#To be inserted @ 80026e8c
.include "../../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_ExternalIDCount(rtoc)
cmpw	r3, r12
