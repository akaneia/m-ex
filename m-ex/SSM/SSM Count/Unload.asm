#To be inserted @ 80026880
.include "../../../Globals.s"
.include "../../Header.s"

lwz r3,OFST_Metadata_SSMCount(rtoc)
cmpw	r23, r3
