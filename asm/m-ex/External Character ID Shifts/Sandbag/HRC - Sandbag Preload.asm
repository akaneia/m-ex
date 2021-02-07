#To be inserted @ 801b9958
.include "../../../Globals.s"
.include "../../Header.s"

lwz r3,OFST_Metadata_FtExtNum(rtoc)
subi  r0,r3,2
