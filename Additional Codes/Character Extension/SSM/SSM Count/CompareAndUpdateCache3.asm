#To be inserted @ 800273b4
.include "../../../../Globals.s"
.include "../../Header.s"

.set  REG_SSMTotal,12

lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
subfc	r0, r5, REG_SSMTotal
