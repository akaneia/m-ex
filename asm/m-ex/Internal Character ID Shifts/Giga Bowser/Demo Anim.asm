#To be inserted @ 800c744c
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtIntNum(rtoc)
subi  r12,r12,2
cmpw r0,r12