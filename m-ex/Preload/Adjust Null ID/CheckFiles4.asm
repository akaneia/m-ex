#To be inserted @ 80017a38
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_ExternalIDCount(rtoc)
cmpw	r26, r12
