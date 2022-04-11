#To be inserted @ 80185ddc
.include "../../../Globals.s"
.include "../../Header.s"

lwz r3,OFST_Metadata_FtExtNum(rtoc)
subi  r3,r3,4
cmplw	r0, r3