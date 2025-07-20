#To be inserted @ 801bb384
.include "../../../Globals.s"
.include "../../Header.s"

lwz r4,OFST_Metadata_FtExtNum(rtoc)
cmpw r3, r4