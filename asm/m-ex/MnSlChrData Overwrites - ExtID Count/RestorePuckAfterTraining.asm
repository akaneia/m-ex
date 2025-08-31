#To be inserted @ 80264ac8
.include "../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_FtExtNum(rtoc)
subi r12,r12,8
cmpw r0,r12
