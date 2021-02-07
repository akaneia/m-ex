#To be inserted @ 8006d48c
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtIntNum(rtoc)
subi  r12,r12,6
cmpw r0,r12