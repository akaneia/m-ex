#To be inserted @ 80320698
.include "../../../Globals.s"
.include "../../Header.s"

lwz r3,OFST_Metadata_FtExtNum(rtoc)
subi  r3,r3,4