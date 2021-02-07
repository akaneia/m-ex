#To be inserted @ 8007cdbc
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtIntNum(rtoc)
subi  r12,r12,1
cmpw	r0, r12