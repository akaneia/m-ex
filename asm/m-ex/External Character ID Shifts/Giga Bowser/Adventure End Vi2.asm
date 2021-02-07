#To be inserted @ 803206a8
.include "../../../Globals.s"
.include "../../Header.s"

lwz r4,OFST_Metadata_FtExtNum(rtoc)
subi  r4,r4,4