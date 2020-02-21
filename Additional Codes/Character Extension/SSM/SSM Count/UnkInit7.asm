#To be inserted @ 803883f8
.include "../../../../Globals.s"
.include "../../Header.s"

.set  REG_SSMTotal,12

lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
add	r4, r4,REG_SSMTotal
