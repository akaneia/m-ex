#To be inserted @ 800230d8
.include "../../../Globals.s"
.include "../../Header.s"

.set  REG_SSMTotal,0

lwz REG_SSMTotal,OFST_Metadata_SSMCount(rtoc)
cmpwi	r3, REG_SSMTotal
