#To be inserted @ 8017d578
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtExtNum(rtoc)
subi  r12,r12,4
cmpw r0,r12
