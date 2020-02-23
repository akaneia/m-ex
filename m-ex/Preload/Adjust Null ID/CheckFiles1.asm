#To be inserted @ 800179b4
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_ExternalIDCount(rtoc)
cmpw	r3, r12
