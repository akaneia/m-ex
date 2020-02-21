#To be inserted @ 80027278
.include "../../../../Globals.s"
.include "../../Header.s"

.set  REG_SSMTotal,3

lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
subfc	r0, r5, REG_SSMTotal
