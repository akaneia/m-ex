#To be inserted @ 8017d2e4
.include "../../../Globals.s"
.include "../../Header.s"

lwz r3,OFST_Metadata_FtIntNum(rtoc)
subi r3,r3,5
sub r0,r3,r4
lbz r3,0x0(r27)
