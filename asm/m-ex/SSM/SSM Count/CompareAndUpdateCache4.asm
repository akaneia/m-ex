#To be inserted @ 800273b8
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_SSMTotal,12

lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
cmpw	r5, REG_SSMTotal
