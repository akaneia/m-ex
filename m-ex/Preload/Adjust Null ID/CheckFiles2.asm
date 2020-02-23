#To be inserted @ 800179f0
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_ExternalIDCount(rtoc)
cmpw	r29, r12
