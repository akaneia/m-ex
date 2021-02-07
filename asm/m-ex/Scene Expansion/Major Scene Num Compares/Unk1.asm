#To be inserted @ 801a3f2c
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_MetaData_TermMajor(rtoc)
#subi    r12,12,1
cmplw	r0, r12
