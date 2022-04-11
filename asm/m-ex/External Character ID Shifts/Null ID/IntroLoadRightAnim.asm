#To be inserted @ 80185dec
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtExtNum(rtoc)
cmpw r3,r12