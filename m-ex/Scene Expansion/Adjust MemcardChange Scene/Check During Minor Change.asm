#To be inserted @ 801a4444
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_MetaData_MajorNum(rtoc)
#subi    r12,r12,1
cmplw	r27, r12
