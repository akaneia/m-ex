#To be inserted @ 8015c4e8
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtIntNum(rtoc)
subi  r12,r12,5
cmpw r3,r12