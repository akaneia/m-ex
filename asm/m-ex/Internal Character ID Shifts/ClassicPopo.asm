#To be inserted @ 8017d130
.include "../../Globals.s"
.include "../Header.s"

lwz r4,OFST_Metadata_FtIntNum(rtoc)
subi  r4,r4,1
