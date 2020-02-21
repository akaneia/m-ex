#To be inserted @ 80027140
.include "../../../../Globals.s"
.include "../../Header.s"

.set  REG_SSMTotal,12

lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
cmpw	r28, REG_SSMTotal
