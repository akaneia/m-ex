#To be inserted @ 80186e4c
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtExtNum(rtoc)
subi  r12,r12,7
cmpw r0,r12
