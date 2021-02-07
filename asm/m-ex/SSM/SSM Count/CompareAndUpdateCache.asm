#To be inserted @ 80027288
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_SSMTotal,12

lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
cmpw	r5, REG_SSMTotal
