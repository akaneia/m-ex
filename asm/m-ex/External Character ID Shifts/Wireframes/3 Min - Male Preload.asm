#To be inserted @ 801b764c
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtExtNum(rtoc)
subi  r0,r12,6
