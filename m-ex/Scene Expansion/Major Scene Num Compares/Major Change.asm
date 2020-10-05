#To be inserted @ 801a43e0
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_MetaData_MajorNum(rtoc)
#subi    r12,12,1
cmplw	r4, r12
