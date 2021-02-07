#To be inserted @ 800c8e98
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtIntNum(rtoc)
subi  r12,r12,5
cmpw r0,r12