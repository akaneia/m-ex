#To be inserted @ 80017a08
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtExtNum(rtoc)
cmpw	r0, r12
