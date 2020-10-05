#To be inserted @ 801a4568
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_MetaData_MajorNum(rtoc)
#subi    r12,12,1
cmplw	r0, r12
