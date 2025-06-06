#To be inserted @ 80169db8
.include "../../../Globals.s"
.include "../../Header.s"

lwz r24,OFST_Metadata_FtExtNum(rtoc)
cmpw r0,r24