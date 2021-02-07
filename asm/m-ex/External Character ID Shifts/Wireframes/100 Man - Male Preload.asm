#To be inserted @ 801b70a0
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtExtNum(rtoc)
subi  r0,r12,6
