#To be inserted @ 80160450
.include "../../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_ExternalIDCount(rtoc)
cmpw	r0, r12
