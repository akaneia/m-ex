#To be inserted @ 80023228
.include "../../../../Globals.s"
.include "../../Header.s"

.set  REG_SSMTotal,12

lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
cmpw	r3, REG_SSMTotal
